@implementation SBFullScreenToHomeSystemApertureSwitcherModifier

- (SBFullScreenToHomeSystemApertureSwitcherModifier)initWithTransitionID:(id)a3 zoomModifier:(id)a4 appLayout:(id)a5 direction:(unint64_t)a6 expandedCardFrame:(CGRect)a7 cardScale:(double)a8 cardVelocity:(CGPoint)a9
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v14;
  CGFloat v15;
  id v21;
  id v22;
  id v23;
  SBFullScreenToHomeSystemApertureSwitcherModifier *v24;
  SBFullScreenToHomeSystemApertureSwitcherModifier *v25;
  id *p_zoomModifier;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v35;
  CGAffineTransform v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  y = a9.y;
  x = a9.x;
  height = a7.size.height;
  width = a7.size.width;
  v14 = a7.origin.y;
  v15 = a7.origin.x;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFullScreenToHomeSystemApertureSwitcherModifier.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout != nil"));

  }
  v37.receiver = self;
  v37.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  v24 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v37, sel_initWithTransitionID_, v21);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_appLayout, a5);
    v25->_direction = a6;
    p_zoomModifier = (id *)&v25->_zoomModifier;
    objc_storeStrong((id *)&v25->_zoomModifier, a4);
    v25->_shouldClipRegionAboveSystemAperture = 1;
    if (v25->_zoomModifier)
    {
      -[SBFullScreenToHomeIconZoomSwitcherModifier setShouldUpdateIconViewVisibility:](v25->_zoomModifier, "setShouldUpdateIconViewVisibility:", 0);
      objc_msgSend(*p_zoomModifier, "setShouldMatchMoveToIconView:", 0);
      -[SBChainableModifier addChildModifier:](v25, "addChildModifier:", *p_zoomModifier);
    }
    v25->_expandedCardFrame.origin.x = v15;
    v25->_expandedCardFrame.origin.y = v14;
    v25->_expandedCardFrame.size.width = width;
    v25->_expandedCardFrame.size.height = height;
    UIRectGetCenter();
    v25->_expandedCardCenter.x = v27;
    v25->_expandedCardCenter.y = v28;
    v25->_liftOffCardVelocity.x = x;
    v25->_liftOffCardVelocity.y = y;
    v25->_initialCardScale = a8;
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "systemApertureSettings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v38.origin.x = v15;
    v38.origin.y = v14;
    v38.size.width = width;
    v38.size.height = height;
    v31 = CGRectGetWidth(v38);
    objc_msgSend(v30, "zoomToJindoYFromScreenTopToUseAlternateSettings");
    v33 = v32;
    CGAffineTransformMakeScale(&v36, a8, a8);
    v39.origin.x = v15;
    v39.origin.y = v14;
    v39.size.width = width;
    v39.size.height = height;
    CGRectApplyAffineTransform(v39, &v36);
    UIRectCenteredAboutPoint();
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    v41.size.width = v31;
    v41.size.height = v33;
    v25->_jindoIntersectsIntialCardFrame = CGRectIntersectsRect(v40, v41);

  }
  return v25;
}

- (BOOL)completesWhenChildrenComplete
{
  return self->_zoomModifier != 0;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBCoplanarSwitcherModifier *v5;
  SBCoplanarSwitcherModifier *coplanarModifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!-[SBChainableModifier containsChildModifier:](self, "containsChildModifier:", self->_coplanarModifier))
    {
      v5 = -[SBCoplanarSwitcherModifier initWithActiveAppLayout:]([SBCoplanarSwitcherModifier alloc], "initWithActiveAppLayout:", self->_appLayout);
      coplanarModifier = self->_coplanarModifier;
      self->_coplanarModifier = v5;

      -[SBCoplanarSwitcherModifier setUsesContainerViewBoundsAsActiveFrame:](self->_coplanarModifier, "setUsesContainerViewBoundsAsActiveFrame:", 1);
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_coplanarModifier);
    }
  }
}

- (id)handleRepositionProgressEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  unint64_t direction;
  int v10;
  SBUpdateLayoutSwitcherEventResponse *v11;
  uint64_t v12;
  int v13;
  SBUpdateLayoutSwitcherEventResponse *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  SBInitiateSystemApertureBounceSwitcherEventResponse *v18;
  NSUUID *suppressionIdentifier;
  uint64_t v20;
  SBUpdateLayoutSwitcherEventResponse *v21;
  uint64_t v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBSwitcherModifier handleRepositionProgressEvent:](&v24, sel_handleRepositionProgressEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_direction == 1
    && (objc_msgSend(v4, "progress"),
        objc_msgSend(v6, "zoomToJindoBeginShowingShadowThreshold"),
        BSFloatGreaterThanOrEqualToFloat())
    && (objc_msgSend(v4, "progress"),
        objc_msgSend(v6, "zoomToJindoEndShowingShadowThreshold"),
        BSFloatLessThanFloat()))
  {
    if (self->_showShadow)
      goto LABEL_9;
    self->_showShadow = 1;
  }
  else
  {
    if (!self->_showShadow)
      goto LABEL_9;
    self->_showShadow = 0;
  }
  v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
  SBAppendSwitcherModifierResponse(v7, v5);
  v8 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v8;
LABEL_9:
  direction = self->_direction;
  if (!direction)
  {
    objc_msgSend(v4, "progress");
    objc_msgSend(v6, "zoomFromJindoBeginUnblurringProgressThreshold");
    v10 = BSFloatGreaterThanOrEqualToFloat();
    if (v10 && !self->_unblurred)
    {
      self->_unblurred = v10;
      v11 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
      SBAppendSwitcherModifierResponse(v11, v5);
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
    }
    direction = self->_direction;
  }
  if (direction == 1)
  {
    objc_msgSend(v4, "progress");
    objc_msgSend(v6, "zoomToJindoTuckInThreshold");
    v13 = BSFloatGreaterThanOrEqualToFloat();
    if (v13)
    {
      if (!self->_tucked)
      {
        self->_tucked = v13;
        v14 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
        SBAppendSwitcherModifierResponse(v14, v5);
        v15 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v15;
      }
    }
  }
  v16 = self->_direction;
  if (v16 == 1)
  {
    objc_msgSend(v4, "progress");
    objc_msgSend(v6, "zoomToJindoBounceThreshold");
    v17 = BSFloatGreaterThanOrEqualToFloat();
    if (v17 && !self->_bounced)
    {
      self->_bounced = v17;
      v18 = -[SBInitiateSystemApertureBounceSwitcherEventResponse initWithAppLayout:suppressionIdentifierToInvalidate:]([SBInitiateSystemApertureBounceSwitcherEventResponse alloc], "initWithAppLayout:suppressionIdentifierToInvalidate:", self->_appLayout, self->_suppressionIdentifier);
      suppressionIdentifier = self->_suppressionIdentifier;
      self->_suppressionIdentifier = 0;

      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v18, v5);
      v20 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v20;
    }
    v16 = self->_direction;
  }
  if (!v16)
  {
    objc_msgSend(v4, "progress");
    objc_msgSend(v6, "zoomFromJindoUnmaskThreshold");
    if (BSFloatGreaterThanOrEqualToFloat())
    {
      self->_shouldClipRegionAboveSystemAperture = 0;
      v21 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
      SBAppendSwitcherModifierResponse(v21, v5);
      v22 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v22;
    }
  }

  return v5;
}

- (id)transitionWillBegin
{
  void *v3;
  NSUUID *v4;
  NSUUID *suppressionIdentifier;
  SBRequestSystemApertureElementSuppressionEventResponse *v6;
  uint64_t v7;
  unint64_t direction;
  SBInvalidateRootContentViewClippingAndBlurEventResponse *v9;
  uint64_t v10;
  SBInitiateSystemApertureStretchEventResponse *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v14, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_OWORD *)&self->_direction == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    suppressionIdentifier = self->_suppressionIdentifier;
    self->_suppressionIdentifier = v4;

    v6 = -[SBRequestSystemApertureElementSuppressionEventResponse initWithAppLayout:wantsGlobalSuppression:wantsKeyLineEnabled:invalidationIdentifier:]([SBRequestSystemApertureElementSuppressionEventResponse alloc], "initWithAppLayout:wantsGlobalSuppression:wantsKeyLineEnabled:invalidationIdentifier:", self->_appLayout, 1, 1, self->_suppressionIdentifier);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  direction = self->_direction;
  if (direction == 1)
  {
    v9 = objc_alloc_init(SBInvalidateRootContentViewClippingAndBlurEventResponse);
    SBAppendSwitcherModifierResponse(v9, v3);
    v10 = objc_claimAutoreleasedReturnValue();

    direction = self->_direction;
    v3 = (void *)v10;
  }
  if (!direction
    && (unint64_t)(-[SBFullScreenToHomeSystemApertureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation")- 3) >= 2)
  {
    v11 = objc_alloc_init(SBInitiateSystemApertureStretchEventResponse);
    SBAppendSwitcherModifierResponse(v11, v3);
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v12;
  }
  return v3;
}

- (id)transitionDidEnd
{
  void *v3;
  SBRelinquishSystemApertureElementSuppressionEventResponse *v4;
  uint64_t v5;
  NSUUID *suppressionIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v8, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_suppressionIdentifier)
  {
    v4 = -[SBRelinquishSystemApertureElementSuppressionEventResponse initWithInvalidationIdentifier:]([SBRelinquishSystemApertureElementSuppressionEventResponse alloc], "initWithInvalidationIdentifier:", self->_suppressionIdentifier);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    suppressionIdentifier = self->_suppressionIdentifier;
    self->_suppressionIdentifier = 0;

    v3 = (void *)v5;
  }
  return v3;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  _BOOL4 v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect result;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v5 = self->_direction == 0;
  else
    v5 = 0;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v6 = self->_direction == 1;
  else
    v6 = 0;
  if (-[SBFullScreenToHomeSystemApertureSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3)
    && (v5 || v6))
  {
    -[SBFullScreenToHomeSystemApertureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    SBRectWithSize();
    -[SBFullScreenToHomeSystemApertureSwitcherModifier _collapsedTransitionTargetForZoomDown:](self, "_collapsedTransitionTargetForZoomDown:", v6);
    SBUnintegralizedRectCenteredAboutPoint();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    -[SBFullScreenToHomeSystemApertureSwitcherModifier frameForIndex:](&v11, sel_frameForIndex_, a3);
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  if (-[SBFullScreenToHomeSystemApertureSwitcherModifier _shouldApplyEffectsToIndex:](self, "_shouldApplyEffectsToIndex:"))
  {
    -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenToHomeSystemApertureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    v10 = self->_expandedCardCenter.x;
    v11 = CGRectGetMidX(v23) - v10;
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v12 = v11 / CGRectGetWidth(v24) * 1.5;
    v13 = tanh(v12 + v12);
    v14 = -v13;
    if (v12 > 0.0)
      v14 = v13;
    v15 = fmin(fmax(v13 * v14, -1.0), 1.0);
    if (self->_jindoIntersectsIntialCardFrame)
      objc_msgSend(v5, "zoomToJindoStraightSwipeAlternateScale");
    else
      objc_msgSend(v5, "zoomToJindoStraightSwipeScale");
    v19 = v16;
    objc_msgSend(v5, "zoomToJindoArcSwipeScale");
    v18 = v19 + fabs(v15) * (v20 - v19);

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    -[SBFullScreenToHomeSystemApertureSwitcherModifier scaleForIndex:](&v22, sel_scaleForIndex_, a3);
    return v17;
  }
  return v18;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_appLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  if (self->_direction)
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  else
    -[SBFullScreenToHomeSystemApertureSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  unint64_t direction;
  double v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v20;
  CGRect v21;

  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
  {
    direction = self->_direction;
    v6 = 0.0;
    if (-[SBFullScreenToHomeSystemApertureSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3)
      && direction == 1)
    {
      -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFullScreenToHomeSystemApertureSwitcherModifier containerViewBounds](self, "containerViewBounds");
      x = v20.origin.x;
      y = v20.origin.y;
      width = v20.size.width;
      height = v20.size.height;
      v12 = self->_expandedCardCenter.x;
      v13 = CGRectGetMidX(v20) - v12;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v14 = v13 / CGRectGetWidth(v21) * 1.5;
      v15 = tanh(v14 + v14);
      v16 = -v15;
      if (v14 > 0.0)
        v16 = v15;
      v17 = fmin(fmax(v15 * v16, -1.0), 1.0);
      objc_msgSend(v7, "xDeltaToRotationMappingFactor");
      v6 = v18 * v17 + 0.0;

    }
  }
  else
  {
    -[SBFullScreenToHomeSystemApertureSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3);
    return 0.0;
  }
  return v6;
}

- (id)meshTransformForIndex:(unint64_t)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  if (-[SBFullScreenToHomeSystemApertureSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:"))
  {
    if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout") && self->_direction == 1)
    {
      -[SBFullScreenToHomeSystemApertureSwitcherModifier containerViewBounds](self, "containerViewBounds");
      x = v18.origin.x;
      y = v18.origin.y;
      width = v18.size.width;
      height = v18.size.height;
      v9 = self->_expandedCardCenter.x;
      v10 = CGRectGetMidX(v18) - v9;
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v11 = v10 / CGRectGetWidth(v19) * 1.5;
      v12 = tanh(v11 + v11);
      v13 = -v12;
      if (v11 > 0.0)
        v13 = v12;
      v14 = fmin(fmax(v12 * v13, -1.0), 1.0);
      if (self->_tucked)
        -[SBFullScreenToHomeSystemApertureSwitcherModifier _tuckInAtEndMeshForNormalizedXDelta:](self, "_tuckInAtEndMeshForNormalizedXDelta:", v14);
      else
        -[SBFullScreenToHomeSystemApertureSwitcherModifier _collapseMeshForNormalizedXDelta:](self, "_collapseMeshForNormalizedXDelta:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SBFullScreenToHomeSystemApertureSwitcherModifier _expandMeshForIndex:](self, "_expandMeshForIndex:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    -[SBFullScreenToHomeSystemApertureSwitcherModifier meshTransformForIndex:](&v17, sel_meshTransformForIndex_, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (CGRect)rootContentViewMaskRect
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  objc_super v17;
  CGRect v18;
  CGRect result;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v3 = self->_direction == 1;
  else
    v3 = 0;
  if (self->_shouldClipRegionAboveSystemAperture)
  {
    v17.receiver = self;
    v17.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    -[SBFullScreenToHomeSystemApertureSwitcherModifier rootContentViewMaskRect](&v17, sel_rootContentViewMaskRect);
    -[SBFullScreenToHomeSystemApertureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    if (!v3)
    {
      -[SBFullScreenToHomeSystemApertureSwitcherModifier systemApertureDefaultFrame](self, "systemApertureDefaultFrame");
      CGRectGetMidY(v18);
      v4 = v8;
      v5 = v9;
      v6 = v10;
      v7 = v11;
    }
    CGRectGetWidth(*(CGRect *)&v4);
    UIRectInset();
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    -[SBFullScreenToHomeSystemApertureSwitcherModifier rootContentViewMaskRect](&v16, sel_rootContentViewMaskRect);
  }
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)rootContentViewBlurRadius
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  objc_super v15;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v3 = self->_direction == 0;
  else
    v3 = 0;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v4 = self->_direction == 1;
  else
    v4 = 0;
  v5 = -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout");
  v6 = v3 || v4;
  if (!v5)
  {
    if (!v6)
      goto LABEL_15;
LABEL_14:
    -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoomToFromJindoMaxBlurRadius");
    v9 = v12;

    return v9;
  }
  if ((v6 & 1) != 0)
    goto LABEL_14;
  if (self->_direction)
  {
LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    -[SBFullScreenToHomeSystemApertureSwitcherModifier rootContentViewBlurRadius](&v15, sel_rootContentViewBlurRadius);
    return v13;
  }
  -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0.0;
  if (!self->_unblurred)
  {
    objc_msgSend(v7, "zoomToFromJindoMaxBlurRadius");
    v9 = v10;
  }

  return v9;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v4 = (SBAppLayout *)a3;
  v33.receiver = self;
  v33.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v33, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v7 = self->_direction == 1;
  else
    v7 = 0;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v8 = self->_direction == 0;
  else
    v8 = 0;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v9 = self->_direction == 0;
  else
    v9 = 0;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (self->_appLayout == v4)
  {
    if (v7)
    {
      if (self->_jindoIntersectsIntialCardFrame)
      {
        objc_msgSend(v10, "zoomToJindoLayoutAlternateSettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLayoutSettings:", v16);

        objc_msgSend(v11, "zoomToJindoPositionAlternateSettings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPositionSettings:", v17);

        objc_msgSend(v11, "zoomToJindoScaleAndRotateAlternateSettings");
      }
      else
      {
        objc_msgSend(v10, "zoomToJindoLayoutSettings");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLayoutSettings:", v27);

        objc_msgSend(v11, "zoomToJindoPositionSettings");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPositionSettings:", v28);

        objc_msgSend(v11, "zoomToJindoScaleAndRotateSettings");
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setScaleSettings:", v29);

      objc_msgSend(v11, "zoomToAndFromJindoMeshSettings");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMeshSettings:", v30);

      objc_msgSend(v11, "zoomToJindoCornerRadiusSettings");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8)
      {
        objc_msgSend(v6, "setLayoutUpdateMode:", 2);
        objc_msgSend(v6, "setPositionUpdateMode:", 2);
        objc_msgSend(v6, "setScaleUpdateMode:", 2);
        objc_msgSend(v6, "setMeshUpdateMode:", 2);
        objc_msgSend(v6, "setCornerRadiusUpdateMode:", 2);
        objc_msgSend(v6, "setUpdateMode:", 2);
        goto LABEL_30;
      }
      objc_msgSend(v10, "zoomFromJindoLayoutSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLayoutSettings:", v21);

      objc_msgSend(v11, "zoomFromJindoPositionSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPositionSettings:", v22);

      objc_msgSend(v11, "zoomFromJindoScaleAndRotateSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setScaleSettings:", v23);

      objc_msgSend(v11, "zoomToAndFromJindoMeshSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMeshSettings:", v24);

      objc_msgSend(v11, "zoomFromJindoCornerRadiusSettings");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v31 = (void *)v25;
    objc_msgSend(v6, "setCornerRadiusSettings:", v25);

    goto LABEL_30;
  }
  if (-[SBAppLayout switcherLayoutElementType](v4, "switcherLayoutElementType") == 5)
  {
    if (v7)
    {
      objc_msgSend(v11, "zoomToJindoBlurAnimationSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLayoutSettings:", v12);

      objc_msgSend(v6, "setLayoutUpdateMode:", 3);
      objc_msgSend(v11, "zoomToJindoTopClippingSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setClippingSettings:", v13);

      v14 = v6;
      v15 = 3;
    }
    else
    {
      if (v8 || v9 && !self->_unblurred)
      {
        objc_msgSend(v11, "zoomFromJindoBlurAnimationSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLayoutSettings:", v18);

        v19 = v6;
        v20 = 1;
      }
      else
      {
        objc_msgSend(v11, "zoomFromJindoBlurAnimationSettings");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLayoutSettings:", v26);

        v19 = v6;
        v20 = 3;
      }
      objc_msgSend(v19, "setLayoutUpdateMode:", v20);
      v14 = v6;
      v15 = 2;
    }
    objc_msgSend(v14, "setClippingUpdateMode:", v15);
  }
LABEL_30:

  return v6;
}

- (CGPoint)expandedSourcePositionForSystemApertureTransition
{
  double x;
  double y;
  objc_super v5;
  CGPoint result;

  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier expandedSourcePositionForSystemApertureTransition](&v5, sel_expandedSourcePositionForSystemApertureTransition);
  -[SBFullScreenToHomeSystemApertureSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout") && self->_direction == 1)
  {
    x = self->_expandedCardCenter.x;
    y = self->_expandedCardCenter.y;
  }
  else
  {
    UIRectGetCenter();
  }
  result.y = y;
  result.x = x;
  return result;
}

- (id)repositionProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  v6 = a4;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier repositionProgressNotificationsForLayoutRole:inAppLayout:](&v26, sel_repositionProgressNotificationsForLayoutRole_inAppLayout_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v8 = self->_direction == 1;
  else
    v8 = 0;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBAppLayout isEqual:](self->_appLayout, "isEqual:", v6);

  if (v10)
  {
    if (v8)
    {
      objc_msgSend(v9, "zoomToJindoBeginShowingShadowThreshold");
      v12 = v11;
      objc_msgSend(v9, "zoomToJindoEndShowingShadowThreshold");
      v14 = v13;
      objc_msgSend(v9, "zoomToJindoBounceThreshold");
      v16 = v15;
      objc_msgSend(v9, "zoomToJindoTuckInThreshold");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v19;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v20 = objc_claimAutoreleasedReturnValue();
      v28[3] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setByAddingObjectsFromArray:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v20;
    }
    else
    {
      objc_msgSend(v9, "zoomToJindoBounceThreshold");
      v24 = v23;
      objc_msgSend(v9, "zoomFromJindoBeginUnblurringProgressThreshold");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setByAddingObjectsFromArray:", v19);
      v22 = objc_claimAutoreleasedReturnValue();
    }

    v7 = (void *)v22;
  }

  return v7;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
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
  double v18;
  double v19;
  UIRectCornerRadii result;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v5 = self->_direction == 0;
  else
    v5 = 0;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v6 = self->_direction == 1;
  else
    v6 = 0;
  if (-[SBFullScreenToHomeSystemApertureSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3)
    && (v5 || v6))
  {
    -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoomToFromJindoMaxCornerRadius");
    SBRectCornerRadiiForRadius();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v16 = v9;
    v17 = v11;
    v18 = v13;
    v19 = v15;
  }
  else
  {
    -[SBFullScreenToHomeSystemApertureSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    SBRectCornerRadiiForRadius();
  }
  result.topRight = v19;
  result.bottomRight = v18;
  result.bottomLeft = v17;
  result.topLeft = v16;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 1.0;
  if (!-[SBFullScreenToHomeSystemApertureSwitcherModifier _shouldApplyEffectsToIndex:](self, "_shouldApplyEffectsToIndex:", a5))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
    -[SBFullScreenToHomeSystemApertureSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return self->_direction != 1;
}

- (id)systemApertureTransitioningAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier systemApertureTransitioningAppLayouts](&v6, sel_systemApertureTransitioningAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_appLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)systemApertureRequiresHeavyShadowForTransition
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  return -[SBFullScreenToHomeSystemApertureSwitcherModifier systemApertureRequiresHeavyShadowForTransition](&v4, sel_systemApertureRequiresHeavyShadowForTransition)|| self->_showShadow;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSystemApertureSwitcherModifier;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier topMostLayoutElements](&v6, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_appLayout, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_systemApertureSettings
{
  void *v2;
  void *v3;

  -[SBFullScreenToHomeSystemApertureSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApertureSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGPoint)_collapsedTransitionTargetForZoomDown:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double Height;
  double v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  CGPoint result;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v3 = a3;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  SBRectWithSize();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  UIRectGetCenter();
  v14 = v13;
  v16 = v15;
  if (v3)
  {
    -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37.origin.x = v6;
    v37.origin.y = v8;
    v37.size.width = v10;
    v37.size.height = v12;
    Height = CGRectGetHeight(v37);
    objc_msgSend(v17, "zoomToJindoTargetYDisplacement");
    v34 = v16 - Height * v19;
    -[SBFullScreenToHomeSystemApertureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    v35 = v14;
    v23 = v38.size.height;
    v32 = self->_expandedCardCenter.x;
    v33 = CGRectGetMidX(v38) - v32;
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = v23;
    v24 = v33 / CGRectGetWidth(v39) * 1.5;
    v25 = tanh(v24 + v24);
    v26 = -v25;
    if (v24 > 0.0)
      v26 = v25;
    v27 = fmin(fmax(v25 * v26, -1.0), 1.0);
    v40.origin.x = v6;
    v40.origin.y = v8;
    v40.size.width = v10;
    v40.size.height = v12;
    v28 = CGRectGetWidth(v40);
    objc_msgSend(v17, "zoomToJindoTargetXDisplacement");
    v14 = v35 + v28 * v29 * v27;

    v30 = v34;
  }
  else
  {
    v41.origin.x = v6;
    v41.origin.y = v8;
    v41.size.width = v10;
    v41.size.height = v12;
    v30 = v16 + CGRectGetHeight(v41) * -0.5;
  }
  v31 = v14;
  result.y = v30;
  result.x = v31;
  return result;
}

- (BOOL)_shouldApplyEffectsToIndex:(unint64_t)a3
{
  _BOOL4 v5;

  v5 = -[SBFullScreenToHomeSystemApertureSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome");
  if (v5)
    LOBYTE(v5) = -[SBFullScreenToHomeSystemApertureSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3);
  return v5;
}

- (BOOL)_isIndexZoomAppLayout:(unint64_t)a3
{
  SBFullScreenToHomeSystemApertureSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_appLayout);
  return (char)v4;
}

- (BOOL)_isEffectivelyHome
{
  BOOL v3;
  BOOL v4;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v3 = self->_direction == 0;
  else
    v3 = 0;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v4 = self->_direction == 1;
  else
    v4 = 0;
  return v3 || v4;
}

- (id)_collapseMeshForNormalizedXDelta:(double)a3
{
  double v3;
  _QWORD v11[2];
  double v12;
  double v13;
  __int128 v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v11[1] = 0;
  if (a3 <= 0.0)
  {
    v12 = a3 * 0.9 + 0.0 + 0.1;
    v13 = a3 * -0.2 + 0.0;
    v14 = xmmword_1D0E89140;
    v15 = 0;
    v16 = a3 + 0.5;
    v17 = 0;
    v3 = 1.2;
  }
  else
  {
    v12 = a3 * 1.2 + 0.0 + 0.1;
    v13 = a3 * -0.2 + 0.0;
    v14 = xmmword_1D0E89140;
    v15 = 0;
    v16 = a3 + 0.5;
    v17 = 0;
    v3 = 0.9;
  }
  v18 = xmmword_1D0E89150;
  v19 = 0;
  v20 = a3 * v3 + 1.0 + -0.1;
  v21 = a3 * 0.2 + 0.0;
  v22 = 0;
  v23 = 0;
  v24 = xmmword_1D0E89160;
  v25 = xmmword_1D0E89170;
  __asm { FMOV            V1.2D, #0.5 }
  v26 = _Q1;
  v27 = _Q1;
  v28 = xmmword_1D0E89180;
  v29 = xmmword_1D0E89190;
  v31 = 0;
  v32 = 0;
  v30 = 0x3FE0000000000000;
  v33 = xmmword_1D0E891A0;
  v34 = a3 * 0.1 + 1.1;
  v35 = xmmword_1D0E89140;
  v36 = xmmword_1D0E891B0;
  __asm { FMOV            V2.2D, #1.0 }
  v37 = xmmword_1D0E891C0;
  v38 = _Q2;
  v39 = 0x3FF0000000000000;
  v40 = v34;
  v41 = 0;
  v42 = xmmword_1D0E891D0;
  v43 = 0;
  v44 = 0;
  v45 = xmmword_1D0E891E0;
  v46 = 0;
  v47 = 0;
  v48 = xmmword_1D0E891F0;
  v49 = 0;
  v50 = 0;
  v51 = xmmword_1D0E89200;
  v52 = 0;
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 9, v11, 4, &v42, *MEMORY[0x1E0CD2A90]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_tuckInAtEndMeshForNormalizedXDelta:(double)a3
{
  void *v4;
  void *v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  -[SBFullScreenToHomeSystemApertureSwitcherModifier _collapseMeshForNormalizedXDelta:](self, "_collapseMeshForNormalizedXDelta:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  if (v4)
  {
    objc_msgSend(v4, "vertexAtIndex:", 6);
    v12 = 0;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "vertexAtIndex:", 8);
  }
  else
  {
    v12 = 0;
    v10 = 0uLL;
    v11 = 0uLL;
  }
  *(double *)&v14 = 0.06 - a3 * 0.2;
  *(double *)&v11 = 0.94 - a3 * 0.2;
  v7 = v13;
  v8 = v14;
  v9 = v15;
  objc_msgSend(v5, "replaceVertexAtIndex:withVertex:", 6, &v7);
  v7 = v10;
  v8 = v11;
  v9 = v12;
  objc_msgSend(v5, "replaceVertexAtIndex:withVertex:", 8, &v7);

  return v5;
}

- (id)_blurItemContainerParameters
{
  void *v3;
  unint64_t direction;
  SBBlurItemContainerParameters *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  SBBlurItemContainerParameters *v11;

  -[SBFullScreenToHomeSystemApertureSwitcherModifier _systemApertureSettings](self, "_systemApertureSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  direction = self->_direction;
  v5 = [SBBlurItemContainerParameters alloc];
  objc_msgSend(v3, "zoomToFromJindoMaxBlurRadius");
  v7 = v6;
  -[SBFullScreenToHomeSystemApertureSwitcherModifier screenScale](self, "screenScale");
  v9 = v8;
  if (direction == 1)
    objc_msgSend(v3, "zoomToJindoBlurAnimationSettings");
  else
    objc_msgSend(v3, "zoomFromJindoBlurAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBBlurItemContainerParameters initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:](v5, "initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:", 1, 1, 1, v10, v7, v9);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressionIdentifier, 0);
  objc_storeStrong((id *)&self->_zoomModifier, 0);
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
