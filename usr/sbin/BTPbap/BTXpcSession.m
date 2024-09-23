@implementation BTXpcSession

- (BTXpcSession)init
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[BTXpcSession init]"));
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Calling %@ is not allowed"), v3);

  return 0;
}

- (BTXpcSession)initWithConnection:(id)a3
{
  id v5;
  BTXpcSession *v6;
  BTXpcSession *v7;
  NSString *v8;
  id v9;
  uint64_t v10;
  OS_os_transaction *transaction;
  BTWatchdog *v12;
  BTWatchdog *watchdog;
  void *v14;
  NSObject *v15;
  void *v16;
  _xpc_connection_s *connection;
  _QWORD handler[4];
  BTXpcSession *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BTXpcSession;
  v6 = -[BTXpcSession init](&v21, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.%@"), objc_opt_class(v7));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v8));
    v10 = os_transaction_create(objc_msgSend(v9, "UTF8String"));
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v10;

    v12 = objc_alloc_init(BTWatchdog);
    watchdog = v7->_watchdog;
    v7->_watchdog = v12;

    v14 = (void *)qword_10000C908;
    if (os_log_type_enabled((os_log_t)qword_10000C908, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession connection](v7, "connection"));
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Started XPC session: %@", buf, 0xCu);

    }
    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)&_dispatch_main_q);
    connection = v7->_connection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000466C;
    handler[3] = &unk_100008390;
    v20 = v7;
    xpc_connection_set_event_handler(connection, handler);
    xpc_connection_resume(v7->_connection);

  }
  return v7;
}

- (void)sendMsg:(id)a3
{
  -[BTXpcSession _sendMsg:isReply:](self, "_sendMsg:isReply:", a3, 0);
}

- (void)sendReply:(id)a3
{
  -[BTXpcSession _sendMsg:isReply:](self, "_sendMsg:isReply:", a3, 1);
}

- (void)handleMsg:(id)a3
{
  -[BTXpcSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)numberForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5
{
  _BOOL8 v5;
  uint64_t v8;
  id v9;
  void *v10;

  v5 = a4;
  v8 = qword_10000C918;
  v9 = a5;
  if (v8 != -1)
    dispatch_once(&qword_10000C918, &stru_1000083D0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession _objectForKey:dict:optional:converters:](self, "_objectForKey:dict:optional:converters:", a3, v9, v5, qword_10000C910));

  return v10;
}

- (id)stringForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5
{
  _BOOL8 v5;
  uint64_t v8;
  id v9;
  void *v10;

  v5 = a4;
  v8 = qword_10000C928;
  v9 = a5;
  if (v8 != -1)
    dispatch_once(&qword_10000C928, &stru_100008490);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession _objectForKey:dict:optional:converters:](self, "_objectForKey:dict:optional:converters:", a3, v9, v5, qword_10000C920));

  return v10;
}

- (id)xpcDictForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5
{
  _BOOL8 v5;
  uint64_t v8;
  id v9;
  void *v10;

  v5 = a4;
  v8 = qword_10000C938;
  v9 = a5;
  if (v8 != -1)
    dispatch_once(&qword_10000C938, &stru_1000084F0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession _objectForKey:dict:optional:converters:](self, "_objectForKey:dict:optional:converters:", a3, v9, v5, qword_10000C930));

  return v10;
}

- (void)_sendMsg:(id)a3 isReply:(BOOL)a4
{
  id v6;
  void *v7;
  _xpc_connection_s *v8;

  v6 = a3;
  v7 = (void *)qword_10000C908;
  if (os_log_type_enabled((os_log_t)qword_10000C908, OS_LOG_TYPE_DEBUG))
    sub_100005E88(a4, v7);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BTXpcSession connection](self, "connection"));
  xpc_connection_send_message(v8, v6);

}

- (void)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v6 = (void *)qword_10000C908;
    if (os_log_type_enabled((os_log_t)qword_10000C908, OS_LOG_TYPE_DEBUG))
      sub_100005F54(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession watchdog](self, "watchdog"));
    objc_msgSend(v7, "beginTransaction");

    -[BTXpcSession handleMsg:](self, "handleMsg:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession watchdog](self, "watchdog"));
    objc_msgSend(v8, "endTransaction");

  }
  else if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error)
  {
    v9 = (void *)qword_10000C908;
    if (v4 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)qword_10000C908, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession connection](self, "connection"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ended XPC session: %@", (uint8_t *)&v12, 0xCu);

      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10000C908, OS_LOG_TYPE_ERROR))
    {
      sub_100005FE8(v9);
    }
  }
  else
  {
    v5 = (void *)qword_10000C908;
    if (os_log_type_enabled((os_log_t)qword_10000C908, OS_LOG_TYPE_ERROR))
      sub_10000606C(v5);
  }

}

- (id)_objectForKey:(const char *)a3 dict:(id)a4 optional:(BOOL)a5 converters:(id)a6
{
  id v8;
  xpc_object_t value;
  void *v10;
  void *v11;
  NSValue *v12;
  void *v13;
  uint64_t (**v14)(_QWORD, _QWORD);
  uint64_t v15;
  void *v16;

  v8 = a6;
  value = xpc_dictionary_get_value(a4, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(value);
  v11 = v10;
  if (v10)
  {
    v12 = +[NSValue valueWithPointer:](NSValue, "valueWithPointer:", xpc_get_type(v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));
    v15 = ((uint64_t (**)(_QWORD, void *))v14)[2](v14, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (BTWatchdog)watchdog
{
  return self->_watchdog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
