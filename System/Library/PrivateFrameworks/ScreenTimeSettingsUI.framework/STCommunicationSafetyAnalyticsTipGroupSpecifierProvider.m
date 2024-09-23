@implementation STCommunicationSafetyAnalyticsTipGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___STCommunicationSafetyAnalyticsTipGroupSpecifierProvider;
  v5 = a4;
  objc_msgSendSuper2(&v8, sel_providerWithCoordinator_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRootViewController:", v5, v8.receiver, v8.super_class);

  return v6;
}

- (STCommunicationSafetyAnalyticsTipGroupSpecifierProvider)init
{
  STCommunicationSafetyAnalyticsTipGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STCommunicationSafetyAnalyticsTipGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v8, sel_init);
  -[STGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
  v3 = (void *)MEMORY[0x24BE75590];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v6);
  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted"), "STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted"), "STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled"), "STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext");
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("viewModel.me.hasPasscode"));
  v6.receiver = self;
  v6.super_class = (Class)STCommunicationSafetyAnalyticsTipGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  if (v4)
    -[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider _setCommunicationSafetyAnalyticsTip](self, "_setCommunicationSafetyAnalyticsTip");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted"), 5, "STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted"), 5, "STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled"), 5, "STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.me.hasPasscode"), 5, "STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext");

}

- (void)_setCommunicationSafetyAnalyticsTip
{
  PSSpecifier *v3;
  PSSpecifier *communicationSafetyAnalyticsTipSpecifer;
  STCommunicationSafetyOnboardingController *v5;
  void *v6;
  STCommunicationSafetyOnboardingController *v7;
  uint64_t v8;
  STCommunicationSafetyOnboardingController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD aBlock[5];
  STCommunicationSafetyOnboardingController *v16;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 13, 0);
  v3 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  communicationSafetyAnalyticsTipSpecifer = self->_communicationSafetyAnalyticsTipSpecifer;
  self->_communicationSafetyAnalyticsTipSpecifer = v3;

  -[PSSpecifier setObject:forKeyedSubscript:](self->_communicationSafetyAnalyticsTipSpecifer, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  v5 = [STCommunicationSafetyOnboardingController alloc];
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STCommunicationSafetyOnboardingController initWithCoordinator:](v5, "initWithCoordinator:", v6);

  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke;
  aBlock[3] = &unk_24DB86588;
  aBlock[4] = self;
  v16 = v7;
  v9 = v7;
  v10 = _Block_copy(aBlock);
  v11 = _Block_copy(v10);
  -[PSSpecifier setObject:forKeyedSubscript:](self->_communicationSafetyAnalyticsTipSpecifer, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75900]);

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_38;
  v14[3] = &unk_24DB86440;
  v14[4] = self;
  v12 = _Block_copy(v14);
  v13 = _Block_copy(v12);
  -[PSSpecifier setObject:forKeyedSubscript:](self->_communicationSafetyAnalyticsTipSpecifer, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE759F0]);

}

void __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_2;
  v4[3] = &unk_24DB87368;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "presentOverViewController:skipFeatureEnablement:completionBlock:", v3, 1, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_2(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
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
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (a2 & 1) == 0)
  {
    v17 = WeakRetained;
    objc_msgSend(WeakRetained, "_acknowledgeTip");
    objc_msgSend(v17, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "communicationSafetyCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setIsCommunicationSafetyAnalyticsEnabled:", a4);
    objc_msgSend(v17, "coordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "communicationSafetyCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistCommunicationSafetySettingsWithCompletionHandler:", &__block_literal_global_9);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v17, "coordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCoordinator:", v13);

    objc_msgSend(v17, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setParentController:", v14);
    objc_msgSend(v14, "rootController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRootController:", v15);

    objc_msgSend(v17, "communicationSafetyAnalyticsTipSpecifer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSpecifier:", v16);

    objc_msgSend(v17, "showController:animated:", v12, 1);
    WeakRetained = v17;
  }

}

void __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v2 = a2;
  if (v2)
  {
    v3 = v2;
    +[STUILog communicationSafety](STUILog, "communicationSafety");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_3_cold_2((uint64_t)v3, v4);
LABEL_4:

    goto LABEL_10;
  }
  if (!_os_feature_enabled_impl())
  {
    v3 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BE84498], "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE84498], "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8 = objc_msgSend(v5, "saveContext:error:", v7, &v9);
  v3 = v9;

  if ((v8 & 1) == 0)
  {
    +[STUILog communicationSafety](STUILog, "communicationSafety");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_3_cold_1((uint64_t)v3, v4);
    goto LABEL_4;
  }
LABEL_10:

}

uint64_t __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_acknowledgeTip");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == "STCommunicationSafetyAnalyticsTipGroupSpecifierProviderObservationContext")
  {
    -[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider _showCommunicationSafetyAnalyticsTipIfNeeded](self, "_showCommunicationSafetyAnalyticsTipIfNeeded", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)STCommunicationSafetyAnalyticsTipGroupSpecifierProvider;
    -[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_showCommunicationSafetyAnalyticsTipIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "communicationSafetyCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCommunicationSafetyAnalyticsEnabled");

  if (v6)
  {
    -[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider _acknowledgeTip](self, "_acknowledgeTip");
    return;
  }
  if (-[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider _shouldShowAnalyticsTip](self, "_shouldShowAnalyticsTip"))
  {
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 0);
    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider communicationSafetyAnalyticsTipSpecifer](self, "communicationSafetyAnalyticsTipSpecifer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if ((v9 & 1) != 0)
      return;
    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider communicationSafetyAnalyticsTipSpecifer](self, "communicationSafetyAnalyticsTipSpecifer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v10);
  }
  else
  {
    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider communicationSafetyAnalyticsTipSpecifer](self, "communicationSafetyAnalyticsTipSpecifer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

    if (!v13)
      return;
    -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 1);
    -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[STCommunicationSafetyAnalyticsTipGroupSpecifierProvider communicationSafetyAnalyticsTipSpecifer](self, "communicationSafetyAnalyticsTipSpecifer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v10);
  }

}

- (BOOL)_shouldShowAnalyticsTip
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "communicationSafetyCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isCommunicationSafetySendingRestricted") & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v4, "isCommunicationSafetyReceivingRestricted") ^ 1;
  v7 = objc_msgSend(v4, "isCommunicationSafetyAnalyticsEnabled");
  v8 = 0;
  if ((v6 & 1) == 0 && (v7 & 1) == 0)
  {
    objc_msgSend(v5, "me");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dsid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[STCommunicationSafetyAnalyticsTipCell didAcknowledgeTipViewForDSID:](STCommunicationSafetyAnalyticsTipCell, "didAcknowledgeTipViewForDSID:", v11);

    v8 = !v12;
  }

  return v8;
}

- (void)_acknowledgeTip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", 1);
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "me");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[STCommunicationSafetyAnalyticsTipCell acknowledgeTipViewForDSID:](STCommunicationSafetyAnalyticsTipCell, "acknowledgeTipViewForDSID:", v6);
}

- (PSSpecifier)communicationSafetyAnalyticsTipSpecifer
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCommunicationSafetyAnalyticsTipSpecifer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (void)setRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_rootViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootViewController);
  objc_storeStrong((id *)&self->_communicationSafetyAnalyticsTipSpecifer, 0);
}

void __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_219AB4000, a2, OS_LOG_TYPE_FAULT, "Failed to save Communication Safety settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __94__STCommunicationSafetyAnalyticsTipGroupSpecifierProvider__setCommunicationSafetyAnalyticsTip__block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_219AB4000, a2, OS_LOG_TYPE_ERROR, "Could not save Communication Safety settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
