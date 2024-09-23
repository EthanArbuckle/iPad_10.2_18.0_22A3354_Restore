@implementation SBBannerUnfurlToFullScreenSwitcherModifier

- (SBBannerUnfurlToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 bannerUnfurlSourceContext:(id)a6
{
  id v12;
  id v13;
  id v14;
  SBBannerUnfurlToFullScreenSwitcherModifier *v15;
  void *v17;
  objc_super v18;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  v15 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, a3);
  if (v15)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBBannerUnfurlToFullScreenSwitcherModifier.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

    }
    objc_storeStrong((id *)&v15->_fromAppLayout, a4);
    objc_storeStrong((id *)&v15->_toAppLayout, a5);
    objc_storeStrong((id *)&v15->_bannerUnfurlSourceContext, a6);
  }

  return v15;
}

- (id)transitionWillBegin
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SBInjectVelocitySwitcherEventResponse *v17;
  void *v18;
  SBInjectVelocitySwitcherEventResponse *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v22, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 6, 2);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v5);

  -[SBBannerUnfurlSourceContext referenceVelocity](self->_bannerUnfurlSourceContext, "referenceVelocity");
  v7 = v6;
  v9 = v8;
  v10 = -[SBBannerUnfurlToFullScreenSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  v11 = -v9;
  v12 = -v7;
  if (v10 == 2)
    v13 = -v9;
  else
    v13 = v9;
  if (v10 == 2)
    v14 = -v7;
  else
    v14 = v7;
  if (v10 == 3)
  {
    v15 = v9;
  }
  else
  {
    v12 = v13;
    v15 = v14;
  }
  if (v10 != 4)
  {
    v7 = v12;
    v11 = v15;
  }
  if (v11 != *MEMORY[0x1E0C9D538] || v7 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v17 = [SBInjectVelocitySwitcherEventResponse alloc];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SBInjectVelocitySwitcherEventResponse initWithVelocity:forKey:appLayout:](v17, "initWithVelocity:forKey:appLayout:", v18, CFSTR("position"), self->_toAppLayout);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v19);

  }
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)transitionWillUpdate
{
  void *v3;
  void *v4;
  void *v5;
  SBTimerEventSwitcherEventResponse *v6;
  double v7;
  double v8;
  SBTimerEventSwitcherEventResponse *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v18, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_fromAppLayout && !self->_isScalingDown)
  {
    self->_isScalingDown = 1;
    -[SBBannerUnfurlToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v6 = [SBTimerEventSwitcherEventResponse alloc];
    objc_msgSend(v5, "dosidoScaleUpDelay");
    v8 = v7;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __66__SBBannerUnfurlToFullScreenSwitcherModifier_transitionWillUpdate__block_invoke;
    v15 = &unk_1E8EA3468;
    objc_copyWeak(&v16, &location);
    v9 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v6, "initWithDelay:validator:reason:", &v12, CFSTR("_SBBannerUnfurlToFullScreenSwitcherModifierTimerReasonScaleUp"), v8);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v3, v12, v13, v14, v15);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

    v3 = (void *)v10;
  }
  return v3;
}

BOOL __66__SBBannerUnfurlToFullScreenSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
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
  v10.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("_SBBannerUnfurlToFullScreenSwitcherModifierTimerReasonScaleUp"));
  if ((_DWORD)v4)
  {
    self->_isScalingDown = 0;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  -[SBBannerUnfurlToFullScreenSwitcherModifier frameForIndex:](&v21, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[SBBannerUnfurlToFullScreenSwitcherModifier _isAppLayout:atIndex:](self, "_isAppLayout:atIndex:", self->_toAppLayout, a3))
  {
    if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    {
      -[SBBannerUnfurlSourceContext referenceFrame](self->_bannerUnfurlSourceContext, "referenceFrame");
      -[SBBannerUnfurlSourceContext referenceCoordinateSpaceBounds](self->_bannerUnfurlSourceContext, "referenceCoordinateSpaceBounds");
      -[SBBannerUnfurlToFullScreenSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
      _UIWindowConvertRectFromOrientationToOrientation();
LABEL_6:
      v6 = v13;
      v8 = v14;
      v10 = v15;
      v12 = v16;
    }
  }
  else if (-[SBBannerUnfurlToFullScreenSwitcherModifier _isAppLayout:atIndex:](self, "_isAppLayout:atIndex:", self->_fromAppLayout, a3))
  {
    -[SBBannerUnfurlToFullScreenSwitcherModifier containerViewBounds](self, "containerViewBounds");
    goto LABEL_6;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "switcherLayoutElementType", v12.receiver, v12.super_class);

  if (!v6)
  {
    -[SBBannerUnfurlToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "bannerUnfurlSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLayoutSettings:", v10);

    v5 = v9;
  }
  return v5;
}

- (int64_t)backdropBlurType
{
  if (-[SBBannerUnfurlToFullScreenSwitcherModifier hasHomeButton](self, "hasHomeButton"))
    return 1;
  else
    return 3;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  -[SBBannerUnfurlToFullScreenSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "addObject:", self->_toAppLayout);
  if (self->_fromAppLayout)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  objc_super v6;

  if (-[SBBannerUnfurlToFullScreenSwitcherModifier _isAppLayout:atIndex:](self, "_isAppLayout:atIndex:", self->_toAppLayout, a3))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  return -[SBBannerUnfurlToFullScreenSwitcherModifier shouldScaleOverlayToFillBoundsAtIndex:](&v6, sel_shouldScaleOverlayToFillBoundsAtIndex_, a3);
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double v7;
  double v8;
  double result;
  BOOL v10;
  _BOOL4 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  -[SBBannerUnfurlToFullScreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, a4);
  v8 = v7;
  if (!-[SBBannerUnfurlToFullScreenSwitcherModifier _isAppLayout:atIndex:](self, "_isAppLayout:atIndex:", self->_toAppLayout, a5)|| (v10 = -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"), result = 1.0, !v10))
  {
    v11 = -[SBBannerUnfurlToFullScreenSwitcherModifier _isAppLayout:atIndex:](self, "_isAppLayout:atIndex:", self->_fromAppLayout, a5, result);
    result = 1.0;
    if (!v11)
      return v8;
  }
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIRectCornerRadii result;

  if (-[SBBannerUnfurlToFullScreenSwitcherModifier _isAppLayout:atIndex:](self, "_isAppLayout:atIndex:", self->_toAppLayout, a3)&& -[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    -[SBBannerUnfurlSourceContext cornerRadius](self->_bannerUnfurlSourceContext, "cornerRadius");
  }
  else
  {
    -[SBBannerUnfurlToFullScreenSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  }
  SBRectCornerRadiiForRadius();
  result.topRight = v7;
  result.bottomRight = v6;
  result.bottomLeft = v5;
  result.topLeft = v4;
  return result;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  return 0;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  objc_super v4;

  if (self->_toAppLayout == a3)
  {
    return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
    return (SBSwitcherAsyncRenderingAttributes)-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v4, sel_asyncRenderingAttributesForAppLayout_);
  }
}

- (BOOL)_isAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SBBannerUnfurlToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "isEqual:", v6);
  return (char)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenModifier, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlSourceContext, 0);
}

@end
