@implementation SUScriptInterface

- (void)deallocSubscriptionStatusCoordinator
{

}

- (id)subscriptionStatusCoordinator
{
  SUScriptSubscriptionStatusCoordinator *subscriptionStatusCoordinator;
  SUScriptSubscriptionStatusCoordinator *v4;
  SUScriptSubscriptionStatusCoordinator *v5;
  SUScriptSubscriptionStatusCoordinator *v6;

  -[SUScriptObject lock](self, "lock");
  subscriptionStatusCoordinator = self->_subscriptionStatusCoordinator;
  v4 = subscriptionStatusCoordinator;
  if (!subscriptionStatusCoordinator)
  {
    v5 = objc_alloc_init(SUScriptSubscriptionStatusCoordinator);
    self->_subscriptionStatusCoordinator = v5;
    -[SUScriptObject setVisible:](v5, "setVisible:", 1);
    v4 = self->_subscriptionStatusCoordinator;
  }
  v6 = v4;
  -[SUScriptObject unlock](self, "unlock");
  if (!subscriptionStatusCoordinator)
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6);
  return v6;
}

- (void)setSubscriptionStatusCoordinator:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("subscriptionStatusCoordinator")));
}

- (BOOL)launchedToTest
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __61__SUScriptInterface_SUScriptTestingAdditions__launchedToTest__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)*MEMORY[0x24BDF74F8], "launchedToTest");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)isRunningTest
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __60__SUScriptInterface_SUScriptTestingAdditions__isRunningTest__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)*MEMORY[0x24BDF74F8], "isRunningTest");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)startedTest:(id)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __59__SUScriptInterface_SUScriptTestingAdditions__startedTest___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "startedTest:", *(_QWORD *)(a1 + 32));
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  char isKindOfClass;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_7;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(a4, "copyArrayOrDictionaryWithContext:", objc_msgSend(+[SUClientDispatch scriptExecutionContext](SUClientDispatch, "scriptExecutionContext"), "globalExecutionContext"));
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
LABEL_7:
    v6 = 0;
  }
LABEL_8:
  WebThreadRunOnMainThread();

}

uint64_t __73__SUScriptInterface_SUScriptTestingAdditions__finishedTest_extraResults___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "finishedTest:extraResults:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (SUScriptInterface)init
{
  SUScriptInterface *v2;
  SUScriptInterface *v3;
  SUScriptNotificationObserver *v4;
  SUScriptNotificationObserver *notificationObserver;
  NSNumber *safariDismissButtonStyle;
  SUScriptOperationDelegate *v7;
  SUScriptOperationDelegate *scriptOperationDelegate;
  SUScriptStoreBagLoader *v9;
  SUScriptStoreBagLoader *scriptStoreBagLoader;
  void *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *hsaTokenQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUScriptInterface;
  v2 = -[SUScriptObject init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SUScriptInterface initAuthentication](v2, "initAuthentication");
    v4 = objc_alloc_init(SUScriptNotificationObserver);
    notificationObserver = v3->_notificationObserver;
    v3->_notificationObserver = v4;

    -[SUScriptNotificationObserver addEventReceiver:](v3->_notificationObserver, "addEventReceiver:", v3);
    safariDismissButtonStyle = v3->_safariDismissButtonStyle;
    v3->_safariDismissButtonStyle = (NSNumber *)&unk_24DEDC260;

    v7 = objc_alloc_init(SUScriptOperationDelegate);
    scriptOperationDelegate = v3->_scriptOperationDelegate;
    v3->_scriptOperationDelegate = v7;

    v9 = objc_alloc_init(SUScriptStoreBagLoader);
    scriptStoreBagLoader = v3->_scriptStoreBagLoader;
    v3->_scriptStoreBagLoader = v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel__globalEventNotification_, CFSTR("SUScriptInterfaceGlobalEventNotification"), 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel__scriptUserInfoDidChangeNotification_, CFSTR("SUStorePageViewControllerScriptUserInfoDidChangeNotification"), 0);
    v12 = dispatch_queue_create("com.apple.SUScriptInterface.hsaToken", 0);
    hsaTokenQueue = v3->_hsaTokenQueue;
    v3->_hsaTokenQueue = (OS_dispatch_queue *)v12;

    v3->_hsaCurrentIdentifier = 0;
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUScriptInterfaceGlobalEventNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUStorePageViewControllerScriptUserInfoDidChangeNotification"), 0);
  -[SUScriptInterface deallocAuthentication](self, "deallocAuthentication");
  -[SUScriptInterface deallocCarrierBundlingController](self, "deallocCarrierBundlingController");
  -[SUScriptInterface deallocMediaLibrary](self, "deallocMediaLibrary");
  -[SUScriptInterface deallocMetricsController](self, "deallocMetricsController");
  -[SUScriptInterface deallocSubscriptionStatusCoordinator](self, "deallocSubscriptionStatusCoordinator");
  -[SUScriptNotificationObserver removeEventReceiver:](self->_notificationObserver, "removeEventReceiver:", self);
  -[SUScriptOperationDelegate cancelAllOperations](self->_scriptOperationDelegate, "cancelAllOperations");
  -[SUScriptInterface stopListeningForAuthenticationToken](self, "stopListeningForAuthenticationToken");

  v4.receiver = self;
  v4.super_class = (Class)SUScriptInterface;
  -[SUScriptObject dealloc](&v4, sel_dealloc);
}

- (SSAuthenticationContext)authenticationContext
{
  SSAuthenticationContext *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_authenticationContext;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (SUClientInterface)clientInterface
{
  SUClientInterface *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_clientInterface;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (OpaqueJSContext)copyJavaScriptContext
{
  OpaqueJSContext *v3;
  OpaqueJSContext *v4;

  -[SUScriptObject lock](self, "lock");
  v3 = -[WebFrame globalContext](self->_frame, "globalContext");
  v4 = v3;
  if (v3)
    JSGlobalContextRetain(v3);
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (SUScriptInterfaceDelegate)delegate
{
  SUScriptInterfaceDelegate *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_delegate;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (SUScriptKeyValueStore)deviceLocalStorage
{
  SUScriptKeyValueStore *deviceLocalStorage;
  SUScriptKeyValueStore *v4;
  SUScriptKeyValueStore *v5;
  SUScriptKeyValueStore *v6;

  -[SUScriptObject lock](self, "lock");
  deviceLocalStorage = self->_deviceLocalStorage;
  if (!deviceLocalStorage)
  {
    v4 = -[SUScriptKeyValueStore initWithDomain:]([SUScriptKeyValueStore alloc], "initWithDomain:", CFSTR("com.apple.iTunesStoreUI.script.device"));
    v5 = self->_deviceLocalStorage;
    self->_deviceLocalStorage = v4;

    deviceLocalStorage = self->_deviceLocalStorage;
  }
  v6 = deviceLocalStorage;
  -[SUScriptObject unlock](self, "unlock");
  return v6;
}

- (SUScriptWindowContext)scriptWindowContext
{
  SUScriptWindowContext *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_scriptWindowContext;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setAuthenticationContext:(id)a3
{
  SSAuthenticationContext *v4;
  SSAuthenticationContext *authenticationContext;
  SSAuthenticationContext *v6;

  v6 = (SSAuthenticationContext *)a3;
  -[SUScriptObject lock](self, "lock");
  if (self->_authenticationContext != v6)
  {
    v4 = (SSAuthenticationContext *)-[SSAuthenticationContext copy](v6, "copy");
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;

  }
  -[SUScriptObject unlock](self, "unlock");

}

- (void)setClientInterface:(id)a3
{
  SUClientInterface *v5;

  v5 = (SUClientInterface *)a3;
  -[SUScriptObject lock](self, "lock");
  if (self->_clientInterface != v5)
    objc_storeStrong((id *)&self->_clientInterface, a3);
  -[SUScriptObject unlock](self, "unlock");

}

- (void)setDelegate:(id)a3
{
  id threadSafeDelegate;
  id v6;
  id v7;

  v7 = a3;
  -[SUScriptObject lock](self, "lock");
  objc_storeStrong((id *)&self->_delegate, a3);
  objc_msgSend(self->_threadSafeDelegate, "setDelegate:", self->_delegate);
  threadSafeDelegate = self->_threadSafeDelegate;
  if (!self->_delegate)
  {
    v6 = 0;
    goto LABEL_5;
  }
  if (!threadSafeDelegate)
  {
    v6 = objc_alloc_init(MEMORY[0x24BEC8B80]);
    objc_msgSend(v6, "setDelegate:", self->_delegate);
    objc_msgSend(v6, "setShouldMessageMainThread:", 1);
    threadSafeDelegate = self->_threadSafeDelegate;
LABEL_5:
    self->_threadSafeDelegate = v6;

  }
  -[SUScriptObject unlock](self, "unlock");

}

- (void)setScriptWindowContext:(id)a3
{
  SUScriptWindowContext *v5;

  v5 = (SUScriptWindowContext *)a3;
  -[SUScriptObject lock](self, "lock");
  if (self->_scriptWindowContext != v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&self->_scriptWindowContext, a3);
  }
  -[SUScriptObject unlock](self, "unlock");

}

- (void)setWebFrame:(id)a3
{
  char isKindOfClass;
  WebFrame *v6;

  v6 = (WebFrame *)a3;
  -[SUScriptObject lock](self, "lock");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (self->_frame != v6 && (v6 == 0) | isKindOfClass & 1)
    objc_storeStrong((id *)&self->_frame, a3);
  -[SUScriptObject unlock](self, "unlock");

}

- (SUScriptInterfaceDelegate)threadSafeDelegate
{
  id v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_threadSafeDelegate;
  -[SUScriptObject unlock](self, "unlock");
  return (SUScriptInterfaceDelegate *)v3;
}

- (WebFrame)webFrame
{
  WebFrame *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_frame;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

+ (int64_t)purchaseAnimationStyleFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "isEqualToString:", CFSTR("float")) & 1) != 0;

  return v4;
}

- (id)DOMElementWithElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SUScriptInterface delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DOMElementForScriptInterface:element:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)parentViewController
{
  void *v3;
  void *v4;

  -[SUScriptInterface delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewControllerForScriptInterface:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)acknowledgePrivacyLinkWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  SUScriptInterface *v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid acknowlegement identifier"));
    return;
  }
  if (!v4)
    goto LABEL_4;
  v5 = objc_alloc(MEMORY[0x24BEC8BB8]);
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBagContext:", v6);

  objc_initWeak(&location, v7);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __58__SUScriptInterface_acknowledgePrivacyLinkWithIdentifier___block_invoke;
  v13 = &unk_24DE7B050;
  objc_copyWeak(&v16, &location);
  v14 = self;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v7, "setCompletionBlock:", &v10);
  objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue", v10, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v7);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __58__SUScriptInterface_acknowledgePrivacyLinkWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "URLBag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("privacyAcknowledgementUrl"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length")
      || (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4), (v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = objc_claimAutoreleasedReturnValue();
      v13 = -[NSObject shouldLog](v6, "shouldLog");
      if (-[NSObject shouldLogToDisk](v6, "shouldLogToDisk"))
        v14 = v13 | 2;
      else
        v14 = v13;
      -[NSObject OSLogObject](v6, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        v14 &= 2u;
      if (v14)
      {
        *(_DWORD *)v23 = 138543618;
        *(_QWORD *)&v23[4] = objc_opt_class();
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[SUScriptInterface acknowledgePrivacyLinkWithIdentifier:]_block_invoke";
        v16 = *(id *)&v23[4];
        LODWORD(v22) = 22;
        v17 = (void *)_os_log_send_and_compose_impl();

        if (!v17)
          goto LABEL_31;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, v23, v22, *(_QWORD *)v23, *(_OWORD *)&v23[8], v24);
        v15 = objc_claimAutoreleasedReturnValue();
        free(v17);
        SSFileLog();
      }

      goto LABEL_31;
    }
    v6 = v5;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      *(_DWORD *)v23 = 138543362;
      *(_QWORD *)&v23[4] = objc_opt_class();
      v11 = *(id *)&v23[4];
      LODWORD(v22) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        objc_msgSend(MEMORY[0x24BEB1F60], "acknowledgePrivacyLinkWithIdentifier:URL:", *(_QWORD *)(a1 + 40), v6);
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, v23, v22, *(_OWORD *)v23);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v19 = v18 | 2;
  else
    v19 = v18;
  objc_msgSend(v4, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v19 &= 2u;
  if (!v19)
    goto LABEL_31;
  *(_DWORD *)v23 = 138543618;
  *(_QWORD *)&v23[4] = objc_opt_class();
  *(_WORD *)&v23[12] = 2080;
  *(_QWORD *)&v23[14] = "-[SUScriptInterface acknowledgePrivacyLinkWithIdentifier:]_block_invoke";
  v20 = *(id *)&v23[4];
  LODWORD(v22) = 22;
  v21 = (void *)_os_log_send_and_compose_impl();

  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, v23, v22, *(_QWORD *)v23, *(_OWORD *)&v23[8], v24);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v21);
    SSFileLog();
    goto LABEL_31;
  }
LABEL_32:

}

- (void)addiTunesPassWithCompletionFunction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SUAddiTunesPassOperation *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  SUScriptInterface *v12;
  SUAddiTunesPassOperation *v13;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    -[SUScriptInterface viewController](self, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nativeViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[SUAddiTunesPassOperation initWithViewController:]([SUAddiTunesPassOperation alloc], "initWithViewController:", v6);
    -[SUScriptInterface authenticationContext](self, "authenticationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAddiTunesPassOperation setAuthenticationContext:](v7, "setAuthenticationContext:", v8);

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__SUScriptInterface_addiTunesPassWithCompletionFunction___block_invoke;
    v10[3] = &unk_24DE7B078;
    v13 = v7;
    v11 = v4;
    v12 = self;
    -[SUAddiTunesPassOperation setCompletionBlock:](v7, "setCompletionBlock:", v10);
    objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v7);

  }
}

void __57__SUScriptInterface_addiTunesPassWithCompletionFunction___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  WebThreadRunOnMainThread();

}

void __57__SUScriptInterface_addiTunesPassWithCompletionFunction___block_invoke_2(uint64_t a1)
{
  void *v2;
  SUScriptPassbookPass *v3;
  void *v4;
  SUScriptPassbookPass *v5;
  SUScriptFunction *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 48), "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [SUScriptPassbookPass alloc];
    objc_msgSend(*(id *)(a1 + 48), "pass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SUScriptPassbookPass initWithPass:](v3, "initWithPass:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v5 = (SUScriptPassbookPass *)objc_claimAutoreleasedReturnValue();
  }

  v6 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  -[SUScriptFunction setThisObject:](v6, "setThisObject:", *(_QWORD *)(a1 + 40));
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptFunction callWithArguments:](v6, "callWithArguments:", v7);

  -[SUScriptFunction setThisObject:](v6, "setThisObject:", 0);
}

- (id)currentAttestationVersion
{
  dispatch_semaphore_t v3;
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v17;
  _QWORD v18[5];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = objc_alloc_init(MEMORY[0x24BEB1DD8]);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __46__SUScriptInterface_currentAttestationVersion__block_invoke;
  v18[3] = &unk_24DE7B0A0;
  v18[4] = self;
  v20 = &v21;
  v5 = v3;
  v19 = v5;
  objc_msgSend(v4, "getCurrentACLVersionWithCompletion:", v18);
  v6 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    v9 = objc_msgSend(v7, "shouldLogToDisk");
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      v8 |= 2u;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      v12 = (void *)objc_opt_class();
      v27 = 138543362;
      v28 = v12;
      v13 = v12;
      LODWORD(v17) = 12;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v27, v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog();
    }

    goto LABEL_10;
  }
LABEL_11:
  v15 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __46__SUScriptInterface_currentAttestationVersion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (!v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    v10 &= 2u;
  if (!v10)
    goto LABEL_10;
  *(_DWORD *)v15 = 138543618;
  *(_QWORD *)&v15[4] = objc_opt_class();
  *(_WORD *)&v15[12] = 2114;
  *(_QWORD *)&v15[14] = v7;
  v12 = *(id *)&v15[4];
  LODWORD(v14) = 22;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, v15, v14, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog();
LABEL_10:

  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)openCreditCardReaderWithCompletionFunction:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    v4 = v3;
    WebThreadRunOnMainThread();

  }
}

void __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SUCreditCardReaderViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke_2;
    v17[3] = &unk_24DE7B0C8;
    v6 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v6;
    objc_msgSend(v3, "clientInterface:overrideCreditCardPresentationFromViewController:completion:", v4, v5, v17);

  }
  else
  {
    v7 = objc_alloc_init(SUCreditCardReaderViewController);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v7);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke_3;
    v14 = &unk_24DE7B0C8;
    v9 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v9;
    -[SUCreditCardReaderViewController setCompletionBlock:](v7, "setCompletionBlock:", &v11);
    objc_msgSend(*(id *)(a1 + 32), "parentViewController", v11, v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

uint64_t __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishCreditCardReaderWithOutput:callback:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __64__SUScriptInterface_openCreditCardReaderWithCompletionFunction___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishCreditCardReaderWithOutput:callback:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_finishCreditCardReaderWithOutput:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  WebThreadRunOnMainThread();

}

void __64__SUScriptInterface__finishCreditCardReaderWithOutput_callback___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  SUScriptFunction *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_opt_new();
  v4 = v3;
  v5 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a1[5]);
  -[SUScriptFunction setThisObject:](v5, "setThisObject:", a1[6]);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptFunction callWithArguments:](v5, "callWithArguments:", v6);

  -[SUScriptFunction setThisObject:](v5, "setThisObject:", 0);
}

- (void)openFamilyCircleSetupWithClientName:(id)a3 completionFunction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  id v18;
  id v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v11 = v9;
    else
      v11 = v9 & 2;
    if (!v11)
      goto LABEL_23;
    v20 = 138543362;
    v21 = v6;
    LODWORD(v17) = 12;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
LABEL_22:
      objc_msgSend(v13, "stringWithCString:encoding:", v12, 4, &v20, v17);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
LABEL_23:

    }
LABEL_24:

    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v16 = v15;
    else
      v16 = v15 & 2;
    if (!v16)
      goto LABEL_23;
    v20 = 138543362;
    v21 = v5;
    LODWORD(v17) = 12;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  v18 = v6;
  v19 = v5;
  WebThreadRunOnMainThread();

LABEL_25:
}

void __76__SUScriptInterface_openFamilyCircleSetupWithClientName_completionFunction___block_invoke(uint64_t a1)
{
  SUScriptFunction *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SUScriptFunction *v17;
  uint64_t v18;
  _QWORD v19[4];
  SUScriptFunction *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  -[SUScriptFunction setThisObject:](v2, "setThisObject:", *(_QWORD *)(a1 + 40));
  v3 = objc_alloc(getFACircleContextClass());
  getFACircleEventTypeInitiate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEventType:", v4);

  objc_msgSend(v5, "setClientName:", *(_QWORD *)(a1 + 48));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v6 = objc_alloc(getFACircleStateControllerClass());
  objc_msgSend(*(id *)(a1 + 40), "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v6, "initWithPresenter:", v7);

  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldLog");
  v10 = objc_msgSend(v8, "shouldLogToDisk");
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v9 |= 2u;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    v13 = v9;
  else
    v13 = v9 & 2;
  if (!v13)
    goto LABEL_9;
  v14 = v23[5];
  v28 = 138543618;
  v29 = v14;
  v30 = 2114;
  v31 = v5;
  LODWORD(v18) = 22;
  v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v28, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    free(v15);
    SSFileLog();
LABEL_9:

  }
  v16 = (void *)v23[5];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __76__SUScriptInterface_openFamilyCircleSetupWithClientName_completionFunction___block_invoke_67;
  v19[3] = &unk_24DE7B140;
  v21 = &v22;
  v17 = v2;
  v20 = v17;
  objc_msgSend(v16, "performOperationWithContext:completion:", v5, v19);

  _Block_object_dispose(&v22, 8);
}

void __76__SUScriptInterface_openFamilyCircleSetupWithClientName_completionFunction___block_invoke_67(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SUScriptError *v16;
  id *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int *v22;
  uint64_t v23;
  _QWORD v24[2];
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    v10 = v8;
  else
    v10 = v8 & 2;
  if (!v10)
    goto LABEL_12;
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v12 = "NO";
  if (a2)
    v12 = "YES";
  v25 = 138543874;
  v26 = v11;
  v27 = 2082;
  v28 = v12;
  v29 = 2114;
  v30 = v5;
  LODWORD(v23) = 32;
  v22 = &v25;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v25, v23);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v13);
    v22 = (int *)v9;
    SSFileLog();
LABEL_12:

  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

  if (v5)
    v16 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", v5);
  else
    v16 = 0;
  v17 = (id *)MEMORY[0x24BDBD270];
  v18 = *(void **)(a1 + 32);
  if (!a2)
    v17 = (id *)MEMORY[0x24BDBD268];
  v19 = *v17;
  v24[0] = v19;
  v20 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "callWithArguments:", v21);

  if (!v16)
}

- (void)dispatchGlobalEventWithName:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  SUScriptInterface *v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SUScriptInterface_dispatchGlobalEventWithName_payload___block_invoke;
    block[3] = &unk_24DE7B118;
    v9 = v6;
    v10 = v7;
    v11 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __57__SUScriptInterface_dispatchGlobalEventWithName_payload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(v6, "setObject:forKey:", v2, CFSTR("name"));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("payload"));
  objc_msgSend(*(id *)(a1 + 48), "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("viewController"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SUScriptInterfaceGlobalEventNotification"), *(_QWORD *)(a1 + 48), v6);

}

- (void)dispatchXEvent:(id)a3
{
  id v4;
  OpaqueJSContext *v5;
  OpaqueJSContext *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUScriptInterface copyJavaScriptContext](self, "copyJavaScriptContext");
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(v4, "copyArrayOrDictionaryWithContext:", v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        WebThreadRunOnMainThread();

      }
      JSGlobalContextRelease(v6);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __36__SUScriptInterface_dispatchXEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dispatchXEvent:withCompletionBlock:", *(_QWORD *)(a1 + 40), 0);

}

- (void)fetchAppleCardMetadata:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  int v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, void *);
  void *v40;
  id v41;
  SUScriptInterface *v42;
  const __CFString *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v7 = 0;
  }
  v37 = MEMORY[0x24BDAC760];
  v38 = 3221225472;
  v39 = __53__SUScriptInterface_fetchAppleCardMetadata_callback___block_invoke;
  v40 = &unk_24DE7B168;
  v8 = v7;
  v41 = v8;
  v42 = self;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x220763634](&v37);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "shouldLog");
    if (objc_msgSend(v20, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    objc_msgSend(v20, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      v22 &= 2u;
    if (v22)
    {
      v24 = (void *)objc_opt_class();
      v45 = 138543362;
      v46 = v24;
      v25 = v24;
      LODWORD(v36) = 12;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
        goto LABEL_39;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v45, v36, v37, v38, v39, v40);
      v23 = objc_claimAutoreleasedReturnValue();
      free(v26);
      SSFileLog();
    }

    goto LABEL_39;
  }
  if ((objc_msgSend(MEMORY[0x24BEC8B68], "shouldUseExtendedEnrollment") & 1) != 0)
  {
    -[objc_class appleCardIconString](getAMSUICardMetadataClass(), "appleCardIconString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10)
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v13 &= 2u;
      if (v13)
      {
        v16 = (void *)objc_opt_class();
        v45 = 138543362;
        v46 = v16;
        v17 = v16;
        LODWORD(v36) = 12;
        v18 = (void *)_os_log_send_and_compose_impl();

        if (!v18)
        {
LABEL_19:

          v43 = CFSTR("cardArtwork");
          v44 = v10;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v19, 0);
LABEL_47:

          goto LABEL_48;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v45, v36, v37, v38, v39, v40);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        free(v18);
        SSFileLog();
      }

      goto LABEL_19;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      v13 &= 2u;
    if (v13)
    {
      v33 = (void *)objc_opt_class();
      v45 = 138543362;
      v46 = v33;
      v34 = v33;
      LODWORD(v36) = 12;
      v35 = (void *)_os_log_send_and_compose_impl();

      if (!v35)
      {
LABEL_46:

        ISError();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v19);
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v35, 4, &v45, v36, v37, v38, v39, v40);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      free(v35);
      SSFileLog();
    }

    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v20, "shouldLog");
  if (objc_msgSend(v20, "shouldLogToDisk"))
    v28 = v27 | 2;
  else
    v28 = v27;
  objc_msgSend(v20, "OSLogObject");
  v29 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    v28 &= 2u;
  if (!v28)
    goto LABEL_38;
  v30 = (void *)objc_opt_class();
  v45 = 138543362;
  v46 = v30;
  v31 = v30;
  LODWORD(v36) = 12;
  v32 = (void *)_os_log_send_and_compose_impl();

  if (v32)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v32, 4, &v45, v36, v37, v38, v39, v40);
    v29 = objc_claimAutoreleasedReturnValue();
    free(v32);
    SSFileLog();
LABEL_38:

  }
LABEL_39:

  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  ISError();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v10);
LABEL_48:

}

void __53__SUScriptInterface_fetchAppleCardMetadata_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SUScriptFunction *v7;
  SUScriptError *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  -[SUScriptFunction setThisObject:](v7, "setThisObject:", *(_QWORD *)(a1 + 40));
  if (v6)
  {
    v8 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", v6);
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = v8;
    v10 = v13;
  }
  else
  {
    v8 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v5);
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    v10 = v12;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptFunction callWithArguments:](v7, "callWithArguments:", v11);

  -[SUScriptFunction setThisObject:](v7, "setThisObject:", 0);
}

- (void)fetchWalletCardData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  __CFString *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  _QWORD *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id location;
  id from[6];

  from[3] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __41__SUScriptInterface_fetchWalletCardData___block_invoke;
  v36[3] = &unk_24DE7B190;
  objc_copyWeak(&v38, &location);
  v6 = v4;
  v37 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x220763634](v36);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  v35 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldLog");
    v14 = objc_msgSend(v12, "shouldLogToDisk");
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
      v13 |= 2u;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      v13 &= 2u;
    if (v13)
    {
      v17 = (void *)objc_opt_class();
      LODWORD(from[0]) = 138543362;
      *(id *)((char *)from + 4) = v17;
      v18 = v17;
      LODWORD(v27) = 12;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
        goto LABEL_24;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, from, v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog();
    }

    goto LABEL_24;
  }
  if ((objc_msgSend(MEMORY[0x24BEC8B68], "shouldUseExtendedEnrollment") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v12, "shouldLog");
    v21 = objc_msgSend(v12, "shouldLogToDisk");
    objc_msgSend(v12, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
      v20 |= 2u;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      v20 &= 2u;
    if (v20)
    {
      v24 = (void *)objc_opt_class();
      LODWORD(from[0]) = 138543362;
      *(id *)((char *)from + 4) = v24;
      v25 = v24;
      LODWORD(v27) = 12;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
      {
LABEL_24:

        objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
        ISError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v10);
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, from, v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      free(v26);
      SSFileLog();
    }

    goto LABEL_24;
  }
  v8 = objc_alloc(MEMORY[0x24BEC8BB8]);
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithBagContext:", v9);

  objc_initWeak(from, v10);
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __41__SUScriptInterface_fetchWalletCardData___block_invoke_96;
  v28[3] = &unk_24DE7B1E0;
  objc_copyWeak(&v32, &location);
  objc_copyWeak(&v33, from);
  v31 = v34;
  v29 = CFSTR("Fetch Wallet Card Data Error");
  v30 = v7;
  objc_msgSend(v10, "setCompletionBlock:", v28);
  objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v10);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(from);
LABEL_25:

  _Block_object_dispose(v34, 8);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

}

void __41__SUScriptInterface_fetchWalletCardData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  SUScriptFunction *v8;
  SUScriptError *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  SUScriptDictionary *v41;
  void *v42;
  void *v43;
  int *v44;
  int *v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  _QWORD v53[2];
  int v54;
  id v55;
  _QWORD v56[3];

  v56[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  -[SUScriptFunction setThisObject:](v8, "setThisObject:", WeakRetained);
  if (!v6)
  {
    objc_msgSend(v5, "cardData");
    v9 = (SUScriptError *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[SUScriptError bytes](v9, "bytes");
    -[SUScriptError length](v9, "length");
    v12 = ISCopyEncodedBase64();
    objc_msgSend(v5, "brokerURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "paymentServicesURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v51 = v17;
    v52 = (void *)v16;
    if (v12)
    {
      v18 = v17;
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("cardData"));
      if (v14)
      {
LABEL_5:
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("brokerURL"), v44);
        goto LABEL_26;
      }
LABEL_16:
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", v44);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "shouldLog");
      if (objc_msgSend(v24, "shouldLogToDisk"))
        v26 = v25 | 2;
      else
        v26 = v25;
      objc_msgSend(v24, "OSLogObject");
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        v26 &= 2u;
      if (v26)
      {
        v28 = (void *)objc_opt_class();
        v54 = 138543362;
        v55 = v28;
        v48 = v28;
        LODWORD(v46) = 12;
        v45 = &v54;
        v29 = (void *)_os_log_send_and_compose_impl();

        if (!v29)
        {
LABEL_25:

          v18 = v51;
          v16 = (uint64_t)v52;
LABEL_26:
          v50 = (void *)v14;
          if (v16)
          {
            v30 = (void *)v12;
            v31 = WeakRetained;
            v32 = v5;
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("paymentServicesURL"));
            v33 = (void *)v16;
LABEL_38:
            v40 = v18;
            v41 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v18);
            v53[0] = v41;
            objc_msgSend(MEMORY[0x24BDFA958], "undefined");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v53[1] = v42;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUScriptFunction callWithArguments:](v8, "callWithArguments:", v43);

            v5 = v32;
            WeakRetained = v31;
            v6 = 0;
            v10 = v30;
            v11 = v50;
            goto LABEL_39;
          }
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "shouldLog");
          if (objc_msgSend(v34, "shouldLogToDisk"))
            v36 = v35 | 2;
          else
            v36 = v35;
          objc_msgSend(v34, "OSLogObject", v45);
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            v36 &= 2u;
          if (v36)
          {
            v38 = (void *)objc_opt_class();
            v54 = 138543362;
            v55 = v38;
            v49 = v38;
            LODWORD(v46) = 12;
            v39 = (void *)_os_log_send_and_compose_impl();

            if (!v39)
            {
LABEL_37:
              v30 = (void *)v12;
              v31 = WeakRetained;
              v32 = v5;

              v18 = v51;
              v33 = v52;
              goto LABEL_38;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v39, 4, &v54, v46);
            v37 = objc_claimAutoreleasedReturnValue();
            free(v39);
            SSFileLog();
          }

          goto LABEL_37;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v29, 4, &v54, v46);
        v27 = objc_claimAutoreleasedReturnValue();
        free(v29);
        v45 = (int *)v27;
        SSFileLog();
      }

      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "shouldLog");
    if (objc_msgSend(v19, "shouldLogToDisk"))
      v21 = v20 | 2;
    else
      v21 = v20;
    objc_msgSend(v19, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      v21 &= 2u;
    if (v21)
    {
      v54 = 138543362;
      v55 = (id)objc_opt_class();
      v47 = v55;
      LODWORD(v46) = 12;
      v44 = &v54;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v54, v46);
      v22 = objc_claimAutoreleasedReturnValue();
      free(v23);
      v44 = (int *)v22;
      SSFileLog();
    }

LABEL_15:
    v18 = v51;
    v16 = (uint64_t)v52;
    if (v14)
      goto LABEL_5;
    goto LABEL_16;
  }
  v9 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", v6);
  objc_msgSend(MEMORY[0x24BDFA958], "undefined");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v10;
  v56[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptFunction callWithArguments:](v8, "callWithArguments:", v11);
LABEL_39:

  -[SUScriptFunction setThisObject:](v8, "setThisObject:", 0);
}

void __41__SUScriptInterface_fetchWalletCardData___block_invoke_96(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int *v40;
  int *v41;
  uint64_t v42;
  _QWORD v43[5];
  id v44;
  int v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v3, "URLBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("applepay-merchant-id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v45 = 138543362;
      v46 = (id)objc_opt_class();
      v11 = v46;
      LODWORD(v42) = 12;
      v40 = &v45;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_12:

LABEL_13:
        objc_msgSend(v5, "valueForKey:", CFSTR("countryCode"), v40);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uppercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          if (v6)
            goto LABEL_47;
LABEL_36:
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", v41);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "shouldLog");
          if (objc_msgSend(v29, "shouldLogToDisk"))
            v31 = v30 | 2;
          else
            v31 = v30;
          objc_msgSend(v29, "OSLogObject");
          v32 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            v31 &= 2u;
          if (v31)
          {
            v33 = (void *)objc_opt_class();
            v45 = 138543362;
            v46 = v33;
            v34 = v33;
            LODWORD(v42) = 12;
            v35 = (void *)_os_log_send_and_compose_impl();

            if (!v35)
            {
LABEL_45:

              objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
              ISError();
              v21 = objc_claimAutoreleasedReturnValue();
              goto LABEL_46;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v35, 4, &v45, v42);
            v32 = objc_claimAutoreleasedReturnValue();
            free(v35);
            SSFileLog();
          }

          goto LABEL_45;
        }
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "shouldLog");
        if (objc_msgSend(v22, "shouldLogToDisk"))
          v24 = v23 | 2;
        else
          v24 = v23;
        objc_msgSend(v22, "OSLogObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          v24 &= 2u;
        if (v24)
        {
          v26 = (void *)objc_opt_class();
          v45 = 138543362;
          v46 = v26;
          v27 = v26;
          LODWORD(v42) = 12;
          v41 = &v45;
          v28 = (void *)_os_log_send_and_compose_impl();

          if (!v28)
          {
LABEL_35:

            goto LABEL_36;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v45, v42);
          v25 = objc_claimAutoreleasedReturnValue();
          free(v28);
          v41 = (int *)v25;
          SSFileLog();
        }

        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v45, v42);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      v40 = (int *)v10;
      SSFileLog();
    }

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldLog");
  if (objc_msgSend(v15, "shouldLogToDisk"))
    v17 = v16 | 2;
  else
    v17 = v16;
  objc_msgSend(v15, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    v17 &= 2u;
  if (!v17)
    goto LABEL_24;
  v45 = 138543362;
  v46 = (id)objc_opt_class();
  v19 = v46;
  LODWORD(v42) = 12;
  v20 = (void *)_os_log_send_and_compose_impl();

  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v45, v42);
    v18 = objc_claimAutoreleasedReturnValue();
    free(v20);
    SSFileLog();
LABEL_24:

  }
  ISError();
  v21 = objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v6 = 0;
LABEL_46:
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v37 = *(void **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = v21;

LABEL_47:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE080C8]), "initWithCountryCode:merchantIdentifier:", v14, v6);
    objc_msgSend(v38, "performCardRegistration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __41__SUScriptInterface_fetchWalletCardData___block_invoke_102;
    v43[3] = &unk_24DE7B1B8;
    v43[4] = WeakRetained;
    v44 = *(id *)(a1 + 40);
    objc_msgSend(v39, "addFinishBlock:", v43);

  }
}

void __41__SUScriptInterface_fetchWalletCardData___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      *(_DWORD *)v14 = 138543618;
      *(_QWORD *)&v14[4] = objc_opt_class();
      *(_WORD *)&v14[12] = 2114;
      *(_QWORD *)&v14[14] = v6;
      v11 = *(id *)&v14[4];
      LODWORD(v13) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchWalletCardMetadata:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  OpaqueJSContext *v15;
  void *v16;
  id v17;
  void *v18;
  SUScriptFunction *v19;
  void *v20;
  void *v21;
  SUScriptError *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  int v29;
  void *v30;
  id v31;
  void *v32;
  SUScriptFunction *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  int *v40;
  uint64_t v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  int v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      v48 = 138543362;
      v49 = (id)objc_opt_class();
      v13 = v49;
      LODWORD(v41) = 12;
      v40 = &v48;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_11:

        objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v48, v41);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v14);
      v40 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  if (!objc_msgSend(MEMORY[0x24BEC8B68], "shouldUseExtendedEnrollment", v40))
  {
    v19 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", v7);
    -[SUScriptFunction setThisObject:](v19, "setThisObject:", self);
    ISError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", v18);
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v23;
    v46[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptFunction callWithArguments:](v19, "callWithArguments:", v24);

    -[SUScriptFunction setThisObject:](v19, "setThisObject:", 0);
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v7 = 0;
  }
  v15 = -[SUScriptInterface copyJavaScriptContext](self, "copyJavaScriptContext");
  v43 = v6;
  v16 = (void *)objc_msgSend(v6, "copyArrayOrDictionaryWithContext:", v15);
  JSGlobalContextRelease(v15);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = v16;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v21, "shouldLog");
    if (objc_msgSend(v21, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    objc_msgSend(v21, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      v29 = v27;
    else
      v29 = v27 & 2;
    if (v29)
    {
      v30 = (void *)objc_opt_class();
      v48 = 138543362;
      v49 = v30;
      v31 = v30;
      LODWORD(v41) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      v16 = v25;
      if (!v18)
      {
        v22 = 0;
        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v48, v41);
      v28 = objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog();
    }
    else
    {
      v16 = v25;
    }

    v22 = 0;
    v18 = 0;
LABEL_34:
    v19 = 0;
    goto LABEL_35;
  }
  v17 = v16;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("passSerialNumber"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("passTypeIdentifier"));
  v19 = (SUScriptFunction *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("size"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
  v22 = (SUScriptError *)objc_claimAutoreleasedReturnValue();
LABEL_35:

  -[objc_class metadataForPassTypeIdentifier:serialNumber:cardArtworkSize:](getAMSUICardMetadataClass(), "metadataForPassTypeIdentifier:serialNumber:cardArtworkSize:", v19, v18, v22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v33 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", v7);
    -[SUScriptFunction setThisObject:](v33, "setThisObject:", self);
    v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __54__SUScriptInterface_fetchWalletCardMetadata_callback___block_invoke;
    v44[3] = &unk_24DE7B208;
    v45 = v34;
    v42 = v34;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", v44);
    v35 = (void *)objc_msgSend(v42, "copy");
    v47[0] = v35;
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v36 = v7;
    v37 = v16;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptFunction callWithArguments:](v33, "callWithArguments:", v39);

    v16 = v37;
    v7 = v36;

    -[SUScriptFunction setThisObject:](v33, "setThisObject:", 0);
  }

  v6 = v43;
LABEL_38:

}

void __54__SUScriptInterface_fetchWalletCardMetadata_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SUScriptDictionary *v4;
  void *v5;
  SUScriptDictionary *v6;

  v3 = a2;
  v4 = [SUScriptDictionary alloc];
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SUScriptDictionary initWithDictionary:](v4, "initWithDictionary:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (void)financeInterruptionResolved:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v8, "BOOLValue");
    -[SUScriptInterface clientInterface](self, "clientInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SUScriptInterface clientInterface](self, "clientInterface");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientInterface:financeInterruptionResolved:", v7, v4);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

- (id)getiTunesPass
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  SUScriptPassbookPass *v7;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ITunesPassSerialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init((Class)ISWeakLinkedClassForString());
    objc_msgSend(v5, "passWithPassTypeIdentifier:serialNumber:", CFSTR("pass.com.apple.itunes.storecredit"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = -[SUScriptPassbookPass initWithPass:]([SUScriptPassbookPass alloc], "initWithPass:", v6);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)handleDialogPropertyListString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x220763454]();
  SUScriptPropertyListFromString(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    WebThreadRunOnMainThread();

  }
  objc_autoreleasePoolPop(v4);

}

void __52__SUScriptInterface_handleDialogPropertyListString___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8B90]), "initWithDialogDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "clientInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentDialog:", v3);

}

- (void)log:(id)a3
{
  NSLog(CFSTR("JS: %@"), a2, a3);
}

- (id)machineGUID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)minimumAttestationVersionForAction:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE08080], "minimumACLVersionForAction:", a3);
}

- (void)openWallet
{
  WebThreadRunOnMainThread();
}

void __31__SUScriptInterface_openWallet__block_invoke()
{
  int v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)ISWeakLinkedClassForString(), "isPassLibraryAvailable");
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "OSLogObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v0)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = (id)objc_opt_class();
      v4 = v12;
      _os_log_impl(&dword_21B3EF000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: OpenWallet: Will open Wallet", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = CFSTR("shoebox://");
    if (v6 == 1)
      v7 = CFSTR("prefs:root=PASSBOOK");
    v8 = (void *)MEMORY[0x24BDC1548];
    v9 = v7;
    objc_msgSend(v8, "defaultWorkspace");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v3 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "openSensitiveURL:withOptions:", v3, 0);
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v11 = 138543362;
    v12 = (id)objc_opt_class();
    v10 = v12;
    _os_log_impl(&dword_21B3EF000, v3, OS_LOG_TYPE_ERROR, "%{public}@: OpenWallet: PassKit not available", (uint8_t *)&v11, 0xCu);

  }
}

- (void)paymentSetupFeatureSupported:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  char v11;
  id v12;
  OpaqueJSContext *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  int v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  int v45;
  int v46;
  NSObject *v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  int v58;
  NSObject *v59;
  void *v60;
  int v61;
  int v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  void (**v75)(_QWORD, _QWORD, _QWORD);
  _QWORD v76[4];
  id v77;
  id v78;
  id location;
  int v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v76[0] = MEMORY[0x24BDAC760];
  v76[1] = 3221225472;
  v76[2] = __59__SUScriptInterface_paymentSetupFeatureSupported_callback___block_invoke;
  v76[3] = &unk_24DE7B258;
  v8 = v7;
  v77 = v8;
  objc_copyWeak(&v78, &location);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x220763634](v76);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "shouldLog");
    v18 = objc_msgSend(v16, "shouldLogToDisk");
    objc_msgSend(v16, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
      v17 |= 2u;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (v17)
    {
      v21 = (void *)objc_opt_class();
      v80 = 138543362;
      v81 = v21;
      v22 = v21;
      LODWORD(v70) = 12;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v80, v70);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      free(v23);
      SSFileLog();
    }

    goto LABEL_21;
  }
  if ((objc_msgSend(MEMORY[0x24BEC8B68], "shouldUseUpsellEnrollment") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v16, "shouldLog");
    v25 = objc_msgSend(v16, "shouldLogToDisk");
    objc_msgSend(v16, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v25)
      v24 |= 2u;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      v24 &= 2u;
    if (!v24)
      goto LABEL_29;
    v28 = (void *)objc_opt_class();
    v80 = 138543362;
    v81 = v28;
    v29 = v28;
    LODWORD(v70) = 12;
    v30 = (void *)_os_log_send_and_compose_impl();

    if (v30)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v30, 4, &v80, v70);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      free(v30);
      SSFileLog();
LABEL_29:

    }
LABEL_21:

    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    ISError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v15);
LABEL_75:

    goto LABEL_76;
  }
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ams_isActiveAccountCombined");

  if ((v11 & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v12, "shouldLog");
      v40 = objc_msgSend(v12, "shouldLogToDisk");
      objc_msgSend(v12, "OSLogObject");
      v41 = objc_claimAutoreleasedReturnValue();
      v14 = v41;
      if (v40)
        v39 |= 2u;
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        v39 &= 2u;
      if (v39)
      {
        v42 = (void *)objc_opt_class();
        v80 = 138543362;
        v81 = v42;
        v43 = v42;
        LODWORD(v70) = 12;
        v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15)
          goto LABEL_61;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v80, v70);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        free(v15);
        SSFileLog();
      }
      goto LABEL_59;
    }
    v12 = v6;
    v13 = -[SUScriptInterface copyJavaScriptContext](self, "copyJavaScriptContext");
    v14 = (id)objc_msgSend(v12, "copyArrayOrDictionaryWithContext:", v13);
    JSGlobalContextRelease(v13);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v14;
      v15 = v14;
LABEL_60:

LABEL_61:
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("referrerIdentifier"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
LABEL_74:
        v67 = objc_alloc_init(MEMORY[0x24BEC8BE0]);
        v73[0] = MEMORY[0x24BDAC760];
        v73[1] = 3221225472;
        v73[2] = __59__SUScriptInterface_paymentSetupFeatureSupported_callback___block_invoke_144;
        v73[3] = &unk_24DE7B280;
        v68 = v55;
        v74 = v68;
        v75 = v9;
        objc_msgSend(v67, "setCompletionBlock:", v73);
        objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addOperation:", v67);

        goto LABEL_75;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "shouldLog");
      v58 = objc_msgSend(v56, "shouldLogToDisk");
      v72 = v56;
      objc_msgSend(v56, "OSLogObject");
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = v59;
      if (v58)
        v61 = v57 | 2;
      else
        v61 = v57;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        v62 = v61;
      else
        v62 = v61 & 2;
      if (v62)
      {
        v63 = (void *)objc_opt_class();
        v80 = 138543362;
        v81 = v63;
        v64 = v63;
        LODWORD(v70) = 12;
        v65 = (void *)_os_log_send_and_compose_impl();

        v66 = v72;
        if (!v65)
        {
LABEL_73:

          goto LABEL_74;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v65, 4, &v80, v70);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        free(v65);
        SSFileLog();
      }
      else
      {
        v66 = v72;
      }

      goto LABEL_73;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "shouldLog");
    v46 = objc_msgSend(v44, "shouldLogToDisk");
    v71 = v44;
    objc_msgSend(v44, "OSLogObject");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v46)
      v49 = v45 | 2;
    else
      v49 = v45;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      v50 = v49;
    else
      v50 = v49 & 2;
    if (v50)
    {
      v51 = (void *)objc_opt_class();
      v80 = 138543362;
      v81 = v51;
      v52 = v51;
      LODWORD(v70) = 12;
      v53 = (void *)_os_log_send_and_compose_impl();

      v54 = v71;
      if (!v53)
      {
LABEL_58:

LABEL_59:
        v15 = 0;
        goto LABEL_60;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v53, 4, &v80, v70);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      free(v53);
      SSFileLog();
    }
    else
    {
      v54 = v71;
    }

    goto LABEL_58;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "shouldLog");
  v33 = objc_msgSend(v31, "shouldLogToDisk");
  objc_msgSend(v31, "OSLogObject");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v33)
    v32 |= 2u;
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    v32 &= 2u;
  if (!v32)
    goto LABEL_38;
  v36 = (void *)objc_opt_class();
  v80 = 138543362;
  v81 = v36;
  v37 = v36;
  LODWORD(v70) = 12;
  v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v38, 4, &v80, v70);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    free(v38);
    SSFileLog();
LABEL_38:

  }
  ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, &unk_24DEDC5E0, 0);
LABEL_76:

  objc_destroyWeak(&v78);
  objc_destroyWeak(&location);

}

void __59__SUScriptInterface_paymentSetupFeatureSupported_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SUScriptFunction *v7;
  id WeakRetained;
  SUScriptDictionary *v9;
  SUScriptError *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  v7 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SUScriptFunction setThisObject:](v7, "setThisObject:", WeakRetained);

  v9 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v6);
  if (v5)
  {
    v10 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", v5);
    v14[0] = v9;
    v14[1] = v10;
    v11 = v14;
  }
  else
  {
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v10 = (SUScriptError *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    v11 = v13;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptFunction callWithArguments:](v7, "callWithArguments:", v12);

  -[SUScriptFunction setThisObject:](v7, "setThisObject:", 0);
}

void __59__SUScriptInterface_paymentSetupFeatureSupported_callback___block_invoke_144(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08318]), "initWithIdentifier:", *(_QWORD *)(a1 + 32));
  v7 = 0;
  v3 = objc_msgSend(v2, "isPaymentSetupFeatureSupportedWithError:", &v7);
  v4 = v7;
  v8 = CFSTR("supported");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)perfLog:(id)a3
{
  CFAbsoluteTime Current;
  id v4;

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  NSLog(CFSTR("JS: [%.2f], %@"), *(_QWORD *)&Current, v4);

}

- (void)performPurchaseAnimationForIdentifier:(id)a3 style:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "purchaseAnimationStyleFromString:", v6);

  if (!v7)
  {
    v8 = v5;
    WebThreadRunOnMainThread();

  }
}

void __65__SUScriptInterface_performPurchaseAnimationForIdentifier_style___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "webFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DOMDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "getElementById:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "DOMElementWithElement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "innerText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    v8 = objc_msgSend(v6, "newLabelForElementWithText:", v7);
  else
    v8 = objc_msgSend(v6, "newImageView");
  v17 = (id)v8;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tabBarController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    objc_msgSend(v11, "convertRect:fromView:", 0);
    objc_msgSend(v17, "setFrame:");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      LODWORD(v12) = 1.0;
      LODWORD(v13) = -1.0;
      v14 = v17;
      v15 = v11;
      v16 = v10;
    }
    else
    {
      LODWORD(v12) = 1051931443;
      v14 = v17;
      v15 = v11;
      v16 = v10;
      LODWORD(v13) = 1051931443;
    }
    +[SUPurchaseAnimator performHopAnimationForView:relativeToView:tabBarController:finalAlpha:scale:](SUPurchaseAnimator, "performHopAnimationForView:relativeToView:tabBarController:finalAlpha:scale:", v14, v15, v16, v12, v13);

  }
}

- (id)presentPrivacyViewControllerWithIdentifier:(id)a3
{
  id v3;
  id v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v30;
  id v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v3)
        goto LABEL_4;
      v6 = objc_alloc(MEMORY[0x24BEC8BB8]);
      objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithBagContext:", v7);

      objc_msgSend(v8, "start");
      objc_msgSend(v8, "URLBag");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "valueForKey:", CFSTR("privacyAcknowledgementUrl"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            v28 = v3;
            v29 = v13;
            v14 = v13;
            WebThreadRunOnMainThread();
            v4 = (id)*MEMORY[0x24BDBD270];

LABEL_21:
LABEL_32:

            return v4;
          }
        }
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "shouldLog");
        if (objc_msgSend(v15, "shouldLogToDisk"))
          v17 = v16 | 2;
        else
          v17 = v16;
        objc_msgSend(v15, "OSLogObject");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          v17 &= 2u;
        if (v17)
        {
          v30 = 138543362;
          v31 = (id)objc_opt_class();
          v19 = v31;
          LODWORD(v27) = 12;
          v20 = (void *)_os_log_send_and_compose_impl();

          if (!v20)
          {
LABEL_20:

            v4 = (id)*MEMORY[0x24BDBD268];
            goto LABEL_21;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v30, v27);
          v18 = objc_claimAutoreleasedReturnValue();
          free(v20);
          SSFileLog();
        }

        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "shouldLog");
      if (objc_msgSend(v21, "shouldLogToDisk"))
        v23 = v22 | 2;
      else
        v23 = v22;
      objc_msgSend(v21, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        v23 &= 2u;
      if (v23)
      {
        v30 = 138543618;
        v31 = (id)objc_opt_class();
        v32 = 2080;
        v33 = "-[SUScriptInterface presentPrivacyViewControllerWithIdentifier:]";
        v25 = v31;
        LODWORD(v27) = 22;
        v26 = (void *)_os_log_send_and_compose_impl();

        if (!v26)
        {
LABEL_31:

          v4 = (id)*MEMORY[0x24BDBD268];
          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v30, v27);
        v24 = objc_claimAutoreleasedReturnValue();
        free(v26);
        SSFileLog();
      }

      goto LABEL_31;
    }
  }

LABEL_4:
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid private vc identifier"));
  v4 = (id)*MEMORY[0x24BDBD268];
  return v4;
}

void __64__SUScriptInterface_presentPrivacyViewControllerWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_9;
  LODWORD(v11) = 138543362;
  *(_QWORD *)((char *)&v11 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v11, v10, v11);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog();
LABEL_9:

  }
  objc_msgSend(MEMORY[0x24BEB1F60], "viewControllerForPrivacySplashWithIdentifier:URL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

}

- (id)presentPrivacySplashWithIdentifier:(id)a3
{
  id v3;
  id v4;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

  }
  else if (v3)
  {
    v7 = v3;
    v6 = v3;
    WebThreadRunOnMainThread();
    v4 = (id)*MEMORY[0x24BDBD270];

    return v4;
  }
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid private vc identifier"));
  v4 = (id)*MEMORY[0x24BDBD268];
  return v4;
}

void __56__SUScriptInterface_presentPrivacySplashWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_9;
  LODWORD(v11) = 138543362;
  *(_QWORD *)((char *)&v11 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v11, v10, v11);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog();
LABEL_9:

  }
  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentingViewController:", v9);

  objc_msgSend(v8, "present");
}

- (void)registerNavBarButtonWithTitle:(id)a3 side:(id)a4 function:(id)a5
{
  id v8;
  id v9;
  SUScriptButton *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_alloc_init(SUScriptButton);
        -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v10);
        -[SUScriptButton setAction:](v10, "setAction:", v9);
        -[WebFrame windowObject](self->_frame, "windowObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUScriptButton setTarget:](v10, "setTarget:", v11);

        -[SUScriptButton setTitle:](v10, "setTitle:", v14);
        LODWORD(v11) = objc_msgSend(v8, "isEqualToString:", CFSTR("left"));
        -[SUScriptInterface navigationBar](self, "navigationBar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if ((_DWORD)v11)
          objc_msgSend(v12, "setLeftButton:animated:", v10, 0);
        else
          objc_msgSend(v12, "setRightButton:animated:", v10, 0);

      }
    }
  }

}

- (void)redeemCode:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("iTunes.redeemCode() no longer supported"));
}

- (void)redeemCodes:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OpaqueJSContext *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  int v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  int v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  int v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int *v42;
  uint64_t v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  SUScriptInterface *v48;
  int v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SUScriptInterface copyJavaScriptContext](self, "copyJavaScriptContext");
      v12 = (void *)objc_msgSend(v8, "copyArrayOrDictionaryWithContext:", v11);
      v13 = (void *)objc_msgSend(v9, "copyArrayOrDictionaryWithContext:", v11);
      JSGlobalContextRelease(v11);
      objc_opt_class();
      v45 = v12;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v12;
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "shouldLog");
      if (objc_msgSend(v23, "shouldLogToDisk"))
        v25 = v24 | 2;
      else
        v25 = v24;
      objc_msgSend(v23, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        v27 = v25;
      else
        v27 = v25 & 2;
      if (v27)
      {
        v49 = 138543362;
        v50 = (id)objc_opt_class();
        v28 = v9;
        v29 = v50;
        LODWORD(v43) = 12;
        v42 = &v49;
        v30 = (void *)_os_log_send_and_compose_impl();

        v9 = v28;
        if (!v30)
        {
LABEL_32:

          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          v14 = 0;
LABEL_33:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = v13;
LABEL_46:
            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F98]), "initWithRedeemCodes:", v14);
            -[SUScriptInterface authenticationContext](self, "authenticationContext");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setAuthenticationContext:", v41);

            objc_msgSend(v40, "setHeadless:", 0);
            objc_msgSend(v40, "setParams:", v31);
            v46[0] = MEMORY[0x24BDAC760];
            v46[1] = 3221225472;
            v46[2] = __51__SUScriptInterface_redeemCodes_params_completion___block_invoke;
            v46[3] = &unk_24DE7B2D0;
            v47 = v10;
            v48 = self;
            objc_msgSend(v40, "startWithRedeemResponseBlock:", v46);

            goto LABEL_47;
          }
          v44 = v9;
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "shouldLog");
          if (objc_msgSend(v32, "shouldLogToDisk"))
            v34 = v33 | 2;
          else
            v34 = v33;
          objc_msgSend(v32, "OSLogObject", v42);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            v36 = v34;
          else
            v36 = v34 & 2;
          if (v36)
          {
            v37 = (void *)objc_opt_class();
            v49 = 138543362;
            v50 = v37;
            v38 = v37;
            LODWORD(v43) = 12;
            v39 = (void *)_os_log_send_and_compose_impl();

            if (!v39)
            {
LABEL_45:

              v31 = 0;
              v9 = v44;
              goto LABEL_46;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v39, 4, &v49, v43);
            v35 = objc_claimAutoreleasedReturnValue();
            free(v39);
            SSFileLog();
          }

          goto LABEL_45;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v30, 4, &v49, v43);
        v26 = objc_claimAutoreleasedReturnValue();
        free(v30);
        v42 = (int *)v26;
        SSFileLog();
      }

      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      v20 &= 2u;
    if (!v20)
      goto LABEL_20;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (!v17)
      goto LABEL_20;
  }
  v49 = 138543362;
  v50 = (id)objc_opt_class();
  v21 = v50;
  LODWORD(v43) = 12;
  v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v49, v43);
    v18 = objc_claimAutoreleasedReturnValue();
    free(v22);
    SSFileLog();
LABEL_20:

  }
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
LABEL_47:

}

void __51__SUScriptInterface_redeemCodes_params_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v7 = v5;
  v8 = v6;
  WebThreadRunOnMainThread();

}

void __51__SUScriptInterface_redeemCodes_params_completion___block_invoke_2(uint64_t a1)
{
  SUScriptFunction *v2;
  SUScriptError *v3;
  SUScriptError *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  SUScriptDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SUScriptFunction *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _BYTE v28[128];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v2 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  -[SUScriptFunction setThisObject:](v2, "setThisObject:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    v3 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v4 = (SUScriptError *)objc_claimAutoreleasedReturnValue();
    v29[0] = v4;
    v29[1] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptFunction callWithArguments:](v2, "callWithArguments:", v5);
LABEL_3:

    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 56), "codeResponses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    ISError();
    v3 = (SUScriptError *)objc_claimAutoreleasedReturnValue();
    v4 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", v3);
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v5;
    v26[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptFunction callWithArguments:](v2, "callWithArguments:", v17);

    goto LABEL_3;
  }
  v21 = v2;
  objc_msgSend(*(id *)(a1 + 56), "codeResponses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (SUScriptError *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = v7;
  v8 = -[SUScriptError countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v3);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 56), "dictionaryForCode:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v10 |= v14 != 0;
        objc_msgSend(*(id *)(a1 + 56), "responseDictionaryForCode:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v15);
        -[SUScriptError addObject:](v4, "addObject:", v16);

      }
      v9 = -[SUScriptError countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v18 = (void *)-[SUScriptError copy](v4, "copy");
  v27[0] = v18;
  objc_msgSend(MEMORY[0x24BDFA958], "undefined");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v21;
  -[SUScriptFunction callWithArguments:](v21, "callWithArguments:", v20);

  if ((v10 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "redeemCodesReloadDownloadManager");
LABEL_4:

  -[SUScriptFunction setThisObject:](v2, "setThisObject:", 0);
}

- (void)redeemCodesReloadDownloadManager
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BEB1E20]);
  objc_msgSend(MEMORY[0x24BEB1E18], "allStoreDownloadKinds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDownloadKinds:", v3);

  v10[0] = *MEMORY[0x24BEB2270];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPrefetchedDownloadExternalProperties:", v4);

  v5 = *MEMORY[0x24BEB2360];
  v9[0] = *MEMORY[0x24BEB2410];
  v9[1] = v5;
  v6 = *MEMORY[0x24BEB2390];
  v9[2] = *MEMORY[0x24BEB2378];
  v9[3] = v6;
  v9[4] = *MEMORY[0x24BEB2398];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPrefetchedDownloadProperties:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E18]), "initWithManagerOptions:", v2);
  objc_msgSend(v8, "reloadFromServer");

}

- (void)removeDeviceOfferWithIdentifier:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  AMSBag_iTunesStoreUI *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backingAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(AMSBag_iTunesStoreUI);
    objc_msgSend(MEMORY[0x24BE08118], "removeDeviceOfferWithIdentifier:account:bagContract:logKey:", v9, v7, v8, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid device offer identifier"));
  }

}

- (void)reportAProblemForIdentifier:(id)a3
{
  if (SSGetUnsignedLongLongFromValue())
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid adam ID"));
}

void __49__SUScriptInterface_reportAProblemForIdentifier___block_invoke(uint64_t a1)
{
  SUReportConcernViewController *v2;
  SUNavigationController *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SUReportConcernViewController initWithItemIdentifier:]([SUReportConcernViewController alloc], "initWithItemIdentifier:", *(_QWORD *)(a1 + 40));
  -[SUViewController setClientInterface:](v2, "setClientInterface:", v5);
  v3 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v2);
  -[SUNavigationController setClientInterface:](v3, "setClientInterface:", v5);
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)requireCellularForResourceWithURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableSet *requireCellularURLs;
  NSMutableSet *v8;
  NSMutableSet *v9;
  uint64_t v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = MEMORY[0x24BDAC760];
      v6 = v5;
      WebThreadRunOnMainThread();
      -[NSLock lock](self->super._lock, "lock", v10, 3221225472, __55__SUScriptInterface_requireCellularForResourceWithURL___block_invoke, &unk_24DE7B0F0, self);
      requireCellularURLs = self->_requireCellularURLs;
      if (!requireCellularURLs)
      {
        v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v9 = self->_requireCellularURLs;
        self->_requireCellularURLs = v8;

        requireCellularURLs = self->_requireCellularURLs;
      }
      -[NSMutableSet addObject:](requireCellularURLs, "addObject:", v6);
      -[NSLock unlock](self->super._lock, "unlock");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

void __55__SUScriptInterface_requireCellularForResourceWithURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && *(_QWORD *)(a1 + 40))
    objc_msgSend(v2, "scriptInterface:requireCellularForResourceWithURL:", *(_QWORD *)(a1 + 32));

}

- (void)sendPostOfType:(id)a3 withOptions:(id)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  SUScriptOperation *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDFA950];
    v8 = CFSTR("Invalid post type");
LABEL_11:
    objc_msgSend(v7, "throwException:", v8);
    goto LABEL_12;
  }
  if (!v6)
  {
    if (!+[SUScriptOperation postOperationClassForType:](SUScriptOperation, "postOperationClassForType:", v10))
    {
      v6 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDFA950];
    v8 = CFSTR("Invalid post options");
    goto LABEL_11;
  }
  if (!+[SUScriptOperation postOperationClassForType:](SUScriptOperation, "postOperationClassForType:", v10))goto LABEL_12;
LABEL_9:
  v9 = -[SUScriptOperation initWithPostType:options:]([SUScriptOperation alloc], "initWithPostType:options:", v10, v6);
  -[SUScriptOperationDelegate enqueueOperation:](self->_scriptOperationDelegate, "enqueueOperation:", v9);

LABEL_12:
}

- (void)setLibraryIdentifierWithType:(id)a3 value:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v9, "isEqualToString:", CFSTR("app-genius")) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDFA950];
    v8 = CFSTR("Invalid library identifier type");
LABEL_9:
    objc_msgSend(v7, "throwException:", v8);
    goto LABEL_10;
  }
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x24BDFA950];
      v8 = CFSTR("Invalid library identifier");
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSoftwareLibraryIdentifier:", v5);

LABEL_10:
}

- (id)shouldDisplayPrivacyLinkWithIdentifier:(id)a3
{
  id v3;
  id v4;
  int v6;
  id *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid privacy identifier"));
    v4 = (id)*MEMORY[0x24BDBD268];
    return v4;
  }
  if (!v3)
    goto LABEL_4;
  v6 = objc_msgSend(MEMORY[0x24BEB1F60], "shouldDisplayPrivacyLinkWithIdentifier:", v3);
  v7 = (id *)MEMORY[0x24BDBD270];
  if (!v6)
    v7 = (id *)MEMORY[0x24BDBD268];
  v4 = *v7;

  return v4;
}

- (void)signOutPrimaryAccount
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "signOutAccount:", v4);

  }
}

- (void)startListeningForAuthenticationTokenWithCallback:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *hsaTokenQueue;
  uint64_t v12;
  _QWORD block[5];
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Failed to listen for authentication token - nil callback"));
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (!v7)
    goto LABEL_10;
  v15 = 138543362;
  v16 = (id)objc_opt_class();
  v9 = v16;
  LODWORD(v12) = 12;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v15, v12);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog();
LABEL_10:

  }
  hsaTokenQueue = self->_hsaTokenQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SUScriptInterface_startListeningForAuthenticationTokenWithCallback___block_invoke;
  block[3] = &unk_24DE7B0F0;
  block[4] = self;
  v14 = v4;
  dispatch_sync(hsaTokenQueue, block);

LABEL_13:
}

void __70__SUScriptInterface_startListeningForAuthenticationTokenWithCallback___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240))
  {
    HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 240));
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = v3;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy_;
  v5[4] = __Block_byref_object_dispose_;
  v6 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier();

  _Block_object_dispose(v5, 8);
}

void __70__SUScriptInterface_startListeningForAuthenticationTokenWithCallback___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v13 = v12 | 2;
  else
    v13 = v12;
  objc_msgSend(v11, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v13 &= 2u;
  if (!v13)
    goto LABEL_9;
  v27 = 138543362;
  v28 = (id)objc_opt_class();
  v15 = v28;
  LODWORD(v24) = 12;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v27, v24);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog();
LABEL_9:

  }
  v26[0] = a5;
  v26[1] = a2;
  v26[2] = a3;
  v26[3] = a4;
  v17 = (void *)MEMORY[0x24BDBCE30];
  v18 = a4;
  v19 = a3;
  v20 = a2;
  v21 = a5;
  objc_msgSend(v17, "arrayWithObjects:count:", v26, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(id *)(a1 + 32);
  v23 = v22;
  WebThreadRunOnMainThread();

}

void __70__SUScriptInterface_startListeningForAuthenticationTokenWithCallback___block_invoke_192(_QWORD *a1)
{
  SUScriptFunction *v2;

  v2 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a1[4]);
  -[SUScriptFunction setThisObject:](v2, "setThisObject:", a1[5]);
  -[SUScriptFunction callWithArguments:](v2, "callWithArguments:", a1[6]);
  -[SUScriptFunction setThisObject:](v2, "setThisObject:", 0);

}

- (void)stopListeningForAuthenticationToken
{
  NSObject *hsaTokenQueue;
  _QWORD block[5];

  hsaTokenQueue = self->_hsaTokenQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUScriptInterface_stopListeningForAuthenticationToken__block_invoke;
  block[3] = &unk_24DE7B230;
  block[4] = self;
  dispatch_sync(hsaTokenQueue, block);
}

void __56__SUScriptInterface_stopListeningForAuthenticationToken__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    objc_msgSend(v2, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v4 &= 2u;
    if (v4)
    {
      LODWORD(v9) = 138543362;
      *(_QWORD *)((char *)&v9 + 4) = objc_opt_class();
      v6 = *(id *)((char *)&v9 + 4);
      LODWORD(v8) = 12;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_11:

        HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();
        CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 240));
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 0;
        return;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
      v5 = objc_claimAutoreleasedReturnValue();
      free(v7);
      SSFileLog();
    }

    goto LABEL_11;
  }
}

- (void)_accessibilityPostLayoutChange
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)accessibilityPostLayoutChange
{
  -[SUScriptInterface performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__accessibilityPostLayoutChange, 0, 0);
}

- (void)accessibilityPostScreenChange
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_0);
}

void __50__SUScriptInterface_accessibilityPostScreenChange__block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)authorizeApplePayEnrollmentWithParameters:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  OpaqueJSContext *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  int v58;
  int v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  int v66;
  int v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  int v74;
  int v75;
  NSObject *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  _BYTE *v88;
  _BYTE *v89;
  _BYTE *v90;
  _BYTE *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  _QWORD v100[4];
  __CFString *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  SUScriptInterface *v107;
  void (**v108)(_QWORD, _QWORD, _QWORD);
  uint64_t *v109;
  id v110;
  id v111[2];
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  id location;
  _BYTE from[12];
  __int16 v123;
  uint64_t v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v118[0] = MEMORY[0x24BDAC760];
  v118[1] = 3221225472;
  v118[2] = __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke;
  v118[3] = &unk_24DE7B368;
  objc_copyWeak(&v120, &location);
  v8 = v7;
  v119 = v8;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x220763634](v118);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v8 = 0;
  }
  v112 = 0;
  v113 = &v112;
  v114 = 0x3032000000;
  v115 = __Block_byref_object_copy_;
  v116 = __Block_byref_object_dispose_;
  v117 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldLog");
    v16 = objc_msgSend(v14, "shouldLogToDisk");
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
      v15 |= 2u;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v15 &= 2u;
    if (v15)
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)from = 138543362;
      *(_QWORD *)&from[4] = v19;
      v20 = v19;
      LODWORD(v92) = 12;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
        goto LABEL_20;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, from, v92);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog();
    }

    goto LABEL_20;
  }
  if ((objc_msgSend(MEMORY[0x24BEC8B68], "shouldUseExtendedEnrollment") & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v6;
      v11 = -[SUScriptInterface copyJavaScriptContext](self, "copyJavaScriptContext");
      v12 = (void *)objc_msgSend(v10, "copyArrayOrDictionaryWithContext:", v11);
      JSGlobalContextRelease(v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
      }
      else
      {
        ISError();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v113[5];
        v113[5] = v30;

        v13 = 0;
      }

    }
    else
    {
      ISError();
      v29 = objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v10 = (id)v113[5];
      v113[5] = v29;
    }

    if (v113[5])
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "shouldLog");
      v34 = objc_msgSend(v32, "shouldLogToDisk");
      objc_msgSend(v32, "OSLogObject");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v34)
        v33 |= 2u;
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        v33 &= 2u;
      if (v33)
      {
        v37 = (void *)objc_opt_class();
        v38 = v113[5];
        *(_DWORD *)from = 138543618;
        *(_QWORD *)&from[4] = v37;
        v123 = 2114;
        v124 = v38;
        v39 = v37;
        LODWORD(v92) = 22;
        v40 = (void *)_os_log_send_and_compose_impl();

        if (!v40)
        {
LABEL_42:

          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          v9[2](v9, 0, v113[5]);
          goto LABEL_97;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v40, 4, from, v92);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        free(v40);
        SSFileLog();
      }

      goto LABEL_42;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("paymentSession"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {
LABEL_53:
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("passTypeIdentifier"), v88);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (v96)
        goto LABEL_63;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "shouldLog");
      v51 = objc_msgSend(v49, "shouldLogToDisk");
      objc_msgSend(v49, "OSLogObject");
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v52;
      if (v51)
        v50 |= 2u;
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        v50 &= 2u;
      if (v50)
      {
        v54 = (void *)objc_opt_class();
        *(_DWORD *)from = 138543362;
        *(_QWORD *)&from[4] = v54;
        v55 = v54;
        LODWORD(v92) = 12;
        v89 = from;
        v56 = (void *)_os_log_send_and_compose_impl();

        if (!v56)
        {
LABEL_62:

LABEL_63:
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("passSerialNumber"), v89);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          if (v95)
            goto LABEL_73;
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "shouldLog");
          v59 = objc_msgSend(v57, "shouldLogToDisk");
          objc_msgSend(v57, "OSLogObject");
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = v60;
          if (v59)
            v58 |= 2u;
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            v58 &= 2u;
          if (v58)
          {
            v62 = (void *)objc_opt_class();
            *(_DWORD *)from = 138543362;
            *(_QWORD *)&from[4] = v62;
            v63 = v62;
            LODWORD(v92) = 12;
            v90 = from;
            v64 = (void *)_os_log_send_and_compose_impl();

            if (!v64)
            {
LABEL_72:

LABEL_73:
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("metrics"), v90);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              if (v94)
                goto LABEL_83;
              objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v65, "shouldLog");
              v67 = objc_msgSend(v65, "shouldLogToDisk");
              objc_msgSend(v65, "OSLogObject");
              v68 = objc_claimAutoreleasedReturnValue();
              v69 = v68;
              if (v67)
                v66 |= 2u;
              if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                v66 &= 2u;
              if (v66)
              {
                v70 = (void *)objc_opt_class();
                *(_DWORD *)from = 138543362;
                *(_QWORD *)&from[4] = v70;
                v71 = v70;
                LODWORD(v92) = 12;
                v91 = from;
                v72 = (void *)_os_log_send_and_compose_impl();

                if (!v72)
                {
LABEL_82:

LABEL_83:
                  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("confirmationStyle"), v91);
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("confirmationStyle"));
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    v93 = objc_msgSend(v73, "unsignedIntegerValue");
LABEL_96:

                    v81 = objc_alloc(MEMORY[0x24BEC8BB8]);
                    objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    v83 = (void *)objc_msgSend(v81, "initWithBagContext:", v82);

                    objc_initWeak((id *)from, v83);
                    v100[0] = MEMORY[0x24BDAC760];
                    v100[1] = 3221225472;
                    v100[2] = __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke_211;
                    v100[3] = &unk_24DE7B3B8;
                    objc_copyWeak(&v110, &location);
                    objc_copyWeak(v111, (id *)from);
                    v109 = &v112;
                    v101 = CFSTR("Apple Pay Enrollment Error");
                    v98 = v97;
                    v102 = v98;
                    v84 = v96;
                    v103 = v84;
                    v85 = v95;
                    v104 = v85;
                    v105 = v8;
                    v108 = v9;
                    v86 = v94;
                    v106 = v86;
                    v107 = self;
                    v111[1] = (id)v93;
                    objc_msgSend(v83, "setCompletionBlock:", v100);
                    objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "addOperation:", v83);

                    objc_destroyWeak(v111);
                    objc_destroyWeak(&v110);
                    objc_destroyWeak((id *)from);

                    goto LABEL_97;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("confirmationStyle"));
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    v93 = (int)objc_msgSend(v73, "intValue");
                    goto LABEL_96;
                  }
                  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  v74 = objc_msgSend(v73, "shouldLog");
                  v75 = objc_msgSend(v73, "shouldLogToDisk");
                  objc_msgSend(v73, "OSLogObject");
                  v76 = objc_claimAutoreleasedReturnValue();
                  v77 = v76;
                  if (v75)
                    v74 |= 2u;
                  if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                    v74 &= 2u;
                  if (v74)
                  {
                    v78 = (void *)objc_opt_class();
                    *(_DWORD *)from = 138412290;
                    *(_QWORD *)&from[4] = v78;
                    v79 = v78;
                    LODWORD(v92) = 12;
                    v80 = (void *)_os_log_send_and_compose_impl();

                    if (!v80)
                    {
LABEL_95:
                      v93 = 0;
                      goto LABEL_96;
                    }
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v80, 4, from, v92);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    free(v80);
                    SSFileLog();
                  }

                  goto LABEL_95;
                }
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v72, 4, from, v92);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                free(v72);
                v91 = v69;
                SSFileLog();
              }

              goto LABEL_82;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v64, 4, from, v92);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            free(v64);
            v90 = v61;
            SSFileLog();
          }

          goto LABEL_72;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v56, 4, from, v92);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        free(v56);
        v89 = v53;
        SSFileLog();
      }

      goto LABEL_62;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "shouldLog");
    v43 = objc_msgSend(v41, "shouldLogToDisk");
    objc_msgSend(v41, "OSLogObject");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v43)
      v42 |= 2u;
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      v42 &= 2u;
    if (v42)
    {
      v46 = (void *)objc_opt_class();
      *(_DWORD *)from = 138543362;
      *(_QWORD *)&from[4] = v46;
      v47 = v46;
      LODWORD(v92) = 12;
      v88 = from;
      v48 = (void *)_os_log_send_and_compose_impl();

      if (!v48)
      {
LABEL_52:

        goto LABEL_53;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v48, 4, from, v92);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      free(v48);
      v88 = v45;
      SSFileLog();
    }

    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v14, "shouldLog");
  v23 = objc_msgSend(v14, "shouldLogToDisk");
  objc_msgSend(v14, "OSLogObject");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23)
    v22 |= 2u;
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    v22 &= 2u;
  if (!v22)
    goto LABEL_28;
  v26 = (void *)objc_opt_class();
  *(_DWORD *)from = 138543362;
  *(_QWORD *)&from[4] = v26;
  v27 = v26;
  LODWORD(v92) = 12;
  v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, from, v92);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    free(v28);
    SSFileLog();
LABEL_28:

  }
LABEL_20:

  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  ISError();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v13);
LABEL_97:

  _Block_object_dispose(&v112, 8);
  objc_destroyWeak(&v120);
  objc_destroyWeak(&location);

}

void __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  SUScriptFunction *v8;
  SUScriptError *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SUScriptDictionary *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  const __CFString *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  -[SUScriptFunction setThisObject:](v8, "setThisObject:", WeakRetained);
  if (v6)
  {
    v9 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", v6);
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptFunction callWithArguments:](v8, "callWithArguments:", v11);
  }
  else
  {
    objc_msgSend(v5, "token");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paymentData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_retainAutorelease(v13);
    -[SUScriptError bytes](v9, "bytes");
    -[SUScriptError length](v9, "length");
    v10 = (void *)ISCopyEncodedBase64();
    v18 = CFSTR("payment");
    v19 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v11);
    v17[0] = v14;
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptFunction callWithArguments:](v8, "callWithArguments:", v16);

  }
  -[SUScriptFunction setThisObject:](v8, "setThisObject:", 0);

}

void __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke_211(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  int v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  uint8_t *v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  id v67;
  void *v68;
  _QWORD v69[5];
  id v70;
  uint8_t buf[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  v3 = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(v3, "URLBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "shouldLog");
    if (objc_msgSend(v23, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    objc_msgSend(v23, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      v25 &= 2u;
    if (v25)
    {
      *(_DWORD *)buf = 138543362;
      v72 = (id)objc_opt_class();
      v27 = v72;
      LODWORD(v64) = 12;
      v63 = buf;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_32:

        ISError();
        v29 = objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v16 = *(void **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = v29;
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, buf, v64);
      v26 = objc_claimAutoreleasedReturnValue();
      free(v28);
      v63 = (uint8_t *)v26;
      SSFileLog();
    }

    goto LABEL_32;
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("countryCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      v72 = (id)objc_opt_class();
      v12 = v72;
      LODWORD(v64) = 12;
      v63 = buf;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, buf, v64);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      v63 = (uint8_t *)v11;
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v5, "valueForKey:", CFSTR("currencyCode"), v63);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_43;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldLog");
  if (objc_msgSend(v16, "shouldLogToDisk"))
    v18 = v17 | 2;
  else
    v18 = v17;
  objc_msgSend(v16, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    v18 &= 2u;
  if (v18)
  {
    v20 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v72 = v20;
    v21 = v20;
    LODWORD(v64) = 12;
    v63 = buf;
    v22 = (void *)_os_log_send_and_compose_impl();

    if (!v22)
      goto LABEL_33;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, buf, v64);
    v19 = objc_claimAutoreleasedReturnValue();
    free(v22);
    v63 = (uint8_t *)v19;
    SSFileLog();
  }

LABEL_33:
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "shouldLog");
  if (objc_msgSend(v31, "shouldLogToDisk"))
    v33 = v32 | 2;
  else
    v33 = v32;
  objc_msgSend(v31, "OSLogObject", v63);
  v34 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    v33 &= 2u;
  if (!v33)
    goto LABEL_41;
  v35 = (void *)objc_opt_class();
  *(_DWORD *)buf = 138543362;
  v72 = v35;
  v36 = v35;
  LODWORD(v64) = 12;
  v63 = buf;
  v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v37, 4, buf, v64);
    v34 = objc_claimAutoreleasedReturnValue();
    free(v37);
    v63 = (uint8_t *)v34;
    SSFileLog();
LABEL_41:

  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "currencyCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {
LABEL_60:
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    goto LABEL_61;
  }
  if (!*(_QWORD *)(a1 + 40) || !*(_QWORD *)(a1 + 48) || !*(_QWORD *)(a1 + 56) || !v7 || !v15 || !*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", v63);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "shouldLog");
    if (objc_msgSend(v39, "shouldLogToDisk"))
      v41 = v40 | 2;
    else
      v41 = v40;
    objc_msgSend(v39, "OSLogObject");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      v41 &= 2u;
    if (v41)
    {
      v43 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v72 = v43;
      v44 = v43;
      LODWORD(v64) = 12;
      v63 = buf;
      v45 = (void *)_os_log_send_and_compose_impl();

      if (!v45)
        goto LABEL_59;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v45, 4, buf, v64);
      v42 = objc_claimAutoreleasedReturnValue();
      free(v45);
      v63 = (uint8_t *)v42;
      SSFileLog();
    }

LABEL_59:
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    ISError();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v48 = *(void **)(v47 + 40);
    *(_QWORD *)(v47 + 40) = v46;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
      goto LABEL_60;
  }
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE080A8]), "initWithPaymentSession:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v49, "setCountryCode:", v7);
  objc_msgSend(v49, "setCurrencyCode:", v15);
  objc_msgSend(v49, "setPassSerialNumber:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v49, "setPassTypeIdentifier:", *(_QWORD *)(a1 + 48));
  v50 = *(void **)(a1 + 72);
  if (v50)
  {
    objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("topic"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08268]), "initWithTopic:", v51);
      objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("mtApp"));
      v53 = objc_claimAutoreleasedReturnValue();
      if (v53)
        objc_msgSend(v52, "setProperty:forBodyKey:", v53, CFSTR("app"));
      v66 = v53;
      objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("mtPageContext"), v63);
      v54 = objc_claimAutoreleasedReturnValue();
      if (v54)
        objc_msgSend(v52, "setProperty:forBodyKey:", v54, CFSTR("pageContext"));
      v65 = (void *)v54;
      v68 = v51;
      objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("mtPageId"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
        objc_msgSend(v52, "setProperty:forBodyKey:", v55, CFSTR("pageId"));
      v67 = v3;
      objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("mtPageType"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
        objc_msgSend(v52, "setProperty:forBodyKey:", v56, CFSTR("pageType"));
      objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("mtPrevPage"));
      v57 = v52;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
        objc_msgSend(v57, "setProperty:forBodyKey:", v58, CFSTR("prevPage"));
      objc_msgSend(v49, "setMetricsEvent:", v57);

      v59 = v57;
      v3 = v67;
      v51 = v68;
      v60 = v66;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "OSLogObject");
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v72 = v61;
        _os_log_impl(&dword_21B3EF000, v60, OS_LOG_TYPE_ERROR, "%{public}@: [AuthorizeEnrollment] Metrics failed for no topic", buf, 0xCu);
      }
    }

  }
  if (*(_QWORD *)(a1 + 120) <= 1uLL)
    objc_msgSend(v49, "setConfirmationStyle:");
  objc_msgSend(v49, "performCardAuthorization", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke_237;
  v69[3] = &unk_24DE7B390;
  v69[4] = WeakRetained;
  v70 = *(id *)(a1 + 88);
  objc_msgSend(v62, "addFinishBlock:", v69);

LABEL_61:
}

void __72__SUScriptInterface_authorizeApplePayEnrollmentWithParameters_callback___block_invoke_237(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      LODWORD(v14) = 138543362;
      *(_QWORD *)((char *)&v14 + 4) = objc_opt_class();
      v11 = *(id *)((char *)&v14 + 4);
      LODWORD(v13) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v14, v13, v14);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)dismissSafariViewControllerAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  _DWORD v11[2];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!v8)
    goto LABEL_10;
  v11[0] = 67109120;
  v11[1] = v3;
  LODWORD(v10) = 8;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, v11, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_10:

  }
  WebThreadRunOnMainThread();
}

uint64_t __57__SUScriptInterface_dismissSafariViewControllerAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissSafariViewControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)showSafariViewControllerWithURLString:(id)a3 identifier:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  int v19;
  void *v20;
  int *v21;
  uint64_t v22;
  id v23;
  id v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  objc_msgSend(v9, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    v13 = v11;
  else
    v13 = v11 & 2;
  if (v13)
  {
    v25 = 138412802;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    v29 = 1024;
    v30 = v5;
    LODWORD(v22) = 28;
    v21 = &v25;
    v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v25, v22);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v14);
    v21 = (int *)v12;
    SSFileLog();
  }

LABEL_11:
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject", v21);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      v19 = v17;
    else
      v19 = v17 & 2;
    if (v19)
    {
      LOWORD(v25) = 0;
      LODWORD(v22) = 2;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
        goto LABEL_23;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v25, v22);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog();
    }

    goto LABEL_23;
  }
  v23 = v7;
  v24 = v8;
  WebThreadRunOnMainThread();

  v15 = v23;
LABEL_23:

}

void __79__SUScriptInterface_showSafariViewControllerWithURLString_identifier_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "safariViewControllerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __79__SUScriptInterface_showSafariViewControllerWithURLString_identifier_animated___block_invoke_2;
    v5[3] = &unk_24DE7B118;
    v5[4] = v4;
    v6 = v2;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_dismissSafariViewControllerAnimated:completion:", 0, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_presentSafariViewControllerWithURL:safariIdentifier:animated:", v2, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  }

}

uint64_t __79__SUScriptInterface_showSafariViewControllerWithURLString_identifier_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentSafariViewControllerWithURL:safariIdentifier:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (id)applicationAccessibilityEnabled
{
  int v2;
  id *v3;

  v2 = _AXSApplicationAccessibilityEnabled();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (SUScriptKeyValueStore)applicationLocalStorage
{
  SUScriptKeyValueStore *applicationLocalStorage;
  void *v4;
  void *v5;
  void *v6;
  SUScriptKeyValueStore *v7;
  SUScriptKeyValueStore *v8;
  SUScriptKeyValueStore *v9;

  -[SUScriptObject lock](self, "lock");
  applicationLocalStorage = self->_applicationLocalStorage;
  if (!applicationLocalStorage)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[SUClientInterface clientIdentifier](self->_clientInterface, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("com.apple.iTunesStoreUI.script.app.%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[SUScriptKeyValueStore initWithDomain:]([SUScriptKeyValueStore alloc], "initWithDomain:", v6);
    v8 = self->_applicationLocalStorage;
    self->_applicationLocalStorage = v7;

    applicationLocalStorage = self->_applicationLocalStorage;
  }
  v9 = applicationLocalStorage;
  -[SUScriptObject unlock](self, "unlock");
  return v9;
}

- (NSString)askToBuyPrompt
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __35__SUScriptInterface_askToBuyPrompt__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "askToBuyApprovalPrompt");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_className
{
  return CFSTR("iTunes");
}

- (NSString)clientIdentifier
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __37__SUScriptInterface_clientIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)cookie
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SUScriptInterface webFrame](self, "webFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptInterface _cookieForURL:](self, "_cookieForURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)cookieDefaultURL
{
  return (NSString *)CFSTR("http://www.apple.com/");
}

- (NSString)cookieForDefaultURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF48];
  -[SUScriptInterface cookieDefaultURL](self, "cookieDefaultURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptInterface _cookieForURL:](self, "_cookieForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)creditCardReaderAvailable
{
  _BOOL4 v2;
  id *v3;

  v2 = +[SUCreditCardReaderViewController cameraSupported](SUCreditCardReaderViewController, "cameraSupported");
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (NSArray)deviceOffers
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  SUScriptInterface *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE08118], "deviceOffers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __33__SUScriptInterface_deviceOffers__block_invoke;
  v11 = &unk_24DE7B480;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

void __33__SUScriptInterface_deviceOffers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SUScriptDeviceOffer *v4;

  v3 = a2;
  v4 = -[SUScriptDeviceOffer initWithDeviceOffer:]([SUScriptDeviceOffer alloc], "initWithDeviceOffer:", v3);

  objc_msgSend(*(id *)(a1 + 32), "checkInScriptObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (NSString)deviceSerialNumber
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialNumber");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_24DE83F60;
  v5 = v3;

  return v5;
}

- (id)globalRootObject
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SUScriptInterface webFrame](self, "webFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)gsToken
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __28__SUScriptInterface_gsToken__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "webView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allHTTPHeaderFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEB2558]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)isApplePayAvailable
{
  int v2;
  id *v3;

  v2 = objc_msgSend(MEMORY[0x24BE08118], "isSecureElementAvailable");
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)isFinanceInterruption
{
  id *v2;
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __42__SUScriptInterface_isFinanceInterruption__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isFinanceInterruption");

}

- (id)isWalletAvailable
{
  int v2;
  id *v3;

  v2 = objc_msgSend((id)ISWeakLinkedClassForString(), "isPassLibraryAvailable");
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)loggingEnabled
{
  void *v2;
  int v3;
  id *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLog");
  v4 = (id *)MEMORY[0x24BDBD270];
  if (!v3)
    v4 = (id *)MEMORY[0x24BDBD268];
  v5 = *v4;

  return v5;
}

- (id)makeXMLHTTPRequest
{
  return -[SUScriptXMLHTTPRequest initWithDelegate:]([SUScriptXMLHTTPRequest alloc], "initWithDelegate:", self);
}

- (id)makeXMLHTTPStoreRequest
{
  SUScriptXMLHTTPStoreRequest *v3;
  void *v4;
  void *v5;
  SUStorePageDataProvider *v6;

  v3 = -[SUScriptXMLHTTPStoreRequest initWithDelegate:]([SUScriptXMLHTTPStoreRequest alloc], "initWithDelegate:", self);
  -[SUScriptInterface authenticationContext](self, "authenticationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptXMLHTTPStoreRequest setAuthenticationContext:](v3, "setAuthenticationContext:", v4);

  -[SUScriptInterface clientInterface](self, "clientInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(SUStorePageDataProvider);
  -[SUStorePageDataProvider setClientInterface:](v6, "setClientInterface:", v5);
  -[SUScriptXMLHTTPStoreRequest setDataProvider:](v3, "setDataProvider:", v6);

  return v3;
}

- (SUScriptNavigationBar)navigationBar
{
  void *v2;
  void *v3;
  void *v4;

  -[SUScriptInterface viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "navigationBar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return (SUScriptNavigationBar *)v4;
}

- (SUScriptNavigationSimulator)navigationSimulator
{
  WebThreadRunOnMainThread();
  if (self->_navigationSimulator)
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:");
    return self->_navigationSimulator;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Failed to create a navigation simulator."));
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    return (SUScriptNavigationSimulator *)(id)objc_claimAutoreleasedReturnValue();
  }
}

void __40__SUScriptInterface_navigationSimulator__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  SUScriptNavigationSimulator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[31])
  {
    objc_msgSend(v2, "parentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "su_closestNavigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v4 = -[SUScriptNavigationSimulator initWithNavigationController:]([SUScriptNavigationSimulator alloc], "initWithNavigationController:", v7);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 248);
      *(_QWORD *)(v5 + 248) = v4;

    }
  }
}

- (NSNumber)orientation
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  WebThreadRunOnMainThread();
  v2 = (void *)v7[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v4;
}

void __32__SUScriptInterface_orientation__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = objc_alloc(MEMORY[0x24BDD16E0]);
  v5 = (void *)0x24BDF6000;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v13, "statusBarOrientation");
  if (v6 == 1)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "statusBarOrientation") == 4)
    {
      v7 = 0;
      v8 = 0;
      v9 = -90;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "statusBarOrientation") == 3)
      {
        v8 = 0;
        v7 = 1;
        v9 = 90;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "statusBarOrientation") == 2)
          v9 = 180;
        else
          v9 = 0;
        v7 = 1;
        v8 = 1;
      }
    }
  }
  v10 = objc_msgSend(v4, "initWithInteger:", v9);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (v8)
  if (v7)

  if (v6 != 1)
}

- (NSString)referrerURL
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __32__SUScriptInterface_referrerURL__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "webView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allHTTPHeaderFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "valueForKey:", CFSTR("referer"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (NSString)referringUserAgent
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __39__SUScriptInterface_referringUserAgent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "webView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allHTTPHeaderFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "valueForKey:", CFSTR("ref-user-agent"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)requestInfo
{
  SUScriptRequestPerformance *v3;
  SUScriptRequestPerformance *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    v3 = [SUScriptRequestPerformance alloc];
    v4 = -[SUScriptRequestPerformance initWithRequestPerformance:](v3, "initWithRequestPerformance:", v9[5], v6, 3221225472, __32__SUScriptInterface_requestInfo__block_invoke, &unk_24DE7B458, self, &v8);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v4);
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __32__SUScriptInterface_requestInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "performanceMetricsForScriptInterface:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)safariViewControllerDismissButtonStyle
{
  return self->_safariDismissButtonStyle;
}

- (SUScriptPreviewOverlay)previewOverlay
{
  SUScriptPreviewOverlay *previewOverlay;
  SUScriptPreviewOverlay *v4;
  SUScriptPreviewOverlay *v5;
  SUScriptPreviewOverlay *v6;

  -[SUScriptObject lock](self, "lock");
  previewOverlay = self->_previewOverlay;
  if (previewOverlay)
  {
    v4 = previewOverlay;
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    v5 = objc_alloc_init(SUScriptPreviewOverlay);
    v6 = self->_previewOverlay;
    self->_previewOverlay = v5;

    -[SUScriptObject setVisible:](self->_previewOverlay, "setVisible:", 1);
    v4 = self->_previewOverlay;
    -[SUScriptObject unlock](self, "unlock");
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v4);
  }
  return v4;
}

- (id)screenReaderRunning
{
  _BOOL4 IsVoiceOverRunning;
  id *v3;

  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!IsVoiceOverRunning)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (void)setCookie:(id)a3
{
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
  id v15;

  v15 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v15, CFSTR("Set-Cookie"), 0);
    v5 = (void *)MEMORY[0x24BDB7440];
    -[SUScriptInterface webFrame](self, "webFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cookiesWithResponseHeaderFields:forURL:", v4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activeAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCookies:forUserIdentifier:", v10, v14);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

- (void)setCookieDefaultURL:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("cookieDefaultURL"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setCookieForDefaultURL:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("cookieForDefaultURL"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setGlobalRootObject:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("globalRootObject"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setGsToken:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("gsToken"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setLoggingEnabled:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("loggingEnabled"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setOrientation:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("orientation"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setReferrerURL:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("referrerURL"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setReferringUserAgent:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("referringUserAgent"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setSafariViewControllerDismissButtonStyle:(id)a3
{
  NSNumber **p_safariDismissButtonStyle;
  id v6;

  p_safariDismissButtonStyle = &self->_safariDismissButtonStyle;
  objc_storeStrong((id *)&self->_safariDismissButtonStyle, a3);
  v6 = a3;
  -[SFSafariViewController setDismissButtonStyle:](self->_safariViewController, "setDismissButtonStyle:", -[NSNumber integerValue](*p_safariDismissButtonStyle, "integerValue"));

}

- (void)setNavigationBar:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("navigationBar"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setNavigationSimulator:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("navigationSimulator"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setStoreFrontIdentifier:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("storeFrontID"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setTidHeaders:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("tidHeaders"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setTidState:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("tidState"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setUserAgent:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("userAgent"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setWalletAvailable:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("walletAvailable"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (NSString)storeFrontIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  SSVStoreFrontIdentifierForAccount();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int64_t)storeSheetType
{
  int64_t *v2;
  int64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (int64_t *)MEMORY[0x24BDBD270];
  else
    v2 = (int64_t *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __35__SUScriptInterface_storeSheetType__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "inAskToBuyApprovalFlow");

}

- (SUScriptDictionary)tidHeaders
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (SUScriptDictionary *)v2;
}

void __31__SUScriptInterface_tidHeaders__block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  SUScriptDictionary *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = v23;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v23, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allHTTPHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = *MEMORY[0x24BEB25A8];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEB25A8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
    v10 = *MEMORY[0x24BEB25B0];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEB25B0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v10);
    v12 = *MEMORY[0x24BEB25C0];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEB25C0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v12);
    v14 = *MEMORY[0x24BEB25C8];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEB25C8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);
    v16 = *MEMORY[0x24BEB25D0];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEB25D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v16);
    v18 = *MEMORY[0x24BEB25A0];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEB25A0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v18);
    v20 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v7);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    v3 = v23;
  }

}

- (NSString)tidState
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __29__SUScriptInterface_tidState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEC8B68], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ISBiometricsHTTPHeaderValueForBiometricStateWithStore();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)userAgent
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __30__SUScriptInterface_userAgent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "webView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allHTTPHeaderFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "valueForKey:", CFSTR("User-Agent"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (NSString)safariViewControllerIdentifierQueryParameterName
{
  return (NSString *)CFSTR("safariid");
}

- (int64_t)storeSheetTypeDefault
{
  return 0;
}

- (int64_t)storeSheetTypeAskToBuy
{
  return 1;
}

- (id)accountDSID
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accountName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)haveAccount
{
  void *v2;
  BOOL v3;

  -[SUScriptInterface accountDSID](self, "accountDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldRestrictContentOfSystem:(id)a3 level:(id)a4
{
  id v5;
  id v6;
  SUItemContentRating *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v7 = objc_alloc_init(SUItemContentRating);
    -[SUItemContentRating setRank:](v7, "setRank:", (int)objc_msgSend(v6, "intValue"));
    -[SUItemContentRating setRatingSystem:](v7, "setRatingSystem:", +[SUItemContentRating ratingSystemFromString:](SUItemContentRating, "ratingSystemFromString:", v5));
    v8 = -[SUItemContentRating isRestricted](v7, "isRestricted");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldShowAddToWalletLink:(id)a3
{
  return objc_msgSend((id)ISWeakLinkedClassForString(), "canMakePayments");
}

- (void)signupInWallet:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  char v11;
  id v12;
  OpaqueJSContext *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  int v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  int v45;
  int v46;
  NSObject *v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  int v58;
  NSObject *v59;
  void *v60;
  int v61;
  int v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void (**v71)(_QWORD, _QWORD, _QWORD);
  _QWORD v72[4];
  id v73;
  id v74;
  id location;
  int v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __45__SUScriptInterface_signupInWallet_callback___block_invoke;
  v72[3] = &unk_24DE7B258;
  v8 = v7;
  v73 = v8;
  objc_copyWeak(&v74, &location);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x220763634](v72);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "shouldLog");
    v18 = objc_msgSend(v16, "shouldLogToDisk");
    objc_msgSend(v16, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
      v17 |= 2u;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (v17)
    {
      v21 = (void *)objc_opt_class();
      v76 = 138543362;
      v77 = v21;
      v22 = v21;
      LODWORD(v67) = 12;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v76, v67);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      free(v23);
      SSFileLog();
    }

    goto LABEL_21;
  }
  if ((objc_msgSend(MEMORY[0x24BEC8B68], "shouldUseUpsellEnrollment") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ams_isActiveAccountCombined");

    if ((v11 & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v12, "shouldLog");
        v40 = objc_msgSend(v12, "shouldLogToDisk");
        objc_msgSend(v12, "OSLogObject");
        v41 = objc_claimAutoreleasedReturnValue();
        v14 = v41;
        if (v40)
          v39 |= 2u;
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          v39 &= 2u;
        if (v39)
        {
          v42 = (void *)objc_opt_class();
          v76 = 138543362;
          v77 = v42;
          v43 = v42;
          LODWORD(v67) = 12;
          v15 = (void *)_os_log_send_and_compose_impl();

          if (!v15)
            goto LABEL_61;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v76, v67);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          free(v15);
          SSFileLog();
        }
        goto LABEL_59;
      }
      v12 = v6;
      v13 = -[SUScriptInterface copyJavaScriptContext](self, "copyJavaScriptContext");
      v14 = (id)objc_msgSend(v12, "copyArrayOrDictionaryWithContext:", v13);
      JSGlobalContextRelease(v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v14;
        v15 = v14;
LABEL_60:

LABEL_61:
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("referrerIdentifier"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
LABEL_74:
          v70 = v55;
          v71 = v9;
          WebThreadRunOnMainThread();

          goto LABEL_75;
        }
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "shouldLog");
        v58 = objc_msgSend(v56, "shouldLogToDisk");
        v69 = v56;
        objc_msgSend(v56, "OSLogObject");
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v59;
        if (v58)
          v61 = v57 | 2;
        else
          v61 = v57;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          v62 = v61;
        else
          v62 = v61 & 2;
        if (v62)
        {
          v63 = (void *)objc_opt_class();
          v76 = 138543362;
          v77 = v63;
          v64 = v63;
          LODWORD(v67) = 12;
          v65 = (void *)_os_log_send_and_compose_impl();

          v66 = v69;
          if (!v65)
          {
LABEL_73:

            goto LABEL_74;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v65, 4, &v76, v67);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          free(v65);
          SSFileLog();
        }
        else
        {
          v66 = v69;
        }

        goto LABEL_73;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "shouldLog");
      v46 = objc_msgSend(v44, "shouldLogToDisk");
      v68 = v44;
      objc_msgSend(v44, "OSLogObject");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v46)
        v49 = v45 | 2;
      else
        v49 = v45;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        v50 = v49;
      else
        v50 = v49 & 2;
      if (v50)
      {
        v51 = (void *)objc_opt_class();
        v76 = 138543362;
        v77 = v51;
        v52 = v51;
        LODWORD(v67) = 12;
        v53 = (void *)_os_log_send_and_compose_impl();

        v54 = v68;
        if (!v53)
        {
LABEL_58:

LABEL_59:
          v15 = 0;
          goto LABEL_60;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v53, 4, &v76, v67);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        free(v53);
        SSFileLog();
      }
      else
      {
        v54 = v68;
      }

      goto LABEL_58;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "shouldLog");
    v33 = objc_msgSend(v31, "shouldLogToDisk");
    objc_msgSend(v31, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33)
      v32 |= 2u;
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      v32 &= 2u;
    if (v32)
    {
      v36 = (void *)objc_opt_class();
      v76 = 138543362;
      v77 = v36;
      v37 = v36;
      LODWORD(v67) = 12;
      v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_39:

        ISError();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v15);
        goto LABEL_75;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v38, 4, &v76, v67);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      free(v38);
      SSFileLog();
    }

    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v16, "shouldLog");
  v25 = objc_msgSend(v16, "shouldLogToDisk");
  objc_msgSend(v16, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v25)
    v24 |= 2u;
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    v24 &= 2u;
  if (!v24)
    goto LABEL_29;
  v28 = (void *)objc_opt_class();
  v76 = 138543362;
  v77 = v28;
  v29 = v28;
  LODWORD(v67) = 12;
  v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v30, 4, &v76, v67);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    free(v30);
    SSFileLog();
LABEL_29:

  }
LABEL_21:

  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  ISError();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v15);
LABEL_75:

  objc_destroyWeak(&v74);
  objc_destroyWeak(&location);

}

void __45__SUScriptInterface_signupInWallet_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SUScriptFunction *v7;
  id WeakRetained;
  SUScriptError *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SUScriptFunction setThisObject:](v7, "setThisObject:", WeakRetained);

  if (v6)
  {
    v9 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", v6);
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = v9;
    v11 = v14;
  }
  else
  {
    v9 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v5);
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    v11 = v13;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptFunction callWithArguments:](v7, "callWithArguments:", v12);

  -[SUScriptFunction setThisObject:](v7, "setThisObject:", 0);
}

void __45__SUScriptInterface_signupInWallet_callback___block_invoke_311(uint64_t a1)
{
  void *v2;
  SUCardEnrollmentUpsellOperation *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SUCardEnrollmentUpsellOperation initWithViewController:]([SUCardEnrollmentUpsellOperation alloc], "initWithViewController:", v2);
  objc_initWeak(&location, v3);
  -[SUCardEnrollmentUpsellOperation setReferrerIdentifier:](v3, "setReferrerIdentifier:", *(_QWORD *)(a1 + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SUScriptInterface_signupInWallet_callback___block_invoke_2;
  v5[3] = &unk_24DE7B4A8;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 48);
  -[SUCardEnrollmentUpsellOperation setCompletionBlock:](v3, "setCompletionBlock:", v5);
  objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __45__SUScriptInterface_signupInWallet_callback___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "didSucceed");

  v4 = *(_QWORD *)(a1 + 32);
  v7 = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v6, 0);

}

- (id)systemVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)checkCapabilitiesPropertyListString:(id)a3 showFailureDialog:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[SUScriptInterface device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "checkCapabilitiesPropertyListString:showFailureDialog:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "BOOLValue");
  return (char)v6;
}

- (id)activeNetworkType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[SUScriptInterface device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "activeNetworkType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)arePodcastsDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SUScriptInterface device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilityNamePodcasts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hasCapability:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  return v5;
}

- (BOOL)canSendEmail
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SUScriptInterface device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilityNameEmail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hasCapability:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)diskSpaceAvailable
{
  void *v2;
  void *v3;

  -[SUScriptInterface device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diskSpaceAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hardwareType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[SUScriptInterface device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "hardwareType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isExplicitContentDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SUScriptInterface device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilityNameExplicitMedia");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hasCapability:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  return v5;
}

- (void)showAlertWithMessage:(id)a3 title:(id)a4 buttonTitle:(id)a5
{
  SUScriptModalDialog *v6;
  id v7;

  v7 = -[SUScriptInterface _copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:](self, "_copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:", a3, a4, 0, a5);
  v6 = -[SUScriptModalDialog initWithDialog:]([SUScriptModalDialog alloc], "initWithDialog:", v7);
  -[SUScriptModalDialog setDelegate:](v6, "setDelegate:", self);

}

- (BOOL)showConfirmWithMessage:(id)a3 title:(id)a4 okButtonTitle:(id)a5 cancelButtonTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  SUScriptModalDialog *v17;
  id v18;
  BOOL v19;

  if (a6)
  {
    v10 = a5;
    v11 = a4;
    v12 = a3;
    v13 = -[SUScriptInterface _copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:](self, "_copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:", v12, v11, a6, v10);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1488];
    v15 = a5;
    v16 = a4;
    v10 = a3;
    objc_msgSend(v14, "bundleForClass:", objc_opt_class());
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DE83F60, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v13 = -[SUScriptInterface _copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:](self, "_copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:", v10, v16, v11, v15);

  }
  v17 = -[SUScriptModalDialog initWithDialog:]([SUScriptModalDialog alloc], "initWithDialog:", v13);
  -[SUScriptModalDialog setDelegate:](v17, "setDelegate:", self);
  v18 = -[SUScriptModalDialog copyResponseByRunningModal](v17, "copyResponseByRunningModal");
  v19 = objc_msgSend(v18, "buttonIndex") == 1;

  return v19;
}

- (id)showPromptWithMessage:(id)a3 initialValue:(id)a4 title:(id)a5 okButtonTitle:(id)a6 cancelButtonTitle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SUScriptModalDialog *v22;
  id v23;
  void *v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v16)
  {
    v17 = -[SUScriptInterface _copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:](self, "_copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:", v12, v14, v16, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DE83F60, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SUScriptInterface _copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:](self, "_copyDialogWithMessage:title:cancelButtonTitle:okButtonTitle:", v12, v14, v19, v15);

  }
  objc_msgSend(MEMORY[0x24BEC8BA8], "textFieldWithTitle:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v20, "setValue:", v13);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextFields:", v21);

  v22 = -[SUScriptModalDialog initWithDialog:]([SUScriptModalDialog alloc], "initWithDialog:", v17);
  -[SUScriptModalDialog setDelegate:](v22, "setDelegate:", self);
  v23 = -[SUScriptModalDialog copyResponseByRunningModal](v22, "copyResponseByRunningModal");
  if (objc_msgSend(v23, "buttonIndex") == 1)
  {
    objc_msgSend(v23, "textFieldValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)_globalEventNotification:(id)a3
{
  SUScriptInterface *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "object");
  v4 = (SUScriptInterface *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    objc_msgSend(v8, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("payload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", v6, v7);

  }
}

- (void)_scriptUserInfoDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SUScriptInterface parentViewController](self, "parentViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isDescendantOfViewController:", v5);
  if ((_DWORD)v4)
    -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("userinfochange"));

}

- (void)safariViewController:(id)a3 didCompleteInitialLoad:(BOOL)a4
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  _WORD v11[8];

  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!v8)
    goto LABEL_10;
  v11[0] = 0;
  LODWORD(v10) = 2;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, v11, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_10:

  }
}

- (void)safariViewControllerDidFinish:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  _WORD v11[8];

  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!v8)
    goto LABEL_10;
  v11[0] = 0;
  LODWORD(v10) = 2;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, v11, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_10:

  }
  -[SUScriptInterface _cleanUpSafariViewController](self, "_cleanUpSafariViewController");
}

- (id)_cookieForURL:(id)a3
{
  id v4;
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

  v4 = a3;
  -[SUScriptInterface authenticationContext](self, "authenticationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requiredUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptInterface authenticationContext](self, "authenticationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requiredUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptInterface authenticationContext](self, "authenticationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountWithUniqueIdentifier:scope:", v9, objc_msgSend(v10, "accountScope"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cookieHeadersForURL:userIdentifier:", v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKey:", CFSTR("Cookie"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_copyDialogWithMessage:(id)a3 title:(id)a4 cancelButtonTitle:(id)a5 okButtonTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BEC8B90]);
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DE83F60, 0);
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24DE83F60, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v18;
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[SUScriptInterface webFrame](self, "webFrame");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "request");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUScriptModalDialog titleForURL:](SUScriptModalDialog, "titleForURL:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v23;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "stringRepresentation");
    v24 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v24;
  }
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v10, "description");
      v25 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v25;
    }
  }
  v26 = v14;
  v27 = v10;
  if (v11)
  {
    objc_msgSend(v14, "setMessage:", v10);
    v26 = v14;
    v27 = v11;
  }
  objc_msgSend(v26, "setTitle:", v27);
  v28 = (void *)MEMORY[0x24BDBCE30];
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BEC8B98], "buttonWithTitle:", v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC8B98], "buttonWithTitle:", v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayWithObjects:", v29, v30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setButtons:", v31);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC8B98], "buttonWithTitle:", v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayWithObjects:", v29, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setButtons:", v30);
  }

  return v14;
}

- (void)_presentSafariViewControllerWithURL:(id)a3 safariIdentifier:(id)a4 animated:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[SUScriptInterface setSafariViewControllerIdentifier:](self, "setSafariViewControllerIdentifier:", a4);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDF7570];
  v16[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __83__SUScriptInterface__presentSafariViewControllerWithURL_safariIdentifier_animated___block_invoke;
  v12[3] = &unk_24DE7B4F8;
  v12[4] = self;
  v13 = v8;
  v14 = a5;
  v11 = v8;
  objc_msgSend(v9, "openURL:options:completionHandler:", v11, v10, v12);

}

void __83__SUScriptInterface__presentSafariViewControllerWithURL_safariIdentifier_animated___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientInterface");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "parentViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "clientInterface:presentSafariViewControllerWithURL:fromViewController:animated:completion:", v13, v4, v5, *(unsigned __int8 *)(a1 + 48), 0);
    }
    else
    {
      v6 = (objc_class *)ISWeakLinkedClassForString();
      v7 = *(void **)(a1 + 32);
      v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v7, "setSafariViewController:", v8);

      objc_msgSend(*(id *)(a1 + 32), "safariViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "safariViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setModalPresentationStyle:", 16);

      objc_msgSend(*(id *)(a1 + 32), "safariViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDismissButtonStyle:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "integerValue"));

      objc_msgSend(*(id *)(a1 + 32), "parentViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "safariViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentViewController:animated:completion:", v12, *(unsigned __int8 *)(a1 + 48), 0);

    }
  }
}

- (void)_dismissSafariViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[SUScriptInterface clientInterface](self, "clientInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUScriptInterface parentViewController](self, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientInterface:dismissSafariViewControllerAnimated:fromViewController:completion:", v7, v4, v9, v6);

  }
  else
  {
    -[SUScriptInterface safariViewController](self, "safariViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SUScriptInterface safariViewController](self, "safariViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __69__SUScriptInterface__dismissSafariViewControllerAnimated_completion___block_invoke;
      v12[3] = &unk_24DE7B280;
      v12[4] = self;
      v13 = v6;
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", v4, v12);

    }
    else
    {
      -[SUScriptInterface _cleanUpSafariViewController](self, "_cleanUpSafariViewController");
      if (v6)
        v6[2](v6);
    }
  }

}

uint64_t __69__SUScriptInterface__dismissSafariViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_cleanUpSafariViewController");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_cleanUpSafariViewController
{
  -[SUScriptInterface setSafariViewController:](self, "setSafariViewController:", 0);
  -[SUScriptInterface setSafariViewControllerIdentifier:](self, "setSafariViewControllerIdentifier:", 0);
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_2, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptInterface;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)scriptXMLHTTPRequest:(id)a3 requiresCellularForURL:(id)a4
{
  id v5;
  NSMutableSet *requireCellularURLs;
  char v7;

  v5 = a4;
  -[NSLock lock](self->super._lock, "lock");
  requireCellularURLs = self->_requireCellularURLs;
  if (requireCellularURLs)
    v7 = -[NSMutableSet containsObject:](requireCellularURLs, "containsObject:", v5);
  else
    v7 = 0;
  -[NSLock unlock](self->super._lock, "unlock");

  return v7;
}

- (BOOL)scriptXMLHTTPStoreRequest:(id)a3 requiresCellularForURL:(id)a4
{
  id v5;
  NSMutableSet *requireCellularURLs;
  char v7;

  v5 = a4;
  -[NSLock lock](self->super._lock, "lock");
  requireCellularURLs = self->_requireCellularURLs;
  if (requireCellularURLs)
    v7 = -[NSMutableSet containsObject:](requireCellularURLs, "containsObject:", v5);
  else
    v7 = 0;
  -[NSLock unlock](self->super._lock, "unlock");

  return v7;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_0, 141);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptInterface;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptInterface;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_0 = (uint64_t)sel_accessibilityPostLayoutChange;
    *(_QWORD *)algn_255185518 = CFSTR("accessibilityPostLayoutChange");
    qword_255185520 = (uint64_t)sel_accessibilityPostScreenChange;
    unk_255185528 = CFSTR("accessibilityPostScreenChange");
    qword_255185530 = (uint64_t)sel_accountDSID;
    unk_255185538 = CFSTR("dsid");
    qword_255185540 = (uint64_t)sel_accountForDSID_;
    unk_255185548 = CFSTR("accountForDSID");
    qword_255185550 = (uint64_t)sel_accountName;
    unk_255185558 = CFSTR("accountName");
    qword_255185560 = (uint64_t)sel_activeNetworkType;
    unk_255185568 = CFSTR("activeNetworkType");
    qword_255185570 = (uint64_t)sel_addExternalDownloads_options_;
    unk_255185578 = CFSTR("addExternalDownloads");
    qword_255185580 = (uint64_t)sel_addExternalDownloadsFromManifestURL_;
    unk_255185588 = CFSTR("addExternalDownloadsFromURL");
    qword_255185590 = (uint64_t)sel_authorizeApplePayEnrollmentWithParameters_callback_;
    unk_255185598 = CFSTR("authorizeApplePayEnrollmentWithParameters");
    qword_2551855A0 = (uint64_t)sel_addiTunesPassWithCompletionFunction_;
    unk_2551855A8 = CFSTR("addiTunesPass");
    qword_2551855B0 = (uint64_t)sel_addPurchaseWithInfo_options_;
    unk_2551855B8 = CFSTR("buyAction");
    qword_2551855C0 = (uint64_t)sel_acknowledgePrivacyLinkWithIdentifier_;
    unk_2551855C8 = CFSTR("acknowledgePrivacyLink");
    qword_2551855D0 = (uint64_t)sel_arePodcastsDisabled;
    unk_2551855D8 = CFSTR("disablePodcasts");
    qword_2551855E0 = (uint64_t)sel_approveInPerson_completionFunction_;
    unk_2551855E8 = CFSTR("approveInPerson");
    qword_2551855F0 = (uint64_t)sel_authenticateForAccount_withOptions_;
    unk_2551855F8 = CFSTR("authenticateForAccount");
    qword_255185600 = (uint64_t)sel_authenticateAppleIdWithUsername_password_callback_;
    unk_255185608 = CFSTR("authenticateAppleIdWithCredentials");
    qword_255185610 = (uint64_t)sel_canSendEmail;
    unk_255185618 = CFSTR("canSendEmail");
    qword_255185620 = (uint64_t)sel_checkCapabilitiesPropertyListString_showFailureDialog_;
    unk_255185628 = CFSTR("checkCapabilities");
    qword_255185630 = (uint64_t)sel_composeEmailWithSubject_body_;
    unk_255185638 = CFSTR("composeEmail");
    qword_255185640 = (uint64_t)sel_composeReviewWithURL_itemIdentifier_type_;
    unk_255185648 = CFSTR("composeReview");
    qword_255185650 = (uint64_t)sel_currentAttestationVersion;
    unk_255185658 = CFSTR("getCurrentAttestationVersion");
    qword_255185660 = (uint64_t)sel_dialogDisplayCountForKey_;
    unk_255185668 = CFSTR("getDialogDisplayCountForKey");
    qword_255185670 = (uint64_t)sel_diskSpaceAvailable;
    unk_255185678 = CFSTR("diskSpaceAvailable");
    qword_255185680 = (uint64_t)sel_dismissSafariViewControllerAnimated_;
    unk_255185688 = CFSTR("dismissSafariViewController");
    qword_255185690 = (uint64_t)sel_dismissSheet;
    unk_255185698 = CFSTR("dismissSheet");
    qword_2551856A0 = (uint64_t)sel_dismissWindowsWithOptions_;
    unk_2551856A8 = CFSTR("dismissAllWindows");
    qword_2551856B0 = (uint64_t)sel_dispatchGlobalEventWithName_payload_;
    unk_2551856B8 = CFSTR("dispatchGlobalEvent");
    qword_2551856C0 = (uint64_t)sel_dispatchXEvent_;
    unk_2551856C8 = CFSTR("dispatchXEvent");
    qword_2551856D0 = (uint64_t)sel_fetchAppleCardMetadata_callback_;
    unk_2551856D8 = CFSTR("fetchAppleCardMetadata");
    qword_2551856E0 = (uint64_t)sel_fetchWalletCardData_;
    unk_2551856E8 = CFSTR("fetchWalletCardData");
    qword_2551856F0 = (uint64_t)sel_fetchWalletCardMetadata_callback_;
    unk_2551856F8 = CFSTR("fetchWalletCardMetadata");
    qword_255185700 = (uint64_t)sel_finishedTest_extraResults_;
    unk_255185708 = CFSTR("finishedTest");
    qword_255185710 = (uint64_t)sel_financeInterruptionResolved_;
    qword_255185718 = (uint64_t)CFSTR("financeInterruptionResolved");
    qword_255185720 = (uint64_t)sel_getAudioPlayerForURL_keyURL_certificateURL_;
    qword_255185728 = (uint64_t)CFSTR("getAudioPlayer");
    qword_255185730 = (uint64_t)sel_getInstalledSoftwareApplicationsWithCompletionFunction_;
    qword_255185738 = (uint64_t)CFSTR("getSoftwareApplications");
    qword_255185740 = (uint64_t)sel_getDownloadQueueWithQueueType_;
    qword_255185748 = (uint64_t)CFSTR("getDownloadQueue");
    qword_255185750 = (uint64_t)sel_getiTunesPass;
    qword_255185758 = (uint64_t)CFSTR("getiTunesPass");
    qword_255185760 = (uint64_t)sel_getSoftwareApplicationWithAdamID_completionFunction_;
    qword_255185768 = (uint64_t)CFSTR("getSoftwareApplicationWithAdamID");
    qword_255185770 = (uint64_t)sel_getSoftwareApplicationWithBundleID_completionFunction_;
    qword_255185778 = (uint64_t)CFSTR("getSoftwareApplicationWithBundleID");
    qword_255185780 = (uint64_t)sel_goBack;
    qword_255185788 = (uint64_t)CFSTR("goBack");
    qword_255185790 = (uint64_t)sel_gotoStoreURL_;
    qword_255185798 = (uint64_t)CFSTR("gotoURL");
    qword_2551857A0 = (uint64_t)sel_gotoStoreURL_ofType_withAuthentication_forceAuthentication_;
    qword_2551857A8 = (uint64_t)CFSTR("gotoURLOfType");
    qword_2551857B0 = (uint64_t)sel_handleDialogPropertyListString_;
    qword_2551857B8 = (uint64_t)CFSTR("createDialogDict");
    qword_2551857C0 = (uint64_t)sel_handleProtocolPropertyListString_;
    qword_2551857C8 = (uint64_t)CFSTR("addProtocol");
    qword_2551857D0 = (uint64_t)sel_handleRootObjectWithPropertyListString_;
    qword_2551857D8 = (uint64_t)CFSTR("addRootObject");
    qword_2551857E0 = (uint64_t)sel_handleTrackListWithPropertyListString_;
    qword_2551857E8 = (uint64_t)CFSTR("createTracklist");
    qword_2551857F0 = (uint64_t)sel_hardwareType;
    qword_2551857F8 = (uint64_t)CFSTR("hardwareType");
    qword_255185800 = (uint64_t)sel_haveAccount;
    qword_255185808 = (uint64_t)CFSTR("isAccountPresent");
    qword_255185810 = (uint64_t)sel_isExplicitContentDisabled;
    qword_255185818 = (uint64_t)CFSTR("disableExplicit");
    qword_255185820 = (uint64_t)sel_isRunningTest;
    qword_255185828 = (uint64_t)CFSTR("isRunningTest");
    qword_255185830 = (uint64_t)sel_launchedToTest;
    qword_255185838 = (uint64_t)CFSTR("launchedToTest");
    qword_255185840 = (uint64_t)sel_log_;
    qword_255185848 = (uint64_t)CFSTR("log");
    qword_255185850 = (uint64_t)sel_machineGUID;
    qword_255185858 = (uint64_t)CFSTR("getMachineGUID");
    qword_255185860 = (uint64_t)sel_makeAccount;
    qword_255185868 = (uint64_t)CFSTR("createAccount");
    qword_255185870 = (uint64_t)sel_makeAccountPageWithURLs_;
    qword_255185878 = (uint64_t)CFSTR("createAccountPage");
    qword_255185880 = (uint64_t)sel_makeActivity;
    qword_255185888 = (uint64_t)CFSTR("createActivity");
    qword_255185890 = (uint64_t)sel_makeActivityItemProviderWithMIMEType_;
    qword_255185898 = (uint64_t)CFSTR("createActivityItemProvider");
    qword_2551858A0 = (uint64_t)sel_makeActivityViewControllerWithProviders_activities_;
    qword_2551858A8 = (uint64_t)CFSTR("createActivityViewController");
    qword_2551858B0 = (uint64_t)sel_makeAMSViewController;
    qword_2551858B8 = (uint64_t)CFSTR("makeAMSViewController");
    qword_2551858C0 = (uint64_t)sel_makeButtonWithSystemItemString_action_;
    qword_2551858C8 = (uint64_t)CFSTR("createSystemButton");
    qword_2551858D0 = (uint64_t)sel_makeButtonWithTitle_action_;
    qword_2551858D8 = (uint64_t)CFSTR("createButton");
    qword_2551858E0 = (uint64_t)sel_makeCalloutView;
    qword_2551858E8 = (uint64_t)CFSTR("createCalloutView");
    qword_2551858F0 = (uint64_t)sel_makeCanvasWithWidth_height_;
    qword_2551858F8 = (uint64_t)CFSTR("createCanvas");
    qword_255185900 = (uint64_t)sel_makeColorWithHue_saturation_brightness_alpha_;
    qword_255185908 = (uint64_t)CFSTR("createHSBAColor");
    qword_255185910 = (uint64_t)sel_makeColorWithRed_green_blue_alpha_;
    qword_255185918 = (uint64_t)CFSTR("createRGBAColor");
    qword_255185920 = (uint64_t)sel_makeColorWithWhite_alpha_;
    qword_255185928 = (uint64_t)CFSTR("createWhiteColor");
    qword_255185930 = (uint64_t)sel_makeComposeReviewViewControllerWithReview_;
    qword_255185938 = (uint64_t)CFSTR("createComposeReviewController");
    qword_255185940 = (uint64_t)sel_makeDateFormatter;
    qword_255185948 = (uint64_t)CFSTR("createDateFormatter");
    qword_255185950 = (uint64_t)sel_makeDialog;
    qword_255185958 = (uint64_t)CFSTR("createDialog");
    qword_255185960 = (uint64_t)sel_makeDocumentInteractionController;
    qword_255185968 = (uint64_t)CFSTR("createDocumentInteractionController");
    qword_255185970 = (uint64_t)sel_makeDonationViewControllerWithCharityIdentifier_;
    qword_255185978 = (uint64_t)CFSTR("createDonationViewController");
    qword_255185980 = (uint64_t)sel_makeFacebookRequestWithURL_requestMethod_;
    qword_255185988 = (uint64_t)CFSTR("createFacebookRequest");
    qword_255185990 = (uint64_t)sel_makeFacebookSessionWithAccount_;
    qword_255185998 = (uint64_t)CFSTR("createFacebookSession");
    qword_2551859A0 = (uint64_t)sel_makeFamilySetupViewController;
    qword_2551859A8 = (uint64_t)CFSTR("createFamilySetupViewController");
    qword_2551859B0 = (uint64_t)sel_makeGiftViewController;
    qword_2551859B8 = (uint64_t)CFSTR("createGiftViewController");
    qword_2551859C0 = (uint64_t)sel_makeLinearGradientWithX0_y0_x1_y1_;
    qword_2551859C8 = (uint64_t)CFSTR("createLinearGradient");
    qword_2551859D0 = (uint64_t)sel_makeLookupRequest;
    qword_2551859D8 = (uint64_t)CFSTR("createLookupRequest");
    qword_2551859E0 = (uint64_t)sel_makeMediaPlayerItemWithProperties_;
    qword_2551859E8 = (uint64_t)CFSTR("createMediaPlayerItem");
    qword_2551859F0 = (uint64_t)sel_makeMediaPlayerViewControllerWithMediaPlayerItem_;
    qword_2551859F8 = (uint64_t)CFSTR("createMediaPlayer");
    qword_255185A00 = (uint64_t)sel_makeMenuViewController;
    qword_255185A08 = (uint64_t)CFSTR("createMenuViewController");
    qword_255185A10 = (uint64_t)sel_makeNavigationControllerWithRootViewController_;
    qword_255185A18 = (uint64_t)CFSTR("createNavigationController");
    qword_255185A20 = (uint64_t)sel_makeNumberFormatterWithStyle_;
    qword_255185A28 = (uint64_t)CFSTR("createNumberFormatter");
    qword_255185A30 = (uint64_t)sel_makePopOverWithViewController_;
    qword_255185A38 = (uint64_t)CFSTR("createPopOver");
    qword_255185A40 = (uint64_t)sel_makeRadialGradientWithX0_y0_r0_x1_y1_r1_;
    qword_255185A48 = (uint64_t)CFSTR("createRadialGradient");
    qword_255185A50 = (uint64_t)sel_makeRedeemCameraViewController;
    qword_255185A58 = (uint64_t)CFSTR("createRedeemCamera");
    qword_255185A60 = (uint64_t)sel_makeRedeemViewController;
    qword_255185A68 = (uint64_t)CFSTR("createRedeemViewController");
    qword_255185A70 = (uint64_t)sel_makeReportAProblemViewControllerWithAdamID_;
    qword_255185A78 = (uint64_t)CFSTR("createReportAProblemViewController");
    qword_255185A80 = (uint64_t)sel_makeReviewWithAdamID_;
    qword_255185A88 = (uint64_t)CFSTR("createReview");
    qword_255185A90 = (uint64_t)sel_makeScriptActionWithType_;
    qword_255185A98 = (uint64_t)CFSTR("createAction");
    qword_255185AA0 = (uint64_t)sel_makeSegmentedControl;
    qword_255185AA8 = (uint64_t)CFSTR("createSegmentedControl");
    qword_255185AB0 = (uint64_t)sel_makeSplitViewController;
    qword_255185AB8 = (uint64_t)CFSTR("createSplitViewController");
    qword_255185AC0 = (uint64_t)sel_makeStorePageWithURLs_;
    qword_255185AC8 = (uint64_t)CFSTR("createStorePage");
    qword_255185AD0 = (uint64_t)sel_makeStoreSheetViewController;
    qword_255185AD8 = (uint64_t)CFSTR("createStoreSheetViewController");
    qword_255185AE0 = (uint64_t)sel_makeSubscriptionStatusRequest;
    qword_255185AE8 = (uint64_t)CFSTR("createSubscriptionStatusRequest");
    qword_255185AF0 = (uint64_t)sel_makeTextFieldWithStyle_placeholder_value_width_;
    qword_255185AF8 = (uint64_t)CFSTR("createTextField");
    qword_255185B00 = (uint64_t)sel_makeTweetComposeViewController;
    qword_255185B08 = (uint64_t)CFSTR("createTweetComposeViewController");
    qword_255185B10 = (uint64_t)sel_makeURLRequestWithURLs_timeoutInterval_;
    qword_255185B18 = (uint64_t)CFSTR("createURLRequest");
    qword_255185B20 = (uint64_t)sel_makeVolumeViewController;
    qword_255185B28 = (uint64_t)CFSTR("createVolumeViewController");
    qword_255185B30 = (uint64_t)sel_makeXMLHTTPRequest;
    qword_255185B38 = (uint64_t)CFSTR("createXHR");
    qword_255185B40 = (uint64_t)sel_makeXMLHTTPStoreRequest;
    qword_255185B48 = (uint64_t)CFSTR("createStoreXHR");
    qword_255185B50 = (uint64_t)sel_makeWindow;
    qword_255185B58 = (uint64_t)CFSTR("createWindow");
    qword_255185B60 = (uint64_t)sel_minimumAttestationVersionForAction_;
    qword_255185B68 = (uint64_t)CFSTR("getMinimumAttestationVersion");
    qword_255185B70 = (uint64_t)sel_openCreditCardReaderWithCompletionFunction_;
    qword_255185B78 = (uint64_t)CFSTR("openCreditCardReader");
    qword_255185B80 = (uint64_t)sel_openFamilyCircleSetupWithClientName_completionFunction_;
    qword_255185B88 = (uint64_t)CFSTR("openFamilyCircleSetup");
    qword_255185B90 = (uint64_t)sel_openURL_;
    qword_255185B98 = (uint64_t)CFSTR("openURL");
    qword_255185BA0 = (uint64_t)sel_openWallet;
    qword_255185BA8 = (uint64_t)CFSTR("openWallet");
    qword_255185BB0 = (uint64_t)sel_paymentSetupFeatureSupported_callback_;
    qword_255185BB8 = (uint64_t)CFSTR("paymentSetupFeatureSupported");
    qword_255185BC0 = (uint64_t)sel_perfLog_;
    qword_255185BC8 = (uint64_t)CFSTR("perfLog");
    qword_255185BD0 = (uint64_t)sel_performPurchaseAnimationForIdentifier_style_;
    qword_255185BD8 = (uint64_t)CFSTR("performPurchaseAnimation");
    qword_255185BE0 = (uint64_t)sel_pingURL_;
    qword_255185BE8 = (uint64_t)CFSTR("pingURL");
    qword_255185BF0 = (uint64_t)sel_presentPrivacySplashWithIdentifier_;
    qword_255185BF8 = (uint64_t)CFSTR("presentPrivacySplash");
    qword_255185C00 = (uint64_t)sel_presentPrivacyViewControllerWithIdentifier_;
    qword_255185C08 = (uint64_t)CFSTR("presentPrivacyViewController");
    qword_255185C10 = (uint64_t)sel_redeemCode_;
    qword_255185C18 = (uint64_t)CFSTR("redeemCode");
    qword_255185C20 = (uint64_t)sel_redeemCodes_params_completion_;
    qword_255185C28 = (uint64_t)CFSTR("redeemCodes");
    qword_255185C30 = (uint64_t)sel_registerNavBarButtonWithTitle_side_function_;
    qword_255185C38 = (uint64_t)CFSTR("registerNavigationButton");
    qword_255185C40 = (uint64_t)sel_reloadFooterSection_withURL_;
    qword_255185C48 = (uint64_t)CFSTR("reloadFooterSection");
    qword_255185C50 = (uint64_t)sel_removeDeviceOfferWithIdentifier_account_;
    qword_255185C58 = (uint64_t)CFSTR("removeDeviceOffer");
    qword_255185C60 = (uint64_t)sel_reportAProblemForIdentifier_;
    qword_255185C68 = (uint64_t)CFSTR("openReportAProblemSheet");
    qword_255185C70 = (uint64_t)sel_requireCellularForResourceWithURL_;
    qword_255185C78 = (uint64_t)CFSTR("requireCellular");
    qword_255185C80 = (uint64_t)sel_retryAllRestoreDownloads;
    qword_255185C88 = (uint64_t)CFSTR("retryAllRestoreDownloads");
    qword_255185C90 = (uint64_t)sel_selectSectionWithIdentifier_;
    qword_255185C98 = (uint64_t)CFSTR("selectFooterTab");
    qword_255185CA0 = (uint64_t)sel_selectTrackListItemWithIdentifier_;
    qword_255185CA8 = (uint64_t)CFSTR("selectTrackWithItemId");
    qword_255185CB0 = (uint64_t)sel_sendPostOfType_withOptions_;
    qword_255185CB8 = (uint64_t)CFSTR("sendPostOfType");
    qword_255185CC0 = (uint64_t)sel_setLibraryIdentifierWithType_value_;
    qword_255185CC8 = (uint64_t)CFSTR("setLibraryIdentifier");
    qword_255185CD0 = (uint64_t)sel_shouldRestrictContentOfSystem_level_;
    qword_255185CD8 = (uint64_t)CFSTR("restrictContentForSystemAndLevel");
    qword_255185CE0 = (uint64_t)sel_shouldShowAddToWalletLink_;
    qword_255185CE8 = (uint64_t)CFSTR("shouldShowAddToWalletLink");
    qword_255185CF0 = (uint64_t)sel_shouldDisplayPrivacyLinkWithIdentifier_;
    qword_255185CF8 = (uint64_t)CFSTR("shouldDisplayPrivacyLink");
    qword_255185D00 = (uint64_t)sel_showAlertWithMessage_title_buttonTitle_;
    qword_255185D08 = (uint64_t)CFSTR("alert");
    qword_255185D10 = (uint64_t)sel_showConfirmWithMessage_title_okButtonTitle_cancelButtonTitle_;
    qword_255185D18 = (uint64_t)CFSTR("confirm");
    qword_255185D20 = (uint64_t)sel_showMediaPlayerWithURLString_orientation_title_subtitle_bookmarkID_duration_type_imageURL_;
    qword_255185D28 = (uint64_t)CFSTR("showMediaPlayer");
    qword_255185D30 = (uint64_t)sel_showMediaPreviewWithURLString_;
    qword_255185D38 = (uint64_t)CFSTR("showMediaPreview");
    qword_255185D40 = (uint64_t)sel_showPromptWithMessage_initialValue_title_okButtonTitle_cancelButtonTitle_;
    qword_255185D48 = (uint64_t)CFSTR("prompt");
    qword_255185D50 = (uint64_t)sel_showSafariViewControllerWithURLString_identifier_animated_;
    qword_255185D58 = (uint64_t)CFSTR("showSafariViewController");
    qword_255185D60 = (uint64_t)sel_signOutPrimaryAccount;
    qword_255185D68 = (uint64_t)CFSTR("signOutActiveAccount");
    qword_255185D70 = (uint64_t)sel_signupInWallet_callback_;
    qword_255185D78 = (uint64_t)CFSTR("signupInWallet");
    qword_255185D80 = (uint64_t)sel_softwareApplicationWithAdamID_;
    qword_255185D88 = (uint64_t)CFSTR("softwareApplicationWithAdamID");
    qword_255185D90 = (uint64_t)sel_softwareApplicationWithBundleID_;
    qword_255185D98 = (uint64_t)CFSTR("softwareApplicationWithBundleID");
    qword_255185DA0 = (uint64_t)sel_startedTest_;
    qword_255185DA8 = (uint64_t)CFSTR("startedTest");
    qword_255185DB0 = (uint64_t)sel_startListeningForAuthenticationTokenWithCallback_;
    qword_255185DB8 = (uint64_t)CFSTR("startListeningForAuthenticationToken");
    qword_255185DC0 = (uint64_t)sel_stopListeningForAuthenticationToken;
    qword_255185DC8 = (uint64_t)CFSTR("stopListeningForAuthenticationToken");
    qword_255185DD0 = (uint64_t)sel_systemVersion;
    qword_255185DD8 = (uint64_t)CFSTR("systemVersion");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("accountCreationSecureContext"), CFSTR("accounts"), CFSTR("accounts"), CFSTR("activeAudioPlayers"), CFSTR("activeAudioPlayers"), CFSTR("appleAccountStore"), CFSTR("appleAccountStore"), CFSTR("application"), CFSTR("application"), CFSTR("applicationAccessibilityEnabled"), CFSTR("applicationAccessibilityEnabled"), CFSTR("applicationLocalStorage"), CFSTR("applicationLocalStorage"), CFSTR("askToBuyPrompt"), CFSTR("askToBuyPrompt"), CFSTR("bag"), CFSTR("scriptStoreBagDictionary"),
           CFSTR("carrierBundling"),
           CFSTR("carrierBundlingController"),
           CFSTR("clientIdentifier"),
           CFSTR("clientIdentifier"),
           CFSTR("cookie"),
           CFSTR("cookie"),
           CFSTR("cookieDefaultURL"),
           CFSTR("cookieDefaultURL"),
           CFSTR("cookieForDefaultURL"),
           CFSTR("cookieForDefaultURL"),
           CFSTR("creditCardReaderAvailable"),
           CFSTR("creditCardReaderAvailable"),
           CFSTR("currentAccount"),
           CFSTR("currentAccount"),
           CFSTR("device"),
           CFSTR("device"),
           CFSTR("deviceLocalStorage"),
           CFSTR("deviceLocalStorage"),
           CFSTR("deviceOffers"),
           CFSTR("deviceOffers"),
           CFSTR("deviceSerialNumber"),
           CFSTR("deviceSerialNumber"),
           CFSTR("globalRootObject"),
           CFSTR("globalRootObject"),
           CFSTR("gsToken"),
           CFSTR("gsToken"),
           CFSTR("installedSoftwareApplications"),
           CFSTR("installedSoftwareApplications"),
           CFSTR("isApplePayAvailable"),
           CFSTR("isApplePayAvailable"),
           CFSTR("isFinanceInterruption"),
           CFSTR("isFinanceInterruption"),
           CFSTR("isWalletAvailable"),
           CFSTR("isWalletAvailable"),
           CFSTR("loggingEnabled"),
           CFSTR("loggingEnabled"),
           CFSTR("mediaLibrary"),
           CFSTR("mediaLibrary"),
           CFSTR("metricsController"),
           CFSTR("metricsController"),
           CFSTR("navigationBar"),
           CFSTR("navigationBar"),
           CFSTR("navigationSimulator"),
           CFSTR("navigationSimulator"));
    v3 = (void *)__KeyMapping_2;
    __KeyMapping_2 = v2;

  }
}

- (NSString)safariViewControllerIdentifier
{
  return self->_safariViewControllerIdentifier;
}

- (void)setSafariViewControllerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_safariViewControllerIdentifier, a3);
}

- (NSNumber)safariDismissButtonStyle
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSafariDismissButtonStyle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (SFSafariViewController)safariViewController
{
  return self->_safariViewController;
}

- (void)setSafariViewController:(id)a3
{
  objc_storeStrong((id *)&self->_safariViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safariViewController, 0);
  objc_storeStrong((id *)&self->_safariDismissButtonStyle, 0);
  objc_storeStrong((id *)&self->_safariViewControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_navigationSimulator, 0);
  objc_storeStrong((id *)&self->_hsaTokenQueue, 0);
  objc_storeStrong(&self->_threadSafeDelegate, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusCoordinator, 0);
  objc_storeStrong((id *)&self->_scriptWindowContext, 0);
  objc_storeStrong((id *)&self->_scriptStoreBagLoader, 0);
  objc_storeStrong((id *)&self->_scriptOperationDelegate, 0);
  objc_storeStrong((id *)&self->_requireCellularURLs, 0);
  objc_storeStrong((id *)&self->_purchaseManager, 0);
  objc_storeStrong((id *)&self->_previewOverlay, 0);
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_frame, 0);
  objc_storeStrong((id *)&self->_downloadQueues, 0);
  objc_storeStrong((id *)&self->_deviceLocalStorage, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_storeStrong((id *)&self->_carrierBundlingController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_applicationLocalStorage, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (id)redeemCameraAvailable
{
  _BOOL4 v2;
  id *v3;

  v2 = +[SURedeemCameraViewController cameraSupported](SURedeemCameraViewController, "cameraSupported");
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)makeRedeemCameraViewController
{
  SUScriptRedeemCameraViewController *v3;

  v3 = objc_alloc_init(SUScriptRedeemCameraViewController);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (SUScriptDictionary)scriptStoreBagDictionary
{
  return (SUScriptDictionary *)-[SUScriptStoreBagLoader scriptStoreBagDictionary](self->_scriptStoreBagLoader, "scriptStoreBagDictionary");
}

- (void)getInstalledSoftwareApplicationsWithCompletionFunction:(id)a3
{
  SUScriptFunction *v5;
  id v6;
  _QWORD v7[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a3);
    -[SUScriptFunction setThisObject:](v5, "setThisObject:", self);
    v6 = objc_alloc_init(MEMORY[0x24BEC8BB0]);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __114__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getInstalledSoftwareApplicationsWithCompletionFunction___block_invoke;
    v7[3] = &unk_24DE7AFB8;
    v7[4] = self;
    v7[5] = v5;
    objc_msgSend(v6, "setCompletionBlock:", v7);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

void __114__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getInstalledSoftwareApplicationsWithCompletionFunction___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SUScriptSoftwareApplication *v8;
  SUScriptSoftwareApplication *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C20], "loadedMap"), "applications");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = -[SUScriptSoftwareApplication initWithApplication:]([SUScriptSoftwareApplication alloc], "initWithApplication:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v2, "addObject:", v8);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "checkInScriptObjects:", v2);
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v2));
  objc_msgSend(*(id *)(a1 + 40), "setThisObject:", 0);

}

- (void)getSoftwareApplicationWithAdamID:(id)a3 completionFunction:(id)a4
{
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v6 = SSGetUnsignedLongLongFromValue();
  v7 = (void *)MEMORY[0x24BDFA950];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __111__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getSoftwareApplicationWithAdamID_completionFunction___block_invoke;
      v8[3] = &__block_descriptor_40_e28___ISSoftwareApplication_8__0l;
      v8[4] = v6;
      -[SUScriptInterface _getSoftwareApplicationWithCompletionFunction:lookupBlock:](self, "_getSoftwareApplicationWithCompletionFunction:lookupBlock:", a4, v8);
      return;
    }
    v7 = (void *)MEMORY[0x24BDFA950];
  }
  objc_msgSend(v7, "throwException:", CFSTR("Invalid argument"));
}

uint64_t __111__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getSoftwareApplicationWithAdamID_completionFunction___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEC8C20], "loadedMap");
  return objc_msgSend(v2, "applicationForItemIdentifier:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithItemIdentifier:", *(_QWORD *)(a1 + 32)));
}

- (void)getSoftwareApplicationWithBundleID:(id)a3 completionFunction:(id)a4
{
  char isKindOfClass;
  void *v8;
  _QWORD v9[5];

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = (void *)MEMORY[0x24BDFA950];
  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __113__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getSoftwareApplicationWithBundleID_completionFunction___block_invoke;
      v9[3] = &unk_24DE7BE78;
      v9[4] = a3;
      -[SUScriptInterface _getSoftwareApplicationWithCompletionFunction:lookupBlock:](self, "_getSoftwareApplicationWithCompletionFunction:lookupBlock:", a4, v9);
      return;
    }
    v8 = (void *)MEMORY[0x24BDFA950];
  }
  objc_msgSend(v8, "throwException:", CFSTR("Invalid argument"));
}

uint64_t __113__SUScriptInterface_SUScriptSoftwareApplicationAdditions__getSoftwareApplicationWithBundleID_completionFunction___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C20], "loadedMap"), "applicationForBundleIdentifier:", *(_QWORD *)(a1 + 32));
}

- (id)softwareApplicationWithAdamID:(id)a3
{
  SUScriptSoftwareApplication *v4;
  void *v5;

  v4 = (SUScriptSoftwareApplication *)SSGetUnsignedLongLongFromValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEC8C20], "loadedMap");
    v4 = (SUScriptSoftwareApplication *)objc_msgSend(v5, "applicationForItemIdentifier:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithItemIdentifier:", v4));
    if (v4)
    {
      v4 = -[SUScriptSoftwareApplication initWithApplication:]([SUScriptSoftwareApplication alloc], "initWithApplication:", v4);
      -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v4);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return v4;
}

- (id)softwareApplicationWithBundleID:(id)a3
{
  SUScriptSoftwareApplication *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (SUScriptSoftwareApplication *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C20], "loadedMap"), "applicationForBundleIdentifier:", a3);
    if (v5)
    {
      v5 = -[SUScriptSoftwareApplication initWithApplication:]([SUScriptSoftwareApplication alloc], "initWithApplication:", v5);
      -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v5 = 0;
  }
  return v5;
}

- (NSArray)installedSoftwareApplications
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUScriptSoftwareApplication *v9;
  SUScriptSoftwareApplication *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C20], "loadedMap"), "applications");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = -[SUScriptSoftwareApplication initWithApplication:]([SUScriptSoftwareApplication alloc], "initWithApplication:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        if (v9)
        {
          v10 = v9;
          -[NSArray addObject:](v3, "addObject:", v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v3);
  return v3;
}

- (void)_getSoftwareApplicationWithCompletionFunction:(id)a3 lookupBlock:(id)a4
{
  SUScriptFunction *v6;
  id v7;
  _QWORD v8[7];

  v6 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a3);
  -[SUScriptFunction setThisObject:](v6, "setThisObject:", self);
  v7 = objc_alloc_init(MEMORY[0x24BEC8BB0]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __117__SUScriptInterface_SUScriptSoftwareApplicationAdditions___getSoftwareApplicationWithCompletionFunction_lookupBlock___block_invoke;
  v8[3] = &unk_24DE7BEA0;
  v8[5] = v6;
  v8[6] = a4;
  v8[4] = self;
  objc_msgSend(v7, "setCompletionBlock:", v8);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v7);

}

void __117__SUScriptInterface_SUScriptSoftwareApplicationAdditions___getSoftwareApplicationWithCompletionFunction_lookupBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SUScriptSoftwareApplication *v9;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (!v2)
  {
    v8 = *(void **)(a1 + 40);
    v4 = (id *)(a1 + 40);
    v5 = v8;
    v7 = (void *)MEMORY[0x24BDBCE30];
LABEL_5:
    v3 = objc_msgSend(MEMORY[0x24BDBCEF8], "null", v3);
    v9 = 0;
    goto LABEL_6;
  }
  v9 = -[SUScriptSoftwareApplication initWithApplication:]([SUScriptSoftwareApplication alloc], "initWithApplication:", v2);
  objc_msgSend(*(id *)(a1 + 32), "checkInScriptObject:", v9);
  v6 = *(void **)(a1 + 40);
  v4 = (id *)(a1 + 40);
  v5 = v6;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v3 = (uint64_t)v9;
  if (!v9)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(v5, "callWithArguments:", objc_msgSend(v7, "arrayWithObject:", v3));
  objc_msgSend(*v4, "setThisObject:", 0);

}

- (id)makePopOverWithViewController:(id)a3
{
  SUScriptPopOver *v5;

  v5 = objc_alloc_init(SUScriptPopOver);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
  -[SUScriptPopOver setViewController:](v5, "setViewController:", a3);
  return v5;
}

- (id)makeTextFieldWithStyle:(id)a3 placeholder:(id)a4 value:(id)a5 width:(id)a6
{
  SUScriptTextField *v10;
  char isKindOfClass;

  v10 = -[SUScriptTextField initWithTextFieldStyle:]([SUScriptTextField alloc], "initWithTextFieldStyle:", a3);
  if (v10)
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v10);
    -[SUScriptTextField setPlaceholder:](v10, "setPlaceholder:", a4);
    -[SUScriptTextField setValue:](v10, "setValue:", a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (a6)
      {
        if ((isKindOfClass & 1) == 0)
          -[SUScriptTextField setWidth:](v10, "setWidth:", a6);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return v10;
}

- (id)makeButtonWithSystemItemString:(id)a3 action:(id)a4
{
  SUScriptButton *v6;

  v6 = -[SUScriptButton initWithSystemItemString:]([SUScriptButton alloc], "initWithSystemItemString:", a3);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6);
  -[SUScriptButton setAction:](v6, "setAction:", a4);
  return v6;
}

- (id)makeButtonWithTitle:(id)a3 action:(id)a4
{
  SUScriptButton *v7;

  v7 = objc_alloc_init(SUScriptButton);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7);
  -[SUScriptButton setAction:](v7, "setAction:", a4);
  -[SUScriptButton setTitle:](v7, "setTitle:", a3);
  return v7;
}

- (id)systemItemAction
{
  return CFSTR("action");
}

- (id)systemItemAdd
{
  return CFSTR("add");
}

- (id)systemItemBookmarks
{
  return CFSTR("bookmarks");
}

- (id)systemItemCamera
{
  return CFSTR("camera");
}

- (id)systemItemCancel
{
  return CFSTR("cancel");
}

- (id)systemItemCompose
{
  return CFSTR("compose");
}

- (id)systemItemDone
{
  return CFSTR("done");
}

- (id)systemItemEdit
{
  return CFSTR("edit");
}

- (id)systemItemFastForward
{
  return CFSTR("fast-forward");
}

- (id)systemItemFixedSpace
{
  return CFSTR("fixed-space");
}

- (id)systemItemFlexibleSpace
{
  return CFSTR("flexible-space");
}

- (id)systemItemOrganize
{
  return CFSTR("organize");
}

- (id)systemItemPageCurl
{
  return CFSTR("page-curl");
}

- (id)systemItemPause
{
  return CFSTR("pause");
}

- (id)systemItemPlay
{
  return CFSTR("play");
}

- (id)systemItemRedo
{
  return CFSTR("redo");
}

- (id)systemItemRefresh
{
  return CFSTR("refresh");
}

- (id)systemItemReplay
{
  return CFSTR("replay");
}

- (id)systemItemRewind
{
  return CFSTR("rewind");
}

- (id)systemItemSearch
{
  return CFSTR("search");
}

- (id)systemItemStop
{
  return CFSTR("stop");
}

- (id)systemItemTrash
{
  return CFSTR("trash");
}

- (id)systemItemUndo
{
  return CFSTR("undo");
}

- (int64_t)dialogDisplayCountForKey:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(MEMORY[0x24BEC8B90], "displayCountForKey:", a3);
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  return 0;
}

- (id)makeDialog
{
  SUScriptDialog *v3;

  v3 = objc_alloc_init(SUScriptDialog);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (void)deallocAuthentication
{
  +[SUScriptAccountManager endAccountManagerSessionForObject:](SUScriptAccountManager, "endAccountManagerSessionForObject:", self);
}

- (void)initAuthentication
{
  SUScriptAccountManager *v3;
  SUScriptAccountManager *accountManager;

  +[SUScriptAccountManager beginAccountManagerSessionForObject:](SUScriptAccountManager, "beginAccountManagerSessionForObject:", self);
  v3 = (SUScriptAccountManager *)objc_claimAutoreleasedReturnValue();
  accountManager = self->_accountManager;
  self->_accountManager = v3;

}

- (id)accountForDSID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v4 = 0;
  }
  else if (v4)
  {
    v7 = SSGetUnsignedLongLongFromValue();
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", v7);

      -[SUScriptAccountManager accountForDSID:](self->_accountManager, "accountForDSID:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (id)v8;
      if (v5)
        goto LABEL_5;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v5;
}

- (void)authenticateForAccount:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SUScriptAuthenticationOperation *v9;
  SUScriptAuthenticationOperation *v10;
  SUScriptOperation *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v7 = 0;
  }
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = (void *)MEMORY[0x24BDFA950];
LABEL_18:
      objc_msgSend(v12, "throwException:", CFSTR("Invalid argument"));
      goto LABEL_19;
    }
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = (void *)MEMORY[0x24BDFA950];
      goto LABEL_18;
    }
  }
  objc_msgSend(v6, "dsID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  v13 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v9 = -[SUScriptAuthenticationOperation initWithAccountIdentifier:]([SUScriptAuthenticationOperation alloc], "initWithAccountIdentifier:", v8, v13, 3221225472, __74__SUScriptInterface_SUAuthentication__authenticateForAccount_withOptions___block_invoke, &unk_24DE7B430, self, &v14);
  v10 = v9;
  if (v15[5])
    -[SUScriptAuthenticationOperation setPresentingViewController:](v9, "setPresentingViewController:");
  v11 = -[SUScriptOperation initWithOperation:options:]([SUScriptOperation alloc], "initWithOperation:options:", v10, v7);
  -[SUScriptOperationDelegate enqueueOperation:](self->_scriptOperationDelegate, "enqueueOperation:", v11);

  _Block_object_dispose(&v14, 8);
LABEL_19:

}

void __74__SUScriptInterface_SUAuthentication__authenticateForAccount_withOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)authenticateAppleIdWithUsername:(id)a3 password:(id)a4 callback:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v9 = 0;
  }
  if (!v7 || !v8)
  {
    v10 = (void *)MEMORY[0x24BDFA950];
    v11 = CFSTR("Invalid argument - username or password does not exist");
LABEL_21:
    objc_msgSend(v10, "throwException:", v11);
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDFA950];
    v11 = CFSTR("Invalid argument - username");
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDFA950];
    v11 = CFSTR("Invalid argument - password");
    goto LABEL_21;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x24BDFA950];
      v11 = CFSTR("Invalid argument - callback");
      goto LABEL_21;
    }
  }
  v12 = v7;
  v13 = v8;
  v14 = v9;
  WebThreadRunOnMainThread();

LABEL_22:
}

void __89__SUScriptInterface_SUAuthentication__authenticateAppleIdWithUsername_password_callback___block_invoke(uint64_t a1)
{
  void *v2;
  SUScriptFunction *v3;
  SUScriptOperation *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      v7 &= 2u;
    if (v7)
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v9 = v15;
      LODWORD(v12) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_12:

        v3 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 56));
        -[SUScriptFunction setThisObject:](v3, "setThisObject:", *(_QWORD *)(a1 + 32));
        v13 = CFSTR("fail");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUScriptFunction callWithArguments:](v3, "callWithArguments:", v11);

        -[SUScriptFunction setThisObject:](v3, "setThisObject:", 0);
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v14, v12);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog();
    }

    goto LABEL_12;
  }
  v3 = -[SUScriptAppleIdAuthenticationOperation initWithUsername:password:viewController:]([SUScriptAppleIdAuthenticationOperation alloc], "initWithUsername:password:viewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2);
  v4 = -[SUScriptOperation initWithOperation:callback:]([SUScriptOperation alloc], "initWithOperation:callback:", v3, *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "enqueueOperation:", v4);

LABEL_13:
}

- (id)makeAccount
{
  return objc_alloc_init(SUScriptAccount);
}

- (NSArray)accounts
{
  return -[SUScriptAccountManager accounts](self->_accountManager, "accounts");
}

- (id)currentAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[SUScriptInterface authenticationContext](self, "authenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requiredUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptInterface authenticationContext](self, "authenticationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requiredUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptInterface authenticationContext](self, "authenticationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithUniqueIdentifier:scope:", v7, objc_msgSend(v8, "accountScope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_4:
    objc_msgSend(v9, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptInterface accountForDSID:](self, "accountForDSID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (SUScriptAccount)primaryAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[SUScriptInterface authenticationContext](self, "authenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requiredUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptInterface authenticationContext](self, "authenticationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requiredUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptInterface authenticationContext](self, "authenticationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithUniqueIdentifier:scope:", v7, objc_msgSend(v8, "accountScope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isActive") & 1) != 0)
    {
      if (v9)
        goto LABEL_7;
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    return (SUScriptAccount *)v12;
  }
LABEL_7:
  objc_msgSend(v9, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptInterface accountForDSID:](self, "accountForDSID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUScriptAccount *)v12;
}

- (id)primaryiCloudAccount
{
  void *v2;
  void *v3;
  void *v4;
  SUScriptAccount *v5;

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1D80]), "initWithBackingAccount:", v3);
    v5 = objc_alloc_init(SUScriptAccount);
    -[SUScriptAccount setAccount:](v5, "setAccount:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (SUScriptAccount *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (SUScriptAccount)primaryLockerAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeLockerAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptInterface accountForDSID:](self, "accountForDSID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (SUScriptAccount *)v6;
}

- (void)setAccounts:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("accounts"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setPrimaryAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signOutAllAccounts");
    goto LABEL_5;
  }
  if (!v7)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v5, "setActiveAccount:", v3);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Account must have a dsid to be primary"));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
LABEL_5:

}

- (void)setPrimaryLockerAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v8, "setActiveLockerAccount:", 0);
    goto LABEL_5;
  }
  if (!v8)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "setActiveLockerAccount:", v4);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Account must have a dsid to be primary"));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
LABEL_5:

}

- (id)makeFamilySetupViewController
{
  SUScriptFamilySetupViewController *v3;

  v3 = objc_alloc_init(SUScriptFamilySetupViewController);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)getDownloadQueueWithQueueType:(id)a3
{
  NSMutableDictionary *downloadQueues;
  SUScriptDownloadQueue *v6;
  SUScriptDownloadQueue *v7;
  void *v8;
  const __CFString *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDFA950];
    v9 = CFSTR("Invalid argument");
LABEL_11:
    objc_msgSend(v8, "throwException:", v9);
    return 0;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("media")) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("software")) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("ebooks")) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDFA950];
    v9 = CFSTR("Unknown queue type");
    goto LABEL_11;
  }
  -[SUScriptObject lock](self, "lock");
  downloadQueues = self->_downloadQueues;
  if (!downloadQueues)
  {
    downloadQueues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->_downloadQueues = downloadQueues;
  }
  v6 = (SUScriptDownloadQueue *)(id)-[NSMutableDictionary objectForKey:](downloadQueues, "objectForKey:", a3);
  -[SUScriptObject unlock](self, "unlock");
  if (!v6 || !-[SUScriptObject scriptObjectIsCheckedIn:](self, "scriptObjectIsCheckedIn:", v6))
  {
    v6 = -[SUScriptDownloadQueue initWithQueueType:clientInterface:]([SUScriptDownloadQueue alloc], "initWithQueueType:clientInterface:", a3, -[SUScriptInterface clientInterface](self, "clientInterface"));
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6);
    -[SUScriptObject lock](self, "lock");
    -[NSMutableDictionary setObject:forKey:](self->_downloadQueues, "setObject:forKey:", v6, a3);
    -[SUScriptObject unlock](self, "unlock");
    v7 = v6;
  }
  return v6;
}

- (void)composeEmailWithSubject:(id)a3 body:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  _QWORD v9[4];
  __CFString *v10;
  __CFString *v11;

  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = &stru_24DE83F60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = &stru_24DE83F60;
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__SUScriptInterface_SUNavigation__composeEmailWithSubject_body___block_invoke;
  v9[3] = &unk_24DE7B0F0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __64__SUScriptInterface_SUNavigation__composeEmailWithSubject_body___block_invoke(uint64_t a1)
{
  return +[SUClientDispatch composeEmailWithSubject:body:](SUClientDispatch, "composeEmailWithSubject:body:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)dismissWindowsWithOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BEB1E98];
  v4 = a3;
  objc_msgSend(v3, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (!v7)
    goto LABEL_9;
  *(_DWORD *)v12 = 138543618;
  *(_QWORD *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2082;
  *(_QWORD *)&v12[14] = "-[SUScriptInterface(SUNavigation) dismissWindowsWithOptions:]";
  v9 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, v12, v11, *(_OWORD *)v12, *(_QWORD *)&v12[16], v13);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog();
LABEL_9:

  }
  +[SUScriptWindow dismissWindowsWithOptions:](SUScriptWindow, "dismissWindowsWithOptions:", v4);

}

- (id)makeNavigationControllerWithRootViewController:(id)a3
{
  id v4;
  SUScriptNavigationController *v5;
  void *v6;
  SUScriptNavigationController *v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v7 = 0;
  }
  else
  {
    v5 = [SUScriptNavigationController alloc];
    -[SUScriptInterface clientInterface](self, "clientInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUScriptNavigationController initWithRootScriptViewController:clientInterface:](v5, "initWithRootScriptViewController:clientInterface:", v4, v6);

    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7);
  }

  return v7;
}

- (id)makeStorePageWithURLs:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  SUScriptStorePageViewController *v7;
  id v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v4 = 0;
  }
  v9 = 0;
  v5 = +[SUScriptStorePageViewController copyURLStrings:forValue:](SUScriptStorePageViewController, "copyURLStrings:forValue:", &v9, v4);
  v6 = v9;
  if (v5)
  {
    v7 = -[SUScriptStorePageViewController initWithURLStrings:]([SUScriptStorePageViewController alloc], "initWithURLStrings:", v6);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v7 = 0;
  }

  return v7;
}

- (void)openURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BEB1E98];
  v5 = a3;
  objc_msgSend(v4, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    v8 &= 2u;
  if (v8)
  {
    *(_DWORD *)v15 = 138543618;
    *(_QWORD *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2082;
    *(_QWORD *)&v15[14] = "-[SUScriptInterface(SUNavigation) openURL:]";
    v10 = *(id *)&v15[4];
    LODWORD(v14) = 22;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, v15, v14, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog();
  }

LABEL_10:
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);

  if (v12)
  {
    -[SUScriptInterface clientInterface](self, "clientInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SUOpenExternalURL((uint64_t)v12, v13);

  }
}

- (void)reloadFooterSection:(id)a3 withURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDFA950];
    v9 = CFSTR("Invalid section ID");
LABEL_11:
    objc_msgSend(v8, "throwException:", v9);
    goto LABEL_12;
  }
  if (!v6)
  {
    v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDFA950];
    v9 = CFSTR("Invalid url string");
    goto LABEL_11;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
LABEL_9:
  v11 = v5;
  v10 = v7;
  WebThreadRunOnMainThread();

LABEL_12:
}

void __63__SUScriptInterface_SUNavigation__reloadFooterSection_withURL___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSectionWithIdentifier:URL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)selectSectionWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    WebThreadRunOnMainThread();

  }
}

void __63__SUScriptInterface_SUNavigation__selectSectionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedIdentifier:", *(_QWORD *)(a1 + 40));

}

- (SUScriptSectionsController)sectionsController
{
  SUScriptSectionsController *v3;

  v3 = objc_alloc_init(SUScriptSectionsController);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (SUScriptViewController)viewController
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SUScriptInterface *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __49__SUScriptInterface_SUNavigation__viewController__block_invoke;
  v10 = &unk_24DE7B430;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __49__SUScriptInterface_SUNavigation__viewController__block_invoke, &unk_24DE7B430, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);

  return (SUScriptViewController *)v5;
}

void __49__SUScriptInterface_SUNavigation__viewController__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copyScriptViewController");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)dismissSheet
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_9;
  *(_DWORD *)v11 = 138543618;
  *(_QWORD *)&v11[4] = objc_opt_class();
  *(_WORD *)&v11[12] = 2082;
  *(_QWORD *)&v11[14] = "-[SUScriptInterface(SUNavigation) dismissSheet]";
  v7 = *(id *)&v11[4];
  LODWORD(v10) = 22;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, v11, v10, *(_OWORD *)v11, *(_QWORD *)&v11[16]);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_9:

  }
  -[SUScriptInterface viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissModalViewControllerAnimated:", 1);

}

- (void)goBack
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_9;
  *(_DWORD *)v12 = 138543618;
  *(_QWORD *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2082;
  *(_QWORD *)&v12[14] = "-[SUScriptInterface(SUNavigation) goBack]";
  v7 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, v12, v11, *(_OWORD *)v12, *(_QWORD *)&v12[16]);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_9:

  }
  -[SUScriptInterface viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "popViewControllerAnimated:", 1);
}

- (void)gotoStoreURL:(id)a3
{
  -[SUScriptInterface gotoStoreURL:ofType:withAuthentication:forceAuthentication:](self, "gotoStoreURL:ofType:withAuthentication:forceAuthentication:", a3, 0, 0, 0);
}

- (void)gotoStoreURL:(id)a3 ofType:(id)a4 withAuthentication:(BOOL)a5 forceAuthentication:(BOOL)a6
{
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  objc_msgSend(v9, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    v11 &= 2u;
  if (!v11)
    goto LABEL_9;
  v19 = 138543874;
  v20 = (id)objc_opt_class();
  v21 = 2082;
  v22 = "-[SUScriptInterface(SUNavigation) gotoStoreURL:ofType:withAuthentication:forceAuthentication:]";
  v23 = 2114;
  v24 = v7;
  v13 = v20;
  LODWORD(v16) = 32;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v19, v16);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_9:

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
      if (v15)
      {
        v17 = v8;
        v18 = v15;
        WebThreadRunOnMainThread();

      }
    }
  }

}

void __94__SUScriptInterface_SUNavigation__gotoStoreURL_ofType_withAuthentication_forceAuthentication___block_invoke(uint64_t a1)
{
  SUAccountViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  SUStorePageViewController *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "clientInterface");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("account")))
  {
    v2 = objc_alloc_init(SUAccountViewController);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", *(_QWORD *)(a1 + 48));
    -[SUViewController setClientInterface:](v2, "setClientInterface:", v13);
    -[SUStorePageViewController setURLRequestProperties:](v2, "setURLRequestProperties:", v3);
    +[SUClientDispatch enterAccountFlowWithViewController:animated:](SUClientDispatch, "enterAccountFlowWithViewController:animated:", v2, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "parentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewControllerFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = (SUStorePageViewController *)objc_msgSend(v4, "newStorePageViewControllerWithSection:", 0);
    else
      v6 = -[SUViewController initWithSection:]([SUStorePageViewController alloc], "initWithSection:", 0);
    v2 = (SUAccountViewController *)v6;
    -[SUViewController setClientInterface:](v6, "setClientInterface:", v13);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", *(_QWORD *)(a1 + 48));
    -[SUStorePageViewController setURLRequestProperties:](v2, "setURLRequestProperties:", v7);
    -[SUStorePageViewController setNeedsAuthentication:](v2, "setNeedsAuthentication:", *(unsigned __int8 *)(a1 + 56));
    v8 = objc_alloc(MEMORY[0x24BEB1F28]);
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithAccount:", v10);

    if (*(_BYTE *)(a1 + 57))
      objc_msgSend(v11, "setPromptStyle:", 1);
    -[SUStorePageViewController setAuthenticationContext:](v2, "setAuthenticationContext:", v11);
    objc_msgSend(v3, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v2, 1);

  }
}

- (void)pingURL:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3)) != 0)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_INFO))
      v8 &= 2u;
    if (v8)
    {
      v15 = 138412546;
      v16 = objc_opt_class();
      v17 = 2112;
      v18 = v5;
      LODWORD(v14) = 22;
      v13 = &v15;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v15, v14);
        free(v10);
        v13 = (int *)v11;
        SSFileLog();
      }
    }
    v12 = (void *)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue", v13);
    objc_msgSend(v12, "addOperation:", objc_msgSend(MEMORY[0x24BEC8C30], "pingOperationWithUrl:", v5));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)retryAllRestoreDownloads
{
  objc_msgSend(MEMORY[0x24BEB1E18], "retryAllRestoreDownloads");
}

- (SUScriptProtocol)protocol
{
  SUScriptProtocol *v3;

  v3 = objc_alloc_init(SUScriptProtocol);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (void)handleProtocolPropertyListString:(id)a3
{
  id v5;
  void *v6;

  v5 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v6 = (void *)SUScriptPropertyListFromString(a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count"))
  {
    -[SUScriptProtocol setValuesFromDictionary:](-[SUScriptInterface protocol](self, "protocol"), "setValuesFromDictionary:", v6);
    WebThreadRunOnMainThread();
  }

}

uint64_t __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  SUPageSectionGroup *v7;
  _QWORD v9[6];
  __int128 v10;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8C00]), "initWithPropertyList:", *(_QWORD *)(a1 + 40));
  v4 = objc_alloc_init(MEMORY[0x24BEC8C08]);
  objc_msgSend(v4, "setAuthenticationContext:", objc_msgSend(*(id *)(a1 + 32), "authenticationContext"));
  objc_msgSend(v4, "setShouldPostFooterSectionChanged:", 0);
  objc_msgSend(v4, "setShouldProcessDialogs:", 0);
  objc_msgSend(v3, "setDataProvider:", v4);

  v5 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", v2);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_2;
  v9[3] = &unk_24DE7BEF0;
  v9[4] = v3;
  v9[5] = v5;
  v10 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "setCompletionBlock:", v9);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v3);

  v6 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("tabs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(SUPageSectionGroup);
    -[SUPageSectionGroup loadFromDictionary:](v7, "loadFromDictionary:", v6);
    objc_msgSend(v2, "reloadForSectionsWithGroup:", v7);

  }
  objc_msgSend((id)objc_msgSend(v2, "storePageProtocol"), "setValuesFromStorePageDictionary:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(v2, "storePageProtocolDidChange");
}

uint64_t __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];
  _QWORD block[4];
  __int128 v9;
  uint64_t v10;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dataProvider"), "redirectURL");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_3;
    block[3] = &unk_24DE7B6E8;
    v9 = *(_OWORD *)(a1 + 40);
    v10 = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  v4 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x24BEC8C90]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_84;
    v7[3] = &unk_24DE7AFB8;
    v5 = *(_QWORD *)(a1 + 48);
    v7[4] = v4;
    v7[5] = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
}

void __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v5 &= 2u;
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 48);
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    LODWORD(v11) = 22;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v12, v11);
      free(v9);
      SSFileLog();
    }
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", objc_msgSend(*(id *)(a1 + 48), "schemeSwizzledURL"));
  objc_msgSend(v2, "reloadWithURLRequestProperties:", v10);

}

void __75__SUScriptInterface_SUProtocolAdditions__handleProtocolPropertyListString___block_invoke_84(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8B90]), "initWithDialogDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInterface"), "_presentDialog:", v2);

}

- (id)makeWindow
{
  SUScriptWindow *v3;

  v3 = objc_alloc_init(SUScriptWindow);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);

  return v3;
}

- (void)setWindow:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("window")));
}

- (SUScriptWindow)window
{
  SUScriptWindowContext *v3;
  SUScriptWindowContext *v4;
  NSMutableSet *scriptObjects;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  SUScriptWindow *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[SUScriptInterface scriptWindowContext](self, "scriptWindowContext");
  if (!v3)
    return (SUScriptWindow *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUScriptWindowContext tag](v4, "tag");
  -[SUScriptObject lock](self, "lock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  scriptObjects = self->super._scriptObjects;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](scriptObjects, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_6:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(scriptObjects);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "context");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(v10, "context"), "tag"))
            break;
        }
      }
      if (v7 == ++v9)
      {
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](scriptObjects, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_6;
        goto LABEL_14;
      }
    }
    v11 = v10;
    -[SUScriptObject unlock](self, "unlock");
    if (v11)
      return v11;
  }
  else
  {
LABEL_14:
    -[SUScriptObject unlock](self, "unlock");
  }
  v11 = -[SUScriptWindow initWithContext:]([SUScriptWindow alloc], "initWithContext:", v4);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v11);
  WebThreadRunOnMainThread();

  if (!v11)
    return (SUScriptWindow *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  return v11;
}

uint64_t __52__SUScriptInterface_SUScriptWindowAdditions__window__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisible:", objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0) != 0);
}

- (void)deallocCarrierBundlingController
{

}

- (SUScriptCarrierBundlingController)carrierBundlingController
{
  SUScriptCarrierBundlingController *carrierBundlingController;
  SUScriptCarrierBundlingController *v4;
  SUScriptCarrierBundlingController *v5;
  SUScriptCarrierBundlingController *v6;

  -[SUScriptObject lock](self, "lock");
  carrierBundlingController = self->_carrierBundlingController;
  v4 = carrierBundlingController;
  if (!carrierBundlingController)
  {
    v5 = objc_alloc_init(SUScriptCarrierBundlingController);
    self->_carrierBundlingController = v5;
    -[SUScriptObject setVisible:](v5, "setVisible:", 1);
    v4 = self->_carrierBundlingController;
  }
  v6 = v4;
  -[SUScriptObject unlock](self, "unlock");
  if (!carrierBundlingController)
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6);
  return v6;
}

- (void)setCarrierBundlingController:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("carrierBundling")));
}

- (id)makeNumberFormatterWithStyle:(id)a3
{
  SUScriptNumberFormatter *v4;

  v4 = objc_alloc_init(SUScriptNumberFormatter);
  -[SUScriptNumberFormatter setStyle:](v4, "setStyle:", a3);
  return v4;
}

- (id)makeSplitViewController
{
  SUScriptSplitViewController *v3;

  v3 = objc_alloc_init(SUScriptSplitViewController);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeMenuViewController
{
  SUScriptMenuViewController *v3;

  v3 = objc_alloc_init(SUScriptMenuViewController);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeCanvasWithWidth:(id)a3 height:(id)a4
{
  SUScriptCanvasContext *v6;
  float v7;
  double v8;
  float v9;
  SUScriptCanvasContext *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = [SUScriptCanvasContext alloc];
    objc_msgSend(a3, "floatValue");
    v8 = v7;
    objc_msgSend(a4, "floatValue");
    v10 = -[SUScriptCanvasContext initWithWidth:height:](v6, "initWithWidth:height:", v8, v9);
    if (v10)
      return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (id)makeColorWithHue:(id)a3 saturation:(id)a4 brightness:(id)a5 alpha:(id)a6
{
  SUScriptColor *v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_alloc_init(SUScriptColor);
    objc_msgSend(a3, "floatValue");
    v12 = v11;
    objc_msgSend(a4, "floatValue");
    v14 = v13;
    objc_msgSend(a5, "floatValue");
    v16 = v15;
    objc_msgSend(a6, "floatValue");
    -[SUScriptColor setHue:saturation:brightness:alpha:](v10, "setHue:saturation:brightness:alpha:", v12, v14, v16, v17);
    if (v10)
      return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (id)makeColorWithRed:(id)a3 green:(id)a4 blue:(id)a5 alpha:(id)a6
{
  SUScriptColor *v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_alloc_init(SUScriptColor);
    objc_msgSend(a3, "floatValue");
    v12 = v11;
    objc_msgSend(a4, "floatValue");
    v14 = v13;
    objc_msgSend(a5, "floatValue");
    v16 = v15;
    objc_msgSend(a6, "floatValue");
    -[SUScriptColor setRed:green:blue:alpha:](v10, "setRed:green:blue:alpha:", v12, v14, v16, v17);
    if (v10)
      return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (id)makeColorWithWhite:(id)a3 alpha:(id)a4
{
  SUScriptColor *v6;
  float v7;
  double v8;
  float v9;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_alloc_init(SUScriptColor);
    objc_msgSend(a3, "floatValue");
    v8 = v7;
    objc_msgSend(a4, "floatValue");
    -[SUScriptColor setWhite:alpha:](v6, "setWhite:alpha:", v8, v9);
    if (v6)
      return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (id)makeLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  return -[SUScriptGradient initLinearGradientWithX0:y0:x1:y1:]([SUScriptGradient alloc], "initLinearGradientWithX0:y0:x1:y1:", a3, a4, a5, a6);
}

- (id)makeRadialGradientWithX0:(double)a3 y0:(double)a4 r0:(double)a5 x1:(double)a6 y1:(double)a7 r1:(double)a8
{
  return -[SUScriptGradient initRadialGraidentWithX0:y0:r0:x1:y1:r1:]([SUScriptGradient alloc], "initRadialGraidentWithX0:y0:r0:x1:y1:r1:", a3, a4, a5, a6, a7, a8);
}

- (void)deallocMediaLibrary
{

}

- (SUScriptMediaLibrary)mediaLibrary
{
  SUScriptMediaLibrary *mediaLibrary;
  SUScriptMediaLibrary *v4;
  SUScriptMediaLibrary *v5;
  SUScriptMediaLibrary *v6;

  -[SUScriptObject lock](self, "lock");
  mediaLibrary = self->_mediaLibrary;
  v4 = mediaLibrary;
  if (!mediaLibrary)
  {
    v5 = objc_alloc_init(SUScriptMediaLibrary);
    self->_mediaLibrary = v5;
    -[SUScriptObject setVisible:](v5, "setVisible:", 1);
    v4 = self->_mediaLibrary;
  }
  v6 = v4;
  -[SUScriptObject unlock](self, "unlock");
  if (!mediaLibrary)
  {
    -[SUScriptMediaLibrary _connectNativeObject](v6, "_connectNativeObject");
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6);
  }
  return v6;
}

- (void)setMediaLibrary:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("mediaLibrary")));
}

- (void)addExternalDownloads:(id)a3 options:(id)a4
{
  OpaqueJSContext *v7;
  OpaqueJSContext *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v7 = -[SUScriptInterface copyJavaScriptContext](self, "copyJavaScriptContext");
    if (v7)
    {
      v8 = v7;
      -[SUPurchaseManager addExternalDownloads:withOptions:inContext:](-[SUClientInterface purchaseManager](-[SUScriptInterface clientInterface](self, "clientInterface"), "purchaseManager"), "addExternalDownloads:withOptions:inContext:", a3, a4, v7);
      JSGlobalContextRelease(v8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)addExternalDownloadsFromManifestURL:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3)) != 0)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v8 &= 2u;
    if (v8)
    {
      v14 = 138412546;
      v15 = objc_opt_class();
      v16 = 2112;
      v17 = v5;
      LODWORD(v13) = 22;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v14, v13);
        free(v10);
        SSFileLog();
      }
    }
    v11 = objc_alloc(MEMORY[0x24BEB1E28]);
    v12 = (void *)objc_msgSend(v11, "initWithURLRequest:", objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", v5));
    objc_msgSend(v12, "setManifestFormat:", 1);
    objc_msgSend(v12, "start");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)addPurchaseWithInfo:(id)a3 options:(id)a4
{
  OpaqueJSContext *v7;
  SUPurchaseManager *v8;
  SUScriptDictionary *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v7 = -[SUScriptInterface copyJavaScriptContext](self, "copyJavaScriptContext");
    v8 = -[SUClientInterface purchaseManager](-[SUScriptInterface clientInterface](self, "clientInterface"), "purchaseManager");
    -[SUPurchaseManager setAccountDSID:](v8, "setAccountDSID:", -[SSAuthenticationContext requiredUniqueIdentifier](-[SUScriptInterface authenticationContext](self, "authenticationContext"), "requiredUniqueIdentifier"));
    v9 = -[SUScriptInterface tidHeaders](self, "tidHeaders");
    if (-[NSDictionary count](-[SUScriptDictionary dictionary](v9, "dictionary"), "count"))
      -[SUPurchaseManager setTidHeaders:](v8, "setTidHeaders:", -[SUScriptDictionary dictionary](v9, "dictionary"));
    -[SUPurchaseManager purchaseScriptObject:withOptions:inContext:](v8, "purchaseScriptObject:withOptions:inContext:", a3, a4, v7);
    if (v7)
      JSGlobalContextRelease(v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)approveInPerson:(id)a3 completionFunction:(id)a4
{
  SUScriptFunction *v7;
  char isKindOfClass;
  SUScriptFunction *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  SUScriptDictionary *v13;
  SUScriptError *v14;
  _QWORD v15[6];
  _QWORD v16[2];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = 0;
    if (a4 && (isKindOfClass & 1) == 0)
      v7 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a4);
  }
  -[SUScriptFunction setThisObject:](v7, "setThisObject:", self);
  if (a3)
  {
    v9 = v7;
    v10 = (void *)ISWeakLinkedClassForString();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __77__SUScriptInterface_SUPurchaseAdditions__approveInPerson_completionFunction___block_invoke;
    v15[3] = &unk_24DE7CD90;
    v15[4] = v7;
    v15[5] = a3;
    objc_msgSend(v10, "localApproveRequestWithItemIdentifier:completion:", a3, v15);
  }
  else
  {
    v17 = CFSTR("status");
    v18[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v11 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 137, 0);
    v13 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v11);
    v14 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", v12);
    v16[0] = v13;
    v16[1] = v14;
    -[SUScriptFunction callWithArguments:](v7, "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2));
    -[SUScriptFunction setThisObject:](v7, "setThisObject:", 0);

  }
}

void __77__SUScriptInterface_SUPurchaseAdditions__approveInPerson_completionFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  SUScriptDictionary *v6;
  SUScriptError *v7;
  SUScriptError *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = &unk_24DEDC2C0;
    if (!a2)
      v4 = &unk_24DEDC2A8;
    v11[0] = CFSTR("status");
    v11[1] = CFSTR("adamID");
    v5 = *(_QWORD *)(a1 + 40);
    v12[0] = v4;
    v12[1] = v5;
    v6 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
    if (a2)
      v7 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a2);
    else
      v7 = (SUScriptError *)(id)objc_msgSend(MEMORY[0x24BDFA958], "undefined");
    v8 = v7;
    v9 = *(void **)(a1 + 32);
    v10[0] = v6;
    v10[1] = v7;
    objc_msgSend(v9, "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2));
    objc_msgSend(*(id *)(a1 + 32), "setThisObject:", 0);

  }
}

- (void)addExternalDownloads:(id)a3
{
  -[SUScriptInterface addExternalDownloads:options:](self, "addExternalDownloads:options:", a3, 0);
}

- (void)addPurchaseWithInfo:(id)a3
{
  -[SUScriptInterface addPurchaseWithInfo:options:](self, "addPurchaseWithInfo:options:", a3, 0);
}

- (id)makeReviewWithAdamID:(id)a3
{
  return objc_alloc_init(SUScriptReview);
}

- (id)makeComposeReviewViewControllerWithReview:(id)a3
{
  SUScriptComposeReviewViewController *v4;

  v4 = -[SUScriptComposeReviewViewController initWithScriptReview:clientInterface:]([SUScriptComposeReviewViewController alloc], "initWithScriptReview:clientInterface:", a3, -[SUScriptInterface clientInterface](self, "clientInterface"));
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v4);
  return v4;
}

- (void)composeReviewWithURL:(id)a3 itemIdentifier:(id)a4 type:(id)a5
{
  SUScriptReview *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  v6 = objc_alloc_init(SUScriptReview);
  -[SUScriptReview setInfoURL:](v6, "setInfoURL:", a3);
  if (a3)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));

}

void __108__SUScriptInterface_SUScriptComposeReviewViewControllerAdditions__composeReviewWithURL_itemIdentifier_type___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  SUComposeReviewViewController *v4;
  _QWORD v5[6];

  v2 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "clientInterface");
  v4 = (SUComposeReviewViewController *)objc_msgSend((id)objc_msgSend(v3, "viewControllerFactory"), "newComposeReviewViewControllerWithCompositionURL:", v2);
  if (!v4)
    v4 = -[SUComposeReviewViewController initWithCompositionURL:]([SUComposeReviewViewController alloc], "initWithCompositionURL:", v2);
  -[SUViewController setClientInterface:](v4, "setClientInterface:", v3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __108__SUScriptInterface_SUScriptComposeReviewViewControllerAdditions__composeReviewWithURL_itemIdentifier_type___block_invoke_2;
  v5[3] = &unk_24DE7CDB8;
  v5[4] = *(_QWORD *)(a1 + 40);
  v5[5] = v4;
  -[SUComposeReviewViewController prepareWithCompletionBlock:](v4, "prepareWithCompletionBlock:", v5);

}

uint64_t __108__SUScriptInterface_SUScriptComposeReviewViewControllerAdditions__composeReviewWithURL_itemIdentifier_type___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "parentViewController"), "presentViewController:animated:completion:", *(_QWORD *)(result + 40), 1, 0);
  return result;
}

- (SUScriptPassbookLibrary)passbookLibrary
{
  objc_class *v3;
  id v4;
  SUScriptPassbookLibrary *v5;

  v3 = (objc_class *)ISWeakLinkedClassForString();
  if (-[objc_class isPassLibraryAvailable](v3, "isPassLibraryAvailable"))
  {
    v4 = objc_alloc_init(v3);
    v5 = -[SUScriptPassbookLibrary initWithPassLibrary:]([SUScriptPassbookLibrary alloc], "initWithPassLibrary:", v4);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (SUScriptApplication)application
{
  SUScriptApplication *v3;

  v3 = objc_alloc_init(SUScriptApplication);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeVolumeViewController
{
  return objc_alloc_init(SUScriptVolumeViewController);
}

- (id)makeSegmentedControl
{
  SUScriptSegmentedControl *v3;

  v3 = objc_alloc_init(SUScriptSegmentedControl);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeURLRequestWithURLs:(id)a3 timeoutInterval:(id)a4
{
  SUScriptURLRequest *v6;
  char isKindOfClass;

  v6 = objc_alloc_init(SUScriptURLRequest);
  -[SUScriptURLRequest setURLs:](v6, "setURLs:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (a4)
    {
      if ((isKindOfClass & 1) == 0)
        -[SUScriptURLRequest setTimeoutInterval:](v6, "setTimeoutInterval:", a4);
    }
  }
  return v6;
}

- (id)makeReportAProblemViewControllerWithAdamID:(id)a3
{
  SUScriptReportAProblemViewController *v4;
  SUClientInterface *v5;
  SUScriptReportAProblemViewController *v6;

  v4 = (SUScriptReportAProblemViewController *)SSGetUnsignedLongLongFromValue();
  if (v4)
  {
    v5 = -[SUScriptInterface clientInterface](self, "clientInterface");
    v6 = [SUScriptReportAProblemViewController alloc];
    v4 = -[SUScriptReportAProblemViewController initWithAdamID:clientInterface:](v6, "initWithAdamID:clientInterface:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithItemIdentifier:", v4), v5);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return v4;
}

- (SUScriptDevice)device
{
  return objc_alloc_init(SUScriptDevice);
}

- (void)setDevice:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("device")));
}

- (id)makeAccountPageWithURLs:(id)a3
{
  SUScriptAccountPageViewController *v5;
  SUScriptAccountPageViewController *v6;
  uint64_t v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  v8 = 0;
  if (+[SUScriptStorePageViewController copyURLStrings:forValue:](SUScriptAccountPageViewController, "copyURLStrings:forValue:", &v8, a3))
  {
    v5 = [SUScriptAccountPageViewController alloc];
    v6 = -[SUScriptStorePageViewController initWithURLStrings:](v5, "initWithURLStrings:", v8);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v6 = 0;
  }
  return v6;
}

- (id)makeSubscriptionStatusRequest
{
  SUScriptSubscriptionStatusRequest *v3;

  v3 = objc_alloc_init(SUScriptSubscriptionStatusRequest);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (SUScriptTelephony)telephony
{
  SUScriptTelephony *v3;

  v3 = objc_alloc_init(SUScriptTelephony);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeDocumentInteractionController
{
  SUScriptDocumentInteractionController *v3;

  v3 = objc_alloc_init(SUScriptDocumentInteractionController);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeScriptActionWithType:(id)a3
{
  return -[SUScriptAction initWithActionType:]([SUScriptAction alloc], "initWithActionType:", a3);
}

- (NSString)actionTypeReturnToLibrary
{
  return (NSString *)CFSTR("SUScriptActionTypeReturnToLibrary");
}

- (NSString)actionTypeDismissWindows
{
  return (NSString *)CFSTR("SUScriptActionTypeDismissWindows");
}

- (NSString)actionTypeDismissSheet
{
  return (NSString *)CFSTR("SUScriptActionTypeDismissSheet");
}

- (id)makeDateFormatter
{
  return objc_alloc_init(SUScriptDateFormatter);
}

- (SUScriptPurchaseManager)purchaseManager
{
  SUScriptPurchaseManager *result;
  SUScriptPurchaseManager *v4;

  result = self->_purchaseManager;
  if (!result)
  {
    v4 = objc_alloc_init(SUScriptPurchaseManager);
    self->_purchaseManager = v4;
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v4);
    return self->_purchaseManager;
  }
  return result;
}

- (id)makeMediaPlayerItemWithProperties:(id)a3
{
  OpaqueJSContext *v5;
  OpaqueJSContext *v6;
  void *v7;
  SUScriptMediaPlayerItem *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  v5 = -[SUScriptInterface copyJavaScriptContext](self, "copyJavaScriptContext");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(a3, "copyArrayOrDictionaryWithContext:", v5);
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      v8 = 0;
    }
    else
    {
      v8 = -[SUScriptMediaPlayerItem initWithDictionary:]([SUScriptMediaPlayerItem alloc], "initWithDictionary:", v7);
    }

    JSGlobalContextRelease(v6);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)makeMediaPlayerViewControllerWithMediaPlayerItem:(id)a3
{
  SUScriptMediaPlayerViewController *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUScriptMediaPlayerViewController initWithMediaPlayerItem:]([SUScriptMediaPlayerViewController alloc], "initWithMediaPlayerItem:", a3);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
    -[UIViewController setClientInterface:](-[SUScriptViewController nativeViewController](v5, "nativeViewController"), "setClientInterface:", -[SUScriptObject clientInterface](v5, "clientInterface"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v5 = 0;
  }
  return v5;
}

- (void)showMediaPlayerWithURLString:(id)a3 orientation:(id)a4 title:(id)a5 subtitle:(id)a6 bookmarkID:(id)a7 duration:(id)a8 type:(id)a9 imageURL:(id)a10
{
  uint64_t v16;
  void *v17;
  SUMediaPlayerItem *v18;
  double v19;
  void *v20;
  uint64_t v21;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
    if (v16)
    {
      v17 = (void *)v16;
      v18 = objc_alloc_init(SUMediaPlayerItem);
      -[SUMediaPlayerItem setURL:](v18, "setURL:", v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a7, "length"))
        -[SUMediaPlayerItem setBookmarkIdentifier:](v18, "setBookmarkIdentifier:", a7);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a8, "doubleValue");
        -[SUMediaPlayerItem setPlayableDuration:](v18, "setPlayableDuration:", v19 / 1000.0);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a10);
        -[SUMediaPlayerItem setBackgroundImageURL:](v18, "setBackgroundImageURL:", v20);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SUMediaPlayerItem setSubtitle:](v18, "setSubtitle:", a6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SUMediaPlayerItem setTitle:](v18, "setTitle:", a5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SUMediaPlayerItem setItemType:](v18, "setItemType:", objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "itemTypeForTypeString:", a9));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a4, "isEqualToString:", CFSTR("landscape")) & 1) != 0)
        v21 = 3;
      else
        v21 = 1;
      -[SUMediaPlayerItem setInitialOrientation:](v18, "setInitialOrientation:", v21);
      WebThreadRunOnMainThread();

    }
  }
}

void __149__SUScriptInterface_SUMediaPlayerViewControllerAdditions__showMediaPlayerWithURLString_orientation_title_subtitle_bookmarkID_duration_type_imageURL___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  SUMediaPlayerViewController *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parentViewController"), "presentedViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v4 &= 2u;
    if (v4)
    {
      v9 = 138412290;
      v10 = objc_opt_class();
      LODWORD(v7) = 12;
      v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        v6 = (void *)v5;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4, &v9, v7);
        free(v6);
        SSFileLog();
      }
    }
  }
  else
  {
    v8 = -[SUMediaPlayerViewController initWithMediaPlayerItem:]([SUMediaPlayerViewController alloc], "initWithMediaPlayerItem:", *(_QWORD *)(a1 + 40));
    -[SUMediaPlayerViewController setClientInterface:](v8, "setClientInterface:", objc_msgSend(*(id *)(a1 + 32), "clientInterface"));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parentViewController"), "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)showMediaPreviewWithURLString:(id)a3
{
  -[SUScriptInterface showMediaPlayerWithURLString:orientation:title:subtitle:bookmarkID:duration:type:imageURL:](self, "showMediaPlayerWithURLString:orientation:title:subtitle:bookmarkID:duration:type:imageURL:", a3, 0, 0, 0, 0, 0, 0, 0);
}

- (void)deallocMetricsController
{

}

- (SUScriptMetricsController)metricsController
{
  SUScriptMetricsController *metricsController;
  SUScriptMetricsController *v4;
  SUScriptMetricsController *v5;
  SUScriptMetricsController *v6;

  -[SUScriptObject lock](self, "lock");
  metricsController = self->_metricsController;
  v4 = metricsController;
  if (!metricsController)
  {
    v5 = objc_alloc_init(SUScriptMetricsController);
    self->_metricsController = v5;
    -[SUScriptObject setVisible:](v5, "setVisible:", 1);
    v4 = self->_metricsController;
  }
  v6 = v4;
  -[SUScriptObject unlock](self, "unlock");
  if (!metricsController)
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6);
  return v6;
}

- (void)setMetricsController:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("metricsController")));
}

- (id)activeAudioPlayers
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  WebThreadRunOnMainThread();
  if (objc_msgSend(v3, "count"))
    -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v3);
  return v3;
}

uint64_t __60__SUScriptInterface_SUScriptAudioPlayer__activeAudioPlayers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SUScriptAudioPlayer *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "allSessionURLs");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = -[SUScriptAudioPlayer initWithURL:keyURL:certificateURL:]([SUScriptAudioPlayer alloc], "initWithURL:keyURL:certificateURL:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), 0, 0);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)getAudioPlayerForURL:(id)a3 keyURL:(id)a4 certificateURL:(id)a5
{
  void *v9;
  void *v10;
  SUScriptAudioPlayer *v11;
  void *v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a4);
    else
      v10 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a5);
    else
      v12 = 0;
    v11 = -[SUScriptAudioPlayer initWithURL:keyURL:certificateURL:]([SUScriptAudioPlayer alloc], "initWithURL:keyURL:certificateURL:", v9, v10, v12);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v11 = 0;
  }
  return v11;
}

- (id)makeActivityViewControllerWithProviders:(id)a3 activities:(id)a4
{
  void *v7;
  void *v8;
  SUScriptActivityViewController *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v7 = (void *)objc_msgSend(a4, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
    v8 = (void *)objc_msgSend(a3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
    v9 = -[SUScriptActivityViewController initWithScriptItemProviders:applicationActivities:]([SUScriptActivityViewController alloc], "initWithScriptItemProviders:applicationActivities:", v8, v7);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v9 = 0;
  }
  return v9;
}

- (id)makeFacebookRequestWithURL:(id)a3 requestMethod:(id)a4
{
  void *v7;
  SUScriptFacebookRequest *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
    v8 = -[SUScriptFacebookRequest initWithURL:requestMethod:]([SUScriptFacebookRequest alloc], "initWithURL:requestMethod:", v7, a4);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v8 = 0;
  }
  return v8;
}

- (id)makeActivity
{
  SUScriptActivity *v3;

  v3 = objc_alloc_init(SUScriptActivity);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (SUScriptAppleAccountStore)appleAccountStore
{
  SUScriptAppleAccountStore *v3;

  v3 = objc_alloc_init(SUScriptAppleAccountStore);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeActivityItemProviderWithMIMEType:(id)a3
{
  SUScriptActivityItemProvider *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUScriptActivityItemProvider initWithMIMEType:]([SUScriptActivityItemProvider alloc], "initWithMIMEType:", a3);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v5 = 0;
  }
  return v5;
}

- (id)makeLookupRequest
{
  SUScriptLookupRequest *v3;

  v3 = objc_alloc_init(SUScriptLookupRequest);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeFacebookSessionWithAccount:(id)a3
{
  id v5;
  char isKindOfClass;
  SUScriptFacebookSession *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          v7 = 0;
          return v7;
        }
      }
    }
  }
  v7 = -[SUScriptFacebookSession initWithAppleAccount:]([SUScriptFacebookSession alloc], "initWithAppleAccount:", v5);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7);
  return v7;
}

- (id)makeCalloutView
{
  SUScriptCalloutView *v3;

  v3 = objc_alloc_init(SUScriptCalloutView);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (SUScriptFairPlayContext)accountCreationSecureContext
{
  SUScriptFairPlayContext *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__54;
  v8 = __Block_byref_object_dispose__54;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (SUScriptFairPlayContext *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __83__SUScriptInterface_SUScriptFairPlayContextAdditions__accountCreationSecureContext__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(SUScriptFairPlayContext);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isOpen"))
  {
    objc_msgSend(*(id *)(a1 + 32), "checkInScriptObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  else
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  }
}

- (id)makeGiftViewController
{
  SUScriptGiftViewController *v3;

  v3 = objc_alloc_init(SUScriptGiftViewController);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeAMSViewController
{
  void *v3;
  SUScriptAMSViewController *v4;

  -[SUScriptInterface primaryAccount](self, "primaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SUScriptAMSViewController initWithPrimaryAccount:]([SUScriptAMSViewController alloc], "initWithPrimaryAccount:", v3);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v4);

  return v4;
}

- (id)makeRedeemViewController
{
  SUScriptRedeemViewController *v3;

  v3 = objc_alloc_init(SUScriptRedeemViewController);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

- (id)makeDonationViewControllerWithCharityIdentifier:(id)a3
{
  SUScriptDonationViewController *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  v5 = -[SUScriptDonationViewController initWithCharityIdentifier:]([SUScriptDonationViewController alloc], "initWithCharityIdentifier:", a3);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
  return v5;
}

- (id)makeStoreSheetViewController
{
  SUScriptStoreSheetViewController *v3;

  v3 = objc_alloc_init(SUScriptStoreSheetViewController);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  return v3;
}

@end
