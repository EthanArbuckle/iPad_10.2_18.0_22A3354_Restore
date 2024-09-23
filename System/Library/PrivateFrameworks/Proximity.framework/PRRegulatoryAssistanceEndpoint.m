@implementation PRRegulatoryAssistanceEndpoint

- (id)initInternalWithQueue:(id)a3
{
  id v5;
  NSObject *logger;
  PRRegulatoryAssistanceEndpoint *v7;
  os_log_t v8;
  OS_os_log *v9;
  uint64_t v10;
  NSXPCConnection *conn;
  NSXPCConnection *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[16];

  v5 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "#reg-assist, initInternalWithQueue called.", buf, 2u);
  }
  v15.receiver = self;
  v15.super_class = (Class)PRRegulatoryAssistanceEndpoint;
  v7 = -[PRRegulatoryAssistanceEndpoint init](&v15, sel_init);
  if (v7)
  {
    v8 = os_log_create("com.apple.nearbyd", "RegulatoryAssistanceEndpoint");
    v9 = v7->_logger;
    v7->_logger = (OS_os_log *)v8;

    objc_storeStrong((id *)&v7->_queue, a3);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nearbyd.xpc.diagnostics"), 4096);
    conn = v7->_conn;
    v7->_conn = (NSXPCConnection *)v10;

    v12 = v7->_conn;
    PRMakeRegulatoryAssistanceEndpointXPCInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v12, "setRemoteObjectInterface:", v13);

    -[NSXPCConnection _setQueue:](v7->_conn, "_setQueue:", v7->_queue);
    -[NSXPCConnection resume](v7->_conn, "resume");
  }

  return v7;
}

+ (id)endpointWithQueue:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PRRegulatoryAssistanceEndpoint initInternalWithQueue:]([PRRegulatoryAssistanceEndpoint alloc], "initInternalWithQueue:", v3);

  return v4;
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  _QWORD v7[6];
  uint8_t buf[16];
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  v10 = (id)MEMORY[0x1A1AD03B0]();
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "#reg-assist, connectWithCompletionHandler called.", buf, 2u);
  }
  -[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PRRegulatoryAssistanceEndpoint_connectWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3D04668;
  v7[4] = self;
  v7[5] = v9;
  objc_msgSend(v6, "prepareForRegulatoryAssistance:", v7);

  _Block_object_dispose(v9, 8);
}

void __63__PRRegulatoryAssistanceEndpoint_connectWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();

}

- (void)provideIsoCode:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "#reg-assist, provideIsoCode called.", v7, 2u);
  }
  -[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "injectIsoCode:", v4);

}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_conn, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
