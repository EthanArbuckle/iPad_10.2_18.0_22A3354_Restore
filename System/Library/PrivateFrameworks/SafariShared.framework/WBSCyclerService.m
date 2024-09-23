@implementation WBSCyclerService

- (WBSCyclerService)init
{
  WBSCyclerService *v2;
  uint64_t v3;
  NSXPCListener *xpcListener;
  WBSCyclerService *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSCyclerService;
  v2 = -[WBSCyclerService init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.internal.safaricyclerd"));
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_xpcListener, "resume");
    v2->_maximumIterationCount = 0;
    v5 = v2;
  }

  return v2;
}

- (void)setTestTargetEndpoint:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  WBSCyclerTestTargetProxyController *v11;
  id *p_testTargetProxyController;
  WBSCyclerTestTargetProxyController *testTargetProxyController;
  _QWORD v14[4];
  id v15;
  id location;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[WBSCyclerTestRunner isRunning](self->_testRunner, "isRunning"))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService setTestTargetEndpoint:reply:].cold.1();
    -[WBSCyclerService _errorWithCode:](self, "_errorWithCode:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

  }
  else
  {
    objc_initWeak(&location, self);
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Received endpoint %{public}@ for test target", buf, 0xCu);
    }
    v11 = -[WBSCyclerTestTargetProxyController initWithEndpoint:]([WBSCyclerTestTargetProxyController alloc], "initWithEndpoint:", v6);
    testTargetProxyController = self->_testTargetProxyController;
    p_testTargetProxyController = (id *)&self->_testTargetProxyController;
    *p_testTargetProxyController = v11;

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke;
    v14[3] = &unk_1E4B2BC78;
    objc_copyWeak(&v15, &location);
    objc_msgSend(*p_testTargetProxyController, "setDisconnectionHandler:", v14);
    v7[2](v7, 0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke_2;
  block[3] = &unk_1E4B2BC78;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;
  id v4;
  void *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke_2_cold_1();
    objc_msgSend(WeakRetained[5], "requestStop");
    v3 = WeakRetained[5];
    WeakRetained[5] = 0;

    v4 = WeakRetained[2];
    WeakRetained[2] = 0;

    objc_msgSend(WeakRetained, "_errorWithCode:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_finishedWithResult:error:", 1, v5);

  }
}

- (void)setValue:(id)a3 forConfigurationKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  WBSCyclerService *v12;
  uint64_t v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (-[WBSCyclerTestRunner isRunning](self->_testRunner, "isRunning"))
  {
    v11 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService setValue:forConfigurationKey:reply:].cold.1();
    v12 = self;
    v13 = 0;
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("test-suite")))
    {
      -[WBSCyclerService _setTestSuiteName:reply:](self, "_setTestSuiteName:reply:", v8, v10);
      goto LABEL_15;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("seed")))
    {
      -[WBSCyclerService _setSeed:reply:](self, "_setSeed:reply:", objc_msgSend(v8, "integerValue"), v10);
      goto LABEL_15;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("maximum-iterations")))
    {
      -[WBSCyclerService _setMaximumIterationCount:reply:](self, "_setMaximumIterationCount:reply:", objc_msgSend(v8, "integerValue"), v10);
      goto LABEL_15;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[objc_class setValue:forConfigurationKey:](self->_testSuiteClass, "setValue:forConfigurationKey:", v8, v9))
    {
      v10[2](v10, 0);
      goto LABEL_15;
    }
    v12 = self;
    v13 = 7;
  }
  -[WBSCyclerService _errorWithCode:](v12, "_errorWithCode:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v10)[2](v10, v14);

LABEL_15:
}

- (void)startCyclingFromBeginning:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a3;
  v7 = a4;
  -[WBSCyclerService _startCyclingFromBeginning:](self, "_startCyclingFromBeginning:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (void)stopCyclingWithReply:(id)a3
{
  WBSCyclerTestRunner *testRunner;
  void (**v5)(id, _QWORD);
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  testRunner = self->_testRunner;
  v5 = (void (**)(id, _QWORD))a3;
  if (-[WBSCyclerTestRunner isRunning](testRunner, "isRunning"))
  {
    -[WBSCyclerTestRunner requestStop](self->_testRunner, "requestStop");
    v6 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Submitted request to stop cycling", v9, 2u);
    }
    v5[2](v5, 0);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService stopCyclingWithReply:].cold.1();
    -[WBSCyclerService _errorWithCode:](self, "_errorWithCode:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v5[2](v5, v8);

    v5 = (void (**)(id, _QWORD))v8;
  }

}

- (void)sendRequestToTestSuite:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  WBSCyclerTestRunner *testRunner;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!-[WBSCyclerTestRunner isRunning](self->_testRunner, "isRunning"))
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService sendRequestToTestSuite:reply:].cold.1();
    -[WBSCyclerService _errorWithCode:](self, "_errorWithCode:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
    goto LABEL_7;
  }
  -[WBSCyclerTestRunner handleRequest:completionHandler:](self->_testRunner, "handleRequest:completionHandler:", v6, v7);
  v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    testRunner = self->_testRunner;
    v10 = v8;
    -[WBSCyclerTestRunner testSuite](testRunner, "testSuite");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v6;
    v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Submitted request %{public}@ to test suite %{public}@", (uint8_t *)&v13, 0x16u);

LABEL_7:
  }

}

- (void)fetchStatusWithReply:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  uint64_t v6;
  NSDate *lastTestEnd;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  WBSCyclerStatus *v13;
  void *v14;
  WBSCyclerStatus *v15;

  v4 = (void (**)(id, id, _QWORD))a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WBSCyclerTestSuite iterationCounter](self->_testSuite, "iterationCounter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "iterationCount");

  }
  else
  {
    v6 = 0;
  }
  if (self->_lastTestStart)
  {
    lastTestEnd = self->_lastTestEnd;
    v8 = lastTestEnd;
    if (!lastTestEnd)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;
    -[NSDate timeIntervalSince1970](self->_lastTestStart, "timeIntervalSince1970");
    v12 = v10 - v11;
    if (!lastTestEnd)

  }
  else
  {
    v12 = 0.0;
  }
  v13 = [WBSCyclerStatus alloc];
  NSStringFromClass(self->_testSuiteClass);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WBSCyclerStatus initWithActiveTestSuiteName:seed:isConnectedToTestTarget:isRunning:iterationCount:executionTime:](v13, "initWithActiveTestSuiteName:seed:isConnectedToTestTarget:isRunning:iterationCount:executionTime:", v14, +[WBSCyclerRandomnessUtilities seed](WBSCyclerRandomnessUtilities, "seed"), self->_testTargetProxyController != 0, -[WBSCyclerTestRunner isRunning](self->_testRunner, "isRunning"), v6, v12);

  v4[2](v4, v15, 0);
}

- (void)fetchLogsWithReply:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = (void (**)(id, _QWORD, id))a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v5 = (void *)getOSLogStoreClass_softClass;
  v26 = getOSLogStoreClass_softClass;
  if (!getOSLogStoreClass_softClass)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __getOSLogStoreClass_block_invoke;
    v22[3] = &unk_1E4B2A210;
    v22[4] = &v23;
    __getOSLogStoreClass_block_invoke((uint64_t)v22);
    v5 = (void *)v24[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v23, 8);
  v21 = 0;
  objc_msgSend(v6, "storeWithScope:error:", 1, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v8)
  {
    v9 = v8;
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService fetchLogsWithReply:].cold.1(v10, v9);
    v4[2](v4, 0, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("category = 'Cycler' AND timestamp >= %@"), self->_lastTestStart);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v7, "entriesEnumeratorWithOptions:position:predicate:error:", 0, 0, v11, &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimeZone:", v15);

    objc_msgSend(v14, "setDateFormat:", CFSTR("yyyy-MM-dd hh:mm:ss.SSSZ"));
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __39__WBSCyclerService_fetchLogsWithReply___block_invoke;
    v18[3] = &unk_1E4B38A20;
    v19 = v14;
    v16 = v14;
    objc_msgSend(v13, "safari_mapObjectsUsingBlock:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, id))v4)[2](v4, v17, 0);

  }
}

id __39__WBSCyclerService_fetchLogsWithReply___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "composedMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("[%@] %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fetchLastErrorWithReply:(id)a3
{
  (*((void (**)(id, NSError *))a3 + 2))(a3, self->_lastError);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EE70CCD8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (id)_startCyclingFromBeginning:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  WBSCyclerService *v6;
  uint64_t v7;
  objc_class *testSuiteClass;
  WBSCyclerTestSuite *v9;
  WBSCyclerTestSuite *testSuite;
  NSDate *v11;
  NSDate *lastTestStart;
  NSDate *lastTestEnd;
  NSError *lastError;
  WBSCyclerIterationCounter *v15;
  NSObject *v16;
  WBSCyclerTestSuite *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v22;
  WBSCyclerTestSuite *v23;
  WBSCyclerTestRunner *v24;
  WBSCyclerTestSuite *v25;
  void *v26;
  WBSCyclerTestRunner *v27;
  WBSCyclerTestRunner *testRunner;
  WBSCyclerTestRunner *v29;
  _QWORD v30[5];
  uint8_t buf[4];
  WBSCyclerTestSuite *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  if (-[WBSCyclerTestRunner isRunning](self->_testRunner, "isRunning"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService _startCyclingFromBeginning:].cold.1();
    v6 = self;
    v7 = 0;
LABEL_18:
    -[WBSCyclerService _errorWithCode:](v6, "_errorWithCode:", v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_testTargetProxyController)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService _startCyclingFromBeginning:].cold.2();
    v6 = self;
    v7 = 2;
    goto LABEL_18;
  }
  testSuiteClass = self->_testSuiteClass;
  if (!testSuiteClass)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService _startCyclingFromBeginning:].cold.3();
    v6 = self;
    v7 = 4;
    goto LABEL_18;
  }
  if (v3)
  {
    v9 = (WBSCyclerTestSuite *)objc_alloc_init(testSuiteClass);
    testSuite = self->_testSuite;
    self->_testSuite = v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastTestStart = self->_lastTestStart;
    self->_lastTestStart = v11;

    lastTestEnd = self->_lastTestEnd;
    self->_lastTestEnd = 0;

    lastError = self->_lastError;
    self->_lastError = 0;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = -[WBSCyclerIterationCounter initWithMaximumIterationCount:]([WBSCyclerIterationCounter alloc], "initWithMaximumIterationCount:", self->_maximumIterationCount);
      -[WBSCyclerTestSuite setIterationCounter:](self->_testSuite, "setIterationCounter:", v15);

    }
    +[WBSCyclerRandomnessUtilities reseed](WBSCyclerRandomnessUtilities, "reseed");
    v16 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_testSuite;
      v18 = v16;
      *(_DWORD *)buf = 138543618;
      v32 = v17;
      v33 = 2048;
      v34 = +[WBSCyclerRandomnessUtilities seed](WBSCyclerRandomnessUtilities, "seed");
      _os_log_impl(&dword_1A3D90000, v18, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with seed %lu", buf, 0x16u);

    }
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_testSuite;
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_DEFAULT, "Resuming %{public}@", buf, 0xCu);
    }
  }
  v24 = [WBSCyclerTestRunner alloc];
  v25 = self->_testSuite;
  -[WBSCyclerTestTargetProxyController testTargetProxy](self->_testTargetProxyController, "testTargetProxy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[WBSCyclerTestRunner initWithTestSuite:target:](v24, "initWithTestSuite:target:", v25, v26);
  testRunner = self->_testRunner;
  self->_testRunner = v27;

  v29 = self->_testRunner;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __47__WBSCyclerService__startCyclingFromBeginning___block_invoke;
  v30[3] = &unk_1E4B38A48;
  v30[4] = self;
  -[WBSCyclerTestRunner runWithCompletionHandler:](v29, "runWithCompletionHandler:", v30);
  return 0;
}

uint64_t __47__WBSCyclerService__startCyclingFromBeginning___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedWithResult:error:", a2, a3);
}

- (void)_setTestSuiteName:(id)a3 reply:(id)a4
{
  NSString *v6;
  void (**v7)(id, void *);
  Class v8;
  objc_class *v9;
  NSObject *v10;
  Class testSuiteClass;
  NSObject *v12;
  WBSCyclerService *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  Class v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = (void (**)(id, void *))a4;
  v8 = NSClassFromString(v6);
  if (!v8)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService _setTestSuiteName:reply:].cold.1();
    v13 = self;
    v14 = 5;
    goto LABEL_12;
  }
  v9 = v8;
  if ((-[objc_class conformsToProtocol:](v8, "conformsToProtocol:", &unk_1EE70B6E8) & 1) == 0)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[WBSCyclerService _setTestSuiteName:reply:].cold.2();
    v13 = self;
    v14 = 6;
LABEL_12:
    -[WBSCyclerService _errorWithCode:](v13, "_errorWithCode:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);

    goto LABEL_13;
  }
  self->_testSuiteClass = v9;
  v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    testSuiteClass = self->_testSuiteClass;
    v17 = 138543362;
    v18 = testSuiteClass;
    _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Set test suite to %{public}@", (uint8_t *)&v17, 0xCu);
  }
  v7[2](v7, 0);
LABEL_13:

}

- (void)_setSeed:(unint64_t)a3 reply:(id)a4
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Seed set to %lu", (uint8_t *)&v7, 0xCu);
  }
  +[WBSCyclerRandomnessUtilities setSeed:](WBSCyclerRandomnessUtilities, "setSeed:", a3);
  v5[2](v5, 0);

}

- (void)_setMaximumIterationCount:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_INFO, "Set maximum iterations to %lu", (uint8_t *)&v8, 0xCu);
  }
  self->_maximumIterationCount = a3;
  v6[2](v6, 0);

}

- (void)_finishedWithResult:(int64_t)a3 error:(id)a4
{
  id v7;
  NSDate *v8;
  NSDate *lastTestEnd;
  NSObject *v10;
  WBSCyclerTestSuite *testSuite;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  WBSCyclerTestSuite *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastTestEnd = self->_lastTestEnd;
  self->_lastTestEnd = v8;

  objc_storeStrong((id *)&self->_lastError, a4);
  switch(a3)
  {
    case 2:
      v12 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WBSCyclerService _finishedWithResult:error:].cold.2((uint64_t)self, v12, v13, v14, v15, v16, v17, v18);
      break;
    case 1:
      v19 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[WBSCyclerService _finishedWithResult:error:].cold.1((uint64_t)self, (uint64_t)v7, v19);
      break;
    case 0:
      v10 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        testSuite = self->_testSuite;
        v20 = 138543362;
        v21 = testSuite;
        _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "%{public}@ passed", (uint8_t *)&v20, 0xCu);
      }
      break;
  }
  -[WBSCyclerService _postFinishNotificationWithError:](self, "_postFinishNotificationWithError:", v7);

}

- (void)_postFinishNotificationWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10[0] = CFSTR("errorDomain");
    v4 = a3;
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = CFSTR("errorCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = CFSTR("errorLocalizedDescription");
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("com.apple.SafariShared.Cycler.DidFinishRunningTest"), self->_identifier, v8);

}

- (id)_errorWithCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  -[WBSCyclerService _descriptionForErrorCode:](self, "_descriptionForErrorCode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WBSCyclerServiceErrorDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return CFSTR("A test is already running");
  else
    return off_1E4B38A80[a3 - 1];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastTestEnd, 0);
  objc_storeStrong((id *)&self->_lastTestStart, 0);
  objc_storeStrong((id *)&self->_testRunner, 0);
  objc_storeStrong((id *)&self->_testSuite, 0);
  objc_storeStrong((id *)&self->_testTargetProxyController, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)setTestTargetEndpoint:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, v0, v1, "Received new test target endpoint %{public}@, but test is already running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__WBSCyclerService_setTestTargetEndpoint_reply___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Disconnected from test target; it may have crashed or exited",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_5();
}

- (void)setValue:forConfigurationKey:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Cannot modify test suite options while test is running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)stopCyclingWithReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Asked to stop cycling, but no test is running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)sendRequestToTestSuite:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, v0, v1, "Asked to perform request %{public}@, but no test is running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fetchLogsWithReply:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Error reading log store: %{public}@", v5, 0xCu);

}

- (void)_startCyclingFromBeginning:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Asked to start cycling, but test is already running. Ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_startCyclingFromBeginning:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Asked to start cycling, but there is no available test target", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_startCyclingFromBeginning:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Asked to start cycling, but no test suite has been specified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setTestSuiteName:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, v0, v1, "Received test suite name \"%{public}@\" but no class found with that name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setTestSuiteName:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, v0, v1, "Received test suite name \"%{public}@\" but that class does not conform to the test suite protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_finishedWithResult:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed with error: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_finishedWithResult:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "%{public}@ was stopped", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
