@implementation VSApplicationController

- (void)release
{
  objc_super v3;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v3.receiver = self;
    v3.super_class = (Class)VSApplicationController;
    -[VSApplicationController release](&v3, sel_release);
  }
  else
  {
    dispatch_sync_f(MEMORY[0x24BDAC9B8], self, VSMainThreadRelease);
  }
}

- (VSApplicationController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSApplicationController)initWithIdentityProvider:(id)a3
{
  id v5;
  VSApplicationController *v6;
  VSPreferences *v7;
  VSPreferences *preferences;
  VSApplicationControllerResponseHandler *v9;
  VSApplicationControllerResponseHandler *responseHandler;
  NSOperationQueue *v11;
  NSOperationQueue *privateQueue;
  id v13;
  VSStateMachine *stateMachine;
  id v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The identityProvider parameter must not be nil."));
  v17.receiver = self;
  v17.super_class = (Class)VSApplicationController;
  v6 = -[VSApplicationController init](&v17, sel_init);
  if (v6)
  {
    v7 = (VSPreferences *)objc_alloc_init(MEMORY[0x24BDF8C48]);
    preferences = v6->_preferences;
    v6->_preferences = v7;

    objc_storeStrong((id *)&v6->_identityProvider, a3);
    v9 = objc_alloc_init(VSApplicationControllerResponseHandler);
    responseHandler = v6->_responseHandler;
    v6->_responseHandler = v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = v11;

    -[NSOperationQueue setName:](v6->_privateQueue, "setName:", CFSTR("VSApplicationController.Queue"));
    v16 = v5;
    v13 = objc_alloc_init(MEMORY[0x24BDF8C80]);
    objc_msgSend(v13, "setName:", CFSTR("VSApplicationController"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Waiting for boot URL"), CFSTR("Start app controller"), CFSTR("Initial"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Notifying of launch failure"), CFSTR("Boot URL fetch failed"), CFSTR("Waiting for boot URL"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Waiting for both launch callbacks"), CFSTR("Boot URL received"), CFSTR("Waiting for boot URL"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Invalid"), CFSTR("Stop app controller"), CFSTR("Waiting for boot URL"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Waiting for delegate callback"), CFSTR("onLaunch callback succeeded"), CFSTR("Waiting for both launch callbacks"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Waiting for on launch callback"), CFSTR("Application did start"), CFSTR("Waiting for both launch callbacks"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Notifying of launch failure"), CFSTR("onLaunch callback failed"), CFSTR("Waiting for both launch callbacks"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Notifying of launch failure"), CFSTR("Application failed to start"), CFSTR("Waiting for both launch callbacks"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Invalid"), CFSTR("Stop app controller"), CFSTR("Waiting for both launch callbacks"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Ready"), CFSTR("onLaunch callback succeeded"), CFSTR("Waiting for on launch callback"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Notifying of launch failure"), CFSTR("onLaunch callback failed"), CFSTR("Waiting for on launch callback"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Invalid"), CFSTR("Stop app controller"), CFSTR("Waiting for on launch callback"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Ready"), CFSTR("Application did start"), CFSTR("Waiting for delegate callback"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Notifying of launch failure"), CFSTR("onLaunch callback failed"), CFSTR("Waiting for delegate callback"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Invalid"), CFSTR("Stop app controller"), CFSTR("Waiting for delegate callback"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("onLaunch callback failed"), CFSTR("Notifying of launch failure"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("Application failed to start"), CFSTR("Notifying of launch failure"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("onLaunch callback succeeded"), CFSTR("Notifying of launch failure"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("Application did start"), CFSTR("Notifying of launch failure"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("Stop app controller"), CFSTR("Notifying of launch failure"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Invalid"), CFSTR("Finished notifying of launch failure"), CFSTR("Notifying of launch failure"));
    objc_msgSend(v13, "setDestinationState:forEvent:inState:", CFSTR("Invalid"), CFSTR("Stop app controller"), CFSTR("Ready"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("onLaunch callback succeeded"), CFSTR("Invalid"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("onLaunch callback failed"), CFSTR("Invalid"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("Application did start"), CFSTR("Invalid"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("Application failed to start"), CFSTR("Invalid"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("Stop app controller"), CFSTR("Invalid"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("Boot URL received"), CFSTR("Invalid"));
    objc_msgSend(v13, "ignoreEvent:inState:", CFSTR("Boot URL fetch failed"), CFSTR("Invalid"));
    objc_msgSend(v13, "setDelegate:", v6);
    objc_msgSend(v13, "activateWithState:", CFSTR("Initial"));
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = (VSStateMachine *)v13;
    v5 = v16;

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  VSApplicationController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating application controller: %p", buf, 0xCu);
  }

  VSRequireMainThread();
  v4.receiver = self;
  v4.super_class = (Class)VSApplicationController;
  -[VSApplicationController dealloc](&v4, sel_dealloc);
}

- (void)transitionToWaitingForBootUrlState
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id location;

  CFRetain(self);
  -[VSApplicationController identityProvider](self, "identityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requireAuthenticationURLSystemTrust");

  -[VSApplicationController identityProvider](self, "identityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [[self identityProvider] authenticationURL] parameter must not be nil."));
  -[VSApplicationController identityProvider](self, "identityProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authenticationURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8BA0]), "initWithBootURL:isDeveloper:", v8, v4 ^ 1u);
  objc_initWeak(&location, self);
  objc_copyWeak(&v13, &location);
  v12 = v9;
  VSMainThreadOperationWithBlock();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDependency:", v12);
  VSEnqueueCompletionOperation();
  -[VSApplicationController privateQueue](self, "privateQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[5];
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "urlOrError");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_2;
    v5[3] = &unk_24FE1A250;
    v5[4] = WeakRetained;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_101;
    v4[3] = &unk_24FE19D18;
    v4[4] = WeakRetained;
    objc_msgSend(v2, "unwrapObject:error:", v5, v4);

  }
}

void __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Fetched boot URL %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFetchedURL:", v3);
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueEvent:", CFSTR("Boot URL received"));

}

void __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_101_cold_1();

  VSPublicServiceTemporarilyUnavailableError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setOnLaunchError:", v5);
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueueEvent:", CFSTR("Boot URL fetch failed"));

}

- (void)transitionToWaitingForBothLaunchCallbacksState
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDF8BD0]);
  -[VSApplicationController privateQueue](self, "privateQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

  v7 = MEMORY[0x24BDAC760];
  v8 = v3;
  v5 = v3;
  VSMainThreadOperationWithBlock();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addDependency:", v5, v7, 3221225472, __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke, &unk_24FE19E30);
  VSEnqueueCompletionOperation();

}

void __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  VSApplication *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  VSApplication *v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  VSApplication *v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_2;
  v41[3] = &unk_24FE1A278;
  v41[4] = &v42;
  objc_msgSend(v3, "unwrapObject:error:", v41, &__block_literal_global_9);
  objc_msgSend(*(id *)(a1 + 40), "_bootURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceUnwrapObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (*((_BYTE *)v43 + 24)
    && (objc_msgSend(*(id *)(a1 + 40), "identityProvider"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isDeveloper"),
        v7,
        v8))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "queryItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v10, "queryItems");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (v14)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [components queryItems] parameter must not be nil."));
        objc_msgSend(v10, "queryItems");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v12, "initWithArray:", v15);

      }
      else
      {
        v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      }
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%.0f"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("cachebuster"), v21);
      objc_msgSend(v16, "addObject:", v22);

      objc_msgSend(v10, "setQueryItems:", v16);
      objc_msgSend(v10, "URL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v17 = v23;

        VSDefaultLogObject();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "absoluteString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v47 = v26;
          _os_log_impl(&dword_2303C5000, v25, OS_LOG_TYPE_DEFAULT, "New URL with cachebuster is %@", buf, 0xCu);

        }
      }
      else
      {
        v17 = v6;
      }

    }
    else
    {
      v17 = v6;
    }

  }
  else
  {
    v17 = v6;
  }
  v27 = -[VSApplication initWithBootURL:]([VSApplication alloc], "initWithBootURL:", v17);
  -[VSApplication setDelegate:](v27, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "auditToken");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSApplication setAuditToken:](v27, "setAuditToken:", v28);

  objc_msgSend(*(id *)(a1 + 40), "preferences");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "allowNonSystemTrust") & 1) != 0)
  {
    v30 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "identityProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v31, "requireXHRRequestSystemTrust");

  }
  -[VSApplication setCanRequireSystemTrust:](v27, "setCanRequireSystemTrust:", v30);
  objc_msgSend(*(id *)(a1 + 40), "identityProvider");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "uniqueID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_120;
  v39[3] = &unk_24FE19AE0;
  v39[4] = *(_QWORD *)(a1 + 40);
  v34 = v27;
  v40 = v34;
  objc_msgSend(v33, "conditionallyUnwrapObject:", v39);
  objc_msgSend(*(id *)(a1 + 40), "identityProvider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isDeveloper");

  if ((v36 & 1) != 0)
  {
    v37 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "preferences");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v38, "shouldAlwaysAllowRemoteInspection");

  }
  -[VSApplication setShouldAllowRemoteInspection:](v34, "setShouldAllowRemoteInspection:", v37);
  -[VSApplication start](v34, "start");
  objc_msgSend(*(id *)(a1 + 40), "setApplication:", v34);

  _Block_object_dispose(&v42, 8);
}

uint64_t __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "cacheBusterEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_3_cold_1();

}

void __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_120(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "useLegacyVendorIdentifier"))
  {
    v4 = objc_msgSend(&unk_24FE3CEC8, "containsObject:", v17);

    if (v4)
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifierForVendor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v5;
LABEL_7:
      objc_msgSend(v9, "setVendorIdentifier:", v8);
      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vendorIdentifierDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    goto LABEL_7;
  }
  v10 = *MEMORY[0x24BDBCAB8];
  do
  {
    v11 = v8;
    v12 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v12, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v10, CFSTR("The vendorID parameter must not be nil."));
    v14 = objc_msgSend(v13, "containsObject:", v8);

  }
  while ((v14 & 1) != 0);
  v15 = (void *)objc_msgSend(v7, "mutableCopy");
  if (!v8)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v10, CFSTR("The vendorID parameter must not be nil."));
  objc_msgSend(v15, "setValue:forKey:", v8, v17);
  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVendorIdentifierDictionary:", v15);

  objc_msgSend(*(id *)(a1 + 40), "setVendorIdentifier:", v8);
LABEL_15:

}

- (void)transitionToReadyState
{
  VSPerformBlockOnMainThread();
}

uint64_t __49__VSApplicationController_transitionToReadyState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDidStart");
}

- (void)transitionToNotifyingOfLaunchFailureState
{
  VSPerformBlockOnMainThread();
}

uint64_t __68__VSApplicationController_transitionToNotifyingOfLaunchFailureState__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__VSApplicationController_transitionToNotifyingOfLaunchFailureState__block_invoke_2;
  v3[3] = &unk_24FE19778;
  v3[4] = v1;
  return objc_msgSend(v1, "_notifyDelegateWithBlock:", v3);
}

void __68__VSApplicationController_transitionToNotifyingOfLaunchFailureState__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegateError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "onLaunchError");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v9 = v2;
LABEL_17:
    objc_msgSend(v8, "_notifyStartDidFailWithError:", v9);
    goto LABEL_18;
  }
  if (v3)
    v6 = v2 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v8 = *(void **)(a1 + 32);
    v9 = v4;
    goto LABEL_17;
  }
  if (v2)
    v7 = v3 == 0;
  else
    v7 = 1;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("No errors to notify about."));
  }
  else
  {
    v15[0] = v2;
    v15[1] = v3;
    v11 = (void *)MEMORY[0x24BDBCE30];
    v12 = v2;
    objc_msgSend(v11, "arrayWithObjects:count:", v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    VSPublicErrorWithDetailedErrors();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_notifyStartDidFailWithError:", v14);
  }
LABEL_18:
  objc_msgSend(*(id *)(a1 + 32), "setDelegateError:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setOnLaunchError:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueEvent:", CFSTR("Finished notifying of launch failure"));

}

- (void)transitionToInvalidState
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[VSApplicationController transitionToInvalidState]";
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v5, 0xCu);
  }

  -[VSApplicationController application](self, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(v4, "stop");
  -[VSApplicationController setApplication:](self, "setApplication:", 0);
  CFRelease(self);

}

- (void)start
{
  id v2;

  -[VSApplicationController stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueEvent:", CFSTR("Start app controller"));

}

- (void)stop
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[VSApplicationController stop]";
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v5, 0xCu);
  }

  -[VSApplicationController stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueEvent:", CFSTR("Stop app controller"));

}

- (void)sendErrorMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSApplicationController application](self, "application");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendErrorWithMessage:", v4);

}

- (void)showAuthenticationUserInterfaceWithAuthenticationToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  __int128 *p_buf;
  id v17;
  id location;
  __int128 buf;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[VSApplicationController showAuthenticationUserInterfaceWithAuthenticationToken:]";
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  VSRequireMainThread();
  v6 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(v4, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "optionalWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unwrapWithFallback:", &stru_24FE1B848);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x2020000000;
  v21 = 0;
  objc_initWeak(&location, self);
  -[VSApplicationController application](self, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __82__VSApplicationController_showAuthenticationUserInterfaceWithAuthenticationToken___block_invoke;
  v14[3] = &unk_24FE1A2C0;
  p_buf = &buf;
  objc_copyWeak(&v17, &location);
  v12 = v9;
  v15 = v12;
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __82__VSApplicationController_showAuthenticationUserInterfaceWithAuthenticationToken___block_invoke_140;
  v13[3] = &unk_24FE1A2E8;
  v13[4] = self;
  v13[5] = &buf;
  objc_msgSend(v10, "evaluate:completionHandler:", v14, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __82__VSApplicationController_showAuthenticationUserInterfaceWithAuthenticationToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VSApplicationController showAuthenticationUserInterfaceWithAuthenticationToken:]_block_invoke";
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Beginning evaluation of JavaScript in %s", buf, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("App"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasProperty:", CFSTR("onShowUserInterface")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setAllowUI:", 1);

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v7, "setObject:forKey:", CFSTR("authenticate"), CFSTR("purpose"));
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
      objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("currentAuthentication"));
    v10 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v5, "invokeMethod:withArguments:", CFSTR("onShowUserInterface"), v8);

  }
}

void __82__VSApplicationController_showAuthenticationUserInterfaceWithAuthenticationToken___block_invoke_140(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[VSApplicationController showAuthenticationUserInterfaceWithAuthenticationToken:]_block_invoke";
    _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "Finished evaluation of JavaScript in %s", (uint8_t *)&v6, 0xCu);
  }

  v3 = *(id *)(a1 + 32);
  v4 = v3;
  if (v3 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v3, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendErrorWithMessage:", CFSTR("The App.onShowUserInterface function must be defined."));

  }
}

- (void)submitRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  VSRequireMainThread();
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__VSApplicationController_submitRequest___block_invoke;
  v6[3] = &unk_24FE1A310;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[VSApplicationController _makeJavascriptRequestForRequest:withCompletionHandler:](self, "_makeJavascriptRequestForRequest:withCompletionHandler:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __41__VSApplicationController_submitRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  VSRequireMainThread();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      objc_msgSend(WeakRetained, "_submitJavascriptRequest:forApplicationControllerRequest:", v10, v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_completeRequest:withResult:", v8, v9);

    }
  }

}

- (void)applicationStartSelfValidationWithAuthenticationToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[VSApplicationController application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__VSApplicationController_applicationStartSelfValidationWithAuthenticationToken___block_invoke;
  v7[3] = &unk_24FE1A338;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluate:completionHandler:", v7, &__block_literal_global_151);

}

void __81__VSApplicationController_applicationStartSelfValidationWithAuthenticationToken___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  VSApplicationControllerRequestFactory *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hasProperty:", CFSTR("onValidate")))
  {
    v5 = objc_alloc_init(VSApplicationControllerRequestFactory);
    -[VSApplicationControllerRequestFactory authenticationApplicationControllerRequestWithAuthenticationToken:forcedAuthentication:](v5, "authenticationApplicationControllerRequestWithAuthenticationToken:forcedAuthentication:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SAMLRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "SAMLRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [request SAMLRequest] parameter must not be nil."));
      objc_msgSend(v6, "SAMLRequest");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = &stru_24FE1B848;
    }
    v10 = (void *)MEMORY[0x24BDF8C38];
    objc_msgSend(*(id *)(a1 + 32), "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "optionalWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unwrapWithFallback:", &stru_24FE1B848);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v14, "setObject:forKey:", v9, CFSTR("requestBody"));
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("currentAuthentication"));
    v17[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v4, "invokeMethod:withArguments:", CFSTR("onValidate"), v15);

  }
}

void __81__VSApplicationController_applicationStartSelfValidationWithAuthenticationToken___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "Finished invoking onSubmit callback.", v1, 2u);
  }

}

- (void)application:(id)a3 evaluateAppJavascriptInContext:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  NSObject *v35;
  id v36;
  id *v37;
  id *v38;
  id *v39;
  id *v40;
  id *v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id location;
  uint8_t buf[4];
  uint64_t v60;
  _BYTE v61[128];
  _QWORD v62[4];
  _QWORD v63[4];
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[4];
  _QWORD v67[4];
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[4];
  _QWORD v76[4];
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[4];
  _QWORD v80[3];
  uint64_t v81;
  _QWORD v82[6];

  v82[4] = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v42 = a4;
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("App"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v80[0] = *MEMORY[0x24BDDA600];
  v6 = v80[0];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke;
  v56[3] = &unk_24FE1A3A0;
  v37 = &v57;
  objc_copyWeak(&v57, &location);
  v7 = (void *)MEMORY[0x2348B90BC](v56);
  v8 = *MEMORY[0x24BDDA608];
  v9 = MEMORY[0x24BDBD1C0];
  v82[0] = v7;
  v82[1] = MEMORY[0x24BDBD1C0];
  v10 = *MEMORY[0x24BDDA5E8];
  v80[1] = v8;
  v80[2] = v10;
  v81 = *MEMORY[0x24BDDA5E0];
  v11 = v81;
  v82[2] = MEMORY[0x24BDBD1C0];
  v82[3] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v80, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("presentDocument"), v12);

  v78[0] = v6;
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_2;
  v54[3] = &unk_24FE1A3C8;
  v38 = &v55;
  objc_copyWeak(&v55, &location);
  v13 = (void *)MEMORY[0x2348B90BC](v54);
  v79[0] = v13;
  v79[1] = v9;
  v78[1] = v8;
  v78[2] = v10;
  v78[3] = v11;
  v79[2] = v9;
  v79[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("presentAlert"), v14);

  v76[0] = v6;
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_3;
  v52[3] = &unk_24FE1A3A0;
  v39 = &v53;
  objc_copyWeak(&v53, &location);
  v15 = (void *)MEMORY[0x2348B90BC](v52);
  v77[0] = v15;
  v77[1] = v9;
  v76[1] = v8;
  v76[2] = v10;
  v76[3] = v11;
  v77[2] = v9;
  v77[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, v76, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("beginAuthentication"), v16);

  v74[0] = v6;
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_4;
  v50[3] = &unk_24FE1A3F0;
  v40 = &v51;
  objc_copyWeak(&v51, &location);
  v17 = (void *)MEMORY[0x2348B90BC](v50);
  v75[0] = v17;
  v75[1] = v9;
  v74[1] = v8;
  v74[2] = v10;
  v74[3] = v11;
  v75[2] = v9;
  v75[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("cancelValidation"), v18);

  v72[0] = v6;
  v73[0] = objc_opt_class();
  v73[1] = v9;
  v72[1] = v8;
  v72[2] = v10;
  v72[3] = v11;
  v73[2] = v9;
  v73[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("ResponsePayload"), v19);

  v70[0] = v6;
  v71[0] = objc_opt_class();
  v71[1] = v9;
  v70[1] = v8;
  v70[2] = v10;
  v70[3] = v11;
  v71[2] = v9;
  v71[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("Subscription"), v20);

  v68[0] = v6;
  v69[0] = objc_opt_class();
  v69[1] = v9;
  v68[1] = v8;
  v68[2] = v10;
  v68[3] = v11;
  v69[2] = v9;
  v69[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("UserAccount"), v21);

  v66[0] = v6;
  v67[0] = objc_opt_class();
  v67[1] = v9;
  v66[1] = v8;
  v66[2] = v10;
  v66[3] = v11;
  v67[2] = v9;
  v67[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("AppleSubscription"), v22);

  v64[0] = v6;
  v65[0] = objc_opt_class();
  v65[1] = v9;
  v64[1] = v8;
  v64[2] = v10;
  v64[3] = v11;
  v65[2] = v9;
  v65[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("Alert"), v23);

  v62[0] = v6;
  v63[0] = objc_opt_class();
  v63[1] = v9;
  v62[1] = v8;
  v62[2] = v10;
  v62[3] = v11;
  v63[2] = v9;
  v63[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defineProperty:descriptor:", CFSTR("AlertAction"), v24);

  VSExportCompressionToContext(v42);
  VSScriptMessageSupportInjection(1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v42, "evaluateScript:", v25);

  v27 = (void *)MEMORY[0x24BDDA730];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_5;
  v48[3] = &unk_24FE1A418;
  v41 = &v49;
  objc_copyWeak(&v49, &location);
  v28 = (void *)MEMORY[0x2348B90BC](v48);
  objc_msgSend(v27, "valueWithObject:inContext:", v28, v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSApplicationController setApplicationReadyCallback:](self, "setApplicationReadyCallback:", v29);
  objc_msgSend(v42, "globalObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = objc_msgSend(&unk_24FE3CEE0, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(&unk_24FE3CEE0);
        v34 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v30, "deleteProperty:", v34, v36, v37, v38, v39, v40, v41))
        {
          VSErrorLogObject();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v34;
            _os_log_error_impl(&dword_2303C5000, v35, OS_LOG_TYPE_ERROR, "Unable to delete %@ property.", buf, 0xCu);
          }

        }
      }
      v31 = objc_msgSend(&unk_24FE3CEE0, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
    }
    while (v31);
  }

  objc_destroyWeak(v41);
  objc_destroyWeak(v40);
  objc_destroyWeak(v39);
  objc_destroyWeak(v38);
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);

}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_presentDocument:", v3);

}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_presentAlert:", v3);

}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_beginAuthentication");

}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancelValidation");

}

void __70__VSApplicationController_application_evaluateAppJavascriptInContext___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a3;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "App.onLaunch() callback called.", v11, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "applicationReadyCallback");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "_applicationReadyWithSuccess:javascriptErrorValue:", a2, v5);
      objc_msgSend(v8, "setApplicationReadyCallback:", 0);
    }
    else
    {
      objc_msgSend(v8, "application");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sendErrorWithMessage:", CFSTR("The onLaunch callback can only be called once."));

    }
  }

}

- (void)applicationDidStart:(id)a3
{
  id v3;

  -[VSApplicationController stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueEvent:", CFSTR("Application did start"));

}

- (void)application:(id)a3 startDidFailWithError:(id)a4
{
  void *v5;
  id v6;

  VSPublicError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VSApplicationController setDelegateError:](self, "setDelegateError:", v6);
  -[VSApplicationController stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueEvent:", CFSTR("Application failed to start"));

}

- (id)activeAppDocumentForApplication:(id)a3
{
  void *v3;
  void *v4;

  -[VSApplicationController appDocumentController](self, "appDocumentController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)appDocumentController:(id)a3 didUpdateViewModel:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Document controller did update view model: %@", (uint8_t *)&v7, 0xCu);
  }

  -[VSApplicationController _notifyDidReceiveViewModel:](self, "_notifyDidReceiveViewModel:", v5);
}

- (void)appDocumentController:(id)a3 didFailToUpdateViewModelWithError:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  VSErrorLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[VSApplicationController appDocumentController:didFailToUpdateViewModelWithError:].cold.1();

  -[VSApplicationController _notifyDidReceiveViewModelError:](self, "_notifyDidReceiveViewModelError:", v5);
}

- (void)appDocumentController:(id)a3 didUpdateLogoViewModel:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Document controller did update logo view model: %@", (uint8_t *)&v7, 0xCu);
  }

  -[VSApplicationController _notifyDidUpdateLogoViewModel:](self, "_notifyDidUpdateLogoViewModel:", v5);
}

- (void)_presentDocument:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[VSApplicationController allowUI](self, "allowUI"))
  {
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Will create app document in -[%@ %@]", buf, 0x16u);

    }
    -[VSApplicationController application](self, "application");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __44__VSApplicationController__presentDocument___block_invoke;
    v13[3] = &unk_24FE1A440;
    v13[4] = self;
    v13[5] = a2;
    objc_msgSend(v10, "appDocumentForDocument:completionHandler:", v5, v13);

  }
  else
  {
    VSErrorLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[VSApplicationController _presentDocument:].cold.1();

    -[VSApplicationController application](self, "application");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendErrorWithMessage:", CFSTR("The App.presentDocument function cannot be called in the current context."));

  }
}

void __44__VSApplicationController__presentDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v10 = v3;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Did create app document [%@] in -[%@ %@]", buf, 0x20u);

  }
  v8 = v3;
  VSPerformBlockOnMainThread();

}

void __44__VSApplicationController__presentDocument___block_invoke_171(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  +[VSAppDocumentControllerFactory appDocumentControllerForAppDocument:error:](VSAppDocumentControllerFactory, "appDocumentControllerForAppDocument:error:", v2, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setAppDocumentController:", v3);
  if (v3)
  {
    objc_msgSend(v3, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "applicationMustSelfValidate"))
        objc_msgSend(v5, "setPreValidate:", 1);
      objc_msgSend(*(id *)(a1 + 40), "_notifyDidReceiveViewModel:", v5);
    }
    else
    {
      objc_msgSend(v3, "viewModelError");
      v7 = objc_claimAutoreleasedReturnValue();

      VSErrorLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __44__VSApplicationController__presentDocument___block_invoke_171_cold_2();

      VSPublicError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_notifyDidReceiveViewModelError:", v9);

      v4 = (id)v7;
    }
  }
  else
  {
    VSErrorLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__VSApplicationController__presentDocument___block_invoke_171_cold_1();

    VSPublicError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_notifyDidReceiveViewModelError:", v5);
  }

}

- (void)_presentAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;

  v4 = a3;
  if (-[VSApplicationController allowUI](self, "allowUI"))
  {
    -[VSApplicationController _applicationControllerAlertForJavascriptAlert:](self, "_applicationControllerAlertForJavascriptAlert:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSApplicationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = v6;
      v9 = v5;
      VSPerformBlockOnMainThread();

    }
  }
  else
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VSApplicationController _presentAlert:].cold.1();

    -[VSApplicationController application](self, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendErrorWithMessage:", CFSTR("The App.presentAlert function cannot be called in the current context."));
  }

}

uint64_t __41__VSApplicationController__presentAlert___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applicationController:requestsAlert:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_beginAuthentication
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Application called App.beginAuthentication when it is not allowed to show UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __47__VSApplicationController__beginAuthentication__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appDocumentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v1, "validationState") || objc_msgSend(v1, "validationState") == 1)
    objc_msgSend(v1, "setValidationState:", 2);

}

- (void)_cancelValidation
{
  if (-[VSApplicationController allowUI](self, "allowUI"))
    VSPerformBlockOnMainThread();
}

void __44__VSApplicationController__cancelValidation__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appDocumentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "validationState") == 1)
    objc_msgSend(v1, "setValidationState:", 0);

}

- (void)_submitJavascriptRequest:(id)a3 forApplicationControllerRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 *p_buf;
  id v23;
  id location;
  __int128 buf;
  uint64_t v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[VSApplicationController _submitJavascriptRequest:forApplicationControllerRequest:]";
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  v9 = (void *)objc_msgSend(v6, "copy");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x2020000000;
  v27 = 0;
  objc_initWeak(&location, self);
  -[VSApplicationController application](self, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke;
  v19[3] = &unk_24FE1A4B8;
  objc_copyWeak(&v23, &location);
  v12 = v7;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  p_buf = &buf;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke_2;
  v15[3] = &unk_24FE1A4E0;
  objc_copyWeak(&v18, &location);
  v17 = &buf;
  v14 = v12;
  v16 = v14;
  objc_msgSend(v10, "evaluate:completionHandler:", v19, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[VSApplicationController _submitJavascriptRequest:forApplicationControllerRequest:]_block_invoke";
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Beginning evaluation of JavaScript in %s", buf, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("App"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasProperty:", CFSTR("onRequest")))
  {
    v6 = (void *)MEMORY[0x24BDDA730];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke_184;
    v13[3] = &unk_24FE1A490;
    objc_copyWeak(&v15, (id *)(a1 + 56));
    v14 = *(id *)(a1 + 32);
    v7 = (void *)MEMORY[0x2348B90BC](v13);
    objc_msgSend(v6, "valueWithObject:inContext:", v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 40);
    v17[0] = CFSTR("request");
    v17[1] = CFSTR("callback");
    v18[0] = v9;
    v18[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v16 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v5, "invokeMethod:withArguments:", CFSTR("onRequest"), v11);

    objc_destroyWeak(&v15);
  }

}

void __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke_184(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_completeRequest:withJavascriptResponse:javascriptErrorValue:", *(_QWORD *)(a1 + 32), v7, v6);

}

void __84__VSApplicationController__submitJavascriptRequest_forApplicationControllerRequest___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[VSApplicationController _submitJavascriptRequest:forApplicationControllerRequest:]_block_invoke_2";
    _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "Finished evaluation of JavaScript in %s", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(WeakRetained, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendErrorWithMessage:", CFSTR("The App.onRequest function must be defined."));

    VSPrivateError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSPublicError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_completeRequest:withResult:", v8, v9);

  }
}

- (void)_applicationReadyWithSuccess:(BOOL)a3 javascriptErrorValue:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  if (a3)
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Application is ready.", buf, 2u);
    }

    -[VSApplicationController application](self, "application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __77__VSApplicationController__applicationReadyWithSuccess_javascriptErrorValue___block_invoke;
    v10[3] = &unk_24FE1A338;
    v10[4] = self;
    objc_msgSend(v6, "evaluate:completionHandler:", v10, &__block_literal_global_189);

    -[VSApplicationController stateMachine](self, "stateMachine");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueEvent:", CFSTR("onLaunch callback succeeded"));
  }
  else
  {
    -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:](self, "_errorForJavascriptErrorValueValue:withRequest:", a4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    VSErrorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VSApplicationController _applicationReadyWithSuccess:javascriptErrorValue:].cold.1();

    v7 = v8;
    VSPerformBlockOnMainThread();

  }
}

void __77__VSApplicationController__applicationReadyWithSuccess_javascriptErrorValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hasProperty:", CFSTR("onValidate"));
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Application has onSubmit callback.", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setApplicationMustSelfValidate:", 1);
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Application does not have onSubmit callback.", v8, 2u);
      }

    }
  }

}

void __77__VSApplicationController__applicationReadyWithSuccess_javascriptErrorValue___block_invoke_190(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setOnLaunchError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueEvent:", CFSTR("onLaunch callback failed"));

}

- (void)_completeRequest:(id)a3 withJavascriptResponse:(id)a4 javascriptErrorValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VSApplicationController responseHandler](self, "responseHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "type");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88__VSApplicationController__completeRequest_withJavascriptResponse_javascriptErrorValue___block_invoke;
    v16[3] = &unk_24FE1A568;
    v16[4] = self;
    v17 = v8;
    objc_msgSend(v11, "handleJavascriptResponse:requestType:completionHandler:", v9, v12, v16);

  }
  else
  {
    -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:](self, "_errorForJavascriptErrorValueValue:withRequest:", v10, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    VSErrorLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[VSApplicationController _completeRequest:withJavascriptResponse:javascriptErrorValue:].cold.1();

    objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSApplicationController _completeRequest:withResult:](self, "_completeRequest:withResult:", v8, v15);

  }
}

void __88__VSApplicationController__completeRequest_withJavascriptResponse_javascriptErrorValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __88__VSApplicationController__completeRequest_withJavascriptResponse_javascriptErrorValue___block_invoke_3;
  v4[3] = &unk_24FE19D18;
  v4[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "unwrapObject:error:", &__block_literal_global_192, v4);
  objc_msgSend(*(id *)(a1 + 32), "_completeRequest:withResult:", *(_QWORD *)(a1 + 40), v3);

}

void __88__VSApplicationController__completeRequest_withJavascriptResponse_javascriptErrorValue___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "debugDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendErrorWithMessage:", v4);

}

- (void)_completeRequest:(id)a3 withResult:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v5;
  v7 = v8;
  VSPerformBlockOnMainThread();

}

void __55__VSApplicationController__completeRequest_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__VSApplicationController__completeRequest_withResult___block_invoke_2;
  v7[3] = &unk_24FE1A590;
  v3 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __55__VSApplicationController__completeRequest_withResult___block_invoke_194;
  v5[3] = &unk_24FE1A5B8;
  v4 = *(void **)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v4;
  objc_msgSend(v3, "unwrapObject:error:", v7, v5);

}

void __55__VSApplicationController__completeRequest_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Will notify request did complete.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_notifyRequest:didCompleteWithResponse:", *(_QWORD *)(a1 + 40), v3);
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Did notify request did complete.", v6, 2u);
  }

}

void __55__VSApplicationController__completeRequest_withResult___block_invoke_194(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Will notify request did fail: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_notifyRequest:didFailWithError:", *(_QWORD *)(a1 + 40), v3);
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Did notify request did fail: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_notifyRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  VSRequireMainThread();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__VSApplicationController__notifyRequest_didCompleteWithResponse___block_invoke;
  v10[3] = &unk_24FE1A468;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[VSApplicationController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v10);

}

void __66__VSApplicationController__notifyRequest_didCompleteWithResponse___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationController:request:didCompleteWithResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_notifyDidReceiveViewModel:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  VSRequireMainThread();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__VSApplicationController__notifyDidReceiveViewModel___block_invoke;
  v6[3] = &unk_24FE19E30;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VSApplicationController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v6);

}

void __54__VSApplicationController__notifyDidReceiveViewModel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationController:didReceiveViewModel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyDidReceiveViewModelError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  VSRequireMainThread();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__VSApplicationController__notifyDidReceiveViewModelError___block_invoke;
  v6[3] = &unk_24FE19E30;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VSApplicationController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v6);

}

void __59__VSApplicationController__notifyDidReceiveViewModelError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationController:didReceiveViewModelError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyRequest:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  VSRequireMainThread();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__VSApplicationController__notifyRequest_didFailWithError___block_invoke;
  v10[3] = &unk_24FE1A468;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[VSApplicationController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v10);

}

void __59__VSApplicationController__notifyRequest_didFailWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationController:request:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_notifyDidStart
{
  _QWORD v3[5];

  VSRequireMainThread();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__VSApplicationController__notifyDidStart__block_invoke;
  v3[3] = &unk_24FE19778;
  v3[4] = self;
  -[VSApplicationController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v3);
}

void __42__VSApplicationController__notifyDidStart__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationControllerDidStart:", *(_QWORD *)(a1 + 32));

}

- (void)_notifyStartDidFailWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  VSRequireMainThread();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__VSApplicationController__notifyStartDidFailWithError___block_invoke;
  v6[3] = &unk_24FE19E30;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VSApplicationController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v6);

}

void __56__VSApplicationController__notifyStartDidFailWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationController:startDidFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyDelegateWithBlock:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(_QWORD))a3;
  VSRequireMainThread();
  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The block parameter must not be nil."));
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Application controller will notify delegate.", v5, 2u);
  }

  v3[2](v3);
}

- (void)_notifyDidUpdateLogoViewModel:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VSApplicationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "applicationController:didUpdateLogoViewModel:", self, v5);

}

- (id)_bootURL
{
  void *v3;
  void *v4;
  void *v5;

  -[VSApplicationController preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overridingAppBootURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[VSApplicationController fetchedURL](self, "fetchedURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_applicationLaunchParams
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[VSApplicationController identityProvider](self, "identityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("location"));
  -[VSApplicationController userAccounts](self, "userAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VSApplicationController userAccounts](self, "userAccounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self userAccounts] parameter must not be nil."));
    -[VSApplicationController userAccounts](self, "userAccounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF8BA8], "applicationUserAccountsFromUserAccounts:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("userAccounts"));

  }
  -[VSApplicationController applicationReadyCallback](self, "applicationReadyCallback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("callback"));
  -[VSApplicationController identityProvider](self, "identityProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[VSApplicationController identityProvider](self, "identityProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [[self identityProvider] userToken] parameter must not be nil."));
    -[VSApplicationController identityProvider](self, "identityProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    VSDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[VSApplicationController identityProvider](self, "identityProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "providerID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v17;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_2303C5000, v18, OS_LOG_TYPE_DEFAULT, "Add userToken %@ in %@'s js launch params", (uint8_t *)&v24, 0x16u);

    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("userToken"));

  }
  -[VSApplicationController accountProviderAuthenticationToken](self, "accountProviderAuthenticationToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("accountProviderAuthenticationToken"));
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (id)_applicationControllerAlertForJavascriptAlert:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  VSApplicationControllerAlertAction *v12;
  void *v13;
  void *v14;
  id v16;
  VSApplicationControllerAlert *v17;
  id obj;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id location;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = objc_alloc_init(VSApplicationControllerAlert);
  objc_msgSend(v16, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSApplicationControllerAlert setTitle:](v17, "setTitle:", v4);

  objc_msgSend(v16, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSApplicationControllerAlert setMessage:](v17, "setMessage:", v5);

  objc_initWeak(&location, self);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v16, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    obj = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v12 = objc_alloc_init(VSApplicationControllerAlertAction);
        objc_msgSend(v11, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSApplicationControllerAlertAction setTitle:](v12, "setTitle:", v13);

        objc_msgSend(v11, "style");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSApplicationControllerAlertAction setStyle:](v12, "setStyle:", +[VSApplicationControllerAlertAction styleFromString:](VSApplicationControllerAlertAction, "styleFromString:", v14));

        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke;
        v19[3] = &unk_24FE19B80;
        objc_copyWeak(&v20, &location);
        v19[4] = v11;
        -[VSApplicationControllerAlertAction setCallback:](v12, "setCallback:", v19);
        objc_msgSend(v6, "addObject:", v12);
        objc_destroyWeak(&v20);

        ++v10;
      }
      while (v8 != v10);
      v7 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  -[VSApplicationControllerAlert setActions:](v17, "setActions:", v6);
  objc_destroyWeak(&location);

  return v17;
}

void __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke_2;
    v5[3] = &unk_24FE1A338;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "evaluate:completionHandler:", v5, &__block_literal_global_211);

  }
}

void __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "callWithArguments:", MEMORY[0x24BDBD1A8]);

}

void __73__VSApplicationController__applicationControllerAlertForJavascriptAlert___block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "Did execute callback for alert action.", v1, 2u);
  }

}

- (void)_makeJavascriptRequestForRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The request parameter must not be nil."));
    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The completionHandler parameter must not be nil."));
    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = objc_alloc_init(MEMORY[0x24BDF8CC8]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8CA8]), "initWithOperation:timeout:", v9, 10.0);
  v16 = MEMORY[0x24BDAC760];
  v17 = v9;
  v18 = v6;
  v19 = v8;
  v11 = v8;
  v12 = v6;
  v13 = v9;
  VSMainThreadOperationWithBlock();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addDependency:", v10, v16, 3221225472, __82__VSApplicationController__makeJavascriptRequestForRequest_withCompletionHandler___block_invoke, &unk_24FE1A600);
  VSEnqueueCompletionOperation();
  -[VSApplicationController privateQueue](self, "privateQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v10);

}

void __82__VSApplicationController__makeJavascriptRequestForRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_javascriptRequestForRequest:withVerificationData:", *(_QWORD *)(a1 + 48), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)_javascriptRequestForRequest:(id)a3 withVerificationData:(id)a4
{
  id v6;
  id v7;
  __CFString **v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v6, "type"))
  {
    case 1:
      v8 = VSJSRequestTypeUIAuthN;
      goto LABEL_8;
    case 2:
      v8 = VSJSRequestTypeAuthN;
      goto LABEL_8;
    case 3:
      v8 = VSJSRequestTypeUserMetadata;
      goto LABEL_8;
    case 4:
      v8 = VSJSRequestTypeLogout;
      goto LABEL_8;
    case 5:
      v8 = &VSJSRequestTypeSTBOptOut;
LABEL_8:
      v12 = *v8;
      break;
    default:
      v9 = (void *)MEMORY[0x24BDBCE88];
      v10 = *MEMORY[0x24BDBCAB8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("Unexpected request type: %@"), v11);

      v12 = 0;
      break;
  }
  objc_msgSend(v6, "authenticationToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SAMLRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestorVerificationToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeNames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v17, "length"))
  {

    v17 = 0;
  }
  -[VSApplicationController _makeJavaScriptRequest](self, "_makeJavaScriptRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRequestType:", v12);
  objc_msgSend(v18, "setRequestBody:", v14);
  objc_msgSend(v18, "setCurrentAuthentication:", v13);
  objc_msgSend(v18, "setRequestorVerificationToken:", v15);
  objc_msgSend(v18, "setAttributeNames:", v16);
  objc_msgSend(v18, "setAppleVerificationToken:", v17);

  return v18;
}

- (id)_errorForJavascriptErrorValueValue:(id)a3 withRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  VSJSError *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  VSJSError *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "type") == 1;
  else
    v8 = 0;
  objc_msgSend(v5, "toObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    VSDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 138412290;
      v39 = v5;
      _os_log_impl(&dword_2303C5000, v10, OS_LOG_TYPE_DEFAULT, "Application passed an error object: %@", (uint8_t *)&v38, 0xCu);
    }

    v11 = objc_alloc_init(VSJSError);
    objc_msgSend(v5, "valueForProperty:", CFSTR("code"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[VSJSError setCode:](v11, "setCode:", objc_msgSend(v12, "toUInt32"));
    objc_msgSend(v5, "valueForProperty:", CFSTR("message"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSJSError setMessage:](v11, "setMessage:", v14);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    VSErrorLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);

    if (!v9)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The errorObject parameter must not be nil."));
    if (v8)
      v23 = 1;
    else
      v23 = 4;
    v12 = v9;
    v11 = objc_alloc_init(VSJSError);
    -[VSJSError setCode:](v11, "setCode:", v23);
    -[VSJSError setMessage:](v11, "setMessage:", v12);
  }

  if (v11)
  {
    v24 = v11;
    -[VSJSError error](v24, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    switch(-[VSJSError code](v24, "code"))
    {
      case 1uLL:
        if (v8)
          goto LABEL_26;
        VSErrorLogObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:].cold.3();
        goto LABEL_32;
      case 2uLL:
LABEL_26:
        VSPrivateError();
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      case 3uLL:
        VSInvalidVerificationTokenError();
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      case 4uLL:
        goto LABEL_33;
      default:
        VSErrorLogObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
LABEL_32:

LABEL_33:
        VSPublicServiceTemporarilyUnavailableError();
        v29 = objc_claimAutoreleasedReturnValue();
LABEL_34:
        v27 = (void *)v29;

        if (!v27)
          goto LABEL_24;
        goto LABEL_25;
    }
  }
LABEL_21:
  VSErrorLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[VSApplicationController _errorForJavascriptErrorValueValue:withRequest:].cold.1();

  VSPublicServiceTemporarilyUnavailableError();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
LABEL_24:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The errorOrNil parameter must not be nil."));
LABEL_25:

  return v27;
}

- (id)_makeJavaScriptRequest
{
  VSJSRequest *v3;
  void *v4;
  void *v5;
  VSJSRequest *v6;

  v3 = [VSJSRequest alloc];
  -[VSApplicationController application](self, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v3, "initWithAppContext:", v5);

  return v6;
}

- (VSApplicationControllerDelegate)delegate
{
  return (VSApplicationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_identityProvider, a3);
}

- (NSArray)userAccounts
{
  return self->_userAccounts;
}

- (void)setUserAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_userAccounts, a3);
}

- (NSString)accountProviderAuthenticationToken
{
  return self->_accountProviderAuthenticationToken;
}

- (void)setAccountProviderAuthenticationToken:(id)a3
{
  objc_storeStrong((id *)&self->_accountProviderAuthenticationToken, a3);
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (NSError)delegateError
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDelegateError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSError)onLaunchError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOnLaunchError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSURL)fetchedURL
{
  return self->_fetchedURL;
}

- (void)setFetchedURL:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedURL, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSApplication)application
{
  return (VSApplication *)objc_getProperty(self, a2, 96, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (VSApplicationControllerResponseHandler)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_storeStrong((id *)&self->_responseHandler, a3);
}

- (VSAppDocumentController)appDocumentController
{
  return self->_appDocumentController;
}

- (void)setAppDocumentController:(id)a3
{
  objc_storeStrong((id *)&self->_appDocumentController, a3);
}

- (JSValue)applicationReadyCallback
{
  return self->_applicationReadyCallback;
}

- (void)setApplicationReadyCallback:(id)a3
{
  objc_storeStrong((id *)&self->_applicationReadyCallback, a3);
}

- (BOOL)applicationMustSelfValidate
{
  return self->_applicationMustSelfValidate;
}

- (void)setApplicationMustSelfValidate:(BOOL)a3
{
  self->_applicationMustSelfValidate = a3;
}

- (BOOL)allowUI
{
  return self->_allowUI;
}

- (void)setAllowUI:(BOOL)a3
{
  self->_allowUI = a3;
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_applicationReadyCallback, 0);
  objc_storeStrong((id *)&self->_appDocumentController, 0);
  objc_storeStrong((id *)&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_fetchedURL, 0);
  objc_storeStrong((id *)&self->_onLaunchError, 0);
  objc_storeStrong((id *)&self->_delegateError, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_accountProviderAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_userAccounts, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__VSApplicationController_transitionToWaitingForBootUrlState__block_invoke_101_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Error fetching boot URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__VSApplicationController_transitionToWaitingForBothLaunchCallbacksState__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Error fetching developer settings for cachebuster setting: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)appDocumentController:didFailToUpdateViewModelWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Document controller failed to update view model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_presentDocument:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Application called App.presentDocument when it is not allowed to show UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __44__VSApplicationController__presentDocument___block_invoke_171_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Unable to create application document controller for app document: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__VSApplicationController__presentDocument___block_invoke_171_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Unable to create view model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_presentAlert:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Application called App.presentAlert when it is not allowed to show UI.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_applicationReadyWithSuccess:javascriptErrorValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Application failed to become ready: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_completeRequest:withJavascriptResponse:javascriptErrorValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Application responded to request with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_errorForJavascriptErrorValueValue:withRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Application did not return an error object or string. Returning VSErrorCodeServiceTemporarilyUnavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_errorForJavascriptErrorValueValue:(uint64_t)a3 withRequest:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2303C5000, a1, a3, "Application returned an error with an unknown error code: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_errorForJavascriptErrorValueValue:withRequest:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Application returned an authentication error (VSJSErrorCodeUIAuthenticationFailure) when we are not processing a UI authentication request. Returning VSErrorCodeServiceTemporarilyUnavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_errorForJavascriptErrorValueValue:(uint64_t)a3 withRequest:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2303C5000, a1, a3, "Application passed an error string instead of an error object: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
