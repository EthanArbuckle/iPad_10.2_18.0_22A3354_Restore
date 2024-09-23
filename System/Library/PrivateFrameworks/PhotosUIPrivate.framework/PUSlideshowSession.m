@implementation PUSlideshowSession

- (PUSlideshowSession)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowSession.m"), 57, CFSTR("%@ must be created with the designated initilizer"), objc_opt_class());

  return -[PUSlideshowSession initWithFetchResult:assetCollection:startIndex:](self, "initWithFetchResult:assetCollection:startIndex:", 0, 0, 0);
}

- (PUSlideshowSession)initWithFetchResult:(id)a3 assetCollection:(id)a4 startIndex:(unint64_t)a5
{
  id v10;
  id v11;
  PUSlideshowSession *v12;
  uint64_t v13;
  NSUUID *uuid;
  PUSlideshowViewModel *v15;
  PUSlideshowViewModel *viewModel;
  uint64_t v17;
  PUSlideshowSettingsViewModel *settingsViewModel;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  OKMediaFeederPhotoKit *mediaFeeder;
  PUSlideshowContextRegistry *v24;
  PUSlideshowContextRegistry *contextRegistry;
  void *v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  PUSlideshowSession *v31;
  objc_super v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowSession.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult"));

  }
  if (objc_msgSend(v10, "count") <= a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowSession.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startIndex < [fetchResult count]"));

  }
  v32.receiver = self;
  v32.super_class = (Class)PUSlideshowSession;
  v12 = -[PUSlideshowSession init](&v32, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_fetchResult, a3);
    objc_storeStrong((id *)&v12->_assetCollection, a4);
    v15 = -[PUSlideshowViewModel initWithAssetCollection:]([PUSlideshowViewModel alloc], "initWithAssetCollection:", v12->_assetCollection);
    viewModel = v12->_viewModel;
    v12->_viewModel = v15;

    -[PUSlideshowViewModel registerChangeObserver:](v12->_viewModel, "registerChangeObserver:", v12);
    +[PUSlideshowSettingsPersistency createSlideshowSettingsViewModel](PUSlideshowSettingsPersistency, "createSlideshowSettingsViewModel");
    v17 = objc_claimAutoreleasedReturnValue();
    settingsViewModel = v12->_settingsViewModel;
    v12->_settingsViewModel = (PUSlideshowSettingsViewModel *)v17;

    -[PUSlideshowSettingsViewModel registerChangeObserver:](v12->_settingsViewModel, "registerChangeObserver:", v12);
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v19 = (void *)getOKMediaFeederPhotoKitClass_softClass;
    v37 = getOKMediaFeederPhotoKitClass_softClass;
    v20 = MEMORY[0x1E0C809B0];
    if (!getOKMediaFeederPhotoKitClass_softClass)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __getOKMediaFeederPhotoKitClass_block_invoke;
      v33[3] = &unk_1E58AAEB0;
      v33[4] = &v34;
      __getOKMediaFeederPhotoKitClass_block_invoke((uint64_t)v33);
      v19 = (void *)v35[3];
    }
    v21 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v34, 8);
    objc_msgSend(v21, "mediaFeederWithFetchResult:", v10);
    v22 = objc_claimAutoreleasedReturnValue();
    mediaFeeder = v12->_mediaFeeder;
    v12->_mediaFeeder = (OKMediaFeederPhotoKit *)v22;

    -[OKMediaFeederPhotoKit setStartIndex:](v12->_mediaFeeder, "setStartIndex:", a5);
    -[OKMediaFeederPhotoKit setRotationEnabled:](v12->_mediaFeeder, "setRotationEnabled:", 0);
    v24 = objc_alloc_init(PUSlideshowContextRegistry);
    contextRegistry = v12->_contextRegistry;
    v12->_contextRegistry = v24;

    -[PUSlideshowSession _updateCurrentState](v12, "_updateCurrentState");
    objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v20;
    v30[1] = 3221225472;
    v30[2] = __69__PUSlideshowSession_initWithFetchResult_assetCollection_startIndex___block_invoke;
    v30[3] = &unk_1E58ABD10;
    v31 = v12;
    objc_msgSend(v26, "scheduleMainQueueTask:", v30);

  }
  return v12;
}

- (PUSlideshowSession)initWithFetchResult:(id)a3 assetCollection:(id)a4
{
  return -[PUSlideshowSession initWithFetchResult:assetCollection:startIndex:](self, "initWithFetchResult:assetCollection:startIndex:", a3, a4, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[PUSlideshowViewModel unregisterChangeObserver:](self->_viewModel, "unregisterChangeObserver:", self);
  -[PUSlideshowSettingsViewModel unregisterChangeObserver:](self->_settingsViewModel, "unregisterChangeObserver:", self);
  -[PUSlideshowSession _endDisablingIdleTimerIfNecessary](self, "_endDisablingIdleTimerIfNecessary");
  -[OKPresentationViewController forceCleanup](self->_presentationViewController, "forceCleanup");
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSession;
  -[PUSlideshowSession dealloc](&v3, sel_dealloc);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  int v6;
  OKPresentationViewController *presentationViewController;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  id v24;

  v24 = a4;
  NSStringFromSelector(sel_allowUserInteractivity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v24, "isEqual:", v5);

  if (v6)
  {
    presentationViewController = self->_presentationViewController;
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OKPresentationViewController setInteractivityEnabled:](presentationViewController, "setInteractivityEnabled:", objc_msgSend(v8, "allowUserInteractivity"));

  }
  else
  {
    NSStringFromSelector(sel_interactiveTransitionFingerTrackingBoxRadiusDefaultValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v24, "isEqual:", v9);

    if (v10)
    {
      +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "interactiveTransitionFingerTrackingBoxRadiusDefaultValue");
      v13 = v12;

      -[OKPresentationViewController setInteractiveTransitionTrackingBoxRadius:](self->_presentationViewController, "setInteractiveTransitionTrackingBoxRadius:", v13);
    }
    else
    {
      NSStringFromSelector(sel_interactiveTransitionProgressThresholdDefaultValue);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v24, "isEqual:", v14);

      if (v15)
      {
        +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "interactiveTransitionProgressThresholdDefaultValue");
        v18 = v17;

        -[OKPresentationViewController setInteractiveTransitionProgressThreshold:](self->_presentationViewController, "setInteractiveTransitionProgressThreshold:", v18);
      }
      else
      {
        NSStringFromSelector(sel_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v24, "isEqual:", v19);

        if (v20)
        {
          +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue");
          v23 = v22;

          -[OKPresentationViewController setInteractiveTransitionVelocityThreshold:](self->_presentationViewController, "setInteractiveTransitionVelocityThreshold:", v23);
        }
      }
    }
  }

}

- (void)updatePresentationViewController
{
  OKProducerPreset *currentPreset;
  void *v4;
  OKProducerPreset *v5;
  OKProducerPreset *v6;
  void *v7;
  void *v8;
  id OKPresentationGuidelineClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  currentPreset = self->_currentPreset;
  -[PUSlideshowSettingsViewModel preset](self->_settingsViewModel, "preset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(currentPreset) = -[OKProducerPreset isEqual:](currentPreset, "isEqual:", v4);

  if ((currentPreset & 1) == 0)
  {
    -[PUSlideshowSettingsViewModel preset](self->_settingsViewModel, "preset");
    v5 = (OKProducerPreset *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentPreset;
    self->_currentPreset = v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getOKPresentationGuidelineClass(), "guidelineLiveAuthoringEnabled:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);
    OKPresentationGuidelineClass = getOKPresentationGuidelineClass();
    -[PUSlideshowSession _resolutionSizes](self, "_resolutionSizes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(OKPresentationGuidelineClass, "guidelineAuthoringRecommendedResolutionSizes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v11);
    if (objc_msgSend(MEMORY[0x1E0D7B6D8], "shouldDisplayTitleOfAssetCollection:", self->_assetCollection))
    {
      -[PHAssetCollection localizedTitle](self->_assetCollection, "localizedTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(getOKPresentationGuidelineClass(), "guidelineAuthoringTitle:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v7, "addObject:", v13);
    }
    else
    {
      v13 = 0;
    }
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v14 = (void *)getOKPresentationViewControllerClass_softClass;
    v22 = getOKPresentationViewControllerClass_softClass;
    if (!getOKPresentationViewControllerClass_softClass)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __getOKPresentationViewControllerClass_block_invoke;
      v18[3] = &unk_1E58AAEB0;
      v18[4] = &v19;
      __getOKPresentationViewControllerClass_block_invoke((uint64_t)v18);
      v14 = (void *)v20[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v19, 8);
    v16 = (void *)objc_msgSend([v15 alloc], "initWithPreset:guidelines:mediaFeeder:", self->_currentPreset, v7, self->_mediaFeeder);
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCurrentPreset:", self->_currentPreset);

    -[PUSlideshowSession _configurePresentationViewController:](self, "_configurePresentationViewController:", v16);
    -[PUSlideshowSession _distributeSlideshowDisplayContextWithPresentationController:](self, "_distributeSlideshowDisplayContextWithPresentationController:", v16);

  }
}

- (void)_distributeSlideshowDisplayContextWithPresentationController:(id)a3
{
  OKPresentationViewController *v5;
  OKPresentationViewController *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PUSlideshowSession *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (OKPresentationViewController *)a3;
  v6 = self->_presentationViewController;
  if (self->_presentationViewController != v5)
    objc_storeStrong((id *)&self->_presentationViewController, a3);
  if ((-[OKPresentationViewController isPaused](v6, "isPaused") & 1) == 0)
    -[OKPresentationViewController instantPause](v6, "instantPause");
  -[PUSlideshowContextRegistry displayContexts](self->_contextRegistry, "displayContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSlideshowContextRegistry currentDisplayContext](self->_contextRegistry, "currentDisplayContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13++), "slideshowSession:stopDisplayingPresentationViewController:", self, v6);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__PUSlideshowSession__distributeSlideshowDisplayContextWithPresentationController___block_invoke;
  v15[3] = &unk_1E58ABCA8;
  v16 = v8;
  v17 = self;
  v14 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

- (void)registerSlideshowDisplayContext:(id)a3
{
  if (-[PUSlideshowContextRegistry addDisplayContext:](self->_contextRegistry, "addDisplayContext:", a3))
    -[PUSlideshowSession _distributeSlideshowDisplayContextWithPresentationController:](self, "_distributeSlideshowDisplayContextWithPresentationController:", self->_presentationViewController);
}

- (void)unregisterSlideshowDisplayContext:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PUSlideshowContextRegistry removeDisplayContext:](self->_contextRegistry, "removeDisplayContext:"))
  {
    objc_msgSend(v4, "slideshowSession:stopDisplayingPresentationViewController:", self, self->_presentationViewController);
    -[PUSlideshowSession _distributeSlideshowDisplayContextWithPresentationController:](self, "_distributeSlideshowDisplayContextWithPresentationController:", self->_presentationViewController);
  }

}

- (id)_resolutionSizes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 320.0, 568.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 568.0, 320.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 768.0, 1024.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1024.0, 768.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1920.0, 1080.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_configurePresentationViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setCouchInitialDelay:", 0.0);
  -[PUSlideshowSettingsViewModel stepDuration](self->_settingsViewModel, "stepDuration");
  objc_msgSend(v4, "setCouchModeDefaultStepDuration:");
  objc_msgSend(v4, "setCouchModeLoops:", -[PUSlideshowSettingsViewModel shouldRepeat](self->_settingsViewModel, "shouldRepeat"));
  -[PUSlideshowSettingsViewModel mediaItem](self->_settingsViewModel, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAudioURLs:", v7);

  }
  else
  {
    objc_msgSend(v4, "setAudioURLs:", 0);
  }
  +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteractivityEnabled:", objc_msgSend(v8, "allowUserInteractivity"));

  +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "transitionSettingsAreDefaults");

  if ((v10 & 1) == 0)
  {
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interactiveTransitionFingerTrackingBoxRadiusDefaultValue");
    v13 = v12;

    -[OKPresentationViewController setInteractiveTransitionTrackingBoxRadius:](self->_presentationViewController, "setInteractiveTransitionTrackingBoxRadius:", v13);
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interactiveTransitionProgressThresholdDefaultValue");
    v16 = v15;

    -[OKPresentationViewController setInteractiveTransitionProgressThreshold:](self->_presentationViewController, "setInteractiveTransitionProgressThreshold:", v16);
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue");
    v19 = v18;

    -[OKPresentationViewController setInteractiveTransitionVelocityThreshold:](self->_presentationViewController, "setInteractiveTransitionVelocityThreshold:", v19);
  }

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUSlideshowSession _slideshowViewModel:didChange:](self, "_slideshowViewModel:didChange:", v7, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PUSlideshowSession _slideshowSettingsViewModel:didChange:](self, "_slideshowSettingsViewModel:didChange:", v7, v6);
  }

}

- (void)setCurrentState:(int64_t)a3
{
  int64_t currentState;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  currentState = self->_currentState;
  if (currentState != a3)
  {
    self->_currentState = a3;
    -[PUSlideshowSession _setDisablingIdleTimer:](self, "_setDisablingIdleTimer:", (unint64_t)(a3 - 1) < 2);
    v5 = self->_currentState;
    if ((unint64_t)(v5 - 5) < 2)
    {
      -[PUSlideshowSession setDidStartOnce:](self, "setDidStartOnce:", 0);
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 7);
      -[PUSlideshowSession uuid](self, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D7BF38]);

      if (self->_currentState == 5)
        v13 = 2;
      else
        v13 = 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D7BF48]);

      -[PUSlideshowSession _addCurrentSettingsToPayload:](self, "_addCurrentSettingsToPayload:", v23);
      v15 = (void *)MEMORY[0x1E0D09910];
      v16 = (_QWORD *)MEMORY[0x1E0D7BEF0];
      goto LABEL_11;
    }
    if (v5 == 3)
    {
      v6 = (void *)MEMORY[0x1E0D09910];
      v7 = *MEMORY[0x1E0D7BEF8];
      v24 = *MEMORY[0x1E0D7BF38];
      -[PUSlideshowSession uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v8;
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = &v25;
      v11 = &v24;
      goto LABEL_13;
    }
    if (v5 != 2)
      return;
    if (currentState == 3)
    {
      v6 = (void *)MEMORY[0x1E0D09910];
      v7 = *MEMORY[0x1E0D7BF00];
      v26 = *MEMORY[0x1E0D7BF38];
      -[PUSlideshowSession uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v8;
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = (void **)v27;
      v11 = &v26;
LABEL_13:
      objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendEvent:withPayload:", v7, v17);

      return;
    }
    if (!-[PUSlideshowSession didStartOnce](self, "didStartOnce"))
    {
      -[PUSlideshowSession setDidStartOnce:](self, "setDidStartOnce:", 1);
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
      -[PUSlideshowSession uuid](self, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D7BF38]);

      v19 = objc_alloc(MEMORY[0x1E0D7CCE0]);
      -[PUSlideshowSession fetchResult](self, "fetchResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithAssetFetchResult:", v20);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D7BF10]);

      -[PUSlideshowSession assetCollection](self, "assetCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D09818]);

      -[PUSlideshowSession _addCurrentSettingsToPayload:](self, "_addCurrentSettingsToPayload:", v23);
      v15 = (void *)MEMORY[0x1E0D09910];
      v16 = (_QWORD *)MEMORY[0x1E0D7BF08];
LABEL_11:
      objc_msgSend(v15, "sendEvent:withPayload:", *v16, v23);

    }
  }
}

- (void)_addCurrentSettingsToPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[PUSlideshowSession settingsViewModel](self, "settingsViewModel");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("opus-producer"));

    if (v9)
    {
      objc_msgSend(v7, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v5, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D7BF40]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D7BF18]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D7BF28]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "shouldRepeat"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D7BF30]);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v16, "stepDuration");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D7BF20]);

}

- (void)_updateCurrentState
{
  id v3;

  -[PUSlideshowSession viewModel](self, "viewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUSlideshowSession setCurrentState:](self, "setCurrentState:", objc_msgSend(v3, "currentState"));

}

- (void)_slideshowViewModel:(id)a3 didChange:(id)a4
{
  id v7;
  void *v8;
  PUSlideshowViewModel *v9;

  v9 = (PUSlideshowViewModel *)a3;
  v7 = a4;
  if (self->_viewModel != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowSession.m"), 322, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if (objc_msgSend(v7, "currentStateDidChange"))
    -[PUSlideshowSession _invalidateCurrentState](self, "_invalidateCurrentState");

}

- (void)_slideshowSettingsViewModel:(id)a3 didChange:(id)a4
{
  PUSlideshowSettingsViewModel *v6;
  id v7;
  PUSlideshowViewModel *viewModel;
  void *v9;
  void *v10;
  OKPresentationViewController *presentationViewController;
  void *v12;
  OKPresentationViewController *v13;
  _QWORD v14[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (PUSlideshowSettingsViewModel *)a3;
  v7 = a4;
  if (self->_settingsViewModel == v6)
  {
    +[PUSlideshowSettingsPersistency saveSlideshowSettingsViewModel:](PUSlideshowSettingsPersistency, "saveSlideshowSettingsViewModel:", v6);
    if (objc_msgSend(v7, "presetDidChange"))
    {
      viewModel = self->_viewModel;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__PUSlideshowSession__slideshowSettingsViewModel_didChange___block_invoke;
      v14[3] = &unk_1E58ABD10;
      v14[4] = self;
      -[PUViewModel performChanges:](viewModel, "performChanges:", v14);
    }
    if (objc_msgSend(v7, "mediaItemDidChange"))
    {
      -[PUSlideshowSettingsViewModel mediaItem](v6, "mediaItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "audioURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      presentationViewController = self->_presentationViewController;
      if (v10)
      {
        v15[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[OKPresentationViewController setAudioURLs:](presentationViewController, "setAudioURLs:", v12);

      }
      else
      {
        -[OKPresentationViewController setAudioURLs:](self->_presentationViewController, "setAudioURLs:", 0);
      }

    }
    if (objc_msgSend(v7, "stepDurationDidChange"))
    {
      v13 = self->_presentationViewController;
      -[PUSlideshowSettingsViewModel stepDuration](v6, "stepDuration");
      -[OKPresentationViewController setCouchModeDefaultStepDuration:](v13, "setCouchModeDefaultStepDuration:");
    }
    if (objc_msgSend(v7, "shouldRepeatDidChange"))
      -[OKPresentationViewController setCouchModeLoops:](self->_presentationViewController, "setCouchModeLoops:", -[PUSlideshowSettingsViewModel shouldRepeat](v6, "shouldRepeat"));
  }

}

- (void)_setDisablingIdleTimer:(BOOL)a3
{
  if (self->__disablingIdleTimer != a3)
  {
    self->__disablingIdleTimer = a3;
    if (a3)
      -[PUSlideshowSession _beginDisablingIdleTimer](self, "_beginDisablingIdleTimer");
    else
      -[PUSlideshowSession _endDisablingIdleTimerIfNecessary](self, "_endDisablingIdleTimerIfNecessary");
  }
}

- (void)_beginDisablingIdleTimer
{
  void *v3;
  void *v4;
  id v5;

  -[PUSlideshowSession _disablingIdleTimerToken](self, "_disablingIdleTimerToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D7B1B8], "sharedState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginDisablingIdleTimerForReason:", CFSTR("Slideshow (PUSlideshowSession)"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[PUSlideshowSession _setDisablingIdleTimerToken:](self, "_setDisablingIdleTimerToken:", v5);
  }
}

- (void)_endDisablingIdleTimerIfNecessary
{
  void *v3;
  id v4;

  -[PUSlideshowSession _disablingIdleTimerToken](self, "_disablingIdleTimerToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D7B1B8], "sharedState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDisablingIdleTimer:", v4);

    -[PUSlideshowSession _setDisablingIdleTimerToken:](self, "_setDisablingIdleTimerToken:", 0);
  }

}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PUSlideshowViewModel)viewModel
{
  return self->_viewModel;
}

- (PUSlideshowSettingsViewModel)settingsViewModel
{
  return self->_settingsViewModel;
}

- (OKPresentationViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (BOOL)_disablingIdleTimer
{
  return self->__disablingIdleTimer;
}

- (id)_disablingIdleTimerToken
{
  return self->__disablingIdleTimerToken;
}

- (void)_setDisablingIdleTimerToken:(id)a3
{
  objc_storeStrong(&self->__disablingIdleTimerToken, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (BOOL)didStartOnce
{
  return self->_didStartOnce;
}

- (void)setDidStartOnce:(BOOL)a3
{
  self->_didStartOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->__disablingIdleTimerToken, 0);
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_storeStrong((id *)&self->_settingsViewModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_contextRegistry, 0);
  objc_storeStrong((id *)&self->_mediaFeeder, 0);
}

uint64_t __60__PUSlideshowSession__slideshowSettingsViewModel_didChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCurrentState:", 1);
}

uint64_t __83__PUSlideshowSession__distributeSlideshowDisplayContextWithPresentationController___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "slideshowSession:startDisplayingPresentationViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "currentState");
  if (result == 2)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "instantPlay");
  return result;
}

void __69__PUSlideshowSession_initWithFetchResult_assetCollection_startIndex___block_invoke(uint64_t a1)
{
  id v2;

  +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKeyObserver:", *(_QWORD *)(a1 + 32));

}

@end
