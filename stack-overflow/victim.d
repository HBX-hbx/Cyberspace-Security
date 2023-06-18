
victim:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 2f 00 00 	mov    0x2fe9(%rip),%rax        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	callq  *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	retq   

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	pushq  0x2fe2(%rip)        # 404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	f2 ff 25 e3 2f 00 00 	bnd jmpq *0x2fe3(%rip)        # 404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102d:	0f 1f 00             	nopl   (%rax)
  401030:	f3 0f 1e fa          	endbr64 
  401034:	68 00 00 00 00       	pushq  $0x0
  401039:	f2 e9 e1 ff ff ff    	bnd jmpq 401020 <.plt>
  40103f:	90                   	nop
  401040:	f3 0f 1e fa          	endbr64 
  401044:	68 01 00 00 00       	pushq  $0x1
  401049:	f2 e9 d1 ff ff ff    	bnd jmpq 401020 <.plt>
  40104f:	90                   	nop
  401050:	f3 0f 1e fa          	endbr64 
  401054:	68 02 00 00 00       	pushq  $0x2
  401059:	f2 e9 c1 ff ff ff    	bnd jmpq 401020 <.plt>
  40105f:	90                   	nop

Disassembly of section .plt.sec:

0000000000401060 <puts@plt>:
  401060:	f3 0f 1e fa          	endbr64 
  401064:	f2 ff 25 ad 2f 00 00 	bnd jmpq *0x2fad(%rip)        # 404018 <puts@GLIBC_2.2.5>
  40106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401070 <gets@plt>:
  401070:	f3 0f 1e fa          	endbr64 
  401074:	f2 ff 25 a5 2f 00 00 	bnd jmpq *0x2fa5(%rip)        # 404020 <gets@GLIBC_2.2.5>
  40107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401080 <exit@plt>:
  401080:	f3 0f 1e fa          	endbr64 
  401084:	f2 ff 25 9d 2f 00 00 	bnd jmpq *0x2f9d(%rip)        # 404028 <exit@GLIBC_2.2.5>
  40108b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000401090 <_start>:
  401090:	f3 0f 1e fa          	endbr64 
  401094:	31 ed                	xor    %ebp,%ebp
  401096:	49 89 d1             	mov    %rdx,%r9
  401099:	5e                   	pop    %rsi
  40109a:	48 89 e2             	mov    %rsp,%rdx
  40109d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4010a1:	50                   	push   %rax
  4010a2:	54                   	push   %rsp
  4010a3:	49 c7 c0 50 12 40 00 	mov    $0x401250,%r8
  4010aa:	48 c7 c1 e0 11 40 00 	mov    $0x4011e0,%rcx
  4010b1:	48 c7 c7 b2 11 40 00 	mov    $0x4011b2,%rdi
  4010b8:	ff 15 32 2f 00 00    	callq  *0x2f32(%rip)        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  4010be:	f4                   	hlt    
  4010bf:	90                   	nop

00000000004010c0 <_dl_relocate_static_pie>:
  4010c0:	f3 0f 1e fa          	endbr64 
  4010c4:	c3                   	retq   
  4010c5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4010cc:	00 00 00 
  4010cf:	90                   	nop

00000000004010d0 <deregister_tm_clones>:
  4010d0:	b8 40 40 40 00       	mov    $0x404040,%eax
  4010d5:	48 3d 40 40 40 00    	cmp    $0x404040,%rax
  4010db:	74 13                	je     4010f0 <deregister_tm_clones+0x20>
  4010dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4010e2:	48 85 c0             	test   %rax,%rax
  4010e5:	74 09                	je     4010f0 <deregister_tm_clones+0x20>
  4010e7:	bf 40 40 40 00       	mov    $0x404040,%edi
  4010ec:	ff e0                	jmpq   *%rax
  4010ee:	66 90                	xchg   %ax,%ax
  4010f0:	c3                   	retq   
  4010f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4010f8:	00 00 00 00 
  4010fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401100 <register_tm_clones>:
  401100:	be 40 40 40 00       	mov    $0x404040,%esi
  401105:	48 81 ee 40 40 40 00 	sub    $0x404040,%rsi
  40110c:	48 89 f0             	mov    %rsi,%rax
  40110f:	48 c1 ee 3f          	shr    $0x3f,%rsi
  401113:	48 c1 f8 03          	sar    $0x3,%rax
  401117:	48 01 c6             	add    %rax,%rsi
  40111a:	48 d1 fe             	sar    %rsi
  40111d:	74 11                	je     401130 <register_tm_clones+0x30>
  40111f:	b8 00 00 00 00       	mov    $0x0,%eax
  401124:	48 85 c0             	test   %rax,%rax
  401127:	74 07                	je     401130 <register_tm_clones+0x30>
  401129:	bf 40 40 40 00       	mov    $0x404040,%edi
  40112e:	ff e0                	jmpq   *%rax
  401130:	c3                   	retq   
  401131:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401138:	00 00 00 00 
  40113c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401140 <__do_global_dtors_aux>:
  401140:	f3 0f 1e fa          	endbr64 
  401144:	80 3d f5 2e 00 00 00 	cmpb   $0x0,0x2ef5(%rip)        # 404040 <__TMC_END__>
  40114b:	75 13                	jne    401160 <__do_global_dtors_aux+0x20>
  40114d:	55                   	push   %rbp
  40114e:	48 89 e5             	mov    %rsp,%rbp
  401151:	e8 7a ff ff ff       	callq  4010d0 <deregister_tm_clones>
  401156:	c6 05 e3 2e 00 00 01 	movb   $0x1,0x2ee3(%rip)        # 404040 <__TMC_END__>
  40115d:	5d                   	pop    %rbp
  40115e:	c3                   	retq   
  40115f:	90                   	nop
  401160:	c3                   	retq   
  401161:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401168:	00 00 00 00 
  40116c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401170 <frame_dummy>:
  401170:	f3 0f 1e fa          	endbr64 
  401174:	eb 8a                	jmp    401100 <register_tm_clones>

0000000000401176 <getbuf>:
  401176:	f3 0f 1e fa          	endbr64 
  40117a:	48 83 ec 18          	sub    $0x18,%rsp
  40117e:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  401183:	b8 00 00 00 00       	mov    $0x0,%eax
  401188:	e8 e3 fe ff ff       	callq  401070 <gets@plt>
  40118d:	48 83 c4 18          	add    $0x18,%rsp
  401191:	c3                   	retq   

0000000000401192 <target>:
  401192:	f3 0f 1e fa          	endbr64 
  401196:	50                   	push   %rax
  401197:	58                   	pop    %rax
  401198:	48 83 ec 08          	sub    $0x8,%rsp
  40119c:	48 8d 3d 61 0e 00 00 	lea    0xe61(%rip),%rdi        # 402004 <_IO_stdin_used+0x4>
  4011a3:	e8 b8 fe ff ff       	callq  401060 <puts@plt>
  4011a8:	bf 00 00 00 00       	mov    $0x0,%edi
  4011ad:	e8 ce fe ff ff       	callq  401080 <exit@plt>

00000000004011b2 <main>:
  4011b2:	f3 0f 1e fa          	endbr64 
  4011b6:	48 83 ec 08          	sub    $0x8,%rsp
  4011ba:	b8 00 00 00 00       	mov    $0x0,%eax
  4011bf:	e8 b2 ff ff ff       	callq  401176 <getbuf>
  4011c4:	48 8d 3d 4c 0e 00 00 	lea    0xe4c(%rip),%rdi        # 402017 <_IO_stdin_used+0x17>
  4011cb:	e8 90 fe ff ff       	callq  401060 <puts@plt>
  4011d0:	b8 00 00 00 00       	mov    $0x0,%eax
  4011d5:	48 83 c4 08          	add    $0x8,%rsp
  4011d9:	c3                   	retq   
  4011da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004011e0 <__libc_csu_init>:
  4011e0:	f3 0f 1e fa          	endbr64 
  4011e4:	41 57                	push   %r15
  4011e6:	4c 8d 3d 23 2c 00 00 	lea    0x2c23(%rip),%r15        # 403e10 <__frame_dummy_init_array_entry>
  4011ed:	41 56                	push   %r14
  4011ef:	49 89 d6             	mov    %rdx,%r14
  4011f2:	41 55                	push   %r13
  4011f4:	49 89 f5             	mov    %rsi,%r13
  4011f7:	41 54                	push   %r12
  4011f9:	41 89 fc             	mov    %edi,%r12d
  4011fc:	55                   	push   %rbp
  4011fd:	48 8d 2d 14 2c 00 00 	lea    0x2c14(%rip),%rbp        # 403e18 <__do_global_dtors_aux_fini_array_entry>
  401204:	53                   	push   %rbx
  401205:	4c 29 fd             	sub    %r15,%rbp
  401208:	48 83 ec 08          	sub    $0x8,%rsp
  40120c:	e8 ef fd ff ff       	callq  401000 <_init>
  401211:	48 c1 fd 03          	sar    $0x3,%rbp
  401215:	74 1f                	je     401236 <__libc_csu_init+0x56>
  401217:	31 db                	xor    %ebx,%ebx
  401219:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401220:	4c 89 f2             	mov    %r14,%rdx
  401223:	4c 89 ee             	mov    %r13,%rsi
  401226:	44 89 e7             	mov    %r12d,%edi
  401229:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  40122d:	48 83 c3 01          	add    $0x1,%rbx
  401231:	48 39 dd             	cmp    %rbx,%rbp
  401234:	75 ea                	jne    401220 <__libc_csu_init+0x40>
  401236:	48 83 c4 08          	add    $0x8,%rsp
  40123a:	5b                   	pop    %rbx
  40123b:	5d                   	pop    %rbp
  40123c:	41 5c                	pop    %r12
  40123e:	41 5d                	pop    %r13
  401240:	41 5e                	pop    %r14
  401242:	41 5f                	pop    %r15
  401244:	c3                   	retq   
  401245:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40124c:	00 00 00 00 

0000000000401250 <__libc_csu_fini>:
  401250:	f3 0f 1e fa          	endbr64 
  401254:	c3                   	retq   

Disassembly of section .fini:

0000000000401258 <_fini>:
  401258:	f3 0f 1e fa          	endbr64 
  40125c:	48 83 ec 08          	sub    $0x8,%rsp
  401260:	48 83 c4 08          	add    $0x8,%rsp
  401264:	c3                   	retq   
