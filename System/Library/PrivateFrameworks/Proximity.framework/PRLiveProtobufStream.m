@implementation PRLiveProtobufStream

- (PRLiveProtobufStream)init
{
  PRLiveProtobufStream *v2;
  uint64_t v3;
  NSUUID *uniqueId;
  uint64_t v5;
  NSXPCConnection *conn;
  id inited;
  NSXPCConnection *v8;
  id v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  void *v13;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PRLiveProtobufStream;
  v2 = -[PRLiveProtobufStream init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    uniqueId = v2->_uniqueId;
    v2->_uniqueId = (NSUUID *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nearbyd.xpc.diagnostics"), 4096);
    conn = v2->_conn;
    v2->_conn = (NSXPCConnection *)v5;

    inited = objc_initWeak(&location, v2);
    v8 = v2->_conn;
    v9 = inited;
    -[NSXPCConnection setExportedObject:](v8, "setExportedObject:", v2);

    v10 = v2->_conn;
    PRMakeProtobufClientXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v10, "setExportedInterface:", v11);

    v12 = v2->_conn;
    PRMakeProtobufServerXPCInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v12, "setRemoteObjectInterface:", v13);

    -[NSXPCConnection resume](v2->_conn, "resume");
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_conn, "invalidate");
}

- (id)server
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_conn, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_41);
}

void __30__PRLiveProtobufStream_server__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Failed to get synchronousRemoteObjectProxyWithErrorHandler %@"), a2);
}

- (void)start
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PRLiveProtobufStream delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRDiagnostics.m"), 399, CFSTR("Must set the delegate property before calling start."));

  }
  -[PRLiveProtobufStream delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRDiagnostics.m"), 400, CFSTR("Must set the delegateQueue property before calling start."));

  }
  -[PRLiveProtobufStream server](self, "server");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startStreamingProtobufDataForClientId:reply:", self->_uniqueId, &__block_literal_global_51);

}

void __29__PRLiveProtobufStream_start__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    NSLog(CFSTR("Failed to start stream protobuf data"));
}

- (void)stop
{
  id v3;

  -[PRLiveProtobufStream server](self, "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopStreamingProtobufDataForClientId:reply:", self->_uniqueId, &__block_literal_global_54);

}

void __28__PRLiveProtobufStream_stop__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    NSLog(CFSTR("Failed to stop stream protobuf data"));
}

- (void)consumeProtobufBytes:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PRLiveProtobufStream delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PRLiveProtobufStream_consumeProtobufBytes___block_invoke;
  v7[3] = &unk_1E3D045D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__PRLiveProtobufStream_consumeProtobufBytes___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stream:handleData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)getUniqueClientIdentifier:(id)a3
{
  (*((void (**)(id, NSUUID *))a3 + 2))(a3, self->_uniqueId);
}

- (PRLiveProtobufStreamDelegate)delegate
{
  return (PRLiveProtobufStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end
