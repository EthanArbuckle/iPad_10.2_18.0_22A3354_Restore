@implementation SiriCoreNetworkSessionProvider

- (SiriCoreNetworkSessionProvider)initWithQueue:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  dispatch_group_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriCoreNetworkSessionProvider;
  v6 = -[SiriCoreNetworkSessionProvider init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD1710]);
    v8 = (void *)*((_QWORD *)v6 + 11);
    *((_QWORD *)v6 + 11) = v7;

    objc_msgSend(*((id *)v6 + 11), "setUnderlyingQueue:", v5);
    objc_msgSend(*((id *)v6 + 11), "setMaxConcurrentOperationCount:", 1);
    objc_storeStrong((id *)v6 + 16, a3);
    v9 = dispatch_group_create();
    v10 = (void *)*((_QWORD *)v6 + 1298);
    *((_QWORD *)v6 + 1298) = v9;

    dispatch_group_enter(*((dispatch_group_t *)v6 + 1298));
    *((_BYTE *)v6 + 10392) = 1;
  }

  return (SiriCoreNetworkSessionProvider *)v6;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)headerDataWithForceReconnect:(BOOL)a3
{
  return 0;
}

- (BOOL)shouldFallbackQuickly
{
  return 0;
}

- (void)_invokeOpenCompletionWithError:(id)a3
{
  id completion_block;
  id v5;
  id v6;
  void (**v7)(id, id);

  completion_block = self->_completion_block;
  if (completion_block)
  {
    v5 = a3;
    v7 = (void (**)(id, id))MEMORY[0x212BE6580](completion_block);
    v6 = self->_completion_block;
    self->_completion_block = 0;

    v7[2](v7, v5);
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  NSInputStream *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  NSInputStream *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (NSInputStream *)a3;
  v7 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[SiriCoreNetworkSessionProvider stream:handleEvent:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_211AB2000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %lu", (uint8_t *)&v13, 0x20u);
  }
  if (self->_inputStream == v6)
  {
    if (a4 == 16 || a4 == 8)
    {
      -[NSInputStream streamError](v6, "streamError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 8, 0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;

      -[SiriCoreNetworkSessionProvider _closeWithError:](self, "_closeWithError:", v11);
      -[SiriCoreNetworkSessionProvider delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "connectionProvider:receivedError:", self, v11);

    }
    else if (a4 == 2 && self->_waitingOnReadGroup)
    {
      dispatch_group_leave((dispatch_group_t)self->_readGroup);
      self->_waitingOnReadGroup = 0;
    }
  }

}

- (void)URLSession:(id)a3 betterRouteDiscoveredForStreamTask:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SiriCoreNetworkSessionProvider URLSession:betterRouteDiscoveredForStreamTask:]";
    _os_log_impl(&dword_211AB2000, v4, OS_LOG_TYPE_INFO, "%s NSURLSession better route available. Not supported.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  NSURLSession *v6;
  NSURLSession *v7;
  os_log_t *v8;
  NSObject *v9;
  NSURLSession *urlSession;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  NSURLSession *v15;
  __int16 v16;
  NSURLSession *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (NSURLSession *)a3;
  v7 = (NSURLSession *)a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FC0];
  v9 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v12 = 136315650;
    v13 = "-[SiriCoreNetworkSessionProvider URLSession:didBecomeInvalidWithError:]";
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v12, 0x20u);
  }
  urlSession = self->_urlSession;
  if (urlSession == v6)
  {
    self->_urlSession = 0;

    -[SiriCoreNetworkSessionProvider _invokeOpenCompletionWithError:](self, "_invokeOpenCompletionWithError:", v7);
  }
  else
  {
    v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      v12 = 136315650;
      v13 = "-[SiriCoreNetworkSessionProvider URLSession:didBecomeInvalidWithError:]";
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = urlSession;
      _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_INFO, "%s Ignoring session callback from session %@ current session %@", (uint8_t *)&v12, 0x20u);
    }
  }

}

- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6
{
  NSURLSession *v10;
  id v11;
  id v12;
  id v13;
  NSURLSession *urlSession;
  NSObject *v15;
  NSObject *queue;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, int);
  void *v23;
  id v24;
  id location;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  NSURLSession *v29;
  __int16 v30;
  NSURLSession *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = (NSURLSession *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  urlSession = self->_urlSession;
  if (urlSession == v10)
  {
    self->_urlSession = 0;

    queue = self->_queue;
    if (queue)
      dispatch_assert_queue_V2(queue);
    if (v12 && v13)
    {
      objc_msgSend(v12, "setDelegate:", self);
      objc_msgSend(v13, "setDelegate:", self);
      objc_msgSend(v12, "open");
      objc_msgSend(v13, "open");
      objc_msgSend(v12, "streamError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(v13, "streamError");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          if (self->_queue
            || (objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 20, 0), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_storeStrong((id *)&self->_inputStream, a5);
            objc_storeStrong((id *)&self->_outputStream, a6);
            MEMORY[0x212BE5B48](self->_inputStream, self->_queue);
            MEMORY[0x212BE5B84](self->_outputStream, self->_queue);
            objc_initWeak(&location, self);
            v20 = MEMORY[0x24BDAC760];
            v21 = 3221225472;
            v22 = __90__SiriCoreNetworkSessionProvider_URLSession_streamTask_didBecomeInputStream_outputStream___block_invoke;
            v23 = &unk_24CCE5EC8;
            objc_copyWeak(&v24, &location);
            CFWriteStreamSetProperty((CFWriteStreamRef)v13, (CFStreamPropertyKey)*MEMORY[0x24BDB7618], &v20);
            objc_msgSend(v13, "propertyForKey:", *MEMORY[0x24BDB7718], v20, v21, v22, v23);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            self->_isMPTCP = objc_msgSend(v18, "BOOLValue");

            v19 = *MEMORY[0x24BE08FC0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v27 = "-[SiriCoreNetworkSessionProvider URLSession:streamTask:didBecomeInputStream:outputStream:]";
              _os_log_impl(&dword_211AB2000, v19, OS_LOG_TYPE_INFO, "%s Connection became InputStreamOutputStream", buf, 0xCu);
            }
            objc_destroyWeak(&v24);
            objc_destroyWeak(&location);
            -[SiriCoreNetworkSessionProvider _cancelOpenTimer](self, "_cancelOpenTimer");
            goto LABEL_17;
          }
        }
      }
      objc_msgSend(v12, "close");
      objc_msgSend(v13, "close");
      -[SiriCoreNetworkSessionProvider _cancelOpenTimer](self, "_cancelOpenTimer");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreNetworkSessionProvider _cancelOpenTimer](self, "_cancelOpenTimer");
      if (!v17)
      {
LABEL_17:
        -[SiriCoreNetworkSessionProvider _setupStaleConnectionTimer](self, "_setupStaleConnectionTimer");
        v17 = 0;
      }
    }
    -[SiriCoreNetworkSessionProvider _invokeOpenCompletionWithError:](self, "_invokeOpenCompletionWithError:", v17);

    goto LABEL_19;
  }
  v15 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[SiriCoreNetworkSessionProvider URLSession:streamTask:didBecomeInputStream:outputStream:]";
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = urlSession;
    _os_log_impl(&dword_211AB2000, v15, OS_LOG_TYPE_INFO, "%s Ignoring session callback from session %@ current session %@", buf, 0x20u);
  }
LABEL_19:

}

- (void)_streamDidBecomeUnviable
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SiriCoreNetworkSessionProvider _streamDidBecomeUnviable]";
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreNetworkSessionProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionProvider:receivedError:", self, v4);

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
  handler[2] = __60__SiriCoreNetworkSessionProvider__setupStaleConnectionTimer__block_invoke;
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

- (BOOL)supportsInitialPayload
{
  return 1;
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
  SiriCoreNetworkSessionProvider *v10;

  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  v4 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__SiriCoreNetworkSessionProvider__setupOpenTimer__block_invoke;
  v8[3] = &unk_24CCE6BD0;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_source_set_event_handler(v5, v8);
  dispatch_resume(v5);
  openTimer = self->_openTimer;
  self->_openTimer = (OS_dispatch_source *)v5;
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

- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6
{
  SiriCoreNetworkSessionProvider *v10;
  id v11;
  id v12;
  void *v13;
  SAConnectionPolicyRoute *v14;
  _BOOL4 prefersWWAN;
  NSURL *v16;
  NSURL *url;
  NSString *v18;
  NSString *connectionId;
  SAConnectionPolicyRoute *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  SiriCoreNetworkSessionProvider *v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  SiriCoreNetworkSessionProvider *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  SAConnectionPolicy *policy;
  void *v39;
  int ShouldUseTFO;
  int v41;
  _BOOL4 v42;
  int v43;
  void *v44;
  os_log_t *v45;
  void *v46;
  SiriCoreNetworkSessionProvider *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  os_log_t v60;
  NSObject *v61;
  SiriCoreNetworkSessionProvider *v62;
  void *v63;
  void *v64;
  NSURLSessionStreamTask *v65;
  NSObject *v66;
  const __CFString *v67;
  OS_dispatch_source *v68;
  OS_dispatch_source *v69;
  void *v70;
  id completion_block;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSURLSessionStreamTask *streamTask;
  NSURLSessionStreamTask *v76;
  void *v77;
  SiriCoreNetworkSessionProvider *v78;
  int v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  unsigned int v84;
  id v85;
  void *v86;
  _BOOL4 connectByPOPEnabled;
  SAConnectionPolicyRoute *v88;
  SiriCoreNetworkSessionProvider *v89;
  SiriCoreNetworkSessionProvider *v90;
  _QWORD v91[4];
  OS_dispatch_source *v92;
  SiriCoreNetworkSessionProvider *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint8_t buf[4];
  const char *v98;
  __int16 v99;
  SiriCoreNetworkSessionProvider *v100;
  __int16 v101;
  NSURLSessionStreamTask *v102;
  __int16 v103;
  _BYTE v104[24];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v89 = (SiriCoreNetworkSessionProvider *)a3;
  v10 = (SiriCoreNetworkSessionProvider *)a4;
  v11 = a5;
  v12 = a6;
  kdebug_trace();
  if (self->_completion_block)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 18, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreNetworkSessionProvider _invokeOpenCompletionWithError:](self, "_invokeOpenCompletionWithError:", v13);

  }
  -[SiriCoreNetworkSessionProvider _setupOpenTimer](self, "_setupOpenTimer");
  v14 = self->_route;
  prefersWWAN = self->_prefersWWAN;
  v16 = (NSURL *)-[SiriCoreNetworkSessionProvider copy](v89, "copy");
  url = self->_url;
  self->_url = v16;

  v18 = (NSString *)-[SiriCoreNetworkSessionProvider copy](v10, "copy");
  connectionId = self->_connectionId;
  self->_connectionId = v18;

  self->_isCanceled = 0;
  v20 = v14;
  -[SiriCoreNetworkSessionProvider host](v89, "host");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAConnectionPolicyRoute resolver](v20, "resolver");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v20;
  -[SAConnectionPolicyRoute cname](v20, "cname");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (void *)v23;
  else
    v25 = v21;
  v90 = v25;

  if (v22)
  {
    v26 = v10;
    v27 = v11;
    v28 = v12;
    -[SAConnectionPolicyRoute type](v20, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BE81AE0]);

    if (v30)
    {
      -[SAConnectionPolicyRoute host](v20, "host");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v31)
        v33 = (void *)v31;
      else
        v33 = v21;
      v34 = v33;

      v90 = v34;
    }
    v12 = v28;
    v11 = v27;
    v10 = v26;
  }

  if (!v90)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 10, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      goto LABEL_71;
  }
  if (self->_isCanceled)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 11, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      goto LABEL_71;
  }
  connectByPOPEnabled = self->_connectByPOPEnabled;
  -[SiriCoreNetworkSessionProvider port](v89, "port");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreNetworkSessionProvider scheme](v89, "scheme");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v82, "caseInsensitiveCompare:", CFSTR("https"));
  policy = self->_policy;
  if (policy)
  {
    -[SAConnectionPolicy enableTcpFastOpen](policy, "enableTcpFastOpen");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    ShouldUseTFO = objc_msgSend(v39, "BOOLValue");

  }
  else if (AFIsInternalInstall() && (AFIsNano() & 1) == 0)
  {
    ShouldUseTFO = _AFPreferencesShouldUseTFO();
  }
  else
  {
    ShouldUseTFO = 0;
  }
  if (v37)
    v41 = 0;
  else
    v41 = ShouldUseTFO;
  v79 = v41;
  v80 = ShouldUseTFO;
  v86 = v12;
  v42 = prefersWWAN;
  if (v36)
  {
    v84 = objc_msgSend(v36, "intValue");
  }
  else
  {
    if (v37)
      v43 = 80;
    else
      v43 = 443;
    v84 = v43;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (os_log_t *)MEMORY[0x24BE08FC0];
  v46 = (void *)*MEMORY[0x24BE08FC0];
  v85 = v11;
  v83 = v36;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v47 = v10;
    v48 = (void *)MEMORY[0x24BDD16E0];
    v49 = v46;
    v50 = v48;
    v10 = v47;
    v11 = v85;
    objc_msgSend(v50, "numberWithBool:", v37 == 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (os_log_t *)MEMORY[0x24BE08FC0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v42);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
    v99 = 2112;
    v100 = v89;
    v101 = 2112;
    v102 = (NSURLSessionStreamTask *)v90;
    v103 = 1024;
    *(_DWORD *)v104 = v84;
    *(_WORD *)&v104[4] = 2112;
    *(_QWORD *)&v104[6] = v51;
    *(_WORD *)&v104[14] = 2112;
    *(_QWORD *)&v104[16] = v52;
    _os_log_impl(&dword_211AB2000, v49, OS_LOG_TYPE_INFO, "%s Connecting to %@ (resolved host = %@, port = %u, secure = %@, WWAN preferred %@)", buf, 0x3Au);

  }
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setAllowsCellularAccess:", 1);
  objc_msgSend(v53, "setNetworkServiceType:", 4);
  v54 = *MEMORY[0x24BDBD270];
  objc_msgSend(v44, "setObject:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDB7670]);
  objc_msgSend(v44, "setObject:forKey:", v54, *MEMORY[0x24BDB7708]);
  if (v42)
  {
    v55 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      _os_log_impl(&dword_211AB2000, v55, OS_LOG_TYPE_INFO, "%s Preferring WWAN", buf, 0xCu);
    }
    objc_msgSend(v53, "set_CTDataConnectionServiceType:", *MEMORY[0x24BDC2A68]);
  }
  else if ((AFIsHorseman() & 1) == 0)
  {
    -[SAConnectionPolicyRoute mptcp](v88, "mptcp");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v56)
      v58 = objc_msgSend(v56, "BOOLValue");
    else
      v58 = 1;
    objc_msgSend(v53, "set_allowsMultipathTCP:", v58);
    objc_msgSend(v53, "setMultipathServiceType:", 2);

  }
  if (connectByPOPEnabled)
  {
    v59 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      _os_log_impl(&dword_211AB2000, v59, OS_LOG_TYPE_INFO, "%s Did not enable TLS. Using POP Connection method.", buf, 0xCu);
    }
    objc_msgSend(v53, "set_sourceApplicationSecondaryIdentifier:", CFSTR("ace.siri.apple.com"));
  }
  else if (v37)
  {
    v74 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      v99 = 2112;
      v100 = v89;
      _os_log_impl(&dword_211AB2000, v74, OS_LOG_TYPE_INFO, "%s Connecting to insecure ace server: %@", buf, 0x16u);
    }
  }
  else
  {
    v95 = *MEMORY[0x24BDB7668];
    v96 = v54;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKey:", v77, *MEMORY[0x24BDB77B0]);
    objc_msgSend(v53, "set_allowsTLSSessionTickets:", 1);
    if (v80)
      objc_msgSend(v53, "set_allowsTCPFastOpen:", 1);

  }
  v81 = v44;
  objc_msgSend(v53, "set_socketStreamProperties:", v44);
  objc_msgSend(v53, "set_allowTCPIOConnectionStreamTask:", 1);
  v60 = *v45;
  if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
  {
    v61 = v60;
    objc_msgSend(v53, "_socketStreamProperties");
    v62 = (SiriCoreNetworkSessionProvider *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
    v99 = 2112;
    v100 = v62;
    _os_log_impl(&dword_211AB2000, v61, OS_LOG_TYPE_INFO, "%s stream properties %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v53, self, self->_opQueue);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v90
    && (objc_msgSend(v63, "streamTaskWithHostName:port:", v90, v84),
        v65 = (NSURLSessionStreamTask *)objc_claimAutoreleasedReturnValue(),
        objc_storeStrong((id *)&self->_resolvedHost, v90),
        v65))
  {
    v66 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      v67 = CFSTR("No TFO");
      *(_DWORD *)buf = 136316162;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      v99 = 2112;
      v100 = self;
      if (v79)
        v67 = CFSTR("Enabling TFO");
      v101 = 2112;
      v102 = v65;
      v103 = 2112;
      *(_QWORD *)v104 = v90;
      *(_WORD *)&v104[8] = 2112;
      *(_QWORD *)&v104[10] = v67;
      _os_log_impl(&dword_211AB2000, v66, OS_LOG_TYPE_INFO, "%s self %@, task: %@ host:%@ %@", buf, 0x34u);
    }
    v68 = self->_openTimer;
    self->_isEstablishing = 1;
    v91[0] = MEMORY[0x24BDAC760];
    v91[1] = 3221225472;
    v91[2] = __98__SiriCoreNetworkSessionProvider_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke;
    v91[3] = &unk_24CCE5EF0;
    v69 = v68;
    v92 = v69;
    v93 = self;
    v94 = v86;
    v70 = (void *)MEMORY[0x212BE6580](v91);
    completion_block = self->_completion_block;
    self->_completion_block = v70;

    -[NSURLSessionStreamTask set_initialDataPayload:](v65, "set_initialDataPayload:", v85);
    v78 = v10;
    if (connectByPOPEnabled)
    {
      if (v10)
        NetworkServiceProxySetServiceNameForConnection();
      v72 = *v45;
      if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
        v99 = 2112;
        v100 = v78;
        _os_log_impl(&dword_211AB2000, v72, OS_LOG_TYPE_INFO, "%s Setting NSPServiceName to %@", buf, 0x16u);
      }
    }
    else if (!v37)
    {
      -[NSURLSessionStreamTask startSecureConnection](v65, "startSecureConnection");
    }
    -[NSURLSessionStreamTask resume](v65, "resume");
    -[NSURLSessionStreamTask captureStreams](v65, "captureStreams");
    objc_msgSend(v64, "finishTasksAndInvalidate");
    streamTask = self->_streamTask;
    self->_streamTask = v65;
    v76 = v65;

    objc_storeStrong((id *)&self->_urlSession, v64);
    v35 = 0;
    v10 = v78;
    v11 = v85;
  }
  else
  {
    v73 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      v99 = 2112;
      v100 = v90;
      _os_log_impl(&dword_211AB2000, v73, OS_LOG_TYPE_INFO, "%s Failed to create task for host:%@", buf, 0x16u);
    }
    -[SiriCoreNetworkSessionProvider _cancelOpenTimer](self, "_cancelOpenTimer");
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 13, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "invalidateAndCancel");
  }

  v12 = v86;
  if (v35)
  {
LABEL_71:
    (*((void (**)(id, void *))v12 + 2))(v12, v35);

  }
}

- (BOOL)hasActiveConnection
{
  return self->_streamTask != 0;
}

- (id)connectionType
{
  SiriCoreConnectionType *connectionType;
  NSOutputStream *v4;
  _BOOL4 isMPTCP;
  void *v6;
  uint64_t v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  SiriCoreConnectionType *v14;
  SiriCoreConnectionType *v15;
  SiriCoreConnectionType *v16;
  NSString *v17;
  NSString *interfaceName;
  NSString *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  SiriCoreConnectionType *v23;
  SiriCoreConnectionType *v24;
  int v26;
  const char *v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (self->_urlSession)
  {
    connectionType = self->_connectionType;
    if (connectionType)
    {
LABEL_21:
      v16 = connectionType;
      return v16;
    }
    v4 = self->_outputStream;
    isMPTCP = self->_isMPTCP;
    -[NSOutputStream propertyForKey:](v4, "propertyForKey:", *MEMORY[0x24BDB7710]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = (os_log_t *)MEMORY[0x24BE08FC0];
    v9 = (void *)*MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = v9;
      objc_msgSend(v10, "numberWithBool:", isMPTCP);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315650;
      v27 = "-[SiriCoreNetworkSessionProvider connectionType]";
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_INFO, "%s Connection is MPTCP %@ isCellular %@", (uint8_t *)&v26, 0x20u);

    }
    if (isMPTCP)
    {
      v14 = -[SiriCoreConnectionType initWithTechnology:]([SiriCoreConnectionType alloc], "initWithTechnology:", 3000);
    }
    else
    {
      -[NSOutputStream propertyForKey:](v4, "propertyForKey:", *MEMORY[0x24BDB7760]);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      interfaceName = self->_interfaceName;
      self->_interfaceName = v17;

      v19 = self->_interfaceName;
      v20 = *v8;
      v21 = os_log_type_enabled(*v8, OS_LOG_TYPE_INFO);
      if (v19)
      {
        if (v21)
        {
          v26 = 136315394;
          v27 = "-[SiriCoreNetworkSessionProvider connectionType]";
          v28 = 2112;
          v29 = v19;
          _os_log_impl(&dword_211AB2000, v20, OS_LOG_TYPE_INFO, "%s Interface name is %@.", (uint8_t *)&v26, 0x16u);
          v19 = self->_interfaceName;
        }
        self->_interfaceIndex = if_nametoindex(-[NSString UTF8String](objc_retainAutorelease(v19), "UTF8String"));
      }
      else
      {
        if (v21)
        {
          v26 = 136315138;
          v27 = "-[SiriCoreNetworkSessionProvider connectionType]";
          _os_log_impl(&dword_211AB2000, v20, OS_LOG_TYPE_INFO, "%s No interface name found.", (uint8_t *)&v26, 0xCu);
        }
        if (self->_connectByPOPEnabled)
        {
          v22 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
          {
            v26 = 136315138;
            v27 = "-[SiriCoreNetworkSessionProvider connectionType]";
            _os_log_impl(&dword_211AB2000, v22, OS_LOG_TYPE_INFO, "%s Possible POP connection.", (uint8_t *)&v26, 0xCu);
          }
          v23 = -[SiriCoreConnectionType initWithTechnology:]([SiriCoreConnectionType alloc], "initWithTechnology:", 3003);
          v24 = self->_connectionType;
          self->_connectionType = v23;

        }
      }
      if (self->_connectionType)
        goto LABEL_20;
      +[SiriCoreNetworkManager connectionTypeForInterfaceName:isCellular:](SiriCoreNetworkManager, "connectionTypeForInterfaceName:isCellular:", self->_interfaceName, v7);
      v14 = (SiriCoreConnectionType *)objc_claimAutoreleasedReturnValue();
    }
    v15 = self->_connectionType;
    self->_connectionType = v14;

LABEL_20:
    connectionType = self->_connectionType;
    goto LABEL_21;
  }
  v16 = -[SiriCoreConnectionType initWithTechnology:]([SiriCoreConnectionType alloc], "initWithTechnology:", 0);
  return v16;
}

- (id)analysisInfo
{
  SiriCoreAceConnectionAnalysisInfo *v3;
  NSURL *url;
  uint64_t interfaceIndex;
  _BOOL8 prefersWWAN;
  void *v7;
  void *v8;
  SiriCoreAceConnectionAnalysisInfo *v9;

  v3 = [SiriCoreAceConnectionAnalysisInfo alloc];
  url = self->_url;
  interfaceIndex = self->_interfaceIndex;
  prefersWWAN = self->_prefersWWAN;
  -[SiriCoreNetworkSessionProvider connectionType](self, "connectionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAConnectionPolicy policyId](self->_policy, "policyId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SiriCoreAceConnectionAnalysisInfo initWithConnectionURL:interfaceIndex:sendBufferSize:wwanPreferred:connectionType:policyId:](v3, "initWithConnectionURL:interfaceIndex:sendBufferSize:wwanPreferred:connectionType:policyId:", url, interfaceIndex, &unk_24CCF53A8, prefersWWAN, v7, v8);

  return v9;
}

- (void)updateConnectionMetrics:(id)a3 completion:(id)a4
{
  objc_msgSend(a3, "setConnectionMetricsFromStream:isPop:withCompletion:", self->_outputStream, self->_connectByPOPEnabled, a4);
}

- (BOOL)providerStatsIndicatePoorLinkQuality
{
  NSOutputStream *outputStream;
  NSOutputStream *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  NSOutputStream *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  outputStream = self->_outputStream;
  if (!outputStream)
    return 0;
  v3 = outputStream;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[NSOutputStream propertyForKey:](v3, "propertyForKey:", *MEMORY[0x24BDB7650]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __70__SiriCoreNetworkSessionProvider_providerStatsIndicatePoorLinkQuality__block_invoke;
    v8[3] = &unk_24CCE5F18;
    v8[4] = &v9;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  }
  if (*((_BYTE *)v10 + 24))
  {
    v5 = 1;
  }
  else
  {
    v6 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SiriCoreNetworkSessionProvider providerStatsIndicatePoorLinkQuality]";
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, "%s %@ has poor quality.", buf, 0x16u);
      v5 = *((_BYTE *)v10 + 24) != 0;
    }
    else
    {
      v5 = 0;
    }
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

- (id)resolvedHost
{
  return self->_resolvedHost;
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SiriCoreNetworkSessionProvider_close__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_closeWithError:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  NSURLSession *urlSession;
  NSOperationQueue *opQueue;
  NSInputStream *inputStream;
  NSInputStream *v10;
  NSOutputStream *outputStream;
  NSOutputStream *v12;
  NSURLSessionStreamTask *streamTask;
  NSObject *v14;
  NSURLSession *v15;
  NSString *interfaceName;
  NSString *resolvedHost;
  NSURL *url;
  NSString *connectionId;
  SiriCoreConnectionType *connectionType;
  SAConnectionPolicyRoute *route;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FC0];
  v6 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v22 = 136315138;
    v23 = "-[SiriCoreNetworkSessionProvider _closeWithError:]";
    _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v22, 0xCu);
  }
  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  urlSession = self->_urlSession;
  self->_urlSession = 0;

  -[NSOperationQueue cancelAllOperations](self->_opQueue, "cancelAllOperations");
  opQueue = self->_opQueue;
  self->_opQueue = 0;

  inputStream = self->_inputStream;
  if (inputStream)
  {
    -[NSInputStream close](inputStream, "close");
    v10 = self->_inputStream;
    self->_inputStream = 0;

  }
  else
  {
    -[NSURLSessionStreamTask closeRead](self->_streamTask, "closeRead");
  }
  if (self->_waitingOnReadGroup)
  {
    dispatch_group_leave((dispatch_group_t)self->_readGroup);
    self->_waitingOnReadGroup = 0;
  }
  outputStream = self->_outputStream;
  if (outputStream)
  {
    -[NSOutputStream close](outputStream, "close");
    v12 = self->_outputStream;
    self->_outputStream = 0;

  }
  else
  {
    -[NSURLSessionStreamTask closeWrite](self->_streamTask, "closeWrite");
  }
  streamTask = self->_streamTask;
  self->_streamTask = 0;

  -[SiriCoreNetworkSessionProvider _cancelOpenTimer](self, "_cancelOpenTimer");
  -[SiriCoreNetworkSessionProvider _cancelStaleConnectionTimer](self, "_cancelStaleConnectionTimer");
  if (self->_completion_block)
  {
    v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315138;
      v23 = "-[SiriCoreNetworkSessionProvider _closeWithError:]";
      _os_log_error_impl(&dword_211AB2000, v14, OS_LOG_TYPE_ERROR, "%s Invoking open completion on close", (uint8_t *)&v22, 0xCu);
      if (v4)
        goto LABEL_15;
    }
    else if (v4)
    {
LABEL_15:
      -[SiriCoreNetworkSessionProvider _invokeOpenCompletionWithError:](self, "_invokeOpenCompletionWithError:", v4);
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 17, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:
  v15 = self->_urlSession;
  self->_urlSession = 0;

  self->_interfaceIndex = 0;
  interfaceName = self->_interfaceName;
  self->_interfaceName = 0;

  self->_isCanceled = 1;
  resolvedHost = self->_resolvedHost;
  self->_resolvedHost = 0;

  url = self->_url;
  self->_url = 0;

  connectionId = self->_connectionId;
  self->_connectionId = 0;

  connectionType = self->_connectionType;
  self->_connectionType = 0;

  route = self->_route;
  self->_route = 0;

}

- (BOOL)isPeerConnectionError:(id)a3
{
  return 0;
}

- (BOOL)isPeerNotNearbyError:(id)a3
{
  return 0;
}

- (BOOL)shouldFallbackFromError:(id)a3
{
  return 1;
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

- (void)readData:(id)a3
{
  id v4;
  NSObject *readGroup;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  readGroup = self->_readGroup;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SiriCoreNetworkSessionProvider_readData___block_invoke;
  v8[3] = &unk_24CCE6758;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(readGroup, queue, v8);

}

- (void)writeData:(id)a3 completion:(id)a4
{
  NSObject *v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  if (self->_outputStream)
  {
    ++self->_readWriteCounter;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__SiriCoreNetworkSessionProvider_writeData_completion___block_invoke;
    v10[3] = &unk_24CCE5F40;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_data_apply(v6, v10);
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 11, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v12[5];
  v12[5] = v8;

  if (v7)
LABEL_5:
    v7[2](v7, v12[5]);
LABEL_6:
  _Block_object_dispose(&v11, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staleConnectionTimer, 0);
  objc_storeStrong((id *)&self->_openTimer, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_readGroup, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_resolvedHost, 0);
  objc_storeStrong(&self->_completion_block, 0);
  objc_storeStrong((id *)&self->_streamTask, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __55__SiriCoreNetworkSessionProvider_writeData_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  void *v7;
  void *v8;

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 10400), "write:maxLength:", a4, a5);
  if (v6 < 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 10400), "streamError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 26, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
    if (!v7)

  }
  return v6 >= 0;
}

void __43__SiriCoreNetworkSessionProvider_readData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  size_t v4;
  uint64_t v5;
  dispatch_data_t v6;
  void *v7;
  uint64_t v8;
  dispatch_data_t v9;
  dispatch_data_t v10;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 10424);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 10376);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 11, 0);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v8;
    v6 = 0;
    goto LABEL_7;
  }
  v4 = objc_msgSend(v3, "read:maxLength:", v2 + 136, 10240);
  v5 = *(_QWORD *)(a1 + 32);
  if ((v4 & 0x8000000000000000) != 0)
  {
    objc_msgSend(*(id *)(v5 + 10376), "streamError");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = dispatch_data_create((const void *)(v5 + 136), v4, 0, 0);
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 10384));
  v6 = v9;
  v7 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10392) = 1;
LABEL_7:
  v10 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __39__SiriCoreNetworkSessionProvider_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

void __70__SiriCoreNetworkSessionProvider_providerStatsIndicatePoorLinkQuality__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  _BYTE v20[10];
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v7 = v6;
  v8 = (os_log_t *)MEMORY[0x24BE08FC0];
  if ((*(_BYTE *)v6 & 0xFE) == 4 && *(_QWORD *)(v6 + 92) <= 0x100uLL)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      v17 = 136315394;
      v18 = "-[SiriCoreNetworkSessionProvider providerStatsIndicatePoorLinkQuality]_block_invoke";
      v19 = 2112;
      *(_QWORD *)v20 = v5;
      _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_INFO, "%s Treating %@ as ok quality", (uint8_t *)&v17, 0x16u);
    }
  }
  v10 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    v12 = *(_DWORD *)(v7 + 20);
    v11 = *(_DWORD *)(v7 + 24);
    v13 = *(_DWORD *)(v7 + 28);
    v14 = *(_DWORD *)(v7 + 64);
    v15 = *(_QWORD *)(v7 + 92);
    v16 = *(_QWORD *)(v7 + 284);
    v17 = 136316930;
    v18 = "-[SiriCoreNetworkSessionProvider providerStatsIndicatePoorLinkQuality]_block_invoke";
    v19 = 1024;
    *(_DWORD *)v20 = v11;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v12;
    v21 = 1024;
    v22 = v13;
    v23 = 1024;
    v24 = v14;
    v25 = 2048;
    v26 = v15;
    v27 = 2048;
    v28 = v16;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_INFO, "%s TCP srtt: %d rttcur:%d rttvar:%d sbbytes:%d txunacked:%lld txretransmitpackets:%lld for if=%@", (uint8_t *)&v17, 0x42u);
  }

}

void __98__SiriCoreNetworkSessionProvider_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 10408);
  if (v4 == *(void **)(a1 + 32))
  {
    *(_QWORD *)(v3 + 10408) = 0;

    v3 = *(_QWORD *)(a1 + 40);
  }
  *(_BYTE *)(v3 + 73) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 74) = v5 == 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __49__SiriCoreNetworkSessionProvider__setupOpenTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id WeakRetained;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SiriCoreNetworkSessionProvider _setupOpenTimer]_block_invoke";
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s Open timer firing", (uint8_t *)&v8, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v3 == *(void **)(v4 + 10408))
  {
    *(_QWORD *)(v4 + 10408) = 0;

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 4, 0);
  if (AFDeviceSupportsSiriUOD()
    && (v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8)), v6, v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "connectionProvider:receivedError:", *(_QWORD *)(a1 + 40), v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_closeWithError:", v5);
  }

}

void __60__SiriCoreNetworkSessionProvider__setupStaleConnectionTimer__block_invoke(uint64_t a1)
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
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 10424);
    v13 = 136315650;
    v14 = "-[SiriCoreNetworkSessionProvider _setupStaleConnectionTimer]_block_invoke";
    v15 = 2048;
    v16 = v4;
    v17 = 2048;
    v18 = v5;
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_INFO, "%s Checking stale connection. Last counter value %tu current %tu", (uint8_t *)&v13, 0x20u);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 10424);
  if (*(_QWORD *)(v6 + 24) == v7)
  {
    v8 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "-[SiriCoreNetworkSessionProvider _setupStaleConnectionTimer]_block_invoke";
      _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, "%s Connection is stale!", (uint8_t *)&v13, 0xCu);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    if (v9 == *(void **)(v10 + 10416))
    {
      *(_QWORD *)(v10 + 10416) = 0;

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

void __90__SiriCoreNetworkSessionProvider_URLSession_streamTask_didBecomeInputStream_outputStream___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SiriCoreNetworkSessionProvider URLSession:streamTask:didBecomeInputStream:outputStream:]_block_invoke";
    v9 = 1024;
    v10 = a3;
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Connection viability changed %d", (uint8_t *)&v7, 0x12u);
  }
  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_streamDidBecomeUnviable");

  }
}

+ (void)getMetricsContext:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

@end
