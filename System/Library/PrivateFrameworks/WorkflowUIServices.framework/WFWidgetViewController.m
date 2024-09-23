@implementation WFWidgetViewController

- (WFWidgetViewController)initWithOptions:(id)a3
{
  id v5;
  WFWidgetViewController *v6;
  WFWidgetViewController *v7;
  os_log_t v8;
  OS_os_log *log;
  uint64_t v10;
  WFWidgetCache *cache;
  int HasBeenUnlocked;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  WFWidgetViewController *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  WFWidgetViewController *v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  WFWidgetViewController *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)WFWidgetViewController;
  v6 = -[WFWidgetViewController initWithNibName:bundle:](&v35, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v8 = os_log_create("com.apple.shortcuts", "Widget");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    +[WFWidgetCache sharedCache](WFWidgetCache, "sharedCache");
    v10 = objc_claimAutoreleasedReturnValue();
    cache = v7->_cache;
    v7->_cache = (WFWidgetCache *)v10;

    v7->_widgetType = -[WFWidgetViewController widgetTypeFromOptions:](v7, "widgetTypeFromOptions:", v5);
    HasBeenUnlocked = VCDeviceHasBeenUnlocked();
    v13 = v7->_log;
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (HasBeenUnlocked)
    {
      if (v14)
      {
        v15 = v13;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v37 = v7;
        v38 = 2112;
        v39 = v17;
        _os_log_impl(&dword_20CE0F000, v15, OS_LOG_TYPE_DEFAULT, "<%p %@> Device has been unlocked at least once, refreshing", buf, 0x16u);

      }
      -[WFWidgetViewController refreshWorkflows](v7, "refreshWorkflows");
    }
    else
    {
      if (v14)
      {
        v18 = v13;
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v37 = v7;
        v38 = 2112;
        v39 = v20;
        _os_log_impl(&dword_20CE0F000, v18, OS_LOG_TYPE_DEFAULT, "<%p %@> Device has not unlocked before, listening for first unlock", buf, 0x16u);

      }
      objc_initWeak((id *)buf, v7);
      v21 = MEMORY[0x24BDAC9B8];
      v29 = MEMORY[0x24BDAC760];
      v30 = 3221225472;
      v31 = __42__WFWidgetViewController_initWithOptions___block_invoke;
      v32 = &unk_24C5AB590;
      v33 = v7;
      objc_copyWeak(&v34, (id *)buf);
      VCPerformOnFirstUnlock();

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
    -[WFWidgetViewController startObservingContentSizeCategoryNotifications](v7, "startObservingContentSizeCategoryNotifications", v29, v30, v31, v32);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v7, sel_handleUpdateFromCache_, CFSTR("WFWidgetCacheUpdateNotification"), 0);

    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "previewMetricsSpecificationForBundleIdentifier:", *MEMORY[0x24BEC17D8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "metricsForFamily:", objc_msgSend(v5, "family"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_effectiveCornerRadius");
    v7->_cornerRadius = v26;

    v27 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFWidgetViewController stopObservingContentSizeCategoryNotifications](self, "stopObservingContentSizeCategoryNotifications");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WFWidgetCacheUpdateNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)WFWidgetViewController;
  -[WFWidgetViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  WFWidgetGridView *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  double v7;
  double v8;
  void *v9;
  WFWidgetGridView *v10;
  void *v11;
  void *v12;
  WFWidgetGridView *gridView;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)WFWidgetViewController;
  -[WFWidgetViewController loadView](&v23, sel_loadView);
  v3 = [WFWidgetGridView alloc];
  -[WFWidgetViewController options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "family");
  v6 = -[WFWidgetViewController widgetType](self, "widgetType");
  -[WFWidgetViewController cornerRadius](self, "cornerRadius");
  v8 = v7;
  -[WFWidgetViewController log](self, "log");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFWidgetGridView initWithFamily:widgetType:cornerRadius:log:](v3, "initWithFamily:widgetType:cornerRadius:log:", v5, v6, v9, v8);

  -[WFWidgetGridView setDelegate:](v10, "setDelegate:", self);
  -[WFWidgetGridView setClipsToBounds:](v10, "setClipsToBounds:", 1);
  -[WFWidgetViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  -[WFWidgetGridView setFrame:](v10, "setFrame:");

  -[WFWidgetGridView setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
  -[WFWidgetViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v10);

  -[WFWidgetGridView tintWithHomeScreenTintColor:](v10, "tintWithHomeScreenTintColor:", self->_homeScreenTintColor);
  gridView = self->_gridView;
  self->_gridView = v10;

  -[WFWidgetViewController cornerRadius](self, "cornerRadius");
  v15 = v14;
  -[WFWidgetViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v15);

  v18 = *MEMORY[0x24BDE58E8];
  -[WFWidgetViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCornerCurve:", v18);

  -[WFWidgetViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMasksToBounds:", 1);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFWidgetViewController;
  -[WFWidgetViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[WFWidgetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[WFWidgetViewController gridView](self, "gridView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWidgetViewController;
  -[WFWidgetViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WFWidgetViewController restoreRunningStateIfNecessary](self, "restoreRunningStateIfNecessary");
}

- (int64_t)widgetTypeFromOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  void *v9;
  int v10;

  v3 = a3;
  objc_msgSend(v3, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("sirikit.intents.custom.com.apple.WorkflowKit.ShortcutsIntents.WFShortcutsSmallWidgetConfigurationIntent"));

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "typeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("sirikit.intents.custom.com.apple.WorkflowKit.ShortcutsIntents.WFShortcutsWidgetConfigurationIntent"));

    if (v10)
      v7 = 2;
    else
      v7 = 0;
  }

  return v7;
}

- (void)layoutWithWorkflows:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[WFWidgetViewController setNeedsLayout:](self, "setNeedsLayout:", 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__WFWidgetViewController_layoutWithWorkflows___block_invoke;
  v6[3] = &unk_24C5ABBB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)refreshWorkflows
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  WFWidgetViewController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[WFWidgetViewController log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v19 = self;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_20CE0F000, v3, OS_LOG_TYPE_DEFAULT, "<%p %@> Refreshing workflows", buf, 0x16u);

  }
  -[WFWidgetViewController options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetViewController workflowOrFolderIdentifierFromOptions:](self, "workflowOrFolderIdentifierFromOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWidgetViewController options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFWidgetViewController limitFromOptions:](self, "limitFromOptions:", v8);

  if (v7)
  {
    if (-[WFWidgetViewController widgetType](self, "widgetType") == 1
      && (-[WFWidgetViewController options](self, "options"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "family"),
          v10,
          v11 == 1))
    {
      -[WFWidgetViewController cache](self, "cache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "widgetWorkflowWithIdentifier:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWidgetViewController layoutWithWorkflows:](self, "layoutWithWorkflows:", v14);

    }
    else
    {
      -[WFWidgetViewController cache](self, "cache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "widgetWorkflowsInCollectionWithIdentifier:limit:", v7, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        -[WFWidgetViewController layoutWithWorkflows:](self, "layoutWithWorkflows:", v16);

    }
  }
  else
  {
    -[WFWidgetViewController log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CE0F000, v17, OS_LOG_TYPE_DEFAULT, "No identifier found for widget", buf, 2u);
    }

    -[WFWidgetViewController layoutWithWorkflows:](self, "layoutWithWorkflows:", 0);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)workflowOrFolderIdentifierFromOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v4 = a3;
  if (-[WFWidgetViewController widgetType](self, "widgetType") != 2)
  {
    if (-[WFWidgetViewController widgetType](self, "widgetType") != 1)
    {
      v8 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v4, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("shortcut"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(v4, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("folder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_msgSend(v6, "identifier"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
LABEL_7:
    objc_msgSend(v6, "identifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v8 = CFSTR("MyShortcuts");
LABEL_8:

LABEL_10:
  return v8;
}

- (unint64_t)limitFromOptions:(id)a3
{
  uint64_t v4;
  unint64_t result;

  v4 = objc_msgSend(a3, "family") - 1;
  result = 4;
  switch(v4)
  {
    case 0:
      if (-[WFWidgetViewController widgetType](self, "widgetType") == 2)
        result = 2;
      else
        result = 1;
      break;
    case 1:
      return result;
    case 2:
      result = 8;
      break;
    default:
      result = 16;
      break;
  }
  return result;
}

- (void)handleUpdateFromCache:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFWidgetViewController options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetViewController workflowOrFolderIdentifierFromOptions:](self, "workflowOrFolderIdentifierFromOptions:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("WFWidgetCacheAssociatedIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if ((-[NSObject isEqualToString:](v6, "isEqualToString:", v10) & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    -[WFWidgetViewController log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_20CE0F000, v14, OS_LOG_TYPE_DEFAULT, "Updating widget with workflows from notification: %@", (uint8_t *)&v16, 0xCu);
    }

    if (-[WFWidgetViewController running](self, "running"))
    {
      -[WFWidgetViewController log](self, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_20CE0F000, v15, OS_LOG_TYPE_DEFAULT, "Observable result change came in while we were running, deferring layout until we're done running", (uint8_t *)&v16, 2u);
      }

      -[WFWidgetViewController setNeedsLayout:](self, "setNeedsLayout:", 1);
    }
    else
    {
      -[WFWidgetViewController layoutWithWorkflows:](self, "layoutWithWorkflows:", v13);
    }
  }
  else
  {
    -[WFWidgetViewController log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_20CE0F000, v13, OS_LOG_TYPE_INFO, "Ignoring notification, mismatched identifiers (ours: %@, theirs: %@)", (uint8_t *)&v16, 0x16u);
    }
  }

}

- (void)showRunningUIForCell:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WFWidgetViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__WFWidgetViewController_showRunningUIForCell___block_invoke;
  v6[3] = &unk_24C5ABBB0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)stopRunningWithCell:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WFWidgetViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__WFWidgetViewController_stopRunningWithCell___block_invoke;
  v6[3] = &unk_24C5ABBB0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)resumeRunningWithCell:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WFWidgetViewController_resumeRunningWithCell___block_invoke;
  block[3] = &unk_24C5ABB88;
  v6 = v4;
  v13 = v6;
  v7 = MEMORY[0x24BDAC9B8];
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v8 = dispatch_time(0, 300000000);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __48__WFWidgetViewController_resumeRunningWithCell___block_invoke_2;
  v10[3] = &unk_24C5ABBB0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_after(v8, v7, v10);

}

- (void)removeStaleRunningContexts
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend((id)objc_opt_class(), "runningStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "creationDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "components:fromDate:toDate:options:", 16, v10, v2, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "day") >= 7)
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v6, "addObject:", v9);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
        objc_msgSend((id)objc_opt_class(), "runningStates");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

}

- (void)restoreRunningStateIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    -[WFWidgetViewController removeStaleRunningContexts](self, "removeStaleRunningContexts");
    objc_msgSend((id)objc_opt_class(), "runningStates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetViewController gridView](self, "gridView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workflowIdentifiersForVisibleCells");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v3;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "workflowIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v5, "containsObject:", v12);

          if (v13)
          {
            -[WFWidgetViewController gridView](self, "gridView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "workflowIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "cellForWorkflowWithIdentifier:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v16, "runningState") == 1 || objc_msgSend(v16, "runningState") == 2)
            {

              goto LABEL_17;
            }
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __56__WFWidgetViewController_restoreRunningStateIfNecessary__block_invoke;
            block[3] = &unk_24C5ABB88;
            v22 = v16;
            v17 = v16;
            dispatch_async(MEMORY[0x24BDAC9B8], block);
            -[WFWidgetViewController publishingHandlerForCell:](self, "publishingHandlerForCell:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addProgressSubscriberUsingPublishingHandler:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)objc_opt_class(), "progressSubscribers");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKey:", v19, v11);

          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else
  {
    -[WFWidgetViewController log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_20CE0F000, v6, OS_LOG_TYPE_FAULT, "restoreRunningStateIfNecessary must be called on the main thread", buf, 2u);
    }
  }

}

- (id)publishingHandlerForCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  WFWidgetViewController *v11;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__WFWidgetViewController_publishingHandlerForCell___block_invoke;
  v9[3] = &unk_24C5AB5B8;
  v10 = v4;
  v11 = self;
  v5 = v4;
  v6 = _Block_copy(v9);
  v7 = _Block_copy(v6);

  return v7;
}

- (id)runningContextForWorkflowIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "runningStates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "workflowIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)tintWithHomeScreenTintColor:(CGColor *)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  WFColor *v12;
  WFColor *homeScreenTintColor;
  WFColor *v14;
  void *v15;
  int v16;
  WFWidgetViewController *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  CGColor *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[WFWidgetViewController log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetViewController gridView](self, "gridView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetViewController gridView](self, "gridView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134219010;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    v20 = 2048;
    v21 = v8;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = a3;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_DEFAULT, "<%p %@> Assigning home screen tint color to <%p %@>: %@", (uint8_t *)&v16, 0x34u);

  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEC1398], "colorWithCGColor:", a3);
    v12 = (WFColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  homeScreenTintColor = self->_homeScreenTintColor;
  self->_homeScreenTintColor = v12;
  v14 = v12;

  -[WFWidgetViewController gridView](self, "gridView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tintWithHomeScreenTintColor:", v14);

}

- (void)startObservingContentSizeCategoryNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

}

- (void)stopObservingContentSizeCategoryNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE088], 0);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[WFWidgetViewController log](self, "log", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20CE0F000, v4, OS_LOG_TYPE_DEFAULT, "Received ContentSizeCategory changed notification", v5, 2u);
  }

  -[WFWidgetViewController refreshWorkflows](self, "refreshWorkflows");
}

- (void)gridView:(id)a3 didTapCell:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[WFWidgetViewController log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_20CE0F000, v6, OS_LOG_TYPE_DEFAULT, "Widget was tapped", (uint8_t *)&v27, 2u);
  }

  objc_msgSend(v5, "workflowIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    -[WFWidgetViewController log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = v5;
      _os_log_impl(&dword_20CE0F000, v11, OS_LOG_TYPE_DEFAULT, "Cell (%@) does not have a workflow identifier, launching Shortcuts app", (uint8_t *)&v27, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject openApplication:withOptions:completion:](v12, "openApplication:withOptions:completion:", *MEMORY[0x24BEC17D8], 0, &__block_literal_global_83);
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "runningState") == 1 || objc_msgSend(v5, "runningState") == 2)
  {
    -[WFWidgetViewController log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "workflowIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v10;
      _os_log_impl(&dword_20CE0F000, v9, OS_LOG_TYPE_DEFAULT, "Workflow (%{public}@) was running, now stopping...", (uint8_t *)&v27, 0xCu);

    }
    -[WFWidgetViewController stopRunningWithCell:](self, "stopRunningWithCell:", v5);
    goto LABEL_13;
  }
  if (-[WFWidgetViewController running](self, "running"))
  {
    -[WFWidgetViewController log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_20CE0F000, v12, OS_LOG_TYPE_DEFAULT, "A different workflow was running, ignoring tap", (uint8_t *)&v27, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  v13 = objc_msgSend(v5, "runningState");
  -[WFWidgetViewController log](self, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13 == 3)
  {
    if (v15)
    {
      objc_msgSend(v5, "workflowIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v16;
      _os_log_impl(&dword_20CE0F000, v14, OS_LOG_TYPE_DEFAULT, "Resuming run with workflow identifier: %{public}@", (uint8_t *)&v27, 0xCu);

    }
    -[WFWidgetViewController resumeRunningWithCell:](self, "resumeRunningWithCell:", v5);
  }
  else
  {
    if (v15)
    {
      objc_msgSend(v5, "workflowIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v17;
      _os_log_impl(&dword_20CE0F000, v14, OS_LOG_TYPE_DEFAULT, "Starting run with workflow identifier: %{public}@", (uint8_t *)&v27, 0xCu);

    }
    -[WFWidgetViewController showRunningUIForCell:](self, "showRunningUIForCell:", v5);
    v18 = objc_alloc(MEMORY[0x24BEC1660]);
    objc_msgSend(v5, "workflowIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithWorkflowIdentifier:location:", v19, 0);

    objc_msgSend(v20, "setDelegate:", self);
    objc_msgSend(v20, "start");
    objc_msgSend(v20, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v20, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWidgetViewController publishingHandlerForCell:](self, "publishingHandlerForCell:", v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addProgressSubscriberUsingPublishingHandler:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "progressSubscribers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKey:", v24, v22);

      objc_msgSend((id)objc_opt_class(), "runningStates");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v22);

      objc_storeStrong((id *)&self->_client, v20);
    }

  }
LABEL_13:

}

- (void)gridView:(id)a3 cellDidTransitionToRunningState:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a3;
  if (a4 == 3 || !a4)
  {
    -[WFWidgetViewController setRunning:](self, "setRunning:", 0);
    if (-[WFWidgetViewController needsLayout](self, "needsLayout"))
    {
      -[WFWidgetViewController log](self, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_20CE0F000, v7, OS_LOG_TYPE_DEFAULT, "Doing deferred layout now", v8, 2u);
      }

      -[WFWidgetViewController refreshWorkflows](self, "refreshWorkflows");
    }
  }

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  WFWidgetViewController *v20;
  BOOL v21;

  v9 = a5;
  v10 = a3;
  -[WFWidgetViewController gridView](self, "gridView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "workflowIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForWorkflowWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __98__WFWidgetViewController_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke;
  v17[3] = &unk_24C5AB660;
  v18 = v14;
  v19 = v9;
  v21 = a6;
  v20 = self;
  v15 = v14;
  v16 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v17);

}

- (WFWidgetCache)cache
{
  return self->_cache;
}

- (WFWidgetGridView)gridView
{
  return self->_gridView;
}

- (WFColor)homeScreenTintColor
{
  return self->_homeScreenTintColor;
}

- (void)setHomeScreenTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenTintColor, a3);
}

- (int64_t)widgetType
{
  return self->_widgetType;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (WFWidgetOptions)options
{
  return self->_options;
}

- (WFWidgetWorkflowRunnerClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (void)setNeedsLayout:(BOOL)a3
{
  self->_needsLayout = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_homeScreenTintColor, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

void __98__WFWidgetViewController_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;

  if (*(_QWORD *)(a1 + 40))
    v2 = 0;
  else
    v2 = *(_BYTE *)(a1 + 56) == 0;
  objc_msgSend(*(id *)(a1 + 32), "setCompletingSuccessfully:", v2);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 48), "stopRunningWithCell:", *(_QWORD *)(a1 + 32));
}

id __51__WFWidgetViewController_publishingHandlerForCell___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "setProgress:", a2);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__WFWidgetViewController_publishingHandlerForCell___block_invoke_2;
  v7[3] = &unk_24C5ABBB0;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v5 = _Block_copy(v7);

  return v5;
}

void __51__WFWidgetViewController_publishingHandlerForCell___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = dispatch_time(0, 200000000);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__WFWidgetViewController_publishingHandlerForCell___block_invoke_3;
  v5[3] = &unk_24C5ABBB0;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v5);

}

void __51__WFWidgetViewController_publishingHandlerForCell___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "runningState");
  v3 = *(void **)(a1 + 40);
  if (v2 == 3)
  {
    objc_msgSend(v3, "setRunning:", 0);
    objc_msgSend(*(id *)(a1 + 40), "gridView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableAllCells");

  }
  else
  {
    objc_msgSend(v3, "stopRunningWithCell:", *(_QWORD *)(a1 + 32));
  }
}

uint64_t __56__WFWidgetViewController_restoreRunningStateIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRunningState:", 3);
}

uint64_t __48__WFWidgetViewController_resumeRunningWithCell___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRunningState:", 1);
}

void __48__WFWidgetViewController_resumeRunningWithCell___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "showRunningUIForCell:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

void __46__WFWidgetViewController_stopRunningWithCell___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "setRunningState:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setRunning:", 0);
  objc_msgSend(*(id *)(a1 + 40), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stop");

  }
  objc_msgSend(*(id *)(a1 + 40), "setClient:", 0);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "workflowIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runningContextForWorkflowIdentifier:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "runningStates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v10);

  }
  objc_msgSend((id)objc_opt_class(), "progressSubscribers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1768], "removeSubscriber:", v8);
    objc_msgSend((id)objc_opt_class(), "progressSubscribers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

void __47__WFWidgetViewController_showRunningUIForCell___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setRunningState:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setRunning:", 1);
  objc_msgSend(*(id *)(a1 + 40), "gridView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableAllCellsExceptCell:", *(_QWORD *)(a1 + 32));

}

void __46__WFWidgetViewController_layoutWithWorkflows___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "gridView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutWithWorkflows:", *(_QWORD *)(a1 + 40));

}

void __42__WFWidgetViewController_initWithOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1032);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20CE0F000, v2, OS_LOG_TYPE_DEFAULT, "Received first unlock notification", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "refreshWorkflows");

}

+ (id)runningStates
{
  if (runningStates_onceToken != -1)
    dispatch_once(&runningStates_onceToken, &__block_literal_global_1137);
  return (id)runningStates_set;
}

+ (id)progressSubscribers
{
  if (progressSubscribers_onceToken != -1)
    dispatch_once(&progressSubscribers_onceToken, &__block_literal_global_76);
  return (id)progressSubscribers_progressSubscribers;
}

void __45__WFWidgetViewController_progressSubscribers__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)progressSubscribers_progressSubscribers;
  progressSubscribers_progressSubscribers = v0;

}

void __39__WFWidgetViewController_runningStates__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)runningStates_set;
  runningStates_set = v0;

}

@end
