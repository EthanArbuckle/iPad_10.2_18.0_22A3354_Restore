@implementation SBPIPPegasusAdapter

- (BOOL)isStartingStoppingOrCancellingPictureInPictureForPIPController:(id)a3
{
  return -[PGPictureInPictureController isStartingStoppingOrCancellingPictureInPicture](self->_pegasusController, "isStartingStoppingOrCancellingPictureInPicture", a3);
}

- (BOOL)shouldStartPictureInPictureForPIPController:(id)a3 applicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5
{
  id v7;
  PGPictureInPictureController *pegasusController;
  void *v9;
  char v10;

  v7 = a5;
  if (objc_msgSend((id)objc_opt_class(), "_isAutoPictureInPictureSupported"))
  {
    pegasusController = self->_pegasusController;
    SBPIPApplicationForProcessIdentifier(pegasusController, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:](pegasusController, "shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:", v9, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_isAutoPictureInPictureSupported
{
  void *v3;
  void *v4;
  char v5;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pipDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowAutoPIP");

  return objc_msgSend(a1, "isSupported") & v5;
}

+ (BOOL)isSupported
{
  if (isSupported_onceToken != -1)
    dispatch_once(&isSupported_onceToken, &__block_literal_global_104);
  return isSupported_isPictureInPictureSupported;
}

- (BOOL)pipController:(id)a3 willBeginPIPInterruptionForAssertion:(id)a4
{
  PGPictureInPictureController *pegasusController;
  id v6;
  int64_t v7;
  void *v8;

  pegasusController = self->_pegasusController;
  v6 = a4;
  v7 = -[SBPIPPegasusAdapter _reasonForAssertion:](self, "_reasonForAssertion:", v6);
  objc_msgSend(v6, "cameraSensorAttributionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = -[PGPictureInPictureController pictureInPictureInterruptionBeganWithReason:attribution:](pegasusController, "pictureInPictureInterruptionBeganWithReason:attribution:", v7, v8);
  return v7;
}

- (int64_t)_reasonForAssertion:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "behaviorOverrideReason");
  if (v3 == 1)
    return 2;
  else
    return v3 == 2;
}

uint64_t __34__SBPIPPegasusAdapter_isSupported__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D6C9B8], "isPictureInPictureSupported");
  isSupported_isPictureInPictureSupported = result;
  return result;
}

- (SBPIPPegasusAdapter)init
{
  SBPIPPegasusAdapter *v2;
  PGPictureInPictureController *v3;
  PGPictureInPictureController *pegasusController;
  SBPIPAnalytics *v5;
  SBPIPAnalytics *analyticsHelper;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBPIPPegasusAdapter;
  v2 = -[SBPIPPegasusAdapter init](&v10, sel_init);
  if (v2)
  {
    v3 = (PGPictureInPictureController *)objc_alloc_init(MEMORY[0x1E0D6C9B8]);
    pegasusController = v2->_pegasusController;
    v2->_pegasusController = v3;

    -[PGPictureInPictureController setDelegate:](v2->_pegasusController, "setDelegate:", v2);
    v5 = objc_alloc_init(SBPIPAnalytics);
    analyticsHelper = v2->_analyticsHelper;
    v2->_analyticsHelper = v5;

    -[PGPictureInPictureController setAnalyticsDelegate:](v2->_pegasusController, "setAnalyticsDelegate:", v2->_analyticsHelper);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__updateHasIdleTimerBehaviors, *MEMORY[0x1E0D6C9D8], 0);

    -[PGPictureInPictureController addObserver:forKeyPath:options:context:](v2->_pegasusController, "addObserver:forKeyPath:options:context:", v2, CFSTR("pictureInPictureActive"), 1, 0);
    -[PGPictureInPictureController activateBackgroundPIPAuthorizationService](v2->_pegasusController, "activateBackgroundPIPAuthorizationService");
    objc_msgSend((id)SBApp, "bannerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTransitionObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[BSAbsoluteMachTimer invalidate](self->_pipDefaultContentSizeResetTimer, "invalidate");
  objc_msgSend((id)SBApp, "bannerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTransitionObserver:", self);

  if (objc_msgSend((id)objc_opt_class(), "isSupported"))
  {
    -[PGPictureInPictureController removeObserver:forKeyPath:](self->_pegasusController, "removeObserver:forKeyPath:", self, CFSTR("pictureInPictureActive"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

  }
  v5.receiver = self;
  v5.super_class = (Class)SBPIPPegasusAdapter;
  -[SBPIPPegasusAdapter dealloc](&v5, sel_dealloc);
}

- (void)setPIPController:(id)a3
{
  SBPIPControllerAdapterContextProviding **p_pipController;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_pipController = &self->_pipController;
  WeakRetained = objc_loadWeakRetained((id *)p_pipController);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_pipController, obj);
    v6 = obj;
  }

}

- (int64_t)contentTypeForPIPController:(id)a3
{
  return 0;
}

- (BOOL)isPresentingPictureInPictureForPIPController:(id)a3 applicationBundleIdentifier:(id)a4
{
  PGPictureInPictureController *pegasusController;
  id v5;
  void *v6;
  void *v7;

  pegasusController = self->_pegasusController;
  v5 = a4;
  -[PGPictureInPictureController activePictureInPictureApplication](pegasusController, "activePictureInPictureApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqualToString:", v5);
  return (char)v6;
}

- (void)pipController:(id)a3 willEndPIPInterruptionForAssertion:(id)a4
{
  PGPictureInPictureController *pegasusController;
  id v6;
  int64_t v7;
  id v8;

  pegasusController = self->_pegasusController;
  v6 = a4;
  v7 = -[SBPIPPegasusAdapter _reasonForAssertion:](self, "_reasonForAssertion:", v6);
  objc_msgSend(v6, "cameraSensorAttributionBundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PGPictureInPictureController pictureInPictureInterruptionEndedWithReason:attribution:](pegasusController, "pictureInPictureInterruptionEndedWithReason:attribution:", v7, v8);
}

- (BOOL)isStoppingOrCancellingPictureForPIPController:(id)a3 applicationWithBundleIdentifier:(id)a4 scenePersistenceIdentifier:(id)a5
{
  PGPictureInPictureController *pegasusController;
  id v7;
  void *v8;

  pegasusController = self->_pegasusController;
  v7 = a5;
  -[PGPictureInPictureController existingPictureInPictureApplicationForBundleIdentifier:](pegasusController, "existingPictureInPictureApplicationForBundleIdentifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(pegasusController) = -[PGPictureInPictureController isStoppingOrCancellingPictureInPictureForApplication:sceneSessionPersistentIdentifier:](pegasusController, "isStoppingOrCancellingPictureInPictureForApplication:sceneSessionPersistentIdentifier:", v8, v7);

  return (char)pegasusController;
}

- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3
{
  return -[PGPictureInPictureController tetheringModeForSceneSessionPersistentIdentifier:](self->_pegasusController, "tetheringModeForSceneSessionPersistentIdentifier:", a3);
}

- (void)pipController:(id)a3 didStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  PGPictureInPictureController *pegasusController;
  id v11;
  id v12;
  id v13;

  v7 = a6;
  pegasusController = self->_pegasusController;
  v11 = a7;
  v12 = a5;
  SBPIPApplicationForProcessIdentifier(pegasusController, a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureController startPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:animated:completionHandler:](pegasusController, "startPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:animated:completionHandler:", v13, v12, v7, v11);

}

- (void)pipController:(id)a3 didCancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5
{
  PGPictureInPictureController *pegasusController;
  id v7;
  id v8;

  pegasusController = self->_pegasusController;
  v7 = a5;
  SBPIPApplicationForProcessIdentifier(pegasusController, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureController cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:](pegasusController, "cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:", v8, v7);

}

- (id)pipController:(id)a3 morphAnimatorDataSourceForMorphAnimatorController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SBPIPContentViewLayoutSettings *v15;
  void *v16;
  SBPIPContentViewLayoutSettings *v17;
  SBPIPMorphAnimatorDataSource *v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "scenePersistenceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBPIPApplicationForProcessIdentifier(self->_pegasusController, objc_msgSend(v6, "targetProcessIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PGPictureInPictureController contentTypePictureInPictureApplication:sceneSessionPersistentIdentifier:](self->_pegasusController, "contentTypePictureInPictureApplication:sceneSessionPersistentIdentifier:", v9, v8);
  -[PGPictureInPictureController preferredContentSizeForInteractivelyEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:](self->_pegasusController, "preferredContentSizeForInteractivelyEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:", v9, v8);
  v12 = v11;
  v14 = v13;
  v15 = [SBPIPContentViewLayoutSettings alloc];
  +[SBPIPContentViewLayoutMetrics pegasusMetricsForContentType:](SBPIPContentViewLayoutMetrics, "pegasusMetricsForContentType:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SBPIPContentViewLayoutSettings initWithPlatformMetrics:contentSize:](v15, "initWithPlatformMetrics:contentSize:", v16, v12, v14);

  v18 = -[SBPIPMorphAnimatorDataSource initWithMorphAnimatorController:pipController:pegasusController:contentViewLayoutSettings:]([SBPIPMorphAnimatorDataSource alloc], "initWithMorphAnimatorController:pipController:pegasusController:contentViewLayoutSettings:", v6, v7, self->_pegasusController, v17);
  return v18;
}

- (void)pipController:(id)a3 willStartPictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a4
{
  -[PGPictureInPictureController startPictureInPictureTestActionForApplicationWithBundleIdentifier:](self->_pegasusController, "startPictureInPictureTestActionForApplicationWithBundleIdentifier:", a4);
}

- (void)pipController:(id)a3 willRestorePictureInPictureForTestForApplicationWithBundleIdentifier:(id)a4
{
  -[PGPictureInPictureController restorePictureInPictureTestActionForApplicationWithBundleIdentifier:](self->_pegasusController, "restorePictureInPictureTestActionForApplicationWithBundleIdentifier:", a4);
}

- (BOOL)preventStashAssertionsForPIPController:(id)a3
{
  id WeakRetained;
  int v5;
  BOOL v6;
  void *v7;

  v5 = -[PGPictureInPictureController isStartingStoppingOrCancellingPictureInPicture](self->_pegasusController, "isStartingStoppingOrCancellingPictureInPicture", a3);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
    if ((objc_msgSend(WeakRetained, "hasCameraInterruptionForBundleIdentifier:", CFSTR("com.apple.avconferenced")) & 1) != 0)
    {
      v6 = 1;
LABEL_5:

      return v6;
    }
  }
  -[PGPictureInPictureController activePictureInPictureApplications](self->_pegasusController, "activePictureInPictureApplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "count") == 0;

  if (v5)
    goto LABEL_5;
  return v6;
}

- (void)_bannerPresentableWillAnimateTransition:(id)a3 isPresentation:(BOOL)a4 isDismissal:(BOOL)a5 isFullScreen:(BOOL)a6 withTransitionCoordinator:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  BOOL v25;
  BOOL v26;
  char v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;
  char v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  SBPIPPegasusAdapter *v35;
  _QWORD v36[4];
  id v37;
  SBPIPPegasusAdapter *v38;

  v8 = a5;
  v9 = a4;
  v11 = a3;
  v12 = a7;
  v13 = -[SBPIPPegasusAdapter _presentableIsDodgeableAndStatusBarSuppressing:](self, "_presentableIsDodgeableAndStatusBarSuppressing:", v11);
  v14 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke;
  v36[3] = &unk_1E8E9E820;
  v15 = v11;
  v37 = v15;
  v38 = self;
  v16 = (void *)MEMORY[0x1D17E5550](v36);
  v33[0] = v14;
  v33[1] = 3221225472;
  v33[2] = __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_2;
  v33[3] = &unk_1E8E9E820;
  v17 = v15;
  v34 = v17;
  v35 = self;
  v18 = MEMORY[0x1D17E5550](v33);
  v19 = (void *)v18;
  if (v13)
  {
    if (v9 || v8)
    {
      if (v9)
        v18 = (uint64_t)v16;
      (*(void (**)(void))(v18 + 16))();
    }
    v29[0] = v14;
    v29[1] = 3221225472;
    v29[2] = __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_3;
    v29[3] = &unk_1E8EA92E0;
    v29[4] = self;
    v30 = v17;
    v31 = v13 & ~(v9 || v8);
    v32 = a6;
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_4;
    v21[3] = &unk_1E8EA9308;
    v25 = v9;
    v23 = v19;
    v26 = v8;
    v24 = v16;
    v21[4] = self;
    v22 = v30;
    v27 = v31;
    v28 = a6;
    objc_msgSend(v12, "animateAlongsideTransition:completion:", v29, v21);

  }
}

void __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    goto LABEL_5;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  if (v4)
    NSLog(CFSTR("Tried to add or remove a nil presentable."));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
LABEL_5:
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 16);
      *(_QWORD *)(v7 + 16) = v6;

      v2 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    }
    objc_msgSend(v5, "addObject:", v2);
  }
}

void __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(a1 + 32))
    goto LABEL_5;
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
    NSLog(CFSTR("Tried to add or remove a nil presentable."));
  if (*(_QWORD *)(a1 + 32))
  {
LABEL_5:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:");
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count"))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 16);
      *(_QWORD *)(v4 + 16) = 0;

    }
  }
}

uint64_t __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateBannerInsetsForExpanseBanner:isSizeChanging:isFullScreen:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppStatusBarSettingsAssertion");
}

uint64_t __129__SBPIPPegasusAdapter__bannerPresentableWillAnimateTransition_isPresentation_isDismissal_isFullScreen_withTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v4 = a1 + 48;
    }
    else
    {
      if (!*(_BYTE *)(a1 + 65))
      {
LABEL_8:
        objc_msgSend(*(id *)(a1 + 32), "_updateBannerInsetsForExpanseBanner:isSizeChanging:isFullScreen:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 66), *(unsigned __int8 *)(a1 + 67));
        return objc_msgSend(*(id *)(a1 + 32), "_updateAppStatusBarSettingsAssertion");
      }
      v4 = a1 + 56;
    }
    (*(void (**)(void))(*(_QWORD *)v4 + 16))();
    goto LABEL_8;
  }
  return result;
}

- (void)bannerManager:(id)a3 containerWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  -[SBPIPPegasusAdapter _bannerPresentableWillAnimateTransition:isPresentation:isDismissal:isFullScreen:withTransitionCoordinator:](self, "_bannerPresentableWillAnimateTransition:isPresentation:isDismissal:isFullScreen:withTransitionCoordinator:", 0, 0, 0, 0, a5, a4.width, a4.height);
}

- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  -[SBPIPPegasusAdapter _bannerPresentableWillAnimateTransition:isPresentation:isDismissal:isFullScreen:withTransitionCoordinator:](self, "_bannerPresentableWillAnimateTransition:isPresentation:isDismissal:isFullScreen:withTransitionCoordinator:", a4, 1, 0, 0, a5);
}

- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  -[SBPIPPegasusAdapter _bannerPresentableWillAnimateTransition:isPresentation:isDismissal:isFullScreen:withTransitionCoordinator:](self, "_bannerPresentableWillAnimateTransition:isPresentation:isDismissal:isFullScreen:withTransitionCoordinator:", a4, 0, 1, 0, a5);
}

- (void)bannerManager:(id)a3 presentable:(id)a4 willTransitionToSize:(CGSize)a5 withTransitionCoordinator:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  _BOOL8 v17;
  id v18;

  height = a5.height;
  width = a5.width;
  v18 = a4;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "windowSceneForPresentable:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bannerWindowInWindowScene:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "frame");
    v17 = height == v16 && width == v15;
  }
  else
  {
    v17 = 0;
  }
  -[SBPIPPegasusAdapter _bannerPresentableWillAnimateTransition:isPresentation:isDismissal:isFullScreen:withTransitionCoordinator:](self, "_bannerPresentableWillAnimateTransition:isPresentation:isDismissal:isFullScreen:withTransitionCoordinator:", v18, 0, 0, v17, v11);

}

- (void)_updateBannerInsetsForExpanseBanner:(id)a3 isSizeChanging:(BOOL)a4 isFullScreen:(BOOL)a5
{
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;
  BOOL v13;

  v8 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__SBPIPPegasusAdapter__updateBannerInsetsForExpanseBanner_isSizeChanging_isFullScreen___block_invoke;
  block[3] = &unk_1E8EA9330;
  block[4] = self;
  v11 = v8;
  v12 = a4;
  v13 = a5;
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __87__SBPIPPegasusAdapter__updateBannerInsetsForExpanseBanner_isSizeChanging_isFullScreen___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actuallyUpdateBannerInsetsForExpanseBanner:isSizeChanging:isFullScreen:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
}

- (void)_actuallyUpdateBannerInsetsForExpanseBanner:(id)a3 isSizeChanging:(BOOL)a4 isFullScreen:(BOOL)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  double v12;
  double v13;
  NSMutableSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double MidY;
  double v53;
  void *v54;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  id WeakRetained;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v9 = -[NSMutableSet count](self->_presentedExpanseBanners, "count");
    v10 = -[NSMutableSet count](self->_presentedExpanseBanners, "count");
    v11 = !v9 || a5;
    if (v10 <= 1)
    {
      v12 = 0.0;
      if (v11)
        goto LABEL_30;
    }
    v13 = 0.0;
    if (-[NSMutableSet count](self->_presentedExpanseBanners, "count"))
      v12 = 1.79769313e308;
    else
      v12 = 0.0;
    if (-[NSMutableSet count](self->_presentedExpanseBanners, "count"))
      v13 = 2.22507386e-308;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v14 = self->_presentedExpanseBanners;
    v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v68;
      v66 = 0.0;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          v64 = v13;
          v65 = v12;
          if (*(_QWORD *)v68 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v19, "viewController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "bounds");
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v29 = v28;
          objc_msgSend(v19, "viewController");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "bannerContentOutsets");
          v32 = v31;
          v34 = v33;
          v36 = v35;
          v38 = v37;

          v39 = v23 + v34;
          v40 = v25 + v32;
          v41 = v27 - (v34 + v38);
          v42 = v29 - (v32 + v36);
          objc_msgSend(v21, "window");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "bounds");
          v45 = v44;
          v47 = v46;
          v49 = v48;
          v51 = v50;

          v73.origin.x = v45;
          v73.origin.y = v47;
          v73.size.width = v49;
          v73.size.height = v51;
          MidY = CGRectGetMidY(v73);
          v53 = v66;
          if (MidY >= v66)
            v53 = MidY;
          v66 = v53;
          objc_msgSend(v21, "window");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "convertRect:fromView:", v21, v39, v40, v41, v42);
          v77.origin.x = v45;
          v77.origin.y = v47;
          v77.size.width = v49;
          v77.size.height = v51;
          v75 = CGRectIntersection(v74, v77);
          x = v75.origin.x;
          y = v75.origin.y;
          width = v75.size.width;
          height = v75.size.height;

          v76.origin.x = x;
          v76.origin.y = y;
          v76.size.width = width;
          v76.size.height = height;
          MaxY = CGRectGetMaxY(v76);
          v13 = v64;
          v12 = v65;
          if (MaxY < v65)
            v12 = MaxY;
          if (MaxY >= v64)
            v13 = MaxY;

        }
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      }
      while (v16);
    }
    else
    {
      v66 = 0.0;
    }

    if (v13 <= v66)
      v12 = v13;
    if (v12 <= v66)
    {
LABEL_30:
      WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
      objc_msgSend(WeakRetained, "windowSceneManager");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "activeDisplayWindowScene");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v62, "pictureInPictureManager");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "applyPictureInPictureInsets:forSource:", 6, v12, 0.0, 0.0, 0.0);

    }
  }
}

- (void)_updateAppStatusBarSettingsAssertion
{
  NSMutableSet *presentedExpanseBanners;
  void *v4;
  SBWindowSceneStatusBarSettingsAssertion *appStatusBarSettingsAssertion;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBMutableStatusBarSettings *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  SBWindowSceneStatusBarSettingsAssertion *v14;
  SBWindowSceneStatusBarSettingsAssertion *v15;
  SBWindowSceneStatusBarSettingsAssertion *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  presentedExpanseBanners = self->_presentedExpanseBanners;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__SBPIPPegasusAdapter__updateAppStatusBarSettingsAssertion__block_invoke;
  v19[3] = &unk_1E8EA1118;
  v19[4] = self;
  -[NSMutableSet bs_firstObjectPassingTest:](presentedExpanseBanners, "bs_firstObjectPassingTest:", v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
  if (!v4)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    -[SBWindowSceneStatusBarSettingsAssertion invalidateWithAnimationParameters:](appStatusBarSettingsAssertion, "invalidateWithAnimationParameters:", v18);

    v7 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = 0;
    goto LABEL_5;
  }
  if (!appStatusBarSettingsAssertion)
  {
    objc_msgSend((id)SBApp, "bannerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowSceneForPresentable:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "statusBarManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assertionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(SBMutableStatusBarSettings);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DB0B58], *MEMORY[0x1E0DB0B60], *MEMORY[0x1E0DB0BD0], *MEMORY[0x1E0DB0BE0], *MEMORY[0x1E0DB0AC8], *MEMORY[0x1E0DB0B50], *MEMORY[0x1E0DB0AF8], *MEMORY[0x1E0DB0BF8], *MEMORY[0x1E0DB0BD8], CFSTR("com.apple.systemstatus.background-activity.CallRecording"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableStatusBarSettings setBackgroundActivitiesToSuppress:](v10, "setBackgroundActivitiesToSuppress:", v11);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v9, "newSettingsAssertionWithSettings:atLevel:reason:", v10, 7, v13);
    v15 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = v14;

    v16 = self->_appStatusBarSettingsAssertion;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    -[SBWindowSceneStatusBarSettingsAssertion acquireWithAnimationParameters:](v16, "acquireWithAnimationParameters:", v17);

LABEL_5:
  }

}

uint64_t __59__SBPIPPegasusAdapter__updateAppStatusBarSettingsAssertion__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentableIsDodgeableAndStatusBarSuppressing:", a2);
}

- (BOOL)_presentableIsDodgeableAndStatusBarSuppressing:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "requesterIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.conversationController.HUD")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.conversationController.Session")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CopresenceApp.DefaultRequester"));
  }

  return v6;
}

- (void)containerViewControllerStartReducingResourcesUsage:(id)a3
{
  void *v4;
  id v5;

  if (!self->_isReducingResourcesUsage)
  {
    self->_isReducingResourcesUsage = 1;
    objc_msgSend(a3, "contentViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureController startPictureInPictureResourcesUsageReductionForApplication:requestingViewController:](self->_pegasusController, "startPictureInPictureResourcesUsageReductionForApplication:requestingViewController:", v4, v5);

  }
}

- (void)containerViewControllerStopReducingResourcesUsage:(id)a3
{
  void *v4;
  id v5;

  if (self->_isReducingResourcesUsage)
  {
    self->_isReducingResourcesUsage = 0;
    objc_msgSend(a3, "contentViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureController stopPictureInPictureResourcesUsageReductionForApplication:requestingViewController:](self->_pegasusController, "stopPictureInPictureResourcesUsageReductionForApplication:requestingViewController:", v4, v5);

  }
}

- (void)_updateHideFromClonedDisplaysAssertion
{
  id WeakRetained;
  void *v4;
  int v5;
  BSInvalidatable *hideFaceTimePIPFromSharePlayScreenSharingAssertion;
  BSInvalidatable *v7;
  void *v8;
  void *v9;
  BSInvalidatable *v10;
  BSInvalidatable *v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  objc_msgSend(WeakRetained, "containerViewControllersOnWindowScene:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "bs_containsObjectPassingTest:", &__block_literal_global_30_1);

  hideFaceTimePIPFromSharePlayScreenSharingAssertion = self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion;
  if (!v5)
  {
    -[BSInvalidatable invalidate](hideFaceTimePIPFromSharePlayScreenSharingAssertion, "invalidate");
    v7 = self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion;
    self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion = 0;
LABEL_6:

    return;
  }
  if (!hideFaceTimePIPFromSharePlayScreenSharingAssertion)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inCallPresentationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hideSharePlayContentFromSharedScreenController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:", CFSTR("FaceTime PIP"));
    v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion;
    self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion = v10;

    v7 = (BSInvalidatable *)v12;
    goto LABEL_6;
  }
}

uint64_t __61__SBPIPPegasusAdapter__updateHideFromClonedDisplaysAssertion__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prefersHiddenFromClonedDisplay");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString **v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  id WeakRetained;
  void *v24;
  void *v25;
  BOOL v26;
  char v27;
  BSAbsoluteMachTimer *pipDefaultContentSizeResetTimer;
  BSAbsoluteMachTimer *v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  BSAbsoluteMachTimer *v33;
  BSAbsoluteMachTimer *v34;
  BSAbsoluteMachTimer *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  BSAbsoluteMachTimer *v40;
  id v41;
  id v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  BSAbsoluteMachTimer **vala;
  id obj;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  id location;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v46 = a4;
  v9 = a5;
  v45 = v8;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("pictureInPictureActive")))
  {
    v42 = v9;
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v10, "BOOLValue");

    +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentTestName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44
      && ((objc_msgSend(v44, "containsString:", CFSTR("PIP")) & 1) != 0
       || objc_msgSend(v44, "containsString:", CFSTR("PiP"))))
    {
      v12 = SBApplicationTestingPIPIsActiveNotificationName;
      if (!v43)
        v12 = SBApplicationTestingPIPIsNoLongerActiveNotificationName;
      v13 = (void *)MEMORY[0x1E0CB37D0];
      v14 = *v12;
      objc_msgSend(v13, "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:", v14, 0);

    }
    if ((v43 & 1) == 0)
    {
      -[PGPictureInPictureController activeSceneSessionIdentifiersByApplication](self->_pegasusController, "activeSceneSessionIdentifiersByApplication");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(v51, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      if (v52)
      {
        v50 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v61 != v50)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v51, "objectForKey:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v57;
              do
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v57 != v20)
                    objc_enumerationMutation(v18);
                  v22 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
                  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
                  objc_msgSend(WeakRetained, "pictureInPictureMorphAnimatorControllerForProcessIdentifier:scenePersistenceIdentifier:", objc_msgSend(v17, "processIdentifier"), v22);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v24)
                  {
                    objc_msgSend(v24, "viewMorphAnimator");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = objc_msgSend(v25, "direction") == 1;

                    if (!v26)
                      objc_msgSend(v24, "cancel");
                  }

                }
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
              }
              while (v19);
            }

          }
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        }
        while (v52);
      }

    }
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
        v27 = 1;
      else
        v27 = v43;
      if ((v27 & 1) != 0)
        goto LABEL_32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "userInterfaceIdiom") == 1;

      if (((v32 | v43) & 1) != 0)
      {
LABEL_32:
        pipDefaultContentSizeResetTimer = self->_pipDefaultContentSizeResetTimer;
        vala = &self->_pipDefaultContentSizeResetTimer;
        -[BSAbsoluteMachTimer invalidate](pipDefaultContentSizeResetTimer, "invalidate");
        v29 = *vala;
        *vala = 0;

        v30 = objc_alloc_init(MEMORY[0x1E0DA9FC0]);
        objc_msgSend(v30, "setInitiallyUsesMinimumPreferredContentSize:", 0);

LABEL_35:
        v9 = v42;
        goto LABEL_36;
      }
    }
    -[BSAbsoluteMachTimer invalidate](self->_pipDefaultContentSizeResetTimer, "invalidate");
    v33 = self->_pipDefaultContentSizeResetTimer;
    self->_pipDefaultContentSizeResetTimer = 0;

    v34 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBPIPDefaultContentSizeResetTimer"));
    v35 = self->_pipDefaultContentSizeResetTimer;
    self->_pipDefaultContentSizeResetTimer = v34;

    objc_initWeak(&location, self);
    +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "interactionSettings");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "defaultContentSizeResetTimeout");
    v39 = v38;

    v40 = self->_pipDefaultContentSizeResetTimer;
    v41 = MEMORY[0x1E0C80D38];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __70__SBPIPPegasusAdapter_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v53[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v54, &location);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v40, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v53, v39 * 60.0, 0.0);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
    goto LABEL_35;
  }
LABEL_36:

}

void __70__SBPIPPegasusAdapter_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[5], "invalidate");
    v2 = v4[5];
    v4[5] = 0;

    v3 = objc_alloc_init(MEMORY[0x1E0DA9FC0]);
    objc_msgSend(v3, "setInitiallyUsesMinimumPreferredContentSize:", 1);

    WeakRetained = v4;
  }

}

- (void)pictureInPictureController:(id)a3 didCreatePictureInPictureViewController:(id)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  SBPIPPegasusContainerAdapter *v20;
  SBPIPContainerViewController *v21;
  void *v22;
  void *v23;
  SBPIPContainerViewController *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a4;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      _SBFLoggingMethodProem();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ needs to be invoked on the main thread!"), v9);

    }
  }
  if ((objc_msgSend((id)objc_opt_class(), "isSupported") & 1) == 0)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      _SBFLoggingMethodProem();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ invoked on a device that does not support PIP."), v12);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  v14 = objc_msgSend(v6, "contentType");
  if (v14 == 4)
    v15 = 1;
  else
    v15 = 2 * (v14 == 6);
  v25 = *MEMORY[0x1E0DABEA0];
  v26[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DA9D78];
  v18 = v16;
  objc_msgSend(v17, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "emitEvent:withPayload:", 24, v18);

  v20 = -[SBPIPPegasusContainerAdapter initWithPictureInPictureViewController:]([SBPIPPegasusContainerAdapter alloc], "initWithPictureInPictureViewController:", v6);
  v21 = [SBPIPContainerViewController alloc];
  +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "interactionSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SBPIPContainerViewController initWithPIPController:interactionSettings:adapter:](v21, "initWithPIPController:interactionSettings:adapter:", WeakRetained, v23, v20);

  -[SBPIPContainerViewController setContentZOrderPriority:](v24, "setContentZOrderPriority:", v15);
  -[SBPIPContainerViewController addObserver:](v24, "addObserver:", self);
  objc_msgSend(WeakRetained, "addContainerViewController:dataSource:", v24, v20);
  -[SBPIPPegasusAdapter _updateHideFromClonedDisplaysAssertion](self, "_updateHideFromClonedDisplaysAssertion");

}

- (void)pictureInPictureController:(id)a3 didRequestStopForPictureInPictureViewController:(id)a4 sourceSceneSessionIdentifier:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  objc_msgSend(v13, "application");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.InCallService")))
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inCallPresentationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __136__SBPIPPegasusAdapter_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke;
    v18[3] = &unk_1E8EA9398;
    v18[4] = self;
    v19 = v10;
    v20 = v13;
    v21 = v12;
    v23 = v6;
    v22 = v14;
    objc_msgSend(v17, "ensureSwitcherInclusionForRestoringFromPIPForSceneWithPersistenceIdentifier:completion:", v21, v18);

  }
  else
  {
    -[SBPIPPegasusAdapter _postEnsuredInSwitcher_pictureInPictureController:didRequestStopForPictureInPictureViewController:sourceSceneSessionIdentifier:animated:](self, "_postEnsuredInSwitcher_pictureInPictureController:didRequestStopForPictureInPictureViewController:sourceSceneSessionIdentifier:animated:", v10, v13, v12, v6);
  }

}

uint64_t __136__SBPIPPegasusAdapter_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_postEnsuredInSwitcher_pictureInPictureController:didRequestStopForPictureInPictureViewController:sourceSceneSessionIdentifier:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
  SBLogPIP();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __136__SBPIPPegasusAdapter_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_postEnsuredInSwitcher_pictureInPictureController:(id)a3 didRequestStopForPictureInPictureViewController:(id)a4 sourceSceneSessionIdentifier:(id)a5 animated:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  PGPictureInPictureController *pegasusController;
  void *v55;
  PGPictureInPictureController *v56;
  void *v57;
  id v58;
  void *v59;
  int v60;
  int v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  int v71;
  int v72;
  uint64_t v73;
  SBPIPPegasusAdapter *v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id WeakRetained;
  void *v82;
  void *v83;
  void *v84;
  id obj;
  BOOL v86;
  BOOL v87;
  int v88;
  int v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  SBPIPPegasusAdapter *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  char v103;
  _QWORD v104[4];
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  SBPIPPegasusAdapter *v110;
  _QWORD v111[4];
  id v112;
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[4];
  id v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  v11 = v9;
  objc_msgSend(v11, "application");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "bundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v83 = v11;
  objc_msgSend(v11, "_sbWindowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = self;
  v75 = -[SBPIPPegasusAdapter _layoutStateContainsSceneForSourceSceneSessionIdentifier:bundleIdentifier:windowScene:](self, "_layoutStateContainsSceneForSourceSceneSessionIdentifier:bundleIdentifier:windowScene:", v10, v12, v13);
  objc_msgSend(v13, "switcherController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v14, "isAnySwitcherVisible");
  v71 = objc_msgSend(v14, "isInAnyPeekState");
  v79 = v14;
  v73 = objc_msgSend(v14, "unlockedEnvironmentMode");
  v84 = v13;
  objc_msgSend(v13, "switcherController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v15, "isChamoisWindowingUIEnabled");

  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sceneManagerForPersistenceIdentifier:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "existingSceneHandleForPersistenceIdentifier:", v10);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = 1;
  v82 = v10;
  v76 = (void *)v12;
  v80 = v17;
  if (v10 && v12)
  {
    +[SBMainSwitcherControllerCoordinator sharedInstanceIfExists](SBMainSwitcherControllerCoordinator, "sharedInstanceIfExists");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_recentAppLayoutsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "recentsForBundleIdentifier:includingHiddenAppLayouts:", v12, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    obj = v22;
    v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v140, 16);
    if (v92)
    {
      v86 = 0;
      v87 = 0;
      v90 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v92; ++i)
        {
          if (*(_QWORD *)v136 != v90)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
          v131 = 0u;
          v132 = 0u;
          v133 = 0u;
          v134 = 0u;
          objc_msgSend(v24, "allItems");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v131, v139, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v132;
            while (2)
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v132 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
                objc_msgSend(v30, "uniqueIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "sceneIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v31, "isEqualToString:", v32);

                if (v33)
                {
                  v87 = objc_msgSend(v24, "environment") == 2;
                  if (v89)
                  {
                    objc_msgSend(v24, "layoutAttributesForItem:", v30);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v86 = objc_msgSend(v34, "occlusionState") != 1;

                  }
                  else
                  {
                    v86 = 0;
                  }
                  goto LABEL_20;
                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v131, v139, 16);
              if (v27)
                continue;
              break;
            }
          }
LABEL_20:

        }
        v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v140, 16);
      }
      while (v92);
    }
    else
    {
      v86 = 0;
      v87 = 0;
    }

    v18 = v86;
    v19 = !v87;
    v17 = v80;
  }
  v88 = v18;
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "currentTransaction");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isUILocked");

  v39 = 1;
  objc_msgSend(WeakRetained, "hideContainersExcludingContainerForContentViewControllerAndTetheredOnes:animated:", v83, 1);
  objc_msgSend(v94, "application");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "displayIdentity");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDeviceApplicationSceneEntity entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:](SBDeviceApplicationSceneEntity, "entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:", v40, v82, v17, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v94, "sceneIfExists");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "settings");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v40) = objc_msgSend(v44, "isForeground");

  v93 = v43;
  if (!(_DWORD)v40)
  {
    v91 = 0;
LABEL_31:
    v49 = v84;
    v50 = v42;
    goto LABEL_32;
  }
  objc_msgSend((id)SBApp, "windowSceneManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "settings");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "displayIdentity");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "windowSceneForDisplayIdentity:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v48 == 0;
  if (!v48)
  {
    v91 = 0;
    goto LABEL_31;
  }
  v49 = v84;
  v50 = v42;
  if (v48 != v84)
  {
    v51 = v82;
    v52 = v76;
    v53 = -[SBPIPPegasusAdapter _layoutStateContainsSceneForSourceSceneSessionIdentifier:bundleIdentifier:windowScene:](v74, "_layoutStateContainsSceneForSourceSceneSessionIdentifier:bundleIdentifier:windowScene:", v82, v76, v48) ^ 1;
    pegasusController = v74->_pegasusController;
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke;
    v128[3] = &unk_1E8EA93C0;
    v55 = WeakRetained;
    v129 = WeakRetained;
    v130 = v84;
    v56 = pegasusController;
    v57 = v77;
    -[PGPictureInPictureController stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:](v56, "stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:", v77, v82, v53, v128);

    v58 = v129;
    v59 = v78;
LABEL_49:
    v42 = v50;
    goto LABEL_50;
  }
  v91 = v48;
  if (!v19 && !v75)
    goto LABEL_41;
LABEL_32:
  v60 = v89 ^ 1;
  if (v73 != 3)
    v60 = 1;
  if (((v60 | v75) & 1) != 0)
  {
    v61 = v72 | v71 | v75;
    if (v36)
      v61 = 1;
    v59 = v78;
    v51 = v82;
    if ((v61 | v38) == 1)
    {
      v57 = v77;
      if (v88)
      {
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_5;
        v114[3] = &unk_1E8EA93E8;
        v115 = v78;
        v116 = v77;
        v117 = v82;
        v55 = WeakRetained;
        v118 = WeakRetained;
        v119 = v49;
        -[SBPIPPegasusAdapter _activateSceneWithPersistenceIdentifier:pictureInPictureViewController:completion:](v74, "_activateSceneWithPersistenceIdentifier:pictureInPictureViewController:completion:", v117, v83, v114);

        v58 = v115;
      }
      else
      {
        v111[0] = MEMORY[0x1E0C809B0];
        v111[1] = 3221225472;
        v111[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_7;
        v111[3] = &unk_1E8EA93C0;
        v55 = WeakRetained;
        v112 = WeakRetained;
        v113 = v49;
        objc_msgSend(v78, "stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:", v77, v82, 1, v111);

        v58 = v112;
      }
      v52 = v76;
      v48 = v91;
      goto LABEL_49;
    }
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_8;
    v104[3] = &unk_1E8EA94B0;
    v105 = v78;
    v106 = v77;
    v107 = v82;
    v108 = WeakRetained;
    v109 = v84;
    v110 = v74;
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_68;
    v95[3] = &unk_1E8EA9560;
    v57 = v77;
    v96 = v106;
    v97 = v107;
    v98 = v74;
    v52 = v76;
    v99 = v76;
    v55 = WeakRetained;
    v100 = v109;
    v103 = v89;
    v101 = v105;
    v49 = v84;
    v102 = v108;
    objc_msgSend(v102, "restoreContentViewController:appSceneEntity:morphAnimatorConfigurationBlock:completion:", v83, v42, v104, v95);

    v58 = v105;
    v48 = v91;
  }
  else
  {
LABEL_41:
    v42 = v50;
    objc_msgSend(v50, "setFlag:forActivationSetting:", 1, 56);
    v55 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "contentType"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setObject:forActivationSetting:", v62, 57);

    v48 = v91;
    if (v39)
      v63 = v49;
    else
      v63 = v91;
    v64 = v63;
    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "_sbDisplayConfiguration");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "createRequestWithOptions:displayConfiguration:", 0, v66);
    v58 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setOriginatingProcess:", v67);

    v68 = MEMORY[0x1E0C809B0];
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_2;
    v126[3] = &unk_1E8E9EE50;
    v127 = v50;
    objc_msgSend(v58, "modifyApplicationContext:", v126);
    v120[0] = v68;
    v120[1] = 3221225472;
    v120[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_3;
    v120[3] = &unk_1E8EA93E8;
    v59 = v78;
    v121 = v78;
    v122 = v77;
    v51 = v82;
    v123 = v82;
    v124 = WeakRetained;
    v125 = v84;
    v69 = (id)objc_msgSend(v58, "addCompletionHandler:", v120);
    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "executeTransitionRequest:", v58);

    v57 = v77;
    v49 = v84;
    v52 = v76;
  }
LABEL_50:

}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAllContentOnWindowScene:animated:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivatingEntity:", *(_QWORD *)(a1 + 32));
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_4;
  v5[3] = &unk_1E8EA93C0;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:", v3, v4, 1, v5);

}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAllContentOnWindowScene:animated:", *(_QWORD *)(a1 + 40), 1);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_6;
  v5[3] = &unk_1E8EA93C0;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:", v3, v4, 1, v5);

}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAllContentOnWindowScene:animated:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAllContentOnWindowScene:animated:", *(_QWORD *)(a1 + 40), 1);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id location;

  v3 = a2;
  objc_initWeak(&location, v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_9;
  v6[3] = &unk_1E8EA9488;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_copyWeak(&v13, &location);
  v10 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v11 = v4;
  v12 = v5;
  objc_msgSend(v3, "setSetupCompletionBlock:", v6);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[16];

  SBLogPIP();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] First stage begins", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_64;
  v8[3] = &unk_1E8EA9460;
  objc_copyWeak(&v15, (id *)(a1 + 80));
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v13 = v6;
  v14 = v7;
  objc_msgSend(v3, "beginTwoStageStopPictureInPictureForApplication:withSceneSessionPersistentIdentifier:animated:byRestoringUserInterfaceWithCompletionHandler:", v4, v5, 1, v8);

  objc_destroyWeak(&v15);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_64(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogPIP();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] First stage ends with error: %{public}@", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (a2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_65;
    v9[3] = &unk_1E8EA9438;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_copyWeak(&v15, (id *)(a1 + 80));
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    objc_msgSend(WeakRetained, "setAnimatorWaitingForExternalAnimationActionBlock:", v9);

    objc_destroyWeak(&v15);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 24), "cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "cancel");
  }

}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint8_t buf[16];

  SBLogPIP();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] Second stage begins", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_66;
  v6[3] = &unk_1E8EA9410;
  objc_copyWeak(&v9, (id *)(a1 + 72));
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v3, "endTwoStageStopPictureInPictureForApplication:withSceneSessionPersistentIdentifier:animated:completionHandler:", v4, v5, 1, v6);

  objc_destroyWeak(&v9);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogPIP();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] Second stage ends with error: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "viewMorphAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTargetView:", 0);

  objc_msgSend(WeakRetained, "viewMorphAnimator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTargetContentView:", 0);

  objc_msgSend(*(id *)(a1 + 32), "showAllContentOnWindowScene:animated:", *(_QWORD *)(a1 + 40), 1);
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_68(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  SBLogPIP();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Restored %{public}@ scene %{public}@", buf, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_68_cold_1(a1, v5);

    v8 = objc_msgSend(*(id *)(a1 + 48), "_layoutStateContainsSceneForSourceSceneSessionIdentifier:bundleIdentifier:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    SBLogPIP();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v23 = v11;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ is in layout state so stopping pip", buf, 0xCu);
      }

      if (*(_BYTE *)(a1 + 88))
      {
        objc_msgSend(*(id *)(a1 + 72), "cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 80), "showAllContentOnWindowScene:animated:", *(_QWORD *)(a1 + 64), 1);
      }
      else
      {
        v13 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
        v15 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(a1 + 40);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_69;
        v18[3] = &unk_1E8EA9518;
        v16 = v14;
        v17 = *(_QWORD *)(a1 + 48);
        v19 = v16;
        v20 = v17;
        v21 = *(id *)(a1 + 32);
        objc_msgSend(v13, "stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:", v15, v16, 1, v18);

      }
    }
    else
    {
      if (v10)
      {
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v23 = v12;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ is NOT in layout state so canceling pip", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "_enumerateContainerViewControllersForApplication:scenePersistenceIdentifier:usingBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_74);
    }
  }
}

uint64_t __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_69(uint64_t result, char a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    SBLogPIP();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_69_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 24), "cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:", *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 32));
    return objc_msgSend(*(id *)(v2 + 40), "_enumerateContainerViewControllersForApplication:scenePersistenceIdentifier:usingBlock:", *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 32), &__block_literal_global_72);
  }
  return result;
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_70(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "contentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_73(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "contentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)_enumerateContainerViewControllersForApplication:(id)a3 scenePersistenceIdentifier:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void (**v24)(id, void *);
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v24 = (void (**)(id, void *))a5;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v9;
  objc_msgSend(v10, "windowSceneForPersistentIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
    v23 = v11;
    objc_msgSend(WeakRetained, "containerViewControllersOnWindowScene:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v18, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "isEqualToString:", v20) & 1) != 0)
          {
            objc_msgSend(v18, "scenePersistenceIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", v25);

            if (v22)
              v24[2](v24, v18);
          }
          else
          {

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    v11 = v23;
  }

}

- (BOOL)_layoutStateContainsSceneForSourceSceneSessionIdentifier:(id)a3 bundleIdentifier:(id)a4 windowScene:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    objc_msgSend(v9, "switcherController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isAnySwitcherVisible") & 1) == 0)
    {
      objc_msgSend(v11, "layoutState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "elements");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __109__SBPIPPegasusAdapter__layoutStateContainsSceneForSourceSceneSessionIdentifier_bundleIdentifier_windowScene___block_invoke;
      v16[3] = &unk_1E8EA9588;
      v17 = v7;
      v19 = &v20;
      v18 = v8;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

    }
    v14 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __109__SBPIPPegasusAdapter__layoutStateContainsSceneForSourceSceneSessionIdentifier_bundleIdentifier_windowScene___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "workspaceEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceApplicationSceneEntity");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (a1[4])
  {
    objc_msgSend(v10, "sceneHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistenceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);
    else
      v8 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v8;
  }
  else
  {
    objc_msgSend(v10, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v9, "isEqualToString:", a1[5]);

  }
  *a3 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);

}

- (void)pictureInPictureController:(id)a3 willDestroyPictureInPictureViewController:(id)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a4;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      _SBFLoggingMethodProem();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ needs to be invoked on the main thread!"), v9);

    }
  }
  v16 = *MEMORY[0x1E0DABEA0];
  v17[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DA9D78];
  v12 = v10;
  objc_msgSend(v11, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emitEvent:withPayload:", 24, v12);

  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  objc_msgSend(WeakRetained, "containerViewControllerForContentViewController:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "removeContainerViewController:", v15);
  -[SBPIPPegasusAdapter _updateHideFromClonedDisplaysAssertion](self, "_updateHideFromClonedDisplaysAssertion");

}

- (void)pictureInPictureController:(id)a3 willHidePictureInPictureViewController:(id)a4
{
  SBPIPControllerAdapterContextProviding **p_pipController;
  id v5;
  id WeakRetained;

  p_pipController = &self->_pipController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_pipController);
  objc_msgSend(WeakRetained, "prepareContainerViewControllerForHidingContentViewController:", v5);

}

- (void)pictureInPictureController:(id)a3 didHidePictureInPictureViewController:(id)a4
{
  SBPIPControllerAdapterContextProviding **p_pipController;
  id v5;
  void *v6;
  id WeakRetained;

  p_pipController = &self->_pipController;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_pipController);
  objc_msgSend(v5, "_sbWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "updatePictureInPictureWindowLevelForWindowScene:", v6);
}

- (BOOL)pictureInPictureController:(id)a3 shouldDenyNewConnection:(id)a4
{
  return objc_msgSend((id)objc_opt_class(), "isSupported") ^ 1;
}

- (BOOL)pictureInPictureController:(id)a3 shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier:(id)a4
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _QWORD v19[4];
  id v20;

  v4 = a4;
  v5 = objc_msgSend((id)objc_opt_class(), "isSupported");
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowAutoPIP");

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUILocked");

  v11 = 0;
  if (v5 && v8 && (v10 & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.InCallService")) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applicationWithBundleIdentifier:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "info");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "supportsBackgroundMode:", *MEMORY[0x1E0CEB370])
        && (objc_msgSend(v14, "isBlockedForScreenTimeExpiration") & 1) == 0)
      {
        +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "externalForegroundApplicationSceneHandles");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __105__SBPIPPegasusAdapter_pictureInPictureController_shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier___block_invoke;
        v19[3] = &unk_1E8E9F570;
        v20 = v13;
        v17 = objc_msgSend(v16, "bs_containsObjectPassingTest:", v19);

        v11 = v17 ^ 1;
      }
      else
      {
        v11 = 0;
      }

    }
  }

  return v11;
}

uint64_t __105__SBPIPPegasusAdapter_pictureInPictureController_shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)pictureInPictureControllerCanBackgroundStartForFaceTimeVideoCall:(id)a3
{
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;

  v3 = objc_msgSend((id)objc_opt_class(), "isSupported");
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inCallPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasFullscreenActiveCallInSwitcher");

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pipDefaults");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend((id)v8, "allowAutoPIP");

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "isUILocked");

  return v3 & v9 & ((v8 | v6) ^ 1);
}

- (void)pictureInPictureController:(id)a3 requestActivationOfSceneWithPersistenceIdentier:(id)a4 pictureInPictureViewController:(id)a5 completion:(id)a6
{
  -[SBPIPPegasusAdapter _activateSceneWithPersistenceIdentifier:pictureInPictureViewController:completion:](self, "_activateSceneWithPersistenceIdentifier:pictureInPictureViewController:completion:", a4, a5, a6);
}

- (void)_activateSceneWithPersistenceIdentifier:(id)a3 pictureInPictureViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;

  v8 = a3;
  v42 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneManagerForPersistenceIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "existingSceneHandleForPersistenceIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_sbWindowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_sbDisplayConfiguration");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sceneIfExists");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "settings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "windowSceneForDisplayIdentity:", v17);
    v19 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v13, "scene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "settings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v19;
  if (objc_msgSend(v21, "isForeground") && v19)
  {
    objc_msgSend(v13, "application");
    v22 = v12;
    v23 = WeakRetained;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bundleIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v19;
    v27 = (void *)v25;
    v28 = -[SBPIPPegasusAdapter _layoutStateContainsSceneForSourceSceneSessionIdentifier:bundleIdentifier:windowScene:](self, "_layoutStateContainsSceneForSourceSceneSessionIdentifier:bundleIdentifier:windowScene:", v8, v25, v26);

    WeakRetained = v23;
    v12 = v22;

    if (v28)
    {
      v29 = v42;
      (*((void (**)(id, uint64_t))v42 + 2))(v42, 1);
      goto LABEL_12;
    }
  }
  else
  {

  }
  v30 = v44;
  if (!v8 || !v44)
  {
    v29 = v42;
    (*((void (**)(id, _QWORD))v42 + 2))(v42, 0);
    goto LABEL_14;
  }
  v41 = WeakRetained;
  objc_msgSend(v13, "application");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "identity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDeviceApplicationSceneEntity entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:](SBDeviceApplicationSceneEntity, "entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:", v31, v8, v12, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setFlag:forActivationSetting:", 1, 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "contentType"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forActivationSetting:", v34, 57);

  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "createRequestWithOptions:displayConfiguration:", 0, v44);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setOriginatingProcess:", v37);

  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __105__SBPIPPegasusAdapter__activateSceneWithPersistenceIdentifier_pictureInPictureViewController_completion___block_invoke;
  v45[3] = &unk_1E8E9EE50;
  v46 = v33;
  v38 = v33;
  objc_msgSend(v36, "modifyApplicationContext:", v45);
  v29 = v42;
  v39 = (id)objc_msgSend(v36, "addCompletionHandler:", v42);
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "executeTransitionRequest:", v36);

  WeakRetained = v41;
LABEL_12:
  v30 = v44;
LABEL_14:

}

uint64_t __105__SBPIPPegasusAdapter__activateSceneWithPersistenceIdentifier_pictureInPictureViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivatingEntity:", *(_QWORD *)(a1 + 32));
}

- (void)_updateHasIdleTimerBehaviors
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  objc_msgSend(WeakRetained, "invalidateIdleTimerBehaviors");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideFaceTimePIPFromSharePlayScreenSharingAssertion, 0);
  objc_storeStrong((id *)&self->_appStatusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_pipDefaultContentSizeResetTimer, 0);
  objc_storeStrong((id *)&self->_analyticsHelper, 0);
  objc_storeStrong((id *)&self->_pegasusController, 0);
  objc_storeStrong((id *)&self->_presentedExpanseBanners, 0);
  objc_destroyWeak((id *)&self->_pipController);
}

void __136__SBPIPPegasusAdapter_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Failed to ensure switcher inclusion for scene %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_68_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v2;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Failed to restore pip for application %{public}@ scene %{public}@.", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

void __159__SBPIPPegasusAdapter__postEnsuredInSwitcher_pictureInPictureController_didRequestStopForPictureInPictureViewController_sourceSceneSessionIdentifier_animated___block_invoke_69_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Failed to stop PIP for %{public}@ cancelling.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
