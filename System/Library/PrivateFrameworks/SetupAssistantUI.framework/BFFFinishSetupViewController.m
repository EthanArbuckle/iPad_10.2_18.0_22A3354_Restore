@implementation BFFFinishSetupViewController

- (BFFFinishSetupViewController)init
{
  BFFFinishSetupViewController *v2;
  BYCapabilities *v3;
  BYCapabilities *capabilities;
  BYFlowSkipController *v5;
  BYFlowSkipController *flowSkipController;
  BYAnalyticsManager *v7;
  BYAnalyticsManager *analyticsManager;
  id v9;
  BYAnalyticsManager *v10;
  BFFFinishSetupRunState *v11;
  uint64_t v12;
  BFFFinishSetupFlowItemDispositionProvider *v13;
  uint64_t v14;
  BYPaneFeatureAnalyticsManager *paneFeatureAnalyticsManager;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BFFFinishSetupViewController;
  v2 = -[BFFFinishSetupViewController init](&v17, sel_init);
  if (v2)
  {
    v3 = (BYCapabilities *)objc_alloc_init(MEMORY[0x24BE85880]);
    capabilities = v2->_capabilities;
    v2->_capabilities = v3;

    v5 = (BYFlowSkipController *)objc_alloc_init(MEMORY[0x24BE85890]);
    flowSkipController = v2->_flowSkipController;
    v2->_flowSkipController = v5;

    v7 = (BYAnalyticsManager *)objc_alloc_init(MEMORY[0x24BE85868]);
    analyticsManager = v2->_analyticsManager;
    v2->_analyticsManager = v7;

    v9 = objc_alloc(MEMORY[0x24BE85898]);
    v10 = v2->_analyticsManager;
    v11 = objc_alloc_init(BFFFinishSetupRunState);
    v12 = *MEMORY[0x24BE85838];
    v13 = objc_alloc_init(BFFFinishSetupFlowItemDispositionProvider);
    v14 = objc_msgSend(v9, "initWithAnalyticsManager:runState:host:flowItemDispositionProvider:", v10, v11, v12, v13);
    paneFeatureAnalyticsManager = v2->_paneFeatureAnalyticsManager;
    v2->_paneFeatureAnalyticsManager = (BYPaneFeatureAnalyticsManager *)v14;

  }
  return v2;
}

- (void)processURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id completion;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *flowIdentifiers;
  NSMutableSet *v18;
  NSMutableSet *completedFlowIdentifiers;
  NSMutableSet *v20;
  NSMutableSet *skippedFlowIdentifiers;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v6;
    _os_log_impl(&dword_214875000, v8, OS_LOG_TYPE_DEFAULT, "Finish setup processURL: %@", (uint8_t *)&v22, 0xCu);
  }

  v9 = (void *)MEMORY[0x2199D7C3C](v7);
  completion = self->_completion;
  self->_completion = v9;

  -[BFFFinishSetupViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 17);
  +[BFFFinishSetupViewController _keyValueDictionaryForURL:](BFFFinishSetupViewController, "_keyValueDictionaryForURL:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _BYLoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v11;
    _os_log_impl(&dword_214875000, v12, OS_LOG_TYPE_DEFAULT, "processURL: params %@", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("flow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _BYLoggingFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v13;
    _os_log_impl(&dword_214875000, v14, OS_LOG_TYPE_DEFAULT, "processURL: flowParameter %@", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[BFFFinishSetupViewController _orderedFlowIdentifiersFromFlowIdentifiers:](BFFFinishSetupViewController, "_orderedFlowIdentifiersFromFlowIdentifiers:", v15);
  v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  flowIdentifiers = self->_flowIdentifiers;
  self->_flowIdentifiers = v16;

  v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  completedFlowIdentifiers = self->_completedFlowIdentifiers;
  self->_completedFlowIdentifiers = v18;

  v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  skippedFlowIdentifiers = self->_skippedFlowIdentifiers;
  self->_skippedFlowIdentifiers = v20;

}

+ (id)_keyValueDictionaryForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") == 2)
        {
          objc_msgSend(v12, "objectAtIndex:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByRemovingPercentEncoding");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectAtIndex:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v14, v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v4;
}

+ (id)_orderedFlowIdentifiersFromFlowIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BE85818];
  v21[0] = *MEMORY[0x24BE85830];
  v21[1] = v4;
  v5 = *MEMORY[0x24BE85808];
  v21[2] = *MEMORY[0x24BE85820];
  v21[3] = v5;
  v6 = *MEMORY[0x24BE85828];
  v21[4] = *MEMORY[0x24BE85810];
  v21[5] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v3, "containsObject:", v14, (_QWORD)v16))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)setOverrideFlowControllerGenerator:(id)a3
{
  void *v4;
  id overrideFlowControllerGenerator;

  v4 = (void *)MEMORY[0x2199D7C3C](a3, a2);
  overrideFlowControllerGenerator = self->_overrideFlowControllerGenerator;
  self->_overrideFlowControllerGenerator = v4;

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BFFFinishSetupViewController;
  -[BFFFinishSetupViewController loadView](&v8, sel_loadView);
  -[BFFFinishSetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFinishSetupViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFinishSetupViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyAutomaticScrollToEdgeBehaviorOnNavigationItem:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BFFFinishSetupViewController;
  -[BFFFinishSetupViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (!self->_setupInProgress)
  {
    self->_setupInProgress = 1;
    objc_msgSend(MEMORY[0x24BE85890], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBasicFunctionalityEnabled:", 0);

    -[BFFFinishSetupViewController _startNextFlowIdentifier](self, "_startNextFlowIdentifier");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v5 = -[BFFFinishSetupViewController isBeingDismissed](self, "isBeingDismissed");
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = v5;
    _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup viewDidDisappear: isBeingDismissed %d", buf, 8u);
  }

  v10.receiver = self;
  v10.super_class = (Class)BFFFinishSetupViewController;
  -[BFFFinishSetupViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE85890], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBasicFunctionalityEnabled:", 1);

    -[BFFFinishSetupViewController flowSkipController](self, "flowSkipController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelPendingFlows");

    -[BFFFinishSetupViewController analyticsManager](self, "analyticsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "commit");

  }
}

- (int64_t)preferredStatusBarStyle
{
  return -[BFFNavigationController preferredStatusBarStyle](self->_navigationController, "preferredStatusBarStyle");
}

- (void)_startNextFlowIdentifier
{
  id v3;

  -[BFFFinishSetupViewController _flowControllerForNextFlowIdentifier](self, "_flowControllerForNextFlowIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[BFFFinishSetupViewController _presentPreconditionViewControllerIfNecessaryForFlowController:](self, "_presentPreconditionViewControllerIfNecessaryForFlowController:"))-[BFFFinishSetupViewController _didSatisfyPreconditionsForFlowController:](self, "_didSatisfyPreconditionsForFlowController:", v3);

}

- (BOOL)_presentPreconditionViewControllerIfNecessaryForFlowController:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *navigationController;
  id v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  BFFFinishSetupViewController *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __95__BFFFinishSetupViewController__presentPreconditionViewControllerIfNecessaryForFlowController___block_invoke;
    v13[3] = &unk_24D2344E8;
    v16 = &v17;
    v5 = v4;
    v14 = v5;
    v15 = self;
    objc_msgSend(v5, "preconditionViewControllerWithCompletion:", v13);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v18[5];
    v18[5] = v6;

    if (v18[5])
    {
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        _os_log_impl(&dword_214875000, v8, OS_LOG_TYPE_DEFAULT, "Finish setup will present precondition view controller for  %@", buf, 0xCu);
      }

      navigationController = self->_navigationController;
      if (!navigationController)
        navigationController = self;
      v10 = navigationController;
      objc_msgSend(v10, "presentViewController:animated:completion:", v18[5], 1, 0);

    }
  }
  v11 = v18[5] != 0;
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __95__BFFFinishSetupViewController__presentPreconditionViewControllerIfNecessaryForFlowController___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __95__BFFFinishSetupViewController__presentPreconditionViewControllerIfNecessaryForFlowController___block_invoke_2;
  v9[3] = &unk_24D2344C0;
  v7 = *(id *)(a1 + 32);
  v13 = a2;
  v10 = v7;
  v11 = v5;
  v12 = *(_OWORD *)(a1 + 40);
  v8 = v5;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

}

void __95__BFFFinishSetupViewController__presentPreconditionViewControllerIfNecessaryForFlowController___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v9 = 138412802;
    v10 = v4;
    v11 = 1024;
    v12 = v3;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_214875000, v2, OS_LOG_TYPE_DEFAULT, "Finish setup did complete precondition view controller for %@ with precondition satisfied %d completed identifiers %@", (uint8_t *)&v9, 0x1Cu);
  }

  v6 = *(void **)(a1 + 48);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v6, "_didSatisfyPreconditionsForFlowController:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v6, "_flowDidFinishForIdentifiers:result:", *(_QWORD *)(a1 + 40), 1);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (void)_didSatisfyPreconditionsForFlowController:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  v5 = objc_msgSend(v4, "controllerNeedsToRun");
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v11 = v5;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup did observe needsToRun %d for %@", buf, 0x12u);
  }

  if (!v5)
  {
    -[NSMutableArray firstObject](self->_flowIdentifiers, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFFinishSetupViewController _flowDidFinishForIdentifiers:result:](self, "_flowDidFinishForIdentifiers:result:", v8, 1);

  }
  else
  {
LABEL_5:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[BFFFinishSetupViewController _performExtendedInitializationForFlowController:](self, "_performExtendedInitializationForFlowController:", v4);
    else
      -[BFFFinishSetupViewController _didSatisfyInitializationForFlowController:](self, "_didSatisfyInitializationForFlowController:", v4);
  }

}

- (void)_performExtendedInitializationForFlowController:(id)a3
{
  id v4;
  NSObject *v5;
  BFFSpinnerController *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BFFFinishSetupViewController *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_214875000, v5, OS_LOG_TYPE_DEFAULT, "Finish setup will perform extended initialization for %@", buf, 0xCu);
  }

  v6 = -[OBSetupAssistantSpinnerController initWithSpinnerText:]([BFFSpinnerController alloc], "initWithSpinnerText:", &stru_24D234A48);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke;
  v8[3] = &unk_24D2341E0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  -[BFFFinishSetupViewController _pushViewControllerOntoNavigationController:completion:](self, "_pushViewControllerOntoNavigationController:completion:", v6, v8);

}

void __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_2;
  v4[3] = &unk_24D2341E0;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

void __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_214875000, v2, OS_LOG_TYPE_DEFAULT, "Finish setup extended initialization for %@ did reach the main queue", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_50;
  v7[3] = &unk_24D234510;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v5, "performExtendedInitializationWithCompletion:", v7);

}

void __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_50(int8x16_t *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  int8x16_t v10;
  _QWORD block[4];
  int8x16_t v12;
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[2].i64[0];
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    v17 = 1024;
    v18 = a2;
    _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup did perform extended initialization for %@ with success %d", buf, 0x12u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_51;
  block[3] = &unk_24D2343E0;
  v14 = a2;
  v10 = a1[2];
  v8 = (id)v10.i64[0];
  v12 = vextq_s8(v10, v10, 8uLL);
  v13 = v5;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __80__BFFFinishSetupViewController__performExtendedInitializationForFlowController___block_invoke_51(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_didSatisfyInitializationForFlowController:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3, "_flowDidFinishForIdentifiers:result:", *(_QWORD *)(a1 + 48), 1);
}

- (void)_didSatisfyInitializationForFlowController:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_214875000, v5, OS_LOG_TYPE_DEFAULT, "Finish setup will present view controller for  %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __75__BFFFinishSetupViewController__didSatisfyInitializationForFlowController___block_invoke;
  v11 = &unk_24D234538;
  v6 = v4;
  v12 = v6;
  objc_copyWeak(&v13, (id *)buf);
  objc_msgSend(v6, "viewControllerWithCompletion:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFinishSetupViewController _pushViewControllerOntoNavigationController:completion:](self, "_pushViewControllerOntoNavigationController:completion:", v7, 0, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __75__BFFFinishSetupViewController__didSatisfyInitializationForFlowController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v7;
    v11 = 2048;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Finish setup flow %@ did complete with result %lu completed identifiers %@", (uint8_t *)&v9, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_flowDidFinishForIdentifiers:result:", v5, a2);

}

- (void)_ensureNavigationControllerWithViewController:(id)a3 pushCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BFFFinishSetupModalNavigationController *navigationController;
  NSObject *v11;
  BFFFinishSetupModalNavigationController *v12;
  BFFFinishSetupModalNavigationController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  BFFFinishSetupModalNavigationController *v18;
  void *v19;
  int v20;
  BFFFinishSetupModalNavigationController *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_newRootViewController, a3);
  objc_msgSend(v7, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidesBackButton:", 1);

  navigationController = self->_navigationController;
  if (navigationController)
  {
    if (-[BFFFinishSetupModalNavigationController _isTransitioning](navigationController, "_isTransitioning"))
    {
      _BYLoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[BFFFinishSetupViewController _ensureNavigationControllerWithViewController:pushCompletion:].cold.1(v11);

    }
    -[BFFNavigationController pushViewController:completion:](self->_navigationController, "pushViewController:completion:", v7, v8);
  }
  else
  {
    v12 = objc_alloc_init(BFFFinishSetupModalNavigationController);
    v13 = self->_navigationController;
    self->_navigationController = v12;

    v22[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFFinishSetupModalNavigationController setViewControllers:](self->_navigationController, "setViewControllers:", v14);

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    -[BFFFinishSetupModalNavigationController setIsPad:](self->_navigationController, "setIsPad:", (v16 & 0xFFFFFFFFFFFFFFFBLL) == 1);
    _BYLoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_navigationController;
      v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_214875000, v17, OS_LOG_TYPE_DEFAULT, "did create _navigationController: %@", (uint8_t *)&v20, 0xCu);
    }

    +[BFFViewControllerSpinnerManager configureWithNavigationController:](BFFViewControllerSpinnerManager, "configureWithNavigationController:", self->_navigationController);
    -[BFFFinishSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_navigationController, 1, v8);
  }
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "applyThemeToNavigationController:", self->_navigationController);

}

- (void)_pushViewControllerOntoNavigationController:(id)a3 completion:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  if (a3)
  {
    -[BFFFinishSetupViewController _ensureNavigationControllerWithViewController:pushCompletion:](self, "_ensureNavigationControllerWithViewController:pushCompletion:", a3, a4);
  }
  else
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_214875000, v5, OS_LOG_TYPE_DEFAULT, "failed to create view controller for next flow! will complete", v6, 2u);
    }

    -[BFFFinishSetupViewController _complete](self, "_complete");
  }
}

- (id)_flowControllerForFlowIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void (**overrideFlowControllerGenerator)(id, void *);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = 0;
    goto LABEL_13;
  }
  overrideFlowControllerGenerator = (void (**)(id, void *))self->_overrideFlowControllerGenerator;
  if (!overrideFlowControllerGenerator
    || (overrideFlowControllerGenerator[2](overrideFlowControllerGenerator, v5),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE85828]))
    {
      +[BFFFinishSetupAssistantOptInController finishSetupAssistantOptInController](BFFFinishSetupAssistantOptInController, "finishSetupAssistantOptInController");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE85808]))
    {
      +[BFFFinishSetupAppleIDController finishSetupAppleIDController](BFFFinishSetupAppleIDController, "finishSetupAppleIDController");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE85810]))
      {
        if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE85830]))
        {
          +[BFFFinishSetupTouchIDController finishSetupTouchIDController](BFFFinishSetupTouchIDController, "finishSetupTouchIDController");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE85818]))
          {
            if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE85820]))
            {
              v7 = 0;
              goto LABEL_12;
            }
            +[BFFFinishSetupPasscodeController finishSetupPasscodeController](BFFFinishSetupPasscodeController, "finishSetupPasscodeController");
            v8 = objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          }
          +[BFFFinishSetupFaceIDController finishSetupFaceIDController](BFFFinishSetupFaceIDController, "finishSetupFaceIDController");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        v7 = (void *)v13;
        -[BFFFinishSetupViewController capabilities](self, "capabilities");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCapabilities:", v14);

        goto LABEL_12;
      }
      +[BFFFinishSetupPaymentController finishSetupPaymentControllerWithHost:](BFFFinishSetupPaymentController, "finishSetupPaymentControllerWithHost:", self);
      v8 = objc_claimAutoreleasedReturnValue();
    }
LABEL_11:
    v7 = (void *)v8;
  }
LABEL_12:
  -[BFFFinishSetupViewController flowSkipController](self, "flowSkipController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFlowSkipController:", v9);

  -[BFFFinishSetupViewController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaneFeatureAnalyticsManager:", v10);

LABEL_13:
  _BYLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_214875000, v11, OS_LOG_TYPE_DEFAULT, "Buddy followup did create flowController %@", (uint8_t *)&v15, 0xCu);
  }

  return v7;
}

- (id)_flowControllerForNextFlowIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray firstObject](self->_flowIdentifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFinishSetupViewController _flowControllerForFlowIdentifier:](self, "_flowControllerForFlowIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "prerequisiteFlowIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_214875000, v6, OS_LOG_TYPE_DEFAULT, "Buddy followup prerequisite flow identifier %@", (uint8_t *)&v9, 0xCu);
    }

    if (v5)
    {
      -[BFFFinishSetupViewController _flowControllerForFlowIdentifier:](self, "_flowControllerForFlowIdentifier:", v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }

  }
  return v4;
}

- (void)_flowDidFinishForIdentifiers:(id)a3 result:(unint64_t)a4
{
  int *v6;
  id v7;

  v7 = a3;
  -[NSMutableArray removeObjectsInArray:](self->_flowIdentifiers, "removeObjectsInArray:");
  switch(a4)
  {
    case 0uLL:
      v6 = &OBJC_IVAR___BFFFinishSetupViewController__completedFlowIdentifiers;
      goto LABEL_6;
    case 2uLL:
LABEL_9:
      -[BFFFinishSetupViewController _complete](self, "_complete");
      goto LABEL_10;
    case 1uLL:
      v6 = &OBJC_IVAR___BFFFinishSetupViewController__skippedFlowIdentifiers;
LABEL_6:
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "addObjectsFromArray:", v7);
      break;
  }
  if (!-[NSMutableArray count](self->_flowIdentifiers, "count"))
    goto LABEL_9;
  -[BFFFinishSetupViewController _startNextFlowIdentifier](self, "_startNextFlowIdentifier");
LABEL_10:

}

- (void)_complete
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  uint8_t buf[16];

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214875000, v3, OS_LOG_TYPE_DEFAULT, "Buddy followup will complete", buf, 2u);
  }

  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__BFFFinishSetupViewController__complete__block_invoke;
  v11[3] = &unk_24D2341B8;
  v11[4] = self;
  v5 = MEMORY[0x2199D7C3C](v11);
  v6 = (void *)v5;
  if (self->_navigationController)
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214875000, v7, OS_LOG_TYPE_DEFAULT, "Buddy followup will dismiss navigation controller", buf, 2u);
    }

    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __41__BFFFinishSetupViewController__complete__block_invoke_65;
    v9[3] = &unk_24D234370;
    v9[4] = self;
    v10 = v6;
    -[BFFFinishSetupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);

  }
  else
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214875000, v8, OS_LOG_TYPE_DEFAULT, "Buddy followup did complete", buf, 2u);
  }

}

void __41__BFFFinishSetupViewController__complete__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 1024);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1024);
    *(_QWORD *)(v4 + 1024) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 968) = 0;
}

uint64_t __41__BFFFinishSetupViewController__complete__block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v6[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214875000, v2, OS_LOG_TYPE_DEFAULT, "Buddy followup did dismiss navigation controller", v6, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 976);
  *(_QWORD *)(v3 + 976) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)didCompleteFlowInFinishSetup:(id)a3
{
  return -[NSMutableSet containsObject:](self->_completedFlowIdentifiers, "containsObject:", a3);
}

- (BOOL)didSkipFlowInFinishSetup:(id)a3
{
  return -[NSMutableSet containsObject:](self->_skippedFlowIdentifiers, "containsObject:", a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->_flowSkipController, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong(&self->_overrideFlowControllerGenerator, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_newRootViewController, 0);
  objc_storeStrong((id *)&self->_skippedFlowIdentifiers, 0);
  objc_storeStrong((id *)&self->_completedFlowIdentifiers, 0);
  objc_storeStrong((id *)&self->_flowIdentifiers, 0);
  objc_storeStrong((id *)&self->_followUpAction, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)_ensureNavigationControllerWithViewController:(os_log_t)log pushCompletion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214875000, log, OS_LOG_TYPE_ERROR, "Finish setup attempting to push view controller while transition in progress. Probably going to hang.", v1, 2u);
}

@end
