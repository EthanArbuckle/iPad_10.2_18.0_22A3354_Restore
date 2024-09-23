@implementation SBAssistantGestureManager

- (SBAssistantGestureManager)initWithAssistantWindow:(id)a3 gestureConfiguration:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBAssistantGestureManager *v12;
  SBAssistantGestureManager *v13;
  uint64_t v14;
  SBSystemAnimationSettings *settings;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBAssistantGestureManager;
  v12 = -[SBAssistantGestureManager init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assistantWindow, a3);
    objc_storeStrong((id *)&v13->_gestureConfiguration, a4);
    -[SBAssistantGestureConfiguration addObserver:](v13->_gestureConfiguration, "addObserver:", v13);
    objc_storeStrong((id *)&v13->_context, a5);
    +[SBSystemAnimationDomain rootSettings](SBSystemAnimationDomain, "rootSettings");
    v14 = objc_claimAutoreleasedReturnValue();
    settings = v13->_settings;
    v13->_settings = (SBSystemAnimationSettings *)v14;

    -[PTSettings addKeyObserver:](v13->_settings, "addKeyObserver:", v13);
    v13->_homeAffordanceSuppression = 2;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[PTSettings removeKeyObserver:](self->_settings, "removeKeyObserver:", self);
  -[SBAssistantGestureConfiguration removeObserver:](self->_gestureConfiguration, "removeObserver:", self);
  -[SBAssistantGestureManager _tearDownDismissalSystemGestures](self, "_tearDownDismissalSystemGestures");
  -[SBAssistantGestureManager _removeHomeGesture](self, "_removeHomeGesture");
  v3.receiver = self;
  v3.super_class = (Class)SBAssistantGestureManager;
  -[SBAssistantGestureManager dealloc](&v3, sel_dealloc);
}

+ (BOOL)shouldDismissSiriForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  long double y;
  long double x;
  double v6;

  y = a4.y;
  x = a4.x;
  v6 = hypot(a3.x, a3.y);
  return hypot(x, y) > *(double *)&kSBAssistantBottomEdgeDismissVelocityThreshold
      || v6 > *(double *)&kSBAssistantBottomEdgeDismissTranslationThreshold;
}

- (BOOL)gesturesImplyFullscreenContent
{
  void *v3;
  char v4;
  void *v5;

  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "shouldDismissForTapsOutsideContent") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "shouldDismissForSwipesOutsideContent");

  }
  return v4;
}

- (void)_setupSystemDismissalGestures
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapToDismissSiriGestureRecognizer;
  void *v5;
  void *v6;
  UIPanGestureRecognizer *v7;
  UIPanGestureRecognizer *panToDismissSiriGestureRecognizer;
  void *v9;
  void *v10;

  if (!self->_tapToDismissSiriGestureRecognizer)
  {
    -[SBAssistantGestureManager _createTapToDismissSiriGestureRecognizer](self, "_createTapToDismissSiriGestureRecognizer");
    v3 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    tapToDismissSiriGestureRecognizer = self->_tapToDismissSiriGestureRecognizer;
    self->_tapToDismissSiriGestureRecognizer = v3;

    -[SBAssistantGestureManager context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemGestureManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:withType:", self->_tapToDismissSiriGestureRecognizer, 114);

  }
  if (!self->_panToDismissSiriGestureRecognizer)
  {
    -[SBAssistantGestureManager _createPanToDismissSiriGestureRecognizer](self, "_createPanToDismissSiriGestureRecognizer");
    v7 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    panToDismissSiriGestureRecognizer = self->_panToDismissSiriGestureRecognizer;
    self->_panToDismissSiriGestureRecognizer = v7;

    -[SBAssistantGestureManager context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemGestureManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:withType:", self->_panToDismissSiriGestureRecognizer, 116);

    -[SBAssistantGestureManager _configurePanToDismissGestureDependencies](self, "_configurePanToDismissGestureDependencies");
  }
}

- (void)_tearDownDismissalSystemGestures
{
  void *v3;
  void *v4;
  UITapGestureRecognizer *tapToDismissSiriGestureRecognizer;
  void *v6;
  void *v7;
  UIPanGestureRecognizer *panToDismissSiriGestureRecognizer;

  if (self->_tapToDismissSiriGestureRecognizer)
  {
    -[SBAssistantGestureManager context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemGestureManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_tapToDismissSiriGestureRecognizer);

    tapToDismissSiriGestureRecognizer = self->_tapToDismissSiriGestureRecognizer;
    self->_tapToDismissSiriGestureRecognizer = 0;

  }
  if (self->_panToDismissSiriGestureRecognizer)
  {
    -[SBAssistantGestureManager context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemGestureManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", self->_panToDismissSiriGestureRecognizer);

    panToDismissSiriGestureRecognizer = self->_panToDismissSiriGestureRecognizer;
    self->_panToDismissSiriGestureRecognizer = 0;

  }
}

- (void)_resetDismissalSystemGestures
{
  void *v3;
  void *v4;

  -[SBAssistantGestureManager tapToDismissSiriGestureRecognizer](self, "tapToDismissSiriGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[SBAssistantGestureManager panToDismissSiriGestureRecognizer](self, "panToDismissSiriGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
  }
  -[SBAssistantGestureManager _tearDownDismissalSystemGestures](self, "_tearDownDismissalSystemGestures");
  -[SBAssistantGestureManager _setupSystemDismissalGestures](self, "_setupSystemDismissalGestures");
}

- (id)_createPanToDismissSiriGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__pannedToDismissSiri_);
  objc_msgSend(v3, "setName:", CFSTR("assistant.dismiss.pan"));
  objc_msgSend(v3, "setCancelsTouchesInView:", 0);
  objc_msgSend(v3, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v3, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v3, "setAllowedTouchTypes:", &unk_1E91CEAB8);
  -[SBAssistantGestureManager context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlCenterController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_requirePresentGestureRecognizerToFailForGestureRecognizer:", v3);

  return v3;
}

- (void)_configurePanToDismissGestureDependencies
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SBAssistantGestureManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemGestureManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[SBAssistantGestureManager panToDismissSiriGestureRecognizer](self, "panToDismissSiriGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 46, v4);
  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldShareHomeGesture");

  if (v6)
  {
    objc_msgSend(v11, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 3, v4);
    objc_msgSend(v11, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 1, v4);
  }
  objc_msgSend(v11, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 119, v4);
  objc_msgSend(v11, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 120, v4);
  objc_msgSend(v11, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 104, v4);
  objc_msgSend(v11, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 105, v4);
  -[SBAssistantGestureManager bottomEdgeDismissGestureRecognizer](self, "bottomEdgeDismissGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 119, v7);
  objc_msgSend(v11, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 120, v7);
  objc_msgSend(v11, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 104, v7);
  objc_msgSend(v11, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 105, v7);
  -[SBAssistantGestureManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "switcherController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeGestureBottomEdgeRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requireGestureRecognizerToFail:", v10);

  if (v7)
    objc_msgSend(v4, "requireGestureRecognizerToFail:", v7);

}

- (void)_pannedToDismissSiri:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  char v13;
  _BOOL4 v14;
  _BOOL4 v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDismissForSwipesOutsideContent");

  SBLogSiri();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("SHOULDN'T");
    if (v6)
      v10 = CFSTR("SHOULD");
    v20 = 138543618;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Assistant %{public}@ dismiss for pans outside of content", (uint8_t *)&v20, 0x16u);

  }
  -[SBAssistantGestureManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "controlCenterController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPresented");

  v14 = -[SBAssistantGestureManager _noNewTransientOverlaysPresented](self, "_noNewTransientOverlaysPresented");
  if (!v6 || ((v15 = v14, objc_msgSend(v4, "state") != 1) ? (v16 = 1) : (v16 = v13), (v16 & 1) != 0 || !v15))
  {
    -[UIWindow _sbWindowScene](self->_assistantWindow, "_sbWindowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assistantController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isSystemAssistantExperienceEnabled");

    if (v19)
      -[SBAssistantGestureManager _notifyInteractionWithGestureRecognizer:](self, "_notifyInteractionWithGestureRecognizer:", v4);
  }
  else
  {
    -[SBAssistantGestureManager _commonHandlerForSiriDismissalGesture:](self, "_commonHandlerForSiriDismissalGesture:", v4);
  }

}

- (id)_createTapToDismissSiriGestureRecognizer
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__tappedToDismissSiri_);
  objc_msgSend(v3, "setName:", CFSTR("assistant.dismiss.tap"));
  objc_msgSend(v3, "setCancelsTouchesInView:", 0);
  objc_msgSend(v3, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v3, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v3, "setAllowedTouchTypes:", &unk_1E91CEAD0);
  objc_msgSend(v3, "setDelegate:", self);
  return v3;
}

- (void)_tappedToDismissSiri:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  char v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDismissForTapsOutsideContent");

  SBLogSiri();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("SHOULDN'T");
    if (v6)
      v10 = CFSTR("SHOULD");
    v18 = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Assistant %{public}@ dismiss for taps outside of content", (uint8_t *)&v18, 0x16u);

  }
  -[SBAssistantGestureManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "controlCenterController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPresented");

  v14 = -[SBAssistantGestureManager _noNewTransientOverlaysPresented](self, "_noNewTransientOverlaysPresented");
  if (v6 && (v13 & 1) == 0 && v14)
  {
    -[SBAssistantGestureManager _commonHandlerForSiriDismissalGesture:](self, "_commonHandlerForSiriDismissalGesture:", v4);
  }
  else
  {
    -[UIWindow _sbWindowScene](self->_assistantWindow, "_sbWindowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assistantController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isSystemAssistantExperienceEnabled");

    if (v17)
      -[SBAssistantGestureManager _notifyInteractionWithGestureRecognizer:](self, "_notifyInteractionWithGestureRecognizer:", v4);
  }

}

- (void)_configureHomeGesture
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  SBHomeGesturePanGestureRecognizer *v8;
  SBHomeGesturePanGestureRecognizer *bottomEdgeDismissGestureRecognizer;
  SBHomeGesturePanGestureRecognizer *v10;
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

  if (SBHomeGestureEnabled())
  {
    -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "shouldShareHomeGesture") & 1) != 0)
    {
      -[SBAssistantGestureManager bottomEdgeDismissGestureRecognizer](self, "bottomEdgeDismissGestureRecognizer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "homeButtonType");

        if (v6 == 2)
          v7 = 5;
        else
          v7 = 3;
        v8 = -[SBHomeGesturePanGestureRecognizer initWithTarget:action:type:options:]([SBHomeGesturePanGestureRecognizer alloc], "initWithTarget:action:type:options:", self, sel__handleBottomEdgeDismissGesture_, v7, 0);
        bottomEdgeDismissGestureRecognizer = self->_bottomEdgeDismissGestureRecognizer;
        self->_bottomEdgeDismissGestureRecognizer = v8;

        -[SBHomeGesturePanGestureRecognizer setDelegate:](self->_bottomEdgeDismissGestureRecognizer, "setDelegate:", self);
        -[SBHomeGesturePanGestureRecognizer setInterfaceDelegate:](self->_bottomEdgeDismissGestureRecognizer, "setInterfaceDelegate:", self);
        -[SBHomeGesturePanGestureRecognizer setCancelsTouchesInView:](self->_bottomEdgeDismissGestureRecognizer, "setCancelsTouchesInView:", 0);
        -[SBHomeGesturePanGestureRecognizer setDelaysTouchesEnded:](self->_bottomEdgeDismissGestureRecognizer, "setDelaysTouchesEnded:", 0);
        -[SBHomeGesturePanGestureRecognizer setDelaysTouchesBegan:](self->_bottomEdgeDismissGestureRecognizer, "setDelaysTouchesBegan:", 0);
        -[SBHomeGesturePanGestureRecognizer setAllowedTouchTypes:](self->_bottomEdgeDismissGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CEAE8);
        -[UIScreenEdgePanGestureRecognizer setEdges:](self->_bottomEdgeDismissGestureRecognizer, "setEdges:", 4);
        -[UIScreenEdgePanGestureRecognizer _setBottomEdgeAngleWindow:](self->_bottomEdgeDismissGestureRecognizer, "_setBottomEdgeAngleWindow:", *(double *)&kSBAssistantBottomEdgeAngleWindow);
        v10 = self->_bottomEdgeDismissGestureRecognizer;
        -[SBAssistantGestureManager context](self, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "switcherController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "homeGestureBottomEdgeRecognizer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeGesturePanGestureRecognizer requireGestureRecognizerToFail:](v10, "requireGestureRecognizerToFail:", v13);

        -[UIPanGestureRecognizer requireGestureRecognizerToFail:](self->_panToDismissSiriGestureRecognizer, "requireGestureRecognizerToFail:", self->_bottomEdgeDismissGestureRecognizer);
        -[SBAssistantGestureManager context](self, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "systemGestureManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addGestureRecognizer:withType:", self->_bottomEdgeDismissGestureRecognizer, 115);

        -[SBAssistantGestureManager _configurePanToDismissGestureDependencies](self, "_configurePanToDismissGestureDependencies");
        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "shouldShareHomeGesture"))
  {

  }
  else
  {
    -[SBAssistantGestureManager bottomEdgeDismissGestureRecognizer](self, "bottomEdgeDismissGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[SBAssistantGestureManager _removeScreenEdgePanGestureRecognizerIfNecessary](self, "_removeScreenEdgePanGestureRecognizerIfNecessary");
  }
LABEL_13:
  -[SBAssistantGestureManager zStackParticipant](self, "zStackParticipant");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[SBAssistantGestureManager context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "zStackResolver");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "acquireParticipantWithIdentifier:delegate:", 17, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAssistantGestureManager setZStackParticipant:](self, "setZStackParticipant:", v21);

  }
  -[SBAssistantGestureManager _updateZStackParticipantWithReason:](self, "_updateZStackParticipantWithReason:", CFSTR("configuring home gesture"));
}

- (void)_handleBottomEdgeDismissGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v4 = a3;
  -[SBAssistantGestureManager _assistantRootViewController](self, "_assistantRootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "translationInView:", v15);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "velocityInView:", v15);
  v11 = v10;
  v13 = v12;

  if (+[SBAssistantGestureManager shouldDismissSiriForGestureTranslation:velocity:](SBAssistantGestureManager, "shouldDismissSiriForGestureTranslation:velocity:", v7, v9, v11, v13))
  {
    -[SBAssistantGestureManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assistantGestureManagerDidRecognizeDismissGesture:preferredDismissalOptions:", self, 0);

  }
}

- (void)_removeHomeGesture
{
  void *v3;

  -[SBAssistantGestureManager zStackParticipant](self, "zStackParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBAssistantGestureManager setZStackParticipant:](self, "setZStackParticipant:", 0);
  -[SBAssistantGestureManager _removeScreenEdgePanGestureRecognizerIfNecessary](self, "_removeScreenEdgePanGestureRecognizerIfNecessary");
}

- (void)_removeScreenEdgePanGestureRecognizerIfNecessary
{
  void *v3;
  void *v4;
  id v5;

  -[SBAssistantGestureManager bottomEdgeDismissGestureRecognizer](self, "bottomEdgeDismissGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBAssistantGestureManager context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemGestureManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", v5);

    -[SBAssistantGestureManager setBottomEdgeDismissGestureRecognizer:](self, "setBottomEdgeDismissGestureRecognizer:", 0);
  }

}

- (void)_commonHandlerForSiriDismissalGesture:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16[2];
  id from;
  id location;

  v5 = a3;
  -[SBAssistantGestureManager _assistantRootViewController](self, "_assistantRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UISystemGestureLocationInView();
  v9 = v8;
  v11 = v10;

  objc_initWeak(&location, self);
  -[SBAssistantGestureManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v12);

  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__SBAssistantGestureManager__commonHandlerForSiriDismissalGesture___block_invoke;
  v14[3] = &unk_1E8EB2618;
  v14[4] = self;
  v16[1] = (id)a2;
  objc_copyWeak(&v15, &from);
  objc_copyWeak(v16, &location);
  objc_msgSend(v13, "shouldDismissForGestureAtLocation:completion:", v14, v9, v11);

  objc_destroyWeak(v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __67__SBAssistantGestureManager__commonHandlerForSiriDismissalGesture___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id WeakRetained;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("SHOULD NOT");
    if (a2)
      v7 = CFSTR("SHOULD");
    v11 = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ -  %{public}@ dismiss for gesture at location", (uint8_t *)&v11, 0x16u);

  }
  if (a2)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D97830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 1, 23);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v10 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "assistantGestureManagerDidRecognizeDismissGesture:preferredDismissalOptions:", v10, v8);

  }
}

- (void)_notifyInteractionWithGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SBAssistantGestureManager _assistantRootViewController](self, "_assistantRootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UISystemGestureLocationInView();
  v7 = v6;
  v9 = v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "state") == 1)
  {
    -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notifyPanBeganAtPoint:", v7, v9);
LABEL_6:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notifyTapAtPoint:", v7, v9);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_updateRootViewControllerOwnsHomeGesture
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[SBAssistantGestureManager zStackParticipant](self, "zStackParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "ownsHomeGesture"))
  {
    -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldShareHomeGesture") ^ 1;

  }
  else
  {
    v5 = 0;
  }

  -[SBAssistantGestureManager _assistantRootViewController](self, "_assistantRootViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOwnsHomeGesture:", v5);

}

- (void)_updateRootViewControllerShowsHomeAffordance:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SBAssistantGestureManager *v10;
  id v11;

  v3 = a3;
  -[SBAssistantGestureManager zStackParticipant](self, "zStackParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "homeAffordanceDrawingSuppressed");

  -[SBAssistantGestureManager _assistantRootViewController](self, "_assistantRootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v3 & ~v6;
  if ((v3 & ~v6) != 0)
    v10 = self;
  else
    v10 = 0;
  objc_msgSend(v7, "setShowsHomeAffordance:", v9);

  -[SBAssistantGestureManager _assistantRootViewController](self, "_assistantRootViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHomeGrabberPointerClickDelegate:", v10);

}

- (void)_updateRootViewControllerDimsContentBelow
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[UIWindow _sbWindowScene](self->_assistantWindow, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isSystemAssistantExperienceEnabled"))
  {
    objc_msgSend(v8, "presentationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "modality") == 2)
    {
      objc_msgSend(v8, "presentationContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isKeyboardVisible"))
        v6 = -[SBFZStackParticipant participantBelowAllowsDimming](self->_zStackParticipant, "participantBelowAllowsDimming");
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  -[SBAssistantGestureManager _assistantRootViewController](self, "_assistantRootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDimsContentBelow:", v6);

}

- (void)_updateZStackParticipantWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBAssistantGestureManager zStackParticipant](self, "zStackParticipant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdatePreferencesWithReason:", v4);

}

- (BOOL)_noNewTransientOverlaysPresented
{
  SBAssistantGestureManager *v2;
  void *v3;
  void *v4;
  SBTransientOverlayViewController *v5;

  v2 = self;
  -[SBAssistantGestureManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topmostPresentedViewController");
  v5 = (SBTransientOverlayViewController *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = v5 == v2->_topmostTransientViewControllerAtPresentation;
  return (char)v2;
}

- (id)_assistantRootViewController
{
  void *v2;
  void *v3;

  -[SBAssistantGestureManager assistantWindow](self, "assistantWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistantRootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)zStackParticipantDidChange:(id)a3
{
  void *v4;

  -[SBAssistantGestureManager _updateRootViewControllerOwnsHomeGesture](self, "_updateRootViewControllerOwnsHomeGesture", a3);
  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantGestureManager _updateRootViewControllerShowsHomeAffordance:](self, "_updateRootViewControllerShowsHomeAffordance:", objc_msgSend(v4, "shouldShowHomeAffordance"));

  -[SBAssistantGestureManager _updateRootViewControllerDimsContentBelow](self, "_updateRootViewControllerDimsContentBelow");
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  void *v5;
  int v6;
  id v7;

  v7 = a4;
  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldShareHomeGesture");

  objc_msgSend(v7, "setActivationPolicyForParticipantsBelow:", v6 ^ 1u);
  objc_msgSend(v7, "setHomeAffordanceDrawingSuppression:", -[SBAssistantGestureManager homeAffordanceSuppression](self, "homeAffordanceSuppression"));

}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSiri();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %@", (uint8_t *)&v10, 0x16u);

  }
  -[SBAssistantGestureManager zStackParticipant](self, "zStackParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ownsHomeGesture");

  if (v8)
  {
    -[SBAssistantGestureManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assistantGestureManagerDidRecognizeDismissGesture:preferredDismissalOptions:", self, 0);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  -[SBAssistantGestureManager bottomEdgeDismissGestureRecognizer](self, "bottomEdgeDismissGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    v11 = 1;
  }
  else
  {
    -[SBAssistantGestureManager bottomEdgeDismissGestureRecognizer](self, "bottomEdgeDismissGestureRecognizer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v7)
    {
      v11 = 1;
    }
    else
    {
      -[SBAssistantGestureManager tapToDismissSiriGestureRecognizer](self, "tapToDismissSiriGestureRecognizer");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v10 == v6;

    }
  }

  return v11;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;

  v4 = a3;
  -[SBAssistantGestureManager bottomEdgeDismissGestureRecognizer](self, "bottomEdgeDismissGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SBAssistantGestureManager zStackParticipant](self, "zStackParticipant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "ownsHomeGesture"))
    {
      -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "shouldShareHomeGesture");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  -[SBAssistantGestureManager tapToDismissSiriGestureRecognizer](self, "tapToDismissSiriGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
    v10 = 1;
  else
    v10 = v6;

  return v10;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  void *v3;
  void *v4;

  -[SBAssistantGestureManager _assistantRootViewController](self, "_assistantRootViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)touchInterfaceOrientationForGestureRecognizer:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBAssistantGestureManager _assistantRootViewController](self, "_assistantRootViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeGestureSharing:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[SBAssistantGestureManager _didUpdateHomeGestureSharing:](self, "_didUpdateHomeGestureSharing:", v4);
}

- (void)_didUpdateHomeGestureSharing:(BOOL)a3
{
  -[SBAssistantGestureManager _updateZStackParticipantWithReason:](self, "_updateZStackParticipantWithReason:", CFSTR("Siri changed shareHomeGesture"));
  -[SBAssistantGestureManager _resetDismissalSystemGestures](self, "_resetDismissalSystemGestures");
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForTapsOutsideContent:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[SBAssistantGestureManager _didUpdateShouldDismissForTapsOutsideContent:](self, "_didUpdateShouldDismissForTapsOutsideContent:", v4);
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForSwipesOutsideContent:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[SBAssistantGestureManager _didUpdateShouldDismissForSwipesOutsideContent:](self, "_didUpdateShouldDismissForSwipesOutsideContent:", v4);
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldPassTouchesThroughToSpringBoard:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[SBAssistantGestureManager _didUpdateTouchesPassThroughToSpringBoard:](self, "_didUpdateTouchesPassThroughToSpringBoard:", v4);
}

- (void)_didUpdateTouchesPassThroughToSpringBoard:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBAssistantGestureManager assistantWindow](self, "assistantWindow");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsTouchPassThrough:", v3);

}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldShowHomeAffordance:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[SBAssistantGestureManager _didUpdateSiriHomeAffordanceSuppression:](self, "_didUpdateSiriHomeAffordanceSuppression:", v4);
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeAffordanceSuppression:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriHomeAffordanceSuppression:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[SBAssistantGestureManager _didUpdateSiriHomeAffordanceSuppression:](self, "_didUpdateSiriHomeAffordanceSuppression:", a4);
}

- (void)_didUpdateSiriHomeAffordanceSuppression:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    -[SBAssistantGestureManager _didUpdateShouldShowHomeAffordance:](self, "_didUpdateShouldShowHomeAffordance:", (a3 & 1) == 0);
    -[SBAssistantGestureManager setHomeAffordanceSuppression:](self, "setHomeAffordanceSuppression:", a3);
  }
  -[SBAssistantGestureManager _updateRootViewControllerOwnsHomeGesture](self, "_updateRootViewControllerOwnsHomeGesture");
  -[SBAssistantGestureManager _updateZStackParticipantWithReason:](self, "_updateZStackParticipantWithReason:", CFSTR("siri updated home affordance suppression"));
}

- (void)assistantSession:(id)a3 didChangePresentationInWindowScene:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAssistantPresented");

  if (v6)
  {
    -[SBAssistantGestureManager _setupSystemDismissalGestures](self, "_setupSystemDismissalGestures");
    -[SBAssistantGestureManager _configureHomeGesture](self, "_configureHomeGesture");
  }
  else
  {
    -[SBAssistantGestureManager _tearDownDismissalSystemGestures](self, "_tearDownDismissalSystemGestures");
    -[SBAssistantGestureManager _removeHomeGesture](self, "_removeHomeGesture");
  }
  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantGestureManager _didUpdateTouchesPassThroughToSpringBoard:](self, "_didUpdateTouchesPassThroughToSpringBoard:", objc_msgSend(v7, "shouldPassTouchesThroughToSpringBoard"));

  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantGestureManager _didUpdateSiriHomeAffordanceSuppression:](self, "_didUpdateSiriHomeAffordanceSuppression:", objc_msgSend(v8, "homeAffordanceSuppression"));

  -[SBAssistantGestureManager gestureConfiguration](self, "gestureConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantGestureManager _didUpdateHomeGestureSharing:](self, "_didUpdateHomeGestureSharing:", objc_msgSend(v9, "shouldShareHomeGesture"));

  -[SBAssistantGestureManager _updateRootViewControllerDimsContentBelow](self, "_updateRootViewControllerDimsContentBelow");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("assistantAnimationDuration")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("assistantDismissAnimationDurationOverApp")))
  {
    -[SBAssistantGestureManager _prototypeSettingsChanged](self, "_prototypeSettingsChanged");
  }

}

- (void)_prototypeSettingsChanged
{
  float v3;
  float v4;
  uint64_t v5;
  id v6;

  -[SBSystemAnimationSettings assistantBottomEdgeDismissThreshold](self->_settings, "assistantBottomEdgeDismissThreshold");
  *(double *)&kSBAssistantBottomEdgeDismissTranslationThreshold = v3;
  -[SBSystemAnimationSettings assistantBottomEdgeDismissVelocity](self->_settings, "assistantBottomEdgeDismissVelocity");
  *(double *)&kSBAssistantBottomEdgeDismissVelocityThreshold = v4;
  +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "edgeAngleWindow");
  kSBAssistantBottomEdgeAngleWindow = v5;

}

- (SBAssistantGestureManagerDelegate)delegate
{
  return (SBAssistantGestureManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBTransientOverlayViewController)topmostTransientViewControllerAtPresentation
{
  return self->_topmostTransientViewControllerAtPresentation;
}

- (void)setTopmostTransientViewControllerAtPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_topmostTransientViewControllerAtPresentation, a3);
}

- (SBAssistantGestureConfiguration)gestureConfiguration
{
  return self->_gestureConfiguration;
}

- (SBAssistantWindow)assistantWindow
{
  return self->_assistantWindow;
}

- (SBAssistantContext)context
{
  return self->_context;
}

- (SBHomeGesturePanGestureRecognizer)bottomEdgeDismissGestureRecognizer
{
  return self->_bottomEdgeDismissGestureRecognizer;
}

- (void)setBottomEdgeDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomEdgeDismissGestureRecognizer, a3);
}

- (UITapGestureRecognizer)tapToDismissSiriGestureRecognizer
{
  return self->_tapToDismissSiriGestureRecognizer;
}

- (void)setTapToDismissSiriGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapToDismissSiriGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)panToDismissSiriGestureRecognizer
{
  return self->_panToDismissSiriGestureRecognizer;
}

- (void)setPanToDismissSiriGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panToDismissSiriGestureRecognizer, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (int64_t)homeAffordanceSuppression
{
  return self->_homeAffordanceSuppression;
}

- (void)setHomeAffordanceSuppression:(int64_t)a3
{
  self->_homeAffordanceSuppression = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_panToDismissSiriGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToDismissSiriGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomEdgeDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assistantWindow, 0);
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_topmostTransientViewControllerAtPresentation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
