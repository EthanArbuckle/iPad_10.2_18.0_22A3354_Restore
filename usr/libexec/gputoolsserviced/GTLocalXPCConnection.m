@implementation GTLocalXPCConnection

- (GTLocalXPCConnection)initWithXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7;
  id v8;
  GTLocalXPCConnection *v9;
  GTLocalXPCConnection *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *dispatchers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GTLocalXPCConnection;
  v9 = -[GTLocalXPCConnection init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
  }

  return v10;
}

- (GTLocalXPCConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7;
  id v8;
  GTLocalXPCConnection *v9;
  GTLocalXPCConnection *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *dispatchers;
  uint64_t v13;
  OS_os_transaction *transaction;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GTLocalXPCConnection;
  v9 = -[GTLocalXPCConnection init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
    v13 = os_transaction_create("com.apple.gputoolstransportd.local");
    transaction = v10->_transaction;
    v10->_transaction = (OS_os_transaction *)v13;

  }
  return v10;
}

- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4
{
  id v6;
  NSObject *messageQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015A80;
  block[3] = &unk_100030CE8;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(messageQueue, block);

}

- (unint64_t)registerDispatcher:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *messageQueue;
  id v7;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v4 = a3;
  do
    v5 = __ldaxr(&qword_10003DB58);
  while (__stlxr(v5 + 1, &qword_10003DB58));
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015B90;
  block[3] = &unk_100030CE8;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  dispatch_async(messageQueue, block);

  return v5;
}

- (void)deregisterDispatcher:(unint64_t)a3
{
  NSObject *messageQueue;
  _QWORD v4[6];

  messageQueue = self->_messageQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015C54;
  v4[3] = &unk_100030D10;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(messageQueue, v4);
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *messageQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  GTLocalXPCConnection *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015D64;
  block[3] = &unk_100030D38;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(messageQueue, block);

}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)sendMessage:(id)a3
{
  xpc_connection_send_message(self->_connection, a3);
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  OS_xpc_object *connection;
  id v10;
  _QWORD handler[4];
  id v12;

  v6 = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  connection = self->_connection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100015FF8;
  handler[3] = &unk_100030D60;
  v12 = v6;
  v10 = v6;
  xpc_connection_send_message_with_reply(connection, a3, v8, handler);

}

- (id)sendMessageWithReplySync:(id)a3
{
  return xpc_connection_send_message_with_reply_sync(self->_connection, a3);
}

- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTLocalXPCConnection sendMessageWithReplySync:](self, "sendMessageWithReplySync:", a3));
  if (MessageIsValid(v5, a4))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (void)sendMessageAndWaitForDelivery:(id)a3
{
  NSObject *v4;
  OS_xpc_object *connection;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD barrier[4];
  NSObject *v9;

  -[GTLocalXPCConnection sendMessage:](self, "sendMessage:", a3);
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  connection = self->_connection;
  barrier[0] = _NSConcreteStackBlock;
  barrier[1] = 3221225472;
  barrier[2] = sub_10001617C;
  barrier[3] = &unk_100030D88;
  v9 = v4;
  v6 = v4;
  xpc_connection_send_barrier(connection, barrier);
  v7 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v6, v7);

}

- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4
{
  id v6;
  id v7;
  OS_xpc_object *connection;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001626C;
  v11[3] = &unk_100030DD8;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  xpc_connection_set_event_handler(connection, v11);
  xpc_connection_activate(self->_connection);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)cancel
{
  NSObject *messageQueue;
  _QWORD block[5];

  xpc_connection_cancel(self->_connection);
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000163FC;
  block[3] = &unk_100030D88;
  block[4] = self;
  dispatch_async(messageQueue, block);
}

- (BOOL)isTrusted
{
  return 1;
}

- (OS_xpc_object)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dispatchers, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
