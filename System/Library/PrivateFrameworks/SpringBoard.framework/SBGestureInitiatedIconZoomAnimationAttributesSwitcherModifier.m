@implementation SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier

- (SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier)initWithAppLayout:(id)a3 gestureEdge:(unint64_t)a4 liftOffVelocity:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *v11;
  SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *v12;
  objc_super v14;

  y = a5.y;
  x = a5.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  v11 = -[SBSwitcherModifier init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appLayout, a3);
    v12->_gestureEdge = a4;
    v12->_liftOffVelocity.x = x;
    v12->_liftOffVelocity.y = y;
  }

  return v12;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *iconGridSizeClass;
  BOOL v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  SBTimerEventSwitcherEventResponse *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTransitionEvent:](&v17, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v17.receiver, v17.super_class);

  if (v6 == 2)
  {
    -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier homeScreenIconGridSizeClassForAppLayout:](self, "homeScreenIconGridSizeClassForAppLayout:", self->_appLayout);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    iconGridSizeClass = self->_iconGridSizeClass;
    self->_iconGridSizeClass = v7;

    v9 = self->_iconGridSizeClass > (NSString *)*MEMORY[0x1E0DAA750];
    self->_overshootScaleForWidgetZoomDown = v9;
    if (v9)
    {
      -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier switcherSettings](self, "switcherSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "animationSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "zoomDownWidgetScaleOvershootDuration");
      v13 = v12;

      v14 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("OvershootScaleForWidgetZoomDown"), v13);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v14, v5);
      v15 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v15;
    }
  }
  return v5;
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
  v10.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("OvershootScaleForWidgetZoomDown"));
  if ((_DWORD)v4)
  {
    self->_overshootScaleForWidgetZoomDown = 0;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  SBAppLayout *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier scaleForIndex:](&v21, sel_scaleForIndex_);
  v6 = v5;
  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v8 == self->_appLayout && self->_overshootScaleForWidgetZoomDown)
  {
    -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier switcherSettings](self, "switcherSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "zoomDownWidgetScaleVelocityYMinimum");
    v12 = v11;
    objc_msgSend(v10, "zoomDownWidgetScaleVelocityYMaximum");
    v14 = v13;
    objc_msgSend(v10, "zoomDownWidgetScaleOvershootMinimumMultiplier");
    v16 = v15;
    objc_msgSend(v10, "zoomDownWidgetScaleOvershootMaximumMultiplier");
    v18 = v16 + (v17 - v16) * (-self->_liftOffVelocity.y - v12) / (v14 - v12);
    if (v16 >= v17)
      v19 = v16;
    else
      v19 = v17;
    if (v16 <= v17)
      v17 = v16;
    if (v18 > v19)
      v18 = v19;
    if (v18 >= v17)
      v17 = v18;
    v6 = v6 * v17;

  }
  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier;
  v4 = a3;
  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy", v12.receiver, v12.super_class);

  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayoutSettings:", v7);

  v8 = objc_msgSend(v4, "switcherLayoutElementType");
  if (!v8)
  {
    -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _positionSettings](self, "_positionSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPositionSettings:", v9);

    -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _scaleSettings](self, "_scaleSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScaleSettings:", v10);

  }
  return v6;
}

- (id)_layoutSettings
{
  void *v3;
  void *v4;
  NSString *iconGridSizeClass;
  uint64_t v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
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

  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  iconGridSizeClass = self->_iconGridSizeClass;
  if (iconGridSizeClass == (NSString *)*MEMORY[0x1E0DAA7A0]
    || -[NSString isEqualToString:](iconGridSizeClass, "isEqualToString:"))
  {
    objc_msgSend(v4, "homeGestureSmallWidgetZoomDownLayoutSettings");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self->_iconGridSizeClass;
    if (v7 == (NSString *)*MEMORY[0x1E0DAA770] || -[NSString isEqualToString:](v7, "isEqualToString:"))
    {
      objc_msgSend(v4, "homeGestureMediumWidgetZoomDownLayoutSettings");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = self->_iconGridSizeClass;
      if (v8 != (NSString *)*MEMORY[0x1E0DAA768] && !-[NSString isEqualToString:](v8, "isEqualToString:"))
      {
        v9 = self->_iconGridSizeClass;
        if (v9 != (NSString *)*MEMORY[0x1E0DAA778] && !-[NSString isEqualToString:](v9, "isEqualToString:"))
        {
          v10 = self->_iconGridSizeClass;
          if (v10 != (NSString *)*MEMORY[0x1E0DAA758] && !-[NSString isEqualToString:](v10, "isEqualToString:"))
          {
            objc_msgSend(v4, "homeGestureTopRowZoomDownLayoutSettings");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "homeGestureBottomRowZoomDownLayoutSettings");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _normalizedHomeScreenIconZoomPercentBetweenTopAndBottom](self, "_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom");
            -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _settingsByInterpolatingBetween:and:progress:](self, "_settingsByInterpolatingBetween:and:progress:", v13, v14);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "zoomDownVelocityYMinimum");
            v16 = v15;
            objc_msgSend(v4, "zoomDownVelocityYMaximum");
            v18 = v17;
            objc_msgSend(v4, "zoomDownVelocityYLayoutResponseMultiplier");
            v20 = v19;
            v21 = fmin(fmax((-self->_liftOffVelocity.y - v16) / (v18 - v16) + 0.0, 0.0), 1.0);
            objc_msgSend(v11, "response");
            objc_msgSend(v11, "setResponse:", ((v20 + -1.0) * v21 + 1.0) * v22);

            goto LABEL_15;
          }
        }
      }
      objc_msgSend(v4, "homeGestureLargeWidgetZoomDownLayoutSettings");
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  v11 = (void *)v6;
LABEL_15:

  return v11;
}

- (id)_positionSettings
{
  void *v3;
  void *v4;
  NSString *iconGridSizeClass;
  uint64_t v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CAFrameRateRange v22;

  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  iconGridSizeClass = self->_iconGridSizeClass;
  if (iconGridSizeClass == (NSString *)*MEMORY[0x1E0DAA7A0]
    || -[NSString isEqualToString:](iconGridSizeClass, "isEqualToString:"))
  {
    objc_msgSend(v4, "homeGestureSmallWidgetZoomDownPositionSettings");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self->_iconGridSizeClass;
    if (v7 == (NSString *)*MEMORY[0x1E0DAA770] || -[NSString isEqualToString:](v7, "isEqualToString:"))
    {
      objc_msgSend(v4, "homeGestureMediumWidgetZoomDownPositionSettings");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = self->_iconGridSizeClass;
      if (v8 != (NSString *)*MEMORY[0x1E0DAA768] && !-[NSString isEqualToString:](v8, "isEqualToString:"))
      {
        v9 = self->_iconGridSizeClass;
        if (v9 != (NSString *)*MEMORY[0x1E0DAA758] && !-[NSString isEqualToString:](v9, "isEqualToString:"))
        {
          objc_msgSend(v4, "homeGestureTopRowZoomDownPositionSettings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "homeGestureBottomRowZoomDownPositionSettings");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _normalizedHomeScreenIconZoomPercentBetweenTopAndBottom](self, "_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom");
          -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _settingsByInterpolatingBetween:and:progress:](self, "_settingsByInterpolatingBetween:and:progress:", v12, v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "zoomDownVelocityXMinimum");
          v15 = v14;
          objc_msgSend(v4, "zoomDownVelocityXMaximum");
          v17 = v16;
          objc_msgSend(v4, "zoomDownVelocityXPositionResponseMultiplier");
          v19 = v18;
          v20 = fmin(fmax((fabs(self->_liftOffVelocity.x) - v15) / (v17 - v15) + 0.0, 0.0), 1.0);
          objc_msgSend(v10, "response");
          objc_msgSend(v10, "setResponse:", ((v19 + -1.0) * v20 + 1.0) * v21);
          v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
          objc_msgSend(v10, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);

          goto LABEL_13;
        }
      }
      objc_msgSend(v4, "homeGestureLargeWidgetZoomDownPositionSettings");
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = (void *)v6;
LABEL_13:

  return v10;
}

- (id)_scaleSettings
{
  void *v3;
  void *v4;
  NSString *iconGridSizeClass;
  uint64_t v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v12;
  void *v13;

  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  iconGridSizeClass = self->_iconGridSizeClass;
  if (iconGridSizeClass == (NSString *)*MEMORY[0x1E0DAA7A0]
    || -[NSString isEqualToString:](iconGridSizeClass, "isEqualToString:"))
  {
    objc_msgSend(v4, "homeGestureSmallWidgetZoomDownScaleSettings");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self->_iconGridSizeClass;
    if (v7 == (NSString *)*MEMORY[0x1E0DAA770] || -[NSString isEqualToString:](v7, "isEqualToString:"))
    {
      objc_msgSend(v4, "homeGestureMediumWidgetZoomDownScaleSettings");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = self->_iconGridSizeClass;
      if (v8 != (NSString *)*MEMORY[0x1E0DAA768] && !-[NSString isEqualToString:](v8, "isEqualToString:"))
      {
        v9 = self->_iconGridSizeClass;
        if (v9 != (NSString *)*MEMORY[0x1E0DAA758] && !-[NSString isEqualToString:](v9, "isEqualToString:"))
        {
          objc_msgSend(v4, "homeGestureTopRowZoomDownScaleSettings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "homeGestureBottomRowZoomDownScaleSettings");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _normalizedHomeScreenIconZoomPercentBetweenTopAndBottom](self, "_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom");
          -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier _settingsByInterpolatingBetween:and:progress:](self, "_settingsByInterpolatingBetween:and:progress:", v12, v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      objc_msgSend(v4, "homeGestureLargeWidgetZoomDownScaleSettings");
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = (void *)v6;
LABEL_13:

  return v10;
}

- (id)_settingsByInterpolatingBetween:(id)a3 and:(id)a4 progress:(double)a5
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  CAFrameRateRange v11;

  v6 = (objc_class *)MEMORY[0x1E0DA9E08];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setDefaultValues");
  objc_msgSend(v8, "dampingRatio");
  objc_msgSend(v7, "dampingRatio");
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v9, "setDampingRatio:");
  objc_msgSend(v8, "response");
  objc_msgSend(v7, "response");
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v9, "setResponse:");
  objc_msgSend(v8, "retargetImpulse");

  objc_msgSend(v7, "retargetImpulse");
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v9, "setRetargetImpulse:");
  v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114115, *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);
  return v9;
}

- (double)_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double result;
  double v19;
  CGAffineTransform v20;
  CGRect v21;

  if ((unint64_t)(-[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation")- 1) >= 2)v3 = 0.0;
  else
    v3 = 102.0;
  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v19 = v4;
  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", self->_appLayout);

  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier frameForIndex:](self, "frameForIndex:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v6);
  v16 = v15;
  UIRectGetCenter();
  CGAffineTransformMakeScale(&v20, v16, v16);
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  CGRectApplyAffineTransform(v21, &v20);
  SBUnintegralizedRectCenteredAboutPoint();
  UIRectGetCenter();
  result = (v17 - v3) / (v19 - v3);
  if (self->_gestureEdge == 1)
    return 1.0 - result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconGridSizeClass, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
