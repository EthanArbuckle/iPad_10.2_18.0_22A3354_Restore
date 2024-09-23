@implementation VSApplication

- (void)release
{
  objc_super v3;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v3.receiver = self;
    v3.super_class = (Class)VSApplication;
    -[VSApplication release](&v3, sel_release);
  }
  else
  {
    dispatch_sync_f(MEMORY[0x24BDAC9B8], self, VSMainThreadRelease);
  }
}

- (VSApplication)init
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

- (VSApplication)initWithBootURL:(id)a3
{
  id v4;
  VSApplication *v5;
  VSAppDeviceConfig *v6;
  VSAppDeviceConfig *appDeviceConfig;
  uint64_t v8;
  NSURL *bootURL;
  id v10;
  VSStateMachine *stateMachine;
  objc_super v13;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The bootURL parameter must not be nil."));
  v13.receiver = self;
  v13.super_class = (Class)VSApplication;
  v5 = -[VSApplication init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(VSAppDeviceConfig);
    appDeviceConfig = v5->_appDeviceConfig;
    v5->_appDeviceConfig = v6;

    v8 = objc_msgSend(v4, "copy");
    bootURL = v5->_bootURL;
    v5->_bootURL = (NSURL *)v8;

    v10 = objc_alloc_init(MEMORY[0x24BDF8C80]);
    objc_msgSend(v10, "setName:", CFSTR("VSApplication"));
    objc_msgSend(v10, "setDestinationState:forEvent:inState:", CFSTR("Starting"), CFSTR("Start"), CFSTR("Initial"));
    objc_msgSend(v10, "setDestinationState:forEvent:inState:", CFSTR("Notifying of failure to start"), CFSTR("Failed to start"), CFSTR("Starting"));
    objc_msgSend(v10, "setDestinationState:forEvent:inState:", CFSTR("Ready"), CFSTR("Finished starting"), CFSTR("Starting"));
    objc_msgSend(v10, "setDestinationState:forEvent:inState:", CFSTR("Waiting to stop"), CFSTR("Stop"), CFSTR("Starting"));
    objc_msgSend(v10, "ignoreEvent:inState:", CFSTR("Stop"), CFSTR("Notifying of failure to start"));
    objc_msgSend(v10, "setDestinationState:forEvent:inState:", CFSTR("Invalid"), CFSTR("Finished notifying of failure to start"), CFSTR("Notifying of failure to start"));
    objc_msgSend(v10, "ignoreEvent:inState:", CFSTR("Stop"), CFSTR("Waiting to stop"));
    objc_msgSend(v10, "setDestinationState:forEvent:inState:", CFSTR("Stopping"), CFSTR("Finished starting"), CFSTR("Waiting to stop"));
    objc_msgSend(v10, "setDestinationState:forEvent:inState:", CFSTR("Invalid"), CFSTR("Failed to start"), CFSTR("Waiting to stop"));
    objc_msgSend(v10, "setDestinationState:forEvent:inState:", CFSTR("Stopping"), CFSTR("Stop"), CFSTR("Ready"));
    objc_msgSend(v10, "ignoreEvent:inState:", CFSTR("Stop"), CFSTR("Stopping"));
    objc_msgSend(v10, "setDestinationState:forEvent:inState:", CFSTR("Invalid"), CFSTR("Finished stopping"), CFSTR("Stopping"));
    objc_msgSend(v10, "ignoreEvent:inState:", CFSTR("Stop"), CFSTR("Invalid"));
    objc_msgSend(v10, "setDelegate:", v5);
    objc_msgSend(v10, "activateWithState:", CFSTR("Initial"));
    stateMachine = v5->_stateMachine;
    v5->_stateMachine = (VSStateMachine *)v10;

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  VSApplication *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating application: %p", buf, 0xCu);
  }

  VSRequireMainThread();
  v4.receiver = self;
  v4.super_class = (Class)VSApplication;
  -[VSApplication dealloc](&v4, sel_dealloc);
}

- (void)transitionToStartingState
{
  CFRetain(self);
  VSPerformBlockOnMainThread();
}

void __42__VSApplication_transitionToStartingState__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE51928]), "initWithApplication:mode:delegate:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setCanRequireSystemTrustForXHRs:", objc_msgSend(*(id *)(a1 + 32), "canRequireSystemTrust"));
  objc_msgSend(*(id *)(a1 + 32), "setAppContext:", v3);
  objc_msgSend(*(id *)(a1 + 32), "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)transitionToNotifyingOfFailureToStartState
{
  VSPerformBlockOnMainThread();
}

void __59__VSApplication_transitionToNotifyingOfFailureToStartState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "failureToStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "application:startDidFailWithError:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "setFailureToStart:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueEvent:", CFSTR("Finished notifying of failure to start"));

}

- (void)transitionToReadyState
{
  VSPerformBlockOnMainThread();
}

void __39__VSApplication_transitionToReadyState__block_invoke(uint64_t a1)
{
  id v2;

  VSRequireMainThread();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationDidStart:", *(_QWORD *)(a1 + 32));

}

- (void)transitionToStoppingState
{
  id v2;

  -[VSApplication appContext](self, "appContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)transitionToInvalidState
{
  void *v3;

  -[VSApplication setAppContext:](self, "setAppContext:", 0);
  -[VSApplication cookieStorage](self, "cookieStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vs_saveCookies");

  CFRelease(self);
}

- (void)start
{
  id v2;

  -[VSApplication stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueEvent:", CFSTR("Start"));

}

- (void)stop
{
  id v2;

  -[VSApplication stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueEvent:", CFSTR("Stop"));

}

- (void)evaluate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VSApplication appContext](self, "appContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "evaluate:completionBlock:", v7, v6);

}

- (void)sendErrorWithMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSApplication appContext](self, "appContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setException:withErrorMessage:", 0, v4);

}

- (void)appDocumentForDocument:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[VSApplication appDocumentForDocument:completionHandler:]";
    _os_log_impl(&dword_2303C5000, v7, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE51928], "currentAppContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("App"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51938]), "initWithAppContext:document:owner:", v8, v6, v11);

  VSDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v14)
    {
      v16 = 136315138;
      v17 = "-[VSApplication appDocumentForDocument:completionHandler:]";
      _os_log_impl(&dword_2303C5000, v13, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", (uint8_t *)&v16, 0xCu);
    }

    v13 = v5;
    ((void (*)(NSObject *, void *))v13[2].isa)(v13, v12);
    VSDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[VSApplication appDocumentForDocument:completionHandler:]";
      _os_log_impl(&dword_2303C5000, v15, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", (uint8_t *)&v16, 0xCu);
    }

  }
  else if (v14)
  {
    v16 = 136315138;
    v17 = "-[VSApplication appDocumentForDocument:completionHandler:]";
    _os_log_impl(&dword_2303C5000, v13, OS_LOG_TYPE_DEFAULT, "No completion handler passed to %s", (uint8_t *)&v16, 0xCu);
  }

}

- (BOOL)appContext:(id)a3 validateDOMDocument:(id)a4 inContext:(id)a5 error:(id *)a6
{
  return 1;
}

- (void)appContext:(id)a3 didStartWithOptions:(id)a4
{
  id v4;

  -[VSApplication stateMachine](self, "stateMachine", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueEvent:", CFSTR("Finished starting"));

}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a4;
  VSErrorLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[VSApplication appContext:didFailWithError:].cold.1((uint64_t)v5, v6);

  -[VSApplication setFailureToStart:](self, "setFailureToStart:", v5);
  -[VSApplication stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueEvent:", CFSTR("Failed to start"));

}

- (void)appContext:(id)a3 didStopWithOptions:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "App context did stop with options: %@.", (uint8_t *)&v8, 0xCu);
  }

  -[VSApplication stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueEvent:", CFSTR("Finished stopping"));

}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VSApplication delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "application:evaluateAppJavascriptInContext:", self, v5);

}

- (id)objectForMediaItem:(id)a3
{
  return 0;
}

- (id)objectForPlaylist:(id)a3
{
  return 0;
}

- (id)objectForPlayer:(id)a3
{
  return 0;
}

- (id)xhrSessionConfigurationForContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VSApplication cookieStorage](self, "cookieStorage", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1858];
    -[VSApplication auditToken](self, "auditToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vs_defaultSessionConfigurationForSourceAppWithAuditToken:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setHTTPCookieStorage:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)sourceApplicationBundleIdentifierForContext:(id)a3
{
  void *v3;
  void *v4;

  -[VSApplication auditToken](self, "auditToken", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sourceApplicationAuditTokenDataForContext:(id)a3
{
  void *v3;
  void *v4;

  -[VSApplication auditToken](self, "auditToken", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)willPerformXhrRequest:(id)a3
{
  objc_msgSend(a3, "_setNonAppInitiated:", 1);
}

- (BOOL)appIsTrusted
{
  return 0;
}

- (BOOL)shouldIgnoreJSValidation
{
  return 1;
}

- (id)appIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localStorage
{
  return 0;
}

- (id)vendorStorage
{
  return 0;
}

- (id)userDefaultsStorage
{
  return 0;
}

- (id)appLaunchParams
{
  void *v3;
  void *v4;

  -[VSApplication delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchParamsForApplication:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activeDocument
{
  void *v3;
  void *v4;

  -[VSApplication delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAppDocumentForApplication:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)viewElementRegistry
{
  if (viewElementRegistry___vs_lazy_init_predicate != -1)
    dispatch_once(&viewElementRegistry___vs_lazy_init_predicate, &__block_literal_global_11);
  return (id)viewElementRegistry___vs_lazy_init_variable;
}

void __36__VSApplication_viewElementRegistry__block_invoke()
{
  uint64_t v0;
  void *v1;

  __36__VSApplication_viewElementRegistry__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)viewElementRegistry___vs_lazy_init_variable;
  viewElementRegistry___vs_lazy_init_variable = v0;

}

id __36__VSApplication_viewElementRegistry__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE51988], "registerClass:forFeatureName:", objc_opt_class(), CFSTR("WebMessagePort"));
  v0 = objc_alloc_init(MEMORY[0x24BE51A40]);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x24BDF8E10], 162);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x24BDF8E08], 161);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x24BDF8E18], 165);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), *MEMORY[0x24BDF8E20], 163);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("accountName"), 138);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("buttonLockup"), 156);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("description"), 138);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("displayLink"), 157);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), 0x24FE1B968, 158);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("item"), 159);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("img"), 49);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("text"), 138);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("textField"), 140);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("textFieldGroup"), 160);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("title"), 138);
  objc_msgSend(v0, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("twoFactorTextField"), 140);
  +[VSIKItemGroup registerFeature](VSIKItemGroup, "registerFeature");
  return v0;
}

- (NSHTTPCookieStorage)cookieStorage
{
  NSHTTPCookieStorage *v2;

  v2 = self->_cookieStorage;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD15B0], "vs_sharedCookieStorage");
    v2 = (NSHTTPCookieStorage *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The storage parameter must not be nil."));
      v2 = 0;
    }
  }
  return v2;
}

- (NSURL)bootURL
{
  return self->_bootURL;
}

- (IKAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (VSApplicationDelegate)delegate
{
  return (VSApplicationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)canRequireSystemTrust
{
  return self->_canRequireSystemTrust;
}

- (void)setCanRequireSystemTrust:(BOOL)a3
{
  self->_canRequireSystemTrust = a3;
}

- (BOOL)shouldAllowRemoteInspection
{
  return self->_shouldAllowRemoteInspection;
}

- (void)setShouldAllowRemoteInspection:(BOOL)a3
{
  self->_shouldAllowRemoteInspection = a3;
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
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

- (VSAppDeviceConfig)appDeviceConfig
{
  return self->_appDeviceConfig;
}

- (void)setAppDeviceConfig:(id)a3
{
  objc_storeStrong((id *)&self->_appDeviceConfig, a3);
}

- (void)setCookieStorage:(id)a3
{
  objc_storeStrong((id *)&self->_cookieStorage, a3);
}

- (NSError)failureToStart
{
  return self->_failureToStart;
}

- (void)setFailureToStart:(id)a3
{
  objc_storeStrong((id *)&self->_failureToStart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureToStart, 0);
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_appDeviceConfig, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_bootURL, 0);
}

- (void)appContext:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "App context did fail with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
