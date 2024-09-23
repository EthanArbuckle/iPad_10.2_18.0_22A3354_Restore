@implementation _UIDruidSourceWarmUpConnection

- (void)warmUp
{
  NSXPCConnection **p_connection;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  p_connection = &self->_connection;
  if (!self->_connection)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.DragUI.druid.source"), 0);
    _UIDraggingConnectionXPCQueue();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setQueue:", v5);

    objc_storeStrong((id *)p_connection, v4);
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40___UIDruidSourceWarmUpConnection_warmUp__block_invoke;
    v12[3] = &unk_1E16B1B28;
    v7 = v4;
    v13 = v7;
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v12);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __40___UIDruidSourceWarmUpConnection_warmUp__block_invoke_2;
    v10[3] = &unk_1E16B3F40;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](*p_connection, "setInvalidationHandler:", v10);
    _DUINewServerSourceInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](*p_connection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](*p_connection, "resume");
    -[NSXPCConnection remoteObjectProxy](*p_connection, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "warmUp");

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
