@implementation SBHomeScreenZoomSwitcherModifier

- (SBHomeScreenZoomSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4
{
  SBHomeScreenZoomSwitcherModifier *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
  result = -[SBTransitionSwitcherModifier initWithTransitionID:](&v6, sel_initWithTransitionID_, a3);
  if (result)
    result->_direction = a4;
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
  v12.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "switcherLayoutElementType", v12.receiver, v12.super_class);

  if (v6 == 1)
  {
    -[SBHomeScreenZoomSwitcherModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SBHomeScreenZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
      objc_msgSend(v8, "zoomUpSettings");
    else
      objc_msgSend(v8, "iconZoomDownSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v10, "setLayoutSettings:", v9);

    v5 = v10;
  }
  return v5;
}

- (double)homeScreenAlpha
{
  double result;
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  if (-[SBHomeScreenZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    -[SBHomeScreenZoomSwitcherModifier homeScreenAlpha](&v8, sel_homeScreenAlpha);
  }
  else
  {
    -[SBHomeScreenZoomSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeScreenOpacityInApplication");
    v7 = v6;

    return v7;
  }
  return result;
}

- (double)homeScreenBackdropBlurProgress
{
  double result;
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  if (-[SBHomeScreenZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    -[SBHomeScreenZoomSwitcherModifier homeScreenBackdropBlurProgress](&v8, sel_homeScreenBackdropBlurProgress);
  }
  else
  {
    -[SBHomeScreenZoomSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeScreenBlurInApplication");
    v7 = v6;

    return v7;
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (-[SBHomeScreenZoomSwitcherModifier hasHomeButton](self, "hasHomeButton"))
    return 1;
  else
    return 3;
}

- (double)homeScreenDimmingAlpha
{
  double result;
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  if (-[SBHomeScreenZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    -[SBHomeScreenZoomSwitcherModifier homeScreenDimmingAlpha](&v8, sel_homeScreenDimmingAlpha);
  }
  else
  {
    -[SBHomeScreenZoomSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dimmingAlphaInApplication");
    v7 = v6;

    return v7;
  }
  return result;
}

- (double)homeScreenScale
{
  double result;
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  if (-[SBHomeScreenZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    -[SBHomeScreenZoomSwitcherModifier homeScreenScale](&v8, sel_homeScreenScale);
  }
  else
  {
    -[SBHomeScreenZoomSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeScreenScaleInApplication");
    v7 = v6;

    return v7;
  }
  return result;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (double)wallpaperScale
{
  double result;
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  if (-[SBHomeScreenZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    -[SBHomeScreenZoomSwitcherModifier wallpaperScale](&v8, sel_wallpaperScale);
  }
  else
  {
    -[SBHomeScreenZoomSwitcherModifier switcherSettings](self, "switcherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wallpaperScaleInApplication");
    v7 = v6;

    return v7;
  }
  return result;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)_isEffectivelyHome
{
  _BOOL4 v3;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout") && self->_direction == 2)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout");
    if (v3)
      LOBYTE(v3) = self->_direction == 1;
  }
  return v3;
}

@end
