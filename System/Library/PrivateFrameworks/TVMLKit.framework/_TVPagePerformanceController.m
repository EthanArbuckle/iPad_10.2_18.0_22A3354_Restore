@implementation _TVPagePerformanceController

+ (BOOL)isPerformanceUIEnabled
{
  int AppBooleanValue;

  if (isPerformanceUIEnabled_onceToken != -1)
    dispatch_once(&isPerformanceUIEnabled_onceToken, &__block_literal_global_26);
  if (isPerformanceUIEnabled_internalBuild)
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PagePerformanceUIEnabled"), CFSTR("com.apple.TVMLKit"), 0);
  else
    AppBooleanValue = isPerformanceUIEnabled_uiEnabled;
  return AppBooleanValue != 0;
}

+ (void)postNotificationForImageProxy:(id)a3 withLoadingStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *);
  void *v17;
  __CFString *v18;
  id v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v4 = a4;
  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21 = CFSTR("_TVPagePerformanceImageProxyNotificationTimestamp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = CFSTR("_TVPagePerformanceImageProxyDidLoadNotification");
  if (v4)
    v8 = CFSTR("_TVPagePerformanceImageProxyWillLoadNotification");
  v9 = v8;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __80___TVPagePerformanceController_postNotificationForImageProxy_withLoadingStatus___block_invoke;
  v17 = &unk_24EB865E0;
  v10 = v9;
  v18 = v10;
  v11 = v5;
  v19 = v11;
  v12 = v7;
  v20 = v12;
  v13 = (void (**)(_QWORD))MEMORY[0x22767F470](&v14);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v14, v15, v16, v17))
    v13[2](v13);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

- (_TVPagePerformanceController)init
{
  _TVPagePerformanceController *v2;
  _TVPagePerformanceController *v3;
  uint64_t v4;
  NSMutableArray *templateEntries;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVPagePerformanceController;
  v2 = -[_TVPagePerformanceController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    gettimeofday(&v2->_baseTimeval, 0);
    v3->_baseAbsoluteTime = mach_absolute_time();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    templateEntries = v3->_templateEntries;
    v3->_templateEntries = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)markViewWillLoad
{
  NSObject *v3;
  int v4;
  _TVPagePerformanceController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!-[_TVPagePerformanceController viewWillLoad](self, "viewWillLoad"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 134217984;
        v5 = self;
        _os_log_impl(&dword_222D98000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewWillLoad", (uint8_t *)&v4, 0xCu);
      }
    }
    -[_TVPagePerformanceController setViewWillLoad:](self, "setViewWillLoad:", mach_absolute_time());
  }
}

- (void)markViewDidLoad
{
  NSObject *v3;
  int v4;
  _TVPagePerformanceController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!-[_TVPagePerformanceController viewDidLoad](self, "viewDidLoad"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 134217984;
        v5 = self;
        _os_log_impl(&dword_222D98000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewDidLoad", (uint8_t *)&v4, 0xCu);
      }
    }
    -[_TVPagePerformanceController setViewDidLoad:](self, "setViewDidLoad:", mach_absolute_time());
  }
}

- (void)markViewWillAppear
{
  NSObject *v3;
  int v4;
  _TVPagePerformanceController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!-[_TVPagePerformanceController viewWillAppear](self, "viewWillAppear"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 134217984;
        v5 = self;
        _os_log_impl(&dword_222D98000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewWillAppear", (uint8_t *)&v4, 0xCu);
      }
    }
    -[_TVPagePerformanceController setViewWillAppear:](self, "setViewWillAppear:", mach_absolute_time());
  }
}

- (void)markViewDidAppear
{
  NSObject *v3;
  int v4;
  _TVPagePerformanceController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!-[_TVPagePerformanceController viewDidAppear](self, "viewDidAppear"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 134217984;
        v5 = self;
        _os_log_impl(&dword_222D98000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewDidAppear", (uint8_t *)&v4, 0xCu);
      }
    }
    -[_TVPagePerformanceController setViewDidAppear:](self, "setViewDidAppear:", mach_absolute_time());
    -[NSMutableArray makeObjectsPerformSelector:](self->_templateEntries, "makeObjectsPerformSelector:", sel__maybeStopListeningForInitialImageProxyLoadNotifications);
  }
}

- (void)markViewWillDisappear
{
  NSObject *v3;
  int v4;
  _TVPagePerformanceController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!-[_TVPagePerformanceController viewWillDisappear](self, "viewWillDisappear"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 134217984;
        v5 = self;
        _os_log_impl(&dword_222D98000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewWillDisappear", (uint8_t *)&v4, 0xCu);
      }
    }
    -[_TVPagePerformanceController setViewWillDisappear:](self, "setViewWillDisappear:", mach_absolute_time());
    -[NSMutableArray makeObjectsPerformSelector:](self->_templateEntries, "makeObjectsPerformSelector:", sel__stopListeningForInitialImageProxyLoadNotifications);
  }
}

- (void)markViewDidDisappear
{
  NSObject *v3;
  int v4;
  _TVPagePerformanceController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!-[_TVPagePerformanceController viewDidDisappear](self, "viewDidDisappear"))
  {
    if (!-[_TVPagePerformanceController templateDidComplete](self, "templateDidComplete"))
      -[_TVPagePerformanceController setPageWasInterrupted:](self, "setPageWasInterrupted:", 1);
    if (IsPerformanceLoggingEnabled())
    {
      v3 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 134217984;
        v5 = self;
        _os_log_impl(&dword_222D98000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p markViewDidDisappear", (uint8_t *)&v4, 0xCu);
      }
    }
    -[_TVPagePerformanceController setViewDidDisappear:](self, "setViewDidDisappear:", mach_absolute_time());
    -[_TVPagePerformanceController _maybeDeliverMetrics](self, "_maybeDeliverMetrics");
  }
}

- (id)getEntryForTemplate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _TVPagePerformanceTemplateEntry *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  _TVPagePerformanceController *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableArray lastObject](self->_templateEntries, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "templateElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v12 = objc_msgSend(v5, "templateDidTransition");
    v13 = IsPerformanceLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        v14 = (void *)TVMLKitPerformanceLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          objc_msgSend(v4, "elementName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 134218242;
          v22 = self;
          v23 = 2112;
          v24 = v16;
          _os_log_impl(&dword_222D98000, v15, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p %@ reuseEntryForTemplate", (uint8_t *)&v21, 0x16u);

        }
      }
      objc_msgSend(v5, "setTemplateUpdateCount:", objc_msgSend(v5, "templateUpdateCount") + 1);
      -[_TVPagePerformanceController setPageWasUpdated:](self, "setPageWasUpdated:", 1);
      v10 = v5;
    }
    else
    {
      if (v13)
      {
        v17 = (void *)TVMLKitPerformanceLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          objc_msgSend(v4, "elementName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 134218242;
          v22 = self;
          v23 = 2112;
          v24 = v19;
          _os_log_impl(&dword_222D98000, v18, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p %@ ignoreEntryForTemplate", (uint8_t *)&v21, 0x16u);

        }
      }
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v5, "_stopListeningForInitialImageProxyLoadNotifications");
    if (IsPerformanceLoggingEnabled())
    {
      v7 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        objc_msgSend(v4, "elementName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218242;
        v22 = self;
        v23 = 2112;
        v24 = v9;
        _os_log_impl(&dword_222D98000, v8, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p %@ createEntryForTemplate", (uint8_t *)&v21, 0x16u);

      }
    }
    v10 = -[_TVPagePerformanceTemplateEntry initWithPagePerformanceController:forTemplateElement:]([_TVPagePerformanceTemplateEntry alloc], "initWithPagePerformanceController:forTemplateElement:", self, v4);
    -[NSMutableArray addObject:](self->_templateEntries, "addObject:", v10);
    objc_msgSend(v4, "elementName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVPagePerformanceController setPageIsLoading:](self, "setPageIsLoading:", objc_msgSend(CFSTR("loadingTemplate"), "isEqualToString:", v11));
    -[_TVPagePerformanceController setPageHasSubpages:](self, "setPageHasSubpages:", objc_msgSend(CFSTR("menuBarTemplate"), "isEqualToString:", v11));
    -[_TVPagePerformanceController setPageWasUpdated:](self, "setPageWasUpdated:", 0);

  }
  return v10;
}

- (unint64_t)templateDidComplete
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  if (-[_TVPagePerformanceController viewDidDisappear](self, "viewDidDisappear"))
    return 0;
  -[NSMutableArray lastObject](self->_templateEntries, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_TVPagePerformanceController viewDidAppear](self, "viewDidAppear");
  if (v5 <= objc_msgSend(v4, "templateDidTransition"))
    v6 = objc_msgSend(v4, "templateDidTransition");
  else
    v6 = -[_TVPagePerformanceController viewDidAppear](self, "viewDidAppear");
  v3 = v6;
  if (objc_msgSend(v4, "templateDidLoadResources") > v6)
    v3 = objc_msgSend(v4, "templateDidLoadResources");

  return v3;
}

- (NSDictionary)metrics
{
  __darwin_time_t v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[8];
  _QWORD v18[10];

  v18[8] = *MEMORY[0x24BDAC8D0];
  v3 = self->_baseTimeval.tv_usec + 1000000 * self->_baseTimeval.tv_sec;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __39___TVPagePerformanceController_metrics__block_invoke;
  v16[3] = &unk_24EB86790;
  v16[4] = self;
  v16[5] = v3;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767F470](v16, a2);
  -[NSMutableArray lastObject](self->_templateEntries, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("pageAppearTime");
  v4[2](v4, -[_TVPagePerformanceController viewDidAppear](self, "viewDidAppear"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  v17[1] = CFSTR("pageUserInteractiveTime");
  v4[2](v4, objc_msgSend(v5, "templateDidTransition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  v17[2] = CFSTR("pageEndTime");
  v4[2](v4, -[_TVPagePerformanceController templateDidComplete](self, "templateDidComplete"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v17[3] = CFSTR("pageInterruptTime");
  v4[2](v4, -[_TVPagePerformanceController viewDidDisappear](self, "viewDidDisappear"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("modelRenderStartTime");
  v4[2](v4, objc_msgSend(v5, "templateWillRender"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v9;
  v17[5] = CFSTR("modelRenderEndTime");
  v4[2](v4, objc_msgSend(v5, "templateDidRender"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v10;
  v17[6] = CFSTR("resourceRequestStartTime");
  v4[2](v4, objc_msgSend(v5, "templateWillLoadResources"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v11;
  v17[7] = CFSTR("resourceRequestEndTime");
  v4[2](v4, objc_msgSend(v5, "templateDidLoadResources"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v13;
}

- (id)buildPagePerformanceView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  -[_TVPagePerformanceController _calculatePageDurations](self, "_calculatePageDurations");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 500.0, 0.0);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x4010000000;
  v19 = &unk_222E82B8D;
  v20 = xmmword_222E77230;
  v21 = xmmword_222E77240;
  v22[0] = CFSTR("Complete Duration: ");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageCompleteDuration](self, "pageCompleteDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v22[1] = CFSTR("Setup Duration: ");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageSetupDuration](self, "pageSetupDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  v22[2] = CFSTR("Render Duration: ");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageRenderDuration](self, "pageRenderDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  v22[3] = CFSTR("Resource Duration: ");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageResourceDuration](self, "pageResourceDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v8;
  v22[4] = CFSTR("Transition Duration: ");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_TVPagePerformanceController pageTransitionDuration](self, "pageTransitionDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56___TVPagePerformanceController_buildPagePerformanceView__block_invoke;
  v13[3] = &unk_24EB867B8;
  v15 = &v16;
  v11 = v3;
  v14 = v11;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, 500.0, v17[5]);

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (void)_calculatePageDurations
{
  void *v3;
  _TVPagePerformanceController *v4;
  unint64_t v5;
  NSObject *v6;
  NSMutableArray *templateEntries;
  unint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  _TVPagePerformanceController *v24;
  __int16 v25;
  NSMutableArray *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray lastObject](self->_templateEntries, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVPagePerformanceController setPageRenderDuration:](self, "setPageRenderDuration:", objc_msgSend(v3, "templateRenderDuration"));
  if (-[_TVPagePerformanceController pageWasUpdated](self, "pageWasUpdated"))
  {
    -[_TVPagePerformanceController setPageCompleteDuration:](self, "setPageCompleteDuration:", 0);
    -[_TVPagePerformanceController setPageSetupDuration:](self, "setPageSetupDuration:", 0);
    -[_TVPagePerformanceController setPageResourceDuration:](self, "setPageResourceDuration:", 0);
    v4 = self;
    v5 = 0;
  }
  else
  {
    if (IsPerformanceLoggingEnabled())
    {
      v6 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        templateEntries = self->_templateEntries;
        *(_DWORD *)buf = 134218242;
        v24 = self;
        v25 = 2112;
        v26 = templateEntries;
        _os_log_impl(&dword_222D98000, v6, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p calculatePageDurations %@", buf, 0x16u);
      }
    }
    if (-[_TVPagePerformanceController pageWasInterrupted](self, "pageWasInterrupted"))
      v8 = -[_TVPagePerformanceController viewDidDisappear](self, "viewDidDisappear");
    else
      v8 = -[_TVPagePerformanceController templateDidComplete](self, "templateDidComplete");
    -[_TVPagePerformanceController setPageCompleteDuration:](self, "setPageCompleteDuration:", _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(self->_baseAbsoluteTime, v8));
    -[_TVPagePerformanceController setPageSetupDuration:](self, "setPageSetupDuration:", _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(self->_baseAbsoluteTime, objc_msgSend(v3, "templateWillRender")));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_templateEntries;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "templateTransitionDuration", (_QWORD)v18);
          if (v17 > v13)
            v13 = v17;
          v12 += objc_msgSend(v16, "templateResourcesDuration");
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }

    -[_TVPagePerformanceController setPageResourceDuration:](self, "setPageResourceDuration:", v12);
    v4 = self;
    v5 = v13;
  }
  -[_TVPagePerformanceController setPageTransitionDuration:](v4, "setPageTransitionDuration:", v5, (_QWORD)v18);

}

- (BOOL)_isMetricsReady
{
  void *v3;
  NSObject *v4;
  BOOL v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;
  uint8_t buf[2];

  -[NSMutableArray lastObject](self->_templateEntries, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_TVPagePerformanceController viewDidDisappear](self, "viewDidDisappear"))
  {
    if (objc_msgSend(v3, "templateDidLoadResources"))
    {
      if (IsPerformanceLoggingEnabled())
      {
        v4 = TVMLKitPerformanceLogObject;
        v5 = 0;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 0;
          v6 = "[DEBUG] shouldDeliverMetrics -- Too late; page has already been dismissed/finished loading";
          v7 = (uint8_t *)&v9;
LABEL_16:
          _os_log_impl(&dword_222D98000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
          goto LABEL_17;
        }
        goto LABEL_18;
      }
LABEL_17:
      v5 = 0;
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  if (!-[_TVPagePerformanceController viewDidAppear](self, "viewDidAppear"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v4 = TVMLKitPerformanceLogObject;
      v5 = 0;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v6 = "[DEBUG] shouldDeliverMetrics -- Too early; page is not yet interactive";
        v7 = buf;
        goto LABEL_16;
      }
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "templateDidLoadResources") && objc_msgSend(v3, "templateDidTransition"))
  {
LABEL_9:
    v5 = 1;
    goto LABEL_18;
  }
  if (!IsPerformanceLoggingEnabled())
    goto LABEL_17;
  v4 = TVMLKitPerformanceLogObject;
  v5 = 0;
  if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 0;
    v6 = "[DEBUG] shouldDeliverMetrics -- Too early; page is not finished loading";
    v7 = (uint8_t *)&v10;
    goto LABEL_16;
  }
LABEL_18:

  return v5;
}

- (void)_maybeDeliverMetrics
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  _TVPagePerformanceController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (IsPerformanceLoggingEnabled())
  {
    v3 = TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_impl(&dword_222D98000, v3, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p maybeDeliverMetrics", (uint8_t *)&v7, 0xCu);
    }
  }
  if (-[_TVPagePerformanceController _isMetricsReady](self, "_isMetricsReady"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v4 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = self;
        _os_log_impl(&dword_222D98000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %p actuallyDeliverMetrics", (uint8_t *)&v7, 0xCu);
      }
    }
    -[_TVPagePerformanceController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVPagePerformanceController metrics](self, "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pagePerformanceController:didUpdateMetrics:", self, v6);

  }
}

- (_TVPagePerformanceDelegate)delegate
{
  return (_TVPagePerformanceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)pageHasSubpages
{
  return self->_pageHasSubpages;
}

- (void)setPageHasSubpages:(BOOL)a3
{
  self->_pageHasSubpages = a3;
}

- (BOOL)pageWasInterrupted
{
  return self->_pageWasInterrupted;
}

- (void)setPageWasInterrupted:(BOOL)a3
{
  self->_pageWasInterrupted = a3;
}

- (BOOL)pageWasUpdated
{
  return self->_pageWasUpdated;
}

- (void)setPageWasUpdated:(BOOL)a3
{
  self->_pageWasUpdated = a3;
}

- (unint64_t)viewWillLoad
{
  return self->_viewWillLoad;
}

- (void)setViewWillLoad:(unint64_t)a3
{
  self->_viewWillLoad = a3;
}

- (unint64_t)viewDidLoad
{
  return self->_viewDidLoad;
}

- (void)setViewDidLoad:(unint64_t)a3
{
  self->_viewDidLoad = a3;
}

- (unint64_t)viewWillAppear
{
  return self->_viewWillAppear;
}

- (void)setViewWillAppear:(unint64_t)a3
{
  self->_viewWillAppear = a3;
}

- (unint64_t)viewDidAppear
{
  return self->_viewDidAppear;
}

- (void)setViewDidAppear:(unint64_t)a3
{
  self->_viewDidAppear = a3;
}

- (unint64_t)viewWillDisappear
{
  return self->_viewWillDisappear;
}

- (void)setViewWillDisappear:(unint64_t)a3
{
  self->_viewWillDisappear = a3;
}

- (unint64_t)viewDidDisappear
{
  return self->_viewDidDisappear;
}

- (void)setViewDidDisappear:(unint64_t)a3
{
  self->_viewDidDisappear = a3;
}

- (BOOL)pageIsLoading
{
  return self->_pageIsLoading;
}

- (void)setPageIsLoading:(BOOL)a3
{
  self->_pageIsLoading = a3;
}

- (unint64_t)pageCompleteDuration
{
  return self->_pageCompleteDuration;
}

- (void)setPageCompleteDuration:(unint64_t)a3
{
  self->_pageCompleteDuration = a3;
}

- (unint64_t)pageSetupDuration
{
  return self->_pageSetupDuration;
}

- (void)setPageSetupDuration:(unint64_t)a3
{
  self->_pageSetupDuration = a3;
}

- (unint64_t)pageRenderDuration
{
  return self->_pageRenderDuration;
}

- (void)setPageRenderDuration:(unint64_t)a3
{
  self->_pageRenderDuration = a3;
}

- (unint64_t)pageResourceDuration
{
  return self->_pageResourceDuration;
}

- (void)setPageResourceDuration:(unint64_t)a3
{
  self->_pageResourceDuration = a3;
}

- (unint64_t)pageTransitionDuration
{
  return self->_pageTransitionDuration;
}

- (void)setPageTransitionDuration:(unint64_t)a3
{
  self->_pageTransitionDuration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_templateEntries, 0);
}

@end
