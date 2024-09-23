@implementation SBSystemApertureController

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 605, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 606, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updater != nil"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "updateZOrderLevelPreferencesWithBlock:", &__block_literal_global_156_1);
  objc_msgSend(v7, "updateOrientationPreferencesWithBlock:", &__block_literal_global_158_1);

}

- (id)participantAssociatedWindows:(id)a3
{
  TRAParticipant *v5;
  TRAParticipant *v6;
  TRAParticipant *traitsParticipant;
  void *v8;
  UIWindow **p_continuityWindow;
  void *v11;
  UIWindow *continuityWindow;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (TRAParticipant *)a3;
  v6 = v5;
  traitsParticipant = self->_traitsParticipant;
  if (traitsParticipant == v5)
    goto LABEL_7;
  if (self->_continuityTraitsParticipant != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant == _traitsParticipant || participant == _continuityTraitsParticipant"));

    traitsParticipant = self->_traitsParticipant;
  }
  if (traitsParticipant == v6)
  {
LABEL_7:
    v13[0] = self->_window;
    p_continuityWindow = (UIWindow **)v13;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", p_continuityWindow, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (self->_continuityTraitsParticipant == v6)
  {
    continuityWindow = self->_continuityWindow;
    p_continuityWindow = &continuityWindow;
    goto LABEL_8;
  }
  v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_9:

  return v8;
}

- (void)systemApertureViewController:(id)a3 containsAnyContent:(BOOL)a4
{
  if (self->_containsAnyContent != a4)
  {
    self->_containsAnyContent = a4;
    -[SBSystemApertureController _updateVisibilityForCloningAndSnapshots](self, "_updateVisibilityForCloningAndSnapshots", a3);
  }
}

uint64_t __70__SBSystemApertureController_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportedOrientations:", 30);
}

- (id)registerElement:(id)a3
{
  return -[SBSystemApertureViewController registerElement:](self->_systemApertureViewController, "registerElement:", a3);
}

uint64_t __70__SBSystemApertureController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredZOrderLevel:", 10000001.5);
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  id v7;
  TRAParticipant *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SBSystemApertureViewController *systemApertureViewController;
  void *v16;
  void *v17;
  void *v18;
  TRAParticipant *v19;

  v19 = (TRAParticipant *)a3;
  v7 = a4;
  v8 = v19;
  if (v19)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 616, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

    v8 = 0;
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 617, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

  v8 = v19;
LABEL_3:
  -[TRAParticipant role](v8, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = SBTraitsArbiterOrientationActuationEnabledForRole(v9);

  if (v10)
  {
    v11 = -[TRAParticipant sbf_currentOrientation](v19, "sbf_currentOrientation");
    v12 = -[TRAParticipant sbf_previousOrientation](v19, "sbf_previousOrientation");
    -[SBSystemApertureViewController activeWindowScene](self->_systemApertureViewController, "activeWindowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "associatedWindowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_traitsParticipant == v19 && (objc_msgSend(v14, "isMainDisplayWindowScene") & 1) != 0
      || self->_continuityTraitsParticipant == v19 && objc_msgSend(v14, "isExtendedDisplayWindowScene"))
    {
      systemApertureViewController = self->_systemApertureViewController;
      objc_msgSend(v7, "orientationActuationContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureViewController hostOrientationDidChangeTo:withPreviousOrientation:context:](systemApertureViewController, "hostOrientationDidChangeTo:withPreviousOrientation:context:", v11, v12, v16);

    }
  }

}

- (void)_updateVisibilityForCloningAndSnapshots
{
  uint64_t v3;
  uint64_t v4;
  SBSystemApertureCaptureVisibilityShimViewController **p_mainCloningShimViewController;
  SBSystemApertureCaptureVisibilityShimViewController **p_curtainCloningShimViewController;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  char v12;
  _QWORD v13[5];
  char v14;

  if (self->_containsAnyContent)
  {
    v3 = 1;
LABEL_8:
    v4 = 1;
    goto LABEL_9;
  }
  if (-[SBSystemApertureSettings suppressHidingOnClonedDisplayWhileEmpty](self->_settings, "suppressHidingOnClonedDisplayWhileEmpty"))
  {
    v3 = 1;
  }
  else
  {
    v3 = -[SBSystemApertureDefaults alwaysShowSystemApertureOnClonedDisplays](self->_systemApertureDefaults, "alwaysShowSystemApertureOnClonedDisplays");
  }
  if (self->_containsAnyContent
    || -[SBSystemApertureSettings suppressHidingInSnapshotsWhileEmpty](self->_settings, "suppressHidingInSnapshotsWhileEmpty"))
  {
    goto LABEL_8;
  }
  v4 = -[SBSystemApertureDefaults alwaysShowSystemApertureInSnapshots](self->_systemApertureDefaults, "alwaysShowSystemApertureInSnapshots");
LABEL_9:
  p_mainCloningShimViewController = &self->_mainCloningShimViewController;
  -[SBSystemApertureCaptureVisibilityShimViewController setVisibleInSnapshots:](self->_mainCloningShimViewController, "setVisibleInSnapshots:", v4);
  p_curtainCloningShimViewController = &self->_curtainCloningShimViewController;
  -[SBSystemApertureCaptureVisibilityShimViewController setVisibleInSnapshots:](self->_curtainCloningShimViewController, "setVisibleInSnapshots:", v4);
  -[SBSystemApertureCaptureVisibilityShimViewController setContentsDifferOnClonedDisplay:](self->_mainCloningShimViewController, "setContentsDifferOnClonedDisplay:", 0);
  -[SBSystemApertureCaptureVisibilityShimViewController setContentsDifferOnClonedDisplay:](self->_curtainCloningShimViewController, "setContentsDifferOnClonedDisplay:", 0);
  v7 = -[SBSystemApertureCaptureVisibilityShimViewController newDefaultVisibilityAnimator](self->_mainCloningShimViewController, "newDefaultVisibilityAnimator");
  v8 = v7;
  if ((v3 & 1) != 0)
  {
    if (!v7)
    {
      -[SBSystemApertureCaptureVisibilityShimViewController setVisibleOnClonedDisplay:](*p_mainCloningShimViewController, "setVisibleOnClonedDisplay:", 1);
      v9 = 2;
      p_mainCloningShimViewController = &self->_curtainCloningShimViewController;
LABEL_17:
      -[SBSystemApertureCaptureVisibilityShimViewController setVisibleOnClonedDisplay:](*p_mainCloningShimViewController, "setVisibleOnClonedDisplay:", v3);
      -[SBSystemApertureViewController setCloningStyle:](self->_systemApertureViewController, "setCloningStyle:", v9);
      goto LABEL_18;
    }
  }
  else
  {
    if (-[SBSystemApertureCaptureVisibilityShimViewController isVisibleOnClonedDisplay](*p_curtainCloningShimViewController, "isVisibleOnClonedDisplay"))
    {
      -[SBSystemApertureCaptureVisibilityShimViewController setVisibleOnClonedDisplay:](*p_curtainCloningShimViewController, "setVisibleOnClonedDisplay:", 0);
    }
    if (!v8)
    {
      v9 = 0;
      goto LABEL_17;
    }
  }
  -[SBSystemApertureCaptureVisibilityShimViewController setContentsDifferOnClonedDisplay:](self->_mainCloningShimViewController, "setContentsDifferOnClonedDisplay:", 1);
  -[SBSystemApertureCaptureVisibilityShimViewController setContentsDifferOnClonedDisplay:](self->_curtainCloningShimViewController, "setContentsDifferOnClonedDisplay:", 1);
  -[SBSystemApertureViewController setCloningStyle:](self->_systemApertureViewController, "setCloningStyle:", 1);
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__SBSystemApertureController__updateVisibilityForCloningAndSnapshots__block_invoke;
  v13[3] = &unk_1E8E9F508;
  v13[4] = self;
  v14 = v3;
  objc_msgSend(v8, "addAnimations:", v13);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __69__SBSystemApertureController__updateVisibilityForCloningAndSnapshots__block_invoke_2;
  v11[3] = &unk_1E8EBED90;
  v12 = v3;
  v11[4] = self;
  objc_msgSend(v8, "addCompletion:", v11);
  objc_msgSend(v8, "startAnimation");
LABEL_18:

}

- (SBSystemApertureController)initWithWindowScene:(id)a3
{
  SBSystemApertureController *v4;
  uint64_t v5;
  SBSystemApertureSettings *settings;
  void *v7;
  uint64_t v8;
  SBSystemApertureDefaults *systemApertureDefaults;
  SBSystemApertureDefaults *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  SBSystemApertureDefaults *v17;
  void *v18;
  void *v19;
  id v20;
  SBSystemApertureStateDumpService *v21;
  SBSystemApertureStateDumpService *systemApertureStateDumpService;
  void *v23;
  uint64_t v24;
  SBSystemApertureController *v25;
  SBSystemApertureController *v26;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;
  void *v35;
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SBSystemApertureController;
  v4 = -[SBSystemApertureController init](&v34, sel_init);
  if (v4)
  {
    +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    settings = v4->_settings;
    v4->_settings = (SBSystemApertureSettings *)v5;

    -[PTSettings addKeyObserver:](v4->_settings, "addKeyObserver:", v4);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemApertureDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    systemApertureDefaults = v4->_systemApertureDefaults;
    v4->_systemApertureDefaults = (SBSystemApertureDefaults *)v8;

    objc_initWeak(&location, v4);
    v10 = v4->_systemApertureDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysShowSystemApertureOnClonedDisplays");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysShowSystemApertureInSnapshots");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __50__SBSystemApertureController_initWithWindowScene___block_invoke;
    v31[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v32, &location);
    v16 = (id)-[SBSystemApertureDefaults observeDefaults:onQueue:withBlock:](v10, "observeDefaults:onQueue:withBlock:", v13, MEMORY[0x1E0C80D38], v31);

    v17 = v4->_systemApertureDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "suppressDynamicIslandCompletely");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __50__SBSystemApertureController_initWithWindowScene___block_invoke_2;
    v29[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v30, &location);
    v20 = (id)-[SBSystemApertureDefaults observeDefaults:onQueue:withBlock:](v17, "observeDefaults:onQueue:withBlock:", v19, MEMORY[0x1E0C80D38], v29);

    v21 = objc_alloc_init(SBSystemApertureStateDumpService);
    systemApertureStateDumpService = v4->_systemApertureStateDumpService;
    v4->_systemApertureStateDumpService = v21;

    objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addActiveDisplayWindowSceneObserver:", v4);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  v24 = SBFEffectiveArtworkSubtype();
  if (v24 == 2868)
    v25 = v4;
  else
    v25 = 0;
  if (v24 == 2796)
    v25 = v4;
  if (v24 == 2622)
    v25 = v4;
  if (v24 == 2556)
    v25 = v4;
  v26 = v25;

  return v26;
}

void __50__SBSystemApertureController_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateVisibilityForCloningAndSnapshots");

}

void __50__SBSystemApertureController_initWithWindowScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSuppressionForDefaults");

}

- (void)dealloc
{
  TRAParticipant *traitsParticipant;
  objc_super v4;

  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemApertureController;
  -[SBSystemApertureController dealloc](&v4, sel_dealloc);
}

- (void)setActiveWindowScene:(id)a3
{
  id WeakRetained;
  SBSubstituteSystemApertureViewController *substituteSystemApertureViewController;
  SBSubstituteSystemApertureViewController *v6;
  SBSubstituteSystemApertureViewController *v7;
  SBSubstituteSystemApertureViewController *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  if (obj && WeakRetained != obj)
  {
    substituteSystemApertureViewController = self->_substituteSystemApertureViewController;
    if (!substituteSystemApertureViewController && WeakRetained)
    {
      v6 = [SBSubstituteSystemApertureViewController alloc];
      -[SBSystemApertureViewController minimumSensorRegionFrame](self->_systemApertureViewController, "minimumSensorRegionFrame");
      v7 = -[SBSubstituteSystemApertureViewController initWithSensorRegionFrame:](v6, "initWithSensorRegionFrame:");
      v8 = self->_substituteSystemApertureViewController;
      self->_substituteSystemApertureViewController = v7;

      substituteSystemApertureViewController = self->_substituteSystemApertureViewController;
    }
    -[SBSubstituteSystemApertureViewController setActiveWindowScene:](substituteSystemApertureViewController, "setActiveWindowScene:", WeakRetained);
    objc_storeWeak((id *)&self->_activeWindowScene, obj);
    -[SBSystemApertureViewController setActiveWindowScene:](self->_systemApertureViewController, "setActiveWindowScene:", obj);
    -[SBSystemApertureController _ensureSystemAperturesOnCorrectDisplays](self, "_ensureSystemAperturesOnCorrectDisplays");
    if (WeakRetained)
      -[SBSystemApertureController _updateOrientationFromOldWindowScene:activeWindowScene:](self, "_updateOrientationFromOldWindowScene:activeWindowScene:", WeakRetained, obj);
    -[SBSystemApertureController hostedScenesDidChange](self, "hostedScenesDidChange");
  }

}

- (BOOL)containsHostSceneWithIdentityToken:(id)a3
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  char v10;
  BOOL result;
  void *v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
    objc_msgSend(WeakRetained, "_FBSScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identityToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v6);

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("token != ((void *)0)"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemApertureController containsHostSceneWithIdentityToken:].cold.1(a2, (uint64_t)self, (uint64_t)v12);
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_ensureSystemAperturesOnCorrectDisplays
{
  id WeakRetained;
  void *v4;
  int v5;
  UIWindow *continuityWindow;
  SBSubstituteSystemApertureViewController *substituteSystemApertureViewController;
  void *v8;
  UIWindow *v9;
  UIWindow *v10;
  void *v11;
  void *v12;
  UIWindow *v13;
  UIWindow *auxillarySuperHighLevelWindow;
  void *v15;
  id *p_window;
  id *p_mainCloningShimViewController;
  SBSystemApertureCaptureVisibilityShimViewController *mainCloningShimViewController;
  void *v19;
  id v20;
  id v21;
  void *v22;
  UIWindow *v23;
  UIWindow *v24;
  void *v25;
  void *v26;
  UIWindow *v27;
  UIWindow *auxillarySuperHighLevelContinuityWindow;
  void *v29;
  SBSubstituteSystemApertureViewController *v30;
  SBSubstituteSystemApertureViewController *v31;
  void *v32;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainDisplayWindowScene");

  continuityWindow = self->_continuityWindow;
  if (v5)
  {
    if (continuityWindow)
    {
      substituteSystemApertureViewController = self->_substituteSystemApertureViewController;
      if (substituteSystemApertureViewController)
      {
        -[SBSubstituteSystemApertureViewController view](substituteSystemApertureViewController, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "superview");
        v9 = (UIWindow *)objc_claimAutoreleasedReturnValue();
        v10 = self->_continuityWindow;

        if (v9 != v10)
        {
          -[SBSubstituteSystemApertureViewController view](self->_substituteSystemApertureViewController, "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeFromSuperview");

          -[UIWindow setRootViewController:](self->_continuityWindow, "setRootViewController:", self->_substituteSystemApertureViewController);
        }
      }
    }
    if (self->_auxillarySuperHighLevelWindow)
    {
      -[SBSystemApertureCaptureVisibilityShimViewController view](self->_curtainCloningShimViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "superview");
      v13 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      auxillarySuperHighLevelWindow = self->_auxillarySuperHighLevelWindow;

      if (v13 != auxillarySuperHighLevelWindow)
      {
        -[SBSystemApertureCaptureVisibilityShimViewController view](self->_curtainCloningShimViewController, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeFromSuperview");

        -[UIWindow setRootViewController:](self->_auxillarySuperHighLevelWindow, "setRootViewController:", self->_curtainCloningShimViewController);
      }
    }
    p_window = (id *)&self->_window;
    if (self->_window)
    {
      mainCloningShimViewController = self->_mainCloningShimViewController;
      p_mainCloningShimViewController = (id *)&self->_mainCloningShimViewController;
      -[SBSystemApertureCaptureVisibilityShimViewController view](mainCloningShimViewController, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "superview");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = *(p_mainCloningShimViewController - 4);
      goto LABEL_20;
    }
  }
  else
  {
    if (continuityWindow)
    {
      -[SBSystemApertureCaptureVisibilityShimViewController view](self->_mainCloningShimViewController, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "superview");
      v23 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      v24 = self->_continuityWindow;

      if (v23 != v24)
      {
        -[SBSystemApertureCaptureVisibilityShimViewController view](self->_mainCloningShimViewController, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeFromSuperview");

        -[UIWindow setRootViewController:](self->_continuityWindow, "setRootViewController:", self->_mainCloningShimViewController);
      }
    }
    if (self->_auxillarySuperHighLevelContinuityWindow)
    {
      -[SBSystemApertureCaptureVisibilityShimViewController view](self->_curtainCloningShimViewController, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "superview");
      v27 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      auxillarySuperHighLevelContinuityWindow = self->_auxillarySuperHighLevelContinuityWindow;

      if (v27 != auxillarySuperHighLevelContinuityWindow)
      {
        -[SBSystemApertureCaptureVisibilityShimViewController view](self->_curtainCloningShimViewController, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "removeFromSuperview");

        -[UIWindow setRootViewController:](self->_auxillarySuperHighLevelContinuityWindow, "setRootViewController:", self->_curtainCloningShimViewController);
      }
    }
    p_window = (id *)&self->_window;
    if (self->_window)
    {
      v31 = self->_substituteSystemApertureViewController;
      p_mainCloningShimViewController = (id *)&self->_substituteSystemApertureViewController;
      v30 = v31;
      if (v31)
      {
        -[SBSubstituteSystemApertureViewController view](v30, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "superview");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = *p_window;
LABEL_20:

        if (v20 != v21)
        {
          objc_msgSend(*p_mainCloningShimViewController, "view");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "removeFromSuperview");

          objc_msgSend(*p_window, "setRootViewController:", *p_mainCloningShimViewController);
        }
      }
    }
  }
}

- (void)_updateOrientationFromOldWindowScene:(id)a3 activeWindowScene:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  -[SBSystemApertureController _traParticipantForWindowScene:](self, "_traParticipantForWindowScene:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sbf_currentOrientation");

  -[SBSystemApertureController _traParticipantForWindowScene:](self, "_traParticipantForWindowScene:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "sbf_currentOrientation");
  if (v8 != v10)
    -[SBSystemApertureViewController hostOrientationDidChangeTo:withPreviousOrientation:context:](self->_systemApertureViewController, "hostOrientationDidChangeTo:withPreviousOrientation:context:", v10, v8, 0);
}

- (id)_traParticipantForWindowScene:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "associatedWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isContinuityDisplayWindowScene");
  v6 = 104;
  if (v5)
    v6 = 112;
  v7 = *(id *)((char *)&self->super.isa + v6);

  return v7;
}

- (void)createHighLevelWindowSceneWithDisplayConfiguration:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  FBScene *v7;
  FBScene *highLevelWindowScene;
  id v9;

  v9 = a3;
  v4 = SBFEffectiveArtworkSubtype();
  if (v4 <= 2795)
  {
    if (v4 != 2556 && v4 != 2622)
      goto LABEL_8;
LABEL_7:
    +[FBSSceneSpecification specification](SBSystemApertureSceneSpecification, "specification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = 1259902594;
    -[SBSystemApertureController _createHighLevelSystemApertureSceneWithIdentifier:sceneSpecification:displayConfiguration:continuitySession:atLevel:](self, "_createHighLevelSystemApertureSceneWithIdentifier:sceneSpecification:displayConfiguration:continuitySession:atLevel:", CFSTR("SystemAperture"), v5, v9, 0, v6);
    v7 = (FBScene *)objc_claimAutoreleasedReturnValue();
    highLevelWindowScene = self->_highLevelWindowScene;
    self->_highLevelWindowScene = v7;

    goto LABEL_8;
  }
  if (v4 == 2868 || v4 == 2796)
    goto LABEL_7;
LABEL_8:

}

- (void)createSuperHighLevelCurtainWindowSceneWithDisplayConfiguration:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  FBScene *v7;
  FBScene *superHighLevelWindowScene;
  id v9;

  v9 = a3;
  v4 = SBFEffectiveArtworkSubtype();
  if (v4 <= 2795)
  {
    if (v4 != 2556 && v4 != 2622)
      goto LABEL_8;
LABEL_7:
    +[FBSSceneSpecification specification](SBSystemApertureCurtainSceneSpecification, "specification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = 1260902594;
    -[SBSystemApertureController _createHighLevelSystemApertureSceneWithIdentifier:sceneSpecification:displayConfiguration:continuitySession:atLevel:](self, "_createHighLevelSystemApertureSceneWithIdentifier:sceneSpecification:displayConfiguration:continuitySession:atLevel:", CFSTR("SuperHighLevelSystemAperture"), v5, v9, 0, v6);
    v7 = (FBScene *)objc_claimAutoreleasedReturnValue();
    superHighLevelWindowScene = self->_superHighLevelWindowScene;
    self->_superHighLevelWindowScene = v7;

    goto LABEL_8;
  }
  if (v4 == 2868 || v4 == 2796)
    goto LABEL_7;
LABEL_8:

}

- (id)_createHighLevelSystemApertureSceneWithIdentifier:(id)a3 sceneSpecification:(id)a4 displayConfiguration:(id)a5 continuitySession:(id)a6 atLevel:(float)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  float v35;

  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0D23140];
  v14 = a4;
  v15 = a3;
  objc_msgSend(v13, "definition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D231F0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identityForIdentifier:workspaceIdentifier:", v15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setIdentity:", v20);
  objc_msgSend(MEMORY[0x1E0D231C0], "localIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClientIdentity:", v21);

  objc_msgSend(v16, "setSpecification:", v14);
  v22 = (void *)MEMORY[0x1E0D23148];
  objc_msgSend(v16, "specification");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "parametersForSpecification:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __146__SBSystemApertureController__createHighLevelSystemApertureSceneWithIdentifier_sceneSpecification_displayConfiguration_continuitySession_atLevel___block_invoke;
  v32[3] = &unk_1E8EC1D68;
  v35 = a7;
  v33 = v11;
  v34 = v12;
  v25 = v12;
  v26 = v11;
  objc_msgSend(v24, "updateSettingsWithBlock:", v32);
  objc_msgSend(v24, "updateClientSettingsWithBlock:", &__block_literal_global_415);
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "createSceneWithDefinition:initialParameters:", v16, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "systemShellHostingEnvironment");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSystemShellHostingSpaceIdentifier:", v30);

  return v28;
}

void __146__SBSystemApertureController__createHighLevelSystemApertureSceneWithIdentifier_sceneSpecification_displayConfiguration_continuitySession_atLevel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v9, "setLevel:", *(float *)(a1 + 48));
  objc_msgSend(v9, "setForeground:", 1);
  objc_msgSend(v9, "setInterfaceOrientation:", 1);
  if (objc_msgSend(v9, "isUISubclass"))
  {
    v3 = v9;
    objc_msgSend(v3, "setInterfaceOrientationMode:", 100);
    objc_msgSend(v3, "setTargetOfEventDeferringEnvironments:", 0);
    v4 = (void *)SBApp;
    objc_msgSend(*(id *)(a1 + 32), "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInterfaceStyleProviderForDisplay:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v6, "currentStyle"));

    objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);

  }
  objc_msgSend(v9, "ignoreOcclusionReasons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", CFSTR("SystemApp"));

  if (*(_QWORD *)(a1 + 40) && objc_msgSend(v9, "conformsToProtocol:", &unk_1EFEB4D78))
    objc_msgSend(v9, "setContinuitySession:", *(_QWORD *)(a1 + 40));

}

void __146__SBSystemApertureController__createHighLevelSystemApertureSceneWithIdentifier_sceneSpecification_displayConfiguration_continuitySession_atLevel___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isUISubclass"))
  {
    v2 = v3;
    objc_msgSend(v2, "setStatusBarStyle:", 0);
    objc_msgSend(v2, "setInterfaceOrientation:", 1);

  }
}

- (void)createHighLevelSystemApertureWindowWithWindowScene:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  SBSystemApertureWindow *v10;
  UIWindow *window;
  SBSystemApertureViewController *v12;
  SBSystemApertureViewController *systemApertureViewController;
  SBSystemApertureCaptureVisibilityShimViewController *v14;
  SBSystemApertureCaptureVisibilityShimViewController *mainCloningShimViewController;
  void *v16;
  void *v17;
  TRAParticipant *v18;
  TRAParticipant *traitsParticipant;
  SBSystemApertureSceneHoster *v20;
  SBSystemApertureSceneHoster *sceneHoster;
  SBSystemApertureLayoutMonitorServer *v22;
  SBSystemApertureLayoutMonitorServer *systemApertureLayoutMonitorServer;
  SBSystemApertureRestrictionServer *v24;
  SBSystemApertureRestrictionServer *systemApertureRestrictionServer;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  SBSystemAperturePortalSourceInfoRequestServer *v30;
  SBSystemAperturePortalSourceInfoRequestServer *systemAperturePortalSourceRequestServer;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  v5 = SBFEffectiveArtworkSubtype();
  if (v5 > 2795)
  {
    if (v5 != 2868 && v5 != 2796)
      goto LABEL_17;
  }
  else if (v5 != 2556 && v5 != 2622)
  {
    goto LABEL_17;
  }
  if (self->_window)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 331, CFSTR("Can't create second system aperture window."));

  }
  v6 = objc_opt_class();
  v7 = v35;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = -[SBFTouchPassThroughWindow initWithWindowScene:role:debugName:]([SBSystemApertureWindow alloc], "initWithWindowScene:role:debugName:", v7, CFSTR("SBTraitsParticipantRoleSystemAperture"), CFSTR("Jindo Window"));
  window = self->_window;
  self->_window = &v10->super.super.super;

  v12 = -[SBSystemApertureViewController initWithActiveWindowScene:]([SBSystemApertureViewController alloc], "initWithActiveWindowScene:", v9);
  systemApertureViewController = self->_systemApertureViewController;
  self->_systemApertureViewController = v12;

  -[SBSystemApertureViewController setVisibilityDelegate:](self->_systemApertureViewController, "setVisibilityDelegate:", self);
  -[SBSystemApertureViewController setBacklightSessionAggregator:](self->_systemApertureViewController, "setBacklightSessionAggregator:", self);
  v14 = -[SBSystemApertureCaptureVisibilityShimViewController initWithContentViewController:]([SBSystemApertureCaptureVisibilityShimViewController alloc], "initWithContentViewController:", self->_systemApertureViewController);
  mainCloningShimViewController = self->_mainCloningShimViewController;
  self->_mainCloningShimViewController = v14;

  -[SBSystemApertureCaptureVisibilityShimViewController setContentsDifferOnClonedDisplay:](self->_mainCloningShimViewController, "setContentsDifferOnClonedDisplay:", 1);
  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_mainCloningShimViewController);
  -[UIWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self->_window, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", 1, 0, 0, 0.0);
  SBSystemApertureApplyUnDisplayZoomScaleToWindowInWindowSceneIfNecessary(self->_window, v7);
  objc_msgSend(v9, "associatedWindowScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "traitsArbiter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 344, CFSTR("Arbiter is unexpectedly nil for System Aperture"));

  }
  objc_msgSend(v17, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleSystemAperture"), self);
  v18 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = v18;

  -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("init"));
  -[TRAParticipant updatePreferencesIfNeeded](self->_traitsParticipant, "updatePreferencesIfNeeded");
  -[UIWindow setHidden:](self->_window, "setHidden:", -[NSMutableArray count](self->_systemApertureSuppressionAssertions, "count") != 0);
  -[SBSystemApertureController _configureBacklightEnvironmentSceneProviderIfNecessary](self, "_configureBacklightEnvironmentSceneProviderIfNecessary");
  -[SBSystemApertureController _configureNoticeManagerIfNecessary](self, "_configureNoticeManagerIfNecessary");
  -[SBSystemApertureController _configureLegacyStatusBarPillElementProviderIfNecessary](self, "_configureLegacyStatusBarPillElementProviderIfNecessary");
  v20 = objc_alloc_init(SBSystemApertureSceneHoster);
  sceneHoster = self->_sceneHoster;
  self->_sceneHoster = v20;

  -[SBSystemApertureSceneHoster activateWithSystemApertureController:](self->_sceneHoster, "activateWithSystemApertureController:", self);
  v22 = objc_alloc_init(SBSystemApertureLayoutMonitorServer);
  systemApertureLayoutMonitorServer = self->_systemApertureLayoutMonitorServer;
  self->_systemApertureLayoutMonitorServer = v22;

  v24 = -[SBSystemApertureRestrictionServer initWithDelegate:]([SBSystemApertureRestrictionServer alloc], "initWithDelegate:", self);
  systemApertureRestrictionServer = self->_systemApertureRestrictionServer;
  self->_systemApertureRestrictionServer = v24;

  v26 = objc_alloc(MEMORY[0x1E0DAAF30]);
  v27 = -[UIWindow _contextId](self->_window, "_contextId");
  -[UIWindow layer](self->_window, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v26, "initWithSourceContextID:sourceLayerRenderID:", v27, CALayerGetRenderId());

  v30 = -[SBSystemAperturePortalSourceInfoRequestServer initWithPortalSource:]([SBSystemAperturePortalSourceInfoRequestServer alloc], "initWithPortalSource:", v29);
  systemAperturePortalSourceRequestServer = self->_systemAperturePortalSourceRequestServer;
  self->_systemAperturePortalSourceRequestServer = v30;

  -[SBSystemAperturePortalSourceInfoRequestServer startListener](self->_systemAperturePortalSourceRequestServer, "startListener");
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:", self);
  -[SBSystemApertureController setActiveWindowScene:](self, "setActiveWindowScene:", v7);

LABEL_17:
}

- (void)highLevelContinuitySystemApertureWindowSceneDidConnect:(id)a3
{
  uint64_t v5;
  SBSystemApertureWindow *v6;
  UIWindow *continuityWindow;
  void *v8;
  void *v9;
  TRAParticipant *v10;
  TRAParticipant *continuityTraitsParticipant;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = SBFEffectiveArtworkSubtype();
  if (v5 > 2795)
  {
    if (v5 != 2868 && v5 != 2796)
      goto LABEL_12;
  }
  else if (v5 != 2556 && v5 != 2622)
  {
    goto LABEL_12;
  }
  if (self->_continuityWindow)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 368, CFSTR("Can't create second system aperture continuity window."));

  }
  v6 = -[SBFTouchPassThroughWindow initWithWindowScene:role:debugName:]([SBSystemApertureWindow alloc], "initWithWindowScene:role:debugName:", v14, CFSTR("SBTraitsParticipantRoleSystemAperture"), CFSTR("Jindo Continuity Window"));
  continuityWindow = self->_continuityWindow;
  self->_continuityWindow = &v6->super.super.super;

  -[UIWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self->_continuityWindow, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", 1, 0, 0, 0.0);
  SBSystemApertureApplyUnDisplayZoomScaleToWindowInWindowSceneIfNecessary(self->_continuityWindow, v14);
  -[UIWindow setHidden:](self->_continuityWindow, "setHidden:", -[NSMutableArray count](self->_systemApertureSuppressionAssertions, "count") != 0);
  objc_msgSend(v14, "associatedWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitsArbiter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 374, CFSTR("Arbiter is unexpectedly nil for System Aperture"));

  }
  objc_msgSend(v9, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleSystemAperture"), self);
  v10 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
  continuityTraitsParticipant = self->_continuityTraitsParticipant;
  self->_continuityTraitsParticipant = v10;

  -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_continuityTraitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("init"));
  -[TRAParticipant updatePreferencesIfNeeded](self->_continuityTraitsParticipant, "updatePreferencesIfNeeded");
  -[SBSystemApertureController _ensureSystemAperturesOnCorrectDisplays](self, "_ensureSystemAperturesOnCorrectDisplays");

LABEL_12:
}

- (void)highLevelContinuitySystemApertureWindowSceneDidDisconnect:(id)a3
{
  TRAParticipant *continuityTraitsParticipant;
  UIWindow *continuityWindow;
  id v6;

  -[TRAParticipant invalidate](self->_continuityTraitsParticipant, "invalidate", a3);
  continuityTraitsParticipant = self->_continuityTraitsParticipant;
  self->_continuityTraitsParticipant = 0;

  -[UIWindow removeFromSuperview](self->_continuityWindow, "removeFromSuperview");
  continuityWindow = self->_continuityWindow;
  self->_continuityWindow = 0;

  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureController _updateActiveWindowSceneWithSpringBoardWindowScene:](self, "_updateActiveWindowSceneWithSpringBoardWindowScene:", v6);

}

- (void)createSuperHighLevelCurtainWithWindowScene:(id)a3
{
  uint64_t v5;
  SBSystemApertureWindow *v6;
  UIWindow *auxillarySuperHighLevelWindow;
  SBSystemApertureCurtainViewController *v8;
  SBSystemApertureCurtainViewController *systemApertureCurtainViewController;
  SBSystemApertureCaptureVisibilityShimViewController *v10;
  SBSystemApertureCaptureVisibilityShimViewController *curtainCloningShimViewController;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = SBFEffectiveArtworkSubtype();
  if (v5 > 2795)
  {
    if (v5 != 2868 && v5 != 2796)
      goto LABEL_10;
  }
  else if (v5 != 2556 && v5 != 2622)
  {
    goto LABEL_10;
  }
  if (self->_auxillarySuperHighLevelWindow)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 394, CFSTR("Can't create second curtain window."));

  }
  v6 = -[SBFTouchPassThroughWindow initWithWindowScene:role:debugName:]([SBSystemApertureWindow alloc], "initWithWindowScene:role:debugName:", v14, CFSTR("SBTraitsParticipantRoleSystemAperture"), CFSTR("Jindo Super High Level Window"));
  auxillarySuperHighLevelWindow = self->_auxillarySuperHighLevelWindow;
  self->_auxillarySuperHighLevelWindow = &v6->super.super.super;

  SBSystemApertureApplyUnDisplayZoomScaleToWindowInWindowSceneIfNecessary(self->_auxillarySuperHighLevelWindow, v14);
  -[UIWindow setUserInteractionEnabled:](self->_auxillarySuperHighLevelWindow, "setUserInteractionEnabled:", 0);
  v8 = objc_alloc_init(SBSystemApertureCurtainViewController);
  systemApertureCurtainViewController = self->_systemApertureCurtainViewController;
  self->_systemApertureCurtainViewController = v8;

  v10 = -[SBSystemApertureCaptureVisibilityShimViewController initWithContentViewController:]([SBSystemApertureCaptureVisibilityShimViewController alloc], "initWithContentViewController:", self->_systemApertureCurtainViewController);
  curtainCloningShimViewController = self->_curtainCloningShimViewController;
  self->_curtainCloningShimViewController = v10;

  -[SBSystemApertureCaptureVisibilityShimViewController setContentsDifferOnClonedDisplay:](self->_curtainCloningShimViewController, "setContentsDifferOnClonedDisplay:", 1);
  -[UIWindow setRootViewController:](self->_auxillarySuperHighLevelWindow, "setRootViewController:", self->_curtainCloningShimViewController);
  -[SBSystemApertureViewController setCurtainViewHoster:](self->_systemApertureViewController, "setCurtainViewHoster:", self->_systemApertureCurtainViewController);
  -[UIWindow setHidden:](self->_auxillarySuperHighLevelWindow, "setHidden:", -[NSMutableArray count](self->_systemApertureSuppressionAssertions, "count") != 0);
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ignoreWindowForReachability:", self->_auxillarySuperHighLevelWindow);

  -[SBSystemApertureController _updateSuppressionForDefaults](self, "_updateSuppressionForDefaults");
  -[SBSystemApertureController _ensureSystemAperturesOnCorrectDisplays](self, "_ensureSystemAperturesOnCorrectDisplays");
LABEL_10:

}

- (void)superHighLevelContinuityCurtainWindowSceneDidConnect:(id)a3
{
  uint64_t v5;
  SBSystemApertureWindow *v6;
  UIWindow *auxillarySuperHighLevelContinuityWindow;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = SBFEffectiveArtworkSubtype();
  if (v5 > 2795)
  {
    if (v5 != 2868 && v5 != 2796)
      goto LABEL_10;
  }
  else if (v5 != 2556 && v5 != 2622)
  {
    goto LABEL_10;
  }
  if (self->_auxillarySuperHighLevelContinuityWindow)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 413, CFSTR("Can't create second curtain continuity window."));

  }
  v6 = -[SBFTouchPassThroughWindow initWithWindowScene:role:debugName:]([SBSystemApertureWindow alloc], "initWithWindowScene:role:debugName:", v10, CFSTR("SBTraitsParticipantRoleSystemAperture"), CFSTR("Jindo Super High Level Continuity Window"));
  auxillarySuperHighLevelContinuityWindow = self->_auxillarySuperHighLevelContinuityWindow;
  self->_auxillarySuperHighLevelContinuityWindow = &v6->super.super.super;

  SBSystemApertureApplyUnDisplayZoomScaleToWindowInWindowSceneIfNecessary(self->_auxillarySuperHighLevelContinuityWindow, v10);
  -[UIWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self->_auxillarySuperHighLevelContinuityWindow, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", 1, 0, 0, 0.0);
  -[UIWindow setUserInteractionEnabled:](self->_auxillarySuperHighLevelContinuityWindow, "setUserInteractionEnabled:", 0);
  -[UIWindow setHidden:](self->_auxillarySuperHighLevelContinuityWindow, "setHidden:", -[NSMutableArray count](self->_systemApertureSuppressionAssertions, "count") != 0);
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ignoreWindowForReachability:", self->_auxillarySuperHighLevelContinuityWindow);

  -[SBSystemApertureController _updateSuppressionForDefaults](self, "_updateSuppressionForDefaults");
  -[SBSystemApertureController _ensureSystemAperturesOnCorrectDisplays](self, "_ensureSystemAperturesOnCorrectDisplays");
LABEL_10:

}

- (void)superHighLevelContinuityCurtainWindowSceneDidDisconnect:(id)a3
{
  UIWindow *auxillarySuperHighLevelContinuityWindow;

  -[UIWindow removeFromSuperview](self->_auxillarySuperHighLevelContinuityWindow, "removeFromSuperview", a3);
  auxillarySuperHighLevelContinuityWindow = self->_auxillarySuperHighLevelContinuityWindow;
  self->_auxillarySuperHighLevelContinuityWindow = 0;

}

- (BOOL)isTransitionTargetForSceneIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return -[SBSystemApertureViewController isTransitionTargetForSceneIdentifier:bundleIdentifier:](self->_systemApertureViewController, "isTransitionTargetForSceneIdentifier:bundleIdentifier:", a3, a4);
}

- (CGRect)defaultIslandFrameInCoordinateSpace:(id)a3
{
  SBSystemApertureViewController *systemApertureViewController;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  systemApertureViewController = self->_systemApertureViewController;
  v5 = a3;
  -[SBSystemApertureViewController minimumSensorRegionFrame](systemApertureViewController, "minimumSensorRegionFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBSystemApertureViewController view](self->_systemApertureViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:toCoordinateSpace:", v5, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)animateTransitionAcceptanceBounceWithVelocityVector:(CGPoint)a3 triggeredBlock:(id)a4
{
  -[SBSystemApertureViewController animateTransitionAcceptanceBounceWithVelocityVector:triggeredBlock:](self->_systemApertureViewController, "animateTransitionAcceptanceBounceWithVelocityVector:triggeredBlock:", a4, a3.x, a3.y);
}

- (void)animateTransitionEjectionStretchWithVelocityVector:(CGPoint)a3
{
  -[SBSystemApertureViewController animateTransitionEjectionStretchWithVelocityVector:](self->_systemApertureViewController, "animateTransitionEjectionStretchWithVelocityVector:", a3.x, a3.y);
}

- (id)requireHeavyShadowAssertionForTransition
{
  return -[SBSystemApertureViewController requireHeavyShadowAssertionForTransition](self->_systemApertureViewController, "requireHeavyShadowAssertionForTransition");
}

- (void)animateDiscreteAnimationStyle:(int64_t)a3 toElement:(id)a4
{
  -[SBSystemApertureViewController animateDiscreteAnimationStyle:toElement:](self->_systemApertureViewController, "animateDiscreteAnimationStyle:toElement:", a3, a4);
}

- (id)applyPersistentAnimationStyle:(int64_t)a3 toElement:(id)a4
{
  return -[SBSystemApertureViewController applyPersistentAnimationStyle:toElement:](self->_systemApertureViewController, "applyPersistentAnimationStyle:toElement:", a3, a4);
}

- (id)systemApertureRepresentationSuppressionAssertionForCoversheetVisibility
{
  return -[SBSystemApertureViewController systemApertureRepresentationSuppressionAssertionForCoversheetVisibility](self->_systemApertureViewController, "systemApertureRepresentationSuppressionAssertionForCoversheetVisibility");
}

- (id)systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility
{
  return -[SBSystemApertureViewController systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility](self->_systemApertureViewController, "systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility");
}

- (id)systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility
{
  return -[SBSystemApertureViewController systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility](self->_systemApertureViewController, "systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility");
}

- (id)restrictSystemApertureToDefaultLayoutWithReason:(id)a3
{
  return -[SBSystemApertureViewController restrictSystemApertureToDefaultLayoutWithReason:](self->_systemApertureViewController, "restrictSystemApertureToDefaultLayoutWithReason:", a3);
}

- (id)restrictSystemApertureToInertWithReason:(id)a3
{
  return -[SBSystemApertureViewController restrictSystemApertureToInertWithReason:](self->_systemApertureViewController, "restrictSystemApertureToInertWithReason:", a3);
}

- (id)requireKeyLineAssertionForTransition
{
  return -[SBSystemApertureViewController requireKeyLineAssertionForTransition](self->_systemApertureViewController, "requireKeyLineAssertionForTransition");
}

- (id)suppressSystemApertureCompletelyWithReason:(id)a3
{
  id v4;
  NSMutableArray *systemApertureSuppressionAssertions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DB07E0]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBSystemApertureController_suppressSystemApertureCompletelyWithReason___block_invoke;
  v10[3] = &unk_1E8EC1DD0;
  v10[4] = self;
  objc_msgSend(v4, "addInvalidationBlock:", v10);
  systemApertureSuppressionAssertions = self->_systemApertureSuppressionAssertions;
  if (!systemApertureSuppressionAssertions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_systemApertureSuppressionAssertions;
    self->_systemApertureSuppressionAssertions = v6;

    systemApertureSuppressionAssertions = self->_systemApertureSuppressionAssertions;
  }
  -[NSMutableArray addObject:](systemApertureSuppressionAssertions, "addObject:", v4);
  SBLogSystemApertureController();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "System Aperture Complete Suppression Assertion Acquired: %{public}@", buf, 0xCu);
  }

  -[SBSystemApertureController _reevaluateSystemApertureCompleteSuppression](self, "_reevaluateSystemApertureCompleteSuppression");
  return v4;
}

void __73__SBSystemApertureController_suppressSystemApertureCompletelyWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogSystemApertureController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "System Aperture Complete Suppression Assertion Invalidated: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeObject:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_reevaluateSystemApertureCompleteSuppression");

}

- (id)overrideContainerRenderingStyleAssertion:(int64_t)a3
{
  return -[SBSystemApertureViewController overrideContainerRenderingStyleAssertion:](self->_systemApertureViewController, "overrideContainerRenderingStyleAssertion:", a3);
}

- (id)_currentFirstElement
{
  return -[SBSystemApertureViewController _currentFirstElement](self->_systemApertureViewController, "_currentFirstElement");
}

- (id)acquireSuppressionAssertionForBackgroundActivities:(id)a3 reason:(id)a4
{
  return -[SBSystemApertureStatusBarPillElementProvider acquireSuppressionAssertionForBackgroundActivities:reason:](self->_legacyStatusBarPillElementProvider, "acquireSuppressionAssertionForBackgroundActivities:reason:", a3, a4);
}

- (id)acquireActiveElementAssertionForApplication:(id)a3 reason:(id)a4
{
  return -[SBSystemApertureStatusBarPillElementProvider acquireActiveElementAssertionForApplication:reason:](self->_legacyStatusBarPillElementProvider, "acquireActiveElementAssertionForApplication:reason:", a3, a4);
}

uint64_t __69__SBSystemApertureController__updateVisibilityForCloningAndSnapshots__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setVisibleOnClonedDisplay:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __69__SBSystemApertureController__updateVisibilityForCloningAndSnapshots__block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a2)
  {
    v8 = v2;
    v6 = result;
    if (*(_BYTE *)(result + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 64), "setVisibleOnClonedDisplay:", 1);
      v7 = 2 * (*(_BYTE *)(v6 + 40) != 0);
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v6 + 32) + 40), "setCloningStyle:", v7, v3, v8, v4, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(v6 + 32) + 48), "setContentsDifferOnClonedDisplay:", 0);
    return objc_msgSend(*(id *)(*(_QWORD *)(v6 + 32) + 64), "setContentsDifferOnClonedDisplay:", 0);
  }
  return result;
}

- (void)_reevaluateSystemApertureCompleteSuppression
{
  uint64_t v3;
  SAInvalidatable *overrideRenderingStyleAssertion;
  SAInvalidatable *v5;
  SAInvalidatable *v6;
  void *v7;
  void *v8;
  CAGainMapLayer *prototypingDefaultGainMapDefeatingLayer;
  CAGainMapLayer *v10;
  CAGainMapLayer *v11;
  void *v12;
  SAInvalidatable *v13;
  void *v14;
  void *v15;
  CAGainMapLayer *v16;

  v3 = -[NSMutableArray count](self->_systemApertureSuppressionAssertions, "count");
  overrideRenderingStyleAssertion = self->_overrideRenderingStyleAssertion;
  if (v3)
  {
    if (!overrideRenderingStyleAssertion)
    {
      -[SBSystemApertureViewController overrideContainerRenderingStyleAssertion:](self->_systemApertureViewController, "overrideContainerRenderingStyleAssertion:", 3);
      v5 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
      v6 = self->_overrideRenderingStyleAssertion;
      self->_overrideRenderingStyleAssertion = v5;

    }
    -[SBSystemApertureCaptureVisibilityShimViewController view](self->_mainCloningShimViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[SBSystemApertureCaptureVisibilityShimViewController view](self->_curtainCloningShimViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    prototypingDefaultGainMapDefeatingLayer = self->_prototypingDefaultGainMapDefeatingLayer;
    if (!prototypingDefaultGainMapDefeatingLayer)
    {
      v10 = (CAGainMapLayer *)objc_alloc_init(MEMORY[0x1E0CD2788]);
      v11 = self->_prototypingDefaultGainMapDefeatingLayer;
      self->_prototypingDefaultGainMapDefeatingLayer = v10;

      -[UIWindow layer](self->_auxillarySuperHighLevelWindow, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSublayer:", self->_prototypingDefaultGainMapDefeatingLayer);

      prototypingDefaultGainMapDefeatingLayer = self->_prototypingDefaultGainMapDefeatingLayer;
    }
    -[CAGainMapLayer setFrame:](prototypingDefaultGainMapDefeatingLayer, "setFrame:", 0.0, 0.0, 1.0, 1.0);
  }
  else
  {
    -[SAInvalidatable invalidateWithReason:](overrideRenderingStyleAssertion, "invalidateWithReason:", CFSTR("No longer completely suppressing System Aperture"));
    v13 = self->_overrideRenderingStyleAssertion;
    self->_overrideRenderingStyleAssertion = 0;

    -[SBSystemApertureCaptureVisibilityShimViewController view](self->_mainCloningShimViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 0);

    -[SBSystemApertureCaptureVisibilityShimViewController view](self->_curtainCloningShimViewController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 0);

    -[CAGainMapLayer removeFromSuperlayer](self->_prototypingDefaultGainMapDefeatingLayer, "removeFromSuperlayer");
    v16 = self->_prototypingDefaultGainMapDefeatingLayer;
    self->_prototypingDefaultGainMapDefeatingLayer = 0;

  }
}

- (void)_updateSuppressionForDefaults
{
  int v3;
  SAInvalidatable *jindoDefaultsSuppressionAssertion;
  SAInvalidatable *v5;
  SAInvalidatable *v6;

  v3 = -[SBSystemApertureDefaults suppressDynamicIslandCompletely](self->_systemApertureDefaults, "suppressDynamicIslandCompletely");
  jindoDefaultsSuppressionAssertion = self->_jindoDefaultsSuppressionAssertion;
  if (!v3)
  {
    -[SAInvalidatable invalidateWithReason:](jindoDefaultsSuppressionAssertion, "invalidateWithReason:", CFSTR("NSUserDefault SBSuppressDynamicIslandCompletely is not set."));
    v5 = 0;
LABEL_6:
    v6 = self->_jindoDefaultsSuppressionAssertion;
    self->_jindoDefaultsSuppressionAssertion = v5;

    return;
  }
  if (!jindoDefaultsSuppressionAssertion)
  {
    -[SBSystemApertureController suppressSystemApertureCompletelyWithReason:](self, "suppressSystemApertureCompletelyWithReason:", CFSTR("NSUserDefault SBSuppressDynamicIslandCompletely is set."));
    v5 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__SBSystemApertureController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke;
  v12[3] = &unk_1E8E9E270;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Associated Windows"), a5, v12);

}

void __90__SBSystemApertureController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "participantAssociatedWindows:", *(_QWORD *)(a1 + 40));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v1)
  {
    v2 = v1;
    v15 = *(_QWORD *)v18;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v3);
        v5 = *(void **)(a1 + 48);
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_debugName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isHidden"))
          v10 = CFSTR("NO");
        else
          v10 = CFSTR("YES");
        objc_msgSend(v4, "interfaceOrientation");
        BSInterfaceOrientationDescription();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "rootViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p; %@>; Visible:%@; Orientation:%@; Root VC: %@"),
          v8,
          v4,
          v9,
          v10,
          v11,
          v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:withName:", v13, 0);

        ++v3;
      }
      while (v2 != v3);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v2);
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (self->_settings == a3)
  {
    v9 = v6;
    if ((objc_msgSend(v6, "isEqual:", CFSTR("suppressHidingOnClonedDisplayWhileEmpty")) & 1) != 0
      || (v8 = objc_msgSend(v9, "isEqual:", CFSTR("suppressHidingInSnapshotsWhileEmpty")), v7 = v9, v8))
    {
      -[SBSystemApertureController _updateVisibilityForCloningAndSnapshots](self, "_updateVisibilityForCloningAndSnapshots");
      v7 = v9;
    }
  }

}

- (BOOL)systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:(id)a3
{
  return -[SBSystemApertureViewController systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:](self->_systemApertureViewController, "systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:", a3);
}

- (BOOL)systemApertureProximityBacklightPolicy:(id)a3 isSystemApertureElementVisibleAtPoint:(CGPoint)a4
{
  return -[SBSystemApertureViewController systemApertureProximityBacklightPolicy:isSystemApertureElementVisibleAtPoint:](self->_systemApertureViewController, "systemApertureProximityBacklightPolicy:isSystemApertureElementVisibleAtPoint:", a3, a4.x, a4.y);
}

- (void)systemApertureProximityBacklightPolicy:(id)a3 embedProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5
{
  -[SBSystemApertureViewController systemApertureProximityBacklightPolicy:embedProximityTouchTrackingView:touchBlockingView:](self->_systemApertureViewController, "systemApertureProximityBacklightPolicy:embedProximityTouchTrackingView:touchBlockingView:", a3, a4, a5);
}

- (void)systemApertureProximityBacklightPolicy:(id)a3 removeProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5
{
  -[SBSystemApertureViewController systemApertureProximityBacklightPolicy:removeProximityTouchTrackingView:touchBlockingView:](self->_systemApertureViewController, "systemApertureProximityBacklightPolicy:removeProximityTouchTrackingView:touchBlockingView:", a3, a4, a5);
}

- (BOOL)systemApertureProximityBacklightPolicyShouldDisableGracePeriod:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend((id)SBApp, "proximitySensorManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGracePeriodDisabled");

  return v4;
}

- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  BOOL IsActive;
  id v9;

  if (SBBacklightStateIsActive(objc_msgSend(a3, "backlightState")))
  {
    IsActive = SBBacklightStateIsActive(a4);
    if (a5 != 13 && !IsActive)
    {
      -[SBSystemApertureController restrictSystemApertureToDefaultLayoutWithReason:](self, "restrictSystemApertureToDefaultLayoutWithReason:", CFSTR("Backlight no longer active"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidateWithReason:", CFSTR("transient transition to default layout"));

    }
  }
}

- (id)scenesForBacklightSession
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_highLevelWindowScene)
    objc_msgSend(v3, "addObject:");
  if (self->_superHighLevelWindowScene)
    objc_msgSend(v4, "addObject:");
  -[SBSystemApertureViewController scenesForBacklightSession](self->_systemApertureViewController, "scenesForBacklightSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  return v4;
}

- (void)hostedScenesDidChange
{
  _QWORD block[5];

  if (self->_registeredBacklightSceneProvider)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SBSystemApertureController_hostedScenesDidChange__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __51__SBSystemApertureController_hostedScenesDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateBacklightScenesForProvider:", *(_QWORD *)(a1 + 32));

}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return -[SBSystemApertureViewController handleHeadsetButtonPress:](self->_systemApertureViewController, "handleHeadsetButtonPress:", a3);
}

- (BOOL)handleHomeButtonPress
{
  return -[SBSystemApertureViewController handleHomeButtonPress](self->_systemApertureViewController, "handleHomeButtonPress");
}

- (BOOL)handleHomeButtonDoublePress
{
  return -[SBSystemApertureViewController handleHomeButtonDoublePress](self->_systemApertureViewController, "handleHomeButtonDoublePress");
}

- (BOOL)handleHomeButtonLongPress
{
  return -[SBSystemApertureViewController handleHomeButtonLongPress](self->_systemApertureViewController, "handleHomeButtonLongPress");
}

- (BOOL)handleLockButtonPress
{
  return -[SBSystemApertureViewController handleLockButtonPress](self->_systemApertureViewController, "handleLockButtonPress");
}

- (BOOL)handleVoiceCommandButtonPress
{
  return -[SBSystemApertureViewController handleVoiceCommandButtonPress](self->_systemApertureViewController, "handleVoiceCommandButtonPress");
}

- (BOOL)handleVolumeUpButtonPress
{
  return -[SBSystemApertureViewController handleVolumeUpButtonPress](self->_systemApertureViewController, "handleVolumeUpButtonPress");
}

- (BOOL)handleVolumeDownButtonPress
{
  return -[SBSystemApertureViewController handleVolumeDownButtonPress](self->_systemApertureViewController, "handleVolumeDownButtonPress");
}

- (void)multiDisplayUserInteractionCoordinator:(id)a3 updatedActiveWindowScene:(id)a4
{
  -[SBSystemApertureController _updateActiveWindowSceneWithSpringBoardWindowScene:](self, "_updateActiveWindowSceneWithSpringBoardWindowScene:", a4);
}

- (void)_updateActiveWindowSceneWithSpringBoardWindowScene:(id)a3
{
  UIWindow *window;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  if (objc_msgSend(a3, "isMainDisplayWindowScene"))
    window = self->_window;
  else
    window = self->_continuityWindow;
  -[UIWindow windowScene](window, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v12 = v9;

  v10 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureController.m"), 773, CFSTR("There is no system aperture window scene for the new active springboard window scene"));

    v10 = 0;
  }
  -[SBSystemApertureController setActiveWindowScene:](self, "setActiveWindowScene:", v10);

}

- (void)_configureNoticeManagerIfNecessary
{
  SBSystemAperturePresentableManager *v3;
  SBSystemAperturePresentableManager *systemAperturePresentableManager;
  id v5;

  if (!self->_systemAperturePresentableManager)
  {
    v3 = -[SBSystemAperturePresentableManager initWithElementRegistrar:]([SBSystemAperturePresentableManager alloc], "initWithElementRegistrar:", self);
    systemAperturePresentableManager = self->_systemAperturePresentableManager;
    self->_systemAperturePresentableManager = v3;

    objc_msgSend((id)SBApp, "bannerManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentableInterceptor:", self->_systemAperturePresentableManager);

  }
}

- (void)_configureLegacyStatusBarPillElementProviderIfNecessary
{
  SBSystemApertureStatusBarPillElementProvider *v3;
  SBSystemApertureStatusBarPillElementProvider *legacyStatusBarPillElementProvider;

  v3 = objc_alloc_init(SBSystemApertureStatusBarPillElementProvider);
  legacyStatusBarPillElementProvider = self->_legacyStatusBarPillElementProvider;
  self->_legacyStatusBarPillElementProvider = v3;

  -[SBSystemApertureStatusBarPillElementProvider addObserver:](self->_legacyStatusBarPillElementProvider, "addObserver:", self->_systemApertureViewController);
  -[SBSystemApertureStatusBarPillElementProvider activateWithRegistrar:](self->_legacyStatusBarPillElementProvider, "activateWithRegistrar:", self);
}

- (void)_configureBacklightEnvironmentSceneProviderIfNecessary
{
  void *v3;

  if (!self->_registeredBacklightSceneProvider)
  {
    objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerBacklightEnvironmentSceneProvider:", self);

    self->_registeredBacklightSceneProvider = 1;
  }
}

- (SBSystemApertureWindowScene)activeWindowScene
{
  return (SBSystemApertureWindowScene *)objc_loadWeakRetained((id *)&self->_activeWindowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeWindowScene);
  objc_storeStrong((id *)&self->_prototypingDefaultGainMapDefeatingLayer, 0);
  objc_storeStrong((id *)&self->_jindoDefaultsSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_superHighLevelContinuityWindowScene, 0);
  objc_storeStrong((id *)&self->_highLevelContinuityWindowScene, 0);
  objc_storeStrong((id *)&self->_superHighLevelWindowScene, 0);
  objc_storeStrong((id *)&self->_highLevelWindowScene, 0);
  objc_storeStrong((id *)&self->_overrideRenderingStyleAssertion, 0);
  objc_storeStrong((id *)&self->_systemApertureSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_systemApertureStateDumpService, 0);
  objc_storeStrong((id *)&self->_systemApertureDefaults, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_systemAperturePortalSourceRequestServer, 0);
  objc_storeStrong((id *)&self->_systemApertureRestrictionServer, 0);
  objc_storeStrong((id *)&self->_systemApertureLayoutMonitorServer, 0);
  objc_storeStrong((id *)&self->_continuityTraitsParticipant, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_sceneHoster, 0);
  objc_storeStrong((id *)&self->_legacyStatusBarPillElementProvider, 0);
  objc_storeStrong((id *)&self->_systemAperturePresentableManager, 0);
  objc_storeStrong((id *)&self->_substituteSystemApertureViewController, 0);
  objc_storeStrong((id *)&self->_curtainCloningShimViewController, 0);
  objc_storeStrong((id *)&self->_systemApertureCurtainViewController, 0);
  objc_storeStrong((id *)&self->_mainCloningShimViewController, 0);
  objc_storeStrong((id *)&self->_systemApertureViewController, 0);
  objc_storeStrong((id *)&self->_continuityWindow, 0);
  objc_storeStrong((id *)&self->_auxillarySuperHighLevelContinuityWindow, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_auxillarySuperHighLevelWindow, 0);
}

- (id)stateDump
{
  return -[SBSystemApertureViewController stateDump](self->_systemApertureViewController, "stateDump");
}

- (id)systemApertureModelStateDump
{
  return -[SBSystemApertureViewController systemApertureModelStateDump](self->_systemApertureViewController, "systemApertureModelStateDump");
}

- (id)animationFrameRecordings
{
  return -[SBSystemApertureViewController animationFrameRecordings](self->_systemApertureViewController, "animationFrameRecordings");
}

- (void)setSystemApertureAnimationFrameRecording:(BOOL)a3
{
  -[SBSystemApertureViewController setSystemApertureAnimationFrameRecording:](self->_systemApertureViewController, "setSystemApertureAnimationFrameRecording:", a3);
}

- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3
{
  -[SBSystemApertureViewController setSystemApertureUnderAutomationTesting:](self->_systemApertureViewController, "setSystemApertureUnderAutomationTesting:", a3);
}

- (void)containsHostSceneWithIdentityToken:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSystemApertureController.m");
  v16 = 1024;
  v17 = 212;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
