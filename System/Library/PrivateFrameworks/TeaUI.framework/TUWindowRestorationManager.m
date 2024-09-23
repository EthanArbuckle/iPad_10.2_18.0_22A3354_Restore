@implementation TUWindowRestorationManager

- (TUWindowRestorationManager)initWithPluginBundleName:(id)a3 windowFrameName:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUWindowRestorationManager *v11;
  os_log_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *appKitWindow;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TUWindowRestorationManager;
  v11 = -[TUWindowRestorationManager init](&v25, sel_init);
  if (v11)
  {
    v12 = os_log_create("com.apple.teaui.windowrestoration", "Window Restoration");
    v13 = (void *)WindowRestorationLog;
    WindowRestorationLog = (uint64_t)v12;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "builtInPlugInsPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("/%@"), v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v17, "fileExistsAtPath:", v16);

    if ((_DWORD)v15)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v16);
      objc_msgSend(v18, "load");
      v19 = objc_alloc_init((Class)objc_msgSend(v18, "principalClass"));
      appKitWindow = v11->_appKitWindow;
      v11->_appKitWindow = v19;

      objc_storeStrong((id *)&v11->_windowFrameName, a4);
      objc_storeWeak((id *)&v11->_delegate, v10);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:selector:name:object:", v11, sel_windowSceneDidBecomeVisible, CFSTR("_UIWindowSceneDidBecomeVisibleNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:selector:name:object:", v11, sel_didFinishRestoringWindows, CFSTR("TUDidFinishRestoringWindowsNotification"), 0);

    }
    else
    {
      v23 = WindowRestorationLog;
      if (os_log_type_enabled((os_log_t)WindowRestorationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v16;
        _os_log_impl(&dword_1B139E000, v23, OS_LOG_TYPE_DEFAULT, "Failed to load plugin bundle at path=%@ in window restoration manager", buf, 0xCu);
      }
    }

  }
  return v11;
}

- (void)windowSceneDidBecomeVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[TUWindowRestorationManager application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "shouldChangeWindowFrameSize"))
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "connectedScenes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count") == 1;

    }
    else
    {
      v7 = 0;
    }
    v8 = WindowRestorationLog;
    if (os_log_type_enabled((os_log_t)WindowRestorationLog, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v7;
      _os_log_impl(&dword_1B139E000, v8, OS_LOG_TYPE_DEFAULT, "Window scene did become visible, changeFrame=%hhd", (uint8_t *)v12, 8u);
    }
    -[TUWindowRestorationManager windowFrameName](self, "windowFrameName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUWindowRestorationManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowRestorationManagerWindowForRestoration:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUWindowRestorationManager setFrameName:forWindow:changeFrame:](self, "setFrameName:forWindow:changeFrame:", v9, v11, v7);

    if (v7)
      objc_msgSend(v4, "setShouldChangeWindowFrameSize:", 0);
  }

}

- (void)didFinishRestoringWindows
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  -[TUWindowRestorationManager application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WindowRestorationLog;
  if (os_log_type_enabled((os_log_t)WindowRestorationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B139E000, v4, OS_LOG_TYPE_DEFAULT, "AppKit did finish restoring windows", v11, 2u);
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectedScenes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 1;

    -[TUWindowRestorationManager windowFrameName](self, "windowFrameName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUWindowRestorationManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowRestorationManagerWindowForRestoration:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUWindowRestorationManager setFrameName:forWindow:changeFrame:](self, "setFrameName:forWindow:changeFrame:", v8, v10, v7);

    objc_msgSend(v3, "setShouldChangeWindowFrameSize:", 0);
  }

}

- (void)setFrameName:(id)a3 forWindow:(id)a4 changeFrame:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  -[TUWindowRestorationManager appKitWindow](self, "appKitWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[TUWindowRestorationManager appKitWindow](self, "appKitWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrameName:forWindow:changeFrame:", v12, v8, v5);

  }
}

- (id)application
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToProtocol:", &unk_1EEFC11B8);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (TUWindowRestorationManagerDelegate)delegate
{
  return (TUWindowRestorationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSObject)appKitWindow
{
  return self->_appKitWindow;
}

- (NSString)windowFrameName
{
  return self->_windowFrameName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowFrameName, 0);
  objc_storeStrong((id *)&self->_appKitWindow, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
