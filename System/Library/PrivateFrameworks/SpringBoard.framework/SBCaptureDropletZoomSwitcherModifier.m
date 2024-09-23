@implementation SBCaptureDropletZoomSwitcherModifier

- (SBCaptureDropletZoomSwitcherModifier)initWithTransitionID:(id)a3 zoomModifier:(id)a4 appLayout:(id)a5 launchPreludeAnimationToken:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBCaptureDropletZoomSwitcherModifier *v15;
  uint64_t v16;
  SBCaptureButtonSettings *settings;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureDropletZoomSwitcherModifier.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout != nil"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureDropletZoomSwitcherModifier.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoomModifier != nil"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureDropletZoomSwitcherModifier.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preludeToken != nil"));

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  v15 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v26, sel_initWithTransitionID_, v11);
  if (v15)
  {
    +[SBCaptureButtonDomain rootSettings](SBCaptureButtonDomain, "rootSettings");
    v16 = objc_claimAutoreleasedReturnValue();
    settings = v15->_settings;
    v15->_settings = (SBCaptureButtonSettings *)v16;

    objc_storeStrong((id *)&v15->_appLayout, a5);
    objc_storeStrong((id *)&v15->_zoomModifier, a4);
    objc_storeStrong((id *)&v15->_preludeAnimationToken, a6);
    v15->_dropletEffectRequired = 1;
    v15->_shouldDimBackground = 0;
    objc_msgSend(v14, "preludeAnimationRectPresentationValue");
    v15->_initialDropletFrame.origin.x = v18;
    v15->_initialDropletFrame.origin.y = v19;
    v15->_initialDropletFrame.size.width = v20;
    v15->_initialDropletFrame.size.height = v21;
  }

  return v15;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!-[SBChainableModifier containsChildModifier:](self, "containsChildModifier:", self->_zoomModifier))
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_zoomModifier);
    -[SBCaptureDropletZoomSwitcherModifier presentationValueForAnimatableProperty:](self, "presentationValueForAnimatableProperty:", CFSTR("SBDropletZoomAnimatablePropertyIdentifier"));
    if (-[SBCaptureButtonSettings enableZoomUpBlur](self->_settings, "enableZoomUpBlur"))
    {
      -[SBCaptureButtonSettings zoomUpBlurStartProgress](self->_settings, "zoomUpBlurStartProgress");
      if (BSFloatGreaterThanOrEqualToFloat())
        self->_allowHomeScreenBlur = 1;
    }
    -[SBCaptureButtonSettings zoomUpBackgroundDimStartProgress](self->_settings, "zoomUpBackgroundDimStartProgress");
    if (BSFloatGreaterThanOrEqualToFloat())
      self->_shouldDimBackground = 1;
  }
}

- (id)handleAnimatablePropertyChangedEvent:(id)a3
{
  void *v4;
  int v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBSwitcherModifier handleAnimatablePropertyChangedEvent:](&v9, sel_handleAnimatablePropertyChangedEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCaptureDropletZoomSwitcherModifier presentationValueForAnimatableProperty:](self, "presentationValueForAnimatableProperty:", CFSTR("SBDropletZoomAnimatablePropertyIdentifier"));
  if (-[SBCaptureButtonSettings enableZoomUpBlur](self->_settings, "enableZoomUpBlur")
    && (-[SBCaptureButtonSettings zoomUpBlurStartProgress](self->_settings, "zoomUpBlurStartProgress"),
        BSFloatGreaterThanOrEqualToFloat())
    && !self->_allowHomeScreenBlur)
  {
    v5 = 1;
    self->_allowHomeScreenBlur = 1;
  }
  else
  {
    v5 = 0;
  }
  -[SBCaptureButtonSettings zoomUpBackgroundDimStartProgress](self->_settings, "zoomUpBackgroundDimStartProgress");
  if (BSFloatGreaterThanOrEqualToFloat() && !self->_shouldDimBackground)
  {
    self->_shouldDimBackground = 1;
  }
  else if (!v5)
  {
    return v4;
  }
  v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
  SBAppendSwitcherModifierResponse(v6, v4);
  v7 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v7;
  return v4;
}

- (id)handleHardwareButtonDropletAnimationEvent:(id)a3
{
  id v4;
  void *v5;
  SBHardwareButtonLaunchPreludeAnimationToken *preludeAnimationToken;
  SBHardwareButtonLaunchZoomUpAnimationToken *v7;
  SBHardwareButtonLaunchZoomUpAnimationToken *zoomupAnimationToken;
  void *v9;
  void *v10;
  SBInjectVelocitySwitcherEventResponse *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleHardwareButtonDropletAnimationEvent:](&v14, sel_handleHardwareButtonDropletAnimationEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  preludeAnimationToken = self->_preludeAnimationToken;
  self->_preludeAnimationToken = 0;

  objc_msgSend(v4, "zoomUpToken", v14.receiver, v14.super_class);
  v7 = (SBHardwareButtonLaunchZoomUpAnimationToken *)objc_claimAutoreleasedReturnValue();

  zoomupAnimationToken = self->_zoomupAnimationToken;
  self->_zoomupAnimationToken = v7;

  v9 = (void *)MEMORY[0x1E0CB3B18];
  -[SBHardwareButtonLaunchZoomUpAnimationToken preludeAnimationVelocity](self->_zoomupAnimationToken, "preludeAnimationVelocity");
  objc_msgSend(v9, "valueWithCGPoint:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBInjectVelocitySwitcherEventResponse initWithVelocity:forKey:appLayout:]([SBInjectVelocitySwitcherEventResponse alloc], "initWithVelocity:forKey:appLayout:", v10, CFSTR("position"), self->_appLayout);
  SBAppendSwitcherModifierResponse(v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = BSEqualStrings();
  if ((_DWORD)v4)
  {
    self->_dropletEffectRequired = 0;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 3);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)transitionWillBegin
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  SBTimerEventSwitcherEventResponse *v5;
  double v6;
  double v7;
  float v8;
  SBTimerEventSwitcherEventResponse *v9;
  SBUpdateLayoutSwitcherEventResponse *v10;
  SBHardwareButtonDropletActionResponse *v11;
  SBMatchMoveToDropletSwitcherEventResponse *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v15, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = [SBTimerEventSwitcherEventResponse alloc];
  -[SBCaptureButtonSettings disableDropletEffectDelay](self->_settings, "disableDropletEffectDelay");
  v7 = v6;
  UIAnimationDragCoefficient();
  v9 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v5, "initWithDelay:validator:reason:", 0, CFSTR("SBDropletEffectDisableTimerReason"), v7 * v8);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v9);

  v10 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v10);

  v11 = -[SBHardwareButtonDropletActionResponse initWithPreludeToken:zoomUpToken:appLayout:action:]([SBHardwareButtonDropletActionResponse alloc], "initWithPreludeToken:zoomUpToken:appLayout:action:", self->_preludeAnimationToken, 0, self->_appLayout, 0);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v11);

  v12 = -[SBMatchMoveToDropletSwitcherEventResponse initWithAppLayout:active:]([SBMatchMoveToDropletSwitcherEventResponse alloc], "initWithAppLayout:active:", self->_appLayout, 1);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v12);

  SBAppendSwitcherModifierResponse(v4, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)transitionDidEnd
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  SBMatchMoveToDropletSwitcherEventResponse *v5;
  SBHardwareButtonDropletActionResponse *v6;
  SBHardwareButtonLaunchPreludeAnimationToken *preludeAnimationToken;
  SBHardwareButtonLaunchZoomUpAnimationToken *zoomupAnimationToken;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v11, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = -[SBMatchMoveToDropletSwitcherEventResponse initWithAppLayout:active:]([SBMatchMoveToDropletSwitcherEventResponse alloc], "initWithAppLayout:active:", self->_appLayout, 0);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v5);

  v6 = -[SBHardwareButtonDropletActionResponse initWithPreludeToken:zoomUpToken:appLayout:action:]([SBHardwareButtonDropletActionResponse alloc], "initWithPreludeToken:zoomUpToken:appLayout:action:", self->_preludeAnimationToken, self->_zoomupAnimationToken, self->_appLayout, 1);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v6);

  preludeAnimationToken = self->_preludeAnimationToken;
  self->_preludeAnimationToken = 0;

  zoomupAnimationToken = self->_zoomupAnimationToken;
  self->_zoomupAnimationToken = 0;

  SBAppendSwitcherModifierResponse(v4, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
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
  objc_super v27;
  objc_super v28;
  CGRect result;

  v28.receiver = self;
  v28.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBCaptureDropletZoomSwitcherModifier frameForIndex:](&v28, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBCaptureDropletZoomSwitcherModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isEqual:", self->_appLayout))
  {
    v27.receiver = self;
    v27.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    -[SBCaptureDropletZoomSwitcherModifier fullyPresentedFrameForIndex:frame:](&v27, sel_fullyPresentedFrameForIndex_frame_, a3, v6, v8, v10, v12);
    v6 = v15;
    v8 = v16;
    v10 = v17;
    v12 = v18;
    if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    {
      UIRectGetCenter();
      SBUnintegralizedRectCenteredAboutPoint();
      v6 = v19;
      v8 = v20;
      v10 = v21;
      v12 = v22;
    }
  }

  v23 = v6;
  v24 = v8;
  v25 = v10;
  v26 = v12;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double Height;
  double v9;
  objc_super v11;
  CGRect v12;

  -[SBCaptureDropletZoomSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqual:", self->_appLayout))
  {
    v7 = 1.0;
    if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    {
      Height = CGRectGetHeight(self->_initialDropletFrame);
      -[SBCaptureDropletZoomSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v7 = Height / CGRectGetHeight(v12);
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    -[SBCaptureDropletZoomSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3);
    v7 = v9;
  }

  return v7;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBCaptureDropletZoomSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_appLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDropletEffectRequiredBehindAppLayout:(id)a3
{
  id v4;
  unsigned __int8 dropletEffectRequired;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_appLayout))
  {
    dropletEffectRequired = self->_dropletEffectRequired;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    dropletEffectRequired = -[SBCaptureDropletZoomSwitcherModifier isDropletEffectRequiredBehindAppLayout:](&v7, sel_isDropletEffectRequiredBehindAppLayout_, v4);
  }

  return dropletEffectRequired;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  _QWORD v11[5];
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBCaptureDropletZoomSwitcherModifier topMostLayoutElements](&v13, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && -[SBCaptureDropletZoomSwitcherModifier wantsBezelEffectsLayoutElement](self, "wantsBezelEffectsLayoutElement"))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    -[SBCaptureDropletZoomSwitcherModifier bezelEffectsLayoutElement](&v12, sel_bezelEffectsLayoutElement);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (id)objc_msgSend(v3, "mutableCopy");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __61__SBCaptureDropletZoomSwitcherModifier_topMostLayoutElements__block_invoke;
      v11[3] = &unk_1E8EBBBD0;
      v11[4] = self;
      v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v11);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = v6 + 1;
        objc_msgSend(v5, "insertObject:atIndex:", v4, v6 + 1);
        v10.receiver = self;
        v10.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
        -[SBCaptureDropletZoomSwitcherModifier switcherDimmingViewLayoutElement](&v10, sel_switcherDimmingViewLayoutElement);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v5, "insertObject:atIndex:", v8, v7);

      }
    }
    else
    {
      v5 = v3;
    }

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

uint64_t __61__SBCaptureDropletZoomSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "switcherLayoutElementType") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "isEqual:", v3);

  return v4;
}

- (BOOL)wantsBezelEffectsLayoutElement
{
  return 1;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v16, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "switcherLayoutElementType");
  if (v6 == 2)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    -[SBCaptureButtonSettings zoomUpBackgroundDimAnimationSettings](self->_settings, "zoomUpBackgroundDimAnimationSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOpacitySettings:", v14);

    objc_msgSend(v7, "setUpdateMode:", 3);
    goto LABEL_6;
  }
  if (!v6 && objc_msgSend(v4, "isEqual:", self->_appLayout))
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    -[SBCaptureButtonSettings zoomUpScaleSettings](self->_settings, "zoomUpScaleSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLayoutSettings:", v8);

    -[SBCaptureButtonSettings zoomUpPositionXSettings](self->_settings, "zoomUpPositionXSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPositionSettings:", v9);

    -[SBCaptureButtonSettings zoomUpPositionXSettings](self->_settings, "zoomUpPositionXSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDropletPositionXSettings:", v10);

    -[SBCaptureButtonSettings zoomUpPositionYSettings](self->_settings, "zoomUpPositionYSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDropletPositionYSettings:", v11);

    -[SBCaptureButtonSettings zoomUpScaleSettings](self->_settings, "zoomUpScaleSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScaleSettings:", v12);

    -[SBCaptureButtonSettings zoomUpCornerRadiusSettings](self->_settings, "zoomUpCornerRadiusSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadiusSettings:", v13);

LABEL_6:
    v5 = v7;
  }

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  if (!objc_msgSend(v8, "isEqual:", self->_appLayout)
    || (v9 = 0.0, !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    -[SBCaptureDropletZoomSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (double)homeScreenBackdropBlurProgress
{
  double result;
  objc_super v3;

  if (!self->_allowHomeScreenBlur)
    return 0.0;
  v3.receiver = self;
  v3.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBCaptureDropletZoomSwitcherModifier homeScreenBackdropBlurProgress](&v3, sel_homeScreenBackdropBlurProgress);
  return result;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 1;
}

- (double)switcherDimmingAlpha
{
  double result;
  objc_super v4;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")
    || (result = 1.0, !self->_shouldDimBackground))
  {
    v4.receiver = self;
    v4.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    -[SBCaptureDropletZoomSwitcherModifier switcherDimmingAlpha](&v4, sel_switcherDimmingAlpha, result);
  }
  return result;
}

- (id)animatablePropertyIdentifiers
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBCaptureDropletZoomSwitcherModifier animatablePropertyIdentifiers](&v6, sel_animatablePropertyIdentifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBCaptureButtonSettings enableZoomUpBlur](self->_settings, "enableZoomUpBlur"))
  {
    objc_msgSend(v3, "setByAddingObject:", CFSTR("SBDropletZoomAnimatablePropertyIdentifier"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBDropletZoomAnimatablePropertyIdentifier")) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    v5 = -[SBCaptureDropletZoomSwitcherModifier updateModeForAnimatableProperty:](&v7, sel_updateModeForAnimatableProperty_, v4);
  }

  return v5;
}

- (id)settingsForAnimatableProperty:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBDropletZoomAnimatablePropertyIdentifier")))
  {
    -[SBCaptureButtonSettings zoomUpScaleSettings](self->_settings, "zoomUpScaleSettings");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    -[SBCaptureDropletZoomSwitcherModifier settingsForAnimatableProperty:](&v8, sel_settingsForAnimatableProperty_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SBDropletZoomAnimatablePropertyIdentifier")))
  {
    if (v5)
      v9 = 0.0;
    else
      v9 = 1.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    -[SBCaptureDropletZoomSwitcherModifier modelValueForAnimatableProperty:currentValue:creating:](&v12, sel_modelValueForAnimatableProperty_currentValue_creating_, v8, v5, a4);
    v9 = v10;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomupAnimationToken, 0);
  objc_storeStrong((id *)&self->_preludeAnimationToken, 0);
  objc_storeStrong((id *)&self->_zoomModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
