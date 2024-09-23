@implementation SBExternalHomeGestureFloatingSwitcherModifier

- (SBExternalHomeGestureFloatingSwitcherModifier)initWithGestureID:(id)a3 initialFloatingConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  SBExternalHomeGestureFloatingSwitcherModifier *v7;
  SBExternalHomeGestureFloatingSwitcherModifier *v8;
  BOOL v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
  v7 = -[SBGestureSwitcherModifier initWithGestureID:](&v11, sel_initWithGestureID_, a3);
  v8 = v7;
  if (v7)
  {
    v7->_initialFloatingConfiguration = a4;
    v7->_interfaceOrientation = a5;
    v9 = SBFloatingConfigurationIsStashed(v7->_initialFloatingConfiguration) || v8->_initialFloatingConfiguration == 0;
    v8->_stashed = v9;
  }
  return v8;
}

- (void)didMoveToParentModifier:(id)a3
{
  int64_t initialFloatingConfiguration;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  int v10;
  uint64_t v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v13, sel_didMoveToParentModifier_);
  if (a3)
  {
    initialFloatingConfiguration = self->_initialFloatingConfiguration;
    if (!SBFloatingConfigurationIsStashed(initialFloatingConfiguration))
    {
      if (SBFloatingConfigurationIsLeft(initialFloatingConfiguration))
        initialFloatingConfiguration = 3;
      else
        initialFloatingConfiguration = 4;
    }
    -[SBExternalHomeGestureFloatingSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", self->_interfaceOrientation, initialFloatingConfiguration);
    self->_stashedContainerViewBounds.origin.x = v6;
    self->_stashedContainerViewBounds.origin.y = v7;
    self->_stashedContainerViewBounds.size.width = v8;
    self->_stashedContainerViewBounds.size.height = v9;
    v10 = -[SBExternalHomeGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v11 = 3;
    if (v10)
      v11 = 4;
    v12 = 1.0;
    if (initialFloatingConfiguration == v11)
      v12 = -1.0;
    self->_stashedContainerViewBounds.origin.x = self->_stashedContainerViewBounds.origin.x + v12;
  }
}

- (CGRect)containerViewBounds
{
  double x;
  double y;
  double width;
  double height;
  objc_super v6;
  CGRect result;

  if (self->_stashed)
  {
    x = self->_stashedContainerViewBounds.origin.x;
    y = self->_stashedContainerViewBounds.origin.y;
    width = self->_stashedContainerViewBounds.size.width;
    height = self->_stashedContainerViewBounds.size.height;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
    -[SBExternalHomeGestureFloatingSwitcherModifier containerViewBounds](&v6, sel_containerViewBounds);
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isFloatingDockGesturePossible
{
  return 1;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v6, sel_animationAttributesForLayoutElement_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setUpdateMode:", 3);
  return v4;
}

- (id)appLayoutsToResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_stashed)
  {
    v8 = &unk_1E91D22D0;
    v2 = (void *)MEMORY[0x1E0C99E60];
    -[SBExternalHomeGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
    -[SBExternalHomeGestureFloatingSwitcherModifier appLayoutsToResignActive](&v7, sel_appLayoutsToResignActive);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v10, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "phase");
  if ((unint64_t)(v7 - 1) < 2)
  {
    -[SBExternalHomeGestureFloatingSwitcherModifier _updateForGestureDidBeginOrChangeWithEvent:](self, "_updateForGestureDidBeginOrChangeWithEvent:", v5);
  }
  else if (v7 == 3)
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }
  else if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalHomeGestureFloatingSwitcherModifier.m"), 119, CFSTR("Should not be getting PhasePossible"));

  }
  return v6;
}

- (void)_updateForGestureDidBeginOrChangeWithEvent:(id)a3
{
  id v4;
  void *v5;
  SBHomeGestureDockSwitcherModifier *v6;
  SBHomeGestureDockSwitcherModifier *dockModifier;
  uint64_t v8;
  uint64_t v9;
  SBHomeGestureDockSwitcherModifier *v10;
  SBHomeGestureDockSwitcherModifier *v11;
  double v12;
  double v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v5 = v4;
  if (!self->_stashed && objc_msgSend(v4, "phase") == 1 && objc_msgSend(v5, "type") != 3)
  {
    v6 = -[SBHomeGestureDockSwitcherModifier initWithDelegate:startingEnvironmentMode:requireVerticalSwipeToTrackDock:]([SBHomeGestureDockSwitcherModifier alloc], "initWithDelegate:startingEnvironmentMode:requireVerticalSwipeToTrackDock:", self, 3, 1);
    dockModifier = self->_dockModifier;
    self->_dockModifier = v6;

  }
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x3010000000;
  v21 = 0;
  v22 = 0;
  v20 = &unk_1D0FA064E;
  objc_msgSend(v5, "translationInContainerView");
  v21 = v8;
  v22 = v9;
  v10 = self->_dockModifier;
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __92__SBExternalHomeGestureFloatingSwitcherModifier__updateForGestureDidBeginOrChangeWithEvent___block_invoke;
    v14[3] = &unk_1E8EA4CE8;
    v14[4] = self;
    v15 = v5;
    v16 = &v17;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v10, v14);

  }
  if (!self->_stashed)
  {
    v11 = self->_dockModifier;
    if (v11 && -[SBHomeGestureDockSwitcherModifier wantsDockBehaviorAssertion](v11, "wantsDockBehaviorAssertion"))
    {
      if (-[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](self->_dockModifier, "isCurrentlyTrackingDock"))
        goto LABEL_14;
      if ((-[SBExternalHomeGestureFloatingSwitcherModifier isFloatingDockFullyPresented](self, "isFloatingDockFullyPresented") & 1) != 0)
      {
LABEL_13:
        self->_stashed = 1;
        goto LABEL_14;
      }
    }
    v12 = v18[5];
    -[SBExternalHomeGestureFloatingSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
    if (v12 < -v13)
      goto LABEL_13;
  }
LABEL_14:
  _Block_object_dispose(&v17, 8);

}

uint64_t __92__SBExternalHomeGestureFloatingSwitcherModifier__updateForGestureDidBeginOrChangeWithEvent___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (id)objc_msgSend(*(id *)(a1[4] + 120), "handleEvent:", a1[5]);
  result = objc_msgSend(*(id *)(a1[4] + 120), "adjustedTranslationForTranslation:", *(double *)(*(_QWORD *)(a1[6] + 8) + 32), *(double *)(*(_QWORD *)(a1[6] + 8) + 40));
  v4 = *(_QWORD *)(a1[6] + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  return result;
}

- (int64_t)currentFinalDestination
{
  return 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockModifier, 0);
}

@end
