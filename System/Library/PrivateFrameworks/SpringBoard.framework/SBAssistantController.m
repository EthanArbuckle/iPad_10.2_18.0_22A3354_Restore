@implementation SBAssistantController

+ (BOOL)isVisible
{
  void *v2;
  char v3;

  +[SBAssistantController sharedInstanceIfExists](SBAssistantController, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisible");

  return v3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

+ (id)sharedInstanceIfExists
{
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[SBAssistantController sharedInstanceIfExists]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBAssistantController.m"), 214, CFSTR("this call must be made on the main thread"));

  }
  return (id)__shared;
}

- (void)applicationProcessDidChangeState:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v11 = v7;

  objc_msgSend(v11, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

  if (v9)
  {
    objc_msgSend(v11, "processState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_screenShotServicesIsRunning = objc_msgSend(v10, "taskState") == 2;

  }
}

+ (SBAssistantController)sharedInstance
{
  void *v2;
  id v3;
  void *v4;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[SBAssistantController sharedInstance]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBAssistantController.m"), 204, CFSTR("this call must be made on the main thread"));

  }
  v2 = (void *)__shared;
  if (!__shared)
  {
    kdebug_trace();
    v3 = -[SBAssistantController _init]([SBAssistantController alloc], "_init");
    v4 = (void *)__shared;
    __shared = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)__shared;
  }
  return (SBAssistantController *)v2;
}

- (SBAssistantController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAssistantController.m"), 155, CFSTR("-init is not allowed on SBAssistantController"));

  return 0;
}

- (id)_init
{
  SBAssistantController *v2;
  id v3;
  uint64_t v4;
  BSEventQueue *operationQueue;
  SBWindowLevelAssertionManager *v6;
  SBWindowLevelAssertionManager *windowLevelAssertionManager;
  SiriPresentationSpringBoardMainScreenViewController *v8;
  SiriPresentationSpringBoardMainScreenViewController *mainScreenSiriPresentation;
  SBAssistantGestureConfiguration *v10;
  SBAssistantGestureConfiguration *gestureConfiguration;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v13;
  SBSystemAnimationSettings *settings;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBAssistantController;
  v2 = -[SBAssistantController init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D01770]);
    v4 = objc_msgSend(v3, "initWithName:onQueue:", CFSTR("Siri"), MEMORY[0x1E0C80D38]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (BSEventQueue *)v4;

    v6 = objc_alloc_init(SBWindowLevelAssertionManager);
    windowLevelAssertionManager = v2->_windowLevelAssertionManager;
    v2->_windowLevelAssertionManager = v6;

    -[SBWindowLevelAssertionManager setDelegate:](v2->_windowLevelAssertionManager, "setDelegate:", v2);
    if (MGGetBoolAnswer())
    {
      v8 = (SiriPresentationSpringBoardMainScreenViewController *)objc_alloc_init(MEMORY[0x1E0DA7A18]);
      mainScreenSiriPresentation = v2->_mainScreenSiriPresentation;
      v2->_mainScreenSiriPresentation = v8;

      -[SiriPresentationSpringBoardMainScreenViewController setSiriPresentationControllerDelegate:](v2->_mainScreenSiriPresentation, "setSiriPresentationControllerDelegate:", v2);
      v2->_systemAssistantExperienceAvailable = AFHasGMSCapability();
      v10 = -[SBAssistantGestureConfiguration initWithSiriPresentationViewController:]([SBAssistantGestureConfiguration alloc], "initWithSiriPresentationViewController:", v2->_mainScreenSiriPresentation);
      gestureConfiguration = v2->_gestureConfiguration;
      v2->_gestureConfiguration = v10;

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SBAssistantControllerGenerativeModelsAvailabilityDidChange, CFSTR("com.apple.gms.availability.notification"), 0, (CFNotificationSuspensionBehavior)0);
      -[SBAssistantController _generativeModelsAvailabilityDidChange](v2, "_generativeModelsAvailabilityDidChange");
    }
    +[SBSystemAnimationDomain rootSettings](SBSystemAnimationDomain, "rootSettings");
    v13 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBSystemAnimationSettings *)v13;

    -[PTSettings addKeyObserver:](v2->_settings, "addKeyObserver:", v2);
    -[SBAssistantController _prototypeSettingsChanged](v2, "_prototypeSettingsChanged");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__systemApertureFrameDidChange_, CFSTR("SBSystemApertureLayoutDidChangeNotification"), 0);

    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  objc_super v6;

  if (MGGetBoolAnswer())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.gms.availability.notification"), 0);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SBAssistantController;
  -[SBAssistantController dealloc](&v6, sel_dealloc);
}

+ (BOOL)shouldBreadcrumbLaunchedApplicationWithBundleIdentifier:(id)a3
{
  void *v3;

  objc_msgSend(a1, "sharedInstanceIfExists", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

+ (BOOL)shouldDismissSiriForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  return +[SBAssistantGestureManager shouldDismissSiriForGestureTranslation:velocity:](SBAssistantGestureManager, "shouldDismissSiriForGestureTranslation:velocity:", a3.x, a3.y, a4.x, a4.y);
}

+ (id)defaultActivationSettings
{
  return +[SBAssistantController _activationSettingsWithPunchoutStyle:](SBAssistantController, "_activationSettingsWithPunchoutStyle:", 1);
}

- (BOOL)requestPasscodeUnlockWithCompletion:(id)a3
{
  id v4;
  void *v5;
  SBAssistantSession *currentSession;
  SiriPresentationSpringBoardMainScreenViewController *mainScreenSiriPresentation;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  currentSession = self->_currentSession;
  if (currentSession)
  {
    mainScreenSiriPresentation = self->_mainScreenSiriPresentation;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__SBAssistantController_requestPasscodeUnlockWithCompletion___block_invoke;
    v9[3] = &unk_1E8EB2330;
    v10 = v4;
    -[SiriPresentationSpringBoardMainScreenViewController requestPasscodeUnlockWithCompletion:](mainScreenSiriPresentation, "requestPasscodeUnlockWithCompletion:", v9);

  }
  return currentSession != 0;
}

uint64_t __61__SBAssistantController_requestPasscodeUnlockWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

- (void)setSystemAssistantExperienceEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_systemAssistantExperienceEnabled != a3)
  {
    self->_systemAssistantExperienceEnabled = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "assistantDidChangeSystemAssistantExperienceEnablement:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_systemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled != a3)
  {
    self->_systemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setSystemAssistantExperiencePersistentSiriEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_systemAssistantExperiencePersistentSiriEnabled != a3)
  {
    self->_systemAssistantExperiencePersistentSiriEnabled = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)isVisibleInWindowScene:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  if (-[SBAssistantController isVisible](self, "isVisible"))
  {
    -[SBAssistantSession windowScene](self->_currentSession, "windowScene");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v4;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dismissAssistantViewInEverySceneIfNecessary
{
  -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:", 1, 0, 0, 0);
}

- (void)dismissAssistantViewInEverySceneIfNecessaryWithAnimation:(int64_t)a3
{
  -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:", a3, 0, 0, 0);
}

- (void)dismissAssistantViewInEverySceneIfNecessaryWithAnimation:(int64_t)a3 completion:(id)a4
{
  -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:", a3, 0, 0, a4);
}

- (void)dismissAssistantViewInEverySceneIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 completion:(id)a5
{
  -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:", a3, a4, 0, a5);
}

- (void)dismissAssistantViewInEverySceneIfNecessaryForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  if (objc_msgSend((id)objc_opt_class(), "shouldDismissSiriForGestureTranslation:velocity:", a3.x, a3.y, a4.x, a4.y))-[SBAssistantController dismissAssistantViewInEverySceneIfNecessary](self, "dismissAssistantViewInEverySceneIfNecessary");
}

- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  void *v15;
  SBAssistantSession *v16;
  void *v17;
  SBAssistantSession *v18;
  SBAssistantSession *v19;
  SBAssistantSession *v20;
  NSObject *v21;
  void *v22;
  SBAssistantSession *currentSession;
  _QWORD v24[5];
  void (**v25)(_QWORD);
  SEL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  SBAssistantSession *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  if (self->_currentSession && !self->_dismissing)
  {
    self->_dismissing = 1;
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.0);
    v18 = (SBAssistantSession *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      if (v11)
      {
        v19 = (SBAssistantSession *)v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", *(double *)&kSBAssistantDefaultAnimationDuration);
        v19 = (SBAssistantSession *)objc_claimAutoreleasedReturnValue();
      }
      v20 = v19;

      v18 = v20;
    }
    SBLogSiri();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ - ending the current session with factory: %@", buf, 0x16u);

    }
    currentSession = self->_currentSession;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __107__SBAssistantController__dismissAssistantViewIfNecessaryWithAnimation_factory_dismissalOptions_completion___block_invoke;
    v24[3] = &unk_1E8EA1310;
    v24[4] = self;
    v26 = a2;
    v25 = v13;
    -[SBAssistantSession endWithAnimationFactory:siriDismissalOptions:completion:](currentSession, "endWithAnimationFactory:siriDismissalOptions:completion:", v18, v12, v24);

  }
  else
  {
    SBLogSiri();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      _SBFLoggingMethodProem();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_currentSession;
      NSStringFromBOOL();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      v31 = 2114;
      v32 = v17;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "%{public}@ - asked to dismiss siri but it isn't necessary because currentSession: %@ _dismissing: %{public}@", buf, 0x20u);

    }
    if (v13)
      v13[2](v13);
  }

}

uint64_t __107__SBAssistantController__dismissAssistantViewIfNecessaryWithAnimation_factory_dismissalOptions_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - ended the current session, cleaning up", (uint8_t *)&v7, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 136);
  *(_QWORD *)(v4 + 136) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 98) = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissAssistantViewIfNecessaryInWindowScene:(id)a3
{
  -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:windowScene:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:windowScene:completion:", 1, 0, 0, a3, 0);
}

- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 windowScene:(id)a4
{
  -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:windowScene:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:windowScene:completion:", a3, 0, 0, a4, 0);
}

- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 windowScene:(id)a4 completion:(id)a5
{
  -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:windowScene:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:windowScene:completion:", a3, 0, 0, a4, a5);
}

- (void)dismissAssistantViewIfNecessaryForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4 windowScene:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v10 = a5;
  if (objc_msgSend((id)objc_opt_class(), "shouldDismissSiriForGestureTranslation:velocity:", v8, v7, x, y))-[SBAssistantController dismissAssistantViewIfNecessaryInWindowScene:](self, "dismissAssistantViewIfNecessaryInWindowScene:", v10);

}

- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 windowScene:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  SBAssistantSession *currentSession;
  id v15;
  id v16;
  id v17;

  v17 = a4;
  v12 = a5;
  v13 = a7;
  currentSession = self->_currentSession;
  v15 = a6;
  -[SBAssistantSession windowScene](currentSession, "windowScene");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v15)
    -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:", a3, v17, v12, v13);

}

- (BOOL)shouldShowSystemVolumeHUDForCategory:(id)a3
{
  id v4;
  NSSet *audioCategoriesDisablingVolumeHUD;
  _BOOL4 v6;

  v4 = a3;
  audioCategoriesDisablingVolumeHUD = self->_audioCategoriesDisablingVolumeHUD;
  if (audioCategoriesDisablingVolumeHUD)
  {
    if (-[NSSet count](audioCategoriesDisablingVolumeHUD, "count"))
      v6 = !-[NSSet containsObject:](self->_audioCategoriesDisablingVolumeHUD, "containsObject:", v4);
    else
      LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)window
{
  return -[SBAssistantSession window](self->_currentSession, "window");
}

- (id)rootViewController
{
  return -[SBAssistantSession assistantRootViewController](self->_currentSession, "assistantRootViewController");
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (BOOL)contentObscuresEmbeddedDisplayScreen
{
  void *v3;
  int v4;

  -[SBAssistantSession windowScene](self->_currentSession, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMainDisplayWindowScene");

  return v4 && -[SBAssistantSession contentObscuresScreen](self->_currentSession, "contentObscuresScreen");
}

- (BOOL)shouldDismissSiriForRemoteTransientOverlayFromBundleIdentifier:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[SiriPresentationSpringBoardMainScreenViewController shouldDismissForTransientOverlayForBundleIdentifier:](self->_mainScreenSiriPresentation, "shouldDismissForTransientOverlayForBundleIdentifier:", v4);
  else
    v5 = 1;

  return v5;
}

+ (void)bootstrapServices
{
  if (bootstrapServices_onceToken != -1)
    dispatch_once(&bootstrapServices_onceToken, &__block_literal_global_203);
}

void __42__SBAssistantController_bootstrapServices__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D977F8], "listener");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bootstrapServices___presentationService;
  bootstrapServices___presentationService = v0;

  objc_msgSend(MEMORY[0x1E0D97800], "listener");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)bootstrapServices___signalService;
  bootstrapServices___signalService = v2;

}

- (BOOL)isEnabled
{
  return -[SiriPresentationSpringBoardMainScreenViewController isEnabled](self->_mainScreenSiriPresentation, "isEnabled");
}

- (id)sessionForWindowScene:(id)a3
{
  SBAssistantSession *currentSession;
  id v5;
  id v6;
  SBAssistantSession *v7;

  currentSession = self->_currentSession;
  v5 = a3;
  -[SBAssistantSession windowScene](currentSession, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    v7 = self->_currentSession;
  else
    v7 = 0;
  return v7;
}

+ (id)_activationSettingsWithPunchoutStyle:(int64_t)a3
{
  SBActivationSettings *v4;
  SBActivationSettings *v5;
  uint64_t v6;

  v4 = objc_alloc_init(SBActivationSettings);
  v5 = v4;
  if (a3 == 2)
  {
    v6 = 0;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v6 = 1;
LABEL_5:
    -[SBActivationSettings setFlag:forActivationSetting:](v4, "setFlag:forActivationSetting:", v6, 43);
  }
  return v5;
}

- (void)setUISceneTracker:(id)a3
{
  SBWindowSceneTracking *v5;
  SBWindowSceneTracking **p_uiSceneTracker;
  SBWindowSceneTracking *uiSceneTracker;
  SBWindowSceneTracking *v8;

  v5 = (SBWindowSceneTracking *)a3;
  uiSceneTracker = self->_uiSceneTracker;
  p_uiSceneTracker = &self->_uiSceneTracker;
  if (uiSceneTracker != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_uiSceneTracker, a3);
    v5 = v8;
  }

}

- (id)_uiSceneTracker
{
  if (self->_uiSceneTracker)
    return self->_uiSceneTracker;
  else
    return (id)SBApp;
}

- (void)_setUnlockedDevice:(BOOL)a3
{
  SBFAuthenticationAssertion *disableAssertion;
  void *v6;
  void *v7;
  SBFAuthenticationAssertion *v8;
  SBFAuthenticationAssertion *v9;

  disableAssertion = self->_disableAssertion;
  if (a3)
  {
    if (!disableAssertion)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Siri unlock SBAssistantController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)SBApp, "authenticationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createKeybagUnlockAssertionWithReason:", v6);
      v8 = (SBFAuthenticationAssertion *)objc_claimAutoreleasedReturnValue();
      v9 = self->_disableAssertion;
      self->_disableAssertion = v8;

      -[SBFAuthenticationAssertion activate](self->_disableAssertion, "activate");
LABEL_6:

    }
  }
  else if (disableAssertion)
  {
    -[SBFAuthenticationAssertion invalidate](disableAssertion, "invalidate");
    v6 = self->_disableAssertion;
    self->_disableAssertion = 0;
    goto LABEL_6;
  }
  self->_unlockedDevice = a3;
}

- (void)_setVisible:(BOOL)a3
{
  void *v4;
  void *v5;
  SBIdleTimer *v6;
  SBIdleTimer *idleTimer;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_visible != a3)
  {
    self->_visible = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_visible)
    {
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__uiLocked_, *MEMORY[0x1E0DAC318], 0);
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__deviceBlocked_, *MEMORY[0x1E0DAA050], 0);
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__remoteLocked_, *MEMORY[0x1E0DAC320], 0);
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__uiLocked_, CFSTR("SBLockScreenUIRelockedNotification"), 0);
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__uiLocked_, CFSTR("SBLockScreenUIDidLockNotification"), 0);
      -[SBAssistantController _idleTimerCoordinator](self, "_idleTimerCoordinator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAssistantController _idleTimerBehavior](self, "_idleTimerBehavior");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "idleTimerProvider:didProposeBehavior:forReason:", self, v5, CFSTR("SBAssistantControllerVisible"));
      v6 = (SBIdleTimer *)objc_claimAutoreleasedReturnValue();
      idleTimer = self->_idleTimer;
      self->_idleTimer = v6;

    }
    else
    {
      objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC318], 0);
      objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0DAA050], 0);
      objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC320], 0);
      objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("SBLockScreenUIRelockedNotification"), 0);
      self->_dismissing = 0;
    }
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("SBAssistantVisibilityDidChangeNotification"), 0);
    +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAssistantSession windowScene](self->_currentSession, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusArbitrationReason assistantControllerVisibility](SBKeyboardFocusArbitrationReason, "assistantControllerVisibility");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestArbitrationForSBWindowScene:forReason:", v9, v10);

  }
}

- (void)_noteDeviceLockedOrBlocked
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (self->_visible)
  {
    SBLogSiri();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Dismissing assistant if necessary due to device lock or block", v5, 2u);
    }

  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D97830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 0, 4);
  -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:", 0, 0, v4, 0);

}

- (void)_bioAuthenticated:(id)a3
{
  -[SBAssistantController deviceUnlockRequestedWithPassword:](self, "deviceUnlockRequestedWithPassword:", 0);
  -[SBAssistantController _setUnlockedDevice:](self, "_setUnlockedDevice:", 1);
}

- (void)_uiLocked:(id)a3
{
  void *v4;
  int v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUILocked");

  if (v5)
    -[SBAssistantController _noteDeviceLockedOrBlocked](self, "_noteDeviceLockedOrBlocked");
}

- (BOOL)isAmbientActive
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

  LOBYTE(v2) = objc_msgSend(v4, "isPresented");
  return (char)v2;
}

- (void)_deviceBlocked:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend((id)SBApp, "lockOutController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBlocked");

  if (v5)
    -[SBAssistantController _noteDeviceLockedOrBlocked](self, "_noteDeviceLockedOrBlocked");
}

- (void)_updateWindowLevelForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBAssistantSession *currentSession;
  double v9;
  id v10;

  v10 = a3;
  -[SBAssistantSession windowScene](self->_currentSession, "windowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 == v10)
  {
    -[SBWindowLevelAssertionManager highestPriorityWindowLevelAssertionForWindowScene:](self->_windowLevelAssertionManager, "highestPriorityWindowLevelAssertionForWindowScene:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    currentSession = self->_currentSession;
    if (v6)
      objc_msgSend(v6, "windowLevel");
    else
      v9 = *MEMORY[0x1E0CEBBD0] + 25.0;
    -[SBAssistantSession assertWindowLevel:](currentSession, "assertWindowLevel:", v9);

    v5 = v10;
  }

}

- (void)_turnScreenOffWithCompletion:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SBAssistantController__turnScreenOffWithCompletion___block_invoke;
  block[3] = &unk_1E8E9E8D0;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __54__SBAssistantController__turnScreenOffWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)SBApp, "screenSleepCoordinator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepAndLockUIFromSource:completion:", 12, *(_QWORD *)(a1 + 32));

}

- (void)_systemApertureFrameDidChange:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *systemApertureFrames;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBSystemApertureFrames"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v5 = (NSArray *)objc_msgSend(v7, "copy");
    systemApertureFrames = self->_systemApertureFrames;
    self->_systemApertureFrames = v5;

    -[SiriPresentationSpringBoardMainScreenViewController setSystemApertureFrames:](self->_mainScreenSiriPresentation, "setSystemApertureFrames:", v7);
  }

}

- (id)_currentSessionCreatingIfNeededWithFailureExplanation:(id *)a3
{
  SBAssistantSession *currentSession;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBAssistantSession *v10;
  SBAssistantSession *v11;

  currentSession = self->_currentSession;
  if (!currentSession)
  {
    -[SBAssistantController _uiSceneTracker](self, "_uiSceneTracker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sceneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "policyAggregator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "allowsCapability:explanation:", 5, a3))
    {
      v10 = -[SBAssistantSession initWithWindowScene:operationQueue:gestureConfiguration:]([SBAssistantSession alloc], "initWithWindowScene:operationQueue:gestureConfiguration:", v7, self->_operationQueue, self->_gestureConfiguration);
      -[SBAssistantSession setDelegate:](v10, "setDelegate:", self);
      -[SBAssistantController _updateWindowLevelForScene:](self, "_updateWindowLevelForScene:", v7);
      v11 = self->_currentSession;
      self->_currentSession = v10;

    }
    currentSession = self->_currentSession;
  }
  return currentSession;
}

- (void)_generativeModelsAvailabilityDidChange
{
  -[SBAssistantController _updateSystemAssistantExperienceEnabled](self, "_updateSystemAssistantExperienceEnabled");
  -[SBAssistantController _updateSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled](self, "_updateSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");
  -[SBAssistantController _updateSystemAssistantExperiencePersistentSiriEnabled](self, "_updateSystemAssistantExperiencePersistentSiriEnabled");
}

- (void)_updateSystemAssistantExperienceEnabled
{
  -[SBAssistantController setSystemAssistantExperienceEnabled:](self, "setSystemAssistantExperienceEnabled:", AFDeviceSupportsSystemAssistantExperience());
}

- (void)_updateSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled
{
  uint64_t v3;

  if (self->_systemAssistantExperienceEnabled)
    v3 = SBFIsSAETappyHomeAffordanceAvailable();
  else
    v3 = 0;
  -[SBAssistantController setSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled:](self, "setSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled:", v3);
}

- (void)_updateSystemAssistantExperiencePersistentSiriEnabled
{
  uint64_t v3;

  if (self->_systemAssistantExperienceEnabled)
    v3 = SBFIsSAEPersistentSiriAvailable();
  else
    v3 = 0;
  -[SBAssistantController setSystemAssistantExperiencePersistentSiriEnabled:](self, "setSystemAssistantExperiencePersistentSiriEnabled:", v3);
}

- (void)assistantSession:(id)a3 viewWillAppearInWindowScene:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v16;
    v25 = 2114;
    v26 = v17;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "assistantWillAppear:windowScene:", self, v5);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  -[SBAssistantController _setVisible:](self, "_setVisible:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__bioAuthenticated_, *MEMORY[0x1E0DAC710], 0);

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "bioAuthenticatedWhileMenuButtonDown");

  if (v15)
    -[SBAssistantController _bioAuthenticated:](self, "_bioAuthenticated:", 0);
  -[SiriPresentationSpringBoardMainScreenViewController setSystemApertureFrames:](self->_mainScreenSiriPresentation, "setSystemApertureFrames:", self->_systemApertureFrames);

}

- (void)assistantSession:(id)a3 viewDidAppearInWindowScene:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogSiri();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sceneIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v16;
    v25 = 2114;
    v26 = v17;
    _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);

  }
  if ((objc_msgSend(v6, "shouldAllowBiometricAutoUnlock") & 1) == 0)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBiometricAutoUnlockingDisabled:forReason:", 1, CFSTR("Siri"));

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "assistantDidAppear:windowScene:", self, v7);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (void)assistantSession:(id)a3 viewWillDisappearInWindowScene:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v14;
    v23 = 2114;
    v24 = v15;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "assistantWillDisappear:windowScene:", self, v5);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[SBAssistantController _setVisible:](self, "_setVisible:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC710], 0);

}

- (void)assistantSession:(id)a3 viewDidDisappearInWindowScene:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogSiri();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sceneIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v16;
    v25 = 2114;
    v26 = v17;
    _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);

  }
  if ((objc_msgSend(v6, "shouldAllowBiometricAutoUnlock") & 1) == 0)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBiometricAutoUnlockingDisabled:forReason:", 0, CFSTR("Siri"));

  }
  -[SBAssistantController _setUnlockedDevice:](self, "_setUnlockedDevice:", 0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "assistantDidDisappear:windowScene:", self, v7);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (void)assistantSession:(id)a3 didChangePresentationInWindowScene:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v13;
    v22 = 2114;
    v23 = v14;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "assistantDidChangePresentation:windowScene:", self, v5);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)assistantSession:(id)a3 requestsDismissalWithDismissalOptions:(id)a4
{
  NSObject *v6;

  if (self->_currentSession == a3)
  {
    -[SBAssistantController _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:](self, "_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:", 1, 0, a4, 0);
  }
  else
  {
    SBLogSiri();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBAssistantController assistantSession:requestsDismissalWithDismissalOptions:].cold.1((uint64_t)self, (uint64_t)a2, v6);

  }
}

- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6
{
  return -[SBWindowLevelAssertionManager acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:](self->_windowLevelAssertionManager, "acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:", a3, a5, a6, a4);
}

- (void)windowLevelAssertionManager:(id)a3 didUpdateAssertionsForWindowScene:(id)a4
{
  -[SBAssistantController _updateWindowLevelForScene:](self, "_updateWindowLevelForScene:", a4);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("assistantAnimationDuration")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("assistantDismissAnimationDurationOverApp")))
  {
    -[SBAssistantController _prototypeSettingsChanged](self, "_prototypeSettingsChanged");
  }

}

- (void)_prototypeSettingsChanged
{
  float v2;

  -[SBSystemAnimationSettings assistantAnimationDuration](self->_settings, "assistantAnimationDuration");
  *(double *)&kSBAssistantDefaultAnimationDuration = v2;
}

- (int64_t)idleTimerDuration
{
  void *v2;
  int64_t v3;

  +[SBCoverSheetPresentationManager sharedInstanceIfExists](SBCoverSheetPresentationManager, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasBeenDismissedSinceKeybagLock"))
    v3 = 12;
  else
    v3 = 10;

  return v3;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 2;
}

- (void)dismissOverlayForDashBoardAnimated:(BOOL)a3
{
  -[SBAssistantController dismissAssistantViewInEverySceneIfNecessaryWithAnimation:](self, "dismissAssistantViewInEverySceneIfNecessaryWithAnimation:", a3);
}

- (void)screenWakeRequested
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__SBAssistantController_screenWakeRequested__block_invoke;
  v2[3] = &unk_1E8E9DE88;
  v2[4] = self;
  v2[5] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __44__SBAssistantController_screenWakeRequested__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 97))
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isUILocked"))
    {
      v6 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
      v7 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unlockUIFromSource:withOptions:", 12, v5);

    }
  }
}

- (id)alwaysOnLiveRenderingAssertionRequested
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD block[5];
  id v15;
  _QWORD *v16;
  SEL v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__71;
  v19[4] = __Block_byref_object_dispose__71;
  v20 = 0;
  v4 = objc_alloc(MEMORY[0x1E0D01868]);
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke;
  v18[3] = &unk_1E8EAE308;
  v18[4] = v19;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke_2;
  block[3] = &unk_1E8EB2378;
  block[4] = self;
  v17 = a2;
  v6 = (id)objc_msgSend(v4, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("alwaysOnLiveRenderingAssertionRequested"), CFSTR("SBAssistantController"), v18);
  v15 = v6;
  v16 = v19;
  v7 = MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_initWeak(&location, v6);
  v8 = dispatch_time(0, 5000000000);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke_162;
  v11[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v12, &location);
  dispatch_after(v8, v7, v11);

  v9 = v6;
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  _Block_object_dispose(v19, 8);
  return v9;
}

uint64_t __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
}

void __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 97))
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isUILocked"))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isValid"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_uiSceneTracker");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "activeDisplayWindowScene");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DA9D68], "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "acquireLiveRenderingAssertionForUIScene:reason:", v6, CFSTR("SBAssistantController request."));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

      }
    }

  }
}

void __64__SBAssistantController_alwaysOnLiveRenderingAssertionRequested__block_invoke_162(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)screenWakeIdleTimerResetRequested
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__SBAssistantController_screenWakeIdleTimerResetRequested__block_invoke;
  v2[3] = &unk_1E8E9DE88;
  v2[4] = self;
  v2[5] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __58__SBAssistantController_screenWakeIdleTimerResetRequested__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 97))
    objc_msgSend(*(id *)(v4 + 80), "reset");
}

- (void)deviceUnlockRequestedWithPassword:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSiri();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[SBAssistantController siriPresentation:requestsDeviceUnlockWithPassword:](self, "siriPresentation:requestsDeviceUnlockWithPassword:", self->_mainScreenSiriPresentation, v4);

}

- (void)siriRequestDidReactivateForSiriPresentation:(id)a3
{
  BSDispatchMain();
}

void __69__SBAssistantController_siriRequestDidReactivateForSiriPresentation___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "currentSession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "windowScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "controlCenterController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisible");

  if (v3)
  {
    objc_msgSend(v5, "controlCenterController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissAnimated:", 1);

  }
}

- (BOOL)siriPresentation:(id)a3 requestsDeviceUnlockWithPassword:(id)a4
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  char v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  SBAssistantController *v17;
  id v18;
  uint64_t *v19;
  SEL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  v8 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __75__SBAssistantController_siriPresentation_requestsDeviceUnlockWithPassword___block_invoke;
  v16 = &unk_1E8EB2378;
  v17 = self;
  v20 = a2;
  v9 = v8;
  v18 = v9;
  v19 = &v21;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v13);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v13, v14, v15, v16, v17))
    v10[2](v10);
  else
    dispatch_sync(MEMORY[0x1E0C80D38], v10);
  v11 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __75__SBAssistantController_siriPresentation_requestsDeviceUnlockWithPassword___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend((id)SBApp, "authenticationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createGracePeriodAssertionWithReason:", CFSTR("Siri unlock attempt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activate");
  v6 = objc_msgSend(*(id *)(a1 + 40), "length");
  objc_msgSend(v4, "notePasscodeEntryBegan");
  v7 = objc_alloc(MEMORY[0x1E0DA9DA0]);
  if (v6)
    v8 = objc_msgSend(v7, "initForPasscode:source:", *(_QWORD *)(a1 + 40), 0);
  else
    v8 = objc_msgSend(v7, "initForBiometricAuthenticationWithSource:", 0);
  v9 = (void *)v8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "_processAuthenticationRequest:responder:", v8, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_setUnlockedDevice:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(v5, "invalidate");

}

- (void)siriPresentation:(id)a3 didUpdateAudioCategoriesDisablingVolumeHUD:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__SBAssistantController_siriPresentation_didUpdateAudioCategoriesDisablingVolumeHUD___block_invoke;
  block[3] = &unk_1E8EA0AF0;
  v9 = v6;
  v10 = a2;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __85__SBAssistantController_siriPresentation_didUpdateAudioCategoriesDisablingVolumeHUD___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v4;
  v7 = v4;

  objc_msgSend((id)SBApp, "volumeControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v8, "lastDisplayedCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v9, "shouldShowSystemVolumeHUDForCategory:", v10);

  if ((v9 & 1) == 0)
    objc_msgSend(v8, "hideVolumeHUDIfVisible");

}

- (void)siriPresentation:(id)a3 didUpdateHomeGestureSharing:(BOOL)a4
{
  -[SBAssistantGestureConfiguration assistantGestureConfiguration:didUpdateHomeGestureSharing:](self->_gestureConfiguration, "assistantGestureConfiguration:didUpdateHomeGestureSharing:", self->_gestureConfiguration, a4);
}

- (void)siriPresentation:(id)a3 didUpdateShouldDismissForTapsOutsideContent:(BOOL)a4
{
  -[SBAssistantGestureConfiguration assistantGestureConfiguration:didUpdateShouldDismissForTapsOutsideContent:](self->_gestureConfiguration, "assistantGestureConfiguration:didUpdateShouldDismissForTapsOutsideContent:", self->_gestureConfiguration, a4);
}

- (void)siriPresentation:(id)a3 didUpdateShouldDismissForSwipesOutsideContent:(BOOL)a4
{
  -[SBAssistantGestureConfiguration assistantGestureConfiguration:didUpdateShouldDismissForSwipesOutsideContent:](self->_gestureConfiguration, "assistantGestureConfiguration:didUpdateShouldDismissForSwipesOutsideContent:", self->_gestureConfiguration, a4);
}

- (void)siriPresentation:(id)a3 didUpdateShouldPassTouchesThroughToSpringBoard:(BOOL)a4
{
  -[SBAssistantGestureConfiguration assistantGestureConfiguration:didUpdateShouldPassTouchesThroughToSpringBoard:](self->_gestureConfiguration, "assistantGestureConfiguration:didUpdateShouldPassTouchesThroughToSpringBoard:", self->_gestureConfiguration, a4);
}

- (void)siriPresentation:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__SBAssistantController_siriPresentation_willChangeKeyboardVisibility___block_invoke;
  v4[3] = &unk_1E8E9F508;
  v5 = a4;
  v4[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

uint64_t __71__SBAssistantController_siriPresentation_willChangeKeyboardVisibility___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (v1)
    return objc_msgSend(v2, "noteKeyboardWillAppear");
  else
    return objc_msgSend(v2, "noteKeyboardWillDisappear");
}

- (void)siriPresentation:(id)a3 requestsPresentationOfEffectsViewController:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__SBAssistantController_siriPresentation_requestsPresentationOfEffectsViewController_withHandler___block_invoke;
  v12[3] = &unk_1E8EA10F0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a2;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __98__SBAssistantController_siriPresentation_requestsPresentationOfEffectsViewController_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v4, "_currentSessionCreatingIfNeededWithFailureExplanation:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFString *)v17;
  v7 = (void *)v6;
  if (v5)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__SBAssistantController_siriPresentation_requestsPresentationOfEffectsViewController_withHandler___block_invoke_167;
    v15[3] = &unk_1E8E9E8D0;
    v8 = *(_QWORD *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v5, "presentSiriEffectsViewController:completion:", v8, v15);
    v9 = v16;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2FE0];
    if (v6)
      v13 = v6;
    else
      v13 = CFSTR("<no reason provided>");
    v18 = *MEMORY[0x1E0CB2D68];
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v9);

    v7 = (void *)v14;
  }

}

uint64_t __98__SBAssistantController_siriPresentation_requestsPresentationOfEffectsViewController_withHandler___block_invoke_167(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)siriPresentation:(id)a3 requestsDismissalOfEffectsViewControllerWithHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__SBAssistantController_siriPresentation_requestsDismissalOfEffectsViewControllerWithHandler___block_invoke;
  block[3] = &unk_1E8EA1310;
  v9 = v6;
  v10 = a2;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __94__SBAssistantController_siriPresentation_requestsDismissalOfEffectsViewControllerWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 136);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__SBAssistantController_siriPresentation_requestsDismissalOfEffectsViewControllerWithHandler___block_invoke_171;
  v7[3] = &unk_1E8EA02D8;
  v7[4] = v4;
  v8 = v5;
  objc_msgSend(v6, "dismissSiriEffectsViewControllerWithCompletion:", v7);

}

void __94__SBAssistantController_siriPresentation_requestsDismissalOfEffectsViewControllerWithHandler___block_invoke_171(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "presentationContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAnyAssistantPresentablePresented") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 136);
    *(_QWORD *)(v2 + 136) = 0;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)siriPresentation:(id)a3 acquireElevatedEffectsViewControllerAssertionWithReason:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__SBAssistantController_siriPresentation_acquireElevatedEffectsViewControllerAssertionWithReason_handler___block_invoke;
  block[3] = &unk_1E8E9F7B8;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __106__SBAssistantController_siriPresentation_acquireElevatedEffectsViewControllerAssertionWithReason_handler___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 136), "acquireElevatedSiriEffectsViewControllerAssertionWithReason:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__SBAssistantController_siriPresentation_requestsPresentationWithOptions_withHandler___block_invoke;
  v12[3] = &unk_1E8EA10F0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a2;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __86__SBAssistantController_siriPresentation_requestsPresentationWithOptions_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v24 = v3;
    v25 = 2114;
    v26 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  v5 = *(void **)(a1 + 32);
  v20 = 0;
  objc_msgSend(v5, "_currentSessionCreatingIfNeededWithFailureExplanation:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const __CFString *)v20;
  v8 = (void *)v7;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", *(double *)&kSBAssistantDefaultAnimationDuration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __86__SBAssistantController_siriPresentation_requestsPresentationWithOptions_withHandler___block_invoke_172;
    v18[3] = &unk_1E8E9E8D0;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v6, "presentSiriPresentationViewController:withAnimationFactory:siriPresentationOptions:completion:", v11, v9, v10, v18);
    v12 = v19;
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    if (v7)
      v16 = v7;
    else
      v16 = CFSTR("<no reason provided>");
    v21 = *MEMORY[0x1E0CB2D68];
    v22 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 1, v9);
    v17 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 16))(v13, 0, v17);
    v12 = v8;
    v8 = (void *)v17;
  }

}

uint64_t __86__SBAssistantController_siriPresentation_requestsPresentationWithOptions_withHandler___block_invoke_172(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke;
  v12[3] = &unk_1E8EA10F0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a2;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v13 = v3;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_173;
  v10[3] = &unk_1E8EA02D8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v6 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v10);
  if (objc_msgSend(*(id *)(a1 + 40), "shouldTurnScreenOff"))
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_3;
    v8[3] = &unk_1E8E9E8D0;
    v9 = v6;
    objc_msgSend(v7, "_turnScreenOffWithCompletion:", v8);

  }
  else
  {
    v6[2](v6);
  }

}

void __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_173(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_2;
  v2[3] = &unk_1E8E9E8D0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "dismissAssistantViewInEverySceneIfNecessaryWithAnimation:factory:completion:", 1, 0, v2);

}

uint64_t __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __83__SBAssistantController_siriPresentation_requestsDismissalWithOptions_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)siriPresentation:(id)a3 isEnabledDidChange:(BOOL)a4
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke;
  v12[3] = &unk_1E8EA10F0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a2;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  v4 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBWorkspaceDialRequestForURL(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isValid")
    || (v7 = *(_QWORD *)(a1 + 32), *(_BYTE *)(v7 + 97)) && !*(_BYTE *)(v7 + 98))
  {
    objc_msgSend(*v4, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*v4, "punchoutStyle");
    if (!v11)
    {
      if (v5)
      {
        +[SBAssistantController _activationSettingsWithPunchoutStyle:](SBAssistantController, "_activationSettingsWithPunchoutStyle:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)SBApp;
        objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_182;
        v26[3] = &unk_1E8E9F598;
        v27 = *(id *)(a1 + 48);
        objc_msgSend(v18, "applicationOpenURL:withApplication:animating:activationSettings:origin:notifyLSOnFailure:withResult:", v5, 0, 1, v14, v19, 1, v26);

      }
      else
      {
        SBLogSiri();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_cold_1(a1, (uint64_t *)(a1 + 40), v22);

        v23 = *(_QWORD *)(a1 + 48);
        if (!v23)
          goto LABEL_21;
        FBSOpenApplicationErrorCreate();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v14);
      }
      goto LABEL_20;
    }
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationWithBundleIdentifier:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[SBAssistantController _activationSettingsWithPunchoutStyle:](SBAssistantController, "_activationSettingsWithPunchoutStyle:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)SBApp;
      objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_178;
      v28[3] = &unk_1E8E9F598;
      v29 = *(id *)(a1 + 48);
      objc_msgSend(v16, "applicationOpenURL:withApplication:animating:activationSettings:origin:notifyLSOnFailure:withResult:", v5, v14, 1, v15, v17, 1, v28);

    }
    else
    {
      SBLogSiri();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        _SBFLoggingMethodProem();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v31 = v24;
        v32 = 2112;
        v33 = v11;
        v34 = 2112;
        v35 = v25;
        _os_log_error_impl(&dword_1D0540000, v20, OS_LOG_TYPE_ERROR, "%{public}@ - Ignoring punchout since the specified app (%@) could not be found : request=%@", buf, 0x20u);

      }
      v21 = *(_QWORD *)(a1 + 48);
      if (!v21)
        goto LABEL_20;
      FBSOpenApplicationErrorCreate();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v15);
    }

LABEL_20:
    goto LABEL_21;
  }
  SBLogSiri();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Ignoring assisted tel: URL because assistant is dismissing or not visible", buf, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    FBSOpenApplicationErrorCreate();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);
LABEL_21:

  }
}

uint64_t __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_178(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

uint64_t __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_182(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

- (void)siriPresentation:(id)a3 setShowsHomeAffordance:(BOOL)a4
{
  -[SBAssistantGestureConfiguration assistantGestureConfiguration:didUpdateShouldShowHomeAffordance:](self->_gestureConfiguration, "assistantGestureConfiguration:didUpdateShouldShowHomeAffordance:", self->_gestureConfiguration, a4);
}

- (void)siriPresentation:(id)a3 didUpdateInputType:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SBAssistantController_siriPresentation_didUpdateInputType___block_invoke;
  v4[3] = &unk_1E8E9DE88;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __61__SBAssistantController_siriPresentation_didUpdateInputType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (v2)
  {
    objc_msgSend(v2, "presentationContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriPresentationOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__SBAssistantController_siriPresentation_didUpdateInputType___block_invoke_2;
    v7[3] = &__block_descriptor_40_e43_v16__0___SiriPresentationOptionsMutating__8l;
    v7[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "mutatedCopyWithMutator:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v5, "setSiriPresentationOptions:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setPresentationContext:", v5);

  }
}

uint64_t __61__SBAssistantController_siriPresentation_didUpdateInputType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInputType:", *(_QWORD *)(a1 + 32));
}

- (void)siriPresentation:(id)a3 setHomeAffordanceSuppression:(int64_t)a4
{
  -[SBAssistantGestureConfiguration assistantGestureConfiguration:didUpdateHomeAffordanceSuppression:](self->_gestureConfiguration, "assistantGestureConfiguration:didUpdateHomeAffordanceSuppression:", self->_gestureConfiguration, a4);
}

- (void)restrictSystemApertureToDefaultLayoutWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SAInvalidatable *systemApertureAssertion;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  if (!self->_systemApertureAssertion)
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "restrictSystemApertureToDefaultLayoutWithReason:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__SBAssistantController_restrictSystemApertureToDefaultLayoutWithReason___block_invoke;
    v8[3] = &unk_1E8EABB30;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v6, "addInvalidationBlock:", v8);
    systemApertureAssertion = self->_systemApertureAssertion;
    self->_systemApertureAssertion = (SAInvalidatable *)v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __73__SBAssistantController_restrictSystemApertureToDefaultLayoutWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSystemApertureAssertion:", 0);

}

- (void)invalidateSystemApertureAssertionWithReason:(id)a3
{
  SAInvalidatable *systemApertureAssertion;

  systemApertureAssertion = self->_systemApertureAssertion;
  if (systemApertureAssertion)
    -[SAInvalidatable invalidateWithReason:](systemApertureAssertion, "invalidateWithReason:", a3);
}

- (void)alertItemsController:(id)a3 didActivateAlertItem:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[SBAssistantController _isLocationTCCAlert:](self, "_isLocationTCCAlert:", v5))
  {
    SBLogSiri();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - observed did activate alert item: %{public}@, notifying siri location tcc presented.", (uint8_t *)&v8, 0x16u);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SiriPresentationSpringBoardMainScreenViewController didPresentLocationTCC:](self->_mainScreenSiriPresentation, "didPresentLocationTCC:", v5);
  }

}

- (void)alertItemsController:(id)a3 didDeactivateAlertItem:(id)a4 forReason:(int)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[SBAssistantController _isLocationTCCAlert:](self, "_isLocationTCCAlert:", v6))
  {
    SBLogSiri();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - observed did deactivate alert item: %{public}@, notifying siri location tcc dismissed.", (uint8_t *)&v9, 0x16u);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SiriPresentationSpringBoardMainScreenViewController didDismissLocationTCC:](self->_mainScreenSiriPresentation, "didDismissLocationTCC:", v6);
  }

}

- (BOOL)_isLocationTCCAlert:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "extensionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", CFSTR("com.apple.corelocation.CoreLocationVanillaWhenInUseAuthPromptPlugin")) & 1) != 0
      || (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.corelocation.CoreLocationRepromptAlwaysAuthPromptPlugin")) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v9 = objc_msgSend(v8, "isEqual:", CFSTR("com.apple.corelocation.CoreLocationTemporaryPreciseAuthPromptPlugin"));
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)unlockedDevice
{
  return self->_unlockedDevice;
}

- (BOOL)isSystemAssistantExperienceAvailable
{
  return self->_systemAssistantExperienceAvailable;
}

- (BOOL)isSystemAssistantExperienceEnabled
{
  return self->_systemAssistantExperienceEnabled;
}

- (BOOL)isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled
{
  return self->_systemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled;
}

- (BOOL)isSystemAssistantExperiencePersistentSiriEnabled
{
  return self->_systemAssistantExperiencePersistentSiriEnabled;
}

- (SBIdleTimerCoordinating)_idleTimerCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
}

- (void)_setIdleTimerCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_idleTimerCoordinator, a3);
}

- (SAInvalidatable)systemApertureAssertion
{
  return self->_systemApertureAssertion;
}

- (void)setSystemApertureAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureAssertion, a3);
}

- (SBAssistantSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_systemApertureAssertion, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_systemApertureFrames, 0);
  objc_storeStrong((id *)&self->_uiSceneTracker, 0);
  objc_storeStrong((id *)&self->_windowLevelAssertionManager, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_mainScreenSiriPresentation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_disableAssertion, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)assistantSession:(NSObject *)a3 requestsDismissalWithDismissalOptions:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ - assistant session requested dismissal but it isn't the current session, ignoring", (uint8_t *)&v5, 0xCu);

}

void __71__SBAssistantController_siriPresentation_requestsPunchout_withHandler___block_invoke_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 138543618;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - Ignoring punchout since it didn't specify an app nor a url : request=%@", (uint8_t *)&v7, 0x16u);

}

@end
