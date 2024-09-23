@implementation WBSCyclerServiceProxy

- (WBSCyclerServiceProxy)init
{
  WBSCyclerServiceProxy *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  WBSCyclerServiceProxy *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSCyclerServiceProxy;
  v2 = -[WBSCyclerServiceProxy init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.internal.safaricyclerd"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70CCD8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSCyclerServiceProxy;
  -[WBSCyclerServiceProxy dealloc](&v3, sel_dealloc);
}

- (id)connectionInvalidationHandler
{
  return -[NSXPCConnection invalidationHandler](self->_xpcConnection, "invalidationHandler");
}

- (void)setConnectionInvalidationHandler:(id)a3
{
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", a3);
}

- (void)setTestTargetEndpoint:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WBSCyclerServiceProxy _cyclerProxy](self, "_cyclerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTestTargetEndpoint:reply:", v7, v6);

}

- (void)setValue:(id)a3 forConfigurationKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WBSCyclerServiceProxy _cyclerProxy](self, "_cyclerProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forConfigurationKey:reply:", v10, v9, v8);

}

- (void)startCyclingFromBeginning:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[WBSCyclerServiceProxy _cyclerProxy](self, "_cyclerProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startCyclingFromBeginning:reply:", v4, v6);

}

- (void)stopCyclingWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBSCyclerServiceProxy _cyclerProxy](self, "_cyclerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopCyclingWithReply:", v4);

}

- (void)sendRequestToTestSuite:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WBSCyclerServiceProxy _cyclerProxy](self, "_cyclerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendRequestToTestSuite:reply:", v7, v6);

}

- (void)fetchStatusWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBSCyclerServiceProxy _cyclerProxy](self, "_cyclerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchStatusWithReply:", v4);

}

- (void)fetchLogsWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBSCyclerServiceProxy _cyclerProxy](self, "_cyclerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchLogsWithReply:", v4);

}

- (void)fetchLastErrorWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBSCyclerServiceProxy _cyclerProxy](self, "_cyclerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchLastErrorWithReply:", v4);

}

- (id)_cyclerProxy
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection **p_xpcConnection;

  p_xpcConnection = &self->_xpcConnection;
  xpcConnection = self->_xpcConnection;
  if (p_xpcConnection[1])
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:");
  else
    -[NSXPCConnection remoteObjectProxy](xpcConnection, "remoteObjectProxy");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
