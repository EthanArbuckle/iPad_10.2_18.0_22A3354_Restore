@implementation SBFullScreenToHomeIconZoomSwitcherModifier

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  UIRectCornerRadii result;

  if (-[SBFullScreenToHomeIconZoomSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:")
    && -[SBFullScreenToHomeIconZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome"))
  {
    -[SBFullScreenToHomeIconZoomSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier cornerRadiiForIndex:](&v9, sel_cornerRadiiForIndex_, a3);
  }
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect *p_homeScreenIconFrame;
  int v10;
  double v11;
  double width;
  double result;
  objc_super v14;
  objc_super v15;

  if (-[SBFullScreenToHomeIconZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome")
    && -[SBFullScreenToHomeIconZoomSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier frameForIndex:](&v15, sel_frameForIndex_, a3);
    v6 = v5;
    v8 = v7;
    p_homeScreenIconFrame = &self->_homeScreenIconFrame;
    v10 = BSFloatGreaterThanFloat();
    if (v6 <= v8)
      v11 = v6;
    else
      v11 = v8;
    if (v10)
      v11 = v6;
    width = p_homeScreenIconFrame->size.width;
    if (width < p_homeScreenIconFrame->size.height)
      width = p_homeScreenIconFrame->size.height;
    return width / v11;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier scaleForIndex:](&v14, sel_scaleForIndex_, a3);
  }
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
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
  objc_super v24;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBFullScreenToHomeIconZoomSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v24, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (-[SBFullScreenToHomeIconZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome")
    && objc_msgSend(v11, "isEqual:", self->_appLayout))
  {
    if (v17 > width)
      v17 = width;
    if (v19 > height)
      v19 = height;
  }

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  objc_super v10;
  CGRect result;

  if (-[SBFullScreenToHomeIconZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome")
    && -[SBFullScreenToHomeIconZoomSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier frameForIndex:](&v10, sel_frameForIndex_, a3);
    BSFloatGreaterThanFloat();
    UIRectGetCenter();
    SBRectWithSize();
    SBUnintegralizedRectCenteredAboutPoint();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier frameForIndex:](&v9, sel_frameForIndex_, a3);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
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

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 1.0;
  if (!-[SBFullScreenToHomeIconZoomSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a5))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v8, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBFullScreenToHomeIconZoomSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  return v5;
}

- (id)_layoutSettings
{
  if (CGRectIsNull(self->_homeScreenIconFrame))
    -[SBFullScreenToHomeIconZoomSwitcherModifier containerViewBounds](self, "containerViewBounds");
  UIRectGetCenter();
  return -[SBFullScreenToHomeIconZoomSwitcherModifier layoutSettingsForTargetCenter:](self, "layoutSettingsForTargetCenter:");
}

- (id)layoutSettingsForTargetCenter:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  -[SBFullScreenToHomeIconZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_direction)
  {
    objc_msgSend(v7, "iconZoomDownSettings");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((-[SBFullScreenToHomeIconZoomSwitcherModifier hasHomeButton](self, "hasHomeButton") & 1) == 0)
    {
      objc_msgSend(v7, "homeGestureEdgeRowZoomUpSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "homeGestureCenterRowZoomUpSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFullScreenToHomeIconZoomSwitcherModifier _normalizedHomeScreenTargetZoomPercentBetweenCenterAndEdge:](self, "_normalizedHomeScreenTargetZoomPercentBetweenCenterAndEdge:", x, y);
      -[SBFullScreenToHomeIconZoomSwitcherModifier _settingsByInterpolatingBetween:and:progress:](self, "_settingsByInterpolatingBetween:and:progress:", v11, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v7, "zoomUpSettings");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_7:

  return v9;
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
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);
  return v9;
}

- (double)_normalizedHomeScreenTargetZoomPercentBetweenCenterAndEdge:(CGPoint)a3
{
  double v3;

  -[SBFullScreenToHomeIconZoomSwitcherModifier _normalizedHomeScreenIconZoomPercentBetweenTopAndBottom:](self, "_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom:", a3.x, a3.y);
  return (v3 * 2.0 + -1.0) * (v3 * 2.0 + -1.0);
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  BOOL result;
  objc_super v6;

  result = 0;
  if (-[SBFullScreenToHomeIconZoomSwitcherModifier isDevicePad](self, "isDevicePad"))
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier frameForIndex:](&v6, sel_frameForIndex_, a3);
    SBRectWithSize();
    if ((BSFloatLessThanFloat() & 1) != 0)
      return 1;
  }
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double result;
  objc_super v8;

  if (!-[SBFullScreenToHomeIconZoomSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a4)
    || !-[SBFullScreenToHomeIconZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome")
    || !self->_shouldDockOrderFrontDuringTransition
    || self->_direction
    || (result = 0.0, !self->_homeScreenIconLocationIsFloatingDock))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v8, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4, result);
  }
  return result;
}

- (double)_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom:(CGPoint)a3
{
  double y;
  double v5;
  double v6;

  y = a3.y;
  if ((unint64_t)(-[SBFullScreenToHomeIconZoomSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation", a3.x)- 1) >= 2)v5 = 0.0;
  else
    v5 = 102.0;
  -[SBFullScreenToHomeIconZoomSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return (y - v5) / (v6 - v5);
}

- (BOOL)_isIndexZoomAppLayout:(unint64_t)a3
{
  SBFullScreenToHomeIconZoomSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBFullScreenToHomeIconZoomSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_appLayout);
  return (char)v4;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return self->_direction != 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (CGRect)fullyPresentedFrameForIndex:(unint64_t)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  objc_super v15;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (-[SBFullScreenToHomeIconZoomSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome")
    && -[SBFullScreenToHomeIconZoomSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier frameForIndex:](&v15, sel_frameForIndex_, a3);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier fullyPresentedFrameForIndex:frame:](&v14, sel_fullyPresentedFrameForIndex_frame_, a3, x, y, width, height);
  }
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBFullScreenToHomeIconZoomSwitcherModifier topMostLayoutElements](&v6, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_appLayout, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return self->_wantsDockWindowLevelAssertion;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
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
  objc_super v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = v9;
  if (self->_shouldForceDefaultAnchorPointForTransition && objc_msgSend(v9, "isEqual:", self->_appLayout))
  {
    -[SBFullScreenToHomeIconZoomSwitcherModifier appLayouts](self, "appLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenToHomeIconZoomSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v11, "indexOfObject:", self->_appLayout));
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
    v13 = v20;
    v15 = v21;
    v17 = v22;
    v19 = v23;
  }

  v24 = v13;
  v25 = v15;
  v26 = v17;
  v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v9 = 0.5, v10 = 0.5, (objc_msgSend(v7, "isEqual:", self->_appLayout) & 1) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
    v9 = v11;
    v10 = v12;
  }

  v13 = v9;
  v14 = v10;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return self->_direction == 1;
}

- (id)transitionDidEnd
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  SBRequestFolderSnapshotsSwitcherEventResponse *v5;
  SBIconOverlayVisibilitySwitcherEventResponse *v6;
  SBIconViewVisibilitySwitcherEventResponse *v7;
  SBMatchMoveToIconViewSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v11, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_direction)
  {
    if (!self->_shouldUpdateIconViewVisibility)
      return v3;
LABEL_6:
    v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
    goto LABEL_7;
  }
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = -[SBRequestFolderSnapshotsSwitcherEventResponse initWithSnapshotRequest:]([SBRequestFolderSnapshotsSwitcherEventResponse alloc], "initWithSnapshotRequest:", 0);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v5);

  if (!self->_shouldUpdateIconViewVisibility)
    goto LABEL_8;
  if (!v4)
    goto LABEL_6;
LABEL_7:
  v6 = -[SBIconOverlayVisibilitySwitcherEventResponse initWithAppLayout:visible:]([SBIconOverlayVisibilitySwitcherEventResponse alloc], "initWithAppLayout:visible:", self->_appLayout, 0);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v6);

  v7 = -[SBIconViewVisibilitySwitcherEventResponse initWithAppLayout:visible:animationSettings:excludedIconLocations:]([SBIconViewVisibilitySwitcherEventResponse alloc], "initWithAppLayout:visible:animationSettings:excludedIconLocations:", self->_appLayout, 1, 0, 0);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v7);

  v8 = -[SBMatchMoveToIconViewSwitcherEventResponse initWithDeactivatingAppLayout:]([SBMatchMoveToIconViewSwitcherEventResponse alloc], "initWithDeactivatingAppLayout:", self->_appLayout);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v8);

LABEL_8:
  if (v4)
  {
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
  return v3;
}

- (id)transitionWillBegin
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  int64_t v5;
  int v6;
  int v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  uint64_t v9;
  SBUpdateLayoutSwitcherEventResponse *v10;
  SBRequestFolderSnapshotsSwitcherEventResponse *v11;
  SBRequestFolderSnapshotsSwitcherEventResponse *v12;
  unint64_t direction;
  int v14;
  _BOOL4 homeScreenIconLocationIsFloatingDock;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  SBIconOverlayVisibilitySwitcherEventResponse *v20;
  SBIconViewVisibilitySwitcherEventResponse *v21;
  double v22;
  double v23;
  SBNotifyIconWillZoomDownSwitcherEventResponse *v24;
  SBMatchMoveToIconViewSwitcherEventResponse *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  SBTimerEventSwitcherEventResponse *v31;
  SBTimerEventSwitcherEventResponse *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  SBInjectVelocitySwitcherEventResponse *v42;
  void *v43;
  SBInjectVelocitySwitcherEventResponse *v44;
  double v45;
  double v46;
  float v47;
  float v48;
  SBTimerEventSwitcherEventResponse *v49;
  SBTimerEventSwitcherEventResponse *v50;
  void *v51;
  double v52;
  double v53;
  float v54;
  float v55;
  SBTimerEventSwitcherEventResponse *v56;
  SBTimerEventSwitcherEventResponse *v57;
  void *v58;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id location;
  objc_super v69;

  v69.receiver = self;
  v69.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v69, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = -[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenBackdropBlurType](self, "homeScreenBackdropBlurType");
  if ((-[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder") & 1) != 0)
    v6 = 1;
  else
    v6 = -[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenHasWidgetCenterOrLibraryOpen](self, "homeScreenHasWidgetCenterOrLibraryOpen");
  if (self->_direction)
  {
    if (v5 == 3)
      v7 = 0;
    else
      v7 = v6;
    v8 = [SBUpdateLayoutSwitcherEventResponse alloc];
    if (v7 == 1)
      v9 = 10;
    else
      v9 = 2;
    v11 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v8, "initWithOptions:updateMode:", v9, 2);
  }
  else
  {
    v10 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 2);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v10);

    v11 = -[SBRequestFolderSnapshotsSwitcherEventResponse initWithSnapshotRequest:]([SBRequestFolderSnapshotsSwitcherEventResponse alloc], "initWithSnapshotRequest:", 1);
  }
  v12 = v11;
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v11);

  direction = self->_direction;
  if (direction == 1)
  {
    if (self->_homeScreenIconLocationIsFloatingDock)
    {
      v14 = -[SBFullScreenToHomeIconZoomSwitcherModifier isFloatingDockFullyPresented](self, "isFloatingDockFullyPresented");
      homeScreenIconLocationIsFloatingDock = 0;
      v16 = 1;
    }
    else
    {
      v14 = 0;
      v16 = 0;
      homeScreenIconLocationIsFloatingDock = 0;
    }
  }
  else
  {
    v14 = 0;
    v16 = 0;
    homeScreenIconLocationIsFloatingDock = self->_homeScreenIconLocationIsFloatingDock;
  }
  -[SBFullScreenToHomeIconZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "animationSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v18, "floatingDockIconFadeSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  if (self->_shouldUpdateIconViewVisibility)
  {
    v20 = -[SBIconOverlayVisibilitySwitcherEventResponse initWithAppLayout:visible:]([SBIconOverlayVisibilitySwitcherEventResponse alloc], "initWithAppLayout:visible:", self->_appLayout, 1);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v20);

    v21 = -[SBIconViewVisibilitySwitcherEventResponse initWithAppLayout:visible:animationSettings:excludedIconLocations:]([SBIconViewVisibilitySwitcherEventResponse alloc], "initWithAppLayout:visible:animationSettings:excludedIconLocations:", self->_appLayout, 0, v19, 0);
    if (v14)
    {
      objc_initWeak(&location, self);
      objc_msgSend(v18, "iconZoomFloatingDockFadeDelay");
      v23 = v22;
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke;
      v66[3] = &unk_1E8EA3468;
      objc_copyWeak(&v67, &location);
      -[SBChainableModifierEventResponse setDelay:withValidator:](v21, "setDelay:withValidator:", v66, v23);
      objc_destroyWeak(&v67);
      objc_destroyWeak(&location);
    }
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v21);

  }
  if (direction == 1)
  {
    v24 = -[SBNotifyIconWillZoomDownSwitcherEventResponse initWithAppLayout:]([SBNotifyIconWillZoomDownSwitcherEventResponse alloc], "initWithAppLayout:", self->_appLayout);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v24);

    if (self->_shouldMatchMoveToIconView)
    {
      v25 = -[SBMatchMoveToIconViewSwitcherEventResponse initWithActivatingAppLayout:iconFrame:]([SBMatchMoveToIconViewSwitcherEventResponse alloc], "initWithActivatingAppLayout:iconFrame:", self->_appLayout, self->_homeScreenIconFrame.origin.x, self->_homeScreenIconFrame.origin.y, self->_homeScreenIconFrame.size.width, self->_homeScreenIconFrame.size.height);
      -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v25);

    }
  }
  if (self->_shouldAcceleratedHomeButtonPressBegin)
  {
    objc_initWeak(&location, self);
    -[SBFullScreenToHomeIconZoomSwitcherModifier _layoutSettings](self, "_layoutSettings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "settlingDuration");
    v28 = v27;
    objc_msgSend(v18, "disallowAcceleratedHomeButtonPressTransitionPercentage");
    v30 = v29;

    v31 = [SBTimerEventSwitcherEventResponse alloc];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_2;
    v64[3] = &unk_1E8EA3468;
    objc_copyWeak(&v65, &location);
    v32 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v31, "initWithDelay:validator:reason:", v64, CFSTR("kSBIconZoomDisallowAcceleratedHomeButtonPressReason"), v28 * v30);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v32);

    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);
  }
  if (v16 && self->_itemContainerOverlapsDock)
  {
    -[SBFullScreenToHomeIconZoomSwitcherModifier switcherSettings](self, "switcherSettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "animationSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "dockHurdlingIconZoomInitialVelocity");
    v36 = v35;
    -[SBFullScreenToHomeIconZoomSwitcherModifier currentVelocityValueForVisibleAppLayout:key:](self, "currentVelocityValueForVisibleAppLayout:key:", self->_appLayout, CFSTR("position"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "CGPointValue");
    v39 = v38;
    v41 = v40;

    if (v41 <= v36)
      v36 = v41;
    v42 = [SBInjectVelocitySwitcherEventResponse alloc];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v39, v36);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[SBInjectVelocitySwitcherEventResponse initWithVelocity:forKey:appLayout:](v42, "initWithVelocity:forKey:appLayout:", v43, CFSTR("position"), self->_appLayout);

    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v44);
    objc_msgSend(v34, "dockHurdlingIconZoomDockToBackTiming");
    v46 = v45;
    UIAnimationDragCoefficient();
    v48 = v47;
    objc_initWeak(&location, self);
    v49 = [SBTimerEventSwitcherEventResponse alloc];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_3;
    v62[3] = &unk_1E8EA3468;
    objc_copyWeak(&v63, &location);
    v50 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v49, "initWithDelay:validator:reason:", v62, CFSTR("kSBIconZoomSwitcherModifierTakeDockWindowLevelAssertionReason"), v46 * v48);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v50);

    objc_destroyWeak(&v63);
    objc_destroyWeak(&location);

    goto LABEL_38;
  }
  if (homeScreenIconLocationIsFloatingDock && self->_shouldDockOrderFrontDuringTransition)
  {
    -[SBFullScreenToHomeIconZoomSwitcherModifier switcherSettings](self, "switcherSettings");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "animationSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "dockHurdlingIconZoomDockToFrontTiming");
    v53 = v52;
    UIAnimationDragCoefficient();
    v55 = v54;
    objc_initWeak(&location, self);
    v56 = [SBTimerEventSwitcherEventResponse alloc];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_4;
    v60[3] = &unk_1E8EA3468;
    objc_copyWeak(&v61, &location);
    v57 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v56, "initWithDelay:validator:reason:", v60, CFSTR("kSBIconZoomSwitcherModifierRelinquishDockWindowLevelAssertionReason"), v53 * v55);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v57);

    objc_destroyWeak(&v61);
    objc_destroyWeak(&location);
LABEL_38:

  }
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (double)homeScreenAlpha
{
  int64_t v3;
  double result;
  int v5;
  objc_super v6;

  v3 = -[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenBackdropBlurType](self, "homeScreenBackdropBlurType");
  if ((-[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder") & 1) != 0)
    v5 = 0;
  else
    v5 = -[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenHasWidgetCenterOrLibraryOpen](self, "homeScreenHasWidgetCenterOrLibraryOpen") ^ 1;
  if (v3 == 3 || (result = 1.0, v5))
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenAlpha](&v6, sel_homeScreenAlpha, result);
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (-[SBFullScreenToHomeIconZoomSwitcherModifier hasHomeButton](self, "hasHomeButton"))
    return 1;
  else
    return 3;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  float v13;

  if (self->_direction || self->_shouldDisableAsyncRendering)
    return 0;
  -[SBFullScreenToHomeIconZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disableAsyncRenderingTransitionPercentage");
  v9 = v8;

  -[SBFullScreenToHomeIconZoomSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "settlingDuration");
  v12 = v9 * v11;
  UIAnimationDragCoefficient();
  *a3 = v12 * v13;

  return 1;
}

- (BOOL)asyncRenderingDisabled
{
  return self->_shouldDisableAsyncRendering;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBCoplanarSwitcherModifier *v5;
  SBCoplanarSwitcherModifier *coplanarModifier;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  char v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v16, sel_didMoveToParentModifier_);
  if (a3 && !-[SBChainableModifier containsChildModifier:](self, "containsChildModifier:", self->_coplanarModifier))
  {
    v5 = -[SBCoplanarSwitcherModifier initWithActiveAppLayout:]([SBCoplanarSwitcherModifier alloc], "initWithActiveAppLayout:", self->_appLayout);
    coplanarModifier = self->_coplanarModifier;
    self->_coplanarModifier = v5;

    -[SBCoplanarSwitcherModifier setUsesContainerViewBoundsAsActiveFrame:](self->_coplanarModifier, "setUsesContainerViewBoundsAsActiveFrame:", 1);
    -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_coplanarModifier);
    if (CGRectEqualToRect(self->_homeScreenIconFrame, *MEMORY[0x1E0C9D648]))
    {
      -[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenIconFrameForAppLayout:](self, "homeScreenIconFrameForAppLayout:", self->_appLayout);
      self->_homeScreenIconFrame.origin.x = v7;
      self->_homeScreenIconFrame.origin.y = v8;
      self->_homeScreenIconFrame.size.width = v9;
      self->_homeScreenIconFrame.size.height = v10;
    }
    -[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenIconCornerRadiusForAppLayout:](self, "homeScreenIconCornerRadiusForAppLayout:", self->_appLayout);
    self->_homeScreenIconCornerRadius = v11;
    -[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenIconScaleForAppLayout:](self, "homeScreenIconScaleForAppLayout:", self->_appLayout);
    self->_homeScreenIconScale = v12;
    -[SBFullScreenToHomeIconZoomSwitcherModifier homeScreenIconLocationForAppLayout:](self, "homeScreenIconLocationForAppLayout:", self->_appLayout);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_homeScreenIconLocationIsFloatingDock = SBIconLocationGroupContainsLocation();
    v14 = -[SBFullScreenToHomeIconZoomSwitcherModifier itemContainerForAppLayoutOverlapsFloatingDock:](self, "itemContainerForAppLayoutOverlapsFloatingDock:", self->_appLayout);
    self->_itemContainerOverlapsDock = v14;
    if (self->_homeScreenIconLocationIsFloatingDock)
    {
      if (self->_direction)
        v15 = v14;
      else
        v15 = 0;
      if ((v15 & 1) == 0)
        self->_wantsDockWindowLevelAssertion = 1;
    }

  }
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  BOOL v5;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v5 = -[SBFullScreenToHomeIconZoomSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3),
        v6 = 0.5,
        v7 = 0.5,
        !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier anchorPointForIndex:](&v8, sel_anchorPointForIndex_, a3);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBFullScreenToHomeIconZoomSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  return -[SBFullScreenToHomeIconZoomSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v6, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBFullScreenToHomeIconZoomSwitcherModifier _isIndexZoomAppLayout:](self, "_isIndexZoomAppLayout:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  return -[SBFullScreenToHomeIconZoomSwitcherModifier shouldPinLayoutRolesToSpace:](&v6, sel_shouldPinLayoutRolesToSpace_, a3);
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v5 = v4;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v6 = 0.0, (objc_msgSend(v4, "isEqual:", self->_appLayout) & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier perspectiveAngleForAppLayout:](&v9, sel_perspectiveAngleForAppLayout_, v5);
    v6 = v7;
  }

  return v6;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBFullScreenToHomeIconZoomSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_appLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_2(uint64_t a1)
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
  char v7;
  char v8;
  int *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v15, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("kSBIconZoomDisallowAcceleratedHomeButtonPressReason"));

  if ((v7 & 1) != 0)
  {
    v8 = 0;
    v9 = &OBJC_IVAR___SBFullScreenToHomeIconZoomSwitcherModifier__shouldAcceleratedHomeButtonPressBegin;
LABEL_8:
    *((_BYTE *)&self->super.super.super.super.isa + *v9) = v8;
    goto LABEL_9;
  }
  objc_msgSend(v4, "reason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("kSBIconZoomSwitcherModifierTakeDockWindowLevelAssertionReason"));

  if ((v11 & 1) != 0)
  {
    v8 = 1;
LABEL_7:
    v9 = &OBJC_IVAR___SBFullScreenToHomeIconZoomSwitcherModifier__wantsDockWindowLevelAssertion;
    goto LABEL_8;
  }
  objc_msgSend(v4, "reason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("kSBIconZoomSwitcherModifierRelinquishDockWindowLevelAssertionReason"));

  if (v13)
  {
    v8 = 0;
    goto LABEL_7;
  }
LABEL_9:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
}

- (SBFullScreenToHomeIconZoomSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 direction:(unint64_t)a5
{
  id v9;
  SBFullScreenToHomeIconZoomSwitcherModifier *v10;
  SBFullScreenToHomeIconZoomSwitcherModifier *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v13, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a4);
    v11->_direction = a5;
    v11->_shouldAcceleratedHomeButtonPressBegin = a5 == 0;
    v11->_shouldUpdateIconViewVisibility = 1;
    v11->_shouldMatchMoveToIconView = 1;
    v11->_shouldDisableAsyncRendering = 0;
  }

  return v11;
}

- (SBFullScreenToHomeIconZoomSwitcherModifier)initWithTransitionID:(id)a3 targetFrame:(CGRect)a4 appLayout:(id)a5 direction:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SBFullScreenToHomeIconZoomSwitcherModifier *result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  result = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:appLayout:direction:](self, "initWithTransitionID:appLayout:direction:", a3, a5, a6);
  if (result)
  {
    result->_homeScreenIconFrame.origin.x = x;
    result->_homeScreenIconFrame.origin.y = y;
    result->_homeScreenIconFrame.size.width = width;
    result->_homeScreenIconFrame.size.height = height;
  }
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_direction == 1)
    v6 = CFSTR("to-home");
  else
    v6 = CFSTR("to-fullscreen");
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("direction"));
  v8 = (id)objc_msgSend(v5, "appendBool:withName:", self->_homeScreenIconLocationIsFloatingDock, CFSTR("homeScreenIconLocationIsFloatingDock"));
  v9 = (id)objc_msgSend(v5, "appendBool:withName:", self->_itemContainerOverlapsDock, CFSTR("itemContainerOverlapsDock"));
  v10 = (id)objc_msgSend(v5, "appendBool:withName:", self->_wantsDockWindowLevelAssertion, CFSTR("wantsDockWindowLevelAssertion"));
  return v5;
}

BOOL __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1)
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

BOOL __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_3(uint64_t a1)
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

BOOL __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_4(uint64_t a1)
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

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBFullScreenToHomeIconZoomSwitcherModifier appLayoutsForContinuousExposeIdentifier:](&v12, sel_appLayoutsForContinuousExposeIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBFullScreenToHomeIconZoomSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")&& (-[SBAppLayout continuousExposeIdentifier](self->_appLayout, "continuousExposeIdentifier"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = BSEqualStrings(), v6, v7))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__SBFullScreenToHomeIconZoomSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke;
    v11[3] = &unk_1E8E9DF78;
    v11[4] = self;
    objc_msgSend(v5, "bs_filter:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

uint64_t __86__SBFullScreenToHomeIconZoomSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "isOrContainsAppLayout:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isOrContainsAppLayout:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216)) ^ 1;

  return v4;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  return 0;
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  SBSwitcherShelfPresentationAttributes *result;
  objc_super v6;

  retstr->var3 = 0;
  *(_OWORD *)&retstr->var1.origin.y = 0u;
  *(_OWORD *)&retstr->var1.size.height = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  result = (SBSwitcherShelfPresentationAttributes *)-[SBSwitcherShelfPresentationAttributes presentationAttributesForShelf:](&v6, sel_presentationAttributesForShelf_, a4);
  retstr->var0 = 0;
  return result;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  objc_super v3;

  if (self->_shouldAcceleratedHomeButtonPressBegin)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  return -[SBFullScreenToHomeIconZoomSwitcherModifier shouldAcceleratedHomeButtonPressBegin](&v3, sel_shouldAcceleratedHomeButtonPressBegin);
}

- (BOOL)wantsDockBehaviorAssertion
{
  unint64_t direction;

  direction = self->_direction;
  return direction == 1 && self->_homeScreenIconLocationIsFloatingDock || direction == 0;
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 3;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  double v2;

  -[SBFullScreenToHomeIconZoomSwitcherModifier switcherWindowLevel](self, "switcherWindowLevel");
  return v2 + -1.0;
}

- (BOOL)shouldUpdateIconViewVisibility
{
  return self->_shouldUpdateIconViewVisibility;
}

- (void)setShouldUpdateIconViewVisibility:(BOOL)a3
{
  self->_shouldUpdateIconViewVisibility = a3;
}

- (BOOL)shouldMatchMoveToIconView
{
  return self->_shouldMatchMoveToIconView;
}

- (void)setShouldMatchMoveToIconView:(BOOL)a3
{
  self->_shouldMatchMoveToIconView = a3;
}

- (BOOL)shouldForceDefaultAnchorPointForTransition
{
  return self->_shouldForceDefaultAnchorPointForTransition;
}

- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3
{
  self->_shouldForceDefaultAnchorPointForTransition = a3;
}

- (BOOL)shouldDockOrderFrontDuringTransition
{
  return self->_shouldDockOrderFrontDuringTransition;
}

- (void)setShouldDockOrderFrontDuringTransition:(BOOL)a3
{
  self->_shouldDockOrderFrontDuringTransition = a3;
}

- (BOOL)shouldDisableAsyncRendering
{
  return self->_shouldDisableAsyncRendering;
}

- (void)setShouldDisableAsyncRendering:(BOOL)a3
{
  self->_shouldDisableAsyncRendering = a3;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

@end
