@implementation SBHomeGestureToStashedFloatingSwitcherModifier

- (SBHomeGestureToStashedFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toFloatingConfiguration:(int64_t)a5
{
  id v9;
  SBHomeGestureToStashedFloatingSwitcherModifier *v10;
  SBHomeGestureToStashedFloatingSwitcherModifier *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBHomeGestureToStashedFloatingSwitcherModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v13, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fromAppLayout, a4);
    v11->_floatingConfiguration = a5;
  }

  return v11;
}

- (CGRect)containerViewBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t floatingConfiguration;
  int v14;
  uint64_t v15;
  int64_t v16;
  int v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  v24.receiver = self;
  v24.super_class = (Class)SBHomeGestureToStashedFloatingSwitcherModifier;
  -[SBHomeGestureToStashedFloatingSwitcherModifier containerViewBounds](&v24, sel_containerViewBounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBHomeGestureToStashedFloatingSwitcherModifier _tongueScale](self, "_tongueScale");
  v12 = v11;
  floatingConfiguration = self->_floatingConfiguration;
  v14 = -[SBHomeGestureToStashedFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  v15 = 3;
  if (v14)
    v15 = 4;
  if (floatingConfiguration == v15)
  {
    v4 = v8 * -0.5 + v8 * -0.5 * v12;
  }
  else
  {
    v16 = self->_floatingConfiguration;
    v17 = -[SBHomeGestureToStashedFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v18 = 3;
    if (!v17)
      v18 = 4;
    if (v16 == v18)
    {
      -[SBHomeGestureToStashedFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
      v4 = v19 - v8 * 0.5 + v8 * 0.5 * v12;
    }
  }
  v20 = v4;
  v21 = v6;
  v22 = v8;
  v23 = v10;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (double)_tongueScale
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeGestureToStashedFloatingSwitcherModifier;
  -[SBHomeGestureToStashedFloatingSwitcherModifier containerViewBounds](&v4, sel_containerViewBounds);
  return 180.0 / v2;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v4;
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
  UIRectCornerRadii result;

  -[SBHomeGestureToStashedFloatingSwitcherModifier medusaSettings](self, "medusaSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerRadiusForFloatingApps");
  -[SBHomeGestureToStashedFloatingSwitcherModifier _tongueScale](self, "_tongueScale");
  SBRectCornerRadiiForRadius();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.topRight = v16;
  result.bottomRight = v15;
  result.bottomLeft = v14;
  result.topLeft = v13;
  return result;
}

- (unint64_t)slideOverTongueState
{
  return SBFloatingConfigurationIsStashed(self->_floatingConfiguration);
}

- (unint64_t)slideOverTongueDirection
{
  if (SBFloatingConfigurationIsLeft(self->_floatingConfiguration))
    return 2;
  else
    return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
