@implementation SBControlCenterController

- (BOOL)isPresented
{
  uint64_t v3;

  v3 = -[CCUIMainViewController presentationState](self->_viewController, "presentationState");
  if (v3 != 1)
    LOBYTE(v3) = -[CCUIMainViewController presentationState](self->_viewController, "presentationState") == 2;
  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIPanGestureRecognizer *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  BOOL v19;
  BOOL v20;
  void *v21;
  _QWORD v23[4];
  UIPanGestureRecognizer *v24;
  SBControlCenterController *v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  CGPoint v35;
  CGRect v36;

  v6 = (UIPanGestureRecognizer *)a3;
  if (self->_statusBarPullGestureRecognizer == v6)
  {
    -[SBControlCenterController _locationOfTouchInActiveInterfaceOrientation:gestureRecognizer:](self, "_locationOfTouchInActiveInterfaceOrientation:gestureRecognizer:", a4, v6);
    v9 = v8;
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;

    objc_msgSend((id)*MEMORY[0x1E0CEB258], "statusBarHeightForOrientation:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"));
    v16 = v15;
    -[SBControlCenterController _reachabilityOffset](self, "_reachabilityOffset");
    v18 = v16 + v17;
    v36.origin.x = 0.0;
    v36.origin.y = 0.0;
    v36.size.width = v14;
    v36.size.height = v18;
    v35.x = v9;
    v35.y = v11;
    v19 = CGRectContainsPoint(v36, v35);
    v20 = -[SBControlCenterController _isLocationXWithinTrailingStatusBarRegion:](self, "_isLocationXWithinTrailingStatusBarRegion:", v9);
    v7 = v19 && v20;
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__SBControlCenterController_gestureRecognizer_shouldReceiveTouch___block_invoke;
    v23[3] = &unk_1E8EAEAC8;
    v32 = v19 && v20;
    v26 = v9;
    v27 = v11;
    v28 = 0;
    v29 = 0;
    v30 = v14;
    v31 = v18;
    v24 = v6;
    v25 = self;
    v33 = v19;
    v34 = v20;
    objc_msgSend(v21, "logBlock:", v23);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (CGPoint)_locationOfTouchInActiveInterfaceOrientation:(id)a3 gestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v5 = a4;
  objc_msgSend(a3, "locationInView:", 0);
  objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "size");
  _UIWindowConvertPointFromOrientationToOrientation();
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)_isLocationXWithinTrailingStatusBarRegion:(double)a3 regionPadding:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  _QWORD v15[6];
  BOOL v16;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  -[SBControlCenterController _trailingStatusBarRegionWidth](self, "_trailingStatusBarRegionWidth");
  v11 = v10 + a4;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v12 = v11 > a3;
  else
    v12 = v9 - v11 < a3;
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance", v9 - v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__SBControlCenterController__isLocationXWithinTrailingStatusBarRegion_regionPadding___block_invoke;
  v15[3] = &__block_descriptor_49_e19___NSDictionary_8__0l;
  v16 = v12;
  *(double *)&v15[4] = v9;
  *(double *)&v15[5] = v11;
  objc_msgSend(v13, "logBlock:", v15);

  return v12;
}

- (double)_trailingStatusBarRegionWidth
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
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
  double MaxX;
  double v26;
  double v27;
  double v28;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusBarManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "frameForPartWithIdentifier:", *MEMORY[0x1E0CEC1F8]);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v21 = v13;
    v22 = v15;
    v23 = v17;
    v24 = v19;
    if (v20 == 1)
      MaxX = CGRectGetMaxX(*(CGRect *)&v21);
    else
      MaxX = v5 - CGRectGetMinX(*(CGRect *)&v21);
    SBLayoutDefaultSideLayoutElementWidth();
    v28 = v27 * 0.5;
    if (MaxX < v28)
      MaxX = v28;

  }
  else
  {
    v26 = 0.172;
    if ((unint64_t)(v6 - 1) < 2)
      v26 = 0.25;
    return v5 * v26;
  }
  return MaxX;
}

- (BOOL)_isLocationXWithinTrailingStatusBarRegion:(double)a3
{
  return -[SBControlCenterController _isLocationXWithinTrailingStatusBarRegion:regionPadding:](self, "_isLocationXWithinTrailingStatusBarRegion:regionPadding:", a3, 0.0);
}

- (BOOL)grabberTongue:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  double v18;
  uint64_t v19;
  BOOL v20;

  v6 = a3;
  v7 = a4;
  if (-[SBControlCenterController presentingEdge](self, "presentingEdge") == 1
    && (!-[SBControlCenterController _shouldShowGrabberOnFirstSwipe](self, "_shouldShowGrabberOnFirstSwipe")
     || -[SBGrabberTongue isVisible](self->_grabberTongue, "isVisible")))
  {
    objc_msgSend(v6, "edgePullGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBControlCenterController _locationOfTouchInActiveInterfaceOrientation:gestureRecognizer:](self, "_locationOfTouchInActiveInterfaceOrientation:gestureRecognizer:", v7, v8);
    v10 = v9;
    v12 = v11;

    v13 = -[SBControlCenterController _isLocationXWithinTrailingStatusBarRegion:](self, "_isLocationXWithinTrailingStatusBarRegion:", v10);
    if (!v13 && -[SBGrabberTongue isVisible](self->_grabberTongue, "isVisible"))
      objc_msgSend(v6, "dismissWithStyle:animated:", 0, 1);
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__SBControlCenterController_grabberTongue_shouldReceiveTouch___block_invoke;
    v16[3] = &unk_1E8EAEB18;
    v20 = v13;
    v17 = v6;
    v18 = v10;
    v19 = v12;
    objc_msgSend(v14, "logBlock:", v16);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)_shouldShowGrabberOnFirstSwipe
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  BOOL v7;
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
  unint64_t v18;
  uint64_t v19;

  -[SBControlCenterController _transientOverlayPresenter](self, "_transientOverlayPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasActivePresentation");

  if ((v4 & 1) != 0)
    return 0;
  -[SBControlCenterController _lockScreenManager](self, "_lockScreenManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUILocked");

  if ((v6 & 1) != 0)
    return 0;
  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "switcherController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "unlockedEnvironmentMode") == 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v9, "layoutStateSideElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workspaceEntity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applicationSceneEntity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sceneHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v9, "layoutStatePrimaryElement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "workspaceEntity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "applicationSceneEntity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sceneHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = -[SBControlCenterController presentingEdge](self, "presentingEdge");
      if (objc_msgSend(v17, "isDeviceApplicationSceneHandle"))
        v19 = objc_msgSend(v17, "screenEdgesDeferringSystemGestures");
      else
        v19 = 0;
      v7 = (v19 & v18) != 0;

    }
  }

  return v7;
}

- (id)_lockScreenManager
{
  void *v2;
  void *v3;

  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_transientOverlayPresenter
{
  void *v2;
  void *v3;

  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)_reachabilityOffset
{
  void *v2;
  double v3;
  double v4;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveReachabilityYOffset");
  v4 = v3;

  return v4;
}

+ (SBControlCenterController)sharedInstance
{
  return (SBControlCenterController *)objc_msgSend(a1, "_sharedInstanceCreatingIfNeeded:", 1);
}

+ (id)_sharedInstanceCreatingIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D44730], "inUserSessionLoginUI") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)_sharedInstanceCreatingIfNeeded____ControlCenter;
    if (_sharedInstanceCreatingIfNeeded____ControlCenter)
      v6 = 1;
    else
      v6 = !v3;
    if (!v6)
    {
      if (_sharedInstanceCreatingIfNeeded__onceToken != -1)
        dispatch_once(&_sharedInstanceCreatingIfNeeded__onceToken, &__block_literal_global_161);
      v5 = (void *)_sharedInstanceCreatingIfNeeded____ControlCenter;
    }
    v4 = v5;
  }
  return v4;
}

+ (id)sharedInstanceIfExists
{
  return (id)objc_msgSend(a1, "_sharedInstanceCreatingIfNeeded:", 0);
}

- (BOOL)isVisible
{
  return -[SBControlCenterWindow isHidden](self->_window, "isHidden") ^ 1;
}

- (unint64_t)presentingEdge
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = objc_opt_class();
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "edges");
  }
  else if (SBFEffectiveHomeButtonType() == 2)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v6 = 1;
    else
      v6 = 4;
  }

  return v6;
}

- (id)_presentGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (self->_statusBarPullGestureRecognizer)
    objc_msgSend(v3, "addObject:");
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0D14598];
  v5 = a3;
  v11 = objc_alloc_init(v4);
  objc_msgSend(v5, "mostRecentCameraAndMicrophoneSensorActivityAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlCenterController _sensorActivityDataFromSensorActivityAttribution:](self, "_sensorActivityDataFromSensorActivityAttribution:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setUsedRecently:", 1);
  objc_msgSend(v11, "setMostRecentSensorActivityData:", v7);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if ((_os_feature_enabled_impl() & 1) != 0)
    objc_msgSend(v5, "activeAndRecentSensorActivityAttributions");
  else
    objc_msgSend(v5, "activeCameraAndMicrophoneActivityAttributions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__SBControlCenterController_activityDidChangeForSensorActivityDataProvider___block_invoke;
  v12[3] = &unk_1E8EAEBA0;
  v12[4] = self;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(v11, "setActiveSensorActivityData:", v10);
  -[CCUIMainViewController setSensorActivityDataProvider:](self->_viewController, "setSensorActivityDataProvider:", v11);
  -[SBControlCenterController _updateInactiveMicModeSelectionSensorActivityData](self, "_updateInactiveMicModeSelectionSensorActivityData");

}

void __76__SBControlCenterController_activityDidChangeForSensorActivityDataProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_sensorActivityDataFromSensorActivityAttribution:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)_sensorActivityDataFromSensorActivityAttribution:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "sensor");
  if (v3)
  {
    v5 = v4;
    v6 = objc_alloc_init(MEMORY[0x1E0D147C8]);
    v7 = v6;
    if (v5 == 2)
      v8 = 2;
    else
      v8 = v5 == 1;
    objc_msgSend(v6, "setSensorType:", v8);
    objc_msgSend(v3, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayName:", v9);

    objc_msgSend(v7, "setUsedRecently:", objc_msgSend(v3, "usedRecently"));
    objc_msgSend(v3, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBundleIdentifier:", v10);

    objc_msgSend(v3, "attributionGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributionGroup:", v11);

    objc_msgSend(v3, "website");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWebsite:", v12);

    objc_msgSend(v7, "setIsSystemService:", objc_msgSend(v3, "isSystemService"));
    objc_msgSend(v3, "executableDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExecutableDisplayName:", v13);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CCUIMainViewController)viewController
{
  return self->_viewController;
}

uint64_t __61__SBControlCenterController__sharedInstanceCreatingIfNeeded___block_invoke()
{
  SBControlCenterController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBControlCenterController);
  v1 = (void *)_sharedInstanceCreatingIfNeeded____ControlCenter;
  _sharedInstanceCreatingIfNeeded____ControlCenter = (uint64_t)v0;

  return kdebug_trace();
}

- (SBControlCenterController)init
{
  SBControlCenterController *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  SBControlCenterSystemAgent *v8;
  SBControlCenterSystemAgent *systemAgent;
  SBControlCenterSystemControlsHost *v10;
  uint64_t v11;
  CCUISystemControlsCoordinator *systemControlsCoordinator;
  SBWindowLevelAssertionManager *v13;
  SBWindowLevelAssertionManager *windowLevelAssertionManager;
  void *v15;
  uint64_t v16;
  SBKeyboardFocusControlling *keyboardFocusController;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  CCUIMainViewController *viewController;
  CCUIMainViewController *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  SBBarSwipeAffordanceViewController *v27;
  SBBarSwipeAffordanceViewController *homeAffordanceViewController;
  id *p_homeAffordanceViewController;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UIViewController *homeButtonWrapperViewController;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  SBControlCenterController *v41;
  uint64_t v42;
  PTSingleTestRecipe *presentModuleTestRecipe;
  uint64_t v44;
  PTSingleTestRecipe *userInterfaceStyleTestRecipe;
  _QWORD v47[4];
  SBControlCenterController *v48;
  _QWORD v49[4];
  id v50;
  id location;
  objc_super v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)SBControlCenterController;
  v2 = -[SBControlCenterController init](&v52, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__screenDidDim, *MEMORY[0x1E0DAC2F0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__uiRelockedNotification_, CFSTR("SBLockScreenUIRelockedNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__policyAggregatorCapabilitiesDidChange_, CFSTR("SBPolicyAggregatorCapabilitiesChangedNotification"), 0);
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneDeactivationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "newAssertionWithReason:", 2);
    resignActiveAssertion = v2->_resignActiveAssertion;
    v2->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v6;

    v8 = objc_alloc_init(SBControlCenterSystemAgent);
    systemAgent = v2->_systemAgent;
    v2->_systemAgent = v8;

    v10 = objc_alloc_init(SBControlCenterSystemControlsHost);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D145A8]), "initWithSystemHost:", v10);
    systemControlsCoordinator = v2->_systemControlsCoordinator;
    v2->_systemControlsCoordinator = (CCUISystemControlsCoordinator *)v11;

    -[CCUISystemControlsCoordinator beginObservingSystemState](v2->_systemControlsCoordinator, "beginObservingSystemState");
    v13 = objc_alloc_init(SBWindowLevelAssertionManager);
    windowLevelAssertionManager = v2->_windowLevelAssertionManager;
    v2->_windowLevelAssertionManager = v13;

    -[SBWindowLevelAssertionManager setDelegate:](v2->_windowLevelAssertionManager, "setDelegate:", v2);
    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "keyboardFocusController");
    v16 = objc_claimAutoreleasedReturnValue();
    keyboardFocusController = v2->_keyboardFocusController;
    v2->_keyboardFocusController = (SBKeyboardFocusControlling *)v16;

    v18 = SBFIsChamoisWindowingUIAvailable();
    objc_msgSend(MEMORY[0x1E0D14548], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setVisibility:forModuleWithIdentifier:completionHandler:", v18, CFSTR("com.apple.springboard.ContinuousExposeModule"), 0);

    objc_msgSend(MEMORY[0x1E0D14588], "mainViewControllerWithSystemAgent:", v2->_systemAgent);
    v20 = objc_claimAutoreleasedReturnValue();
    viewController = v2->_viewController;
    v2->_viewController = (CCUIMainViewController *)v20;

    -[CCUIMainViewController setDelegate:](v2->_viewController, "setDelegate:", v2);
    objc_initWeak(&location, v2);
    v22 = v2->_viewController;
    objc_opt_self();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __33__SBControlCenterController_init__block_invoke;
    v49[3] = &unk_1E8EAC8B0;
    objc_copyWeak(&v50, &location);
    v26 = (id)-[CCUIMainViewController registerForTraitChanges:withHandler:](v22, "registerForTraitChanges:withHandler:", v24, v49);

    if (SBHomeGestureEnabled())
    {
      v27 = -[SBBarSwipeAffordanceViewController initWithZStackParticipantIdentifier:windowScene:]([SBBarSwipeAffordanceViewController alloc], "initWithZStackParticipantIdentifier:windowScene:", 19, 0);
      p_homeAffordanceViewController = (id *)&v2->_homeAffordanceViewController;
      homeAffordanceViewController = v2->_homeAffordanceViewController;
      v2->_homeAffordanceViewController = v27;

      -[SBBarSwipeAffordanceViewController setPointerClickDelegate:](v2->_homeAffordanceViewController, "setPointerClickDelegate:", v2);
      -[SBBarSwipeAffordanceViewController setDelegate:](v2->_homeAffordanceViewController, "setDelegate:", v2);
      -[SBBarSwipeAffordanceViewController addChildViewController:](v2->_homeAffordanceViewController, "addChildViewController:", v2->_viewController);
      -[CCUIMainViewController didMoveToParentViewController:](v2->_viewController, "didMoveToParentViewController:", v2->_homeAffordanceViewController);
      -[SBBarSwipeAffordanceViewController view](v2->_homeAffordanceViewController, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMainViewController view](v2->_viewController, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addSubview:", v31);

      -[SBBarSwipeAffordanceViewController view](v2->_homeAffordanceViewController, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setDelegate:", v2);

      -[SBBarSwipeAffordanceViewController view](v2->_homeAffordanceViewController, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObserver:", v2);

      -[SBBarSwipeAffordanceViewController view](v2->_homeAffordanceViewController, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setColorBias:", 2);

      -[CCUIMainViewController setHostStatusBarStyleProvider:](v2->_viewController, "setHostStatusBarStyleProvider:", v2);
      -[SBBarSwipeAffordanceViewController setSuppressAffordance:](v2->_homeAffordanceViewController, "setSuppressAffordance:", -[CCUIMainViewController isHomeGestureDismissalAllowed](v2->_viewController, "isHomeGestureDismissalAllowed") ^ 1);
    }
    else
    {
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);
      p_homeAffordanceViewController = (id *)&v2->_homeButtonWrapperViewController;
      homeButtonWrapperViewController = v2->_homeButtonWrapperViewController;
      v2->_homeButtonWrapperViewController = (UIViewController *)v35;

      -[UIViewController addChildViewController:](v2->_homeButtonWrapperViewController, "addChildViewController:", v2->_viewController);
      -[CCUIMainViewController didMoveToParentViewController:](v2->_viewController, "didMoveToParentViewController:", v2->_homeButtonWrapperViewController);
      -[UIViewController view](v2->_homeButtonWrapperViewController, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMainViewController view](v2->_viewController, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addSubview:", v38);

    }
    v39 = *p_homeAffordanceViewController;
    v40 = (void *)MEMORY[0x1E0D830E8];
    v47[0] = v25;
    v47[1] = 3221225472;
    v47[2] = __33__SBControlCenterController_init__block_invoke_2;
    v47[3] = &unk_1E8E9DED8;
    v41 = v2;
    v48 = v41;
    objc_msgSend(v40, "recipeWithTitle:prepareBlock:action:cleanupBlock:", CFSTR("Present Module"), 0, v47, 0);
    v42 = objc_claimAutoreleasedReturnValue();
    presentModuleTestRecipe = v41->_presentModuleTestRecipe;
    v41->_presentModuleTestRecipe = (PTSingleTestRecipe *)v42;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v41->_presentModuleTestRecipe);
    objc_msgSend(MEMORY[0x1E0D830E8], "recipeWithTitle:prepareBlock:action:cleanupBlock:", CFSTR("Appearance Style"), 0, &__block_literal_global_62_0, 0);
    v44 = objc_claimAutoreleasedReturnValue();
    userInterfaceStyleTestRecipe = v41->_userInterfaceStyleTestRecipe;
    v41 = (SBControlCenterController *)((char *)v41 + 224);
    v41->super.isa = (Class)v44;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v41->super.isa);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __33__SBControlCenterController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id WeakRetained;

  objc_msgSend(a2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_backlightLuminance");

  if (v4 != 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "dismissAnimated:", 1);

  }
}

void __33__SBControlCenterController_init__block_invoke_2(uint64_t a1)
{
  SBControlCenterModuleTransientOverlayViewController *v1;
  void *v2;
  void *v3;
  SBControlCenterModuleTransientOverlayViewController *v4;

  objc_msgSend(*(id *)(a1 + 32), "dismissAnimated:", 1);
  v1 = [SBControlCenterModuleTransientOverlayViewController alloc];
  objc_msgSend(MEMORY[0x1E0D14550], "defaultOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBControlCenterModuleTransientOverlayViewController initWithModuleIdentifier:presentationOptions:](v1, "initWithModuleIdentifier:presentationOptions:", CFSTR("com.apple.mediaremote.controlcenter.audio"), v2);

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentTransientOverlayViewController:animated:completion:", v4, 1, 0);

}

void __33__SBControlCenterController_init__block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEABA0], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "toggleCurrentStyle");

}

- (void)dealloc
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBControlCenterController.m"), 309, CFSTR("this should never go away"));

  -[SBControlCenterController _systemGestureManager](self, "_systemGestureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", self->_statusBarPullGestureRecognizer);
  objc_msgSend(v5, "removeGestureRecognizer:", self->_indirectStatusBarPullGestureRecognizer);
  -[SBControlCenterController _coverSheetViewController](self, "_coverSheetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterExternalBehaviorProvider:", self);
  objc_msgSend(v6, "unregisterExternalPresentationProvider:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[UIApplicationSceneDeactivationAssertion relinquish](self->_resignActiveAssertion, "relinquish");
  v8.receiver = self;
  v8.super_class = (Class)SBControlCenterController;
  -[SBControlCenterController dealloc](&v8, sel_dealloc);
}

- (int64_t)indirectPanEffectiveInterfaceOrientation
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation");
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setSuppressSystemApertureForSystemChromeSuppression:", 0);
  objc_msgSend(v5, "setActivationPolicyForParticipantsBelow:", 1);
  -[SBControlCenterController physicalButtonSceneTargets](self, "physicalButtonSceneTargets");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhysicalButtonSceneTargets:", v6);

}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return self->_window;
}

- (BOOL)isPresentedOrDismissing
{
  uint64_t v3;
  BOOL result;

  v3 = -[CCUIMainViewController presentationState](self->_viewController, "presentationState");
  result = -[SBControlCenterController isPresented](self, "isPresented");
  if (v3 == 3)
    return 1;
  return result;
}

- (BOOL)isDismissedOrDismissing
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBControlCenterController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "presentationState"))
  {
    -[SBControlCenterController viewController](self, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "presentationState") == 3;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)allowGestureForContentBelow
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SBControlCenterController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "presentationState"))
  {
    -[SBControlCenterController viewController](self, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "presentationState") == 3)
    {
      -[SBControlCenterController viewController](self, "viewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "transitionState") != 1;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)handleMenuButtonTap
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;

  if (-[SBControlCenterController isPresented](self, "isPresented")
    || -[SBGrabberTongue isVisible](self->_grabberTongue, "isVisible"))
  {
    -[SBControlCenterController viewController](self, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canDismissPresentedContent");

    if (v4)
    {
      -[SBControlCenterController viewController](self, "viewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dismissPresentedContent");

      return 1;
    }
    else
    {
      v6 = 1;
      -[SBControlCenterController dismissAnimated:](self, "dismissAnimated:", 1);
    }
  }
  else
  {
    if (-[SBControlCenterController isPresentedOrDismissing](self, "isPresentedOrDismissing"))
      -[SBControlCenterController dismissAnimated:](self, "dismissAnimated:", 1);
    return 0;
  }
  return v6;
}

- (BOOL)handleIndirectStatusBarAction
{
  _BOOL4 v3;

  v3 = -[SBControlCenterController _shouldAllowControlCenterGesture](self, "_shouldAllowControlCenterGesture");
  if (v3)
    -[SBControlCenterController presentAnimated:completion:](self, "presentAnimated:completion:", 1, 0);
  return v3;
}

- (void)presentAnimated:(BOOL)a3
{
  -[SBControlCenterController presentAnimated:completion:](self, "presentAnimated:completion:", a3, 0);
}

- (void)dismissAnimated:(BOOL)a3
{
  -[SBControlCenterController dismissAnimated:completion:](self, "dismissAnimated:completion:", a3, 0);
}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBControlCenterController _disableReachability](self, "_disableReachability");
  -[SBControlCenterController viewController](self, "viewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentAnimated:withCompletionHandler:", v4, v6);

}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  uint64_t v7;
  void *v8;
  double v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD *v16;
  _QWORD v17[3];
  char v18;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[SBControlCenterController isPresentedOrDismissing](self, "isPresentedOrDismissing"))
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v7 = MEMORY[0x1E0C809B0];
    v18 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__SBControlCenterController_dismissAnimated_completion___block_invoke;
    v14[3] = &unk_1E8EA8CD0;
    v16 = v17;
    v15 = v6;
    v8 = (void *)MEMORY[0x1D17E5550](v14);
    -[CCUIMainViewController dismissAnimated:withCompletionHandler:](self->_viewController, "dismissAnimated:withCompletionHandler:", v4, v8);
    objc_msgSend(MEMORY[0x1E0D01908], "globalSlowDownFactor");
    v10 = dispatch_time(0, (uint64_t)(v9 * 450000000.0));
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __56__SBControlCenterController_dismissAnimated_completion___block_invoke_2;
    block[3] = &unk_1E8E9E8D0;
    v13 = v8;
    v11 = v8;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    if (-[SBGrabberTongue isVisible](self->_grabberTongue, "isVisible"))
      -[SBGrabberTongue dismissWithStyle:animated:](self->_grabberTongue, "dismissWithStyle:animated:", 0, v4);
    if (v6)
      v6[2](v6);
  }

}

uint64_t __56__SBControlCenterController_dismissAnimated_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __56__SBControlCenterController_dismissAnimated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSensorActivityDataProvider:(id)a3
{
  SBFSensorActivityDataProvider **p_sensorActivityDataProvider;
  id v5;

  p_sensorActivityDataProvider = &self->_sensorActivityDataProvider;
  v5 = a3;
  objc_storeWeak((id *)p_sensorActivityDataProvider, v5);
  objc_msgSend(v5, "addObserver:", self);
  -[SBControlCenterController activityDidChangeForSensorActivityDataProvider:](self, "activityDidChangeForSensorActivityDataProvider:", v5);

}

- (void)windowSceneDidConnect:(id)a3
{
  id v4;

  -[SBControlCenterController _updateWindowForScene:](self, "_updateWindowForScene:", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBControlCenterControllerWindowSceneDidConnect"), self);

}

- (void)_requirePresentGestureRecognizerToFailForGestureRecognizer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requireGestureRecognizerToFail:", v4);

  if (self->_statusBarPullGestureRecognizer)
    objc_msgSend(v5, "requireGestureRecognizerToFail:");

}

- (void)_requireGestureRecognizerToFailForPresentGestureRecognizer:(id)a3
{
  void *v4;
  UIPanGestureRecognizer *statusBarPullGestureRecognizer;
  id v6;

  v6 = a3;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requireGestureRecognizerToFail:", v6);

  statusBarPullGestureRecognizer = self->_statusBarPullGestureRecognizer;
  if (statusBarPullGestureRecognizer)
    -[UIPanGestureRecognizer requireGestureRecognizerToFail:](statusBarPullGestureRecognizer, "requireGestureRecognizerToFail:", v6);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  SBIndirectPanGestureRecognizer *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  const __CFString *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  void *v26;
  SBIndirectPanGestureRecognizer *v27;
  _QWORD v29[4];
  SBIndirectPanGestureRecognizer *v30;
  __CFString *v31;
  BOOL v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (SBIndirectPanGestureRecognizer *)a3;
  objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTouchDownOriginatedWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && v6
    && (-[SBControlCenterWindow windowScene](self->_window, "windowScene"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v6),
        v7,
        (v8 & 1) == 0))
  {
    SBLogSystemGestureControlCenter();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SBIndirectPanGestureRecognizer name](v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v13;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Not allowing %@ to begin because it was started from another display", buf, 0xCu);

    }
    v10 = 0;
    v9 = CFSTR("NotForCurrentDisplay");
  }
  else if ((SBIndirectPanGestureRecognizer *)self->_statusBarPullGestureRecognizer == v4
         || self->_indirectStatusBarPullGestureRecognizer == v4)
  {
    if (-[SBControlCenterController _shouldAllowControlCenterGesture](self, "_shouldAllowControlCenterGesture"))
    {
      v9 = 0;
      v11 = 1;
    }
    else
    {
      SBLogSystemGestureControlCenter();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Not allowing the status bar pull down gesture to begin because the Control Center gesture isn't allowed at all.", buf, 2u);
      }

      v11 = 0;
      v9 = CFSTR("ControlCenterNotAllowed");
    }
    if (-[SBControlCenterController _shouldShowGrabberOnFirstSwipe](self, "_shouldShowGrabberOnFirstSwipe")
      && self->_indirectStatusBarPullGestureRecognizer != v4)
    {
      SBLogSystemGestureControlCenter();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Not allowing the status bar pull down gesture to begin because we require a grabber on first swipe.", buf, 2u);
      }

      v11 = 0;
      v9 = CFSTR("StatusBarGestureNotAllowedBecauseGrabberRequired");
    }
    -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "state") == 1 || objc_msgSend(v16, "state") == 2 || objc_msgSend(v16, "state") == 3)
    {
      SBLogSystemGestureControlCenter();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Not allowing the status bar pull down gesture to begin because the screen edge gesture's state is active.", buf, 2u);
      }

      v11 = 0;
      v9 = CFSTR("StatusBarGestureNotAllowedBecauseEdgeGestureIsActive");
    }
    if ((SBIndirectPanGestureRecognizer *)self->_statusBarPullGestureRecognizer == v4)
    {
      -[SBControlCenterController viewController](self, "viewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIndirectPanGestureRecognizer velocityInView:](v4, "velocityInView:", v19);
      v21 = v20;
      v23 = v22;

      if (v23 < 0.0 || fabs(v21) > fabs(v23))
      {
        SBLogSystemGestureControlCenter();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Preventing the status bar pull down gesture because we're moving up or horizontally.", buf, 2u);
        }

        v11 = 0;
        v9 = CFSTR("StatusBarGestureNotAllowedBecauseMovingUpOrHorizontally");
      }
    }
    if (self->_indirectStatusBarPullGestureRecognizer == v4)
    {
      -[SBControlCenterController viewForSystemGestureRecognizer:](self, "viewForSystemGestureRecognizer:", v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIndirectPanGestureRecognizer locationInView:](v4, "locationInView:", v25);
      if (!-[SBControlCenterController _isLocationXWithinExtendedTrailingStatusBarRegion:](self, "_isLocationXWithinExtendedTrailingStatusBarRegion:"))
      {
        v9 = CFSTR("StatusBarGestureNotAllowedBecausePointerIsNotInTheTrailingStatusBarRegion");
        v11 = 0;
      }

    }
    v10 = v11 != 0;
  }
  else
  {
    v9 = 0;
    v10 = 1;
  }
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __58__SBControlCenterController_gestureRecognizerShouldBegin___block_invoke;
  v29[3] = &unk_1E8EAEAA0;
  v32 = v10;
  v30 = v4;
  v31 = (__CFString *)v9;
  v27 = v4;
  objc_msgSend(v26, "logBlock:", v29);

  return v10;
}

id __58__SBControlCenterController_gestureRecognizerShouldBegin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("[SBControlCenterController gestureRecognizerShouldBegin:]");
  v11[0] = CFSTR("shouldBegin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8EC7EC0;
  if (v4)
    v7 = (const __CFString *)v4;
  else
    v7 = &stru_1E8EC7EC0;
  v11[3] = CFSTR("failureReason");
  if (*(_QWORD *)(a1 + 40))
    v6 = *(const __CFString **)(a1 + 40);
  v12[2] = v7;
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __66__SBControlCenterController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[8];
  _QWORD v27[8];
  const __CFString *v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  v28 = CFSTR("[SBControlCenterController gestureRecognizer:shouldReceiveTouch:]");
  v26[0] = CFSTR("shouldReceiveTouch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 96));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  v26[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v2;
  v3 = &stru_1E8EC7EC0;
  if (v2)
    v3 = (const __CFString *)v2;
  v27[2] = v3;
  v26[3] = CFSTR("location");
  v24[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = CFSTR("y");
  v25[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v16;
  v26[4] = CFSTR("statusBarBounds");
  v22[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  v22[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  v22[2] = CFSTR("width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v6;
  v22[3] = CFSTR("height");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v8;
  v26[5] = CFSTR("reachabilityOffset");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "_reachabilityOffset");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v10;
  v26[6] = CFSTR("insideStatusBarBounds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 97));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v11;
  v26[7] = CFSTR("inCorrectStatusBarRegion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 98));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)handleReachabilityModeActivated
{
  void *v3;
  UIPanGestureRecognizer *statusBarPullGestureRecognizer;
  id v5;

  -[SBControlCenterController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReachabilityActive:", 1);

  statusBarPullGestureRecognizer = self->_statusBarPullGestureRecognizer;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer requireGestureRecognizerToFail:](statusBarPullGestureRecognizer, "requireGestureRecognizerToFail:", v5);

}

- (void)handleReachabilityModeDeactivated
{
  void *v3;
  UIPanGestureRecognizer *statusBarPullGestureRecognizer;
  id v5;

  -[SBControlCenterController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReachabilityActive:", 0);

  statusBarPullGestureRecognizer = self->_statusBarPullGestureRecognizer;
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer removeFailureRequirement:](statusBarPullGestureRecognizer, "removeFailureRequirement:", v5);

}

- (void)handleReachabilityYOffsetDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBControlCenterController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[SBControlCenterController viewController](self, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)handleDidEndReachabilityAnimation
{
  id v2;

  -[SBControlCenterController viewController](self, "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reachabilityAnimationDidEnd");

}

- (void)_disableReachability
{
  id v2;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deactivateReachability");

}

- (void)_handleStatusBarPullDownGesture:(id)a3
{
  SBIndirectPanGestureRecognizer *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  SBIndirectPanGestureRecognizer *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _QWORD v42[11];
  uint8_t buf[16];

  v4 = (SBIndirectPanGestureRecognizer *)a3;
  -[SBControlCenterController viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer locationInView:](v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[SBControlCenterController viewController](self, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer translationInView:](v4, "translationInView:", v12);
  v14 = v13;
  v16 = v15;

  -[SBControlCenterController viewController](self, "viewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer velocityInView:](v4, "velocityInView:", v18);
  v20 = v19;
  v22 = v21;

  if (-[SBControlCenterController isDismissedOrDismissing](self, "isDismissedOrDismissing"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v4;
      -[SBControlCenterController viewController](self, "viewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIndirectPanGestureRecognizer setTranslation:inView:](v23, "setTranslation:inView:", v25, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    }
    -[SBControlCenterController _reachabilityOffset](self, "_reachabilityOffset");
    if (v10 >= v26)
    {
      if ((SBIndirectPanGestureRecognizer *)self->_statusBarPullGestureRecognizer == v4)
      {
        -[SBControlCenterController viewController](self, "viewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBControlCenterController _touchesForGesture:](self, "_touchesForGesture:", v4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "beginPresentationWithLocation:translation:velocity:touches:", v30, v8, v10, v14, v16, v20, v22);

      }
      else if (self->_indirectStatusBarPullGestureRecognizer == v4
             && !self->_indirectStatusBarPullGestureCalledBegin
             && v16 != 0.0)
      {
        -[SBControlCenterController viewController](self, "viewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBControlCenterController _touchesForGesture:](self, "_touchesForGesture:", v4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "beginPresentationWithLocation:translation:velocity:touches:", v28, v8, v10, v14, v16, v20, v22);

        self->_indirectStatusBarPullGestureCalledBegin = 1;
      }
    }
  }
  if (-[SBIndirectPanGestureRecognizer state](v4, "state") == 1)
  {
    -[SBControlCenterController restrictSystemApertureToType:withReason:](self, "restrictSystemApertureToType:withReason:", 1, CFSTR("Control Center Presentation Began"));
  }
  else if (-[SBIndirectPanGestureRecognizer state](v4, "state") == 3
         || -[SBIndirectPanGestureRecognizer state](v4, "state") == 4
         || -[SBIndirectPanGestureRecognizer state](v4, "state") == 5)
  {
    if (-[SBControlCenterController isPresented](self, "isPresented"))
      -[SBControlCenterController restrictSystemApertureToType:withReason:](self, "restrictSystemApertureToType:withReason:", 0, CFSTR("Control Center Presented"));
    -[SBControlCenterController invalidateSystemApertureAssertionForType:withReason:](self, "invalidateSystemApertureAssertionForType:withReason:", 1, CFSTR("Control Center Presentation Ended"));
  }
  -[SBControlCenterController viewController](self, "viewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "presentationState");

  if (v32)
  {
    switch(-[SBIndirectPanGestureRecognizer state](v4, "state"))
    {
      case 1:
        SBLogTelemetrySignposts();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D0540000, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
        }

        kdebug_trace();
        self->_presentationGestureContinuedIntoPaging = 0;
        break;
      case 2:
        if ((SBIndirectPanGestureRecognizer *)self->_statusBarPullGestureRecognizer == v4
          || self->_indirectStatusBarPullGestureRecognizer == v4 && self->_indirectStatusBarPullGestureCalledBegin)
        {
          -[SBControlCenterController viewController](self, "viewController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "updatePresentationWithLocation:translation:velocity:", v8, v10, v14, v16, v20, v22);

        }
        break;
      case 3:
        goto LABEL_29;
      case 4:
        if (self->_presentationGestureContinuedIntoPaging)
        {
LABEL_29:
          *(_WORD *)&self->_indirectStatusBarPullGestureCalledBegin = 0;
          v35 = fabs(v22 * 0.03);
          if (self->_indirectStatusBarPullGestureRecognizer != v4)
            v35 = -0.0;
          v36 = v16 + v35;
          -[SBControlCenterController viewController](self, "viewController");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "endPresentationWithLocation:translation:velocity:", v8, v10, v14, v36, v20, v22);

          if (-[SBControlCenterController isPresented](self, "isPresented"))
            -[SBControlCenterController _disableReachability](self, "_disableReachability");
          SBLogTelemetrySignposts();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v38))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D0540000, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
          }

          kdebug_trace();
          objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __61__SBControlCenterController__handleStatusBarPullDownGesture___block_invoke;
          v42[3] = &unk_1E8EAEAF0;
          *(double *)&v42[5] = v8;
          *(double *)&v42[6] = v10;
          *(double *)&v42[7] = v14;
          *(double *)&v42[8] = v36;
          *(double *)&v42[9] = v20;
          *(double *)&v42[10] = v22;
          v42[4] = self;
          objc_msgSend(v39, "logBlock:", v42);

        }
        else
        {
          self->_indirectStatusBarPullGestureCalledBegin = 0;
          -[SBControlCenterController viewController](self, "viewController");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "cancelPresentationWithLocation:translation:velocity:", v8, v10, v14, v16, v20, v22);

          if (-[SBControlCenterController isPresented](self, "isPresented"))
            -[SBControlCenterController _disableReachability](self, "_disableReachability");
          SBLogTelemetrySignposts();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v41))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D0540000, v41, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
          }

          kdebug_trace();
        }
        break;
      case 5:
        *(_WORD *)&self->_indirectStatusBarPullGestureCalledBegin = 0;
        break;
      default:
        break;
    }
  }

}

id __61__SBControlCenterController__handleStatusBarPullDownGesture___block_invoke(uint64_t a1)
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
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[4];
  const __CFString *v23;
  _QWORD v24[3];

  v24[1] = *MEMORY[0x1E0C80C00];
  v23 = CFSTR("[SBControlCenterController _handleStatusBarPullDownGesture:]");
  v21[0] = CFSTR("location");
  v19[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("y");
  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v21[1] = CFSTR("translation");
  v17[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("y");
  v18[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v4;
  v21[2] = CFSTR("velocity");
  v15[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("y");
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  v21[3] = CFSTR("presented");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isPresented"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutAssertion;
  id v5;
  double v6;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  void *v11;

  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (!displayLayoutAssertion)
    {
      v5 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v11 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x1E0D22C70]);
      -[SBControlCenterWindow level](self->_window, "level");
      objc_msgSend(v11, "setLevel:", (uint64_t)v6);
      objc_msgSend(v11, "setFillsDisplayBounds:", 1);
      objc_msgSend(v11, "setLayoutRole:", 4);
      objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addElement:", v11);
      v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_displayLayoutAssertion;
      self->_displayLayoutAssertion = v8;

    }
  }
  else if (displayLayoutAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutAssertion, "invalidate");
    v10 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;

  }
}

- (BOOL)grabberTongue:(id)a3 shouldAllowSecondSwipeWithEdgeLocation:(double)a4
{
  id v6;
  char v7;

  v6 = a3;
  if (-[SBControlCenterController presentingEdge](self, "presentingEdge") == 1)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "isEdgeLocationInGrabberRegion:", a4);

  return v7;
}

- (BOOL)grabberTongueHonorsAmbiguousActivationMargin:(id)a3
{
  return -[SBControlCenterController presentingEdge](self, "presentingEdge", a3) == 4;
}

id __62__SBControlCenterController_grabberTongue_shouldReceiveTouch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[4];
  _QWORD v19[4];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v20 = CFSTR("[SBControlCenterController grabberTongue:shouldReceiveTouch:]");
  v18[0] = CFSTR("shouldReceiveTouch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v18[1] = CFSTR("address");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "edgePullGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedLong:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "edgePullGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E8EC7EC0;
  if (v7)
    v9 = (const __CFString *)v7;
  v19[2] = v9;
  v18[3] = CFSTR("location");
  v16[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("y");
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)grabberTongueWillPresent:(id)a3
{
  -[SBControlCenterController _updateWindowOrientation](self, "_updateWindowOrientation", a3);
  -[SBControlCenterController _updateWindowVisibility](self, "_updateWindowVisibility");
}

- (void)grabberTongueBeganPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint8_t v25[16];

  v8 = a6;
  v9 = a3;
  SBLogTelemetrySignposts();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", v25, 2u);
  }

  kdebug_trace();
  self->_presentationGestureContinuedIntoPaging = 0;
  -[SBControlCenterController _disableReachability](self, "_disableReachability");
  -[SBControlCenterController restrictSystemApertureToType:withReason:](self, "restrictSystemApertureToType:withReason:", 1, CFSTR("Control Center Presentation Began"));
  objc_msgSend(v9, "dismissWithStyle:animated:", 0, 1);

  -[SBControlCenterController viewController](self, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlCenterController _presentGestureLocationInView](self, "_presentGestureLocationInView");
  v13 = v12;
  v15 = v14;
  -[SBControlCenterController _presentGestureTranslationInView:](self, "_presentGestureTranslationInView:", 1);
  v17 = v16;
  v19 = v18;
  -[SBControlCenterController _presentGestureVelocityInView](self, "_presentGestureVelocityInView");
  v21 = v20;
  v23 = v22;
  -[SBControlCenterController _touchesForGesture:](self, "_touchesForGesture:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "beginPresentationWithLocation:translation:velocity:touches:", v24, v13, v15, v17, v19, v21, v23);
}

- (void)grabberTongueUpdatedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  -[SBControlCenterController viewController](self, "viewController", a3, a6, a4, a5);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[SBControlCenterController _presentGestureLocationInView](self, "_presentGestureLocationInView");
  v8 = v7;
  v10 = v9;
  -[SBControlCenterController _presentGestureTranslationInView:](self, "_presentGestureTranslationInView:", 0);
  v12 = v11;
  v14 = v13;
  -[SBControlCenterController _presentGestureVelocityInView](self, "_presentGestureVelocityInView");
  objc_msgSend(v17, "updatePresentationWithLocation:translation:velocity:", v8, v10, v12, v14, v15, v16);

}

- (void)grabberTongueEndedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[11];
  uint8_t buf[16];

  self->_presentationGestureContinuedIntoPaging = 0;
  -[SBControlCenterController _presentGestureLocationInView](self, "_presentGestureLocationInView", a3, a6, a4, a5);
  v8 = v7;
  v10 = v9;
  -[SBControlCenterController _presentGestureTranslationInView:](self, "_presentGestureTranslationInView:", 0);
  v12 = v11;
  v14 = v13;
  -[SBControlCenterController _presentGestureVelocityInView](self, "_presentGestureVelocityInView");
  v16 = v15;
  v18 = v17;
  -[SBControlCenterController viewController](self, "viewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "endPresentationWithLocation:translation:velocity:", v8, v10, v12, v14, v16, v18);

  if (-[SBControlCenterController isPresented](self, "isPresented"))
    -[SBControlCenterController _disableReachability](self, "_disableReachability");
  if (-[SBControlCenterController isPresented](self, "isPresented"))
    -[SBControlCenterController restrictSystemApertureToType:withReason:](self, "restrictSystemApertureToType:withReason:", 0, CFSTR("Control Center Presented"));
  -[SBControlCenterController invalidateSystemApertureAssertionForType:withReason:](self, "invalidateSystemApertureAssertionForType:withReason:", 1, CFSTR("Control Center Presentation Ended"));
  SBLogTelemetrySignposts();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__SBControlCenterController_grabberTongueEndedPulling_withDistance_andVelocity_andGesture___block_invoke;
  v22[3] = &unk_1E8EAEAF0;
  *(double *)&v22[5] = v8;
  *(double *)&v22[6] = v10;
  *(double *)&v22[7] = v12;
  *(double *)&v22[8] = v14;
  *(double *)&v22[9] = v16;
  *(double *)&v22[10] = v18;
  v22[4] = self;
  objc_msgSend(v21, "logBlock:", v22);

}

id __91__SBControlCenterController_grabberTongueEndedPulling_withDistance_andVelocity_andGesture___block_invoke(uint64_t a1)
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
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[4];
  const __CFString *v23;
  _QWORD v24[3];

  v24[1] = *MEMORY[0x1E0C80C00];
  v23 = CFSTR("[SBControlCenterController grabberTongueEndedPulling:withDistance:andVelocity:]");
  v21[0] = CFSTR("location");
  v19[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("y");
  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v21[1] = CFSTR("translation");
  v17[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("y");
  v18[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v4;
  v21[2] = CFSTR("velocity");
  v15[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("y");
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  v21[3] = CFSTR("presented");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isPresented"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)grabberTongueCanceledPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  uint8_t v19[16];

  if (self->_presentationGestureContinuedIntoPaging)
  {
    -[SBControlCenterController grabberTongueEndedPulling:withDistance:andVelocity:andGesture:](self, "grabberTongueEndedPulling:withDistance:andVelocity:andGesture:", a3, a6, a4, a5);
  }
  else
  {
    -[SBControlCenterController _disableReachability](self, "_disableReachability", a3, a6, a4, a5);
    -[SBControlCenterController viewController](self, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBControlCenterController _presentGestureLocationInView](self, "_presentGestureLocationInView");
    v9 = v8;
    v11 = v10;
    -[SBControlCenterController _presentGestureTranslationInView:](self, "_presentGestureTranslationInView:", 0);
    v13 = v12;
    v15 = v14;
    -[SBControlCenterController _presentGestureVelocityInView](self, "_presentGestureVelocityInView");
    objc_msgSend(v7, "cancelPresentationWithLocation:translation:velocity:", v9, v11, v13, v15, v16, v17);

    if (-[SBControlCenterController isPresented](self, "isPresented"))
      -[SBControlCenterController restrictSystemApertureToType:withReason:](self, "restrictSystemApertureToType:withReason:", 0, CFSTR("Control Center Presented"));
    -[SBControlCenterController invalidateSystemApertureAssertionForType:withReason:](self, "invalidateSystemApertureAssertionForType:withReason:", 1, CFSTR("Control Center Presentation Ended"));
    SBLogTelemetrySignposts();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CONTROL_CENTER_GESTURE", " enableTelemetry=YES  isAnimation=YES ", v19, 2u);
    }

    kdebug_trace();
  }
}

- (id)customGestureRecognizerForGrabberTongue:(id)a3
{
  unint64_t v3;
  uint64_t v4;
  SBScreenEdgePanGestureRecognizer *v5;

  v3 = -[SBControlCenterController presentingEdge](self, "presentingEdge", a3);
  if (v3 == 4)
    v4 = 2;
  else
    v4 = 6;
  v5 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:type:options:]([SBScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:type:options:", 0, 0, v4, 0);
  -[UIScreenEdgePanGestureRecognizer setEdges:](v5, "setEdges:", v3);
  -[SBScreenEdgePanGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &unk_1E91CE920);
  return v5;
}

- (void)controlCenterViewController:(id)a3 wantsHostStatusBarHidden:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BSSimpleAssertion *hideStatusBarAssertion;
  void *v8;
  void *v9;
  void *v10;
  BSSimpleAssertion *v11;
  BSSimpleAssertion *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  hideStatusBarAssertion = self->_hideStatusBarAssertion;
  if (v4)
  {
    if (!hideStatusBarAssertion)
    {
      v13 = v6;
      -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "statusBarManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "assertionManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "acquireHideFrontmostStatusBarAssertionForReason:", CFSTR("Control Center Transitioning"));
      v11 = (BSSimpleAssertion *)objc_claimAutoreleasedReturnValue();
      v12 = self->_hideStatusBarAssertion;
      self->_hideStatusBarAssertion = v11;

LABEL_6:
      v6 = v13;
    }
  }
  else if (hideStatusBarAssertion)
  {
    v13 = v6;
    -[BSSimpleAssertion invalidate](hideStatusBarAssertion, "invalidate");
    v8 = self->_hideStatusBarAssertion;
    self->_hideStatusBarAssertion = 0;
    goto LABEL_6;
  }

}

- (id)reachabilitySpringAnimationBehaviorForControlCenterViewController:(id)a3
{
  void *v3;
  void *v4;

  +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)controlCenterViewController:(id)a3 didChangePresentationState:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  SBControlCenterController *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  SBControlCenterController *v18;

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      -[SBControlCenterController _didEndTransition](self, "_didEndTransition");
      -[SBControlCenterController _didDismiss](self, "_didDismiss");
      break;
    case 1uLL:
      -[SBControlCenterController _willBeginTransition](self, "_willBeginTransition");
      -[SBControlCenterController _willPresent](self, "_willPresent");
      -[SBControlCenterController _updateWindowVisibility](self, "_updateWindowVisibility");
      break;
    case 2uLL:
      -[SBControlCenterController _didEndTransition](self, "_didEndTransition");
      -[SBControlCenterController _didPresent](self, "_didPresent");
      v7 = (void *)MEMORY[0x1E0CEABB0];
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __84__SBControlCenterController_controlCenterViewController_didChangePresentationState___block_invoke;
      v17 = &unk_1E8E9DED8;
      v18 = self;
      v8 = &v14;
      goto LABEL_6;
    case 3uLL:
      -[SBControlCenterController _willDismiss](self, "_willDismiss");
      -[SBControlCenterController _updateWindowVisibility](self, "_updateWindowVisibility");
      v7 = (void *)MEMORY[0x1E0CEABB0];
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __84__SBControlCenterController_controlCenterViewController_didChangePresentationState___block_invoke_2;
      v12 = &unk_1E8E9DED8;
      v13 = self;
      v8 = &v9;
LABEL_6:
      objc_msgSend(v7, "animateWithDuration:animations:", v8, 0.35, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
      break;
    default:
      break;
  }
  -[SBControlCenterController _updateWindowContentHitTesting](self, "_updateWindowContentHitTesting");

}

uint64_t __84__SBControlCenterController_controlCenterViewController_didChangePresentationState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStatusBarHidden:", 1);
}

uint64_t __84__SBControlCenterController_controlCenterViewController_didChangePresentationState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStatusBarHidden:", 0);
}

- (void)controlCenterViewController:(id)a3 significantPresentationProgressChange:(double)a4
{
  SBBarSwipeAffordanceViewController *v5;
  uint64_t v6;
  void *v7;
  SBAsynchronousRenderingAssertion *asynchronousRenderingAssertion;
  void *v9;
  void *v10;
  SBFZStackParticipant *v11;
  SBFZStackParticipant *zStackParticipant;
  SBFZStackParticipant *v13;
  SBFZStackParticipant *v14;
  id v15;

  v15 = a3;
  v5 = self->_homeAffordanceViewController;
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) != 0)
  {
    if (v5)
    {
      v6 = 1;
LABEL_9:
      -[SBBarSwipeAffordanceViewController setWantsToBeActiveAffordance:](v5, "setWantsToBeActiveAffordance:", v6);
      goto LABEL_10;
    }
    if (!self->_zStackParticipant)
    {
      -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zStackResolver");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "acquireParticipantWithIdentifier:delegate:", 19, self);
      v11 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
      zStackParticipant = self->_zStackParticipant;
      self->_zStackParticipant = v11;

      -[SBControlCenterController zStackParticipantDidChange:](self, "zStackParticipantDidChange:", self->_zStackParticipant);
    }
  }
  else
  {
    if ((BSFloatIsZero() & 1) == 0 && v5)
    {
      -[SBBarSwipeAffordanceViewController view](v5, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isTrackingHomeGestureOfType:", 1);

      goto LABEL_9;
    }
    if (v5)
    {
      v6 = 0;
      goto LABEL_9;
    }
    v13 = self->_zStackParticipant;
    if (v13)
    {
      -[SBFZStackParticipant invalidate](v13, "invalidate");
      v14 = self->_zStackParticipant;
      self->_zStackParticipant = 0;

    }
  }
LABEL_10:
  if (self->_asynchronousRenderingAssertion
    && BSFloatIsZero()
    && objc_msgSend(v15, "transitionState") == 2
    && objc_msgSend(v15, "presentationState") == 3)
  {
    -[BSSimpleAssertion invalidate](self->_asynchronousRenderingAssertion, "invalidate");
    asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
    self->_asynchronousRenderingAssertion = 0;

  }
  -[SBControlCenterController _updateWindowContentHitTesting](self, "_updateWindowContentHitTesting");

}

- (void)controlCenterViewControllerWillContinuePresentationIntoPaging:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogSystemGestureControlCenter();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Control Center will continue presentation gesture into paging", v5, 2u);
  }

  self->_presentationGestureContinuedIntoPaging = 1;
}

- (void)controlCenterViewController:(id)a3 didUpdateHomeGestureDismissalAllowed:(BOOL)a4
{
  -[SBBarSwipeAffordanceViewController setSuppressAffordance:](self->_homeAffordanceViewController, "setSuppressAffordance:", !a4);
}

- (void)willOpenExpandedModuleForControlCenterViewController:(id)a3
{
  id v3;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReachabilityTemporarilyDisabled:forReason:", 1, CFSTR("Control Center Module"));

}

- (void)didCloseExpandedModuleForControlCenterViewController:(id)a3
{
  id v3;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReachabilityTemporarilyDisabled:forReason:", 0, CFSTR("Control Center Module"));

}

- (void)didRequestPowerDownTransientOverlayForControlCenterViewController:(id)a3
{
  id v3;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentPowerDownTransientOverlay");

}

- (void)_willBeginTransition
{
  void *v3;
  BSInvalidatable *v4;
  BSInvalidatable *idleTimerDisableAssertion;
  BSInvalidatable *bannerSuppressionAssertion;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  id v9;

  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acquireIdleTimerDisableAssertionForReason:", CFSTR("Control Center Transitioning"));
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  self->_idleTimerDisableAssertion = v4;

  bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
  if (bannerSuppressionAssertion)
    -[BSInvalidatable invalidate](bannerSuppressionAssertion, "invalidate");
  objc_msgSend((id)SBApp, "bannerManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "acquireBannerSuppressionAssertionForReason:", CFSTR("Control Center Transitioning"));
  v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  v8 = self->_bannerSuppressionAssertion;
  self->_bannerSuppressionAssertion = v7;

}

- (void)_didEndTransition
{
  BSInvalidatable *idleTimerDisableAssertion;
  BSInvalidatable *bannerSuppressionAssertion;

  -[BSInvalidatable invalidate](self->_idleTimerDisableAssertion, "invalidate");
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  self->_idleTimerDisableAssertion = 0;

  -[BSInvalidatable invalidate](self->_bannerSuppressionAssertion, "invalidate");
  bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
  self->_bannerSuppressionAssertion = 0;

}

- (void)_willPresent
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "SBControlCenterController had to enable UIView animations because they were disabled", v1, 2u);
}

uint64_t __41__SBControlCenterController__willPresent__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "controlCenterWillPresent");
}

- (void)_didPresent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  SBMedusaHostedKeyboardWindowLevelAssertion *v11;
  SBMedusaHostedKeyboardWindowLevelAssertion *medusaHostedKeyboardWindowLevelAssertion;
  void *v13;
  id v14;

  -[SBControlCenterController _updateWindowVisibility](self, "_updateWindowVisibility");
  -[SBControlCenterController _coverSheetViewController](self, "_coverSheetViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "externalBehaviorProviderBehaviorChanged:", self);
  objc_msgSend(v14, "externalPresentationProviderPresentationChanged:", self);
  -[SBControlCenterController idleTimerCoordinator](self, "idleTimerCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlCenterController coordinatorRequestedIdleTimerBehavior:](self, "coordinatorRequestedIdleTimerBehavior:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "idleTimerProvider:didProposeBehavior:forReason:", self, v4, CFSTR("Control Center Visible"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBControlCenterControllerDidPresentNotification"), self);

  -[SBFWindow makeKeyWindow](self->_window, "makeKeyWindow");
  if (!self->_medusaHostedKeyboardWindowLevelAssertion)
  {
    -[SBControlCenterWindow rootViewController](self->_window, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sbWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "medusaHostedKeyboardWindowController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBControlCenterWindow windowLevel](self->_window, "windowLevel");
    v11 = (SBMedusaHostedKeyboardWindowLevelAssertion *)objc_msgSend(v9, "newMedusaHostedKeyboardWindowLevelAssertionWithPriority:windowLevel:", 3, v10 + 1.0);
    medusaHostedKeyboardWindowLevelAssertion = self->_medusaHostedKeyboardWindowLevelAssertion;
    self->_medusaHostedKeyboardWindowLevelAssertion = v11;

  }
  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emitEvent:", 47);

}

- (void)_willDismiss
{
  void *v3;
  BSInvalidatable *keyboardFocusLockAssertion;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBControlCenterControllerWillDismissNotification"), self);

  -[BSInvalidatable invalidate](self->_keyboardFocusLockAssertion, "invalidate");
  keyboardFocusLockAssertion = self->_keyboardFocusLockAssertion;
  self->_keyboardFocusLockAssertion = 0;

  -[SBControlCenterController invalidateSystemApertureAssertionForType:withReason:](self, "invalidateSystemApertureAssertionForType:withReason:", 0, CFSTR("Control Center Dismissed"));
  -[SBControlCenterController invalidateSystemApertureAssertionForType:withReason:](self, "invalidateSystemApertureAssertionForType:withReason:", 1, CFSTR("Control Center Dismissed"));
}

- (void)_didDismiss
{
  BSInvalidatable *deferOrientationUpdatesAssertion;
  SBAsynchronousRenderingAssertion *asynchronousRenderingAssertion;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  SBMedusaHostedKeyboardWindowLevelAssertion *medusaHostedKeyboardWindowLevelAssertion;
  void *v13;
  id v14;

  if (self->_keyboardFocusLockAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBControlCenterController.m"), 1133, CFSTR("skipped _willDismiss"));

  }
  -[SBControlCenterController _clearInactiveMicModeSelectionSensorActivityData](self, "_clearInactiveMicModeSelectionSensorActivityData");
  -[BSInvalidatable invalidate](self->_deferOrientationUpdatesAssertion, "invalidate");
  deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
  self->_deferOrientationUpdatesAssertion = 0;

  -[BSSimpleAssertion invalidate](self->_asynchronousRenderingAssertion, "invalidate");
  asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
  self->_asynchronousRenderingAssertion = 0;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReachabilityTemporarilyDisabled:forReason:", 0, CFSTR("Landscape Control Center"));

  -[SBControlCenterController _enumerateObservers:](self, "_enumerateObservers:", &__block_literal_global_158);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBControlCenterControllerDidDismissNotification"), self);

  -[UIApplicationSceneDeactivationAssertion relinquish](self->_resignActiveAssertion, "relinquish");
  -[SBControlCenterController _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", 0);
  -[SBControlCenterController _lockScreenManager](self, "_lockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUILocked");

  if (v8)
    BKSHIDServicesAmbientLightSensorDisableAutoBrightness();
  -[SBControlCenterWindow rootViewController](self->_window, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_beginAppearanceTransition:animated:", 0, 0);

  -[SBControlCenterWindow rootViewController](self->_window, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endAppearanceTransition");

  -[SBControlCenterController _updateWindowVisibility](self, "_updateWindowVisibility");
  -[SBControlCenterController _coverSheetViewController](self, "_coverSheetViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "externalBehaviorProviderBehaviorChanged:", self);
  objc_msgSend(v14, "externalPresentationProviderPresentationChanged:", self);
  -[SBMedusaHostedKeyboardWindowLevelAssertion invalidate](self->_medusaHostedKeyboardWindowLevelAssertion, "invalidate");
  medusaHostedKeyboardWindowLevelAssertion = self->_medusaHostedKeyboardWindowLevelAssertion;
  self->_medusaHostedKeyboardWindowLevelAssertion = 0;

  -[SBFWindow resignAsKeyWindow](self->_window, "resignAsKeyWindow");
}

uint64_t __40__SBControlCenterController__didDismiss__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "controlCenterDidDismiss");
}

- (void)_updateWindowOrientation
{
  uint64_t v3;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleControlCenter")) & 1) == 0)
  {
    v3 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
    if (-[SBControlCenterWindow _windowInterfaceOrientation](self->_window, "_windowInterfaceOrientation") != v3)
      -[SBControlCenterWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self->_window, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", v3, 0, 1, 0.0);
  }
}

- (void)_updateWindowVisibility
{
  void *v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[SBGrabberTongue isVisible](self->_grabberTongue, "isVisible")
    || (-[SBControlCenterController viewController](self, "viewController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "presentationState"),
        v3,
        v4))
  {
    if (-[SBControlCenterWindow isHidden](self->_window, "isHidden"))
      -[SBWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
    v5 = 0;
  }
  else
  {
    -[SBFWindow resignAsKeyWindow](self->_window, "resignAsKeyWindow");
    v5 = 1;
    if ((-[SBControlCenterWindow isHidden](self->_window, "isHidden") & 1) == 0)
      -[SBWindow setHidden:](self->_window, "setHidden:", 1);
  }
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SBControlCenterWindow alpha](self->_window, "alpha");
    v8[0] = 67109376;
    v8[1] = v5;
    v9 = 2048;
    v10 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Updating control center window visibility - hidden:%{BOOL}u alpha:%.2f", (uint8_t *)v8, 0x12u);
  }

}

- (void)_updateWindowContentHitTesting
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[SBControlCenterController allowGestureForContentBelow](self, "allowGestureForContentBelow");
  -[SBControlCenterWindow rootViewController](self->_window, "rootViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_setHitTestingDisabled:", v3);

}

- (void)_setStatusBarHidden:(BOOL)a3
{
  SBWindowSceneStatusBarSettingsAssertion *statusBarAssertion;
  void *v5;
  void *v6;
  SBWindowSceneStatusBarSettingsAssertion *v7;
  SBWindowSceneStatusBarSettingsAssertion *v8;
  SBWindowSceneStatusBarSettingsAssertion *v9;
  void *v10;

  statusBarAssertion = self->_statusBarAssertion;
  if (a3)
  {
    if (!statusBarAssertion)
    {
      -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusBarManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assertionManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v10, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 11, CFSTR("Control Center Visible"));
      v8 = self->_statusBarAssertion;
      self->_statusBarAssertion = v7;

      -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_statusBarAssertion, "acquire");
    }
  }
  else if (statusBarAssertion)
  {
    -[SBWindowSceneStatusBarSettingsAssertion invalidate](statusBarAssertion, "invalidate");
    v9 = self->_statusBarAssertion;
    self->_statusBarAssertion = 0;

  }
}

- (void)_updateInactiveMicModeSelectionSensorActivityData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBControlCenterController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sensorActivityDataProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBControlCenterController _applicationEligibleForInactiveMicModeSelection](self, "_applicationEligibleForInactiveMicModeSelection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBControlCenterController _inactiveMicModeSelectionSensorActivityDataFromApplication:](self, "_inactiveMicModeSelectionSensorActivityDataFromApplication:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setInactiveSensorActivityDataEligibleForMicModeSelection:", v5);
  }

}

- (void)_clearInactiveMicModeSelectionSensorActivityData
{
  void *v2;
  id v3;

  -[SBControlCenterController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sensorActivityDataProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setInactiveSensorActivityDataEligibleForMicModeSelection:", 0);

}

- (id)_inactiveMicModeSelectionSensorActivityDataFromApplication:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0D147C8];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setSensorType:", 1);
    objc_msgSend(v4, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayName:", v6);
    objc_msgSend(v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setBundleIdentifier:", v7);
    objc_msgSend(v5, "setExecutableDisplayName:", v6);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_applicationEligibleForInactiveMicModeSelection
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!_os_feature_enabled_impl())
  {
    v11 = 0;
    return v11;
  }
  -[SBControlCenterController _lockScreenManager](self, "_lockScreenManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");
  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 & 1) != 0 || objc_msgSend(v6, "unlockedEnvironmentMode") != 3)
    goto LABEL_6;
  objc_msgSend(v6, "layoutStatePrimaryElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workspaceEntity");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "applicationSceneEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sceneHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "application");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "info");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v12, "supportsInactiveMicModeSelection");

  if ((v8 & 1) == 0)
  {

LABEL_6:
    v11 = 0;
  }

  return v11;
}

- (id)_controlCenterWindow
{
  return self->_window;
}

- (id)_coverSheetViewController
{
  void *v2;
  void *v3;

  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_switcherController
{
  void *v2;
  void *v3;

  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemGestureManager
{
  void *v2;
  void *v3;

  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_enumerateObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = -[NSHashTable count](self->_observers, "count");
  if (v4 && v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_screenDidDim
{
  void *v3;

  -[SBControlCenterController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayWillTurnOff");

  -[SBControlCenterController dismissAnimated:](self, "dismissAnimated:", 0);
}

- (void)_uiRelockedNotification:(id)a3
{
  -[SBControlCenterController dismissAnimated:](self, "dismissAnimated:", 0);
}

- (void)_policyAggregatorCapabilitiesDidChange:(id)a3
{
  void *v4;
  id v5;

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "policyAggregator");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "allowsCapability:", 14) & 1) == 0)
    -[SBControlCenterController dismissAnimated:](self, "dismissAnimated:", 1);

}

- (id)_touchesForGesture:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;

  v3 = a3;
  objc_msgSend(v3, "_activeEventOfType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "_activeTouchesForEvent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

      if (v8)
        NSLog(CFSTR("Failed to find active touches for gesture: %@ with event: %@"), v3, v4);
    }
  }
  else
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

    if (v10)
      NSLog(CFSTR("Failed to find an active touches event for gesture: %@"), v3);
    v6 = 0;
  }

  return v6;
}

- (CGPoint)_presentGestureLocationInView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlCenterController viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)_presentGestureTranslationInView:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v3 = a3;
  v5 = -[SBControlCenterController presentingEdge](self, "presentingEdge");
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlCenterController viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && v5 == 1)
  {
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v6, "setTranslation:inView:", v8, *MEMORY[0x1E0C9D538], v10);
  }
  else
  {
    objc_msgSend(v6, "translationInView:", v8);
    v9 = v11;
    v10 = v12;
  }

  v13 = v9;
  v14 = v10;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)_presentGestureVelocityInView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlCenterController viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "velocityInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)_isLocationXWithinExtendedTrailingStatusBarRegion:(double)a3
{
  return -[SBControlCenterController _isLocationXWithinTrailingStatusBarRegion:regionPadding:](self, "_isLocationXWithinTrailingStatusBarRegion:regionPadding:", a3, 20.0);
}

id __85__SBControlCenterController__isLocationXWithinTrailingStatusBarRegion_regionPadding___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("[SBControlCenterController _isLocationXWithinTrailingStatusBarRegion:]");
  v8[0] = CFSTR("inTrailingStatusBarRegion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("statusBarWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("trailingRegionWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateWindowLevelForScene:(id)a3
{
  void *v4;
  NSObject *v5;
  SBControlCenterWindow *window;
  double v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[SBWindowLevelAssertionManager highestPriorityWindowLevelAssertionForWindowScene:](self->_windowLevelAssertionManager, "highestPriorityWindowLevelAssertionForWindowScene:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Updating Control Center window level using assertion: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  window = self->_window;
  if (v4)
    objc_msgSend(v4, "windowLevel");
  else
    v7 = *MEMORY[0x1E0CEBBD0] + 30.0;
  -[SBControlCenterWindow setWindowLevel:](window, "setWindowLevel:", v7);

}

- (void)_updateWindowForScene:(id)a3
{
  id v4;
  SBControlCenterWindow *window;
  id v6;
  void *v7;
  SBBarSwipeAffordanceViewController *v8;
  SBControlCenterWindow *v9;
  SBControlCenterWindow *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  SBGrabberTongue *v14;
  void *v15;
  SBGrabberTongue *v16;
  SBGrabberTongue *grabberTongue;
  void *v18;
  id v19;

  v4 = a3;
  window = self->_window;
  v19 = v4;
  if (!window
    || (-[UIWindow _sbWindowScene](window, "_sbWindowScene"),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v7 = v19,
        v6 != v19))
  {
    v8 = self->_homeAffordanceViewController;
    if (!v8)
    {
      v8 = self->_homeButtonWrapperViewController;
      if (!v8)
      {
        -[SBControlCenterController viewController](self, "viewController");
        v8 = (SBBarSwipeAffordanceViewController *)objc_claimAutoreleasedReturnValue();
      }
    }
    v9 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:]([SBControlCenterWindow alloc], "initWithWindowScene:rootViewController:role:debugName:", v19, v8, CFSTR("SBTraitsParticipantRoleControlCenter"), CFSTR("ControlCenterWindow"));
    v10 = self->_window;
    self->_window = v9;

    -[SBControlCenterWindow setWindowLevel:](self->_window, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + 30.0);
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ignoreWindowForReachability:", self->_window);

    -[SBWindow setHidden:](self->_window, "setHidden:", 1);
    -[SBControlCenterWindow rootViewController](self->_window, "rootViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bs_endAppearanceTransition:", 0);

    v13 = -[SBControlCenterController presentingEdge](self, "presentingEdge");
    v14 = [SBGrabberTongue alloc];
    -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBGrabberTongue initWithDelegate:edge:type:windowScene:](v14, "initWithDelegate:edge:type:windowScene:", self, v13, 6, v15);
    grabberTongue = self->_grabberTongue;
    self->_grabberTongue = v16;

    -[SBGrabberTongue setName:](self->_grabberTongue, "setName:", CFSTR("ControlCenterGrabberTongue"));
    -[SBGrabberTongue installInView:withColorStyle:](self->_grabberTongue, "installInView:withColorStyle:", self->_window, 0);
    -[SBControlCenterSystemAgent setWindowScene:](self->_systemAgent, "setWindowScene:", v19);
    -[SBControlCenterController _coverSheetViewController](self, "_coverSheetViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerExternalBehaviorProvider:", self);
    objc_msgSend(v18, "registerExternalPresentationProvider:", self);
    objc_msgSend(v18, "registerExternalAppearanceProvider:", self);
    -[SBControlCenterController _setupGestureRecognizersForUpdatedWindowScene](self, "_setupGestureRecognizersForUpdatedWindowScene");
    -[SBControlCenterController _setupPhysicalButtonPreferencesForUpdatedWindowScene](self, "_setupPhysicalButtonPreferencesForUpdatedWindowScene");

    v7 = v19;
  }

}

- (void)_setupGestureRecognizersForUpdatedWindowScene
{
  void *v3;
  unint64_t v4;
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *statusBarPullGestureRecognizer;
  SBIndirectPanGestureRecognizer *v7;
  SBIndirectPanGestureRecognizer *indirectStatusBarPullGestureRecognizer;
  SBIndirectPanGestureRecognizer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  -[SBControlCenterController _systemGestureManager](self, "_systemGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBControlCenterController presentingEdge](self, "presentingEdge");
  if (v4 == 1)
  {
    v5 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__handleStatusBarPullDownGesture_);
    statusBarPullGestureRecognizer = self->_statusBarPullGestureRecognizer;
    self->_statusBarPullGestureRecognizer = v5;

    -[UIPanGestureRecognizer setAllowedTouchTypes:](self->_statusBarPullGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE938);
    -[UIPanGestureRecognizer setDelegate:](self->_statusBarPullGestureRecognizer, "setDelegate:", self);
    objc_msgSend(v3, "addGestureRecognizer:withType:", self->_statusBarPullGestureRecognizer, 7);
    v7 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", self, sel__handleStatusBarPullDownGesture_, 1);
    indirectStatusBarPullGestureRecognizer = self->_indirectStatusBarPullGestureRecognizer;
    self->_indirectStatusBarPullGestureRecognizer = v7;

    -[SBIndirectPanGestureRecognizer setName:](self->_indirectStatusBarPullGestureRecognizer, "setName:", CFSTR("indirectPresentControlCenterGestureRecognizer"));
    -[SBIndirectPanGestureRecognizer setDelegate:](self->_indirectStatusBarPullGestureRecognizer, "setDelegate:", self);
    -[SBIndirectPanGestureRecognizer setOrientationProvider:](self->_indirectStatusBarPullGestureRecognizer, "setOrientationProvider:", self);
    -[SBIndirectPanGestureRecognizer setShouldInvertYAxis:](self->_indirectStatusBarPullGestureRecognizer, "setShouldInvertYAxis:", 1);
    -[SBIndirectPanGestureRecognizer setActivationRecognitionDistance:](self->_indirectStatusBarPullGestureRecognizer, "setActivationRecognitionDistance:", 40.0);
    -[SBIndirectPanGestureRecognizer setShouldRequireGestureToStartAtEdge:](self->_indirectStatusBarPullGestureRecognizer, "setShouldRequireGestureToStartAtEdge:", 1);
    -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](self->_indirectStatusBarPullGestureRecognizer, "setHysteresis:forInputType:", 0, 30.0);
    -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](self->_indirectStatusBarPullGestureRecognizer, "setHysteresis:forInputType:", 1, 10.0);
    v9 = self->_indirectStatusBarPullGestureRecognizer;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __74__SBControlCenterController__setupGestureRecognizersForUpdatedWindowScene__block_invoke;
    v19[3] = &unk_1E8EAEBE8;
    v19[4] = self;
    -[SBIndirectPanGestureRecognizer setTranslationAdjustmentBlock:](v9, "setTranslationAdjustmentBlock:", v19);
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coverSheetSlidingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indirectPresentGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "requireGestureRecognizerToFail:", self->_indirectStatusBarPullGestureRecognizer);
    objc_msgSend(v3, "addGestureRecognizer:withType:", self->_indirectStatusBarPullGestureRecognizer, 10);
    objc_msgSend(v3, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 132, self->_indirectStatusBarPullGestureRecognizer);

  }
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:", self);
  if (v4 == 1)
  {
    objc_msgSend(v13, "dismissPanGestureRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (self->_statusBarPullGestureRecognizer)
      objc_msgSend(v14, "requireGestureRecognizerToFail:");
    -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = v16;
    goto LABEL_9;
  }
  objc_msgSend(v13, "dismissEdgeGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
    v18 = v15;
LABEL_9:
    objc_msgSend(v17, "requireGestureRecognizerToFail:", v18);

  }
}

double __74__SBControlCenterController__setupGestureRecognizersForUpdatedWindowScene__block_invoke(uint64_t a1, double a2)
{
  void *v4;
  int v5;
  void *v6;
  CGRect v8;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRoundCornerPad");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    CGRectGetWidth(v8);
    SBScreenDisplayCornerRadius();

  }
  return a2;
}

- (void)_setupPhysicalButtonPreferencesForUpdatedWindowScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  NSArray *v17;
  NSArray *physicalButtonSceneTargets;
  id v19;

  -[SBControlCenterController window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DA9EB8];
  objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "auditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetWithPhysicalButton:generation:auditToken:identifier:", 1, 2, v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DA9EB8];
  objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "auditToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetWithPhysicalButton:generation:auditToken:identifier:", 2, 2, v12, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA9EA8], "targetWithSceneIdentity:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButtonTarget:", v9);
  objc_msgSend(v14, "addButtonTarget:", v13);
  v15 = (void *)MEMORY[0x1E0C99D20];
  v16 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v15, "arrayWithObject:", v16);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  physicalButtonSceneTargets = self->_physicalButtonSceneTargets;
  self->_physicalButtonSceneTargets = v17;

}

- (BOOL)canBePresented
{
  void *v3;
  void *v4;
  char v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  char v12;
  __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  __CFString *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSObject *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __CFString *v44;
  SBControlCenterController *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  __CFString *v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __CFString *v55;
  id v56;
  uint8_t v57[128];
  uint8_t buf[4];
  const __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "policyAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0;
  v5 = objc_msgSend(v4, "allowsCapability:explanation:", 14, &v56);
  v6 = (__CFString *)v56;
  v7 = 0;
  if ((v5 & 1) == 0)
  {
    SBLogSystemGestureControlCenter();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("(unknown reason)");
      if (v6)
        v9 = v6;
      *(_DWORD *)buf = 138543362;
      v59 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Not allowing transition because: %{public}@", buf, 0xCu);
    }

    v10 = CFSTR("unknown reason");
    if (v6)
      v10 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ControlCenterNotAllowedByPolicyAggregator (%@)"), v10);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasAnyLockState"))
  {
    v55 = v6;
    v12 = objc_msgSend(v4, "allowsCapability:explanation:", 20, &v55);
    v13 = v55;

    if ((v12 & 1) != 0)
      goto LABEL_20;
    SBLogSystemGestureControlCenter();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = CFSTR("(unknown reason)");
      if (v13)
        v15 = v13;
      *(_DWORD *)buf = 138543362;
      v59 = v15;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Not allowing transition while locked because: %{public}@", buf, 0xCu);
    }

    v16 = CFSTR("unknown reason");
    if (v13)
      v16 = v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LockScreenControlCenterNotAllowedByPolicyAggregator (%@)"), v16);
    v5 = 0;
    v11 = v7;
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v6;
  }

LABEL_20:
  -[SBControlCenterController _lockScreenManager](self, "_lockScreenManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isUILocked");
  v19 = v18;
  if (v18)
  {
    v20 = v17;
    objc_msgSend(v17, "lockScreenEnvironment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "behaviorSuppressor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "suppressesControlCenter");

    if (v23)
    {
      SBLogSystemGestureControlCenter();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Not allowing gesture because lockscreen suppresses CC.", buf, 2u);
      }

      v5 = 0;
      v7 = CFSTR("ControlCenterNotAllowedBecauseLockScreenSuppressesCC");
    }
    v17 = v20;
  }
  -[SBControlCenterController _transientOverlayPresenter](self, "_transientOverlayPresenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "shouldDisableControlCenter"))
  {
    v47 = v25;
    SBLogSystemGestureControlCenter();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Not allowing transition because transient overlay suppresses CC.", buf, 2u);
    }
    v5 = 0;
    v27 = v7;
    v7 = CFSTR("ControlCenterNotAllowedBecauseTransientOverlaySuppressesCC");
LABEL_30:

    v25 = v47;
    goto LABEL_33;
  }
  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "switcherController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v19 & 1) == 0 && (objc_msgSend(v27, "isAnySwitcherVisible") & 1) == 0)
  {
    v46 = v4;
    v47 = v25;
    v44 = v13;
    v45 = self;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v27, "layoutStateApplicationSceneHandles");
    v26 = objc_claimAutoreleasedReturnValue();
    v33 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v33)
    {
      v34 = v33;
      v43 = v27;
      v35 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v52 != v35)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "application");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "suppressesControlCenter"))
          {
            SBLogSystemGestureControlCenter();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v37, "bundleIdentifier");
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v59 = v39;
              _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_DEFAULT, "Not allowing transition because the top app (%{public}@) suppresses CC.", buf, 0xCu);

            }
            v40 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v37, "bundleIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stringWithFormat:", CFSTR("ControlCenterNotAllowedBecauseTopAppSuppressesCC (%@)"), v41);
            v42 = objc_claimAutoreleasedReturnValue();

            v5 = 0;
            v7 = (__CFString *)v42;
          }

        }
        v34 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v34);
      self = v45;
      v4 = v46;
      v13 = v44;
      v27 = v43;
    }
    goto LABEL_30;
  }
LABEL_33:

  if (-[SBControlCenterController presentingEdge](self, "presentingEdge") == 4
    && objc_msgSend((id)SBApp, "isTypingActive"))
  {
    SBLogSystemGestureControlCenter();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "Not allowing transition because kbd says typing is active.", buf, 2u);
    }

    v5 = 0;
    v7 = CFSTR("ControlCenterNotAllowedBecauseUserIsTyping");
  }
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __43__SBControlCenterController_canBePresented__block_invoke;
  v48[3] = &unk_1E8EA7BD8;
  v50 = v5 & 1;
  v49 = v7;
  v31 = v7;
  objc_msgSend(v30, "logBlock:", v48);

  return v5 & 1;
}

id __43__SBControlCenterController_canBePresented__block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("[SBControlCenterController canBePresented]");
  v7[0] = CFSTR("allowTransition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("failureReason");
  v8[0] = v2;
  v3 = *(const __CFString **)(a1 + 32);
  if (!v3)
    v3 = &stru_1E8EC7EC0;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)allowShowTransitionSystemGesture
{
  _BOOL4 v3;

  v3 = -[SBControlCenterController isDismissedOrDismissing](self, "isDismissedOrDismissing");
  if (v3)
    LOBYTE(v3) = -[SBControlCenterController canBePresented](self, "canBePresented");
  return v3;
}

- (BOOL)_shouldAllowControlCenterGesture
{
  void *v3;
  char v4;
  const __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  __CFString *v18;
  char v19;
  uint8_t buf[16];

  -[SBControlCenterController _systemGestureManager](self, "_systemGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGestureWithTypeAllowed:", 6);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    SBLogSystemGestureControlCenter();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Not allowing the present gesture to begin because system gestures aren't allowed.", buf, 2u);
    }

    v5 = CFSTR("GestureNotAllowedBySystemGestureManager");
  }
  if (!-[SBControlCenterController allowShowTransitionSystemGesture](self, "allowShowTransitionSystemGesture"))
  {
    SBLogSystemGestureControlCenter();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Not allowing the present gesture to begin because Control Center isn't allowed at this time.", buf, 2u);
    }

    v4 = 0;
    v5 = CFSTR("GestureNotAllowedAtThisTime");
  }
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "reachabilityModeActive");

  if ((v9 & 1) == 0
    && (-[UIPanGestureRecognizer state](self->_statusBarPullGestureRecognizer, "state") == 1
     || -[UIPanGestureRecognizer state](self->_statusBarPullGestureRecognizer, "state") == 2
     || -[UIPanGestureRecognizer state](self->_statusBarPullGestureRecognizer, "state") == 3))
  {
    SBLogSystemGestureControlCenter();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Not allowing the present gesture to begin because the status bar pull down gesture's state is active.", buf, 2u);
    }

    v4 = 0;
    v5 = CFSTR("GestureNotAllowedBecauseStatusBarGestureIsActive");
  }
  objc_msgSend((id)SBApp, "bannerManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isDisplayingFullScreenBannerInWindowScene:", v12);

  if (v13)
  {
    SBLogSystemGestureControlCenter();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Not allowing the present gesture to begin because full screen banner is active.", buf, 2u);
    }

    v4 = 0;
    v5 = CFSTR("GestureNotAllowedBecauseFullScreenBannerIsActive");
  }
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__SBControlCenterController__shouldAllowControlCenterGesture__block_invoke;
  v17[3] = &unk_1E8EA7BD8;
  v19 = v4;
  v18 = (__CFString *)v5;
  objc_msgSend(v15, "logBlock:", v17);

  return v4;
}

id __61__SBControlCenterController__shouldAllowControlCenterGesture__block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("[SBControlCenterController _shouldAllowControlCenterGesture]");
  v7[0] = CFSTR("allowGesture");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("failureReason");
  v8[0] = v2;
  v3 = *(const __CFString **)(a1 + 32);
  if (!v3)
    v3 = &stru_1E8EC7EC0;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_newSystemApertureRestrictionAssertionForType:(unint64_t)a3 withReason:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  if (a3 == 1)
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "restrictSystemApertureToInertWithReason:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "restrictSystemApertureToDefaultLayoutWithReason:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

LABEL_7:
  return v8;
}

- (void)restrictSystemApertureToType:(unint64_t)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *systemApertureAssertionForRestrictionType;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19[2];
  id location;

  v6 = a4;
  if (a3 != 1
    || !BSEqualStrings()
    || (+[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "suppressWhilePresentingControlCenter"),
        v7,
        v8))
  {
    -[SBControlCenterController systemApertureAssertionForRestrictionType](self, "systemApertureAssertionForRestrictionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = -[SBControlCenterController _newSystemApertureRestrictionAssertionForType:withReason:](self, "_newSystemApertureRestrictionAssertionForType:withReason:", a3, v6);
      if (v12)
      {
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __69__SBControlCenterController_restrictSystemApertureToType_withReason___block_invoke;
        v18[3] = &unk_1E8EAEC10;
        objc_copyWeak(v19, &location);
        v19[1] = (id)a3;
        objc_msgSend(v12, "addInvalidationBlock:", v18);
        -[SBControlCenterController systemApertureAssertionForRestrictionType](self, "systemApertureAssertionForRestrictionType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          systemApertureAssertionForRestrictionType = self->_systemApertureAssertionForRestrictionType;
          self->_systemApertureAssertionForRestrictionType = v14;

        }
        -[SBControlCenterController systemApertureAssertionForRestrictionType](self, "systemApertureAssertionForRestrictionType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v12, v17);

        objc_destroyWeak(v19);
        objc_destroyWeak(&location);
      }

    }
  }

}

void __69__SBControlCenterController_restrictSystemApertureToType_withReason___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "systemApertureAssertionForRestrictionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    objc_msgSend(WeakRetained, "systemApertureAssertionForRestrictionType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

  }
}

- (void)invalidateSystemApertureAssertionForType:(unint64_t)a3 withReason:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[SBControlCenterController systemApertureAssertionForRestrictionType](self, "systemApertureAssertionForRestrictionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "invalidateWithReason:", v9);

}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (-[SBControlCenterController isVisible](self, "isVisible"))
    return 2;
  else
    return 1;
}

- (UICoordinateSpace)presentationCoordinateSpace
{
  void *v2;
  void *v3;

  -[SBControlCenterController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICoordinateSpace *)v3;
}

- (NSArray)presentationRegions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!-[SBControlCenterController isPresented](self, "isPresented"))
    return (NSArray *)0;
  v3 = (void *)MEMORY[0x1E0D1BC40];
  -[SBControlCenterController viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regionForCoordinateSpace:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "role:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (NSSet)components
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[SBControlCenterController isPresented](self, "isPresented"))
  {
    v4 = (void *)objc_opt_new();
    -[SBControlCenterController appearanceIdentifier](self, "appearanceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "priority:", 50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suppressTeachableMomentsAnimation:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  return (NSSet *)v3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return 0;
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

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleTimerDuration
{
  return 9;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (id)hasExistingControlFromExtension:(id)a3
{
  void *v3;
  SBWidgetExtensionDebugSearchResult *v4;

  -[CCUIMainViewController existingControlKindFromWidgetExtension:](self->_viewController, "existingControlKindFromWidgetExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SBWidgetExtensionDebugSearchResult initWithKind:]([SBWidgetExtensionDebugSearchResult alloc], "initWithKind:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)launchControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  void (**v11)(id, _QWORD);
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  SBLogWidgets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Launch control: %{public}@", buf, 0xCu);
  }

  if (-[SBControlCenterController isPresented](self, "isPresented"))
  {
    -[CCUIMainViewController addIfNecessaryAndScrollToControlMatching:animated:](self->_viewController, "addIfNecessaryAndScrollToControlMatching:animated:", v6, 1);
    v7[2](v7, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__SBControlCenterController_launchControl_completion___block_invoke;
    v9[3] = &unk_1E8EA47F0;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    SBWorkspaceForceToSpringBoard(v9);

  }
}

void __54__SBControlCenterController_launchControl_completion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  if (a2)
  {
    SBWorkspaceSuspendActiveDisplay();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __54__SBControlCenterController_launchControl_completion___block_invoke_2;
    v4[3] = &unk_1E8E9F7B8;
    v3 = *(void **)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v5, "presentAnimated:completion:", 1, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __54__SBControlCenterController_launchControl_completion___block_invoke_2(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 40), "addIfNecessaryAndScrollToControlMatching:animated:", a1[5], 1);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior defaultBehavior](SBIdleTimerBehavior, "defaultBehavior", a3);
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[SBControlCenterController viewController](self, "viewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canDismissPresentedContent");

  if (v5)
  {
    -[SBControlCenterController viewController](self, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissPresentedContent");

  }
  else
  {
    -[SBControlCenterController dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, 0);
  }
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  -[SBBarSwipeAffordanceViewController zStackParticipant](self->_homeAffordanceViewController, "zStackParticipant", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "ownsHomeGesture"))
  {
    -[SBControlCenterController dismissAnimated:](self, "dismissAnimated:", 1);
  }
  else
  {
    SBLogSystemGestureControlCenter();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Preventing the home affordance click gesture because Control Center does not own the home gesture.", v7, 2u);
    }

  }
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2)
    return 0;
  else
    return qword_1D0E89A88[a4 - 1];
}

- (id)hideAnimationSettingsForBarSwipeAffordanceView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideForHomeGestureOwnershipAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BSAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[SBControlCenterController _homeAffordanceAnimationDelay](self, "_homeAffordanceAnimationDelay");
  v9 = v8;
  objc_msgSend(v7, "delay");
  objc_msgSend(v7, "setDelay:", v9 + v10);
  return v7;
}

- (id)unhideAnimationSettingsForBarSwipeAffordanceView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unhideForHomeGestureOwnershipAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BSAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[SBControlCenterController _homeAffordanceAnimationDelay](self, "_homeAffordanceAnimationDelay");
  v9 = v8;
  objc_msgSend(v7, "delay");
  objc_msgSend(v7, "setDelay:", v9 + v10);
  return v7;
}

- (double)_homeAffordanceAnimationDelay
{
  void *v2;
  unint64_t v3;
  uint64_t v4;

  -[SBControlCenterController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "moduleRowCount");

  v4 = 8;
  if (v3 < 8)
    v4 = v3;
  return (double)(unint64_t)(v4 + 1) * 0.016;
}

- (BOOL)_isStatusBarHiddenIgnoringControlCenter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char IsZero;

  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_OWORD *)&self->_hideStatusBarAssertion == 0)
  {
    IsZero = objc_msgSend(v5, "isFrontmostStatusBarHidden");
  }
  else
  {
    -[SBControlCenterController _switcherController](self, "_switcherController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "unlockedEnvironmentMode") == 3)
    {
      IsZero = objc_msgSend(v6, "isInAppStatusBarHidden");
    }
    else
    {
      objc_msgSend(v5, "statusBarSettingsForLevel:", 6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alpha");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      IsZero = BSFloatIsZero();

    }
  }

  return IsZero;
}

- (CCUIStatusBarStyleSnapshot)hostStatusBarStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
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
  double v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;

  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assertionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBControlCenterController _lockScreenManager](self, "_lockScreenManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUILocked");

  if (v7)
  {
    v8 = objc_msgSend(v5, "isFrontmostStatusBarHidden");
    if (-[SBControlCenterController isPresentedOrDismissing](self, "isPresentedOrDismissing"))
    {
      objc_msgSend(v5, "effectiveStatusBarStyleRequestWithSettings:", 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
    }
    else
    {
      objc_msgSend(v4, "leadingStatusBarStyleRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "trailingStatusBarStyleRequest");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v21 = *MEMORY[0x1E0CEB4B0];
    v23 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v25 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v27 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[SBControlCenterController _coverSheetViewController](self, "_coverSheetViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v11, "shouldShowLockStatusBarTime");
    v32 = (void *)*MEMORY[0x1E0CEC1F0];
    if (v31)
      v32 = 0;
    v30 = v32;
    v29 = 0;
    v28 = 0;
  }
  else
  {
    v8 = -[SBControlCenterController _isStatusBarHiddenIgnoringControlCenter](self, "_isStatusBarHiddenIgnoringControlCenter");
    objc_msgSend(v4, "leadingStatusBarStyleRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingStatusBarStyleRequest");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SBControlCenterController _switcherController](self, "_switcherController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusBarAvoidanceFrameForLayoutRole:", 2);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v11, "statusBarEdgeInsets");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v11, "statusBarOverlayData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusBarActionsByPartIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
  }

  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "userInterfaceIdiom");

    if (v34)
      goto LABEL_15;
LABEL_14:
    objc_msgSend(v4, "avoidanceFrameForStatusBar:", 0);
    v13 = v35;
    v15 = v36;
    v17 = v37;
    v19 = v38;
    goto LABEL_15;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_14;
LABEL_15:
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D145A0]), "initWithHidden:hiddenPartIdentifier:leadingStyleRequest:trailingStyleRequest:overlayData:actionsByPartIdentifier:statusBarInsets:avoidanceFrame:", v8, v30, v10, v9, v28, v29, v21, v23, v25, v27, v13, v15, v17, v19);

  return (CCUIStatusBarStyleSnapshot *)v39;
}

- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6
{
  return -[SBWindowLevelAssertionManager acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:](self->_windowLevelAssertionManager, "acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:", a3, a5, a6, a4);
}

- (void)windowLevelAssertionManager:(id)a3 didUpdateAssertionsForWindowScene:(id)a4
{
  -[SBControlCenterController _updateWindowLevelForScene:](self, "_updateWindowLevelForScene:", a4);
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
}

- (void)setIdleTimerCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_idleTimerCoordinator, a3);
}

- (SBFSensorActivityDataProvider)sensorActivityDataProvider
{
  return (SBFSensorActivityDataProvider *)objc_loadWeakRetained((id *)&self->_sensorActivityDataProvider);
}

- (SBControlCenterWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (SBBarSwipeAffordanceViewController)homeAffordanceViewController
{
  return self->_homeAffordanceViewController;
}

- (void)setHomeAffordanceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceViewController, a3);
}

- (UIViewController)homeButtonWrapperViewController
{
  return self->_homeButtonWrapperViewController;
}

- (void)setHomeButtonWrapperViewController:(id)a3
{
  objc_storeStrong((id *)&self->_homeButtonWrapperViewController, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (SBControlCenterSystemAgent)systemAgent
{
  return self->_systemAgent;
}

- (void)setSystemAgent:(id)a3
{
  objc_storeStrong((id *)&self->_systemAgent, a3);
}

- (CCUISystemControlsCoordinator)systemControlsCoordinator
{
  return self->_systemControlsCoordinator;
}

- (void)setSystemControlsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_systemControlsCoordinator, a3);
}

- (BSSimpleAssertion)hideStatusBarAssertion
{
  return self->_hideStatusBarAssertion;
}

- (void)setHideStatusBarAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_hideStatusBarAssertion, a3);
}

- (SBWindowSceneStatusBarSettingsAssertion)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (void)setStatusBarAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarAssertion, a3);
}

- (SBAsynchronousRenderingAssertion)asynchronousRenderingAssertion
{
  return self->_asynchronousRenderingAssertion;
}

- (void)setAsynchronousRenderingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, a3);
}

- (SBKeyboardFocusControlling)keyboardFocusController
{
  return self->_keyboardFocusController;
}

- (void)setKeyboardFocusController:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardFocusController, a3);
}

- (SBMedusaHostedKeyboardWindowLevelAssertion)medusaHostedKeyboardWindowLevelAssertion
{
  return self->_medusaHostedKeyboardWindowLevelAssertion;
}

- (void)setMedusaHostedKeyboardWindowLevelAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindowLevelAssertion, a3);
}

- (SBGrabberTongue)grabberTongue
{
  return self->_grabberTongue;
}

- (void)setGrabberTongue:(id)a3
{
  objc_storeStrong((id *)&self->_grabberTongue, a3);
}

- (UIPanGestureRecognizer)statusBarPullGestureRecognizer
{
  return self->_statusBarPullGestureRecognizer;
}

- (void)setStatusBarPullGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarPullGestureRecognizer, a3);
}

- (SBIndirectPanGestureRecognizer)indirectStatusBarPullGestureRecognizer
{
  return self->_indirectStatusBarPullGestureRecognizer;
}

- (void)setIndirectStatusBarPullGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectStatusBarPullGestureRecognizer, a3);
}

- (BOOL)indirectStatusBarPullGestureCalledBegin
{
  return self->_indirectStatusBarPullGestureCalledBegin;
}

- (void)setIndirectStatusBarPullGestureCalledBegin:(BOOL)a3
{
  self->_indirectStatusBarPullGestureCalledBegin = a3;
}

- (BOOL)presentationGestureContinuedIntoPaging
{
  return self->_presentationGestureContinuedIntoPaging;
}

- (void)setPresentationGestureContinuedIntoPaging:(BOOL)a3
{
  self->_presentationGestureContinuedIntoPaging = a3;
}

- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion
{
  return self->_resignActiveAssertion;
}

- (void)setResignActiveAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_resignActiveAssertion, a3);
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (SBWindowLevelAssertionManager)windowLevelAssertionManager
{
  return self->_windowLevelAssertionManager;
}

- (void)setWindowLevelAssertionManager:(id)a3
{
  objc_storeStrong((id *)&self->_windowLevelAssertionManager, a3);
}

- (BSInvalidatable)idleTimerDisableAssertion
{
  return self->_idleTimerDisableAssertion;
}

- (void)setIdleTimerDisableAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, a3);
}

- (BSInvalidatable)bannerSuppressionAssertion
{
  return self->_bannerSuppressionAssertion;
}

- (void)setBannerSuppressionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, a3);
}

- (BSInvalidatable)deferOrientationUpdatesAssertion
{
  return self->_deferOrientationUpdatesAssertion;
}

- (void)setDeferOrientationUpdatesAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, a3);
}

- (BSInvalidatable)keyboardFocusLockAssertion
{
  return self->_keyboardFocusLockAssertion;
}

- (void)setKeyboardFocusLockAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardFocusLockAssertion, a3);
}

- (PTSingleTestRecipe)presentModuleTestRecipe
{
  return self->_presentModuleTestRecipe;
}

- (PTSingleTestRecipe)userInterfaceStyleTestRecipe
{
  return self->_userInterfaceStyleTestRecipe;
}

- (NSMutableDictionary)systemApertureAssertionForRestrictionType
{
  return self->_systemApertureAssertionForRestrictionType;
}

- (void)setSystemApertureAssertionForRestrictionType:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureAssertionForRestrictionType, a3);
}

- (NSArray)physicalButtonSceneTargets
{
  return self->_physicalButtonSceneTargets;
}

- (void)setPhysicalButtonSceneTargets:(id)a3
{
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, a3);
}

- (SBHCredenzaSettings)credenzaSettings
{
  return self->_credenzaSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credenzaSettings, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_systemApertureAssertionForRestrictionType, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleTestRecipe, 0);
  objc_storeStrong((id *)&self->_presentModuleTestRecipe, 0);
  objc_storeStrong((id *)&self->_keyboardFocusLockAssertion, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_windowLevelAssertionManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_indirectStatusBarPullGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarPullGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_grabberTongue, 0);
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_hideStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_systemControlsCoordinator, 0);
  objc_storeStrong((id *)&self->_systemAgent, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_homeButtonWrapperViewController, 0);
  objc_storeStrong((id *)&self->_homeAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_sensorActivityDataProvider);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
}

@end
