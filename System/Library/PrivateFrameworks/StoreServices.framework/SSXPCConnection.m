@implementation SSXPCConnection

void __38__SSXPCConnection__reloadEventHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      goto LABEL_9;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
LABEL_9:
      v7 = v4;
      (*(void (**)(void))(v6 + 16))();
      v4 = v7;
    }
  }

}

void *__35__SSXPCConnection_setMessageBlock___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 40) != result)
  {
    v4 = objc_msgSend(result, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    return (void *)objc_msgSend(*(id *)(a1 + 32), "_reloadEventHandler");
  }
  return result;
}

void *__38__SSXPCConnection_setDisconnectBlock___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != result)
  {
    v4 = objc_msgSend(result, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

    return (void *)objc_msgSend(*(id *)(a1 + 32), "_reloadEventHandler");
  }
  return result;
}

- (void)setDisconnectBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SSXPCConnection_setDisconnectBlock___block_invoke;
  block[3] = &unk_1E47B8AC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  xpc_connection_send_message_with_reply(self->_connection, a3, (dispatch_queue_t)self->_replyQueue, a4);
}

- (void)sendMessage:(id)a3
{
  xpc_connection_send_message(self->_connection, a3);
}

- (id)createXPCEndpoint
{
  return xpc_endpoint_create(self->_connection);
}

- (SSXPCConnection)initWithServiceName:(id)a3
{
  const char *v4;
  xpc_connection_t v5;
  SSXPCConnection *v6;

  if (a3)
    v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  else
    v4 = 0;
  v5 = xpc_connection_create(v4, 0);
  xpc_connection_set_legacy();
  v6 = -[SSXPCConnection initWithXPCConnection:](self, "initWithXPCConnection:", v5);

  return v6;
}

- (SSXPCConnection)initWithXPCConnection:(id)a3
{
  id v5;
  id *v6;
  SSXPCConnection *v7;

  v5 = a3;
  v6 = -[SSXPCConnection _initSSXPCConnection](self, "_initSSXPCConnection");
  v7 = (SSXPCConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    -[SSXPCConnection _reloadEventHandler](v7, "_reloadEventHandler");
    xpc_connection_resume(v7->_connection);
  }

  return v7;
}

- (void)_reloadEventHandler
{
  void *v3;
  void *v4;
  OS_xpc_object *connection;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = (void *)MEMORY[0x1A8585DF0](self->_disconnectBlock, a2);
  v4 = (void *)MEMORY[0x1A8585DF0](self->_messageBlock);
  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SSXPCConnection__reloadEventHandler__block_invoke;
  v8[3] = &unk_1E47BCF68;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  xpc_connection_set_event_handler(connection, v8);

}

- (id)_initSSXPCConnection
{
  SSXPCConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSXPCConnection;
  v2 = -[SSXPCConnection init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.storeservices.SSXPCConnection", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)setMessageBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSXPCConnection_setMessageBlock___block_invoke;
  block[3] = &unk_1E47B8AC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

- (SSXPCConnection)init
{
  return -[SSXPCConnection initWithServiceName:](self, "initWithServiceName:", 0);
}

void __38__SSXPCConnection__reloadEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v6;
  id v7;
  _QWORD handler[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }
  else if (MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812E0])
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __38__SSXPCConnection__reloadEventHandler__block_invoke_2;
    handler[3] = &unk_1E47BCF40;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v7 = v4;
    v9 = v7;
    xpc_connection_set_event_handler((xpc_connection_t)v7, handler);
    xpc_connection_resume((xpc_connection_t)v7);

  }
}

- (id)disconnectBlock
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSXPCConnection_disconnectBlock__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (void *)MEMORY[0x1A8585DF0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__SSXPCConnection_disconnectBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8585DF0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)messageBlock
{
  NSObject *dispatchQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SSXPCConnection_messageBlock__block_invoke;
  v6[3] = &unk_1E47B8680;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dispatchQueue, v6);
  v4 = (void *)MEMORY[0x1A8585DF0](v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__SSXPCConnection_messageBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8585DF0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)copyReplyQueue
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SSXPCConnection_copyReplyQueue__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__SSXPCConnection_copyReplyQueue__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v1)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v1);
}

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  xpc_object_t v6;
  void (**v7)(id, xpc_object_t);

  v7 = (void (**)(id, xpc_object_t))a4;
  v6 = xpc_connection_send_message_with_reply_sync(self->_connection, a3);
  if (v7)
    v7[2](v7, v6);

}

- (void)setReplyQueue:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SSXPCConnection_setReplyQueue___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __33__SSXPCConnection_setReplyQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 32);
  v4 = (id *)(v2 + 32);
  if (v5 != v3)
    objc_storeStrong(v4, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageBlock, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
