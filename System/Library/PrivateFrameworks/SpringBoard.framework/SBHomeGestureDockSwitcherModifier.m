@implementation SBHomeGestureDockSwitcherModifier

- (SBHomeGestureDockSwitcherModifier)initWithDelegate:(id)a3 startingEnvironmentMode:(int64_t)a4 requireVerticalSwipeToTrackDock:(BOOL)a5
{
  id v8;
  SBHomeGestureDockSwitcherModifier *v9;
  SBHomeGestureDockSwitcherModifier *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeGestureDockSwitcherModifier;
  v9 = -[SBSwitcherModifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_startingEnvironmentMode = a4;
    v10->_requireVerticalSwipeToTrackDock = a5;
  }

  return v10;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHomeGestureDockSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
    -[SBHomeGestureDockSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SBHomeGestureDockSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureDockSwitcherModifier;
  -[SBSwitcherModifier handleHomeGestureSettingsChangedEvent:](&v7, sel_handleHomeGestureSettingsChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureDockSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v11, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase");
  if (v6 < 2)
  {
    -[SBHomeGestureDockSwitcherModifier _updateForGestureDidBeginWithEvent:](self, "_updateForGestureDidBeginWithEvent:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (v6 == 2)
  {
    -[SBHomeGestureDockSwitcherModifier _updateForGestureDidChangeWithEvent:](self, "_updateForGestureDidChangeWithEvent:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 != 3)
    {
      v8 = 0;
      goto LABEL_9;
    }
    -[SBHomeGestureDockSwitcherModifier _updateForGestureDidEndWithEvent:](self, "_updateForGestureDidEndWithEvent:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_9:
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  id v5;
  char v6;
  double v7;
  double v8;
  double v9;
  BOOL wantsDockAssertion;
  double v11;
  double v12;
  char v13;
  void *v15;
  void *v16;

  v5 = a3;
  if (self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureDockSwitcherModifier.m"), 98, CFSTR("Can't begin a gesture that has already begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureDockSwitcherModifier.m"), 99, CFSTR("Can't begin a gesture that has already ended."));

  }
  self->_gestureHasBegun = 1;
  if ((-[SBHomeGestureDockSwitcherModifier isFloatingDockFullyPresented](self, "isFloatingDockFullyPresented") & 1) != 0)
    v6 = 0;
  else
    v6 = -[SBHomeGestureDockSwitcherModifier isFloatingDockGesturePossible](self, "isFloatingDockGesturePossible");
  self->_wantsDockAssertion = v6;
  if (objc_msgSend(v5, "isPointerTouch"))
    self->_wantsDockAssertion = 0;
  if (self->_requireVerticalSwipeToTrackDock)
    v7 = 1.0;
  else
    v7 = 0.2;
  objc_msgSend(v5, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  wantsDockAssertion = self->_wantsDockAssertion;
  if (wantsDockAssertion)
  {
    v11 = v8;
    v12 = v9;
    wantsDockAssertion = (BSFloatIsZero() & 1) != 0 || fabs(v12 / v11) > v7;
  }
  self->_currentlyTrackingDock = wantsDockAssertion;
  self->_wasTrackingDockWhenGestureBegan = wantsDockAssertion;
  if ((-[SBHomeGestureDockSwitcherModifier homeScreenHasOpenFolderInLocation:](self, "homeScreenHasOpenFolderInLocation:", *MEMORY[0x1E0DAA998]) & 1) != 0)v13 = 1;
  else
    v13 = -[SBHomeGestureDockSwitcherModifier homeScreenHasOpenFolderInLocation:](self, "homeScreenHasOpenFolderInLocation:", CFSTR("SBIconLocationFloatingDockSuggestions"));
  self->_hadOpenDockFolderWhenGestureBegan = v13;
  self->_hadOpenHomeScreenFolderWhenGestureBegan = -[SBHomeGestureDockSwitcherModifier homeScreenHasOpenFolderInLocation:](self, "homeScreenHasOpenFolderInLocation:", *MEMORY[0x1E0DAA9E8]);
  self->_hadOpenForegroundLibraryWhenGestureBegan = -[SBHomeGestureDockSwitcherModifier homeScreenHasModalLibraryOpenInForeground](self, "homeScreenHasModalLibraryOpenInForeground");
  -[SBHomeGestureDockSwitcherModifier _updateGestureTranslationAndVelocityWithEvent:](self, "_updateGestureTranslationAndVelocityWithEvent:", v5);

  return 0;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v5;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  uint64_t v17;
  double v18;
  BOOL v19;
  double v20;
  uint64_t v21;
  BOOL v22;
  void *v24;
  void *v25;

  v5 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureDockSwitcherModifier.m"), 127, CFSTR("Can't update a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureDockSwitcherModifier.m"), 128, CFSTR("Can't update a gesture that has already ended."));

  }
  -[SBHomeGestureDockSwitcherModifier _updateGestureTranslationAndVelocityWithEvent:](self, "_updateGestureTranslationAndVelocityWithEvent:", v5);
  x = self->_unadjustedGestureTranslation.x;
  y = self->_unadjustedGestureTranslation.y;
  -[SBHomeGestureDockSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!self->_currentlyTrackingDock)
  {
    objc_msgSend(v8, "verticalRubberbandEnd");
    v21 = 167;
    if (self->_highEnoughToShowDock)
      goto LABEL_18;
    v22 = v20 + v20 < -y;
LABEL_17:
    *((_BYTE *)&self->super.super.super.isa + v21) = v22;
    goto LABEL_18;
  }
  objc_msgSend(v8, "maximumDistanceYThresholdToPresentDock");
  v11 = v10;
  objc_msgSend(v9, "horizontalRubberbandStart");
  v13 = v12;
  objc_msgSend(v9, "horizontalRubberbandEnd");
  v15 = v14;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = objc_msgSend(WeakRetained, "currentFinalDestination");

  v18 = fabs(x);
  v19 = v18 <= v13 || (unint64_t)(v17 - 1) > 1;
  if (v19 && v18 <= v15)
  {
    if (v11 >= -y)
      goto LABEL_18;
    self->_currentlyTrackingDock = 0;
    v21 = 165;
    v22 = 1;
    goto LABEL_17;
  }
  self->_currentlyTrackingDock = 0;
LABEL_18:

  return 0;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  SBPresentDockSwitcherEventResponse *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  void *v16;

  v5 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureDockSwitcherModifier.m"), 163, CFSTR("Can't end a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureDockSwitcherModifier.m"), 164, CFSTR("Can't end a gesture that has already ended."));

  }
  self->_gestureHasEnded = 1;
  if ((objc_msgSend(v5, "isCanceled") & 1) != 0)
    goto LABEL_16;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "currentFinalDestination");

  if (v7)
  {
    if (self->_startingEnvironmentMode != 1 || v7 != 4)
      goto LABEL_16;
  }
  else if (!-[SBHomeGestureDockSwitcherModifier _hasTraveledSufficientDistanceForHomeOrAppSwitcher](self, "_hasTraveledSufficientDistanceForHomeOrAppSwitcher")|| -[SBHomeGestureDockSwitcherModifier _rubberbandedOutOfDockHorizontally](self, "_rubberbandedOutOfDockHorizontally")|| (v10 = self->_lastTouchLocation.y + self->_velocity.y * 0.15, -[SBHomeGestureDockSwitcherModifier switcherViewBounds](self, "switcherViewBounds"), v12 = v11, -[SBHomeGestureDockSwitcherModifier floatingDockHeight](self, "floatingDockHeight"), v10 >= v12 + v13 * -0.25))
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v9 = objc_alloc_init(SBPresentDockSwitcherEventResponse);
LABEL_17:

  return v9;
}

- (void)_updateGestureTranslationAndVelocityWithEvent:(id)a3
{
  CGPoint *p_lastTouchLocation;
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGPoint *p_unadjustedGestureTranslation;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double y;
  double x;
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
  double v28;
  double v29;
  long double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  long double __y;
  double v40;
  double v41;
  id v42;

  p_lastTouchLocation = &self->_lastTouchLocation;
  v5 = a3;
  objc_msgSend(v5, "locationInContainerView");
  p_lastTouchLocation->x = v6;
  p_lastTouchLocation->y = v7;
  p_unadjustedGestureTranslation = &self->_unadjustedGestureTranslation;
  objc_msgSend(v5, "translationInContainerView");
  self->_unadjustedGestureTranslation.x = v9;
  self->_unadjustedGestureTranslation.y = v10;
  objc_msgSend(v5, "velocityInContainerView");
  v12 = v11;
  v14 = v13;

  self->_velocity.x = v12;
  self->_velocity.y = v14;
  if (self->_currentlyTrackingDock)
  {
    x = p_unadjustedGestureTranslation->x;
    y = self->_unadjustedGestureTranslation.y;
    -[SBHomeGestureDockSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "verticalRubberbandStart");
    v18 = v17;
    objc_msgSend(v42, "verticalRubberbandEnd");
    v20 = v19;
    v40 = v19;
    objc_msgSend(v42, "verticalRubberbandDistance");
    v41 = v21;
    objc_msgSend(v42, "verticalRubberbandExponent");
    __y = v22;
    objc_msgSend(v42, "horizontalRubberbandStart");
    v24 = v23;
    objc_msgSend(v42, "horizontalRubberbandEnd");
    v26 = v25;
    objc_msgSend(v42, "horizontalRubberbandDistance");
    v28 = v27;
    objc_msgSend(v42, "horizontalRubberbandExponent");
    v30 = v29;
    v31 = fmin(fmax(pow(fmin(fmax((-y - v18) / (v20 - v18) + 0.0, 0.0), 1.0), __y), 0.0), 1.0);
    v32 = fmin(fmax(pow(fmin(fmax((fabs(x) - v24) / (v26 - v24) + 0.0, 0.0), 1.0), v30), 0.0), 1.0);
    v33 = x + v26;
    if (x + v26 > 0.0)
      v33 = 0.0;
    v34 = v33 - v32 * v28;
    v35 = x - v26;
    if (x - v26 < 0.0)
      v35 = 0.0;
    v36 = v35 + v32 * v28;
    if (x <= 0.0)
      v36 = v34;
    v37 = y + v40;
    if (y + v40 > 0.0)
      v37 = 0.0;
    v38 = self->_unadjustedGestureTranslation.y - (v37 - v31 * v41);
    self->_translationAdjustmentForFloatingDock.x = p_unadjustedGestureTranslation->x - v36;
    self->_translationAdjustmentForFloatingDock.y = v38;

  }
}

- (CGPoint)adjustedTranslationForTranslation:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = a3.x - self->_translationAdjustmentForFloatingDock.x;
  v4 = a3.y - self->_translationAdjustmentForFloatingDock.y;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)translationForAdjustedTranslation:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = a3.x + self->_translationAdjustmentForFloatingDock.x;
  v4 = a3.y + self->_translationAdjustmentForFloatingDock.y;
  result.y = v4;
  result.x = v3;
  return result;
}

- (int64_t)adjustedFinalDestinationForDestination:(int64_t)a3 withTranslation:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y;
  double v6;
  double v9;
  double v10;
  int64_t startingEnvironmentMode;
  double v12;
  int v13;
  int v14;
  _BOOL4 v15;
  double v16;
  _BOOL4 v17;
  int v18;
  double v19;
  int v20;
  BOOL v21;
  int v22;
  char v23;
  double v24;
  char v25;
  int64_t v26;

  y = a5.y;
  v6 = a4.y;
  -[SBHomeGestureDockSwitcherModifier floatingDockHeight](self, "floatingDockHeight", a4.x, a4.y, a5.x);
  v10 = v9;
  startingEnvironmentMode = self->_startingEnvironmentMode;
  v12 = *(double *)&kVelocityYThresholdForUnconditionalHome_0;
  if (self->_wasTrackingDockWhenGestureBegan)
    v13 = !-[SBHomeGestureDockSwitcherModifier _rubberbandedOutOfDockHorizontally](self, "_rubberbandedOutOfDockHorizontally");
  else
    v13 = 0;
  if (self->_hadOpenDockFolderWhenGestureBegan || self->_hadOpenForegroundLibraryWhenGestureBegan)
  {
    v14 = 0;
    v15 = 0;
  }
  else
  {
    v15 = !self->_hadOpenHomeScreenFolderWhenGestureBegan;
    v14 = 1;
  }
  -[SBHomeGestureDockSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v17 = startingEnvironmentMode != 1;
  v18 = startingEnvironmentMode != 1 || v15;
  if (y >= v12)
    v17 = 1;
  v19 = *(double *)&kMaximumDistanceYThresholdToPresentDock;
  v20 = v14 | v13 ^ 1;
  if (y >= v12)
    v20 = 1;
  if (!v17)
    v19 = v16;
  v21 = a3 != 3 || !self->_wasTrackingDockWhenGestureBegan;
  v22 = !v21;
  v23 = v20 ^ 1;
  if (!v21)
    v23 = 1;
  if ((v22 & v13) != 0)
    v24 = v19;
  else
    v24 = v10;
  if (!v20)
    v24 = v19;
  if (!v13)
    v19 = v24;
  v25 = v13 | v23;
  if (v18)
  {
    v19 = v24;
    v25 = v23;
  }
  if (v19 >= -v6)
    v26 = 0;
  else
    v26 = a3;
  if ((v25 & 1) != 0)
    return v26;
  else
    return a3;
}

- (id)studyLogData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wasTrackingDockWhenGestureBegan);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("wasTrackingDockWhenGestureBegan"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_currentlyTrackingDock);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isTrackingDockWhenGestureEnded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBHomeGestureDockSwitcherModifier _rubberbandedOutOfDockHorizontally](self, "_rubberbandedOutOfDockHorizontally"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("rubberbandedOutOfDockHorizontally"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "numberWithBool:", -[SBHomeGestureDockSwitcherModifier _shouldPresentDockForFinalDestination:](self, "_shouldPresentDockForFinalDestination:", objc_msgSend(WeakRetained, "currentFinalDestination")));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("didPresentDock"));

  return v3;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return self->_wantsDockAssertion;
}

- (int64_t)dockUpdateMode
{
  if (self->_currentlyTrackingDock)
    return 5;
  else
    return 3;
}

- (double)dockProgress
{
  double result;

  if (self->_wantsDockAssertion && self->_currentlyTrackingDock)
  {
    -[SBHomeGestureDockSwitcherModifier floatingDockViewTopMargin](self, "floatingDockViewTopMargin", 1.0);
    -[SBHomeGestureDockSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  }
  BSUIConstrainValueToIntervalWithRubberBand();
  return result;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 1;
}

- (unint64_t)dockWindowLevelPriority
{
  return 2;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  SBHomeGestureDockSwitcherModifier *v13;

  -[SBChainableModifier descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", &stru_1E8EC7EC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __53__SBHomeGestureDockSwitcherModifier_debugDescription__block_invoke;
  v11 = &unk_1E8E9E820;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, CFSTR("\t"), &v8);
  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__SBHomeGestureDockSwitcherModifier_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("lastTouchLocation"), *(double *)(*(_QWORD *)(a1 + 40) + 96), *(double *)(*(_QWORD *)(a1 + 40) + 104));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("unadjustedGestureTranslation"), *(double *)(*(_QWORD *)(a1 + 40) + 112), *(double *)(*(_QWORD *)(a1 + 40) + 120));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("velocity"), *(double *)(*(_QWORD *)(a1 + 40) + 128), *(double *)(*(_QWORD *)(a1 + 40) + 136));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translationAdjustmentForFloatingDock"), *(double *)(*(_QWORD *)(a1 + 40) + 144), *(double *)(*(_QWORD *)(a1 + 40) + 152));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 160), CFSTR("currentlyTrackingDock"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 161), CFSTR("wasTrackingDockWhenGestureBegan"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 162), CFSTR("hadOpenDockFolderWhenGestureBegan"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 163), CFSTR("hadOpenHomeScreenFolderWhenGestureBegan"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 164), CFSTR("hadOpenForegroundLibraryWhenGestureBegan"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 165), CFSTR("verticallyRubberbandedOutOfDock"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 166), CFSTR("wantsDockAssertion"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 167), CFSTR("highEnoughToShowDock"));
  v14 = *(void **)(a1 + 32);
  SBStringForUnlockedEnvironmentMode(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:withName:", v15, CFSTR("startingEnvironmentMode"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 192), CFSTR("requireVerticalSwipeToTrackDock"));
}

- (BOOL)_shouldPresentDockForFinalDestination:(int64_t)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3)
  {
    LOBYTE(v5) = a3 == 4 && self->_startingEnvironmentMode == 1;
  }
  else
  {
    v5 = -[SBHomeGestureDockSwitcherModifier _hasTraveledSufficientDistanceForHomeOrAppSwitcher](self, "_hasTraveledSufficientDistanceForHomeOrAppSwitcher");
    if (v5)
    {
      if (-[SBHomeGestureDockSwitcherModifier _rubberbandedOutOfDockHorizontally](self, "_rubberbandedOutOfDockHorizontally"))
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        v6 = self->_lastTouchLocation.y + self->_velocity.y * 0.15;
        -[SBHomeGestureDockSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
        v8 = v7;
        -[SBHomeGestureDockSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
        LOBYTE(v5) = v6 < v8 + v9 * -0.25;
      }
    }
  }
  return v5;
}

- (BOOL)_rubberbandedOutOfDockHorizontally
{
  return self->_wasTrackingDockWhenGestureBegan
      && !self->_currentlyTrackingDock
      && !self->_verticallyRubberbandedOutOfDock;
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher
{
  double v3;

  -[SBHomeGestureDockSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  return self->_lastTouchLocation.y <= v3 - *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_2;
}

- (void)_applyPrototypeSettings
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;

  v3 = SBMainScreenPointsPerMillimeter();
  -[SBHomeGestureDockSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minimumYDistanceForHomeOrAppSwitcher");
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_2 = v3 * v4;
  objc_msgSend(v7, "velocityYThresholdForUnconditionalHome");
  *(double *)&kVelocityYThresholdForUnconditionalHome_0 = v3 * v5;
  objc_msgSend(v7, "maximumDistanceYThresholdToPresentDock");
  kMaximumDistanceYThresholdToPresentDock = v6;

}

- (BOOL)isCurrentlyTrackingDock
{
  return self->_currentlyTrackingDock;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
