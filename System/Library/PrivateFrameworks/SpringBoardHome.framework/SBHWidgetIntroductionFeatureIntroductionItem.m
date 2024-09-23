@implementation SBHWidgetIntroductionFeatureIntroductionItem

- (SBHWidgetIntroductionFeatureIntroductionItem)init
{
  SBHWidgetIntroductionFeatureIntroductionItem *v2;
  SBHomeScreenDefaults *v3;
  SBHomeScreenDefaults *homeScreenDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetIntroductionFeatureIntroductionItem;
  v2 = -[SBHWidgetIntroductionFeatureIntroductionItem init](&v6, sel_init);
  if (v2)
  {
    v3 = (SBHomeScreenDefaults *)objc_alloc_init(MEMORY[0x1E0DA9F98]);
    homeScreenDefaults = v2->_homeScreenDefaults;
    v2->_homeScreenDefaults = v3;

  }
  return v2;
}

- (void)resetDefaultWidgetsUndoInfo
{
  NSMutableArray *v3;
  NSMutableArray *defaultWidgetsIconsRestoringRecordOriginalIndex;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *defaultWidgetsBumpedIconUsageRanking;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *defaultWidgetsIconsRestoringRecord;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  if (!self->_defaultWidgetsIconsRestoringRecordOriginalIndex)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    defaultWidgetsIconsRestoringRecordOriginalIndex = self->_defaultWidgetsIconsRestoringRecordOriginalIndex;
    self->_defaultWidgetsIconsRestoringRecordOriginalIndex = v3;

  }
  -[SBHWidgetIntroductionFeatureIntroductionItem defaultWidgetsIconsRestoringRecordOriginalIndex](self, "defaultWidgetsIconsRestoringRecordOriginalIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  if (!self->_defaultWidgetsBumpedIconUsageRanking)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    defaultWidgetsBumpedIconUsageRanking = self->_defaultWidgetsBumpedIconUsageRanking;
    self->_defaultWidgetsBumpedIconUsageRanking = v6;

  }
  -[SBHWidgetIntroductionFeatureIntroductionItem defaultWidgetsBumpedIconUsageRanking](self, "defaultWidgetsBumpedIconUsageRanking");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  if (!self->_defaultWidgetsIconsRestoringRecord)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    defaultWidgetsIconsRestoringRecord = self->_defaultWidgetsIconsRestoringRecord;
    self->_defaultWidgetsIconsRestoringRecord = v9;

  }
  -[SBHWidgetIntroductionFeatureIntroductionItem defaultWidgetsIconsRestoringRecord](self, "defaultWidgetsIconsRestoringRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  SBLogWidgetDiscoverabilityMigration();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "Clear onboarding widgets record", v13, 2u);
  }

}

- (id)defaultWidgetsIconsRestoringRecordKeyForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__18;
  v18 = __Block_byref_object_dispose__18;
  v19 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBHWidgetIntroductionFeatureIntroductionItem defaultWidgetsIconsRestoringRecord](self, "defaultWidgetsIconsRestoringRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__SBHWidgetIntroductionFeatureIntroductionItem_defaultWidgetsIconsRestoringRecordKeyForIcon___block_invoke;
    v11[3] = &unk_1E8D8C430;
    v12 = v4;
    v13 = &v14;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

    v6 = v12;
  }
  else
  {
    v7 = v15;
    v8 = v4;
    v6 = (void *)v7[5];
    v7[5] = (uint64_t)v8;
  }

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __93__SBHWidgetIntroductionFeatureIntroductionItem_defaultWidgetsIconsRestoringRecordKeyForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)deviceTypeSupportModalWidgetIntroduction
{
  void *v2;
  uint64_t v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  _BOOL8 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1 && SBHScreenTypeForCurrentDevice() != 0;
  SBLogWidgetDiscoverabilityMigration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Device type support onboarding = %ld", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)immediateDownloadSpringBoardHomeTrialSettingsWhenNeeded
{
  SBHTrialClientManager *trialClientManager;
  SBHTrialClientManager *v4;
  SBHTrialClientManager *v5;

  if (-[SBHWidgetIntroductionFeatureIntroductionItem deviceTypeSupportModalWidgetIntroduction](self, "deviceTypeSupportModalWidgetIntroduction"))
  {
    trialClientManager = self->_trialClientManager;
    if (!trialClientManager)
    {
      v4 = objc_alloc_init(SBHTrialClientManager);
      v5 = self->_trialClientManager;
      self->_trialClientManager = v4;

      trialClientManager = self->_trialClientManager;
    }
    -[SBHTrialClientManager immediatelyFetchSpringBoardHomeNamespace](trialClientManager, "immediatelyFetchSpringBoardHomeNamespace");
  }
}

- (BOOL)widgetDiscoverabilityServerSideEnabled
{
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[SBHWidgetIntroductionFeatureIntroductionItem trialClientManager](self, "trialClientManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBHWidgetIntroductionFeatureIntroductionItem trialClientManager](self, "trialClientManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "widgetDiscoverabilityGoSwitchEnabled");

  }
  else
  {
    v5 = 0;
  }
  SBLogWidgetDiscoverabilityMigration();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "Onboarding server side enabled = %ld", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (id)prewarmModalWidgetIntroductionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  SBModalWidgetIntroductionViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBModalWidgetIntroductionViewController *v13;
  uint8_t v15[16];

  v4 = a3;
  SBLogWidgetDiscoverabilityMigration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Prewarm modal widget discoverability introduction vc", v15, 2u);
  }

  -[SBHWidgetIntroductionFeatureIntroductionItem modalIntroductionViewController](self, "modalIntroductionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(SBModalWidgetIntroductionViewController);
    -[SBHWidgetIntroductionFeatureIntroductionItem setModalIntroductionViewController:](self, "setModalIntroductionViewController:", v7);

    -[SBHWidgetIntroductionFeatureIntroductionItem modalIntroductionViewController](self, "modalIntroductionViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setModalPresentationStyle:", 5);

  }
  -[SBHWidgetIntroductionFeatureIntroductionItem modalIntroductionViewController](self, "modalIntroductionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendDismissCompletion:", v4);

  -[SBHWidgetIntroductionFeatureIntroductionItem iconManager](self, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "captureHomeScreenOnboardingSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prepareModalWidgetIntroductionWidgetViewSnapshots");
  -[SBHWidgetIntroductionFeatureIntroductionItem modalIntroductionViewController](self, "modalIntroductionViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHomeScreenPreview:", v11);

  v13 = self->_modalIntroductionViewController;
  return v13;
}

- (void)animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion:(id)a3 dismissCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[SBHWidgetIntroductionFeatureIntroductionItem iconManager](self, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHWidgetIntroductionFeatureIntroductionItem deviceTypeSupportModalWidgetIntroduction](self, "deviceTypeSupportModalWidgetIntroduction")&& (-[SBHWidgetIntroductionFeatureIntroductionItem modalIntroductionViewController](self, "modalIntroductionViewController"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    if (v7)
    {
      -[SBHWidgetIntroductionFeatureIntroductionItem modalIntroductionViewController](self, "modalIntroductionViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendDismissCompletion:", v7);

    }
    SBLogWidgetDiscoverabilityMigration();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "Present modal widget discoverabilit introduction", buf, 2u);
    }

    objc_msgSend(v8, "rootViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIntroductionFeatureIntroductionItem modalIntroductionViewController](self, "modalIntroductionViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __143__SBHWidgetIntroductionFeatureIntroductionItem_animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion_dismissCompletion___block_invoke;
    v14[3] = &unk_1E8D84D28;
    v14[4] = self;
    v15 = v6;
    objc_msgSend(v12, "presentViewController:animated:completion:", v13, 0, v14);

  }
  else
  {
    -[SBHWidgetIntroductionFeatureIntroductionItem setModalIntroductionViewController:](self, "setModalIntroductionViewController:", 0);
    objc_msgSend(v8, "invalidateOnboardingWidgetPreviewViewControllers");
    objc_msgSend(v8, "enableUserInteractionForWidgetDiscoverability");
  }

}

uint64_t __143__SBHWidgetIntroductionFeatureIntroductionItem_animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion_dismissCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "modalIntroductionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayPreviewAndButton");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)prewarmModalWidgetIntroductionViewController
{
  id v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__SBHWidgetIntroductionFeatureIntroductionItem_prewarmModalWidgetIntroductionViewController__block_invoke;
  v3[3] = &unk_1E8D84C50;
  v3[4] = self;
  v2 = -[SBHWidgetIntroductionFeatureIntroductionItem prewarmModalWidgetIntroductionWithCompletion:](self, "prewarmModalWidgetIntroductionWithCompletion:", v3);
}

void __92__SBHWidgetIntroductionFeatureIntroductionItem_prewarmModalWidgetIntroductionViewController__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "iconManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayPronouncedContainerViewVisibility:isVertical:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "setModalIntroductionViewController:", 0);
  objc_msgSend(v2, "invalidateOnboardingWidgetPreviewViewControllers");

}

- (BOOL)overrideShouldAddDefaultWidgetsToHomeScreenWhenNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  -[SBHWidgetIntroductionFeatureIntroductionItem homeScreenDefaults](self, "homeScreenDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableModalWidgetDiscoverabilityForTesting");

  return v6;
}

- (NSString)featureIntroductionIdentifier
{
  return (NSString *)CFSTR("SBFeatureIntroductionLocationNone");
}

- (BOOL)shouldSetupFeatureIntroductionAtLocations:(unint64_t)a3
{
  void *v4;
  int v5;
  BOOL v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((a3 & 2) == 0)
    return 0;
  -[SBHWidgetIntroductionFeatureIntroductionItem homeScreenDefaults](self, "homeScreenDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldAddDefaultWidgetsToHomeScreen");

  v6 = -[SBHWidgetIntroductionFeatureIntroductionItem overrideShouldAddDefaultWidgetsToHomeScreenWhenNeeded](self, "overrideShouldAddDefaultWidgetsToHomeScreenWhenNeeded");
  v7 = -[SBHWidgetIntroductionFeatureIntroductionItem widgetDiscoverabilityIsRunning](self, "widgetDiscoverabilityIsRunning");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    v10 = (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v6;
    if ((v10 & 1) == 0)
      goto LABEL_7;
  }
  else if (!v6)
  {
LABEL_7:
    SBLogWidgetDiscoverabilityMigration();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109632;
      v13[1] = v5;
      v14 = 1024;
      v15 = 0;
      v16 = 1024;
      v17 = v7;
      _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "Should setup feature introduction userDefault = %d, testingOverride = %d, isRunning = %d.", (uint8_t *)v13, 0x14u);
    }

    return 0;
  }
  return !v7;
}

- (void)setupFeatureIntroductionAtLocations:(unint64_t)a3
{
  void *v4;
  id v5;

  -[SBHWidgetIntroductionFeatureIntroductionItem setWidgetDiscoverabilityIsRunning:](self, "setWidgetDiscoverabilityIsRunning:", 1);
  -[SBHWidgetIntroductionFeatureIntroductionItem iconManager](self, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "addDefaultWidgetsToHomeScreen"))
  {
    objc_msgSend(v5, "scrollToDefaultWidgets");
    -[SBHWidgetIntroductionFeatureIntroductionItem setShouldDisplayWidgetIntroduction:](self, "setShouldDisplayWidgetIntroduction:", 1);
  }
  else
  {
    -[SBHWidgetIntroductionFeatureIntroductionItem setWidgetDiscoverabilityIsRunning:](self, "setWidgetDiscoverabilityIsRunning:", 0);
    -[SBHWidgetIntroductionFeatureIntroductionItem setShouldDisplayWidgetIntroduction:](self, "setShouldDisplayWidgetIntroduction:", 0);
    -[SBHWidgetIntroductionFeatureIntroductionItem homeScreenDefaults](self, "homeScreenDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldAddDefaultWidgetsToHomeScreen:", 0);

  }
}

- (BOOL)shouldDisplayFeatureIntroductionAtLocations:(unint64_t)a3
{
  return (a3 & 4) != 0
      && -[SBHWidgetIntroductionFeatureIntroductionItem shouldDisplayWidgetIntroduction](self, "shouldDisplayWidgetIntroduction");
}

- (void)displayFeatureIntroductionAtLocations:(unint64_t)a3 presentCompletion:(id)a4 dismissCompletion:(id)a5
{
  char v6;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD);

  v6 = a3;
  v13 = (void (**)(_QWORD))a4;
  v8 = (void (**)(_QWORD))a5;
  if ((v6 & 0xC) != 0)
  {
    -[SBHWidgetIntroductionFeatureIntroductionItem iconManager](self, "iconManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_msgSend(v9, "displayPronouncedContainerViewVisibility:isVertical:", -[SBHWidgetIntroductionFeatureIntroductionItem forceShowWidgetIntroduction](self, "forceShowWidgetIntroduction"), -[SBHWidgetIntroductionFeatureIntroductionItem isVerticalWidgetIntroduction](self, "isVerticalWidgetIntroduction"));
      objc_msgSend(v9, "enableUserInteractionForWidgetDiscoverability");
      if (v13)
        v13[2](v13);
      if (v8)
        v8[2](v8);
    }
    else
    {
      -[SBHWidgetIntroductionFeatureIntroductionItem prewarmModalWidgetIntroductionViewController](self, "prewarmModalWidgetIntroductionViewController");
      -[SBHWidgetIntroductionFeatureIntroductionItem animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion:dismissCompletion:](self, "animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion:dismissCompletion:", v13, v8);
      -[SBHWidgetIntroductionFeatureIntroductionItem homeScreenDefaults](self, "homeScreenDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShouldAddDefaultWidgetsToHomeScreen:", 0);

    }
  }

}

- (BOOL)shouldPauseUserInteractionAtLocations:(unint64_t)a3
{
  return (a3 >> 2) & 1;
}

- (BOOL)shouldDeferAlertsAtLocations:(unint64_t)a3
{
  return (a3 >> 2) & 1;
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void)setIconManager:(id)a3
{
  objc_storeWeak((id *)&self->_iconManager, a3);
}

- (NSMutableArray)defaultWidgetsIconsRestoringRecordOriginalIndex
{
  return self->_defaultWidgetsIconsRestoringRecordOriginalIndex;
}

- (void)setDefaultWidgetsIconsRestoringRecordOriginalIndex:(id)a3
{
  objc_storeStrong((id *)&self->_defaultWidgetsIconsRestoringRecordOriginalIndex, a3);
}

- (NSMutableArray)defaultWidgetsBumpedIconUsageRanking
{
  return self->_defaultWidgetsBumpedIconUsageRanking;
}

- (void)setDefaultWidgetsBumpedIconUsageRanking:(id)a3
{
  objc_storeStrong((id *)&self->_defaultWidgetsBumpedIconUsageRanking, a3);
}

- (NSMutableDictionary)defaultWidgetsIconsRestoringRecord
{
  return self->_defaultWidgetsIconsRestoringRecord;
}

- (void)setDefaultWidgetsIconsRestoringRecord:(id)a3
{
  objc_storeStrong((id *)&self->_defaultWidgetsIconsRestoringRecord, a3);
}

- (BOOL)stopUpdatingDefaultWidgetsBumpedIconRecord
{
  return self->_stopUpdatingDefaultWidgetsBumpedIconRecord;
}

- (void)setStopUpdatingDefaultWidgetsBumpedIconRecord:(BOOL)a3
{
  self->_stopUpdatingDefaultWidgetsBumpedIconRecord = a3;
}

- (BOOL)isVerticalWidgetIntroduction
{
  return self->_isVerticalWidgetIntroduction;
}

- (void)setIsVerticalWidgetIntroduction:(BOOL)a3
{
  self->_isVerticalWidgetIntroduction = a3;
}

- (BOOL)forceShowWidgetIntroduction
{
  return self->_forceShowWidgetIntroduction;
}

- (void)setForceShowWidgetIntroduction:(BOOL)a3
{
  self->_forceShowWidgetIntroduction = a3;
}

- (SBModalWidgetIntroductionViewController)modalIntroductionViewController
{
  return self->_modalIntroductionViewController;
}

- (void)setModalIntroductionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_modalIntroductionViewController, a3);
}

- (NSDictionary)originalIconStateBeforeWidgetDiscoverability
{
  return self->_originalIconStateBeforeWidgetDiscoverability;
}

- (void)setOriginalIconStateBeforeWidgetDiscoverability:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SBHTrialClientManager)trialClientManager
{
  return self->_trialClientManager;
}

- (void)setTrialClientManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialClientManager, a3);
}

- (SBHomeScreenDefaults)homeScreenDefaults
{
  return self->_homeScreenDefaults;
}

- (BOOL)shouldDisplayWidgetIntroduction
{
  return self->_shouldDisplayWidgetIntroduction;
}

- (void)setShouldDisplayWidgetIntroduction:(BOOL)a3
{
  self->_shouldDisplayWidgetIntroduction = a3;
}

- (BOOL)widgetDiscoverabilityIsRunning
{
  return self->_widgetDiscoverabilityIsRunning;
}

- (void)setWidgetDiscoverabilityIsRunning:(BOOL)a3
{
  self->_widgetDiscoverabilityIsRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_trialClientManager, 0);
  objc_storeStrong((id *)&self->_originalIconStateBeforeWidgetDiscoverability, 0);
  objc_storeStrong((id *)&self->_modalIntroductionViewController, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsIconsRestoringRecord, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsBumpedIconUsageRanking, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsIconsRestoringRecordOriginalIndex, 0);
  objc_destroyWeak((id *)&self->_iconManager);
}

@end
