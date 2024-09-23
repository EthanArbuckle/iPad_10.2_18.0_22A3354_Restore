@implementation SBProductivityGestureController

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return objc_msgSend(a4, "_isPointerTouch", a3) ^ 1;
}

- (SBProductivityGestureController)initWithSystemGestureManager:(id)a3 focusController:(id)a4 gestureDefaults:(id)a5 gestureEducationController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBProductivityGestureController *v15;
  uint64_t v16;
  FBSceneManager *sceneManager;
  SBGestureDefaults *gestureDefaults;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  BSDefaultObserver *gestureDefaultsObserver;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id location;
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)SBProductivityGestureController;
  v15 = -[SBProductivityGestureController init](&v31, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    sceneManager = v15->_sceneManager;
    v15->_sceneManager = (FBSceneManager *)v16;

    objc_storeStrong((id *)&v15->_systemGestureManager, a3);
    objc_storeStrong((id *)&v15->_focusController, a4);
    objc_storeStrong((id *)&v15->_gestureDefaults, a5);
    objc_storeStrong((id *)&v15->_educationController, a6);
    if (_os_feature_enabled_impl())
    {
      objc_initWeak(&location, v15);
      gestureDefaults = v15->_gestureDefaults;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "productivityGesturesAllowed");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C80D38];
      v21 = MEMORY[0x1E0C80D38];
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __123__SBProductivityGestureController_initWithSystemGestureManager_focusController_gestureDefaults_gestureEducationController___block_invoke;
      v28 = &unk_1E8E9DF28;
      objc_copyWeak(&v29, &location);
      -[SBGestureDefaults observeDefault:onQueue:withBlock:](gestureDefaults, "observeDefault:onQueue:withBlock:", v19, v20, &v25);
      v22 = objc_claimAutoreleasedReturnValue();
      gestureDefaultsObserver = v15->_gestureDefaultsObserver;
      v15->_gestureDefaultsObserver = (BSDefaultObserver *)v22;

      -[SBProductivityGestureController _evaluateEnablement](v15, "_evaluateEnablement", v25, v26, v27, v28);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }

  return v15;
}

void __123__SBProductivityGestureController_initWithSystemGestureManager_focusController_gestureDefaults_gestureEducationController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_evaluateEnablement");
    WeakRetained = v2;
  }

}

- (void)_evaluateEnablement
{
  if (-[SBGestureDefaults productivityGesturesAllowed](self->_gestureDefaults, "productivityGesturesAllowed"))-[SBProductivityGestureController _setupGestureRecognizers](self, "_setupGestureRecognizers");
  else
    -[SBProductivityGestureController _tearDownGestureRecognizers](self, "_tearDownGestureRecognizers");
}

- (void)_setupGestureRecognizers
{
  _UIKBProductivitySingleTapGesture *v3;
  _UIKBProductivitySingleTapGesture *threeFingerSingleTap;
  _UIKBProductivitySingleTapGesture *v5;
  _UIKBProductivityDoubleTapGesture *v6;
  _UIKBProductivityDoubleTapGesture *threeFingerDoubleTap;
  _UIKBProductivityDoubleTapGesture *v8;
  _UIKBProductivityPanGestureRecognizer *v9;
  _UIKBProductivityPanGestureRecognizer *threeFingerSlide;
  _UIKBProductivityPanGestureRecognizer *v11;
  _UIKBProductivityLongPressGestureRecognizer *v12;
  _UIKBProductivityLongPressGestureRecognizer *threeFingerLongPress;
  _UIKBProductivityLongPressGestureRecognizer *v14;
  _UIKBProductivityPinchGestureRecognizer *v15;
  _UIKBProductivityPinchGestureRecognizer *threeFingerPinch;
  _UIKBProductivityPinchGestureRecognizer *v17;

  if (!self->_threeFingerSingleTap)
  {
    objc_msgSend(MEMORY[0x1E0CEADD0], "productivitySingleTapGestureRecognizerWithTarget:action:delegate:", self, sel_handleProductivityGesture_, self);
    v3 = (_UIKBProductivitySingleTapGesture *)objc_claimAutoreleasedReturnValue();
    threeFingerSingleTap = self->_threeFingerSingleTap;
    self->_threeFingerSingleTap = v3;
    v5 = v3;

    -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", v5, 127);
  }
  if (!self->_threeFingerDoubleTap)
  {
    objc_msgSend(MEMORY[0x1E0CEADB0], "productivityDoubleTapGestureRecognizerWithTarget:action:delegate:", self, sel_handleProductivityGesture_, self);
    v6 = (_UIKBProductivityDoubleTapGesture *)objc_claimAutoreleasedReturnValue();
    threeFingerDoubleTap = self->_threeFingerDoubleTap;
    self->_threeFingerDoubleTap = v6;
    v8 = v6;

    -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", v8, 129);
  }
  if (!self->_threeFingerSlide)
  {
    objc_msgSend(MEMORY[0x1E0CEADC0], "productivityPanGestureRecognizerWithTarget:action:delegate:", self, sel_handleProductivityGesture_, self);
    v9 = (_UIKBProductivityPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    threeFingerSlide = self->_threeFingerSlide;
    self->_threeFingerSlide = v9;
    v11 = v9;

    -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", v11, 130);
  }
  if (!self->_threeFingerLongPress)
  {
    objc_msgSend(MEMORY[0x1E0CEADB8], "productivityLongPressGestureRecognizerWithTarget:action:delegate:", self, sel_handleProductivityGesture_, self);
    v12 = (_UIKBProductivityLongPressGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    threeFingerLongPress = self->_threeFingerLongPress;
    self->_threeFingerLongPress = v12;
    v14 = v12;

    -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", v14, 128);
  }
  if (!self->_threeFingerPinch)
  {
    objc_msgSend(MEMORY[0x1E0CEADC8], "productivityPinchGestureRecognizerWithTarget:action:delegate:", self, sel_handleProductivityGesture_, self);
    v15 = (_UIKBProductivityPinchGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    threeFingerPinch = self->_threeFingerPinch;
    self->_threeFingerPinch = v15;
    v17 = v15;

    -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", v17, 131);
  }
  -[SBSystemGestureManager gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:](self->_systemGestureManager, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 127, self->_threeFingerDoubleTap);
  -[SBSystemGestureManager gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:](self->_systemGestureManager, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 127, self->_threeFingerSlide);
  -[SBSystemGestureManager gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:](self->_systemGestureManager, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 127, self->_threeFingerLongPress);
  -[SBSystemGestureManager gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:](self->_systemGestureManager, "gestureRecognizerOfType:shouldRequireFailureOfGestureRecognizer:", 127, self->_threeFingerPinch);
}

- (void)_tearDownGestureRecognizers
{
  _UIKBProductivitySingleTapGesture *threeFingerSingleTap;
  _UIKBProductivityDoubleTapGesture *threeFingerDoubleTap;
  _UIKBProductivityPanGestureRecognizer *threeFingerSlide;
  _UIKBProductivityLongPressGestureRecognizer *threeFingerLongPress;
  _UIKBProductivityPinchGestureRecognizer *threeFingerPinch;

  if (self->_threeFingerSingleTap)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerSingleTap = self->_threeFingerSingleTap;
    self->_threeFingerSingleTap = 0;

  }
  if (self->_threeFingerDoubleTap)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerDoubleTap = self->_threeFingerDoubleTap;
    self->_threeFingerDoubleTap = 0;

  }
  if (self->_threeFingerSlide)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerSlide = self->_threeFingerSlide;
    self->_threeFingerSlide = 0;

  }
  if (self->_threeFingerLongPress)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerLongPress = self->_threeFingerLongPress;
    self->_threeFingerLongPress = 0;

  }
  if (self->_threeFingerPinch)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerPinch = self->_threeFingerPinch;
    self->_threeFingerPinch = 0;

  }
}

- (int64_t)slideDirectionWithGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = -[SBProductivityGestureController _orientationOfFocusedSceneForGesture:](self, "_orientationOfFocusedSceneForGesture:", v4);
  v11 = -v7;
  v12 = -v9;
  if (v10 == 3)
    v13 = v7;
  else
    v13 = v9;
  if (v10 == 3)
    v14 = v9;
  else
    v14 = v7;
  if (v10 == 4)
  {
    v13 = -v7;
    v14 = -v9;
  }
  if (v10 != 2)
  {
    v12 = v13;
    v11 = v14;
  }
  v15 = fabs(v11);
  v16 = fabs(v12);
  v17 = 2;
  if (v11 > 0.0)
    v17 = 3;
  if (v16 > v15 || v15 < 5.0)
    return 0;
  else
    return v17;
}

- (void)handleProductivityGesture:(id)a3
{
  _UIKBProductivityLongPressGestureRecognizer *v4;
  _UIKBProductivityLongPressGestureRecognizer *v5;
  _UIKBProductivityLongPressGestureRecognizer *v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t v29;
  uint8_t buf[4];
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (_UIKBProductivityLongPressGestureRecognizer *)a3;
  v5 = v4;
  if (self->_threeFingerSingleTap == v4 || self->_threeFingerLongPress == v4)
  {
    if (-[_UIKBProductivityLongPressGestureRecognizer state](v4, "state") != 3)
      goto LABEL_42;
    v7 = 1;
  }
  else if (self->_threeFingerDoubleTap == v4)
  {
    if (-[_UIKBProductivityLongPressGestureRecognizer state](v4, "state") != 3)
      goto LABEL_42;
    v7 = 2;
  }
  else if (self->_threeFingerSlide == v4)
  {
    if (-[_UIKBProductivityLongPressGestureRecognizer state](v4, "state") != 3)
      goto LABEL_42;
    v7 = -[SBProductivityGestureController slideDirectionWithGesture:](self, "slideDirectionWithGesture:", v5);
    if (!v7)
      goto LABEL_42;
  }
  else
  {
    if (self->_threeFingerPinch != v4)
      goto LABEL_42;
    v6 = v4;
    if (-[_UIKBProductivityLongPressGestureRecognizer state](v6, "state") == 1)
    {
      -[_UIKBProductivityLongPressGestureRecognizer avgTouchesToCentroidDistance](v6, "avgTouchesToCentroidDistance");
      v7 = 0;
      self->_initPinchableDistance = v8;
    }
    else if (-[_UIKBProductivityLongPressGestureRecognizer state](v6, "state") == 3)
    {
      -[_UIKBProductivityLongPressGestureRecognizer avgTouchesToCentroidDistance](v6, "avgTouchesToCentroidDistance");
      v7 = v19 <= self->_initPinchableDistance ? 8 : 10;
    }
    else
    {
      v7 = 0;
    }

    if (!v7)
      goto LABEL_42;
  }
  if (-[SBProductivityGestureController _enabledForCurrentAppScenes](self, "_enabledForCurrentAppScenes"))
  {
    -[SBProductivityGestureController _focusedSceneForAction](self, "_focusedSceneForAction");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (self->_threeFingerLongPress == v5
        || self->_threeFingerSingleTap == v5
        || !-[SBGestureDefaults productivityGesturesRequireEducation](self->_gestureDefaults, "productivityGesturesRequireEducation"))
      {
        v12 = MEMORY[0x1E0C809B0];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __61__SBProductivityGestureController_handleProductivityGesture___block_invoke;
        v27[3] = &unk_1E8EC1888;
        v29 = v7;
        v9 = v9;
        v28 = v9;
        v13 = MEMORY[0x1D17E5550](v27);
        v14 = (void *)v13;
        if (v7 == 10)
        {
          -[NSObject clientHandle](v9, "clientHandle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "processHandle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "auditToken");
          }
          else
          {
            v25 = 0u;
            v26 = 0u;
          }
          v20 = BSVersionedPIDForAuditToken();

          dispatch_get_global_queue(33, 0);
          v21 = objc_claimAutoreleasedReturnValue();
          v22[0] = v12;
          v22[1] = 3221225472;
          v22[2] = __61__SBProductivityGestureController_handleProductivityGesture___block_invoke_15;
          v22[3] = &unk_1E8EA9A80;
          v24 = v20;
          v23 = v14;
          dispatch_async(v21, v22);

        }
        else
        {
          (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
        }

      }
      else
      {
        v10 = -[SBProductivityGestureController _educationTypeForGesture:direction:](self, "_educationTypeForGesture:direction:", v5, v7);
        if (v10)
        {
          SBLogProductivityGestures();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v31 = v10;
            _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Suggesting education %lu", buf, 0xCu);
          }

        }
        -[SBProductivityGestureEducationController gestureActivatedForType:](self->_educationController, "gestureActivatedForType:", v10);
      }
    }
    else
    {
      SBLogProductivityGestures();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "Recognized gesture but no focused scene", buf, 2u);
      }

    }
  }
  else
  {
    SBLogProductivityGestures();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Recognized gesture but one or more scenes don't want gestures enabled", buf, 2u);
    }
  }

LABEL_42:
}

void __61__SBProductivityGestureController_handleProductivityGesture___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CEAE68];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithGestureDirection:authenticationMessage:", *(_QWORD *)(a1 + 40), v4);

  SBLogProductivityGestures();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Sending action: %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendActions:", v9);

}

void __61__SBProductivityGestureController_handleProductivityGesture___block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 buf;
  Class (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  SBLogProductivityGestures();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    LODWORD(buf) = 134349056;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Requesting secure paste authentication message for client %{public}lld", (uint8_t *)&buf, 0xCu);
  }

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)getPBServerConnectionClass_softClass;
  v17 = getPBServerConnectionClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getPBServerConnectionClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v19 = __getPBServerConnectionClass_block_invoke;
    v20 = &unk_1E8E9ED40;
    v21 = &v14;
    __getPBServerConnectionClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v15[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v6, "defaultConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:error:", 0x25FC7F58D8DEA672, *(_QWORD *)(a1 + 40), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __61__SBProductivityGestureController_handleProductivityGesture___block_invoke_16;
  v11[3] = &unk_1E8E9F1E8;
  v9 = *(id *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __61__SBProductivityGestureController_handleProductivityGesture___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_enabledForCurrentAppScenes
{
  void *v2;
  BOOL v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(v2, "count") != 0;
  v20 = 0u;
  v21 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "displayIdentity", (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isMainDisplay") & 1) != 0)
        {
          objc_msgSend(v9, "sceneIfExists");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uiClientSettings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "editingInteractionConfiguration");

          if (!v13)
          {
            SBLogProductivityGestures();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v9, "sceneIfExists");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v23 = v16;
              _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Gestures disabled for scene: %{public}@", buf, 0xCu);

            }
            v3 = 0;
            goto LABEL_16;
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_16:

  return v3;
}

- (id)_focusedSceneForAction
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[SBKeyboardFocusControlling sceneWithFocusIncludingSpringBoard](self->_focusController, "sceneWithFocusIncludingSpringBoard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_displayIdentityForSceneManagers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainDisplay");

  if (v5)
    v6 = v2;
  else
    v6 = 0;

  return v6;
}

- (int64_t)_orientationOfFocusedSceneForGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int64_t v10;
  void *v11;

  v4 = a3;
  -[SBKeyboardFocusControlling sceneWithFocusIncludingSpringBoard](self->_focusController, "sceneWithFocusIncludingSpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sb_displayIdentityForSceneManagers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isMainDisplay");

  if (v8)
  {
    objc_msgSend(v5, "uiClientSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "interfaceOrientation");
  }
  else
  {
    objc_msgSend(v4, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "interfaceOrientation");

  }
  return v10;
}

- (int64_t)_educationTypeForGesture:(id)a3 direction:(int64_t)a4
{
  _UIKBProductivitySingleTapGesture *v6;
  _UIKBProductivitySingleTapGesture *v7;
  int64_t v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int16 v26;
  uint8_t buf[2];

  v6 = (_UIKBProductivitySingleTapGesture *)a3;
  v7 = v6;
  if (self->_threeFingerSingleTap == v6)
  {
    SBLogProductivityGestures();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = "No education necessary for 3 finger single tap";
      v11 = buf;
LABEL_11:
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (self->_threeFingerDoubleTap == v6)
  {
    v8 = 1;
    goto LABEL_15;
  }
  if (self->_threeFingerSlide != v6)
  {
    if (self->_threeFingerLongPress != v6)
    {
      if (self->_threeFingerPinch == v6)
      {
        if (a4 == 10)
        {
          v8 = 3;
          goto LABEL_15;
        }
        if (a4 == 8)
        {
          v8 = 2;
          goto LABEL_15;
        }
        SBLogProductivityGestures();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[SBProductivityGestureController _educationTypeForGesture:direction:].cold.2(a4, v13, v20, v21, v22, v23, v24, v25);
        goto LABEL_31;
      }
LABEL_13:
      v8 = 0;
      goto LABEL_15;
    }
    SBLogProductivityGestures();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v26 = 0;
      v10 = "No education necessary for 3 finger long press";
      v11 = (uint8_t *)&v26;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (a4 == 3)
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v8 = 4;
    else
      v8 = 5;
  }
  else
  {
    if (a4 != 2)
    {
      SBLogProductivityGestures();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SBProductivityGestureController _educationTypeForGesture:direction:].cold.1(a4, v13, v14, v15, v16, v17, v18, v19);
LABEL_31:

      goto LABEL_13;
    }
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v8 = 5;
    else
      v8 = 4;
  }
LABEL_15:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threeFingerPinch, 0);
  objc_storeStrong((id *)&self->_threeFingerLongPress, 0);
  objc_storeStrong((id *)&self->_threeFingerSlide, 0);
  objc_storeStrong((id *)&self->_threeFingerDoubleTap, 0);
  objc_storeStrong((id *)&self->_threeFingerSingleTap, 0);
  objc_storeStrong((id *)&self->_educationController, 0);
  objc_storeStrong((id *)&self->_gestureDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_gestureDefaults, 0);
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)_educationTypeForGesture:(uint64_t)a3 direction:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Unable to map 3 finger slide direction %lu to education type", a5, a6, a7, a8, 0);
}

- (void)_educationTypeForGesture:(uint64_t)a3 direction:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Unable to map 3 finger pinch direction %lu to education type", a5, a6, a7, a8, 0);
}

@end
