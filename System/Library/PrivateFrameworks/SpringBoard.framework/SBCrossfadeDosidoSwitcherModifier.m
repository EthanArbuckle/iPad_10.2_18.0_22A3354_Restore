@implementation SBCrossfadeDosidoSwitcherModifier

- (SBCrossfadeDosidoSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v9;
  id v10;
  SBCrossfadeDosidoSwitcherModifier *v11;
  SBCrossfadeDosidoSwitcherModifier *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v14, sel_initWithTransitionID_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fromAppLayout, a4);
    objc_storeStrong((id *)&v12->_toAppLayout, a5);
  }

  return v12;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  if (-[SBCrossfadeDosidoSwitcherModifier isFullScreenTransition](self, "isFullScreenTransition")
    && -[SBCrossfadeDosidoSwitcherModifier _isToOrFromAppLayoutAtIndex:](self, "_isToOrFromAppLayoutAtIndex:", a3))
  {
    -[SBCrossfadeDosidoSwitcherModifier containerViewBounds](self, "containerViewBounds");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    -[SBCrossfadeDosidoSwitcherModifier frameForIndex:](&v9, sel_frameForIndex_, a3);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double result;
  BOOL v6;
  objc_super v7;

  if (!-[SBCrossfadeDosidoSwitcherModifier isFullScreenTransition](self, "isFullScreenTransition")
    || (v6 = -[SBCrossfadeDosidoSwitcherModifier _isToOrFromAppLayoutAtIndex:](self, "_isToOrFromAppLayoutAtIndex:", a3),
        result = 1.0,
        !v6))
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    -[SBCrossfadeDosidoSwitcherModifier scaleForIndex:](&v7, sel_scaleForIndex_, a3, result);
  }
  return result;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = v3;
  if (self->_fromAppLayout)
    objc_msgSend(v3, "addObject:");
  if (self->_toAppLayout)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBCrossfadeDosidoSwitcherModifier _opacitySettings](self, "_opacitySettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpacitySettings:", v6);

  objc_msgSend(v5, "setUpdateMode:", 3);
  return v5;
}

- (id)_opacitySettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBCrossfadeDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crossfadeDosidoSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)homeScreenAlpha
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  objc_super v8;

  if (-[SBCrossfadeDosidoSwitcherModifier _shouldEnsureHomeScreenVisible](self, "_shouldEnsureHomeScreenVisible"))
  {
    -[SBCrossfadeDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenAlphaForMode:", 1);
    v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    -[SBCrossfadeDosidoSwitcherModifier homeScreenAlpha](&v8, sel_homeScreenAlpha);
  }
  return result;
}

- (double)homeScreenScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  objc_super v8;

  if (-[SBCrossfadeDosidoSwitcherModifier _shouldEnsureHomeScreenVisible](self, "_shouldEnsureHomeScreenVisible"))
  {
    -[SBCrossfadeDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenScaleForMode:", 1);
    v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    -[SBCrossfadeDosidoSwitcherModifier homeScreenScale](&v8, sel_homeScreenScale);
  }
  return result;
}

- (double)wallpaperScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  objc_super v8;

  if (-[SBCrossfadeDosidoSwitcherModifier _shouldEnsureHomeScreenVisible](self, "_shouldEnsureHomeScreenVisible"))
  {
    -[SBCrossfadeDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wallpaperScaleForMode:", 1);
    v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    -[SBCrossfadeDosidoSwitcherModifier wallpaperScale](&v8, sel_wallpaperScale);
  }
  return result;
}

- (double)homeScreenDimmingAlpha
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  objc_super v8;

  if (-[SBCrossfadeDosidoSwitcherModifier _shouldEnsureHomeScreenVisible](self, "_shouldEnsureHomeScreenVisible"))
  {
    -[SBCrossfadeDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenDimmingAlphaForMode:", 1);
    v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    -[SBCrossfadeDosidoSwitcherModifier homeScreenDimmingAlpha](&v8, sel_homeScreenDimmingAlpha);
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  objc_super v4;

  if (-[SBCrossfadeDosidoSwitcherModifier _shouldEnsureHomeScreenVisible](self, "_shouldEnsureHomeScreenVisible"))
    return 2;
  v4.receiver = self;
  v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  return -[SBCrossfadeDosidoSwitcherModifier homeScreenBackdropBlurType](&v4, sel_homeScreenBackdropBlurType);
}

- (double)homeScreenBackdropBlurProgress
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  objc_super v8;

  if (-[SBCrossfadeDosidoSwitcherModifier _shouldEnsureHomeScreenVisible](self, "_shouldEnsureHomeScreenVisible"))
  {
    -[SBCrossfadeDosidoSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenBlurProgressForMode:", 1);
    v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    -[SBCrossfadeDosidoSwitcherModifier homeScreenBackdropBlurProgress](&v8, sel_homeScreenBackdropBlurProgress);
  }
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  objc_super v4;

  if (-[SBCrossfadeDosidoSwitcherModifier _shouldEnsureHomeScreenVisible](self, "_shouldEnsureHomeScreenVisible"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  return -[SBCrossfadeDosidoSwitcherModifier isWallpaperRequiredForSwitcher](&v4, sel_isWallpaperRequiredForSwitcher);
}

- (BOOL)isHomeScreenContentRequired
{
  objc_super v4;

  if (-[SBCrossfadeDosidoSwitcherModifier _shouldEnsureHomeScreenVisible](self, "_shouldEnsureHomeScreenVisible"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  return -[SBCrossfadeDosidoSwitcherModifier isHomeScreenContentRequired](&v4, sel_isHomeScreenContentRequired);
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  objc_super v4;

  if (-[SBCrossfadeDosidoSwitcherModifier _shouldEnsureHomeScreenVisible](self, "_shouldEnsureHomeScreenVisible"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  return -[SBCrossfadeDosidoSwitcherModifier wallpaperStyle](&v4, sel_wallpaperStyle);
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  BOOL v10;
  double v11;
  SBCrossfadeDosidoSwitcherModifier **v12;
  double v13;
  SBCrossfadeDosidoSwitcherModifier *v15;
  SBCrossfadeDosidoSwitcherModifier *v16;

  v8 = a4;
  v9 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase");
  v10 = -[SBCrossfadeDosidoSwitcherModifier _isFromAppLayoutAtIndex:](self, "_isFromAppLayoutAtIndex:", a5);
  if (v9 > 1)
  {
    v11 = 0.0;
    if (!v10)
    {
      v11 = 1.0;
      if (!-[SBCrossfadeDosidoSwitcherModifier _isToAppLayoutAtIndex:](self, "_isToAppLayoutAtIndex:", a5))
      {
        v15 = self;
        v12 = &v15;
        goto LABEL_8;
      }
    }
  }
  else
  {
    v11 = 1.0;
    if (!v10)
    {
      v11 = 0.0;
      if (!-[SBCrossfadeDosidoSwitcherModifier _isToAppLayoutAtIndex:](self, "_isToAppLayoutAtIndex:", a5))
      {
        v16 = self;
        v12 = &v16;
LABEL_8:
        v12[1] = (SBCrossfadeDosidoSwitcherModifier *)SBCrossfadeDosidoSwitcherModifier;
        objc_msgSendSuper2((objc_super *)v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5, v15);
        v11 = v13;
      }
    }
  }

  return v11;
}

- (id)topMostLayoutElements
{
  void *v2;
  objc_super v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_toAppLayout)
  {
    v5[0] = self->_toAppLayout;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    -[SBCrossfadeDosidoSwitcherModifier topMostLayoutElements](&v4, sel_topMostLayoutElements);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (unint64_t)transactionCompletionOptions
{
  return 6;
}

- (BOOL)_isFromAppLayoutAtIndex:(unint64_t)a3
{
  SBCrossfadeDosidoSwitcherModifier *v4;
  void *v5;
  void *v6;

  if (!self->_fromAppLayout)
    return 0;
  v4 = self;
  -[SBCrossfadeDosidoSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_fromAppLayout);
  return (char)v4;
}

- (BOOL)_isToAppLayoutAtIndex:(unint64_t)a3
{
  SBCrossfadeDosidoSwitcherModifier *v4;
  void *v5;
  void *v6;

  if (!self->_toAppLayout)
    return 0;
  v4 = self;
  -[SBCrossfadeDosidoSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_toAppLayout);
  return (char)v4;
}

- (BOOL)_isToOrFromAppLayoutAtIndex:(unint64_t)a3
{
  return -[SBCrossfadeDosidoSwitcherModifier _isFromAppLayoutAtIndex:](self, "_isFromAppLayoutAtIndex:")
      || -[SBCrossfadeDosidoSwitcherModifier _isToAppLayoutAtIndex:](self, "_isToAppLayoutAtIndex:", a3);
}

- (BOOL)_shouldEnsureHomeScreenVisible
{
  return !self->_fromAppLayout || self->_toAppLayout == 0;
}

- (BOOL)isFullScreenTransition
{
  return self->_fullScreenTransition;
}

- (void)setFullScreenTransition:(BOOL)a3
{
  self->_fullScreenTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_homeScreenModifier, 0);
}

@end
