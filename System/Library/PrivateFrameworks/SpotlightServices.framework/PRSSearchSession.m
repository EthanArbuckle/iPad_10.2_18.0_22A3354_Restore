@implementation PRSSearchSession

- (void)activate
{
  PRSSessionController *client;
  PRSSessionController *v4;
  id v5;
  void *v6;
  void *v7;
  PARSession *v8;
  PARSession *session;
  void *v10;
  NSObject *quiescenceTimer;
  CFAbsoluteTime Current;
  NSString *v13;
  NSString *modelL2Version;
  id v15;

  if (!self->_session)
  {
    if (-[PRSSessionController conformsToProtocol:](self->_client, "conformsToProtocol:", &unk_1EF1E33D8))
      client = self->_client;
    else
      client = 0;
    v4 = client;
    v5 = objc_alloc(MEMORY[0x1E0D177E0]);
    -[PRSSessionController applicationNameForUserAgent](self->_client, "applicationNameForUserAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithId:userAgent:factory:", CFSTR("com.apple.spotlight"), v6, v4);

    objc_msgSend(MEMORY[0x1E0D177D8], "sessionWithConfiguration:delegate:startImmediately:", v7, self, 1);
    v8 = (PARSession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v8;

    if (self->_parsecFeedbackAllowed)
      -[PRSFeedbackProxy setListener:](self->_listener, "setListener:", self->_session);

  }
  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[PRSSearchSession warmup](self, "warmup");
  quiescenceTimer = self->_quiescenceTimer;
  if (quiescenceTimer)
    dispatch_suspend(quiescenceTimer);
  -[PRSSessionController sessionStartTime](self->_client, "sessionStartTime");
  if (Current == 0.0)
    Current = CFAbsoluteTimeGetCurrent();
  self->_sessionStartTime = Current;
  -[PARSession start](self->_session, "start");
  +[PRSModelManager sharedModelManager](PRSModelManager, "sharedModelManager");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getL2ModelVersionForClientBundle:", 0);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  modelL2Version = self->_modelL2Version;
  self->_modelL2Version = v13;

}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v7 = a5;
  v8 = a4;
  PRSLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PRSSearchSession session:bag:didLoadWithError:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateFromSession:bag:forClient:error:", self->_session, v8, self->_client, v7);

}

- (BOOL)disableAsTypedSuggestion
{
  void *v2;
  char v3;

  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableAsTypedSuggestion");

  return v3;
}

- (SFFeedbackListener)listener
{
  return (SFFeedbackListener *)self->_listener;
}

- (PRSSearchSession)initWithClient:(id)a3 clientQueue:(id)a4 config:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  PRSFeedbackProxy *v32;
  PRSFeedbackProxy *listener;
  PRSFeedbackProxy *v34;
  PARSession *session;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
  objc_storeStrong((id *)&self->_client, a3);
  objc_storeStrong((id *)&self->_clientQueue, a4);
  -[PRSSearchSession setFeedbackStartTime](self, "setFeedbackStartTime");
  kdebug_trace();
  PRSLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[PRSSearchSession initWithClient:clientQueue:config:session:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

  objc_msgSend(v12, "bag");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    PRSLogCategoryDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[PRSSearchSession initWithClient:clientQueue:config:session:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "updateFromSession:bag:forClient:error:", v12, v22, self->_client, 0);

  }
  v32 = objc_alloc_init(PRSFeedbackProxy);
  -[PRSFeedbackProxy setListener:](v32, "setListener:", v12);
  listener = self->_listener;
  self->_listener = v32;
  v34 = v32;

  session = self->_session;
  self->_session = (PARSession *)v12;

  return self;
}

- (PRSSearchSession)initWithClient:(id)a3 clientQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  PRSSearchSession *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF1E33D8))
    v8 = v6;
  else
    v8 = 0;
  v9 = (objc_class *)MEMORY[0x1E0D177E0];
  v10 = v8;
  v11 = [v9 alloc];
  objc_msgSend(v6, "applicationNameForUserAgent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithId:userAgent:factory:", CFSTR("com.apple.spotlight"), v12, v10);

  objc_msgSend(MEMORY[0x1E0D177D8], "sessionWithConfiguration:delegate:startImmediately:", v13, self, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PRSSearchSession initWithClient:clientQueue:config:session:](self, "initWithClient:clientQueue:config:session:", v6, v7, v13, v14);

  if (v15)
    -[PRSSearchSession setConfiguredSession:](v15, "setConfiguredSession:", 1);

  return v15;
}

- (void)setParsecFeedbackAllowed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  PARSession *session;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  PRSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "forbidden";
    if (v3)
      v6 = "allowed";
    v10 = 136315138;
    v11 = v6;
    _os_log_impl(&dword_1B86C5000, v5, OS_LOG_TYPE_DEFAULT, "Parsec feedback %s", (uint8_t *)&v10, 0xCu);
  }

  -[PRSSearchSession session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setParsecEnabled:", v3);

  self->_parsecFeedbackAllowed = v3;
  if (v3)
    session = self->_session;
  else
    session = 0;
  -[PRSFeedbackProxy setListener:](self->_listener, "setListener:", session);
}

- (id)feedbackListener
{
  return self->_listener;
}

- (id)queryTaskWithString:(id)a3 externalId:(unsigned int)a4 handler:(id)a5 queryContext:(id)a6 queryIdent:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  PRSCoreParsecQueryTask *v14;
  PARSession *session;
  void *v16;
  PRSCoreParsecQueryTask *v17;

  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = [PRSCoreParsecQueryTask alloc];
  session = self->_session;
  -[PRSSearchSession clientQueue](self, "clientQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PRSCoreParsecQueryTask initWithSession:parsecSession:handler:queue:queryContext:queryIdent:](v14, "initWithSession:parsecSession:handler:queue:queryContext:queryIdent:", self, session, v12, v16, v11, a7);

  -[PRSQueryTask setQueryString:](v17, "setQueryString:", v13);
  return v17;
}

- (id)queryTaskWithEngagedSuggestion:(id)a3 externalId:(unsigned int)a4 handler:(id)a5 queryContext:(id)a6 queryIdent:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  PRSCoreParsecQueryTask *v14;
  PARSession *session;
  void *v16;
  PRSCoreParsecQueryTask *v17;
  void *v18;
  void *v19;

  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = [PRSCoreParsecQueryTask alloc];
  session = self->_session;
  -[PRSSearchSession clientQueue](self, "clientQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PRSCoreParsecQueryTask initWithSession:parsecSession:handler:queue:queryContext:queryIdent:](v14, "initWithSession:parsecSession:handler:queue:queryContext:queryIdent:", self, session, v12, v16, v11, a7);

  -[PRSCoreParsecQueryTask setSuggestionResult:](v17, "setSuggestionResult:", v13);
  objc_msgSend(v13, "suggestion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "query");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSQueryTask setQueryString:](v17, "setQueryString:", v19);

  return v17;
}

- (id)getQueryTaskForHandler:(id)a3 scaleFactor:(double)a4 whyQuery:(unint64_t)a5
{
  id v5;

  v5 = a3;
  __assert_rtn("-[PRSSearchSession getQueryTaskForHandler:scaleFactor:whyQuery:]", "PRSSearchSession.m", 503, "0");
}

- (void)deactivate
{
  void *v3;
  int v4;
  NSObject *quiescenceTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  CFAbsoluteTime Current;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  if (-[PRSSearchSession configuredSession](self, "configuredSession"))
  {
    +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "active");

    if (v4)
    {
      quiescenceTimer = self->_quiescenceTimer;
      if (!quiescenceTimer)
      {
        -[PRSSearchSession clientQueue](self, "clientQueue");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 1uLL, 0, v6);
        v8 = self->_quiescenceTimer;
        self->_quiescenceTimer = v7;

        location = 0;
        objc_initWeak(&location, self);
        v9 = self->_quiescenceTimer;
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __30__PRSSearchSession_deactivate__block_invoke;
        v16 = &unk_1E6E53F08;
        objc_copyWeak(&v17, &location);
        dispatch_source_set_event_handler(v9, &v13);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
        quiescenceTimer = self->_quiescenceTimer;
      }
      v10 = dispatch_time(0, 120000000000);
      dispatch_source_set_timer(quiescenceTimer, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)self->_quiescenceTimer);
    }
  }
  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 0);

  -[PRSSessionController sessionStartTime](self->_client, "sessionStartTime");
  if (Current == 0.0)
    Current = CFAbsoluteTimeGetCurrent();
  self->_sessionStartTime = Current;
}

void __30__PRSSearchSession_deactivate__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setSession:", 0);
    objc_msgSend(v2[9], "setListener:", 0);
    WeakRetained = v2;
  }

}

- (void)setFeedbackStartTime
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "setDouble:forKey:", CFSTR("startTime"));

}

- (void)setUserAgentString:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (void)setQueryLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_queryLanguage, a3);
}

- (void)getFTEStringsWithReply:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getFTEStringsWithReply:", v3);

}

- (double)searchRenderTimeout
{
  void *v2;
  double v3;
  double v4;

  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchRenderTimeout");
  v4 = v3;

  return v4;
}

- (double)suggestionsRenderTimeout
{
  void *v2;
  double v3;
  double v4;

  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestionsRenderTimeout");
  v4 = v3;

  return v4;
}

- (void)getCachedQueries:(id *)a3 results:(id *)a4 webSearch:(BOOL)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0C9AA60];
  *a4 = (id)MEMORY[0x1E0C9AA60];
  *a3 = v5;
}

- (NSSet)appBlocklist
{
  void *v2;
  void *v3;

  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appBlocklist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (SSPlistDataReader)cepDictionary
{
  void *v2;
  void *v3;

  +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cep_server_values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SSPlistDataReader *)v3;
}

- (SSPlistDataReader)cannedCEPValues
{
  return (SSPlistDataReader *)+[SSLocalCEP getCEPValuesForCurrentLocale](SSLocalCEP, "getCEPValuesForCurrentLocale");
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (double)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(double)a3
{
  self->_sessionStartTime = a3;
}

- (NSArray)supportedServices
{
  return self->_supportedServices;
}

- (NSString)modelL2Version
{
  return self->_modelL2Version;
}

- (PARSession)session
{
  return (PARSession *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)configuredSession
{
  return self->_configuredSession;
}

- (void)setConfiguredSession:(BOOL)a3
{
  self->_configuredSession = a3;
}

- (OS_dispatch_source)quiescenceTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 128, 1);
}

- (void)setQuiescenceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (double)retryAfter
{
  return self->_retryAfter;
}

- (void)setRetryAfter:(double)a3
{
  self->_retryAfter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quiescenceTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_modelL2Version, 0);
  objc_storeStrong((id *)&self->_supportedServices, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_sqfData, 0);
  objc_storeStrong((id *)&self->_queryLanguage, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

- (void)initWithClient:(uint64_t)a3 clientQueue:(uint64_t)a4 config:(uint64_t)a5 session:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B86C5000, a1, a3, "[BAG] Got bag in instantiation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithClient:(uint64_t)a3 clientQueue:(uint64_t)a4 config:(uint64_t)a5 session:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B86C5000, a1, a3, "[BAG] Instantiating new PAR session", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)session:(uint64_t)a3 bag:(uint64_t)a4 didLoadWithError:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B86C5000, a1, a3, "[BAG] got bag callback", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
