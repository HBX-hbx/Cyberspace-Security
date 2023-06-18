from flask import Flask, render_template, request, redirect, url_for, make_response
import requests
from IPython import embed
import sqlite3
import html

defend = True

# 连接数据库
def connect_db():
    db = sqlite3.connect('test.db')
    db.cursor().execute('CREATE TABLE IF NOT EXISTS comments '
                        '(id INTEGER PRIMARY KEY, '
                        'comment TEXT)')
    db.cursor().execute('CREATE TABLE IF NOT EXISTS users '
                        '(id INTEGER PRIMARY KEY, '
                        'username TEXT, '
                        'password TEXT)')
    db.commit()
    return db

# 添加评论
def add_comment(comment):
    db = connect_db()
    db.cursor().execute('INSERT INTO comments (comment) '
                        'VALUES (?)', (comment,))
    db.commit()

# 得到评论
def get_comments(search_query=None):
    db = connect_db()
    results = []
    get_all_query = 'SELECT comment FROM comments'
    for (comment,) in db.cursor().execute(get_all_query).fetchall():
        if search_query is None or search_query in comment:
            results.append(comment)
    return results

# 启动flask
app = Flask(__name__)
@app.route('/', methods=['GET', 'POST'])
def index():
    global defend
    
    if request.method == 'POST':
        comment = html.escape(request.form['comment']) if defend else request.form['comment']
        add_comment(comment)

    search_query = request.args.get('q')
    search_query = html.escape(search_query) if search_query != None and defend else search_query
    comments = get_comments(search_query)
    
    username = request.cookies.get('username')
    login = not (username is None or username == "")
    username = username if login else ""

    return render_template('index.html',
                           username=username,
                           login=login,
                           defend=defend,
                           comments=comments,
                           result="",
                           search_query=search_query)

# 登录
@app.route('/login', methods=['POST'])
def login():
    global defend
    
    username = request.form['username']
    password = request.form['password']
    
    db = connect_db()
    cursor = db.cursor()
    if defend:
        query = 'SELECT * FROM users WHERE username = ? AND password = ?'
        params = (username, password)
        cursor.execute(query, params)
    else:
        query = 'SELECT * FROM users WHERE username = \'' + str(username) + '\' AND password = \'' + str(password) + '\''
        cursor.execute(query)

    user_info = cursor.fetchall()
    login_status = True if len(user_info) > 0 else False
    
    search_query = request.args.get('q')
    search_query = html.escape(search_query) if search_query != None and defend else search_query
    comments = get_comments(search_query)
    
    response = make_response(render_template('index.html',
                           username=username,
                           login=login_status,
                           comments=comments,
                           defend=defend,
                           result="",
                           search_query=search_query))
    if login_status:
        if defend:
            response.set_cookie('username', username, samesite='Strict', secure=True)
        else:
            response.set_cookie('username', username)
    else:
        if defend:
            response.set_cookie('username', '', expires=0, samesite='Strict', secure=True)
        else:
            response.set_cookie('username', '', expires=0)

    return response

# 退出登录
@app.route('/out', methods=['POST'])
def out():
    global defend
    
    search_query = request.args.get('q')
    search_query = html.escape(search_query) if search_query != None and defend else search_query
    comments = get_comments(search_query)
    
    response = make_response(render_template('index.html',
                           username="",
                           login=False,
                           comments=comments,
                           defend=defend,
                           result="",
                           search_query=search_query))
    if defend:
        response.set_cookie('username', '', expires=0, samesite='Strict')
    else:
        response.set_cookie('username', '', expires=0)
    return response

# csrf attack: 转账
@app.route('/csrf', methods=['POST'])
def csrf():
    global defend
    account = request.form['account']
    amount = request.form['amount']
    username = request.cookies.get('username')
    
    result_str = ''
    if username is None or username == '':
        result_str = '未登录，转账失败! '
    else:
        result_str = '已登录，成功向 %s 转账 %s 元!' % (account, amount)
    
    search_query = request.args.get('q')
    search_query = html.escape(search_query) if search_query != None and defend else search_query
    comments = get_comments(search_query)
    
    login = not (username is None or username == "")
    username = username if login else ""
    
    response = make_response(render_template('index.html',
                           username=username,
                           login=login,
                           defend=defend,
                           comments=comments,
                           result=result_str,
                           search_query=search_query))
    
    return response

# 注册
@app.route('/register', methods=['POST'])
def register():
    username = request.form['username']
    password = request.form['password']
    
    db = connect_db()
    db.cursor().execute('INSERT INTO users (username, password) '
                        'VALUES (?, ?)', (username, password))
    db.commit()
    return redirect('/')
