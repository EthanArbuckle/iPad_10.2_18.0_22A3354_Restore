@implementation SUApplication

- (SUApplication)init
{
  SUApplication *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUApplication;
  v2 = -[SUApplication init](&v4, sel_init);
  if (v2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__storeEnabledChangeNotification_, CFSTR("SUStoreEnabledChangedNotification"), 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SUStoreEnabledChangedNotification"), 0);
  -[SUApplication _teardownUI](self, "_teardownUI");

  v3.receiver = self;
  v3.super_class = (Class)SUApplication;
  -[SUApplication dealloc](&v3, sel_dealloc);
}

- (void)setInteractionTintColor:(id)a3
{
  UIColor *v4;

  if (self->_interactionTintColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    self->_interactionTintColor = v4;
    -[UIWindow setInteractionTintColor:](self->_window, "setInteractionTintColor:", v4);
  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  -[SUApplication _applicationDidFinishLaunching:](self, "_applicationDidFinishLaunching:", a3, a4);
  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 sourceApplication:(id)a5 annotation:(id)a6
{
  void *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v9 = (void *)objc_msgSend(a6, "objectForKey:", *MEMORY[0x24BDC14F8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v9, "absoluteString");
      return objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "openClientURL:withSourceApplication:sourceURLString:", a4, a5, v9);
    }
LABEL_5:
    v9 = 0;
  }
  return objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "openClientURL:withSourceApplication:sourceURLString:", a4, a5, v9);
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3, a4), "userInterfaceIdiom"))
    return 30;
  else
    return 26;
}

- (void)applicationDidEnterBackground:(id)a3
{
  objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController", a3), "resignActive");
  if (self->_terminateOnNextSuspend)
  {
    self->_terminateOnNextSuspend = 0;
    -[SUApplication terminateWithSuccess](self, "terminateWithSuccess");
  }
}

- (BOOL)applicationSuspendWithSettings:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "copySuspendSettings");
  objc_msgSend(a3, "addEntriesFromDictionary:", v4);

  return 1;
}

- (void)applicationWillEnterForeground:(id)a3
{
  -[SUApplication _setupUI](self, "_setupUI", a3);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "launchedToTest") & 1) == 0)
    objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "becomeActive");
  -[SUApplication _exitIfStoreNotAvailable](self, "_exitIfStoreNotAvailable");
}

- (double)defaultImageSnapshotExpiration
{
  double result;

  objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "defaultImageSnapshotExpiration");
  return result;
}

- (void)_applicationDidFinishLaunching:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  CFAbsoluteTime Current;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (v7)
  {
    v13 = 138412546;
    v14 = objc_opt_class();
    v15 = 2048;
    Current = CFAbsoluteTimeGetCurrent();
    LODWORD(v12) = 22;
    v11 = &v13;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v13, v12);
      free(v9);
      v11 = (int *)v10;
      SSFileLog();
    }
  }
  -[SUApplication _setupUI](self, "_setupUI", v11);
  if ((objc_msgSend(a3, "launchedToTest") & 1) == 0)
    objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "becomeActive");
}

- (void)_exitForStoreNotAvailable
{
  id v3;
  SULockoutViewController *v4;
  SUNavigationController *v5;
  SUDialogManager *v6;

  v3 = +[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController");
  objc_msgSend(v3, "cancelAllOperations");
  v4 = objc_alloc_init(SULockoutViewController);
  -[SUViewController setClientInterface:](v4, "setClientInterface:", objc_msgSend(v3, "clientInterface"));
  v5 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v4);
  -[SUNavigationController setClientInterface:](v5, "setClientInterface:", objc_msgSend(v3, "clientInterface"));
  objc_msgSend((id)objc_msgSend(v3, "tabBarController"), "setTransientViewController:animated:", v5, 0);

  self->_terminateOnNextSuspend = 1;
  v6 = +[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance");
  -[SUDialogManager presentDialog:](v6, "presentDialog:", objc_msgSend(MEMORY[0x24BEC8B90], "ITunesStoreNotAvailableDialog"));
  objc_msgSend(v3, "exitStoreAfterDialogsDismiss");
}

- (void)_exitIfStoreNotAvailable
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
  if (objc_msgSend(v3, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0)))
  {
    if ((objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "isStoreEnabled") & 1) == 0)-[SUApplication _exitForStoreNotAvailable](self, "_exitForStoreNotAvailable");
  }
}

- (void)_setupUI
{
  UIWindow *window;
  id v4;
  UIWindow *v5;

  window = self->_window;
  if (!window)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6FF8]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    v5 = (UIWindow *)objc_msgSend(v4, "initWithFrame:");
    self->_window = v5;
    -[UIWindow setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[UIWindow setInteractionTintColor:](self->_window, "setInteractionTintColor:", self->_interactionTintColor);
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", objc_msgSend(+[SUClientApplicationController sharedController](SUClientApplicationController, "sharedController"), "tabBarController"));
    window = self->_window;
  }
  -[UIWindow makeKeyAndVisible](window, "makeKeyAndVisible");
}

- (void)_teardownUI
{
  -[UIWindow setHidden:](self->_window, "setHidden:", 1);

  self->_window = 0;
}

- (UIColor)interactionTintColor
{
  return self->_interactionTintColor;
}

- (void)runTestInvocation:(id)a3
{
  char v5;

  -[SUApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v5 = 0;
  objc_msgSend(a3, "invoke");
  objc_msgSend(a3, "getReturnValue:", &v5);
  if (v5)
    -[UIApplication endCurrentPPT](self, "endCurrentPPT");
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  id v13;

  v13 = a4;
  v7 = objc_msgSend(a4, "setupSelector");
  v8 = objc_msgSend(a4, "testSelector");
  if (v7 | v8)
  {
    v9 = v8;
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0 || v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIApplication beginPPTWithName:](self, "beginPPTWithName:", a3);
      v10 = (void *)objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", -[SUApplication methodSignatureForSelector:](self, "methodSignatureForSelector:", v9));
      objc_msgSend(v10, "setSelector:", v9);
      objc_msgSend(v10, "setTarget:", self);
      objc_msgSend(v10, "setArgument:atIndex:", &v13, 2);
      objc_msgSend(v10, "retainArguments");
      if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SUApplication performSelector:withObject:](self, "performSelector:withObject:", v7, v13);
        -[SUApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_runTestInvocation_, v10, 1.0);
      }
      else
      {
        -[SUApplication runTestInvocation:](self, "runTestInvocation:", v10);
      }
      return 1;
    }
LABEL_12:
    v12.receiver = self;
    v12.super_class = (Class)SUApplication;
    return -[SUApplication runTest:options:](&v12, sel_runTest_options_, a3, a4);
  }
  if (!objc_msgSend(a4, "scriptPath") || !objc_msgSend(a4, "scriptEntry"))
    goto LABEL_12;
  -[SUApplication _runScriptTestWithOptions:](self, "_runScriptTestWithOptions:", a4);
  return 1;
}

- (void)_runScriptTestWithOptions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = +[SUClientDispatch scriptExecutionContext](SUClientDispatch, "scriptExecutionContext");
  v5 = (id)_runScriptTestWithOptions__scriptsLoaded;
  if (!_runScriptTestWithOptions__scriptsLoaded)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    _runScriptTestWithOptions__scriptsLoaded = (uint64_t)v5;
  }
  if (!objc_msgSend(v5, "member:", objc_msgSend(a3, "scriptPath")))
  {
    v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundlePath"), "stringByAppendingPathComponent:", objc_msgSend(a3, "scriptPath"));
    objc_msgSend(v4, "evaluateData:MIMEType:textEncodingName:baseURL:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v6, 1, 0), CFSTR("text/javascript"), 0, 0);
    objc_msgSend((id)_runScriptTestWithOptions__scriptsLoaded, "addObject:", objc_msgSend(a3, "scriptPath"));
  }
  WebThreadRun();
}

void __50__SUApplication_SUPPT___runScriptTestWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  SUScriptDictionary *v4;

  v4 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", *(_QWORD *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "scriptEntry");
  objc_msgSend(v2, "callWebScriptMethod:withArguments:", v3, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4));

}

@end
