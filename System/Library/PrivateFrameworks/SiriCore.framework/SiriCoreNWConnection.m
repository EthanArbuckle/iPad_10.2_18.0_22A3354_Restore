@implementation SiriCoreNWConnection

- (SiriCoreNWConnection)initWithQueue:(id)a3
{
  id v5;
  SiriCoreNWConnection *v6;
  SiriCoreNWConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriCoreNWConnection;
  v6 = -[SiriCoreNWConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_isViable = 1;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SiriCoreNWConnection _cancelOpenTimer](self, "_cancelOpenTimer");
  -[SiriCoreNWConnection _cancelSlowOpenTimer](self, "_cancelSlowOpenTimer");
  -[SiriCoreNWConnection _cancelStaleConnectionTimer](self, "_cancelStaleConnectionTimer");
  -[SiriCoreNWConnection _cancelConnectionUnviableTimer](self, "_cancelConnectionUnviableTimer");
  -[SiriCoreNWConnection _closeWithError:](self, "_closeWithError:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SiriCoreNWConnection;
  -[SiriCoreNWConnection dealloc](&v3, sel_dealloc);
}

- (id)_queue
{
  return self->_queue;
}

- (void)_invokeOpenCompletionWithError:(id)a3
{
  id openCompletion;
  id v5;
  id v6;
  void (**v7)(id, id);

  openCompletion = self->_openCompletion;
  if (openCompletion)
  {
    v5 = a3;
    v7 = (void (**)(id, id))MEMORY[0x212BE6580](openCompletion);
    v6 = self->_openCompletion;
    self->_openCompletion = 0;

    v7[2](v7, v5);
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setPolicyRoute:(id)a3
{
  SAConnectionPolicyRoute *v4;
  SAConnectionPolicyRoute *route;

  v4 = (SAConnectionPolicyRoute *)objc_msgSend(a3, "copy");
  route = self->_route;
  self->_route = v4;

}

- (void)setProviderConnectionPolicy:(id)a3
{
  SAConnectionPolicy *v4;
  SAConnectionPolicy *policy;

  v4 = (SAConnectionPolicy *)objc_msgSend(a3, "copy");
  policy = self->_policy;
  self->_policy = v4;

}

- (void)setPrefersWWAN:(BOOL)a3
{
  self->_prefersWWAN = a3;
}

- (void)setConnectByPOPMethod:(BOOL)a3
{
  self->_connectByPOPEnabled = a3;
}

- (void)setStaleInterval:(double)a3
{
  self->_staleConnectionInterval = a3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)_url
{
  return self->_url;
}

- (id)_connectionId
{
  return self->_connectionId;
}

- (BOOL)_connectByPOPMethod
{
  return self->_connectByPOPEnabled;
}

- (void)_startConnectionUnviableTimer
{
  NSObject *v3;
  dispatch_time_t v4;
  void *id;
  OS_dispatch_source *connectionUnviableTimer;
  _QWORD handler[4];
  id v8[2];
  id location;

  if (self->_connection)
  {
    -[SiriCoreNWConnection _cancelConnectionUnviableTimer](self, "_cancelConnectionUnviableTimer");
    v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    v4 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x77359400uLL);
    id = (void *)nw_connection_get_id();
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __53__SiriCoreNWConnection__startConnectionUnviableTimer__block_invoke;
    handler[3] = &unk_24CCE6AB8;
    objc_copyWeak(v8, &location);
    v8[1] = id;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_resume(v3);
    connectionUnviableTimer = self->_connectionUnviableTimer;
    self->_connectionUnviableTimer = (OS_dispatch_source *)v3;

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelConnectionUnviableTimer
{
  NSObject *connectionUnviableTimer;
  OS_dispatch_source *v4;

  connectionUnviableTimer = self->_connectionUnviableTimer;
  if (connectionUnviableTimer)
  {
    dispatch_source_cancel(connectionUnviableTimer);
    v4 = self->_connectionUnviableTimer;
    self->_connectionUnviableTimer = 0;

  }
}

- (void)_setupStaleConnectionTimer
{
  NSObject *v3;
  double staleConnectionInterval;
  unint64_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  OS_dispatch_source *staleConnectionTimer;
  NSObject *v9;
  _QWORD handler[5];
  NSObject *v11;
  _QWORD *v12;
  _QWORD v13[3];
  unint64_t readWriteCounter;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  readWriteCounter = self->_readWriteCounter;
  self->_readWriteCounter = readWriteCounter + 1;
  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  staleConnectionInterval = self->_staleConnectionInterval;
  if (staleConnectionInterval == 0.0)
    v5 = 180000000000;
  else
    v5 = (unint64_t)(staleConnectionInterval * 1000000000.0);
  v6 = dispatch_time(0, v5);
  dispatch_source_set_timer(v3, v6, v5, 0);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __50__SiriCoreNWConnection__setupStaleConnectionTimer__block_invoke;
  handler[3] = &unk_24CCE6AE0;
  v12 = v13;
  handler[4] = self;
  v7 = v3;
  v11 = v7;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(v7);
  staleConnectionTimer = self->_staleConnectionTimer;
  self->_staleConnectionTimer = (OS_dispatch_source *)v7;
  v9 = v7;

  _Block_object_dispose(v13, 8);
}

- (void)_cancelStaleConnectionTimer
{
  NSObject *staleConnectionTimer;
  OS_dispatch_source *v4;

  staleConnectionTimer = self->_staleConnectionTimer;
  if (staleConnectionTimer)
  {
    dispatch_source_cancel(staleConnectionTimer);
    v4 = self->_staleConnectionTimer;
    self->_staleConnectionTimer = 0;

  }
}

- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, nw_connection_t, void *);
  NSString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  NSString *v12;
  const char *v13;
  __CFString *v14;
  NSObject *host;
  os_log_t *v16;
  uint64_t v17;
  void *v18;
  void (**v19)(id, nw_connection_t, void *);
  __CFString *v20;
  NSString *v21;
  id v22;
  void *v23;
  unsigned __int16 v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  nw_connection_t v29;
  void *v30;
  NSObject *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, nw_connection_t, void *))a4;
  kdebug_trace();
  v8 = self->_resolvedHost;
  -[NSURL port](self->_url, "port");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[NSURL scheme](self->_url, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_usingTLS = objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("https")) == 0;

  if (!v10)
  {
    if (self->_usingTLS)
      v10 = CFSTR("443");
    else
      v10 = CFSTR("80");
  }
  v12 = objc_retainAutorelease(v8);
  v13 = -[NSString UTF8String](v12, "UTF8String");
  v14 = objc_retainAutorelease(v10);
  host = nw_endpoint_create_host(v13, (const char *)-[__CFString UTF8String](v14, "UTF8String"));
  v16 = (os_log_t *)MEMORY[0x24BE08FC0];
  if (!host)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 22, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[SiriCoreNWConnection _getNWConnectionWithInitialData:completion:]";
      _os_log_error_impl(&dword_211AB2000, v26, OS_LOG_TYPE_ERROR, "%s Failed to create endpoint", buf, 0xCu);
      if (v25)
        goto LABEL_20;
    }
    else if (v25)
    {
      goto LABEL_20;
    }
  }
  -[SAConnectionPolicy mptcpFallbackPort](self->_policy, "mptcpFallbackPort");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SAConnectionPolicy mptcpFallbackPort](self->_policy, "mptcpFallbackPort");
    v19 = v7;
    v20 = v14;
    v21 = v12;
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    v6 = v22;
    v12 = v21;
    v14 = v20;
    v7 = v19;
    v16 = (os_log_t *)MEMORY[0x24BE08FC0];

    if (!v24)
      goto LABEL_16;
  }
  else
  {
    v24 = 5228;
  }
  v27 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[SiriCoreNWConnection _getNWConnectionWithInitialData:completion:]";
    v34 = 1024;
    v35 = v24;
    _os_log_impl(&dword_211AB2000, v27, OS_LOG_TYPE_INFO, "%s mptcp_alternate_port = %d", buf, 0x12u);
  }
  nw_endpoint_set_alternate_port();
LABEL_16:
  -[SiriCoreNWConnection _setParametersForHost:useTLS:initialPayload:](self, "_setParametersForHost:useTLS:initialPayload:", v13, self->_usingTLS, v6);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = nw_connection_create(host, v28);
  +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing](SiriCoreNetworkActivityTracing, "sharedNetworkActivityTracing");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "networkActivityAddNWConnection:", v29);

  if (!v29)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 23, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x24BE08FC0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      goto LABEL_21;
    *(_DWORD *)buf = 136315138;
    v33 = "-[SiriCoreNWConnection _getNWConnectionWithInitialData:completion:]";
    _os_log_impl(&dword_211AB2000, v31, OS_LOG_TYPE_INFO, "%s Failed to create connection", buf, 0xCu);
LABEL_20:
    v29 = 0;
    goto LABEL_21;
  }
  v25 = 0;
LABEL_21:
  v7[2](v7, v29, v25);

}

- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  SAConnectionPolicyRoute *route;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *resolvedHost;
  NSURL *v19;
  NSURL *url;
  NSString *v21;
  NSString *connectionId;
  uint64_t v23;
  id v24;
  void *v25;
  id openCompletion;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;

  v10 = a3;
  v11 = a6;
  route = self->_route;
  v13 = a5;
  v14 = a4;
  -[SAConnectionPolicyRoute cname](route, "cname");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(v10, "host");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = (NSString *)objc_msgSend(v16, "copy");
  resolvedHost = self->_resolvedHost;
  self->_resolvedHost = v17;

  if (!v15)
  v19 = (NSURL *)objc_msgSend(v10, "copy");
  url = self->_url;
  self->_url = v19;

  v21 = (NSString *)objc_msgSend(v14, "copy");
  connectionId = self->_connectionId;
  self->_connectionId = v21;

  self->_isEstablishing = 1;
  -[SiriCoreNWConnection _setupOpenTimer](self, "_setupOpenTimer");
  -[SiriCoreNWConnection _setupOpenSlowTimer](self, "_setupOpenSlowTimer");
  v23 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __88__SiriCoreNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke;
  v28[3] = &unk_24CCE6B08;
  v28[4] = self;
  v29 = v11;
  v24 = v11;
  v25 = (void *)MEMORY[0x212BE6580](v28);
  openCompletion = self->_openCompletion;
  self->_openCompletion = v25;

  v27[0] = v23;
  v27[1] = 3221225472;
  v27[2] = __88__SiriCoreNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2;
  v27[3] = &unk_24CCE6B30;
  v27[4] = self;
  -[SiriCoreNWConnection _getNWConnectionWithInitialData:completion:](self, "_getNWConnectionWithInitialData:completion:", v13, v27);

}

- (void)_configureConnection:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  _QWORD handler[4];
  NSObject *v21;
  id v22;
  id location[5];
  NSObject *v24;
  SiriCoreNWConnection *v25;

  v5 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  objc_storeStrong((id *)&self->_content_context, (id)*MEMORY[0x24BDE0860]);
  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetSequenceNumber");

  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsConnectionActive:", 1);

  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orchestratorRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetNetId");

    +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNetIdAvailable:", 1);

  }
  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logRequestLinkBetweenOrchestratorAndNetworkComponent");

  nw_connection_set_queue(v5, (dispatch_queue_t)self->_queue);
  v13 = MEMORY[0x24BDAC760];
  location[1] = (id)MEMORY[0x24BDAC760];
  location[2] = (id)3221225472;
  location[3] = __45__SiriCoreNWConnection__configureConnection___block_invoke;
  location[4] = &unk_24CCE6B58;
  v14 = v5;
  v24 = v14;
  v25 = self;
  MEMORY[0x212BE60C4]();
  objc_initWeak(location, self);
  handler[0] = v13;
  handler[1] = 3221225472;
  handler[2] = __45__SiriCoreNWConnection__configureConnection___block_invoke_22;
  handler[3] = &unk_24CCE6B80;
  v15 = v14;
  v21 = v15;
  objc_copyWeak(&v22, location);
  nw_connection_set_viability_changed_handler(v15, handler);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __45__SiriCoreNWConnection__configureConnection___block_invoke_39;
  v17[3] = &unk_24CCE6B80;
  v16 = v15;
  v18 = v16;
  objc_copyWeak(&v19, location);
  nw_connection_set_better_path_available_handler(v16, v17);
  nw_connection_set_read_close_handler();
  nw_connection_set_write_close_handler();
  nw_connection_start(v16);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(location);

}

- (void)_setupOpenTimer
{
  NSObject *v3;
  int64_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  OS_dispatch_source *openTimer;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  SiriCoreNWConnection *v11;

  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  if (AFIsNano())
    v4 = 6000000000;
  else
    v4 = 15000000000;
  v5 = dispatch_time(0, v4);
  dispatch_source_set_timer(v3, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__SiriCoreNWConnection__setupOpenTimer__block_invoke;
  v9[3] = &unk_24CCE6BD0;
  v6 = v3;
  v10 = v6;
  v11 = self;
  dispatch_source_set_event_handler(v6, v9);
  dispatch_resume(v6);
  openTimer = self->_openTimer;
  self->_openTimer = (OS_dispatch_source *)v6;
  v8 = v6;

}

- (void)_setupOpenSlowTimer
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  OS_dispatch_source *openSlowTimer;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  SiriCoreNWConnection *v10;

  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  v4 = dispatch_time(0, 6000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SiriCoreNWConnection__setupOpenSlowTimer__block_invoke;
  v8[3] = &unk_24CCE6BD0;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_source_set_event_handler(v5, v8);
  dispatch_resume(v5);
  openSlowTimer = self->_openSlowTimer;
  self->_openSlowTimer = (OS_dispatch_source *)v5;
  v7 = v5;

}

- (void)_cancelOpenTimer
{
  NSObject *openTimer;
  OS_dispatch_source *v4;

  openTimer = self->_openTimer;
  if (openTimer)
  {
    dispatch_source_cancel(openTimer);
    v4 = self->_openTimer;
    self->_openTimer = 0;

  }
}

- (void)_cancelSlowOpenTimer
{
  NSObject *openSlowTimer;
  OS_dispatch_source *v4;

  openSlowTimer = self->_openSlowTimer;
  if (openSlowTimer)
  {
    dispatch_source_cancel(openSlowTimer);
    v4 = self->_openSlowTimer;
    self->_openSlowTimer = 0;

  }
}

- (BOOL)hasActiveConnection
{
  return self->_connection != 0;
}

- (void)readData:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSObject *connection;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  connection = self->_connection;
  if (!connection)
  {
    if (!self->_isCanceled)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 25, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_5:
    v7 = 0;
LABEL_6:
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v7);

    goto LABEL_7;
  }
  if (self->_isCanceled)
    goto LABEL_5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__SiriCoreNWConnection_readData___block_invoke;
  v8[3] = &unk_24CCE6BF8;
  v8[4] = self;
  v9 = v4;
  nw_connection_receive(connection, 0, 0xFFFFFFFF, v8);

LABEL_7:
}

- (void)writeData:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *connection;
  void *v10;
  NSObject *content_context;
  _QWORD v12[5];
  void (**v13)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  connection = self->_connection;
  if (connection && !self->_isCanceled)
  {
    if (v6 && dispatch_data_get_size(v6))
    {
      ++self->_readWriteCounter;
      content_context = self->_content_context;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __45__SiriCoreNWConnection_writeData_completion___block_invoke;
      v12[3] = &unk_24CCE6C20;
      v12[4] = self;
      v13 = v8;
      nw_connection_send(connection, v6, content_context, 0, v12);

    }
    else if (v8)
    {
      v8[2](v8, 0);
    }
  }
  else if (v7)
  {
    v10 = 0;
    if (!connection && !self->_isCanceled)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 29, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    ((void (**)(_QWORD, void *))v8)[2](v8, v10);

  }
}

- (id)headerDataWithForceReconnect:(BOOL)a3
{
  return 0;
}

- (BOOL)shouldFallbackQuickly
{
  return 0;
}

- (BOOL)supportsInitialPayload
{
  return 1;
}

- (id)_sendBufferBytesRemaining:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
}

- (id)connectionType
{
  OS_nw_connection *connection;
  OS_nw_connection *v4;
  _BOOL4 isMPTCP;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  SiriCoreConnectionType *v10;
  uint64_t v11;
  SiriCoreConnectionType *v12;
  int64_t v13;
  SiriCoreConnectionType *v14;
  SiriCoreConnectionType *v15;
  SiriCoreConnectionType *v16;
  SiriCoreConnectionType *v17;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *name;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  SiriCoreConnectionType *v26;
  _BOOL4 v27;
  SiriCoreConnectionType *v28;
  uint64_t v29;
  SiriCoreConnectionType *connectionType;
  int v31;
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  connection = self->_connection;
  if (connection)
  {
    if (self->_connectionType)
    {
LABEL_12:
      v16 = [SiriCoreConnectionType alloc];
      v13 = -[SiriCoreConnectionType technology](self->_connectionType, "technology");
      v12 = v16;
      goto LABEL_13;
    }
    v4 = connection;
    isMPTCP = self->_isMPTCP;
    v6 = (void *)*MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      v8 = v6;
      objc_msgSend(v7, "numberWithBool:", isMPTCP);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 136315394;
      v32 = "-[SiriCoreNWConnection connectionType]";
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, "%s Connection is MPTCP %@", (uint8_t *)&v31, 0x16u);

    }
    if (isMPTCP)
    {
      v10 = [SiriCoreConnectionType alloc];
      v11 = 3000;
    }
    else
    {
      if (!self->_connectByPOPEnabled)
      {
        v19 = nw_connection_copy_connected_path();
        if (v19)
        {
          v15 = (SiriCoreConnectionType *)v19;
          v20 = nw_path_copy_interface();
          if (v20)
          {
            v21 = v20;
            name = nw_interface_get_name(v20);
            if (name)
              LODWORD(name) = nw_interface_get_index(v21);
            self->_interfaceIndex = (int)name;
            v23 = nw_path_uses_interface_type(&v15->super, nw_interface_type_cellular);
            v24 = nw_path_uses_interface_type(&v15->super, nw_interface_type_wifi);
            v25 = nw_path_uses_interface_type(&v15->super, nw_interface_type_wired);
            if (v23)
            {
              +[SiriCoreNetworkManager connectionTypeForInterfaceName:isCellular:](SiriCoreNetworkManager, "connectionTypeForInterfaceName:isCellular:", 0, 1);
              v26 = (SiriCoreConnectionType *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v27 = v25;
              v28 = [SiriCoreConnectionType alloc];
              if (v24)
              {
                v29 = 1000;
              }
              else if (v27)
              {
                v29 = 3006;
              }
              else
              {
                v29 = 0;
              }
              v26 = -[SiriCoreConnectionType initWithTechnology:](v28, "initWithTechnology:", v29);
            }
            connectionType = self->_connectionType;
            self->_connectionType = v26;

            goto LABEL_11;
          }
          v17 = -[SiriCoreConnectionType initWithTechnology:]([SiriCoreConnectionType alloc], "initWithTechnology:", 0);

        }
        else
        {
          v17 = -[SiriCoreConnectionType initWithTechnology:]([SiriCoreConnectionType alloc], "initWithTechnology:", 0);
        }

        return v17;
      }
      v10 = [SiriCoreConnectionType alloc];
      v11 = 3003;
    }
    v14 = -[SiriCoreConnectionType initWithTechnology:](v10, "initWithTechnology:", v11);
    v15 = self->_connectionType;
    self->_connectionType = v14;
LABEL_11:

    goto LABEL_12;
  }
  v12 = [SiriCoreConnectionType alloc];
  v13 = 0;
LABEL_13:
  v17 = -[SiriCoreConnectionType initWithTechnology:](v12, "initWithTechnology:", v13);
  return v17;
}

- (id)analysisInfo
{
  OS_nw_connection *v3;
  SiriCoreAceConnectionAnalysisInfo *v4;
  NSURL *url;
  uint64_t interfaceIndex;
  void *v7;
  _BOOL8 prefersWWAN;
  void *v9;
  void *v10;
  SiriCoreAceConnectionAnalysisInfo *v11;

  v3 = self->_connection;
  v4 = [SiriCoreAceConnectionAnalysisInfo alloc];
  url = self->_url;
  interfaceIndex = self->_interfaceIndex;
  -[SiriCoreNWConnection _sendBufferBytesRemaining:](self, "_sendBufferBytesRemaining:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  prefersWWAN = self->_prefersWWAN;
  -[SiriCoreNWConnection connectionType](self, "connectionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAConnectionPolicy policyId](self->_policy, "policyId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SiriCoreAceConnectionAnalysisInfo initWithConnectionURL:interfaceIndex:sendBufferSize:wwanPreferred:connectionType:policyId:](v4, "initWithConnectionURL:interfaceIndex:sendBufferSize:wwanPreferred:connectionType:policyId:", url, interfaceIndex, v7, prefersWWAN, v9, v10);

  return v11;
}

- (void)updateConnectionMetrics:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  SiriCoreConnectionMetrics *v9;
  SiriCoreConnectionMetrics *v10;
  OS_nw_connection *connection;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[SiriCoreNWConnection _getAttemptedEndpoints](self, "_getAttemptedEndpoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_metrics;
  v10 = v9;
  connection = self->_connection;
  if (connection)
  {
    objc_msgSend(v6, "setConnectionMetricsFromConnection:isPop:isMPTCP:attemptedEndpoints:completion:", connection, self->_connectByPOPEnabled, self->_isMPTCP, v8, v7);
  }
  else
  {
    if (v9)
    {
      -[SiriCoreConnectionMetrics tcpInfoMetricsByInterfaceName](v9, "tcpInfoMetricsByInterfaceName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v6, "setTCPInfoMetricsByInterfaceName:", v13);

      -[SiriCoreConnectionMetrics flowNetworkInterfaceType](v10, "flowNetworkInterfaceType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v6, "setFlowNetworkInterfaceType:", v15);

      -[SiriCoreConnectionMetrics subflowCount](v10, "subflowCount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSubflowCount:", v16);

      -[SiriCoreConnectionMetrics connectedSubflowCount](v10, "connectedSubflowCount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setConnectedSubflowCount:", v17);

      -[SiriCoreConnectionMetrics primarySubflowInterfaceName](v10, "primarySubflowInterfaceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPrimarySubflowInterfaceName:", v18);

      -[SiriCoreConnectionMetrics subflowSwitchCounts](v10, "subflowSwitchCounts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSubflowSwitchCounts:", v19);

      -[SiriCoreConnectionMetrics dnsResolutionTime](v10, "dnsResolutionTime");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDnsResolutionTime:", v20);

      -[SiriCoreConnectionMetrics connectionStartTimeToDNSResolutionTimeMsec](v10, "connectionStartTimeToDNSResolutionTimeMsec");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setConnectionStartTimeToDNSResolutionTimeMsec:", v21);

      -[SiriCoreConnectionMetrics connectionEstablishmentTimeMsec](v10, "connectionEstablishmentTimeMsec");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setConnectionEstablishmentTimeMsec:", v22);

      -[SiriCoreConnectionMetrics connectionStartTimeToConnectionEstablishmentTimeMsec](v10, "connectionStartTimeToConnectionEstablishmentTimeMsec");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setConnectionStartTimeToConnectionEstablishmentTimeMsec:", v23);

      -[SiriCoreConnectionMetrics tlsHandshakeTimeMsec](v10, "tlsHandshakeTimeMsec");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTlsHandshakeTimeMsec:", v24);

      -[SiriCoreConnectionMetrics connectionStartTimeToTLSHandshakeTimeMsec](v10, "connectionStartTimeToTLSHandshakeTimeMsec");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setConnectionStartTimeToTLSHandshakeTimeMsec:", v25);
    }
    else
    {
      -[NSURL absoluteString](self->_url, "absoluteString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[SiriCoreNWConnection updateConnectionMetrics:completion:]";
        _os_log_impl(&dword_211AB2000, v26, OS_LOG_TYPE_INFO, "%s Reporting missing metrics to ABC", buf, 0xCu);
      }
      +[SiriCoreSymptomsReporter sharedInstance](SiriCoreSymptomsReporter, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v30 = CFSTR("url");
        v31 = v25;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "reportIssueForType:subType:context:processIdentifier:walkboutStatus:", CFSTR("connection_metrics"), CFSTR("no_nwconnection"), v28, objc_msgSend(v29, "processIdentifier"), 0);

      if (v25)
    }

    if (v7)
      v7[2](v7);
  }

}

- (void)_closeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *resolvedHost;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  OS_nw_connection *connection;
  OS_nw_connection *v11;
  OS_nw_connection *v12;
  OS_nw_content_context *content_context;
  NSArray *v14;
  NSArray *attemptedEndpoints;
  NSObject *v16;
  SiriCoreConnectionMetrics *v17;
  _BOOL8 connectByPOPEnabled;
  _BOOL8 isMPTCP;
  NSArray *v20;
  NSObject *v21;
  SiriCoreConnectionMetrics *metrics;
  SiriCoreConnectionMetrics *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *queue;
  OS_nw_content_context *v28;
  OS_nw_connection *v29;
  OS_nw_content_context *v30;
  _QWORD block[4];
  OS_nw_connection *v32;
  OS_nw_content_context *v33;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_isCanceled)
  {
    v5 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[SiriCoreNWConnection _closeWithError:]";
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    resolvedHost = self->_resolvedHost;
    self->_resolvedHost = 0;

    self->_isReady = 0;
    self->_isViable = 1;
    v7 = MEMORY[0x24BDAC760];
    self->_isCanceled = 1;
    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __40__SiriCoreNWConnection__closeWithError___block_invoke;
    v39[3] = &unk_24CCE6BD0;
    v39[4] = self;
    v40 = v4;
    v8 = MEMORY[0x212BE6580](v39);
    v9 = (void *)v8;
    connection = self->_connection;
    if (connection)
    {
      v11 = connection;
      v12 = self->_connection;
      self->_connection = 0;

      v30 = self->_content_context;
      content_context = self->_content_context;
      self->_content_context = 0;

      if (!self->_attemptedEndpoints)
      {
        -[SiriCoreNWConnection _getAttemptedEndpoints](self, "_getAttemptedEndpoints");
        v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
        attemptedEndpoints = self->_attemptedEndpoints;
        self->_attemptedEndpoints = v14;

      }
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      v17 = objc_alloc_init(SiriCoreConnectionMetrics);
      connectByPOPEnabled = self->_connectByPOPEnabled;
      isMPTCP = self->_isMPTCP;
      v20 = self->_attemptedEndpoints;
      v37[0] = v7;
      v37[1] = 3221225472;
      v37[2] = __40__SiriCoreNWConnection__closeWithError___block_invoke_2;
      v37[3] = &unk_24CCE6BA8;
      v21 = v16;
      v38 = v21;
      -[SiriCoreConnectionMetrics setConnectionMetricsFromConnection:isPop:isMPTCP:attemptedEndpoints:completion:](v17, "setConnectionMetricsFromConnection:isPop:isMPTCP:attemptedEndpoints:completion:", v11, connectByPOPEnabled, isMPTCP, v20, v37);
      metrics = self->_metrics;
      self->_metrics = v17;
      v23 = v17;

      dispatch_group_enter(v21);
      +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing](SiriCoreNetworkActivityTracing, "sharedNetworkActivityTracing");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __40__SiriCoreNWConnection__closeWithError___block_invoke_3;
      v35[3] = &unk_24CCE6BA8;
      v36 = v21;
      v26 = v21;
      objc_msgSend(v24, "networkActivityRemoveNWConnection:completion:", v11, v35);

      queue = self->_queue;
      block[0] = v25;
      block[1] = 3221225472;
      block[2] = __40__SiriCoreNWConnection__closeWithError___block_invoke_4;
      block[3] = &unk_24CCE6C88;
      v32 = v11;
      v33 = v30;
      v34 = v9;
      v28 = v30;
      v29 = v11;
      dispatch_group_notify(v26, queue, block);

    }
    else
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }

  }
}

- (void)_receivedViabilityChangeNotification:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  if (self->_isViable != a3)
  {
    v3 = a3;
    self->_isViable = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "connectionProvider:receivedViabilityChangeNotification:", self, v3);

  }
}

- (void)_receivedBetterRouteNotification:(BOOL)a3
{
  id WeakRetained;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "connectionProviderReceivedBetterRouteNotification:", self);

  }
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SiriCoreNWConnection_close__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isPeerConnectionError:(id)a3
{
  return 0;
}

- (BOOL)isPeerNotNearbyError:(id)a3
{
  return 0;
}

- (BOOL)isMultipath
{
  return self->_isMPTCP;
}

- (BOOL)isEstablishing
{
  return self->_isEstablishing;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (BOOL)shouldFallbackFromError:(id)a3
{
  return 1;
}

- (void)setKeepAlive:(double)a3 withInterval:(double)a4 withCount:(unint64_t)a5
{
  self->_keepaliveIdleTime = a3;
  self->_keepaliveIntervalTime = a4;
  self->_keepaliveUnackedCount = a5;
}

- (void)setRetransmitConnectionDropTime:(double)a3
{
  self->_retransmissionBasedConnectionDropTime = a3;
}

- (id)resolvedHost
{
  return self->_resolvedHost;
}

- (id)_setParametersForHost:(const char *)a3 useTLS:(BOOL)a4 initialPayload:(id)a5
{
  _BOOL4 v5;
  id v7;
  SAConnectionPolicy *v8;
  SAConnectionPolicy *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *secure_tcp;
  size_t v19;
  xpc_object_t v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSObject *v24;
  int v27;
  mach_msg_type_number_t task_info_outCnt;
  _QWORD v29[5];
  _QWORD v30[5];
  char v31;
  uint8_t buf[16];
  __int128 v33;
  uint64_t v34;

  v5 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  if (AFIsInternalInstall() && (AFIsNano() & 1) == 0)
    _AFPreferencesShouldUseTFO();
  v8 = self->_policy;
  v9 = v8;
  if (v8)
  {
    -[SAConnectionPolicy enableTcpFastOpen](v8, "enableTcpFastOpen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "BOOLValue");

    -[SAConnectionPolicy disableMPTCP](v9, "disableMPTCP");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    -[SAConnectionPolicy enableOptimisticDNS](v9, "enableOptimisticDNS");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v13, "BOOLValue");

  }
  else
  {
    v12 = 0;
    v27 = 1;
  }
  v14 = (void *)MEMORY[0x212BE6580](*MEMORY[0x24BDE0880]);
  v15 = MEMORY[0x24BDAC760];
  if (v5 && !self->_connectByPOPEnabled)
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __68__SiriCoreNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke;
    v30[3] = &unk_24CCE6CB0;
    v31 = 1;
    v30[4] = self;
    v16 = MEMORY[0x212BE6580](v30);

    v14 = (void *)v16;
  }
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __68__SiriCoreNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke_2;
  v29[3] = &unk_24CCE6CD8;
  v29[4] = self;
  v17 = (void *)MEMORY[0x212BE6580](v29);
  secure_tcp = nw_parameters_create_secure_tcp(v14, v17);
  if (v5 && !self->_connectByPOPEnabled)
  {
    v19 = strlen(a3);
    v20 = xpc_data_create(a3, v19);
    nw_parameters_set_tls_session_id();

  }
  +[SiriCoreNWContext sharedInstance](SiriCoreNWContext, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nwContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  nw_parameters_set_context();
  nw_parameters_set_data_mode();
  AFIsHorseman();
  nw_parameters_set_traffic_class();
  if (((AFIsHorseman() | v12) & 1) != 0)
  {
    if (self->_prefersWWAN)
      nw_parameters_set_required_interface_type(secure_tcp, nw_interface_type_cellular);
  }
  else
  {
    nw_parameters_set_multipath_service(secure_tcp, nw_multipath_service_interactive);
  }
  nw_parameters_set_indefinite();
  nw_parameters_set_tfo();
  if (self->_connectByPOPEnabled)
  {
    v23 = self->_connectionId;
    NetworkServiceProxyEnableInParameters();
    NetworkServiceProxySetServiceNameInParameters();

  }
  if (v7)
    nw_parameters_set_initial_data_payload();
  if (v27)
  {
    v24 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SiriCoreNWConnection _setParametersForHost:useTLS:initialPayload:]";
      _os_log_impl(&dword_211AB2000, v24, OS_LOG_TYPE_INFO, "%s optimisticDNS", buf, 0xCu);
    }
    nw_parameters_set_expired_dns_behavior(secure_tcp, nw_parameters_expired_dns_behavior_allow);
  }
  *(_OWORD *)buf = 0u;
  v33 = 0u;
  task_info_outCnt = 8;
  if (!task_info(*MEMORY[0x24BDAEC58], 0xFu, (task_info_t)buf, &task_info_outCnt))
    nw_parameters_set_source_application();

  return secure_tcp;
}

- (BOOL)providerStatsIndicatePoorLinkQuality
{
  OS_nw_connection *connection;
  OS_nw_connection *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  _QWORD applier[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  connection = self->_connection;
  if (!connection)
    return 0;
  v3 = connection;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = nw_connection_copy_tcp_info();
  v5 = (void *)v4;
  if (v4 && MEMORY[0x212BE68A4](v4) == MEMORY[0x24BDACFA0])
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __60__SiriCoreNWConnection_providerStatsIndicatePoorLinkQuality__block_invoke;
    applier[3] = &unk_24CCE6D00;
    applier[4] = &v10;
    xpc_dictionary_apply(v5, applier);
  }
  if (*((_BYTE *)v11 + 24))
  {
    v6 = 0;
  }
  else
  {
    v7 = *MEMORY[0x24BE08FC0];
    v6 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SiriCoreNWConnection providerStatsIndicatePoorLinkQuality]";
      _os_log_impl(&dword_211AB2000, v7, OS_LOG_TYPE_INFO, "%s Connection has poor quality.", buf, 0xCu);
      v6 = *((_BYTE *)v11 + 24) == 0;
    }
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)_getAttemptedEndpoints
{
  NSArray *attemptedEndpoints;
  NSObject *v4;
  NSArray *v6;
  OS_nw_connection *v7;
  void *v8;
  uint64_t count;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t description;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  NSArray *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  attemptedEndpoints = self->_attemptedEndpoints;
  if (attemptedEndpoints)
  {
    v4 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v16 = 136315394;
      v17 = "-[SiriCoreNWConnection _getAttemptedEndpoints]";
      v18 = 2112;
      v19 = attemptedEndpoints;
      _os_log_impl(&dword_211AB2000, v4, OS_LOG_TYPE_INFO, "%s cached %@", (uint8_t *)&v16, 0x16u);
      attemptedEndpoints = self->_attemptedEndpoints;
    }
    return attemptedEndpoints;
  }
  else
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_connection;
    if (v7 && !self->_isCanceled)
    {
      v8 = (void *)nw_connection_copy_attempted_endpoint_array();
      if (v8)
      {
        count = nw_array_get_count();
        if (count)
        {
          v10 = count;
          for (i = 0; i != v10; ++i)
          {
            nw_array_get_object_at_index();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            description = nw_endpoint_get_description();
            if (description)
            {
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", description);
              if (v14)
                -[NSArray addObject:](v6, "addObject:", v14);

            }
          }
        }
      }

    }
    v15 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v16 = 136315394;
      v17 = "-[SiriCoreNWConnection _getAttemptedEndpoints]";
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_211AB2000, v15, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v16, 0x16u);
    }

    return v6;
  }
}

- (void)_addCorrespondingMetricsFromConnection:(id)a3 inState:(int)a4
{
  NSObject *v6;
  NSObject *v7;
  nw_path_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *queue;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  _UNKNOWN **v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t v50;

  v6 = a3;
  v7 = v6;
  if ((a4 - 1) >= 2)
  {
    if (a4 == 3)
    {
      v14 = mach_absolute_time();
      queue = self->_queue;
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __71__SiriCoreNWConnection__addCorrespondingMetricsFromConnection_inState___block_invoke;
      v48[3] = &unk_24CCE6D28;
      v49 = v7;
      v50 = v14;
      nw_connection_access_establishment_report(v49, queue, v48);

    }
  }
  else
  {
    v8 = nw_connection_copy_current_path(v6);
    if (v8)
    {
      SiriCoreGetConnectionNetworkPathReport(v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logEventWithType:context:", 1016, v9);

      if (v9)
      {
        v11 = objc_alloc_init(MEMORY[0x24BE95310]);
        objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathHasDNS"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathHasDNS"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setHasDNS:", objc_msgSend(v13, "BOOLValue"));

        }
        else
        {
          objc_msgSend(v11, "setHasDNS:", 0);
        }

        +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logNetworkConnectionStatePreparationSnapshotCaptured:", v11);

        v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathGateways"));
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathGateways"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathGateways"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[SiriCoreNetworkingAnalytics endpointsFromArray:](SiriCoreNetworkingAnalytics, "endpointsFromArray:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "mutableCopy");

            v17 = (id)v24;
          }
        }
        v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathInterfaces"));
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathInterfaces"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v29 = objc_opt_isKindOfClass();

          v30 = &off_24CCE5000;
          if ((v29 & 1) != 0)
          {
            objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathInterfaces"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[SiriCoreNetworkingAnalytics pathInterfacesFromArray:](SiriCoreNetworkingAnalytics, "pathInterfacesFromArray:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "mutableCopy");

            v25 = (id)v33;
          }
        }
        else
        {
          v30 = &off_24CCE5000;
        }
        v34 = objc_alloc_init(MEMORY[0x24BE952B8]);
        objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathIsExpensive"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathIsExpensive"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setIsExpensive:", objc_msgSend(v36, "BOOLValue"));

        }
        else
        {
          objc_msgSend(v34, "setIsExpensive:", 0);
        }

        objc_msgSend(v34, "setPathGateways:", v17);
        objc_msgSend(v9, "objectForKey:", CFSTR("connectionInfo"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("connectionInfo"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setConnectionInfo:", v38);

        }
        else
        {
          objc_msgSend(v34, "setConnectionInfo:", &stru_24CCE7768);
        }

        objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathHasIpv6"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathHasIpv6"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setHasIpv6:", objc_msgSend(v40, "BOOLValue"));

        }
        else
        {
          objc_msgSend(v34, "setHasIpv6:", 0);
        }

        objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathHasIpv4"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathHasIpv4"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setHasIpv4:", objc_msgSend(v42, "BOOLValue"));

        }
        else
        {
          objc_msgSend(v34, "setHasIpv4:", 0);
        }

        objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathIsConstrained"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathIsConstrained"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setIsConstrained:", objc_msgSend(v44, "BOOLValue"));

        }
        else
        {
          objc_msgSend(v34, "setIsConstrained:", 0);
        }

        objc_msgSend(v34, "setPathInterfaces:", v25);
        objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathStatus"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("connectionPreparingPathStatus"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setStatus:", +[SiriCoreNetworkingAnalytics pathStatusFromNumber:](SiriCoreNetworkingAnalytics, "pathStatusFromNumber:", v46));

          v30 = &off_24CCE5000;
        }
        else
        {
          objc_msgSend(v34, "setStatus:", 0);
        }

        objc_msgSend(v30[92], "sharedSiriCoreNetworkingAnalytics");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "logDebugNetworkConnectionStatePreparationSnapshotCaptured:", v34);

      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentErrorFromNWConnection, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_attemptedEndpoints, 0);
  objc_storeStrong((id *)&self->_connectionUnviableTimer, 0);
  objc_storeStrong((id *)&self->_staleConnectionTimer, 0);
  objc_storeStrong((id *)&self->_openSlowTimer, 0);
  objc_storeStrong((id *)&self->_openTimer, 0);
  objc_storeStrong(&self->_openCompletion, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_content_context, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_resolvedHost, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __71__SiriCoreNWConnection__addCorrespondingMetricsFromConnection_inState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  id v43;

  if (a2)
  {
    SiriCoreGetConnectionReadyReport(*(void **)(a1 + 32), a2);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:machAbsoluteTime:context:", 1017, *(_QWORD *)(a1 + 40), v43);

    v4 = v43;
    if (v43)
    {
      v5 = objc_alloc_init(MEMORY[0x24BE95318]);
      objc_msgSend(v43, "objectForKey:", CFSTR("connectionInfo"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v43, "objectForKey:", CFSTR("connectionInfo"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setConnectionInfo:", v7);

      }
      else
      {
        objc_msgSend(v5, "setConnectionInfo:", &stru_24CCE7768);
      }

      objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentPreviousAttemptCount"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentPreviousAttemptCount"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(v5, "setConnectionEstablishmentPreviousAttemptCount:", v10);

      }
      else
      {
        objc_msgSend(v5, "setConnectionEstablishmentPreviousAttemptCount:", 0);
      }

      objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentAttemptDelay"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentAttemptDelay"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(v5, "setConnectionEstablishmentAttemptDelay:", v13);

      }
      else
      {
        objc_msgSend(v5, "setConnectionEstablishmentAttemptDelay:", 0);
      }

      +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logNetworkConnectionStateReadySnapshotCaptured:", v5);

      v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentResolution"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentResolution"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentResolution"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[SiriCoreNetworkingAnalytics establishmentResolutionFromArray:](SiriCoreNetworkingAnalytics, "establishmentResolutionFromArray:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "mutableCopy");

          v15 = (id)v22;
        }
      }
      v23 = objc_alloc_init(MEMORY[0x24BE95338]);
      objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentProxyConfiguration"));
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentProxyConfiguration"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v27 = objc_opt_isKindOfClass();

        if ((v27 & 1) != 0)
        {
          objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentProxyConfiguration"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[SiriCoreNetworkingAnalytics proxyConfigurationFromDictionary:](SiriCoreNetworkingAnalytics, "proxyConfigurationFromDictionary:", v28);
          v29 = objc_claimAutoreleasedReturnValue();

          v23 = (id)v29;
        }
      }
      v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentProtocols"));
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)v31;
        objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentProtocols"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v34 = objc_opt_isKindOfClass();

        if ((v34 & 1) != 0)
        {
          objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentProtocols"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[SiriCoreNetworkingAnalytics handShakeProtocolFromArray:](SiriCoreNetworkingAnalytics, "handShakeProtocolFromArray:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "mutableCopy");

          v30 = (id)v37;
        }
      }
      v38 = objc_alloc_init(MEMORY[0x24BE952C0]);
      objc_msgSend(v38, "setResolutions:", v15);
      objc_msgSend(v38, "setProxyConfiguration:", v23);
      objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentDuration"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(v43, "objectForKey:", CFSTR("connectionEstablishmentDuration"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "doubleValue");
        objc_msgSend(v38, "setDurationInMs:", (unint64_t)v41);

      }
      else
      {
        objc_msgSend(v38, "setDurationInMs:", 0);
      }

      objc_msgSend(v38, "setConnectionEstablishmentProtocols:", v30);
      +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logDebugNetworkConnectionStateReadySnapshotCaptured:", v38);

      v4 = v43;
    }

  }
}

uint64_t __60__SiriCoreNWConnection_providerStatsIndicatePoorLinkQuality__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  char *bytes_ptr;
  char *v7;
  os_log_t *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  _BYTE v21[10];
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  bytes_ptr = (char *)xpc_data_get_bytes_ptr(v5);
  if (bytes_ptr)
  {
    v7 = bytes_ptr;
    if (xpc_data_get_length(v5) == 408 && MEMORY[0x212BE68A4](v5) == MEMORY[0x24BDACF90])
    {
      v8 = (os_log_t *)MEMORY[0x24BE08FC0];
      if ((*v7 & 0xFE) == 4 && *(_QWORD *)(v7 + 92) <= 0x100uLL)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        v9 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          v18 = 136315394;
          v19 = "-[SiriCoreNWConnection providerStatsIndicatePoorLinkQuality]_block_invoke";
          v20 = 2080;
          *(_QWORD *)v21 = a2;
          _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_INFO, "%s Treating %s as ok quality", (uint8_t *)&v18, 0x16u);
        }
      }
      v10 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v12 = *((_DWORD *)v7 + 5);
        v11 = *((_DWORD *)v7 + 6);
        v13 = *((_DWORD *)v7 + 7);
        v14 = *((_DWORD *)v7 + 16);
        v15 = *(_QWORD *)(v7 + 92);
        v16 = *(_QWORD *)(v7 + 284);
        v18 = 136316930;
        v19 = "-[SiriCoreNWConnection providerStatsIndicatePoorLinkQuality]_block_invoke";
        v20 = 1024;
        *(_DWORD *)v21 = v11;
        *(_WORD *)&v21[4] = 1024;
        *(_DWORD *)&v21[6] = v12;
        v22 = 1024;
        v23 = v13;
        v24 = 1024;
        v25 = v14;
        v26 = 2048;
        v27 = v15;
        v28 = 2048;
        v29 = v16;
        v30 = 2080;
        v31 = a2;
        _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_INFO, "%s TCP srtt: %d rttcur:%d rttvar:%d sbbytes:%d txunacked:%lld txretransmitpackets:%lld for if=%s", (uint8_t *)&v18, 0x42u);
      }
    }
  }

  return 1;
}

void __68__SiriCoreNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke(uint64_t a1, id a2)
{
  void *v3;
  void *v4;
  NSObject *options;

  options = a2;
  sec_protocol_options_set_tls_tickets_enabled(options, *(_BYTE *)(a1 + 40));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v3)
  {
    objc_msgSend(v3, "enableTLS13");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      sec_protocol_options_set_max_tls_protocol_version(options, tls_protocol_version_TLSv13);
      sec_protocol_options_set_tls_resumption_enabled(options, 1);
      sec_protocol_options_set_tls_false_start_enabled(options, 1);
      sec_protocol_options_add_tls_application_protocol(options, "http/1.1");
    }
  }

}

void __68__SiriCoreNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  NSObject *options;

  options = a2;
  nw_tcp_options_set_no_delay(options, 1);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(double *)(v3 + 200) != 0.0 || *(double *)(v3 + 192) != 0.0 || *(_QWORD *)(v3 + 216))
  {
    nw_tcp_options_set_enable_keepalive(options, 1);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(double *)(v3 + 200);
    if (v4 != 0.0)
    {
      nw_tcp_options_set_keepalive_interval(options, v4);
      v3 = *(_QWORD *)(a1 + 32);
    }
    v5 = *(double *)(v3 + 192);
    if (v5 != 0.0)
    {
      nw_tcp_options_set_keepalive_idle_time(options, v5);
      v3 = *(_QWORD *)(a1 + 32);
    }
    v6 = *(_QWORD *)(v3 + 216);
    if (v6)
    {
      nw_tcp_options_set_keepalive_count(options, v6);
      v3 = *(_QWORD *)(a1 + 32);
    }
  }
  v7 = *(double *)(v3 + 208);
  v8 = options;
  if (v7 != 0.0)
  {
    nw_tcp_options_set_retransmit_connection_drop_time(options, v7);
    v8 = options;
  }

}

uint64_t __29__SiriCoreNWConnection_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

void __40__SiriCoreNWConnection__closeWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_cancelStaleConnectionTimer");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (*(_QWORD *)(v2 + 112))
  {
    if (v3)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 17, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(a1 + 40);
    }
    if (v3)
      v6 = v3;
    else
      v6 = v4;
    objc_msgSend((id)v2, "_invokeOpenCompletionWithError:", v6);
    goto LABEL_12;
  }
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));

    if (WeakRetained)
    {
      v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(v4, "connectionProvider:receivedError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_12:

    }
  }
  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsConnectionActive:", 0);

  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNetIdAvailable:", 0);

}

void __40__SiriCoreNWConnection__closeWithError___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __40__SiriCoreNWConnection__closeWithError___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __40__SiriCoreNWConnection__closeWithError___block_invoke_4(uint64_t a1)
{
  nw_connection_send(*(nw_connection_t *)(a1 + 32), 0, *(nw_content_context_t *)(a1 + 40), 1, &__block_literal_global_3005);
  nw_connection_set_read_close_handler();
  nw_connection_set_write_close_handler();
  nw_connection_cancel(*(nw_connection_t *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __40__SiriCoreNWConnection__closeWithError___block_invoke_5(uint64_t a1, void *a2)
{
  NSObject *v2;
  NSObject *v3;
  int error_code;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  NSObject *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = v2;
  if (v2)
  {
    error_code = nw_error_get_error_code(v2);
    if (nw_error_get_error_domain(v3) != nw_error_domain_posix || error_code != 57)
    {
      v5 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
      {
        v6 = 136315394;
        v7 = "-[SiriCoreNWConnection _closeWithError:]_block_invoke_5";
        v8 = 2112;
        v9 = v3;
        _os_log_error_impl(&dword_211AB2000, v5, OS_LOG_TYPE_ERROR, "%s close error is %@", (uint8_t *)&v6, 0x16u);
      }
    }
  }

}

void __45__SiriCoreNWConnection_writeData_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  CFErrorRef v6;
  CFErrorRef v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CFErrorRef v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3 && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 83))
  {
    v5 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SiriCoreNWConnection writeData:completion:]_block_invoke";
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_211AB2000, v5, OS_LOG_TYPE_ERROR, "%s write error is %@", buf, 0x16u);
    }
    v6 = nw_error_copy_cf_error(v3);
    v7 = v6;
    v8 = (void *)MEMORY[0x24BDD1540];
    if (v6)
    {
      v11 = *MEMORY[0x24BDD1398];
      v12 = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 26, v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 26, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v4);

}

void __33__SiriCoreNWConnection_readData___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  CFErrorRef v14;
  void *v15;
  CFErrorRef v16;
  void *v17;
  uint64_t v18;
  CFErrorRef v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  if ((!v8 || v10) && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 83))
  {
    v13 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SiriCoreNWConnection readData:]_block_invoke";
      v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_211AB2000, v13, OS_LOG_TYPE_ERROR, "%s read error is %@", buf, 0x16u);
      if (v11)
      {
LABEL_8:
        v14 = nw_error_copy_cf_error(v11);
        v15 = (void *)MEMORY[0x24BDD1540];
        if (v14)
        {
          v16 = v14;
          v18 = *MEMORY[0x24BDD1398];
          v19 = v14;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 25, v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
          goto LABEL_5;
        }
LABEL_12:
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 25, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        goto LABEL_13;
      }
    }
    else if (v11)
    {
      goto LABEL_8;
    }
    v15 = (void *)MEMORY[0x24BDD1540];
    goto LABEL_12;
  }
  v12 = 0;
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __43__SiriCoreNWConnection__setupOpenSlowTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SiriCoreNWConnection _setupOpenSlowTimer]_block_invoke";
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s Open slow timer firing", buf, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v3 + 120))
  {
    v4 = *(void **)(v3 + 128);
    *(_QWORD *)(v3 + 128) = 0;

  }
  v5 = objc_alloc(MEMORY[0x24BDD1540]);
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232);
  if (v7)
  {
    v13 = *MEMORY[0x24BDD1398];
    v14 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 33, v8);

  }
  else
  {
    v9 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 33, 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(v12, "connectionProvider:receivedIntermediateError:", *(_QWORD *)(a1 + 40), v9);

  }
}

void __39__SiriCoreNWConnection__setupOpenTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SiriCoreNWConnection _setupOpenTimer]_block_invoke";
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s Open timer firing", buf, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v3 == *(void **)(v4 + 120))
  {
    *(_QWORD *)(v4 + 120) = 0;

  }
  v5 = objc_alloc(MEMORY[0x24BDD1540]);
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232);
  if (v7)
  {
    v12 = *MEMORY[0x24BDD1398];
    v13 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 4, v8);

  }
  else
  {
    v9 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 4, 0);
  }
  if (AFDeviceSupportsSiriUOD()
    && (v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16)), v10, v10))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(WeakRetained, "connectionProvider:receivedError:", *(_QWORD *)(a1 + 40), v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_closeWithError:", v9);
  }

}

void __45__SiriCoreNWConnection__configureConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  CFErrorRef v7;
  CFErrorRef v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id WeakRetained;
  char v24;
  id v25;
  uint64_t v26;
  CFErrorRef v27;
  uint64_t v28;
  CFErrorRef v29;
  uint64_t v30;
  CFErrorRef v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t id;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5 && (v7 = nw_error_copy_cf_error(v5)) != 0)
  {
    v8 = v7;
    v9 = (void *)*MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
    {
      v17 = v9;
      *(_DWORD *)buf = 136315906;
      v33 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
      v34 = 1024;
      v35 = a2;
      v36 = 2112;
      v37 = (uint64_t)v8;
      v38 = 2048;
      id = nw_connection_get_id();
      _os_log_error_impl(&dword_211AB2000, v17, OS_LOG_TYPE_ERROR, "%s state: %d error: %@ for connection: %llu", buf, 0x26u);

    }
    v10 = 0;
  }
  else
  {
    v11 = (void *)*MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      *(_DWORD *)buf = 136315650;
      v33 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
      v34 = 1024;
      v35 = a2;
      v36 = 2048;
      v37 = nw_connection_get_id();
      _os_log_impl(&dword_211AB2000, v12, OS_LOG_TYPE_DEFAULT, "%s state: %d for connection: %llu", buf, 0x1Cu);

    }
    v8 = 0;
    v10 = 1;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 232), v8);
  v13 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v13 + 83) && *(_QWORD *)(a1 + 32) == *(_QWORD *)(v13 + 40))
  {
    switch((int)a2)
    {
      case 0:
      case 4:
      case 5:
        v14 = (void *)MEMORY[0x24BDD1540];
        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 16, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = *MEMORY[0x24BDD1398];
          v27 = v8;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 16, v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(*(id *)(a1 + 40), "_closeWithError:", v15);
        goto LABEL_16;
      case 1:
        if ((v10 & 1) != 0)
          goto LABEL_24;
        v18 = (void *)MEMORY[0x24BDD1540];
        v30 = *MEMORY[0x24BDD1398];
        v31 = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = 36;
        break;
      case 2:
        if ((v10 & 1) != 0)
          goto LABEL_24;
        v22 = (void *)MEMORY[0x24BDD1540];
        v28 = *MEMORY[0x24BDD1398];
        v29 = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v22;
        v21 = 35;
        break;
      case 3:
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 82) = nw_connection_uses_multipath();
        objc_msgSend(*(id *)(a1 + 40), "_setupStaleConnectionTimer");
        objc_msgSend(*(id *)(a1 + 40), "_invokeOpenCompletionWithError:", 0);
        goto LABEL_24;
      default:
        goto LABEL_24;
    }
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), v21, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v25 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      objc_msgSend(v25, "connectionProvider:receivedIntermediateError:", *(_QWORD *)(a1 + 40), v15);

    }
LABEL_16:

LABEL_24:
    objc_msgSend(*(id *)(a1 + 40), "_addCorrespondingMetricsFromConnection:inState:", *(_QWORD *)(a1 + 32), a2);
  }

}

void __45__SiriCoreNWConnection__configureConnection___block_invoke_22(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  _QWORD *WeakRetained;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t id;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)*MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    *(_DWORD *)buf = 136315650;
    v26 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
    v27 = 1024;
    v28 = a2;
    v29 = 2048;
    id = nw_connection_get_id();
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s viability is %d for connection:%llu", buf, 0x1Cu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    mach_absolute_time();
    AFMachAbsoluteTimeGetTimeInterval();
    v8 = v7;
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = WeakRetained[5];
    if (v10)
    {
      if (v10 == *(_QWORD *)(a1 + 32))
      {
        v11 = nw_connection_copy_connected_path();
        if (v11)
        {
          v12 = v11;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_uses_interface_type(v11, nw_interface_type_other), CFSTR("other"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v13;
          v23[1] = CFSTR("wifi");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_uses_interface_type(v12, nw_interface_type_wifi));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v24[1] = v14;
          v23[2] = CFSTR("cellular");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_uses_interface_type(v12, nw_interface_type_cellular));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v24[2] = v15;
          v23[3] = CFSTR("wired");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_uses_interface_type(v12, nw_interface_type_wired));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v24[3] = v16;
          v23[4] = CFSTR("loopback");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", nw_path_uses_interface_type(v12, nw_interface_type_loopback));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v24[4] = v17;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "setValue:forKey:", v18, CFSTR("interface_type"));
        }
      }
    }
    if ((a2 & 1) != 0)
    {
      if (WeakRetained[19])
        objc_msgSend(WeakRetained, "_cancelConnectionUnviableTimer");
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = 1015;
    }
    else
    {
      if (v8 >= 2.0)
      {
        objc_msgSend(WeakRetained, "_startConnectionUnviableTimer");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 3, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_closeWithError:", v22);

      }
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = 1014;
    }
    objc_msgSend(v19, "logEventWithType:context:", v21, v9);

  }
}

void __45__SiriCoreNWConnection__configureConnection___block_invoke_39(uint64_t a1, int a2)
{
  void *v4;
  const __CFString *v5;
  NSObject *v6;
  _QWORD *WeakRetained;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t id;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)*MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    if (a2)
      v5 = CFSTR("available");
    else
      v5 = CFSTR("not available");
    v6 = v4;
    v8 = 136315650;
    v9 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2048;
    id = nw_connection_get_id();
    _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, "%s better path is %@ for %llu", (uint8_t *)&v8, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
    WeakRetained[20] = mach_absolute_time();

}

uint64_t __45__SiriCoreNWConnection__configureConnection___block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
    _os_log_debug_impl(&dword_211AB2000, v2, OS_LOG_TYPE_DEBUG, "%s read closed", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

uint64_t __45__SiriCoreNWConnection__configureConnection___block_invoke_45(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[SiriCoreNWConnection _configureConnection:]_block_invoke";
    _os_log_debug_impl(&dword_211AB2000, v2, OS_LOG_TYPE_DEBUG, "%s write closed", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

void __88__SiriCoreNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_cancelOpenTimer");
  objc_msgSend(*(id *)(a1 + 32), "_cancelSlowOpenTimer");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 84) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 85) = v4 == 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__SiriCoreNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_configureConnection:", v7);
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 31, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", v6);
  }

}

void __50__SiriCoreNWConnection__setupStaleConnectionTimer__block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FC0];
  v3 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
    v13 = 136315650;
    v14 = "-[SiriCoreNWConnection _setupStaleConnectionTimer]_block_invoke";
    v15 = 2048;
    v16 = v4;
    v17 = 2048;
    v18 = v5;
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_INFO, "%s Checking stale connection. Last counter value %tu current %tu", (uint8_t *)&v13, 0x20u);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  if (*(_QWORD *)(v6 + 24) == v7)
  {
    v8 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "-[SiriCoreNWConnection _setupStaleConnectionTimer]_block_invoke";
      _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, "%s Connection is stale!", (uint8_t *)&v13, 0xCu);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    if (v9 == *(void **)(v10 + 136))
    {
      *(_QWORD *)(v10 + 136) = 0;

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 30, 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connectionProvider:receivedError:", *(_QWORD *)(a1 + 32), v11);

  }
  else
  {
    *(_QWORD *)(v6 + 24) = v7;
  }
}

void __53__SiriCoreNWConnection__startConnectionUnviableTimer__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t id;
  void *v8;
  _QWORD *v9;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancelConnectionUnviableTimer");

  v4 = objc_loadWeakRetained(v2);
  v5 = v4;
  if (v4)
  {
    if (v4[5])
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = v4;
      id = nw_connection_get_id();
      v5 = v9;
      if (v6 == id)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 3, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_closeWithError:", v8);

        v5 = v9;
      }
    }
    v5[20] = 0;
  }

}

+ (void)getMetricsContext:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

@end
