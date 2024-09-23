@implementation SiriNWConnection

- (SiriNWConnection)initWithQueueAndCompletion:(id)a3 reason:(id)a4 callback:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id wfcompletion;
  id v14;
  NSDate *v15;
  NSDate *dateToDisable;
  NSDate *v17;
  NSDate *v18;

  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)&self->_queue, a3);
  v11 = a5;
  objc_storeStrong((id *)&self->_reason, a4);
  v12 = (void *)MEMORY[0x1D17AC9EC](v11);

  wfcompletion = self->_wfcompletion;
  self->_wfcompletion = v12;

  v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v14, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(v14, "dateFromString:", CFSTR("2024-12-30"));
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateToDisable = self->_dateToDisable;
  self->_dateToDisable = v15;

  if (objc_msgSend(v10, "containsString:", CFSTR("expireddate")))
  {
    objc_msgSend(v14, "dateFromString:", CFSTR("2024-01-30"));
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v18 = self->_dateToDisable;
    self->_dateToDisable = v17;

  }
  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[SiriNWConnection _closeWithError:](self, "_closeWithError:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SiriNWConnection;
  -[SiriNWConnection dealloc](&v3, sel_dealloc);
}

- (id)_queue
{
  return self->_queue;
}

- (void)runSiriProbeWithDepth:(int64_t)a3 trafficClass:(unsigned int)a4
{
  NSURL *v6;
  NSURL *v7;
  NSURL *v8;
  NSURL *url;
  int64_t v10;
  NSURL *v11;
  NSURL *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id wfcompletion;
  NSURL *v22;
  _QWORD v23[5];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  self->_network_traffic_class = a4;
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://guzzoni.apple.com:443/ace"));
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v11;
    v10 = 10;
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://guzzoni.apple.com:443/"));
    v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v12;
    v10 = 9;
  }
  else
  {
    if (a3)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://guzzoni.apple.com:443/"));
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v7 = self->_url;
    self->_url = v6;

    if (!-[NSString containsString:](self->_reason, "containsString:", CFSTR("badport")))
    {
      v10 = 8;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://guzzoni.apple.com:80/"));
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v8;
    v10 = 8;
  }

LABEL_9:
  self->_probeLabel = v10;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", self->_dateToDisable);
  if (v14 <= 0.0)
  {
    NSLog(CFSTR("%s: Probing ok to run before %@, it is now %@"), "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]", self->_dateToDisable, v13);
    NSLog(CFSTR("%s: Starting NWConnection to Siri using traffic class %d, depth %ld"), "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]", self->_network_traffic_class, a3);
    v22 = self->_url;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__SiriNWConnection_runSiriProbeWithDepth_trafficClass___block_invoke;
    v23[3] = &unk_1E881D728;
    v23[4] = self;
    -[SiriNWConnection openConnectionForURL:withConnectionId:initialPayload:completion:](self, "openConnectionForURL:withConnectionId:initialPayload:completion:", v22, 0, 0, v23);
  }
  else
  {
    NSLog(CFSTR("%s: Probing has been disabled from running after %@, it is now %@"), "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]", self->_dateToDisable, v13);
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Past Siri Probe Functional Date"), &stru_1E881F240, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy"), 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_wfcompletion)
    {
      v20 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17AC9EC]();
      wfcompletion = self->_wfcompletion;
      self->_wfcompletion = 0;

      ((void (**)(_QWORD, _QWORD, void *))v20)[2](v20, 0, v19);
    }

  }
}

void __55__SiriNWConnection_runSiriProbeWithDepth_trafficClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
    NSLog(CFSTR("%s: openConnectionForURL returned error %@"), "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]_block_invoke", v3);
  else
    NSLog(CFSTR("%s: openConnectionForURL returned success"), "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]_block_invoke");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17AC9EC]();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = 0;

    ((void (**)(_QWORD, BOOL, id))v4)[2](v4, v7 == 0, v7);
  }
  NSLog(CFSTR("%s: openConnectionForURL complete closing connection"), "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]_block_invoke");
  objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", v7);

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
    v7 = (void (**)(id, id))MEMORY[0x1D17AC9EC](openCompletion);
    v6 = self->_openCompletion;
    self->_openCompletion = 0;

    v7[2](v7, v5);
  }
}

- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4
{
  void (**v6)(id, nw_connection_t, void *);
  NSString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSString *v11;
  const char *v12;
  __CFString *v13;
  NSObject *host;
  NSObject *v15;
  nw_connection_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = (void (**)(id, nw_connection_t, void *))a4;
  v7 = self->_resolvedHost;
  -[NSURL port](self->_url, "port");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[NSURL scheme](self->_url, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_usingTLS = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("https")) == 0;

  if (!v9)
  {
    NSLog(CFSTR("%s: Failed to find port in _url %@"), "-[SiriNWConnection _getNWConnectionWithInitialData:completion:]", self->_url);
    if (self->_usingTLS)
      v9 = CFSTR("443");
    else
      v9 = CFSTR("80");
  }
  v11 = objc_retainAutorelease(v7);
  v12 = -[NSString UTF8String](v11, "UTF8String");
  v13 = objc_retainAutorelease(v9);
  host = nw_endpoint_create_host(v12, (const char *)-[__CFString UTF8String](v13, "UTF8String"));
  if (host
    || (objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy.siri"), 22, 0), v18 = (void *)objc_claimAutoreleasedReturnValue(), NSLog(CFSTR("%s: Failed to create endpoint %@"), "-[SiriNWConnection _getNWConnectionWithInitialData:completion:]", v18), !v18))
  {
    -[SiriNWConnection _setParametersForHost:useTLS:initialPayload:](self, "_setParametersForHost:useTLS:initialPayload:", v12, self->_usingTLS, v19);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = nw_connection_create(host, v15);
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "networkActivityAddNWConnection:toActivityWithLabel:", v16, self->_probeLabel);

    if (v16)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy.siri"), 23, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Failed to create connection %@"), "-[SiriNWConnection _getNWConnectionWithInitialData:completion:]", v18);
    }
  }
  else
  {
    v16 = 0;
  }
  v6[2](v6, v16, v18);

}

- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSString *v15;
  NSString *resolvedHost;
  NSURL *v17;
  NSURL *url;
  NSString *v19;
  NSString *connectionId;
  uint64_t v21;
  id v22;
  void *v23;
  id openCompletion;
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSString *)objc_msgSend(v14, "copy");
  resolvedHost = self->_resolvedHost;
  self->_resolvedHost = v15;

  v17 = (NSURL *)objc_msgSend(v13, "copy");
  url = self->_url;
  self->_url = v17;

  v19 = (NSString *)objc_msgSend(v12, "copy");
  connectionId = self->_connectionId;
  self->_connectionId = v19;

  self->_isEstablishing = 1;
  -[SiriNWConnection _setupOpenTimer](self, "_setupOpenTimer");
  v21 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke;
  v26[3] = &unk_1E881DCF8;
  v26[4] = self;
  v27 = v10;
  v22 = v10;
  v23 = (void *)MEMORY[0x1D17AC9EC](v26);
  openCompletion = self->_openCompletion;
  self->_openCompletion = v23;

  v25[0] = v21;
  v25[1] = 3221225472;
  v25[2] = __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2;
  v25[3] = &unk_1E881DD20;
  v25[4] = self;
  -[SiriNWConnection _getNWConnectionWithInitialData:completion:](self, "_getNWConnectionWithInitialData:completion:", v11, v25);

}

void __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_cancelOpenTimer");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 82) = v4 == 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy.siri"), 31, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", v6);
  }

}

- (void)_configureConnection:(id)a3
{
  NSObject *v5;
  NSObject *v6;

  v5 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  objc_storeStrong((id *)&self->_content_context, (id)*MEMORY[0x1E0CCECF8]);
  nw_connection_set_queue(v5, (dispatch_queue_t)self->_queue);
  v6 = v5;
  MEMORY[0x1D17AC698]();
  nw_connection_set_read_close_handler();
  nw_connection_set_write_close_handler();
  nw_connection_start(v6);

}

void __41__SiriNWConnection__configureConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  CFErrorRef v7;
  uint64_t id;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_7;
  }
  v7 = nw_error_copy_cf_error(v5);
  if (!v7)
  {
LABEL_7:
    v9 = 1;
    goto LABEL_8;
  }
  id = *(_QWORD *)(a1 + 32);
  if (id)
    id = nw_connection_get_id();
  NSLog(CFSTR("%s: state: %d error: %@ for connection: %llu"), "-[SiriNWConnection _configureConnection:]_block_invoke", a2, v7, id);
  v9 = 0;
LABEL_8:
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 168), v7);
  v10 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v10 + 80) && *(_QWORD *)(a1 + 32) == *(_QWORD *)(v10 + 40))
  {
    switch((int)a2)
    {
      case 0:
        v16 = nw_connection_get_id();
        NSLog(CFSTR("%s: state: nw_connection_state_invalid for connection: %llu"), "-[SiriNWConnection _configureConnection:]_block_invoke", v16);
        break;
      case 1:
        v17 = nw_connection_get_id();
        NSLog(CFSTR("%s: state: nw_connection_state_waiting for connection: %llu"), "-[SiriNWConnection _configureConnection:]_block_invoke", v17);
        break;
      case 2:
        v18 = nw_connection_get_id();
        NSLog(CFSTR("%s: state: nw_connection_state_preparing for connection: %llu"), "-[SiriNWConnection _configureConnection:]_block_invoke", v18);
        break;
      case 3:
        v11 = nw_connection_get_id();
        NSLog(CFSTR("%s: state: nw_connection_state_ready for connection: %llu"), "-[SiriNWConnection _configureConnection:]_block_invoke", v11);
        objc_msgSend(*(id *)(a1 + 40), "_invokeOpenCompletionWithError:", 0);
        break;
      case 4:
        v19 = nw_connection_get_id();
        NSLog(CFSTR("%s: state: nw_connection_state_failed for connection: %llu"), "-[SiriNWConnection _configureConnection:]_block_invoke", v19);
        break;
      case 5:
        v12 = nw_connection_get_id();
        NSLog(CFSTR("%s: state: nw_connection_state_cancelled for connection: %llu"), "-[SiriNWConnection _configureConnection:]_block_invoke", v12);
        v13 = (void *)MEMORY[0x1E0CB35C8];
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy.siri"), 16, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = *MEMORY[0x1E0CB3388];
          v21[0] = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy.siri"), 16, v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(*(id *)(a1 + 40), "_closeWithError:", v14);

        break;
      default:
        break;
    }
  }
  else
  {
    NSLog(CFSTR("%s: Got nw_connection callback event while _isCanceled %d or for other connection, ignoring"), "-[SiriNWConnection _configureConnection:]_block_invoke", *(unsigned __int8 *)(v10 + 80));
  }

}

uint64_t __41__SiriNWConnection__configureConnection___block_invoke_2(uint64_t a1)
{
  NSLog(CFSTR("%s: read closed"), "-[SiriNWConnection _configureConnection:]_block_invoke_2");
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

uint64_t __41__SiriNWConnection__configureConnection___block_invoke_3(uint64_t a1)
{
  NSLog(CFSTR("%s: write closed"), "-[SiriNWConnection _configureConnection:]_block_invoke_3");
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

- (void)_setupOpenTimer
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  OS_dispatch_source *openTimer;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  SiriNWConnection *v10;

  v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v4 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__SiriNWConnection__setupOpenTimer__block_invoke;
  v8[3] = &unk_1E881C8C0;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_source_set_event_handler(v5, v8);
  dispatch_resume(v5);
  openTimer = self->_openTimer;
  self->_openTimer = (OS_dispatch_source *)v5;
  v7 = v5;

}

void __35__SiriNWConnection__setupOpenTimer__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("%s: Open timer firing"), "-[SiriNWConnection _setupOpenTimer]_block_invoke");
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 == *(void **)(v3 + 120))
  {
    *(_QWORD *)(v3 + 120) = 0;

  }
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168);
  if (v6)
  {
    v9 = *MEMORY[0x1E0CB3388];
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy.siri"), 4, v7);

  }
  else
  {
    v8 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy.siri"), 4, 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "_closeWithError:", v8);

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

- (BOOL)hasActiveConnection
{
  return self->_connection != 0;
}

- (void)_closeWithError:(id)a3
{
  id v4;
  void *v5;
  NSString *resolvedHost;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  OS_nw_connection *connection;
  OS_nw_connection *v11;
  OS_nw_connection *v12;
  OS_nw_content_context *v13;
  OS_nw_content_context *content_context;
  NSArray *v15;
  NSArray *attemptedEndpoints;
  NSObject *v17;
  void *v18;
  int64_t probeLabel;
  NSObject *v20;
  NSObject *queue;
  OS_nw_content_context *v22;
  OS_nw_connection *v23;
  _QWORD block[4];
  OS_nw_connection *v25;
  OS_nw_content_context *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD v30[5];
  id v31;

  v4 = a3;
  v5 = v4;
  if (self->_isCanceled)
  {
    NSLog(CFSTR("%s: is alredy cancelled, returning"), "-[SiriNWConnection _closeWithError:]");
  }
  else
  {
    if (v4)
      NSLog(CFSTR("%s: closing with error %@"), "-[SiriNWConnection _closeWithError:]", v4);
    else
      NSLog(CFSTR("%s: closing"), "-[SiriNWConnection _closeWithError:]");
    resolvedHost = self->_resolvedHost;
    self->_resolvedHost = 0;

    self->_isReady = 0;
    v7 = MEMORY[0x1E0C809B0];
    self->_isCanceled = 1;
    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __36__SiriNWConnection__closeWithError___block_invoke;
    v30[3] = &unk_1E881C8C0;
    v30[4] = self;
    v31 = v5;
    v8 = MEMORY[0x1D17AC9EC](v30);
    v9 = (void *)v8;
    connection = self->_connection;
    if (connection)
    {
      v11 = connection;
      v12 = self->_connection;
      self->_connection = 0;

      v13 = self->_content_context;
      content_context = self->_content_context;
      self->_content_context = 0;

      if (!self->_attemptedEndpoints)
      {
        -[SiriNWConnection _getAttemptedEndpoints](self, "_getAttemptedEndpoints");
        v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
        attemptedEndpoints = self->_attemptedEndpoints;
        self->_attemptedEndpoints = v15;

      }
      v17 = dispatch_group_create();
      dispatch_group_enter(v17);
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      probeLabel = self->_probeLabel;
      v28[0] = v7;
      v28[1] = 3221225472;
      v28[2] = __36__SiriNWConnection__closeWithError___block_invoke_2;
      v28[3] = &unk_1E881C8E8;
      v29 = v17;
      v20 = v17;
      objc_msgSend(v18, "networkActivityRemoveNWConnection:fromActivityWithLabel:completion:", v11, probeLabel, v28);

      queue = self->_queue;
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __36__SiriNWConnection__closeWithError___block_invoke_3;
      block[3] = &unk_1E881D7C8;
      v25 = v11;
      v26 = v13;
      v27 = v9;
      v22 = v13;
      v23 = v11;
      dispatch_group_notify(v20, queue, block);

    }
    else
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }

  }
}

void __36__SiriNWConnection__closeWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[14])
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy.siri"), 17, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v2 = *(_QWORD **)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
    }
    v6 = (id)v4;
    if (v3)
      v5 = v3;
    else
      v5 = v4;
    objc_msgSend(v2, "_invokeOpenCompletionWithError:", v5);

  }
}

void __36__SiriNWConnection__closeWithError___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __36__SiriNWConnection__closeWithError___block_invoke_3(uint64_t a1)
{
  nw_connection_send(*(nw_connection_t *)(a1 + 32), 0, *(nw_content_context_t *)(a1 + 40), 1, &__block_literal_global_6);
  nw_connection_set_read_close_handler();
  nw_connection_set_write_close_handler();
  nw_connection_cancel(*(nw_connection_t *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __36__SiriNWConnection__closeWithError___block_invoke_4(uint64_t a1, void *a2)
{
  NSObject *v2;
  int error_code;
  BOOL v4;
  NSObject *error;

  v2 = a2;
  if (v2)
  {
    error = v2;
    error_code = nw_error_get_error_code(v2);
    v4 = nw_error_get_error_domain(error) == nw_error_domain_posix;
    v2 = error;
    if (!v4 || error_code != 57)
    {
      NSLog(CFSTR("%s: close error is %@"), "-[SiriNWConnection _closeWithError:]_block_invoke_4", error);
      v2 = error;
    }
  }

}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__SiriNWConnection_close__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __25__SiriNWConnection_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

- (id)resolvedHost
{
  return self->_resolvedHost;
}

- (id)_setParametersForHost:(const char *)a3 useTLS:(BOOL)a4 initialPayload:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *secure_tcp;
  size_t v12;
  xpc_object_t v13;
  void *v14;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v18;
  _QWORD v19[4];
  char v20;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1D17AC9EC](*MEMORY[0x1E0CCED20]);
  if (v5)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__SiriNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke;
    v19[3] = &__block_descriptor_33_e42_v16__0__NSObject_OS_nw_protocol_options__8l;
    v20 = 1;
    v10 = MEMORY[0x1D17AC9EC](v19);

    v9 = (void *)v10;
  }
  secure_tcp = nw_parameters_create_secure_tcp(v9, &__block_literal_global_149);
  if (v5)
  {
    v12 = strlen(a3);
    v13 = xpc_data_create(a3, v12);
    nw_parameters_set_tls_session_id();

  }
  v14 = (void *)nw_context_create();
  nw_context_set_scheduling_mode();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_privacy_level();
  nw_context_set_isolate_protocol_cache();
  nw_parameters_set_context();
  nw_parameters_set_data_mode();
  NSLog(CFSTR("%s: Network traffic class used=%u"), "-[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]", self->_network_traffic_class);
  nw_parameters_set_traffic_class();
  nw_parameters_set_indefinite();
  nw_parameters_set_tfo();
  if (v8)
    nw_parameters_set_initial_data_payload();
  NSLog(CFSTR("%s: optimisticDNS"), "-[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]");
  nw_parameters_set_expired_dns_behavior(secure_tcp, nw_parameters_expired_dns_behavior_allow);
  *(_OWORD *)task_info_out = 0u;
  v18 = 0u;
  task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt))
    NSLog(CFSTR("%s: Failed to get task_info"), "-[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]");
  else
    nw_parameters_set_source_application();

  return secure_tcp;
}

void __64__SiriNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke(uint64_t a1, id a2)
{
  NSObject *v3;

  v3 = a2;
  sec_protocol_options_set_tls_tickets_enabled(v3, *(_BYTE *)(a1 + 32));

}

void __64__SiriNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke_2(int a1, nw_protocol_options_t options)
{
  nw_tcp_options_set_no_delay(options, 1);
}

- (id)_getAttemptedEndpoints
{
  NSArray *attemptedEndpoints;
  NSArray *v4;
  OS_nw_connection *v5;
  void *v6;
  uint64_t count;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t description;
  void *v12;

  attemptedEndpoints = self->_attemptedEndpoints;
  if (attemptedEndpoints)
  {
    NSLog(CFSTR("%s: cached %@"), a2, "-[SiriNWConnection _getAttemptedEndpoints]", attemptedEndpoints);
    v4 = self->_attemptedEndpoints;
  }
  else
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_connection;
    if (v5 && !self->_isCanceled)
    {
      v6 = (void *)nw_connection_copy_attempted_endpoint_array();
      if (v6)
      {
        count = nw_array_get_count();
        if (count)
        {
          v8 = count;
          for (i = 0; i != v8; ++i)
          {
            nw_array_get_object_at_index();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            description = nw_endpoint_get_description();
            if (description)
            {
              v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", description);
              if (v12)
                -[NSArray addObject:](v4, "addObject:", v12);

            }
          }
        }
      }

    }
    NSLog(CFSTR("%s: %@"), "-[SiriNWConnection _getAttemptedEndpoints]", v4);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_dateToDisable, 0);
  objc_storeStrong((id *)&self->_mostRecentErrorFromNWConnection, 0);
  objc_storeStrong((id *)&self->_attemptedEndpoints, 0);
  objc_storeStrong((id *)&self->_connectionUnviableTimer, 0);
  objc_storeStrong((id *)&self->_staleConnectionTimer, 0);
  objc_storeStrong((id *)&self->_openTimer, 0);
  objc_storeStrong(&self->_openCompletion, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong(&self->_wfcompletion, 0);
  objc_storeStrong((id *)&self->_content_context, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_resolvedHost, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
