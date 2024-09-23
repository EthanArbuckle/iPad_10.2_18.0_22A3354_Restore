@implementation LTUITranslationViewController

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    _LTOSLogSignpost();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)instrumentationLog;
    instrumentationLog = v2;

  }
}

+ (BOOL)isAvailable
{
  return _os_feature_enabled_impl();
}

- (LTUITranslationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  LTUITranslationViewController *v4;
  NSObject *v5;
  NSArray *ignoredAttributes;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t cplID;
  LTUITranslationViewController *v10;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)LTUITranslationViewController;
  v4 = -[LTUITranslationViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isAvailable") & 1) == 0)
    {
      v5 = _LTOSLogSystemTranslation();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[LTUITranslationViewController initWithNibName:bundle:].cold.1();
    }
    ignoredAttributes = v4->_ignoredAttributes;
    v4->_ignoredAttributes = (NSArray *)MEMORY[0x24BDBD1A8];

    -[LTUITranslationViewController _refreshExtensionList](v4, "_refreshExtensionList");
    v4->cplID = os_signpost_id_generate((os_log_t)instrumentationLog);
    v7 = (id)instrumentationLog;
    v8 = v7;
    cplID = v4->cplID;
    if (cplID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_20D649000, v8, OS_SIGNPOST_INTERVAL_BEGIN, cplID, "CPL", " enableTelemetry=YES ", v12, 2u);
    }

    v10 = v4;
  }

  return v4;
}

- (LTUITranslationViewController)init
{
  LTUITranslationViewController *v2;
  LTUITranslationViewController *v3;
  LTUITranslationViewController *v4;

  v2 = -[LTUITranslationViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LTUITranslationViewController;
  -[LTUITranslationViewController didReceiveMemoryWarning](&v3, sel_didReceiveMemoryWarning);
  -[LTUITranslationViewController invalidate](self, "invalidate");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LTUITranslationViewController;
  -[LTUITranslationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[LTUITranslationViewController _insertBackground](self, "_insertBackground");
}

- (void)viewDidLayoutSubviews
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LTUITranslationViewController;
  -[LTUITranslationViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  v3 = -[LTUITranslationViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
  -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adaptForPresentationInPopover:", v3);

}

- (void)willMoveToParentViewController:(id)a3
{
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LTUITranslationViewController;
  -[LTUITranslationViewController willMoveToParentViewController:](&v7, sel_willMoveToParentViewController_);
  if (a3)
  {
    v5 = -[LTUITranslationViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
    -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adaptForPresentationInPopover:", v5);

  }
}

- (void)didMoveToParentViewController:(id)a3
{
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LTUITranslationViewController;
  -[LTUITranslationViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  if (a3)
  {
    v5 = -[LTUITranslationViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
    -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adaptForPresentationInPopover:", v5);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LTUITranslationViewController;
  -[LTUITranslationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[LTUITranslationViewController presentationController](self, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "_setBackgroundBlurDisabled:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LTUITranslationViewController;
  -[LTUITranslationViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[LTUITranslationViewController dismissCompletionHandler](self, "dismissCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LTUITranslationViewController dismissCompletionHandler](self, "dismissCompletionHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    -[LTUITranslationViewController setDismissCompletionHandler:](self, "setDismissCompletionHandler:", 0);
  }
  -[LTUITranslationViewController _cleanUpExtension](self, "_cleanUpExtension");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (void)_refreshExtensionList
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t extensionQueryID;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];
  id location;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13 = *MEMORY[0x24BDD0C48];
  v14[0] = kLTUIViewServiceProtocol;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  self->extensionQueryID = os_signpost_id_generate((os_log_t)instrumentationLog);
  v4 = (id)instrumentationLog;
  v5 = v4;
  extensionQueryID = self->extensionQueryID;
  if (extensionQueryID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D649000, v5, OS_SIGNPOST_INTERVAL_BEGIN, extensionQueryID, "RemoteViewControllerSetup", ", buf, 2u);
  }

  v7 = (void *)MEMORY[0x24BDD1550];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__LTUITranslationViewController__refreshExtensionList__block_invoke;
  v9[3] = &unk_24C74F538;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "beginMatchingExtensionsWithAttributes:completion:", v3, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTUITranslationViewController setMatchingToken:](self, "setMatchingToken:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __54__LTUITranslationViewController__refreshExtensionList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[6];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v6)
  {
    v9 = _LTOSLogXPC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __54__LTUITranslationViewController__refreshExtensionList__block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
      if (!v8)
        goto LABEL_9;
      goto LABEL_4;
    }
    if (v8)
    {
LABEL_4:
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __54__LTUITranslationViewController__refreshExtensionList__block_invoke_19;
      v19[3] = &unk_24C74F510;
      v19[4] = v8;
      v16 = (id *)v19;
      v17 = v6;
LABEL_8:
      v16[5] = v17;
      dispatch_async(MEMORY[0x24BDAC9B8], v16);

    }
  }
  else if (WeakRetained && objc_msgSend(v5, "count"))
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __54__LTUITranslationViewController__refreshExtensionList__block_invoke_2;
    v18[3] = &unk_24C74F510;
    v18[4] = v8;
    v16 = (id *)v18;
    v17 = v5;
    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __54__LTUITranslationViewController__refreshExtensionList__block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentError:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__LTUITranslationViewController__refreshExtensionList__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveExtensions:", *(_QWORD *)(a1 + 40));
}

- (void)_presentError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[LTUITranslationViewController _presentError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  -[LTUITranslationViewController _cleanUpExtension](self, "_cleanUpExtension");

}

- (id)_userInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  LTUISourceMeta *sourceMeta;
  void *v16;
  NSLocale *sourceLocale;
  void *v18;
  NSLocale *targetLocale;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("-SkipFirstUse"));

  v6 = _LTOSLogOnboarding();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v25 = v5;
    _os_log_impl(&dword_20D649000, v6, OS_LOG_TYPE_INFO, "Skip first use consent: %{BOOL}i", buf, 8u);
  }
  v7 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LTUITranslationViewController consentDisplayOnly](self, "consentDisplayOnly", CFSTR("ConsentDisplayOnly")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v22[1] = CFSTR("SkipFirstUse");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  v22[2] = CFSTR("ReplacementAvailable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LTUITranslationViewController isSourceEditable](self, "isSourceEditable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v10;
  v22[3] = CFSTR("IgnoredAttributes");
  -[LTUITranslationViewController ignoredAttributes](self, "ignoredAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v11;
  v22[4] = CFSTR("CPLIntervalID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->cplID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  sourceMeta = self->_sourceMeta;
  if (sourceMeta)
  {
    -[LTUISourceMeta dictionaryRepresentation](sourceMeta, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("SourceMeta"));

  }
  sourceLocale = self->_sourceLocale;
  if (sourceLocale)
  {
    -[NSLocale localeIdentifier](sourceLocale, "localeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("SourceLocale"));

  }
  targetLocale = self->_targetLocale;
  if (targetLocale)
  {
    -[NSLocale localeIdentifier](targetLocale, "localeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("TargetLocale"));

  }
  return v14;
}

- (void)receiveExtensions:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.TranslationUIServices.TranslationUIService"));

        if (v11)
        {
          v12 = v9;

          v6 = v12;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v5);

    if (v6)
    {
      -[LTUITranslationViewController setCurrentExtension:](self, "setCurrentExtension:", v6);
      v13 = objc_alloc_init(MEMORY[0x24BDD1560]);
      -[LTUITranslationViewController _userInfo](self, "_userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setUserInfo:", v14);
      -[LTUITranslationViewController text](self, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = objc_alloc(MEMORY[0x24BDD1458]);
        -[LTUITranslationViewController text](self, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "string");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v16, "initWithString:", v18);
        objc_msgSend(v13, "setAttributedContentText:", v19);

      }
      else
      {
        v21 = _LTOSLogSystemTranslation();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[LTUITranslationViewController receiveExtensions:].cold.2();
      }
      objc_initWeak(&location, self);
      v22 = _LTOSLogSystemTranslation();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D649000, v22, OS_LOG_TYPE_INFO, "System-wide translation requested", buf, 2u);
      }
      v23 = _LTOSLogSystemTranslation();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v14;
        _os_log_impl(&dword_20D649000, v23, OS_LOG_TYPE_INFO, "Starting translation with user info: %{public}@", buf, 0xCu);
      }
      -[LTUITranslationViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
      v24 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __51__LTUITranslationViewController_receiveExtensions___block_invoke;
      v28[3] = &unk_24C74F560;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v6, "setRequestInterruptionBlock:", v28);
      v35 = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v24;
      v26[1] = 3221225472;
      v26[2] = __51__LTUITranslationViewController_receiveExtensions___block_invoke_33;
      v26[3] = &unk_24C74F5B0;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v6, "instantiateViewControllerWithInputItems:connectionHandler:", v25, v26);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);

      goto LABEL_23;
    }
  }
  else
  {

  }
  v20 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    -[LTUITranslationViewController receiveExtensions:].cold.1();
LABEL_23:

}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__LTUITranslationViewController_receiveExtensions___block_invoke_2;
    block[3] = &unk_24C74F460;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  v2 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_cold_1();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationUIServicesErrorDomain"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);

}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_34;
  v13[3] = &unk_24C74F588;
  v14 = v9;
  v10 = v9;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  v15 = v7;
  v16 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

  objc_destroyWeak(&v17);
}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_34(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = _LTOSLogSystemTranslation();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_34_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "finishWithError:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v12, "setRequestID:", v11);

    v13 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v13, "setRemoteViewController:", *(_QWORD *)(a1 + 48));

    v14 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v14, "_endDelayingPresentation");

  }
}

- (void)_setChildController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  LTUITranslationViewController *v9;

  v4 = a3;
  -[LTUITranslationViewController addChildViewController:](self, "addChildViewController:", v4);
  v5 = (void *)MEMORY[0x24BDF6F90];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__LTUITranslationViewController__setChildController___block_invoke;
  v7[3] = &unk_24C74F510;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v7);

}

void __53__LTUITranslationViewController__setChildController___block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v2);

  v14 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v2, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  objc_msgSend(*(id *)(a1 + 40), "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  objc_msgSend(v2, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v6;
  objc_msgSend(*(id *)(a1 + 40), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v11);

  objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "preferredContentSize");
  objc_msgSend(*(id *)(a1 + 40), "setPreferredContentSize:", 0.0);

}

- (void)setRemoteViewController:(id)a3
{
  id v5;
  LTUIRemoteViewController **p_remoteViewController;
  LTUIRemoteViewController *remoteViewController;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t extensionQueryID;
  uint8_t v14[16];

  v5 = a3;
  p_remoteViewController = &self->_remoteViewController;
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    -[LTUIRemoteViewController view](remoteViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[LTUIRemoteViewController removeFromParentViewController](*p_remoteViewController, "removeFromParentViewController");
  }
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  -[LTUIRemoteViewController setDelegate:](*p_remoteViewController, "setDelegate:", self);
  if (*p_remoteViewController)
  {
    -[LTUITranslationViewController _setChildController:](self, "_setChildController:");
    v9 = -[LTUITranslationViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
    -[_UIRemoteViewController serviceViewControllerProxy](*p_remoteViewController, "serviceViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adaptForPresentationInPopover:", v9);

    v11 = (id)instrumentationLog;
    v12 = v11;
    extensionQueryID = self->extensionQueryID;
    if (extensionQueryID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_20D649000, v12, OS_SIGNPOST_INTERVAL_END, extensionQueryID, "RemoteViewControllerSetup", ", v14, 2u);
    }

  }
}

- (void)invalidate
{
  -[LTUITranslationViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
  -[LTUITranslationViewController _cleanUpExtension](self, "_cleanUpExtension");
}

- (void)finishWithError:(id)a3
{
  id v4;
  LTUIErrorViewController *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = -[LTUIErrorViewController initWithError:]([LTUIErrorViewController alloc], "initWithError:", v4);
  v6 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[LTUITranslationViewController finishWithError:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  -[LTUITranslationViewController _insertBackground](self, "_insertBackground");
  -[LTUITranslationViewController _setChildController:](self, "_setChildController:", v5);
  -[LTUITranslationViewController _cleanUpExtension](self, "_cleanUpExtension");

}

- (void)_cleanUpExtension
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1550];
  -[LTUITranslationViewController matchingToken](self, "matchingToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endMatchingExtensions:", v4);

  -[LTUITranslationViewController setMatchingToken:](self, "setMatchingToken:", 0);
  -[LTUITranslationViewController currentExtension](self, "currentExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTUITranslationViewController requestID](self, "requestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelExtensionRequestWithIdentifier:", v6);

  -[LTUITranslationViewController setCurrentExtension:](self, "setCurrentExtension:", 0);
  -[LTUITranslationViewController setRequestID:](self, "setRequestID:", 0);
}

- (void)finishWithTranslation:(id)a3
{
  void (**replacementHandler)(id, id);

  replacementHandler = (void (**)(id, id))self->_replacementHandler;
  if (replacementHandler)
    replacementHandler[2](replacementHandler, a3);
  -[LTUITranslationViewController dismiss](self, "dismiss", a3);
}

- (void)dismiss
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D649000, v3, OS_LOG_TYPE_INFO, "Dismissing system view controller", v5, 2u);
  }
  -[LTUITranslationViewController dismissCompletionHandler](self, "dismissCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTUITranslationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);

  -[LTUITranslationViewController setDismissCompletionHandler:](self, "setDismissCompletionHandler:", 0);
  -[LTUITranslationViewController _cleanUpExtension](self, "_cleanUpExtension");
}

- (void)confirmUserConsent
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = _LTOSLogOnboarding();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D649000, v3, OS_LOG_TYPE_DEFAULT, "User confirmed consent to using system translation", v4, 2u);
  }
  -[LTUITranslationViewController setUserConsentConfirmed:](self, "setUserConsentConfirmed:", 1);
  -[LTUITranslationViewController dismiss](self, "dismiss");
}

- (void)expandSheet
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  LTUITranslationViewController *v9;

  -[LTUITranslationViewController _sheetPresentationController](self, "_sheetPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 && v5 >= 2)
  {
    v6 = (void *)MEMORY[0x24BDF6F90];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__LTUITranslationViewController_expandSheet__block_invoke;
    v7[3] = &unk_24C74F510;
    v8 = v3;
    v9 = self;
    objc_msgSend(v6, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 2, v7, 0, 0.0, 0.0);

  }
}

void __44__LTUITranslationViewController_expandSheet__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6D98], "largeDetent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSelectedDetentIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)_insertBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[LTUITranslationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewWithTag:", 101);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 9);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v8);
    objc_msgSend(v5, "setTag:", 101);
    -[LTUITranslationViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v5, "setFrame:");

    objc_msgSend(v5, "setAutoresizingMask:", 18);
    -[LTUITranslationViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:atIndex:", v5, 0);

  }
}

- (void)_removeBackground
{
  void *v2;
  id v3;

  -[LTUITranslationViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewWithTag:", 101);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeFromSuperview");
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "_setShouldDismissWhenTappedOutside:", 1);
    objc_msgSend(MEMORY[0x24BDF6D98], "mediumDetent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x24BDF6D98], "largeDetent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDetents:", v8);

    objc_msgSend(v5, "setLargestUndimmedDetentIdentifier:", 0);
    objc_msgSend(v5, "setPrefersGrabberVisible:", 1);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "_setBackgroundBlurDisabled:", 1);

}

- (void)_presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[LTUITranslationViewController dismissCompletionHandler](self, "dismissCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LTUITranslationViewController dismissCompletionHandler](self, "dismissCompletionHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    -[LTUITranslationViewController setDismissCompletionHandler:](self, "setDismissCompletionHandler:", 0);
  }
}

- (id)_sheetPresentationController
{
  void *v2;
  id v3;

  -[LTUITranslationViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)consentDisplayOnly
{
  return self->_consentDisplayOnly;
}

- (void)setConsentDisplayOnly:(BOOL)a3
{
  self->_consentDisplayOnly = a3;
}

- (BOOL)userConsentConfirmed
{
  return self->_userConsentConfirmed;
}

- (void)setUserConsentConfirmed:(BOOL)a3
{
  self->_userConsentConfirmed = a3;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (void)setSourceLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (NSArray)ignoredAttributes
{
  return self->_ignoredAttributes;
}

- (void)setIgnoredAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (BOOL)isSourceEditable
{
  return self->_isSourceEditable;
}

- (void)setIsSourceEditable:(BOOL)a3
{
  self->_isSourceEditable = a3;
}

- (LTUISourceMeta)sourceMeta
{
  return self->_sourceMeta;
}

- (void)setSourceMeta:(id)a3
{
  objc_storeStrong((id *)&self->_sourceMeta, a3);
}

- (id)replacementHandler
{
  return self->_replacementHandler;
}

- (void)setReplacementHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (id)matchingToken
{
  return self->_matchingToken;
}

- (void)setMatchingToken:(id)a3
{
  objc_storeStrong(&self->_matchingToken, a3);
}

- (NSCopying)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (NSExtension)currentExtension
{
  return self->_currentExtension;
}

- (void)setCurrentExtension:(id)a3
{
  objc_storeStrong((id *)&self->_currentExtension, a3);
}

- (LTUIRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_currentExtension, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong(&self->_matchingToken, 0);
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_storeStrong(&self->_replacementHandler, 0);
  objc_storeStrong((id *)&self->_sourceMeta, 0);
  objc_storeStrong((id *)&self->_ignoredAttributes, 0);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_20D649000, v0, v1, "Attempting to use system translation on a platform that doesn't support it. Clients need to first call LTUITranslationViewController.isAvailable before initializing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__LTUITranslationViewController__refreshExtensionList__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D649000, a2, a3, "Error matching extensions: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_presentError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D649000, a2, a3, "Failed to match extensions: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)receiveExtensions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_20D649000, v0, v1, "Failed to find TranslationUI service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)receiveExtensions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_20D649000, v0, v1, "Attempting to initiate translation without text to translate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_20D649000, v0, v1, "Extension request was inturrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__LTUITranslationViewController_receiveExtensions___block_invoke_2_34_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D649000, a2, a3, "Failed to instantiate extension view controller with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)finishWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D649000, a2, a3, "Encountered error during system translation; presenting error UI: %@",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_1();
}

@end
