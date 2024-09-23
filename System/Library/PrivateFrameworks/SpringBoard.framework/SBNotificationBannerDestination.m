@implementation SBNotificationBannerDestination

- (BOOL)_isPresentingBannerInLongLook
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[SBNotificationBannerDestination _isPresentingBanner](self, "_isPresentingBanner");
  if (v3)
  {
    -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasCommittedToPresentingCustomContentProvidingViewController");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)_isPresentingBanner
{
  void *v2;
  BOOL v3;

  -[SBNotificationBannerDestination presentedPresentable](self, "presentedPresentable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BNPresentable)presentedPresentable
{
  return self->_presentedPresentable;
}

+ (id)_test_notificationRequestForBannerWithIcon
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
  id v11;
  SBNotificationBannerDestinationTestActionRunner *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC6008], "notificationRequestWithRequestDestination:", *MEMORY[0x1E0DC60B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v3, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v4, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v23[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIcons:", v10);

  objc_msgSend(v3, "setContent:", v8);
  v11 = objc_alloc_init(MEMORY[0x1E0DC5FB8]);
  v12 = objc_alloc_init(SBNotificationBannerDestinationTestActionRunner);
  objc_msgSend(v11, "setActionRunner:", v12);
  objc_msgSend(v11, "setShouldDismissNotification:", 1);
  objc_msgSend(v3, "setClearAction:", v11);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0DC5FB8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Action %lu"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v15);

  objc_msgSend(v14, "setActionRunner:", v12);
  objc_msgSend(v14, "setShouldDismissNotification:", 0);
  objc_msgSend(v13, "addObject:", v14);

  v16 = objc_alloc_init(MEMORY[0x1E0DC5FB8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Action %lu"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", v17);

  objc_msgSend(v16, "setActionRunner:", v12);
  objc_msgSend(v16, "setShouldDismissNotification:", 0);
  objc_msgSend(v13, "addObject:", v16);

  v21 = *MEMORY[0x1E0DC5F58];
  v22 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSupplementaryActions:", v18);

  return v3;
}

- (SBNotificationBannerDestination)init
{
  SBNotificationBannerDestination *v2;
  uint64_t v3;
  NSMutableSet *destinationObservers;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  NCNotificationManagementViewPresenter *v12;
  NCNotificationManagementViewPresenter *notificationManagementPresenter;
  void *v14;
  uint64_t v15;
  NCBannerTransitionBlockingPrototypeRecipe *transitionBlockingPrototypeRecipe;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBNotificationBannerDestination;
  v2 = -[SBNotificationBannerDestination init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    destinationObservers = v2->_destinationObservers;
    v2->_destinationObservers = (NSMutableSet *)v3;

    -[SBNotificationBannerDestination _setupSystemStateChangeNotifications](v2, "_setupSystemStateChangeNotifications");
    -[SBNotificationBannerDestination _setupTimers](v2, "_setupTimers");
    objc_msgSend((id)SBApp, "bannerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0DC6158]);
    objc_msgSend(MEMORY[0x1E0DC6158], "requesterIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerAuthority:forRequesterIdentifier:", v6, v7);

    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneDeactivationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "newAssertionWithReason:", 6);
    resignActiveAssertion = v2->_resignActiveAssertion;
    v2->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v10;

    v12 = (NCNotificationManagementViewPresenter *)objc_alloc_init(MEMORY[0x1E0DC6178]);
    notificationManagementPresenter = v2->_notificationManagementPresenter;
    v2->_notificationManagementPresenter = v12;

    -[NCNotificationManagementViewPresenter setDelegate:](v2->_notificationManagementPresenter, "setDelegate:", v2);
    +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:", v2);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6130]), "initWithNotificationAlertDestination:", v2);
    transitionBlockingPrototypeRecipe = v2->_transitionBlockingPrototypeRecipe;
    v2->_transitionBlockingPrototypeRecipe = (NCBannerTransitionBlockingPrototypeRecipe *)v15;

  }
  return v2;
}

- (void)setAssistantController:(id)a3
{
  SBAssistantController *v5;
  SBAssistantController *assistantController;
  SBAssistantController *v7;

  v5 = (SBAssistantController *)a3;
  assistantController = self->_assistantController;
  if (assistantController != v5)
  {
    v7 = v5;
    -[SBAssistantController removeObserver:](assistantController, "removeObserver:", self);
    objc_storeStrong((id *)&self->_assistantController, a3);
    -[SBAssistantController addObserver:](self->_assistantController, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setLockScreenManager:(id)a3
{
  SBLockScreenManager *v5;
  SBLockScreenManager *lockScreenManager;
  void *v7;
  void *v8;
  SBLockScreenManager *v9;

  v5 = (SBLockScreenManager *)a3;
  lockScreenManager = self->_lockScreenManager;
  if (lockScreenManager != v5)
  {
    v9 = v5;
    -[SBLockScreenManager coverSheetViewController](lockScreenManager, "coverSheetViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unregisterExternalBehaviorProvider:", self);

    objc_storeStrong((id *)&self->_lockScreenManager, a3);
    -[SBLockScreenManager coverSheetViewController](self->_lockScreenManager, "coverSheetViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerExternalBehaviorProvider:", self);

    v5 = v9;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SBNotificationBannerDestination setAssistantController:](self, "setAssistantController:", 0);
  -[SBNotificationBannerDestination setLockScreenManager:](self, "setLockScreenManager:", 0);
  -[BSInvalidatable invalidate](self->_biometricMatchingAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBNotificationBannerDestination;
  -[SBNotificationBannerDestination dealloc](&v3, sel_dealloc);
}

- (BOOL)_shouldForceDismisssIfStickyForReason:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dismissOverlays")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("SBBannerManagerDismissalReasonLock")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("performSleep")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("mainScreenAnimationController")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("assistantWillAppear"));
  }

  return v4;
}

- (BOOL)shouldDismissForReason:(id)a3 outReason:(id *)a4
{
  return -[SBNotificationBannerDestination _shouldDismissPresentedBannerPerformingPreludeForcingIfSticky:outReason:](self, "_shouldDismissPresentedBannerPerformingPreludeForcingIfSticky:outReason:", -[SBNotificationBannerDestination _shouldForceDismisssIfStickyForReason:](self, "_shouldForceDismisssIfStickyForReason:", a3), a4);
}

- (BOOL)isPresentingEmergencyNotification
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "revealsAdditionalContentOnPresentation")
    && -[SBNotificationBannerDestination _isPresentingBannerInLongLook](self, "_isPresentingBannerInLongLook"))
  {
    v5 = !-[SBNotificationBannerDestination _isDismissingLongLookForBanner](self, "_isDismissingLongLookForBanner");
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CGRect)presentedBannerScreenFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (-[SBNotificationBannerDestination _isPresentingBanner](self, "_isPresentingBanner"))
  {
    -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "notificationViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_lookView");
    }
    else
    {
      UIViewControllerFromPresentable();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "viewIfLoaded");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v10, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "screen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fixedCoordinateSpace");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertRect:toCoordinateSpace:", v21, v12, v14, v16, v18);
      v3 = v22;
      v4 = v23;
      v5 = v24;
      v6 = v25;

    }
  }
  v26 = v3;
  v27 = v4;
  v28 = v5;
  v29 = v6;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)presentModalBannerAndExpandForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Presenting and expanding modal banner for notification %{public}@", buf, 0xCu);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__SBNotificationBannerDestination_presentModalBannerAndExpandForNotificationRequest___block_invoke;
  v9[3] = &unk_1E8E9DED8;
  v9[4] = self;
  -[SBNotificationBannerDestination _postNotificationRequest:modal:completion:](self, "_postNotificationRequest:modal:completion:", v4, 0, v9);

}

void __85__SBNotificationBannerDestination_presentModalBannerAndExpandForNotificationRequest___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_presentedNotificationPresentableVC");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expandAndPlayMedia");

}

- (void)registerNotificationBannerDestinationObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBNotificationBannerDestination destinationObservers](self, "destinationObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)unregisterNotificationBannerDestinationObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBNotificationBannerDestination destinationObservers](self, "destinationObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (BOOL)isAlertDestination
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x1E0DC60B8];
}

- (BOOL)canReceiveNotificationRequest:(id)a3
{
  id v4;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  NSObject *log;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBNotificationBannerDestination _isPresentingStickyBanner](self, "_isPresentingStickyBanner")
    || -[SBNotificationBannerDestination isUserInteractionInProgress](self, "isUserInteractionInProgress"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = !-[SBNotificationBannerDestination _isInSetupMode](self, "_isInSetupMode");
  }
  v6 = -[SBNotificationBannerDestination _canReceiveNotificationRequestIfLocked:](self, "_canReceiveNotificationRequestIfLocked:", v4);
  v7 = -[SBNotificationBannerDestination _canReceiveNotificationRequestIfAmbientPresented:](self, "_canReceiveNotificationRequestIfAmbientPresented:", v4);
  v8 = v5 & v6 & v7;
  v9 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "un_logDigest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v12;
    v22 = 1024;
    v23 = -[SBNotificationBannerDestination _isPresentingStickyBanner](self, "_isPresentingStickyBanner");
    v24 = 1024;
    v25 = -[SBNotificationBannerDestination isUserInteractionInProgress](self, "isUserInteractionInProgress");
    v26 = 1024;
    v27 = -[SBNotificationBannerDestination _isInSetupMode](self, "_isInSetupMode");
    v28 = 1024;
    v29 = v6;
    v30 = 1024;
    v31 = v7;
    _os_log_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ can receive notification %{public}@: %{public}@ [ stickyVisible: %d isUserInteractionInProgress: %d inSetupMode: %d canReceiveNotificationRequestIfLocked: %d canReceiveIfAmbientPresented: %d ]", buf, 0x3Eu);

  }
  return v8;
}

- (void)postNotificationRequest:(id)a3
{
  -[SBNotificationBannerDestination _postNotificationRequest:modal:completion:](self, "_postNotificationRequest:modal:completion:", a3, 0, 0);
}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (-[SBNotificationBannerDestination _presentedBannerMatchesNotificationRequest:](self, "_presentedBannerMatchesNotificationRequest:", v4))
  {
    v5 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
      -[SBNotificationBannerDestination modifyNotificationRequest:].cold.1(v5, v4);
    -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setNotificationRequest:", v4);
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__SBNotificationBannerDestination_modifyNotificationRequest___block_invoke;
    v10[3] = &unk_1E8E9DED8;
    v11 = v7;
    v9 = v7;
    objc_msgSend(v8, "animateWithDuration:animations:", v10, 0.25);

  }
}

uint64_t __61__SBNotificationBannerDestination_modifyNotificationRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContent");
}

- (void)withdrawNotificationRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!-[SBNotificationBannerDestination _isPresentingBannerInLongLook](self, "_isPresentingBannerInLongLook")
    && -[SBNotificationBannerDestination _isPresentingStickyBanner](self, "_isPresentingStickyBanner")
    && -[SBNotificationBannerDestination _presentedBannerMatchesNotificationRequest:](self, "_presentedBannerMatchesNotificationRequest:", v4))
  {
    v5 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
      -[SBNotificationBannerDestination withdrawNotificationRequest:].cold.1(v5, v4);
    -[SBNotificationBannerDestination _dismissPresentedBannerOnly:reason:animated:forceIfSticky:](self, "_dismissPresentedBannerOnly:reason:animated:forceIfSticky:", 0, CFSTR("SBBannerRevocationReasonBannerDestinationWithdraw"), 1, 1);
  }

}

- (BOOL)handleHomeButtonPress
{
  BOOL v3;

  if (!-[SBNotificationBannerDestination _isPresentingBanner](self, "_isPresentingBanner")
    || !-[SBNotificationBannerDestination _isPresentingBannerInLongLook](self, "_isPresentingBannerInLongLook")
    && !-[SBNotificationBannerDestination _isPresentingStickyBanner](self, "_isPresentingStickyBanner"))
  {
    return 0;
  }
  -[SBNotificationBannerDestination _performCancelAction](self, "_performCancelAction");
  v3 = 1;
  -[SBNotificationBannerDestination _dismissPresentedBannerAnimated:reason:forceIfSticky:](self, "_dismissPresentedBannerAnimated:reason:forceIfSticky:", 1, CFSTR("SBBannerRevocationReasonBannerDestinationHomeButtonPress"), 1);
  return v3;
}

- (void)prepareDestinationToReceiveCriticalNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  if (-[SBNotificationBannerDestination _isPresentingBannerInLongLook](self, "_isPresentingBannerInLongLook", a3)
    || -[SBNotificationBannerDestination _isPresentingStickyBanner](self, "_isPresentingStickyBanner"))
  {
    -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "revealsAdditionalContentOnPresentation");

    if ((v6 & 1) == 0)
    {
      -[SBNotificationBannerDestination _performCancelAction](self, "_performCancelAction");
      -[SBNotificationBannerDestination _dismissPresentedBannerAnimated:reason:forceIfSticky:](self, "_dismissPresentedBannerAnimated:reason:forceIfSticky:", 1, CFSTR("SBBannerRevocationReasonBannerDestinationCriticalRequest"), 1);
    }
  }
}

- (void)destinationDidBecomeDisabled
{
  -[SBNotificationBannerDestination _dismissPresentedBannerOnly:reason:animated:forceIfSticky:](self, "_dismissPresentedBannerOnly:reason:animated:forceIfSticky:", 0, CFSTR("SBBannerRevocationReasonBannerDestinationDisabled"), 1, 1);
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isContentExtensionVisible:", v4);

  return v7;
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD);
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable %{public}@ will NOT appear as banner with reason '%{public}@'", (uint8_t *)&v12, 0x20u);

  }
  -[SBNotificationBannerDestination _cancelReplaceAndDismissTimers](self, "_cancelReplaceAndDismissTimers");
  -[SBNotificationBannerDestination _dismissPresentableCompleted:](self, "_dismissPresentableCompleted:", v6);
  objc_getAssociatedObject(v6, &_SBNotificationBannerDestinationBannerRequestCompletion);
  v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, &_SBNotificationBannerDestinationBannerRequestCompletion, 0, (void *)1);
  if (v11)
    v11[2](v11);

}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v8;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable will appear as banner: %{public}@", buf, 0x16u);

  }
  -[SBNotificationBannerDestination _cancelReplaceAndDismissTimers](self, "_cancelReplaceAndDismissTimers");
  -[SBNotificationBannerDestination _requestFromPresentable:](self, "_requestFromPresentable:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotificationBannerDestination.m"), 336, CFSTR("Presentable doesn't have a notification request: %@"), v5);

  }
  objc_msgSend((id)SBApp, "bannerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowSceneForPresentable:", self->_presentedPresentable);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bannerWindowInWindowScene:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sb_coronaAnimationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addParticipant:", self);

  -[SBNotificationBannerDestination delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "destination:willPresentNotificationRequest:suppressAlerts:", self, v9, 0);

  -[SBNotificationBannerDestination _requestBiometricAuthIfAmbientPresentedForNotificationRequest:](self, "_requestBiometricAuthIfAmbientPresentedForNotificationRequest:", v9);
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v5;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  BSInvalidatable *v14;
  BSInvalidatable *idleTimerDisableAssertion;
  id WeakRetained;
  void (**v17)(_QWORD);
  void *v18;
  uint64_t v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x1E0DC5F70];
  v7 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    v28 = 2114;
    v29 = v5;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable did appear as banner: %{public}@", buf, 0x16u);

  }
  -[SBNotificationBannerDestination _requestFromPresentable:](self, "_requestFromPresentable:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotificationBannerDestination.m"), 346, CFSTR("Presentable doesn't have a notification request: %@"), v5);

  }
  objc_msgSend(v10, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "dismissAutomatically");

  if (v12)
    -[SBNotificationBannerDestination _startReplaceAndDismissTimersForRequest:](self, "_startReplaceAndDismissTimersForRequest:", v10);
  if (-[SBNotificationBannerDestination isPreventingAutomaticLock](self, "isPreventingAutomaticLock"))
  {
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "acquireIdleTimerDisableAssertionForReason:", CFSTR("SBNotificationBannerDestination"));
    v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
    self->_idleTimerDisableAssertion = v14;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "destination:didPresentNotificationRequest:", self, v10);
  objc_getAssociatedObject(v5, &_SBNotificationBannerDestinationBannerRequestCompletion);
  v17 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v5, &_SBNotificationBannerDestinationBannerRequestCompletion, 0, (void *)1);
  if (v17)
    v17[2](v17);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "backlightState");

    if (v19 == 1)
    {
      -[SBNotificationBannerDestination _notificationViewControllerFromPresentable:](self, "_notificationViewControllerFromPresentable:", v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setContentReplacedWithSnapshot:", 1);

    }
    else
    {
      objc_storeWeak((id *)&self->_presentablePendingSnapshot, v5);
      v21 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        -[SBNotificationBannerDestination identifier](self, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        SBBacklightStateDescription(v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        v28 = 2114;
        v29 = v24;
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ reduce transparency enabled, but backlight factor is %{public}@ – deferring", buf, 0x16u);

      }
    }
  }

}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  BNPresentable *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BSInvalidatable *bannerGestureRecognizerPriorityAssertion;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  BNPresentable *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (BNPresentable *)a3;
  v8 = a4;
  v9 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v11;
    v17 = 2114;
    v18 = v7;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable %{public}@ will disappear as banner with reason '%{public}@'", buf, 0x20u);

  }
  if (self->_presentedPresentable == v7)
  {
    -[BSInvalidatable invalidate](self->_bannerGestureRecognizerPriorityAssertion, "invalidate");
    bannerGestureRecognizerPriorityAssertion = self->_bannerGestureRecognizerPriorityAssertion;
    self->_bannerGestureRecognizerPriorityAssertion = 0;

    -[SBNotificationBannerDestination _requestFromPresentable:](self, "_requestFromPresentable:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotificationBannerDestination.m"), 377, CFSTR("Presentable doesn't have a notification request: %@"), v7);

    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SBBannerManagerDismissalReasonLock")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("performSleep")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D01030]) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D01038]))
    {
      -[SBNotificationBannerDestination _performSilenceAction](self, "_performSilenceAction");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("assistantWillAppear")) & 1) != 0
           || (objc_msgSend(v8, "isEqualToString:", CFSTR("dismissOverlays")) & 1) != 0
           || objc_msgSend(v8, "isEqualToString:", CFSTR("SBBannerRevocationReasonBannerDestinationDisabled")))
    {
      -[SBNotificationBannerDestination _performCancelAction](self, "_performCancelAction");
    }

  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  BNPresentable *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  BSInvalidatable *idleTimerDisableAssertion;
  BSInvalidatable *v15;
  BSInvalidatable *starModeDisableAssertion;
  BSInvalidatable *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  BNPresentable *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = (BNPresentable *)a3;
  v8 = a4;
  v9 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v11;
    v21 = 2114;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable %{public}@ did disappear as banner with reason '%{public}@'", buf, 0x20u);

  }
  if (self->_presentedPresentable == v7)
  {
    -[SBNotificationBannerDestination _requestFromPresentable:](self, "_requestFromPresentable:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotificationBannerDestination.m"), 390, CFSTR("Presentable doesn't have a notification request: %@"), v7);

    }
    if (!-[SBNotificationBannerDestination _isPresentingBannerInLongLook](self, "_isPresentingBannerInLongLook"))
      -[SBNotificationBannerDestination _cancelReplaceAndDismissTimers](self, "_cancelReplaceAndDismissTimers");
    -[SBNotificationBannerDestination _dismissPresentableCompleted:](self, "_dismissPresentableCompleted:", v7);
    -[SBNotificationBannerDestination delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "destination:didDismissNotificationRequest:", self, v12);

    -[SBNotificationBannerDestination _updateMotionGestureObservation](self, "_updateMotionGestureObservation");
    idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
    if (idleTimerDisableAssertion)
    {
      -[BSInvalidatable invalidate](idleTimerDisableAssertion, "invalidate");
      v15 = self->_idleTimerDisableAssertion;
      self->_idleTimerDisableAssertion = 0;

    }
    starModeDisableAssertion = self->_starModeDisableAssertion;
    if (starModeDisableAssertion)
    {
      -[BSInvalidatable invalidate](starModeDisableAssertion, "invalidate");
      v17 = self->_starModeDisableAssertion;
      self->_starModeDisableAssertion = 0;

    }
    -[SBNotificationBannerDestination _invalidateBiometricAuthIfNecessary](self, "_invalidateBiometricAuthIfNecessary");

  }
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable will begin user interaction: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBNotificationBannerDestination _userInteractionWillBeginForRequestPresenter:](self, "_userInteractionWillBeginForRequestPresenter:", v4);

}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable did end user interaction: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBNotificationBannerDestination _userInteractionDidEndForRequestPresenter:](self, "_userInteractionDidEndForRequestPresenter:", v4);

}

- (BOOL)notificationPresentableViewControllerShouldPresentLongLook:(id)a3
{
  return objc_msgSend(a3, "bs_isAppearingOrAppeared");
}

- (void)notificationPresentableViewController:(id)a3 presentationSize:(CGSize *)a4 containerSize:(CGSize *)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  CGFloat v32;
  CGFloat v33;
  id v34;

  if (a5)
  {
    v7 = (void *)SBApp;
    v8 = a3;
    objc_msgSend(v7, "bannerManager");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "windowSceneForPresentable:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend((id)SBApp, "windowSceneManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activeDisplayWindowScene");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v34, "bannerWindowInWindowScene:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    a5->width = v18;
    a5->height = v20;
    if (a4)
    {
      objc_msgSend(v34, "layoutManagerInWindowScene:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "screen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "useableContainerFrameInContainerBounds:onScreen:", v22, v14, v16, v18, v20);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      objc_msgSend(v22, "scale");
      objc_msgSend(v21, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v28, v30, v24, v26, v28, v30, *(_QWORD *)&v14, *(_QWORD *)&v16, *(_QWORD *)&v18, *(_QWORD *)&v20, v31);
      a4->width = v32;
      a4->height = v33;

    }
  }
}

- (id)notificationRequestPresenter:(id)a3 staticContentProviderForNotificationRequest:(id)a4
{
  id *v4;
  id *v5;
  id v8;
  id v9;
  char isKindOfClass;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[2];
  id v18;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __108__SBNotificationBannerDestination_notificationRequestPresenter_staticContentProviderForNotificationRequest___block_invoke;
    v16[3] = &unk_1E8EA8CF8;
    v11 = v16;
    v4 = (id *)v17;
    v17[0] = v8;
    v17[1] = self;
    v5 = &v18;
    v12 = 0;
    v18 = v9;
  }
  else
  {
    v12 = objc_opt_class();
    v11 = 0;
  }
  v13 = (void *)MEMORY[0x1D17E5550](v11);
  -[SBNotificationBannerDestination _staticContentProviderForViewController:class:notificationRequest:test:](self, "_staticContentProviderForViewController:class:notificationRequest:test:", v8, v12, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
  {

  }
  return v14;
}

uint64_t __108__SBNotificationBannerDestination_notificationRequestPresenter_staticContentProviderForNotificationRequest___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;

  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "_isContentSuppressedForNotificationRequest:", *(_QWORD *)(a1 + 48))
    && (objc_msgSend(v2, "hasCommittedToPresentingCustomContentProvidingViewController") & 1) == 0)
  {
    v3 = objc_msgSend(v2, "isShortLook");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)notificationRequestPresenter:(id)a3 shouldTransitionToStage:(id)a4 forTrigger:(int64_t)a5 completionBlock:(id)a6
{
  id *v6;
  id v11;
  id *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  int64_t v19;
  id *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id *v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[4];
  _QWORD v34[2];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (id *)a4;
  v27 = a6;
  v13 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NCStringFromStageChangeTrigger();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v36 = v15;
    v37 = 2114;
    v38 = v11;
    v39 = 2114;
    v40 = v12;
    v41 = 2114;
    v42 = v16;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ request presenter '%{public}@' requesting transition to stage '%{public}@' for triger '%{public}@'", buf, 0x2Au);

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "notificationRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v19 = a5;
  v26 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke;
    v33[3] = &unk_1E8E9EA50;
    v20 = (id *)v34;
    v34[0] = v11;
    v34[1] = self;
    v21 = (void *)MEMORY[0x1D17E5550](v33);
    v22 = v27;
  }
  else
  {
    v23 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke_43;
    v31[3] = &unk_1E8E9EA50;
    v20 = (id *)v32;
    v24 = v11;
    v32[0] = v24;
    v32[1] = self;
    v21 = (void *)MEMORY[0x1D17E5550](v31);
    v28[0] = v23;
    v28[1] = 3221225472;
    v28[2] = __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke_46;
    v28[3] = &unk_1E8E9F230;
    v22 = v28;
    v12 = &v29;
    v29 = v24;
    v6 = (id *)&v30;
    v30 = v27;
  }
  v25 = (void *)MEMORY[0x1D17E5550](v22);
  -[SBNotificationBannerDestination _handleExpansionRequestForViewController:notificationRequest:forTrigger:test:completionBlock:](self, "_handleExpansionRequestForViewController:notificationRequest:forTrigger:test:completionBlock:", v11, v18, v19, v21, v25);

  if ((isKindOfClass & 1) == 0)
  {

  }
}

uint64_t __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_presentedNotificationPresentableVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v2 == v4
    && ((objc_msgSend(v3, "bs_isDisappearingOrDisappeared") & 1) != 0
     || objc_msgSend(v3, "bannerAppearState") == 3
     || !objc_msgSend(v3, "bannerAppearState")))
  {
    v7 = (void *)*MEMORY[0x1E0DC5F70];
    v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v7;
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presentable requesting finishing long look transition, but is disappearing or disappeared: %{public}@", (uint8_t *)&v12, 0x16u);

      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke_43(uint64_t a1)
{
  _BOOL4 v2;
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(*(id *)(a1 + 32), "bannerStage") > 1;
  v3 = objc_msgSend(*(id *)(a1 + 32), "bs_isDisappearingOrDisappeared") | v2;
  if (v3 == 1)
  {
    v4 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 40);
      v6 = v4;
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ request presenter requesting transition to detail stage, but is disappearing or already transitioned: %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  return v3 ^ 1u;
}

uint64_t __115__SBNotificationBannerDestination_notificationRequestPresenter_shouldTransitionToStage_forTrigger_completionBlock___block_invoke_46(uint64_t a1, int a2)
{
  if (a2 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "invalidateStaticContent");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)notificationRequestPresenter:(id)a3 executeAction:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  v14 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[__CFString count](v12, "count");
    v19 = CFSTR("{}");
    *(_DWORD *)buf = 138543875;
    v30 = v16;
    if (v18)
      v19 = v12;
    v31 = 2114;
    v32 = v17;
    v33 = 2113;
    v34 = v19;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ executing action %{public}@ with parameters %{private}@", buf, 0x20u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "notificationRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __104__SBNotificationBannerDestination_notificationRequestPresenter_executeAction_withParameters_completion___block_invoke;
  v25[3] = &unk_1E8E9E220;
  v25[4] = self;
  v26 = v20;
  v27 = v11;
  v28 = v13;
  v22 = v13;
  v23 = v11;
  v24 = v20;
  objc_msgSend(v21, "destination:executeAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v23, v24, 1, v12, v25);

}

uint64_t __104__SBNotificationBannerDestination_notificationRequestPresenter_executeAction_withParameters_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  if (!(_DWORD)a2 || (objc_msgSend(*(id *)(a1 + 32), "_isPresentingBannerInLongLook") & 1) != 0)
    goto LABEL_12;
  objc_msgSend(*(id *)(a1 + 40), "defaultAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == *(void **)(a1 + 48))
  {
    v10 = objc_msgSend(v4, "activationMode");

    if (v10 == 1)
      goto LABEL_12;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "displaysActionsInline") & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "supplementaryActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DC5F58]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 48)))
  {

    goto LABEL_11;
  }
  v9 = objc_msgSend(*(id *)(a1 + 48), "activationMode");

  if (v9 != 1)
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "_dismissPresentedBannerOnly:reason:animated:forceIfSticky:", 0, CFSTR("SBBannerRevocationReasonBannerDestinationBackgroundDefaultAction"), 1, 1);
LABEL_12:
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (id)notificationRequestPresenterNotificationUsageTrackingState:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0DC6108];
  -[SBNotificationBannerDestination identifier](self, "identifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)notificationRequestPresenter:(id)a3 didVendTransitionBlockingAssertion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SBNotificationBannerDestination *v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  -[SBNotificationBannerDestination _presentedNotificationRequestPresenter](self, "_presentedNotificationRequestPresenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[SBNotificationBannerDestination _cancelReplaceAndDismissTimers](self, "_cancelReplaceAndDismissTimers");
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __99__SBNotificationBannerDestination_notificationRequestPresenter_didVendTransitionBlockingAssertion___block_invoke;
    v9[3] = &unk_1E8EAFF30;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = self;
    objc_msgSend(v7, "addInvalidationBlock:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __99__SBNotificationBannerDestination_notificationRequestPresenter_didVendTransitionBlockingAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(void **)(a1 + 32);
  v7 = WeakRetained;
  objc_msgSend(WeakRetained, "_presentedNotificationRequestPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_startReplaceAndDismissTimersForRequest:", v6);

  }
}

- (void)notificationViewController:(id)a3 requestPermissionToExecuteAction:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  _BYTE v22[22];
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  v14 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[__CFString count](v12, "count");
    v19 = CFSTR("{}");
    *(_DWORD *)v22 = 138543875;
    *(_QWORD *)&v22[4] = v16;
    if (v18)
      v19 = v12;
    *(_WORD *)&v22[12] = 2114;
    *(_QWORD *)&v22[14] = v17;
    v23 = 2113;
    v24 = v19;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ requesting permission to execute action %{public}@ with parameters %{private}@", v22, 0x20u);

  }
  objc_msgSend(v10, "notificationRequest", *(_OWORD *)v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "destination:requestPermissionToExecuteAction:forNotificationRequest:withParameters:completion:", self, v11, v20, v12, v13);

}

- (void)notificationViewControllerWillDismissForCancelAction:(id)a3
{
  -[NCNotificationManagementViewPresenter dismissManagementViewIfPresentedAnimated:](self->_notificationManagementPresenter, "dismissManagementViewIfPresentedAnimated:", 0);
}

- (void)notificationViewController:(id)a3 dragInteraction:(id)a4 sessionWillBegin:(id)a5
{
  objc_storeStrong((id *)&self->_notificationViewControllerForActiveDragSession, a3);
}

- (void)notificationViewController:(id)a3 dragInteraction:(id)a4 session:(id)a5 willEndWithOperation:(unint64_t)a6
{
  if ((a6 & 0xFFFFFFFFFFFFFFFELL) == 2)
    -[SBNotificationBannerDestination _dismissPresentedBannerAnimated:reason:forceIfSticky:](self, "_dismissPresentedBannerAnimated:reason:forceIfSticky:", 0, CFSTR("SBBannerRevocationReasonBannerDestinationDragAndDrop"), 1);
}

- (void)notificationViewController:(id)a3 dragInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6
{
  NCNotificationViewController *v7;
  NCNotificationViewController *v8;

  v7 = (NCNotificationViewController *)a3;
  if (self->_notificationViewControllerForActiveDragSession == v7)
  {
    self->_notificationViewControllerForActiveDragSession = 0;
    v8 = v7;

    v7 = v8;
  }

}

- (BOOL)notificationViewControllerShouldPan:(id)a3
{
  return 1;
}

- (BOOL)notificationViewControllerShouldInterpretTapAsDefaultAction:(id)a3
{
  return 1;
}

- (BOOL)notificationViewControllerShouldSupportExpandedPlatterInteraction:(id)a3
{
  return !-[SBNotificationBannerDestination _shouldAllowDragInteraction](self, "_shouldAllowDragInteraction", a3);
}

- (BOOL)notificationViewControllerShouldAllowExpandedPlatterInteraction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
    goto LABEL_2;
  if (!objc_msgSend(v5, "bs_isAppearingOrAppeared"))
  {
    v7 = 0;
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "bannerAppearState") == 1)
LABEL_2:
    v7 = 1;
  else
    v7 = objc_msgSend(v5, "bannerAppearState") == 2;
LABEL_3:

  return v7;
}

- (id)notificationViewControllerContainerViewProviderForExpandedContent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v8 = objc_alloc(MEMORY[0x1E0DAC288]);
    objc_msgSend(v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithRequester:containerView:reason:invalidationBlock:", v4, v9, CFSTR("Container view requested for notification banner"), 0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)notificationViewController:(id)a3 auxiliaryOptionsContentProviderForNotificationRequest:(id)a4 withLongLook:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a5;
  v7 = a4;
  objc_msgSend(v7, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNotificationBannerDestination _notificationSectionSettingsForSectionIdentifier:](self, "_notificationSectionSettingsForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUserConfigurable");

  v11 = 0;
  if (v10 && v5)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6170]), "initWithNotificationRequest:managementDelegate:", v7, self);

  return v11;
}

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBNotificationBannerDestination _shouldHideStatusBar](self, "_shouldHideStatusBar"))
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
    -[SBNotificationBannerDestination _setStatusBarsHidden:withDuration:](self, "_setStatusBarsHidden:withDuration:", 1);
  }
  -[SBNotificationBannerDestination resignActiveAssertion](self, "resignActiveAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_fbsDisplayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sb_acquireForDisplayIdentity:", v6);

  -[SBNotificationBannerDestination _cancelReplaceAndDismissTimers](self, "_cancelReplaceAndDismissTimers");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBNotificationBannerDestination destinationObservers](self, "destinationObservers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "notificationBannerDestinationWillPresentLongLook:", self);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)longLookDidPresentForNotificationViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Long look presented for notification %{public}@", buf, 0xCu);

  }
  objc_msgSend(v5, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "revealsAdditionalContentOnPresentation");

  if ((v11 & 1) != 0)
  {
    if (-[SBNotificationBannerDestination _isContentSuppressedForNotificationRequest:](self, "_isContentSuppressedForNotificationRequest:", v5))
    {
      objc_msgSend(v4, "invalidateContentProviders");
    }
  }
  else
  {
    -[SBNotificationBannerDestination _setReadyForNotificationRequestsCoalescingWith:](self, "_setReadyForNotificationRequestsCoalescingWith:", v5);
  }
  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sbWindowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason longLookDidPresentForNotificationViewController](SBKeyboardFocusArbitrationReason, "longLookDidPresentForNotificationViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestArbitrationForSBWindowScene:forReason:", v13, v14);

  -[SBNotificationBannerDestination lockScreenManager](self, "lockScreenManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coverSheetViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "externalBehaviorProviderBehaviorChanged:", self);

  -[SBNotificationBannerDestination _updateMotionGestureObservation](self, "_updateMotionGestureObservation");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SBNotificationBannerDestination destinationObservers](self, "destinationObservers", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v23, "notificationBannerDestinationDidPresentLongLook:", self);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
  }

}

- (void)longLookWillDismissForNotificationViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBNotificationBannerDestination _shouldHideStatusBar](self, "_shouldHideStatusBar"))
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
    -[SBNotificationBannerDestination _setStatusBarsHidden:withDuration:](self, "_setStatusBarsHidden:withDuration:", 0);
  }
  objc_msgSend(v4, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "revealsAdditionalContentOnPresentation");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "_lookView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBNotificationBannerDestination destinationObservers](self, "destinationObservers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "notificationBannerDestinationWillDismissLongLook:", self);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)longLookDidDismissForNotificationViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v9;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Long look dismissed for notification %{public}@", buf, 0xCu);

  }
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination:didDismissNotificationRequest:", self, v5);

  -[SBNotificationBannerDestination resignActiveAssertion](self, "resignActiveAssertion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relinquish");

  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sbWindowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason longLookDidDismissForNotificationViewController](SBKeyboardFocusArbitrationReason, "longLookDidDismissForNotificationViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestArbitrationForSBWindowScene:forReason:", v13, v14);

  -[SBNotificationBannerDestination lockScreenManager](self, "lockScreenManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coverSheetViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "externalBehaviorProviderBehaviorChanged:", self);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SBNotificationBannerDestination destinationObservers](self, "destinationObservers", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v22);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v23, "notificationBannerDestinationDidDismissLongLook:", self);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v20);
  }

  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "notificationViewController");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25 == v4)
  {
    -[BNPresentable requesterIdentifier](self->_presentedPresentable, "requesterIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationBannerDestination _revokeAllPresentablesWithRequesterIdentifier:reason:options:](self, "_revokeAllPresentablesWithRequesterIdentifier:reason:options:", v26, CFSTR("SBBannerRevocationReasonLongLookDismissal"), 1);

  }
}

- (void)fullScreenPresentableViewController:(id)a3 requestsDismissalWithReason:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = (void *)SBApp;
  v7 = a4;
  objc_msgSend(v6, "bannerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v8, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v9, v7, 0, 0, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (!v10)
  {
    v12 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      -[SBNotificationBannerDestination fullScreenPresentableViewController:requestsDismissalWithReason:].cold.1(v12, (uint64_t)v5, (uint64_t)v11);
  }

}

- (BOOL)fullScreenPresentableViewControllerShouldTransitionToDetailStageOnTap:(id)a3
{
  return 1;
}

- (void)didReceiveRaiseGesture
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_8(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_11();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v1, v4, "Destination %{public}@ received raise gesture", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)_updateMotionGestureObservation
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_8(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_11();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v1, v4, "Destination %{public}@ is listening to raise gesture", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__60;
  v11[4] = __Block_byref_object_dispose__60;
  v12 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v10[3] = &unk_1E8E9E868;
  v10[4] = self;
  v10[5] = v11;
  objc_msgSend(v7, "addAnimations:", v10);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_3;
  v9[3] = &unk_1E8EA6CA0;
  v9[4] = self;
  v9[5] = v11;
  objc_msgSend(v7, "addCompletion:", v9);
  _Block_object_dispose(v11, 8);

}

void __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_presentedNotificationPresentableVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "materialGroupNameBase");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(v12, "setContentReplacedWithSnapshot:", 0);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("-CoronaChange"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setMaterialGroupNameBase:", v8);
    }
    objc_msgSend(v12, "view", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
    v13[3] = &unk_1E8E9DED8;
    v14 = v9;
    v11 = v9;
    objc_msgSend(v10, "performWithoutAnimation:", v13);
    objc_msgSend(v11, "pl_performCrossFadeIfNecessary");

  }
}

uint64_t __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __101__SBNotificationBannerDestination_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_presentedNotificationPresentableVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setMaterialGroupNameBase:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)backlightController:(id)a3 didAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  BNPresentable **p_presentablePendingSnapshot;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (fabsf(a4 + -1.0) < 2.2204e-16)
  {
    p_presentablePendingSnapshot = &self->_presentablePendingSnapshot;
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentablePendingSnapshot);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        -[SBNotificationBannerDestination identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v10;
        v17 = 2114;
        v18 = WeakRetained;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ backlight is on, snapshotting presentable %{public}@", (uint8_t *)&v15, 0x16u);

      }
      objc_msgSend(WeakRetained, "notificationViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setContentReplacedWithSnapshot:", 1);

      objc_storeWeak((id *)p_presentablePendingSnapshot, 0);
    }
    else
    {
      v12 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        -[SBNotificationBannerDestination identifier](self, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ backlight is on, but no presentable pending snapshot", (uint8_t *)&v15, 0xCu);

      }
    }

  }
}

- (SBNotificationPresentableViewController)_presentedNotificationPresentableVC
{
  BNPresentable *presentedPresentable;
  uint64_t v3;
  BNPresentable *v4;
  BNPresentable *v5;
  BNPresentable *v6;

  presentedPresentable = self->_presentedPresentable;
  v3 = objc_opt_class();
  v4 = presentedPresentable;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return (SBNotificationPresentableViewController *)v6;
}

- (NCNotificationRequest)_presentedNotificationRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = v5;
  }
  else
  {
    -[BNPresentable notificationRequest](self->_presentedPresentable, "notificationRequest");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NCNotificationRequest *)v7;
}

- (id)_notificationViewControllerFromPresentable:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "notificationViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_requestFromPresentable:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBNotificationBannerDestination _notificationViewControllerFromPresentable:](self, "_notificationViewControllerFromPresentable:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "notificationRequest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)_presentedNotificationRequestPresenter
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[SBNotificationBannerDestination presentedPresentable](self, "presentedPresentable");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)_lockStateChanged
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[SBNotificationBannerDestination lockScreenManager](self, "lockScreenManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  if ((v4 & 1) == 0)
    -[SBNotificationBannerDestination _resetPresentTimer](self, "_resetPresentTimer");
  if (-[SBNotificationBannerDestination _isPresentingBannerWithHiddenPreview](self, "_isPresentingBannerWithHiddenPreview"))
  {
    -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "invalidateContentProviders");
  }
}

- (BOOL)_isUILocked
{
  void *v2;
  char v3;

  -[SBNotificationBannerDestination lockScreenManager](self, "lockScreenManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUILocked");

  return v3;
}

- (BOOL)_isDeviceAuthenticated
{
  void *v2;
  char v3;

  objc_msgSend((id)SBApp, "authenticationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  return v3;
}

- (void)_setupModeChanged
{
  if (!-[SBNotificationBannerDestination _isInSetupMode](self, "_isInSetupMode"))
    -[SBNotificationBannerDestination _resetPresentTimer](self, "_resetPresentTimer");
}

- (void)_setReadyForNotificationRequests
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ is now ready to receive notifications", (uint8_t *)&v8, 0xCu);

  }
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBNotificationBannerDestination _isUILocked](self, "_isUILocked"))
    objc_msgSend(v7, "destination:didBecomeReadyToReceiveNotificationsPassingTest:", self, &__block_literal_global_177);
  else
    objc_msgSend(v7, "destinationDidBecomeReadyToReceiveNotifications:", self);

}

uint64_t __67__SBNotificationBannerDestination__setReadyForNotificationRequests__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "requestDestinations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0DC60D0]);

  return v3;
}

- (void)_setReadyForNotificationRequestsCoalescingWith:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ is now ready to receive notifications coalescing with %{public}@", (uint8_t *)&v12, 0x16u);

  }
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "destination:didBecomeReadyToReceiveNotificationsCoalescedWith:", self, v4);

}

- (void)_postNotificationRequest:(id)a3 modal:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  id *v11;
  NSObject *v12;
  void *v13;
  int v14;
  int v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD block[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  _BYTE v34[10];
  __int16 v35;
  int v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v10 = _os_activity_create(&dword_1D0540000, "post-banner", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);

  v11 = (id *)MEMORY[0x1E0DC5F70];
  v12 = (id)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[SBNotificationBannerDestination identifier](self, "identifier");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "un_logDigest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v26;
    v33 = 2114;
    *(_QWORD *)v34 = v28;
    _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "Destination %{public}@ received notification %{public}@", buf, 0x16u);

  }
  objc_msgSend(v8, "alertOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldSuppress");

  v15 = objc_msgSend(v8, "sb_shouldSuppressAlert");
  v16 = -[SBNotificationBannerDestination _shouldScreenTimeSuppressNotificationRequest:](self, "_shouldScreenTimeSuppressNotificationRequest:", v8);
  if ((v14 | v15 | v16) != 1 || v6)
  {
    if (-[SBNotificationBannerDestination _isPresentingBannerInLongLook](self, "_isPresentingBannerInLongLook"))
    {
      v20 = *v11;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "notificationIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "un_logDigest");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        -[SBNotificationBannerDestination identifier](self, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2114;
        *(_QWORD *)v34 = v23;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Forwarding notification %{public}@ to long look banner %{public}@", buf, 0x16u);

      }
      -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "notificationViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "didForwardNotificationRequestToCustomContent:", v8);

    }
    else
    {
      -[SBNotificationBannerDestination _postPresentableForRequest:modal:completion:](self, "_postPresentableForRequest:modal:completion:", v8, v6, v9);
      -[SBNotificationBannerDestination _publishDidPresentBannerForNotificationRequest:](self, "_publishDidPresentBannerForNotificationRequest:", v8);
      if (!v6)
        -[SBNotificationBannerDestination _updateMotionGestureObservation](self, "_updateMotionGestureObservation");
    }
  }
  else
  {
    v17 = *v11;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "notificationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "un_logDigest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v32 = v19;
      v33 = 1024;
      *(_DWORD *)v34 = 1;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v15;
      v35 = 1024;
      v36 = v14;
      v37 = 1024;
      v38 = v16;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Banner for notification %{public}@ was dropped. suppressed: %d application: %d, do not disturb: %d screen time: %d", buf, 0x24u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__SBNotificationBannerDestination__postNotificationRequest_modal_completion___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  os_activity_scope_leave(&state);

}

uint64_t __77__SBNotificationBannerDestination__postNotificationRequest_modal_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setReadyForNotificationRequests");
}

- (BOOL)_presentedBannerMatchesNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    objc_msgSend(v5, "sectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldHideStatusBar
{
  BOOL v2;
  void *v3;

  if (SBFEffectiveHomeButtonType() == 2)
    return 0;
  if (__sb__runningInSpringBoard())
    return SBFEffectiveDeviceClass() != 2;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "userInterfaceIdiom") != 1;

  return v2;
}

- (void)_setStatusBarsHidden:(BOOL)a3 withDuration:(double)a4
{
  _BOOL4 v4;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("NO");
    if (v4)
      v11 = CFSTR("YES");
    v24 = 138412546;
    v25 = v9;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%@ is setting status bar hidden = %@", (uint8_t *)&v24, 0x16u);

  }
  -[SBNotificationBannerDestination appsStatusBarAssertion](self, "appsStatusBarAssertion");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = !v4;
  if (!v4 || v12)
  {
    if (!v12)
      v14 = 0;
    if (v14 == 1)
    {
      -[SBNotificationBannerDestination setAppsStatusBarAssertion:](self, "setAppsStatusBarAssertion:", 0);
      objc_msgSend(v13, "invalidate");
    }
  }
  else
  {
    objc_msgSend((id)SBApp, "bannerManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowSceneForPresentable:", self->_presentedPresentable);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "switcherController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requestInAppStatusBarHiddenAssertionForReason:animated:", CFSTR("SBNotificationBannerDestination"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationBannerDestination setAppsStatusBarAssertion:](self, "setAppsStatusBarAssertion:", v18);

  }
  +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assertionManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 12, v22);
    -[SBNotificationBannerDestination setSystemStatusBarAssertion:](self, "setSystemStatusBarAssertion:", v23);

  }
  else
  {
    -[SBNotificationBannerDestination setSystemStatusBarAssertion:](self, "setSystemStatusBarAssertion:", 0);
  }

}

- (void)setSystemStatusBarAssertion:(id)a3
{
  SBWindowSceneStatusBarSettingsAssertion *v4;
  SBWindowSceneStatusBarSettingsAssertion *v5;
  SBWindowSceneStatusBarSettingsAssertion *systemStatusBarAssertion;

  v4 = (SBWindowSceneStatusBarSettingsAssertion *)a3;
  v5 = v4;
  if (v4)
    -[SBWindowSceneStatusBarSettingsAssertion acquire](v4, "acquire");
  systemStatusBarAssertion = self->_systemStatusBarAssertion;
  self->_systemStatusBarAssertion = v5;

}

- (BOOL)_canReceiveNotificationRequestIfLocked:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[SBNotificationBannerDestination _isUILocked](self, "_isUILocked"))
  {
    objc_msgSend(v4, "requestDestinations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0DC60D0]);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)_isContentSuppressedForNotificationRequest:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[SBNotificationBannerDestination _isDeviceAuthenticated](self, "_isDeviceAuthenticated");
  objc_msgSend(v4, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "contentPreviewSetting");
  if (v5 && v7 == 2)
    return 1;
  else
    return (v7 != 0) & ~v5;
}

- (id)_notificationSectionSettingsForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSectionSettingsForDestination:forSectionIdentifier:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_notificationSystemSettings
{
  void *v3;
  void *v4;

  -[SBNotificationBannerDestination delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationSystemSettingsForDestination:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldAllowDragInteraction
{
  void *v3;
  _BOOL4 v4;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMedusaCapable"))
    v4 = !-[SBNotificationBannerDestination _isUILocked](self, "_isUILocked");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)_staticContentProviderForViewController:(id)a3 class:(Class)a4 notificationRequest:(id)a5 test:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v12 && !(*((unsigned int (**)(id))v12 + 2))(v12))
  {
    v15 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "staticContentProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v15 = (void *)objc_msgSend(v14, "copy")) == 0)
    {
      if (a4)
        v16 = a4;
      else
        v16 = (objc_class *)MEMORY[0x1E0DC6188];
      v15 = (void *)objc_msgSend([v16 alloc], "initWithNotificationRequest:", v11);
    }
    objc_msgSend(v15, "setDeviceAuthenticated:", -[SBNotificationBannerDestination _isDeviceAuthenticated](self, "_isDeviceAuthenticated"));
    objc_msgSend(v15, "setDelegate:", v10);

  }
  return v15;
}

- (void)_handleExpansionRequestForViewController:(id)a3 notificationRequest:(id)a4 forTrigger:(int64_t)a5 test:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  unsigned int (**v14)(_QWORD);
  void (**v15)(id, _QWORD);
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (unsigned int (**)(_QWORD))a6;
  v15 = (void (**)(id, _QWORD))a7;
  if (v14 && !v14[2](v14))
  {
LABEL_13:
    v15[2](v15, 0);
    goto LABEL_25;
  }
  v16 = -[SBNotificationBannerDestination _isAmbientPresented](self, "_isAmbientPresented");
  v17 = -[SBNotificationBannerDestination _isContentSuppressedForNotificationRequest:](self, "_isContentSuppressedForNotificationRequest:", v13);
  v18 = v17;
  if (!v16)
  {
    if (v17)
    {
LABEL_9:
      -[SBNotificationBannerDestination _requestUnlockForExpansionForViewController:notificationRequest:completionBlock:](self, "_requestUnlockForExpansionForViewController:notificationRequest:completionBlock:", v12, v13, v15);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (a5 == 4)
  {
    v19 = (void *)*MEMORY[0x1E0DC5F70];
    v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        v21 = v19;
        objc_msgSend(v13, "notificationIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "un_logDigest");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NCStringFromStageChangeTrigger();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543618;
        v42 = v23;
        v43 = 2114;
        v44 = v24;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Requesting unlock for expansion of request %{public}@ for trigger %{public}@ in Ambient", (uint8_t *)&v41, 0x16u);

      }
      goto LABEL_9;
    }
    if (v20)
    {
      v30 = v19;
      objc_msgSend(v13, "notificationIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "un_logDigest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NCStringFromStageChangeTrigger();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543618;
      v42 = v32;
      v43 = 2114;
      v44 = v33;
      _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "Expanding request %{public}@ for trigger %{public}@ in Ambient", (uint8_t *)&v41, 0x16u);

LABEL_23:
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (-[SBNotificationBannerDestination _isAmbientNotificationsPreviewOnTapOnly](self, "_isAmbientNotificationsPreviewOnTapOnly"))
  {
    v25 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      objc_msgSend(v13, "notificationIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "un_logDigest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NCStringFromStageChangeTrigger();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543618;
      v42 = v28;
      v43 = 2114;
      v44 = v29;
      _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Not expanding notification for request %{public}@ on trigger %{public}@ because previews are set to be shown on tap only in Ambient", (uint8_t *)&v41, 0x16u);

    }
    goto LABEL_13;
  }
  if (!v18)
  {
    v39 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v30 = v39;
      objc_msgSend(v13, "notificationIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "un_logDigest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543362;
      v42 = v32;
      _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "Expanding notification for request %{public}@ because content is not suppressed in Ambient", (uint8_t *)&v41, 0xCu);

      goto LABEL_23;
    }
LABEL_24:
    v15[2](v15, 1);
    goto LABEL_25;
  }
  v34 = -[SBNotificationBannerDestination _isDeviceAuthenticated](self, "_isDeviceAuthenticated");
  v35 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v36 = v35;
    objc_msgSend(v13, "notificationIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "un_logDigest");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138543618;
    v42 = v38;
    v43 = 1024;
    LODWORD(v44) = v34;
    _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEFAULT, "Checking expanding notification for request %{public}@ in Ambient [ isAuthenticated = %{BOOL}d ]", (uint8_t *)&v41, 0x12u);

  }
  v15[2](v15, v34);
  if (v34)
    -[SBNotificationBannerDestination _invalidateBiometricAuthIfNecessary](self, "_invalidateBiometricAuthIfNecessary");
LABEL_25:

}

- (void)_requestUnlockForExpansionForViewController:(id)a3 notificationRequest:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  SBLockScreenUnlockRequest *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v9, "notificationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "un_logDigest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v14;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Requesting unlock for expansion of request %{public}@", buf, 0xCu);

  }
  v15 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v15, "setSource:", 10);
  -[SBLockScreenUnlockRequest setIntent:](v15, "setIntent:", 2);
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenUnlockRequest setName:](v15, "setName:", v17);

  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v15, "setWantsBiometricPresentation:", 1);
  -[SBNotificationBannerDestination _cancelReplaceAndDismissTimers](self, "_cancelReplaceAndDismissTimers");
  objc_initWeak((id *)buf, self);
  -[SBNotificationBannerDestination lockScreenManager](self, "lockScreenManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __115__SBNotificationBannerDestination__requestUnlockForExpansionForViewController_notificationRequest_completionBlock___block_invoke;
  v21[3] = &unk_1E8EAFF98;
  v19 = v9;
  v22 = v19;
  objc_copyWeak(&v24, (id *)buf);
  v20 = v10;
  v23 = v20;
  objc_msgSend(v18, "unlockWithRequest:completion:", v15, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

uint64_t __115__SBNotificationBannerDestination__requestUnlockForExpansionForViewController_notificationRequest_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  uint64_t result;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 1024;
    v14 = a2;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Unlock request completed for request %{public}@ [ success = %{BOOL}d ]", (uint8_t *)&v11, 0x12u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_startReplaceAndDismissTimersForRequest:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_userInteractionWillBeginForRequestPresenter:(id)a3
{
  id v4;
  SBNotificationBannerDestination *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[SBNotificationBannerDestination isUserInteractionInProgress](v5, "isUserInteractionInProgress"))
  {
    -[SBNotificationBannerDestination setUserInteractionInProgress:](v5, "setUserInteractionInProgress:", 1);
    v6 = (id)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "notificationRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "notificationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "un_logDigest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "User interaction started for banner for request %{public}@", (uint8_t *)&v10, 0xCu);

    }
    if (!-[SBNotificationBannerDestination _isPresentingBannerInLongLook](v5, "_isPresentingBannerInLongLook"))
      -[SBNotificationBannerDestination _cancelReplaceAndDismissTimers](v5, "_cancelReplaceAndDismissTimers");
  }
  objc_sync_exit(v5);

}

- (void)_userInteractionDidEndForRequestPresenter:(id)a3
{
  id v4;
  SBNotificationBannerDestination *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[SBNotificationBannerDestination isUserInteractionInProgress](v5, "isUserInteractionInProgress"))
  {
    -[SBNotificationBannerDestination setUserInteractionInProgress:](v5, "setUserInteractionInProgress:", 0);
    v6 = (id)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "notificationRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "notificationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "un_logDigest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "User interaction ended for presenter for request %{public}@", (uint8_t *)&v11, 0xCu);

    }
    if (!-[SBNotificationBannerDestination _isPresentingBannerInLongLook](v5, "_isPresentingBannerInLongLook"))
    {
      objc_msgSend(v4, "notificationRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBNotificationBannerDestination _startReplaceAndDismissTimersForRequest:](v5, "_startReplaceAndDismissTimersForRequest:", v10);

    }
  }
  objc_sync_exit(v5);

}

- (id)_ambientPresentationController
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ambientPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isAmbientPresented
{
  void *v2;
  char v3;

  -[SBNotificationBannerDestination _ambientPresentationController](self, "_ambientPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresented");

  return v3;
}

- (BOOL)_isAmbientNotificationsPreviewOnTapOnly
{
  void *v2;
  char v3;

  -[SBNotificationBannerDestination _ambientPresentationController](self, "_ambientPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notificationsPreviewOnTapOnly");

  return v3;
}

- (BOOL)_canReceiveNotificationRequestIfAmbientPresented:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBNotificationBannerDestination _isAmbientPresented](self, "_isAmbientPresented"))
  {
    objc_msgSend(v4, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "suppressPresentationInAmbient");

    -[SBNotificationBannerDestination _ambientPresentationController](self, "_ambientPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "suppressNotificationPresentation");

    v9 = objc_msgSend(v4, "interruptionLevel");
    objc_msgSend(v4, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "revealsAdditionalContentOnPresentation");

    if (v9 == 3)
      v12 = 1;
    else
      v12 = v11;
    if (v6 | v8 ^ 1)
      v13 = v6 ^ 1;
    else
      v13 = v12;
    v14 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v9 == 3;
      v16 = v14;
      objc_msgSend(v4, "notificationIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "un_logDigest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544642;
      v21 = v18;
      v22 = 1024;
      v23 = v13;
      v24 = 1024;
      v25 = v6;
      v26 = 1024;
      v27 = v8;
      v28 = 1024;
      v29 = v15;
      v30 = 1024;
      v31 = v11;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Can receive request %{public}@ in ambient : %{BOOL}d [ requestSuppress:%{BOOL}d ; ambientSuppress:%{BOOL}d ; cri"
        "tical:%{BOOL}d ; emergency:%{BOOL}d ]",
        (uint8_t *)&v20,
        0x2Au);

    }
  }
  else
  {
    LOBYTE(v13) = 1;
  }

  return v13;
}

- (void)_requestBiometricAuthIfAmbientPresentedForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BSInvalidatable *biometricMatchingAssertion;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBNotificationBannerDestination _isAmbientPresented](self, "_isAmbientPresented")
    && -[SBNotificationBannerDestination _isContentSuppressedForNotificationRequest:](self, "_isContentSuppressedForNotificationRequest:", v4))
  {
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    biometricMatchingAssertion = self->_biometricMatchingAssertion;
    if (biometricMatchingAssertion)
    {
      objc_msgSend(v5, "resumeMatchingForAssertion:advisory:", biometricMatchingAssertion, 1);
    }
    else
    {
      v8 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        objc_msgSend(v4, "notificationIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "un_logDigest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v11;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Acquiring biometric matching assertion for notification presentation in Ambient for request %{public}@", (uint8_t *)&v14, 0xCu);

      }
      objc_msgSend(v6, "acquireMatchingAssertionWithMode:reason:", 3, CFSTR("SBNotificationBannerDestinationAmbientAuthentication"));
      v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v13 = self->_biometricMatchingAssertion;
      self->_biometricMatchingAssertion = v12;

    }
  }

}

- (void)_invalidateBiometricAuthIfNecessary
{
  NSObject *v3;
  BSInvalidatable *biometricMatchingAssertion;
  uint8_t v5[16];

  if (self->_biometricMatchingAssertion)
  {
    v3 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating biometric matching assertion for notification presentation in Ambient", v5, 2u);
    }
    -[BSInvalidatable invalidate](self->_biometricMatchingAssertion, "invalidate");
    biometricMatchingAssertion = self->_biometricMatchingAssertion;
    self->_biometricMatchingAssertion = 0;

  }
}

- (void)_publishDidPresentBannerForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SBNotificationBannerDestination destinationObservers](self, "destinationObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__SBNotificationBannerDestination__publishDidPresentBannerForNotificationRequest___block_invoke;
  v7[3] = &unk_1E8EAFFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __82__SBNotificationBannerDestination__publishDidPresentBannerForNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationBannerDestination:didPresentBannerForNotificationRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)_isPresentingStickyBanner
{
  void *v3;
  void *v4;
  int v5;

  -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBNotificationBannerDestination _isPresentingBanner](self, "_isPresentingBanner"))
  {
    objc_msgSend(v3, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "dismissAutomatically") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isShowingShortLookAtRest
{
  _BOOL4 v3;

  v3 = -[SBNotificationBannerDestination _isPresentingBanner](self, "_isPresentingBanner");
  if (v3)
  {
    if (-[SBNotificationBannerDestination _isPresentedBannerBeingDragged](self, "_isPresentedBannerBeingDragged"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[SBNotificationBannerDestination _isPresentingBannerInLongLook](self, "_isPresentingBannerInLongLook");
  }
  return v3;
}

- (BOOL)_isDismissingLongLookForBanner
{
  void *v3;
  void *v4;
  char v5;

  if (!-[SBNotificationBannerDestination _isPresentingBannerInLongLook](self, "_isPresentingBannerInLongLook"))
    return 1;
  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController");

  return v5;
}

- (BOOL)_isPresentedBannerBeingDragged
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[SBNotificationBannerDestination _isPresentingBanner](self, "_isPresentingBanner");
  if (v3)
  {
    -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDragging");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isPresentingBannerRequestingRaiseGesture
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[SBNotificationBannerDestination _isPresentingBanner](self, "_isPresentingBanner");
  if (v3)
  {
    -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "playMediaWhenRaised");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)_isPresentingBannerWithHiddenPreview
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL result;

  -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentPreviewSetting");

  result = -[SBNotificationBannerDestination _isPresentingBanner](self, "_isPresentingBanner");
  if (!v5)
    return 0;
  return result;
}

- (BOOL)_isPresentingBannerPreventingAutomaticLock
{
  void *v2;
  void *v3;
  char v4;

  -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventsAutomaticLock");

  return v4;
}

- (BOOL)_isInSetupMode
{
  void *v2;
  char v3;

  -[SBNotificationBannerDestination setupManager](self, "setupManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInSetupMode");

  return v3;
}

- (BOOL)_shouldScreenTimeSuppressNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "overridesDowntime") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBNotificationBannerDestination _shouldScreenTimeSuppressNotificationsForBundleIdentifier:](self, "_shouldScreenTimeSuppressNotificationsForBundleIdentifier:", v7);

  }
  return v6;
}

- (BOOL)_shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[SBNotificationBannerDestination _isBundleIdentifierBlockedForScreenTimeExpiration:](self, "_isBundleIdentifierBlockedForScreenTimeExpiration:", v4)|| -[SBNotificationBannerDestination _isBundleIdentifierBlockedForCommunicationPolicy:](self, "_isBundleIdentifierBlockedForCommunicationPolicy:", v4);

  return v5;
}

- (BOOL)_isBundleIdentifierBlockedForScreenTimeExpiration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isBlockedForScreenTimeExpiration");

  return (char)v3;
}

- (BOOL)_isBundleIdentifierBlockedForCommunicationPolicy:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[SBCommunicationPolicyManager sharedInstance](SBCommunicationPolicyManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldScreenTimeSuppressNotificationsForBundleIdentifier:", v3);

  return v5;
}

- (id)_notificationViewControllerForRequest:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;

  v4 = (objc_class *)MEMORY[0x1E0DC6198];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithNotificationRequest:revealingAdditionalContentOnPresentation:", v5, 0);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "addObserver:", self);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("-%lu"), ++_notificationViewControllerForRequest____reduceTransparencyBannerCount);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(v6, "setMaterialGroupNameBase:", v8);
  objc_msgSend(v6, "updateContent");

  return v6;
}

- (id)_dashBoardLegibilitySettings
{
  SBDashBoardLegibilityProvider *dashBoardLegibilityProvider;
  SBDashBoardLegibilityProvider *v4;
  SBDashBoardLegibilityProvider *v5;

  dashBoardLegibilityProvider = self->_dashBoardLegibilityProvider;
  if (!dashBoardLegibilityProvider)
  {
    v4 = objc_alloc_init(SBDashBoardLegibilityProvider);
    v5 = self->_dashBoardLegibilityProvider;
    self->_dashBoardLegibilityProvider = v4;

    dashBoardLegibilityProvider = self->_dashBoardLegibilityProvider;
  }
  return -[SBDashBoardLegibilityProvider currentLegibilitySettings](dashBoardLegibilityProvider, "currentLegibilitySettings");
}

- (id)_presentableForRequest:(id)a3 modal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SBNotificationPresentableViewController *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (-[SBNotificationBannerDestination _isAmbientPresented](self, "_isAmbientPresented"))
  {
    v7 = (SBNotificationPresentableViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6150]), "initWithNotificationRequest:", v6);
    -[NCNotificationPresentableViewController setDelegate:](v7, "setDelegate:", self);
    -[SBNotificationPresentableViewController addPresentableObserver:](v7, "addPresentableObserver:", self);
  }
  else
  {
    -[SBNotificationBannerDestination _notificationViewControllerForRequest:](self, "_notificationViewControllerForRequest:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRevealAdditionalContentOnPresentation:", v4);
    v7 = -[NCNotificationPresentableViewController initWithNotificationViewController:]([SBNotificationPresentableViewController alloc], "initWithNotificationViewController:", v8);
    -[NCNotificationPresentableViewController setDelegate:](v7, "setDelegate:", self);

  }
  return v7;
}

- (void)_postPresentableForRequest:(id)a3 modal:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  BNPresentable *v16;
  BNPresentable *presentedPresentable;
  void *v18;
  BNPresentable *v19;
  void *v20;
  void *v21;
  int v22;
  os_log_t v23;
  _BOOL4 v24;
  BNPresentable *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  const char *v29;
  BNPresentable *v30;
  void *v31;
  BSInvalidatable *v32;
  BSInvalidatable *bannerGestureRecognizerPriorityAssertion;
  void *v34;
  _BYTE v35[24];
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_log_t *)MEMORY[0x1E0DC5F70];
  if (self->_presentedPresentable)
  {
    -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setInteractionEnabled:", 0);
    -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
        -[SBNotificationBannerDestination _postPresentableForRequest:modal:completion:].cold.1(v15, v14);
      objc_msgSend(v10, "destination:willDismissNotificationRequest:", self, v14);
    }

  }
  -[SBNotificationBannerDestination _presentableForRequest:modal:](self, "_presentableForRequest:modal:", v8, v6);
  v16 = (BNPresentable *)objc_claimAutoreleasedReturnValue();
  presentedPresentable = self->_presentedPresentable;
  self->_presentedPresentable = v16;

  v18 = (void *)MEMORY[0x1D17E5550](v9);
  if (v18)
  {
    v19 = self->_presentedPresentable;
    v20 = (void *)MEMORY[0x1D17E5550](v18);
    objc_setAssociatedObject(v19, &_SBNotificationBannerDestinationBannerRequestCompletion, v20, (void *)3);

  }
  objc_msgSend(v8, "options");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "dismissAutomatically");

  v23 = *v11;
  v24 = os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT);
  if (!v22 || v6)
  {
    if (v24)
    {
      v30 = self->_presentedPresentable;
      v26 = v23;
      objc_msgSend(v8, "notificationIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "un_logDigest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v35 = 138543618;
      *(_QWORD *)&v35[4] = v30;
      *(_WORD *)&v35[12] = 2114;
      *(_QWORD *)&v35[14] = v28;
      v29 = "Posting sticky banner %{public}@ for notification %{public}@";
      goto LABEL_15;
    }
  }
  else if (v24)
  {
    v25 = self->_presentedPresentable;
    v26 = v23;
    objc_msgSend(v8, "notificationIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "un_logDigest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v35 = 138543618;
    *(_QWORD *)&v35[4] = v25;
    *(_WORD *)&v35[12] = 2114;
    *(_QWORD *)&v35[14] = v28;
    v29 = "Posting banner %{public}@ for notification %{public}@";
LABEL_15:
    _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, v29, v35, 0x16u);

  }
  objc_msgSend((id)SBApp, "bannerManager", *(_OWORD *)v35, *(_QWORD *)&v35[16], v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "acquireGestureRecognizerPriorityAssertionForPresentable:priority:reason:", self->_presentedPresentable, 1, CFSTR("user notification banner destination presenting banner"));
  v32 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  bannerGestureRecognizerPriorityAssertion = self->_bannerGestureRecognizerPriorityAssertion;
  self->_bannerGestureRecognizerPriorityAssertion = v32;

  objc_msgSend((id)SBApp, "bannerManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "postPresentable:withOptions:userInfo:error:", self->_presentedPresentable, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0DC6160], "presentedNotificationRequestAsBanner:", v8);
}

- (void)_resetPresentTimer
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "resetting present timer %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (id)_startTimerWithDelay:(unint64_t)a3 eventHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD handler[4];
  NSObject *v16;
  SBNotificationBannerDestination *v17;
  id v18;

  v6 = a4;
  dispatch_get_global_queue(33, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);
  v9 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke;
  handler[3] = &unk_1E8E9F7B8;
  v10 = v8;
  v16 = v10;
  v17 = self;
  v18 = v6;
  v11 = v6;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_activate(v10);
  v12 = v18;
  v13 = v10;

  return v13;
}

void __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
    __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_cold_1();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_103;
  v3[3] = &unk_1E8EA02D8;
  v2 = *(void **)(a1 + 48);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_103(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend(*(id *)(a1 + 32), "_isShowingShortLookAtRest"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_103_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)_startReplaceTimer
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "started replace timer %@", v2);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __53__SBNotificationBannerDestination__startReplaceTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setReadyForNotificationRequests");
}

- (void)_startDismissTimer
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "started dismiss timer %@", v2);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __53__SBNotificationBannerDestination__startDismissTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissPresentedBannerAnimated:reason:forceIfSticky:", 1, CFSTR("SBBannerRevocationReasonBannerDestinationDismissTimer"), 1);
}

- (void)_startReplaceAndDismissTimersForRequest:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "options");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "dismissAutomatically")
    && !-[SBNotificationBannerDestination isUserInteractionInProgress](self, "isUserInteractionInProgress"))
  {
    -[SBNotificationBannerDestination _presentedNotificationRequestPresenter](self, "_presentedNotificationRequestPresenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeTransitionBlockingAssertions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[SBNotificationBannerDestination _startReplaceTimer](self, "_startReplaceTimer");
      -[SBNotificationBannerDestination _startDismissTimer](self, "_startDismissTimer");
    }
  }
  else
  {

  }
}

- (void)_cancelReplaceTimer
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "canceling replace timer %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_cancelDismissTimer
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "canceling dismiss timer %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_cancelReplaceAndDismissTimers
{
  -[SBNotificationBannerDestination _cancelReplaceTimer](self, "_cancelReplaceTimer");
  -[SBNotificationBannerDestination _cancelDismissTimer](self, "_cancelDismissTimer");
}

- (void)_setupTimers
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *presentTimer;
  NSObject *v6;
  _QWORD handler[5];

  dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  presentTimer = self->_presentTimer;
  self->_presentTimer = v4;

  v6 = self->_presentTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __47__SBNotificationBannerDestination__setupTimers__block_invoke;
  handler[3] = &unk_1E8E9DED8;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  dispatch_activate((dispatch_object_t)self->_presentTimer);

}

void __47__SBNotificationBannerDestination__setupTimers__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
    __47__SBNotificationBannerDestination__setupTimers__block_invoke_cold_1();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBNotificationBannerDestination__setupTimers__block_invoke_104;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __47__SBNotificationBannerDestination__setupTimers__block_invoke_104(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setReadyForNotificationRequests");
}

- (void)_setupSystemStateChangeNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__lockStateChanged, CFSTR("SBAggregateLockStateDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__setupModeChanged, CFSTR("SBInBuddyModeDidChangeNotification"), 0);

}

- (void)_performSilenceAction
{
  void *v3;
  void *v4;
  id v5;

  -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "silenceAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination:executeAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v4, v5, 0, MEMORY[0x1E0C9AA70], 0);

}

- (void)_performCancelAction
{
  void *v3;
  void *v4;
  id v5;

  -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination:executeAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v4, v5, 0, MEMORY[0x1E0C9AA70], 0);

}

- (void)_dismissPresentedBannerAnimated:(BOOL)a3 reason:(id)a4 forceIfSticky:(BOOL)a5
{
  -[SBNotificationBannerDestination _dismissPresentedBannerOnly:reason:animated:forceIfSticky:](self, "_dismissPresentedBannerOnly:reason:animated:forceIfSticky:", 1, a4, a3, a5);
}

- (void)_dismissPresentedBannerOnly:(BOOL)a3 reason:(id)a4 animated:(BOOL)a5 forceIfSticky:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;

  v6 = a6;
  v7 = a5;
  v8 = a3;
  v10 = a4;
  if (-[SBNotificationBannerDestination _shouldDismissPresentedBannerPerformingPreludeForcingIfSticky:outReason:](self, "_shouldDismissPresentedBannerPerformingPreludeForcingIfSticky:outReason:", v6, 0))
  {
    -[SBNotificationBannerDestination _dismissPresentedBannerOnly:reason:animated:](self, "_dismissPresentedBannerOnly:reason:animated:", v8, v10, v7);
  }

}

- (BOOL)_shouldDismissPresentedBannerPerformingPreludeForcingIfSticky:(BOOL)a3 outReason:(id *)a4
{
  __CFString *v7;
  BOOL result;

  if (-[SBNotificationBannerDestination isPresentingBanner](self, "isPresentingBanner"))
  {
    if (a3 || !-[SBNotificationBannerDestination _isPresentingStickyBanner](self, "_isPresentingStickyBanner"))
      return 1;
    if (a4)
    {
      v7 = CFSTR("presentingStickyBanner");
LABEL_8:
      result = 0;
      *a4 = v7;
      return result;
    }
  }
  else if (a4)
  {
    v7 = CFSTR("noBanner");
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)_revokeAllPresentablesWithRequesterIdentifier:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)SBApp;
  v9 = a4;
  objc_msgSend(v8, "bannerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D010A0], "identificationWithRequesterIdentifier:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v11, v9, a5, 0, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v17;
  if (!v12)
  {
    v14 = objc_msgSend(v13, "code");
    v15 = *MEMORY[0x1E0DC5F70];
    if (v14 == 3)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v7;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "No presentables to revoke with requester identifier %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
    {
      -[SBNotificationBannerDestination _revokeAllPresentablesWithRequesterIdentifier:reason:options:].cold.1();
    }
  }

  return v12 != 0;
}

- (void)_dismissPresentedBannerOnly:(BOOL)a3 reason:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;

  v5 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[SBNotificationBannerDestination _presentedNotificationRequest](self, "_presentedNotificationRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x1E0DC5F70];
  v10 = *MEMORY[0x1E0DC5F70];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v8, "notificationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_logDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v13;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Revoking banner for notification %{public}@", (uint8_t *)&v27, 0xCu);

    }
    objc_msgSend((id)SBApp, "bannerManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "windowSceneForPresentable:", self->_presentedPresentable);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isDisplayingBannerInWindowScene:", v15);

    -[SBNotificationBannerDestination delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "destination:willDismissNotificationRequest:", self, v8);

    -[BNPresentable requesterIdentifier](self->_presentedPresentable, "requesterIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationBannerDestination _revokeAllPresentablesWithRequesterIdentifier:reason:options:](self, "_revokeAllPresentablesWithRequesterIdentifier:reason:options:", v18, v7, v5);

    if ((v16 & 1) == 0)
    {
      v19 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Tried to dismiss a banner that was queued but not currently presented", (uint8_t *)&v27, 2u);
      }
      -[SBNotificationBannerDestination _dismissPresentableCompleted:](self, "_dismissPresentableCompleted:", 0);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      -[SBNotificationBannerDestination _dismissPresentedBannerOnly:reason:animated:].cold.1(v10, v20, v21, v22, v23, v24, v25, v26);
    -[SBNotificationBannerDestination _dismissPresentableCompleted:](self, "_dismissPresentableCompleted:", 0);
  }

}

- (void)_dismissPresentableCompleted:(id)a3
{
  BNPresentable *presentedPresentable;

  presentedPresentable = self->_presentedPresentable;
  self->_presentedPresentable = 0;

  -[SBNotificationBannerDestination _resetPresentTimer](self, "_resetPresentTimer");
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (-[SBNotificationBannerDestination _isPresentingBannerInLongLook](self, "_isPresentingBannerInLongLook"))
    return 2;
  else
    return 1;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0;
}

- (int64_t)idleWarnMode
{
  return 0;
}

- (int64_t)idleTimerDuration
{
  return 9;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (void)notificationManagementContentProvider:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6
{
  NCNotificationManagementViewPresenter *notificationManagementPresenter;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  notificationManagementPresenter = self->_notificationManagementPresenter;
  v10 = a6;
  v11 = a5;
  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notificationViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bs_topPresentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementViewPresenter presentNotificationManagementViewType:forNotificationRequest:withPresentingViewController:withPresentingView:](notificationManagementPresenter, "presentNotificationManagementViewType:forNotificationRequest:withPresentingViewController:withPresentingView:", a4, v11, v13, v10);

}

- (id)notificationManagementViewPresenter:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return -[SBNotificationBannerDestination _notificationSectionSettingsForSectionIdentifier:](self, "_notificationSectionSettingsForSectionIdentifier:", a4);
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a6;
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination:setAllowsNotifications:forSectionIdentifier:", self, v6, v8);

}

- (void)notificationManagementViewPresenter:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a6;
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination:setDeliverQuietly:forSectionIdentifier:", self, v6, v8);

}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a6;
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination:setAllowsCriticalAlerts:forSectionIdentifier:", self, v6, v8);

}

- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "destination:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v9, v13, v12, v11);

}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a6;
  -[SBNotificationBannerDestination delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination:setAllowsTimeSensitive:forSectionIdentifier:", self, v6, v8);

}

- (void)notificationManagementViewPresenterWillPresentManagementView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_topPresentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "preserveInputViews");

}

- (void)notificationManagementViewPresenterDidDismissManagementView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_topPresentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "restoreInputViews");

}

- (NCNotificationAlertDestinationDelegate)delegate
{
  return (NCNotificationAlertDestinationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBAssistantController)assistantController
{
  return self->_assistantController;
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (SBSetupManager)setupManager
{
  return self->_setupManager;
}

- (void)setSetupManager:(id)a3
{
  objc_storeStrong((id *)&self->_setupManager, a3);
}

- (void)_setPresentedPresentable:(id)a3
{
  objc_storeStrong((id *)&self->_presentedPresentable, a3);
}

- (NCNotificationViewController)_notificationViewControllerForActiveDragSession
{
  return self->_notificationViewControllerForActiveDragSession;
}

- (void)_setNotificationViewControllerForActiveDragSession:(id)a3
{
  objc_storeStrong((id *)&self->_notificationViewControllerForActiveDragSession, a3);
}

- (BOOL)isUserInteractionInProgress
{
  return self->_userInteractionInProgress;
}

- (void)setUserInteractionInProgress:(BOOL)a3
{
  self->_userInteractionInProgress = a3;
}

- (OS_dispatch_source)presentTimer
{
  return self->_presentTimer;
}

- (void)setPresentTimer:(id)a3
{
  objc_storeStrong((id *)&self->_presentTimer, a3);
}

- (OS_dispatch_source)replaceTimer
{
  return self->_replaceTimer;
}

- (void)setReplaceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_replaceTimer, a3);
}

- (OS_dispatch_source)dismissTimer
{
  return self->_dismissTimer;
}

- (void)setDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTimer, a3);
}

- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion
{
  return self->_resignActiveAssertion;
}

- (void)setResignActiveAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_resignActiveAssertion, a3);
}

- (SBWindowSceneStatusBarSettingsAssertion)systemStatusBarAssertion
{
  return self->_systemStatusBarAssertion;
}

- (SBInAppStatusBarHiddenAssertion)appsStatusBarAssertion
{
  return self->_appsStatusBarAssertion;
}

- (void)setAppsStatusBarAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_appsStatusBarAssertion, a3);
}

- (NSMutableSet)destinationObservers
{
  return self->_destinationObservers;
}

- (void)setDestinationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_destinationObservers, a3);
}

- (BSInvalidatable)idleTimerDisableAssertion
{
  return self->_idleTimerDisableAssertion;
}

- (void)setIdleTimerDisableAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, a3);
}

- (BSInvalidatable)starModeDisableAssertion
{
  return self->_starModeDisableAssertion;
}

- (void)setStarModeDisableAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_starModeDisableAssertion, a3);
}

- (BSInvalidatable)bannerGestureRecognizerPriorityAssertion
{
  return self->_bannerGestureRecognizerPriorityAssertion;
}

- (void)setBannerGestureRecognizerPriorityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_bannerGestureRecognizerPriorityAssertion, a3);
}

- (NCNotificationManagementViewPresenter)notificationManagementPresenter
{
  return self->_notificationManagementPresenter;
}

- (void)setNotificationManagementPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManagementPresenter, a3);
}

- (SBDashBoardLegibilityProvider)dashBoardLegibilityProvider
{
  return self->_dashBoardLegibilityProvider;
}

- (void)setDashBoardLegibilityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dashBoardLegibilityProvider, a3);
}

- (BNPresentable)presentablePendingSnapshot
{
  return (BNPresentable *)objc_loadWeakRetained((id *)&self->_presentablePendingSnapshot);
}

- (void)setPresentablePendingSnapshot:(id)a3
{
  objc_storeWeak((id *)&self->_presentablePendingSnapshot, a3);
}

- (BSInvalidatable)biometricMatchingAssertion
{
  return self->_biometricMatchingAssertion;
}

- (void)setBiometricMatchingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_biometricMatchingAssertion, a3);
}

- (NCBannerTransitionBlockingPrototypeRecipe)transitionBlockingPrototypeRecipe
{
  return self->_transitionBlockingPrototypeRecipe;
}

- (void)setTransitionBlockingPrototypeRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_transitionBlockingPrototypeRecipe, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionBlockingPrototypeRecipe, 0);
  objc_storeStrong((id *)&self->_biometricMatchingAssertion, 0);
  objc_destroyWeak((id *)&self->_presentablePendingSnapshot);
  objc_storeStrong((id *)&self->_dashBoardLegibilityProvider, 0);
  objc_storeStrong((id *)&self->_notificationManagementPresenter, 0);
  objc_storeStrong((id *)&self->_bannerGestureRecognizerPriorityAssertion, 0);
  objc_storeStrong((id *)&self->_starModeDisableAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_destinationObservers, 0);
  objc_storeStrong((id *)&self->_appsStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_systemStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_replaceTimer, 0);
  objc_storeStrong((id *)&self->_presentTimer, 0);
  objc_storeStrong((id *)&self->_notificationViewControllerForActiveDragSession, 0);
  objc_storeStrong((id *)&self->_presentedPresentable, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NCNotificationViewController)presentedBanner
{
  void *v2;
  void *v3;

  -[SBNotificationBannerDestination _presentedNotificationPresentableVC](self, "_presentedNotificationPresentableVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationViewController *)v3;
}

- (void)_test_postNotificationRequest:(id)a3 completion:(id)a4
{
  -[SBNotificationBannerDestination _postNotificationRequest:modal:completion:](self, "_postNotificationRequest:modal:completion:", a3, 0, a4);
}

- (void)_test_dismissNotificationRequest:(id)a3
{
  -[SBNotificationBannerDestination _dismissPresentedBannerOnly:reason:animated:](self, "_dismissPresentedBannerOnly:reason:animated:", 1, CFSTR("SBBannerRevocationReasonBannerDestinationTest"), 1);
}

- (void)modifyNotificationRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_3_8(a1);
  objc_msgSend(a2, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v3, v6, "Modifying notification %{public}@ in banner", v7);

  OUTLINED_FUNCTION_20();
}

- (void)withdrawNotificationRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_3_8(a1);
  objc_msgSend(a2, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v3, v6, "Withdrawing notification %{public}@ from banner", v7);

  OUTLINED_FUNCTION_20();
}

- (void)fullScreenPresentableViewController:(uint64_t)a3 requestsDismissalWithReason:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;

  v4 = OUTLINED_FUNCTION_3_8(a1);
  BNEffectivePresentableDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  v8 = a3;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v4, v6, "Failed to revoke presentable '%{public}@': %{public}@", v7);

  OUTLINED_FUNCTION_20();
}

- (void)_postPresentableForRequest:(void *)a1 modal:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_3_8(a1);
  objc_msgSend(a2, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v3, v6, "Replacing banner for notification %{public}@", v7);

  OUTLINED_FUNCTION_20();
}

void __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "timer fired %@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __69__SBNotificationBannerDestination__startTimerWithDelay_eventHandler___block_invoke_103_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "timer should only fire while in short look", a5, a6, a7, a8, 0);
}

void __47__SBNotificationBannerDestination__setupTimers__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "present timer fired %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_revokeAllPresentablesWithRequesterIdentifier:reason:options:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  v3 = v0;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v1, (uint64_t)v1, "Failed to revoke presentables with requester identifier %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_dismissPresentedBannerOnly:(uint64_t)a3 reason:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Tried to dismiss a banner but none was presented", a5, a6, a7, a8, 0);
}

@end
