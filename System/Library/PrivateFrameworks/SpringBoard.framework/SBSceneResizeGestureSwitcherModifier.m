@implementation SBSceneResizeGestureSwitcherModifier

- (SBSceneResizeGestureSwitcherModifier)initWithGestureID:(id)a3 appLayout:(id)a4 spaceConfiguration:(int64_t)a5
{
  id v9;
  SBSceneResizeGestureSwitcherModifier *v10;
  SBSceneResizeGestureSwitcherModifier *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  v10 = -[SBGestureSwitcherModifier initWithGestureID:](&v13, sel_initWithGestureID_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a4);
    v11->_startingSpaceConfiguration = a5;
  }

  return v11;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v5;
  uint64_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v12, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBSceneResizeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", self->_appLayout);
    v11.receiver = self;
    v11.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    -[SBSceneResizeGestureSwitcherModifier frameForIndex:](&v11, sel_frameForIndex_, v6);
    self->_initialSpaceFrame.origin.x = v7;
    self->_initialSpaceFrame.origin.y = v8;
    self->_initialSpaceFrame.size.width = v9;
    self->_initialSpaceFrame.size.height = v10;

  }
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SBFFluidBehaviorSettings *v9;
  UIViewFloatAnimatableProperty *rampingProperty;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v17, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBSceneResizeGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "medusaAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setScaleSettings:", v7);
  objc_msgSend(v5, "setOpacitySettings:", v7);
  objc_msgSend(v5, "setCornerRadiusSettings:", v7);
  v8 = 1;
  objc_msgSend(v5, "setUpdateMode:", 1);
  objc_msgSend(v5, "setOpacityUpdateMode:", 3);
  objc_msgSend(v5, "setScaleUpdateMode:", 3);
  objc_msgSend(v5, "setCornerRadiusUpdateMode:", 2);
  v9 = self->_rampedLayoutSettings;
  rampingProperty = self->_rampingProperty;
  if (rampingProperty)
  {
    -[UIViewFloatAnimatableProperty presentationValue](rampingProperty, "presentationValue");
    if ((BSFloatIsOne() & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[UIViewFloatAnimatableProperty presentationValue](self->_rampingProperty, "presentationValue");
      v12 = v11;
      objc_msgSend(v7, "trackingResponse");
      v14 = v12 * (0.0 - v13);
      objc_msgSend(v7, "trackingResponse");
      -[SBFFluidBehaviorSettings setTrackingResponse:](v9, "setTrackingResponse:", v15 + v14);
      v8 = 5;
    }
  }
  objc_msgSend(v5, "setLayoutSettings:", v9);
  objc_msgSend(v5, "setPositionSettings:", v9);
  objc_msgSend(v5, "setLayoutUpdateMode:", v8);
  objc_msgSend(v5, "setPositionUpdateMode:", v8);

  return v5;
}

- (void)_beginAnimatingRampingProperty
{
  void *v3;
  void *v4;
  SBFFluidBehaviorSettings *v5;
  SBFFluidBehaviorSettings *rampedLayoutSettings;
  UIViewFloatAnimatableProperty *rampingProperty;
  UIViewFloatAnimatableProperty *v8;
  UIViewFloatAnimatableProperty *v9;
  UIViewFloatAnimatableProperty *v10;
  UIViewFloatAnimatableProperty *v11;
  void *v12;
  UIViewFloatAnimatableProperty *v13;
  _QWORD v14[4];
  UIViewFloatAnimatableProperty *v15;
  id v16;
  _QWORD v17[5];
  id location;

  -[SBSceneResizeGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medusaAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (SBFFluidBehaviorSettings *)objc_msgSend(v4, "copy");
  rampedLayoutSettings = self->_rampedLayoutSettings;
  self->_rampedLayoutSettings = v5;

  rampingProperty = self->_rampingProperty;
  if (rampingProperty)
  {
    -[UIViewFloatAnimatableProperty invalidate](rampingProperty, "invalidate");
    v8 = self->_rampingProperty;
    self->_rampingProperty = 0;

  }
  v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v10 = self->_rampingProperty;
  self->_rampingProperty = v9;

  -[UIViewFloatAnimatableProperty setValue:](self->_rampingProperty, "setValue:", 0.0);
  objc_initWeak(&location, self);
  v11 = self->_rampingProperty;
  v12 = (void *)MEMORY[0x1E0CEABB0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__SBSceneResizeGestureSwitcherModifier__beginAnimatingRampingProperty__block_invoke;
  v17[3] = &unk_1E8E9DED8;
  v17[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__SBSceneResizeGestureSwitcherModifier__beginAnimatingRampingProperty__block_invoke_2;
  v14[3] = &unk_1E8EA6DD8;
  objc_copyWeak(&v16, &location);
  v13 = v11;
  v15 = v13;
  objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", v4, 3, v17, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __70__SBSceneResizeGestureSwitcherModifier__beginAnimatingRampingProperty__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setValue:", 1.0);
}

void __70__SBSceneResizeGestureSwitcherModifier__beginAnimatingRampingProperty__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained[23];
    v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      v5 = v6[23];
      v6[23] = 0;

    }
    WeakRetained = v6;
  }

}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  unsigned int v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  v7 = -[SBSceneResizeGestureSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v9, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  if ((-[SBSceneResizeGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") & 1) == 0)
    v7 |= objc_msgSend(v6, "isOrContainsAppLayout:", self->_appLayout);

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  SBAppLayout *appLayout;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int64_t v13;
  double v14;
  double v15;
  objc_super v17;
  objc_super v18;

  appLayout = self->_appLayout;
  v9 = a4;
  if (!-[SBAppLayout isOrContainsAppLayout:](appLayout, "isOrContainsAppLayout:", v9))
  {
    v18.receiver = self;
    v18.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    -[SBSceneResizeGestureSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v18, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v9, a5);
LABEL_10:
    v14 = v15;

    return v14;
  }
  v17.receiver = self;
  v17.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBSceneResizeGestureSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v17, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v9, a5);

  v10 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  v11 = &SBLayoutRolePrimary;
  if (v10 == 1)
    v11 = &SBLayoutRoleSide;
  v12 = *v11;
  v13 = -[SBSceneResizeGestureSwitcherModifier _currentPresentationAction](self, "_currentPresentationAction");
  v14 = 1.0;
  if (v12 == a3)
  {
    if (v13 != 1)
      return v14;
    goto LABEL_9;
  }
  if (v13 == 7)
  {
LABEL_9:
    -[SBSceneResizeGestureSwitcherModifier medusaSettings](self, "medusaSettings");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resizeAnimationDismissItemOpacity");
    goto LABEL_10;
  }
  return v14;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  SBAppLayout *appLayout;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  int64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int *v29;
  int *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  BOOL v47;
  void *v48;
  double v49;
  double v50;
  int v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  objc_super v59;
  objc_super v60;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  appLayout = self->_appLayout;
  v13 = a4;
  if (-[SBAppLayout isOrContainsAppLayout:](appLayout, "isOrContainsAppLayout:", v13))
  {
    v59.receiver = self;
    v59.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    -[SBSceneResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v59, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v13, x, y, width, height);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v58 = v20;

    -[SBSceneResizeGestureSwitcherModifier _switcherWidth](self, "_switcherWidth");
    v22 = v21;
    v23 = -[SBSceneResizeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v24 = -[SBSceneResizeGestureSwitcherModifier _currentPresentationAction](self, "_currentPresentationAction");
    v25 = self->_location.x;
    -[SBSceneResizeGestureSwitcherModifier separatorViewWidth](self, "separatorViewWidth");
    v57 = v26 * 0.5;
    -[SBSceneResizeGestureSwitcherModifier _rubberbandingRange](self, "_rubberbandingRange");
    -[SBSceneResizeGestureSwitcherModifier _minimumCardWidthForDismissalAction](self, "_minimumCardWidthForDismissalAction");
    v28 = v27;
    -[SBSceneResizeGestureSwitcherModifier _maxCardWidthForDismissalAction](self, "_maxCardWidthForDismissalAction");
    if (-[SBSceneResizeGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
    {
      switch(v24)
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneResizeGestureSwitcherModifier.m"), 239, CFSTR("Should get a valid presentation action"));

          goto LABEL_24;
        case 1:
        case 2:
          BSUIConstrainValueToIntervalWithRubberBand();
          v15 = v25 - v28;
          v19 = v28;
          v25 = v22 - v42;
          v28 = v42;
          break;
        case 3:
        case 4:
        case 5:
          v29 = &OBJC_IVAR___SBSceneResizeGestureSwitcherModifier__startingFrameForPrimaryItem;
          if (v23)
            v30 = &OBJC_IVAR___SBSceneResizeGestureSwitcherModifier__startingFrameForSideItem;
          else
            v30 = &OBJC_IVAR___SBSceneResizeGestureSwitcherModifier__startingFrameForPrimaryItem;
          v31 = *(double *)((char *)&self->super.super.super._queryCache + *v30);
          if (!v23)
            v29 = &OBJC_IVAR___SBSceneResizeGestureSwitcherModifier__startingFrameForSideItem;
          v32 = v25 - v31;
          if (v25 - v31 >= 0.0)
            v15 = v25 - v31;
          else
            v15 = 0.0;
          if (v25 - v31 >= 0.0)
            v32 = -0.0;
          v19 = v31 + v32;
          if (v25 + *(double *)((char *)&self->super.super.super._queryCache + *v29) <= v22)
            v28 = *(double *)((char *)&self->super.super.super._queryCache + *v29);
          else
            v28 = v22 - v25;
          break;
        case 6:
        case 7:
          BSUIConstrainValueToIntervalWithRubberBand();
          v19 = v43;
          v15 = 0.0;
          break;
        default:
LABEL_24:
          v25 = v15;
          v28 = v19;
          break;
      }
      v45 = v57;
      v46 = v57 + v25;
      v47 = v23 == (a3 == 1);
    }
    else
    {
      v56 = v17;
      v17 = 0.0;
      v39 = v25;
      switch(v24)
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v25);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneResizeGestureSwitcherModifier.m"), 303, CFSTR("Should get a valid presentation action"));

          v25 = v15;
          v28 = v19;
          goto LABEL_31;
        case 1:
        case 2:
          -[SBSceneResizeGestureSwitcherModifier _switcherWidth](self, "_switcherWidth", v25);
          BSUIConstrainValueToIntervalWithRubberBand();
          v41 = v40;
          v17 = v25 - v28;
          v39 = v28;
          v25 = v22 - v41;
          v28 = v41;
          goto LABEL_30;
        case 3:
          -[SBSceneResizeGestureSwitcherModifier _switcherWidth](self, "_switcherWidth", v25);
          v50 = v49;
          v17 = v25 - v28;
          v39 = v28;
          v28 = v50 - v25;
          v25 = v22 - (v50 - v25);
          goto LABEL_30;
        case 4:
          v28 = v22 - v25;
          v39 = v25;
          goto LABEL_30;
        case 5:
          goto LABEL_30;
        case 6:
        case 7:
          BSUIConstrainValueToIntervalWithRubberBand();
LABEL_30:
          v15 = v17;
          v19 = v39;
LABEL_31:
          v17 = v56;
          break;
        default:
          v25 = v15;
          v28 = v19;
          break;
      }
      if (a3 == 1)
        v51 = v23;
      else
        v51 = 1;
      v45 = v57;
      if (v51 != 1)
        goto LABEL_43;
      v46 = v57 + v25;
      v47 = ((a3 == 2) & v23) == 0;
    }
    if (v47)
      v19 = v28;
    if (v47)
      v15 = v46;
LABEL_43:
    v36 = v19 - v45;
    v38 = v58;
    goto LABEL_44;
  }
  v60.receiver = self;
  v60.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBSceneResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v60, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v13, x, y, width, height);
  v15 = v33;
  v17 = v34;
  v36 = v35;
  v38 = v37;

LABEL_44:
  v52 = v15;
  v53 = v17;
  v54 = v36;
  v55 = v38;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  SBSceneResizeGestureSwitcherModifier *v5;
  id v6;
  objc_super v8;

  v5 = self;
  v8.receiver = self;
  v8.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  v6 = a4;
  LOBYTE(a3) = -[SBSceneResizeGestureSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v8, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  LOBYTE(v5) = objc_msgSend(v6, "isOrContainsAppLayout:", v5->_appLayout, v8.receiver, v8.super_class);

  return v5 | a3;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBSceneResizeGestureSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_);
  v6 = v5;
  -[SBSceneResizeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isOrContainsAppLayout:", self->_appLayout))
  {
    if (SBReduceMotion())
      v6 = 1.0;
    else
      v6 = 0.98;
  }

  return v6;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  SBAppLayout *appLayout;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  UIRectCornerRadii result;

  appLayout = self->_appLayout;
  -[SBSceneResizeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(appLayout) = -[SBAppLayout isOrContainsAppLayout:](appLayout, "isOrContainsAppLayout:", v7);

  if ((appLayout & 1) != 0)
  {
    -[SBSceneResizeGestureSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    -[SBSceneResizeGestureSwitcherModifier cornerRadiiForIndex:](&v12, sel_cornerRadiiForIndex_, a3);
  }
  result.topRight = v11;
  result.bottomRight = v10;
  result.bottomLeft = v9;
  result.topLeft = v8;
  return result;
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 14;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  BOOL v7;
  objc_super v9;

  -[SBSceneResizeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_appLayout)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    v7 = -[SBSceneResizeGestureSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  void *v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBSceneResizeGestureSwitcherModifier resizeGrabberLayoutAttributesForAppLayout:](&v12, sel_resizeGrabberLayoutAttributesForAppLayout_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBSceneResizeGestureSwitcherModifier _currentPresentationAction](self, "_currentPresentationAction");
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 6)
      return v4;
    v6 = &SBLayoutRoleSide;
    v7 = &SBLayoutRolePrimary;
    v8 = 2;
  }
  else
  {
    v6 = &SBLayoutRolePrimary;
    v7 = &SBLayoutRoleSide;
    v8 = 8;
  }
  if (-[SBSceneResizeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    v9 = v7;
  else
    v9 = v6;
  -[SBAppLayout leafAppLayoutForRole:](self->_appLayout, "leafAppLayoutForRole:", *v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeafAppLayout:", v10);

  objc_msgSend(v4, "setEdge:", v8);
  return v4;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[SBSceneResizeGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))v5 = objc_msgSend(v4, "isOrContainsAppLayout:", self->_appLayout);
  else
    v5 = 0;

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  v4 = a3;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v8, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 == 2)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v19, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInContainerView");
  v9 = v8 - self->_initialSpaceFrame.origin.y;
  self->_location.x = v7 - self->_initialSpaceFrame.origin.x;
  self->_location.y = v9;
  objc_msgSend(v5, "translationInContainerView");
  self->_translation.x = v10;
  self->_translation.y = v11;
  objc_msgSend(v5, "velocityInContainerView");
  self->_velocity.x = v12;
  self->_velocity.y = v13;
  switch(objc_msgSend(v5, "phase"))
  {
    case 0:
      if (!objc_msgSend(v5, "phase"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneResizeGestureSwitcherModifier.m"), 473, CFSTR("Should not get PhasePossible."));

      }
      goto LABEL_4;
    case 1:
      -[SBSceneResizeGestureSwitcherModifier _handleGestureEventBeganWithEvent:](self, "_handleGestureEventBeganWithEvent:", v5);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[SBSceneResizeGestureSwitcherModifier _handleGestureEventChangedWithEvent:](self, "_handleGestureEventChangedWithEvent:", v5);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[SBSceneResizeGestureSwitcherModifier _handleGestureEventEndedWithEvent:](self, "_handleGestureEventEndedWithEvent:", v5);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v14 = (void *)v15;
      break;
    default:
LABEL_4:
      v14 = 0;
      break;
  }
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v14, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_handleGestureEventBeganWithEvent:(id)a3
{
  SBAppLayout *appLayout;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  SBAppLayout *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v15;
  objc_super v16;

  -[SBSceneResizeGestureSwitcherModifier _beginAnimatingRampingProperty](self, "_beginAnimatingRampingProperty", a3);
  if (-[SBSceneResizeGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
  {
    appLayout = self->_appLayout;
    -[SBSceneResizeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v16.receiver = self;
    v16.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    -[SBSceneResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v16, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, appLayout);
    self->_startingFrameForPrimaryItem.origin.x = v5;
    self->_startingFrameForPrimaryItem.origin.y = v6;
    self->_startingFrameForPrimaryItem.size.width = v7;
    self->_startingFrameForPrimaryItem.size.height = v8;
    v9 = self->_appLayout;
    -[SBSceneResizeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v15.receiver = self;
    v15.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    -[SBSceneResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v15, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v9);
    self->_startingFrameForSideItem.origin.x = v10;
    self->_startingFrameForSideItem.origin.y = v11;
    self->_startingFrameForSideItem.size.width = v12;
    self->_startingFrameForSideItem.size.height = v13;
  }
  return 0;
}

- (id)_handleGestureEventChangedWithEvent:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  SBTimerEventSwitcherEventResponse *v13;
  SBTimerEventSwitcherEventResponse *v14;
  void *v15;
  _QWORD v17[4];
  id v18[2];
  id location;

  v4 = a3;
  if (-[SBSceneResizeGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
  {
    objc_msgSend(v4, "translationInContainerView");
    self->_translation.x = v5;
    self->_translation.y = v6;
    if (objc_msgSend(v4, "phase") == 1)
      self->_lastTranslationThatUpdatedScene = (CGPoint)SBInvalidPoint;
    -[SBSceneResizeGestureSwitcherModifier _responseForGestureUpdateWithPause:gestureIsEnding:](self, "_responseForGestureUpdateWithPause:gestureIsEnding:", 0, objc_msgSend(v4, "phase") == 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)(self->_timerGenCount + 1);
    self->_timerGenCount = (unint64_t)v9;
    objc_initWeak(&location, self);
    -[SBSceneResizeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "liveResizeSceneUpdateTimeThresholdSeconds");
    v12 = v11;

    v13 = [SBTimerEventSwitcherEventResponse alloc];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__SBSceneResizeGestureSwitcherModifier__handleGestureEventChangedWithEvent___block_invoke;
    v17[3] = &unk_1E8EC0DD8;
    objc_copyWeak(v18, &location);
    v18[1] = v9;
    v14 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v13, "initWithDelay:validator:reason:", v17, CFSTR("kSBLiveSceneResizeTimerReason"), v12);
    SBAppendSwitcherModifierResponse(v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __76__SBSceneResizeGestureSwitcherModifier__handleGestureEventChangedWithEvent___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  _BOOL8 v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "parentModifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = v3[37] == *(_QWORD *)(a1 + 40);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v11, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqual:", CFSTR("kSBLiveSceneResizeTimerReason"));
  if ((_DWORD)v4)
  {
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSceneResizeGestureSwitcherModifier _responseForGestureUpdateWithPause:gestureIsEnding:](self, "_responseForGestureUpdateWithPause:gestureIsEnding:", 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v9, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_handleGestureEventEndedWithEvent:(id)a3
{
  void *v4;
  SBMutableSwitcherTransitionRequest *v5;
  SBPerformTransitionSwitcherEventResponse *v6;

  -[SBSceneResizeGestureSwitcherModifier _appLayoutForAction:](self, "_appLayoutForAction:", -[SBSceneResizeGestureSwitcherModifier _currentActionWithProjection:](self, "_currentActionWithProjection:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  -[SBSwitcherTransitionRequest setAppLayout:](v5, "setAppLayout:", v4);
  -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v5, "setUnlockedEnvironmentMode:", 3);
  -[SBSwitcherTransitionRequest setPreferredInterfaceOrientation:](v5, "setPreferredInterfaceOrientation:", -[SBSceneResizeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
  v6 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v5, 1);

  return v6;
}

- (id)_appLayoutForAction:(int64_t)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  SBAppLayout *v24;
  int64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = -[SBSceneResizeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  if (v6)
    v7 = 2;
  else
    v7 = 1;
  if (v6)
    v8 = 1;
  else
    v8 = 2;
  -[SBAppLayout itemForLayoutRole:](self->_appLayout, "itemForLayoutRole:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  -[SBAppLayout itemForLayoutRole:](self->_appLayout, "itemForLayoutRole:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v10;
  if ((unint64_t)(a3 - 2) >= 3)
  {
    if (a3 == 5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v5;
      v14 = (void *)v9;
    }
    else
    {
      if (a3 != 1)
        goto LABEL_14;
      v15 = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v5;
      v14 = (void *)v15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v5;
    v14 = v28;
  }
  objc_msgSend(v13, "setObject:forKey:", v14, v12);

LABEL_14:
  v27 = (void *)v9;
  v26 = -[SBSceneResizeGestureSwitcherModifier _configurationForFinalResizeAction:](self, "_configurationForFinalResizeAction:", a3);
  v16 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v5, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[SBAppLayout layoutAttributesForItem:](self->_appLayout, "layoutAttributesForItem:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v23, v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
  }

  v24 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v5, v26, v16, 0, 1, 0, -[SBSceneResizeGestureSwitcherModifier displayOrdinal](self, "displayOrdinal"));
  return v24;
}

- (int64_t)_configurationForFinalResizeAction:(int64_t)a3
{
  int64_t result;
  void *v6;
  BOOL v7;
  int64_t v8;
  int64_t v9;

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneResizeGestureSwitcherModifier.m"), 617, CFSTR("Shouldn't receive a final resize action of None"));

      result = 0;
      break;
    case 1:
    case 5:
      result = 1;
      break;
    case 2:
      v7 = -[SBSceneResizeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled") == 0;
      v8 = 2;
      v9 = 4;
      goto LABEL_7;
    case 3:
      result = 3;
      break;
    case 4:
      v7 = -[SBSceneResizeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled") == 0;
      v8 = 4;
      v9 = 2;
LABEL_7:
      if (v7)
        result = v8;
      else
        result = v9;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int64_t)_currentActionWithProjection:(BOOL)a3
{
  double v4;

  -[SBSceneResizeGestureSwitcherModifier _normalizedHorizontalLocationWithProjection:](self, "_normalizedHorizontalLocationWithProjection:", a3);
  return -[SBSceneResizeGestureSwitcherModifier _actionForNormalizedProgress:inOrientation:](self, "_actionForNormalizedProgress:inOrientation:", -[SBSceneResizeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), v4);
}

- (int64_t)_currentPresentationAction
{
  -[SBSceneResizeGestureSwitcherModifier _normalizedHorizontalLocationWithProjection:](self, "_normalizedHorizontalLocationWithProjection:", 0);
  return -[SBSceneResizeGestureSwitcherModifier _presentationActionForNormalizedProgress:](self, "_presentationActionForNormalizedProgress:");
}

- (int64_t)_presentationActionForNormalizedProgress:(double)a3
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
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  -[SBSceneResizeGestureSwitcherModifier _normalizedDismissLeftProgress](self, "_normalizedDismissLeftProgress");
  v6 = v5;
  -[SBSceneResizeGestureSwitcherModifier _normalizedDismissRightProgress](self, "_normalizedDismissRightProgress");
  v8 = v7;
  -[SBSceneResizeGestureSwitcherModifier _normalizedPeekDismissLeftProgress](self, "_normalizedPeekDismissLeftProgress");
  v10 = v9;
  -[SBSceneResizeGestureSwitcherModifier _normalizedPeekDismissRightProgress](self, "_normalizedPeekDismissRightProgress");
  v12 = v11;
  -[SBSceneResizeGestureSwitcherModifier _normalizedNarrowWideProgress](self, "_normalizedNarrowWideProgress");
  v14 = v13;
  -[SBSceneResizeGestureSwitcherModifier _normalizedWideNarrowProgress](self, "_normalizedWideNarrowProgress");
  if (v6 >= a3)
    return 1;
  if (v10 >= a3)
    return 2;
  v16 = 4;
  v17 = 5;
  v18 = 6;
  if (v8 < a3)
    v18 = 7;
  if (v12 < a3)
    v17 = v18;
  if (v15 < a3)
    v16 = v17;
  if (v14 < a3)
    return v16;
  else
    return 3;
}

- (int64_t)_actionForNormalizedProgress:(double)a3 inOrientation:(int64_t)a4
{
  int64_t result;
  double v9;
  double v10;
  double v11;
  void *v12;

  switch(-[SBSceneResizeGestureSwitcherModifier _presentationActionForNormalizedProgress:](self, "_presentationActionForNormalizedProgress:"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneResizeGestureSwitcherModifier.m"), 682, CFSTR("Should have a valid final presentation action"));

      goto LABEL_14;
    case 1:
      return 1;
    case 2:
    case 3:
      goto LABEL_12;
    case 4:
      -[SBSceneResizeGestureSwitcherModifier _normalizedProgressBetweenNarrowWideAndHalfHalf](self, "_normalizedProgressBetweenNarrowWideAndHalfHalf");
      if (v9 >= a3)
      {
LABEL_12:
        result = 2;
      }
      else
      {
        -[SBSceneResizeGestureSwitcherModifier _normalizedProgressBetweenHalfHalfAndWideNarrow](self, "_normalizedProgressBetweenHalfHalfAndWideNarrow");
        if (v10 <= a3)
          result = 4;
        else
          result = 3;
        if ((unint64_t)(a4 - 5) <= 0xFFFFFFFFFFFFFFFDLL && v10 > a3)
        {
          -[SBSceneResizeGestureSwitcherModifier _normalizedHalfHalfProgress](self, "_normalizedHalfHalfProgress");
          if (v11 <= a3)
            result = 4;
          else
            result = 2;
        }
      }
      break;
    case 5:
    case 6:
      result = 4;
      break;
    case 7:
      result = 5;
      break;
    default:
LABEL_14:
      result = 0;
      break;
  }
  return result;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes](SBSwitcherKeyboardSuppressionMode, "suppressionModeForAllScenes");
}

- (id)_responseForGestureUpdateWithPause:(BOOL)a3 gestureIsEnding:(BOOL)a4
{
  _BOOL4 v4;
  CGPoint *p_lastTranslationThatUpdatedScene;
  double x;
  double y;
  CGPoint *p_translation;
  CGFloat v11;
  CGFloat v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  SBPerformTransitionSwitcherEventResponse *v24;
  SBUpdateLayoutSwitcherEventResponse *v25;
  uint64_t v26;

  v4 = a4;
  p_lastTranslationThatUpdatedScene = &self->_lastTranslationThatUpdatedScene;
  x = self->_lastTranslationThatUpdatedScene.x;
  y = self->_lastTranslationThatUpdatedScene.y;
  p_translation = &self->_translation;
  v11 = self->_translation.x;
  if (x == 1.79769313e308 && y == 1.79769313e308)
  {
    v13 = self->_translation.y;
  }
  else
  {
    v11 = x - v11;
    v13 = y - self->_translation.y;
  }
  v14 = hypot(v11, v13);
  -[SBSceneResizeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "liveResizeSceneUpdateDistanceThreshold");
  if (v14 <= v16)
  {

    if (!a3 && !v4)
    {
      v17 = 0;
      if (!v4)
        return v17;
      goto LABEL_16;
    }
  }
  else
  {

  }
  *p_lastTranslationThatUpdatedScene = *p_translation;
  -[SBSceneResizeGestureSwitcherModifier _appLayoutForAction:](self, "_appLayoutForAction:", -[SBSceneResizeGestureSwitcherModifier _currentActionWithProjection:](self, "_currentActionWithProjection:", 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBMutableSwitcherTransitionRequest, "requestForActivatingAppLayout:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSceneUpdatesOnly:", !v4);
  -[SBSceneResizeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "liveResizeSendsAnimatedSceneSizeUpdates");

  if (v21)
  {
    -[SBSceneResizeGestureSwitcherModifier medusaSettings](self, "medusaSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "resizeAnimationSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAnimationSettings:", v23);

  }
  v24 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v19, 1);
  SBAppendSwitcherModifierResponse(v24, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_16:
    v25 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    SBAppendSwitcherModifierResponse(v25, v17);
    v26 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v26;
  }
  return v17;
}

- (double)_normalizedHorizontalLocationWithProjection:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;

  v3 = a3;
  -[SBSceneResizeGestureSwitcherModifier _switcherWidth](self, "_switcherWidth");
  v6 = 0.05;
  if (!v3)
    v6 = 0.0;
  return (self->_location.x + self->_velocity.x * v6) / v5 + 0.0;
}

- (double)_normalizedDismissLeftProgress
{
  double v3;
  double v4;
  CGRect v6;

  -[SBSceneResizeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  SBLayoutDefaultSideLayoutElementWidth();
  v4 = v3 * 0.5;
  -[SBSceneResizeGestureSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  return v4 / CGRectGetWidth(v6) * 0.5;
}

- (double)_normalizedDismissRightProgress
{
  double v3;

  -[SBSceneResizeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  SBLayoutDefaultSideLayoutElementWidth();
  return v3 * 0.5 / CGRectGetWidth(self->_initialSpaceFrame) * 0.5;
}

- (double)_normalizedPeekDismissLeftProgress
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBSceneResizeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  SBLayoutDefaultSideLayoutElementWidth();
  v4 = v3;
  -[SBSceneResizeGestureSwitcherModifier separatorViewWidth](self, "separatorViewWidth");
  v6 = v4 + v5 * 0.5;
  -[SBSceneResizeGestureSwitcherModifier _switcherWidth](self, "_switcherWidth");
  return v6 / v7 * 0.5;
}

- (double)_normalizedPeekDismissRightProgress
{
  double v2;

  -[SBSceneResizeGestureSwitcherModifier _normalizedPeekDismissLeftProgress](self, "_normalizedPeekDismissLeftProgress");
  return 1.0 - v2;
}

- (double)_normalizedNarrowWideProgress
{
  double v3;
  double v4;
  double v5;

  -[SBSceneResizeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  SBLayoutDefaultSideLayoutElementWidth();
  v4 = v3;
  -[SBSceneResizeGestureSwitcherModifier _switcherWidth](self, "_switcherWidth");
  return v4 / v5;
}

- (double)_normalizedProgressBetweenNarrowWideAndHalfHalf
{
  double v3;
  double v4;
  double v5;

  -[SBSceneResizeGestureSwitcherModifier _normalizedHalfHalfProgress](self, "_normalizedHalfHalfProgress");
  v4 = v3;
  -[SBSceneResizeGestureSwitcherModifier _normalizedPeekDismissLeftProgress](self, "_normalizedPeekDismissLeftProgress");
  return v4 + (v4 - v5) * -0.5;
}

- (double)_normalizedProgressBetweenHalfHalfAndWideNarrow
{
  double v2;

  -[SBSceneResizeGestureSwitcherModifier _normalizedProgressBetweenNarrowWideAndHalfHalf](self, "_normalizedProgressBetweenNarrowWideAndHalfHalf");
  return 1.0 - v2;
}

- (double)_normalizedWideNarrowProgress
{
  double v2;

  -[SBSceneResizeGestureSwitcherModifier _normalizedNarrowWideProgress](self, "_normalizedNarrowWideProgress");
  return 1.0 - v2;
}

- (double)_normalizedHalfHalfProgress
{
  return 0.5;
}

- (double)_minimumCardWidthForDismissalAction
{
  double result;

  -[SBSceneResizeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  SBLayoutDefaultSideLayoutElementWidth();
  return result;
}

- (double)_maxCardWidthForDismissalAction
{
  double v3;
  double v4;
  double v5;

  -[SBSceneResizeGestureSwitcherModifier _normalizedPeekDismissLeftProgress](self, "_normalizedPeekDismissLeftProgress");
  v4 = 1.0 - v3;
  -[SBSceneResizeGestureSwitcherModifier _switcherWidth](self, "_switcherWidth");
  return v4 * v5;
}

- (double)_switcherWidth
{
  return self->_initialSpaceFrame.size.width;
}

- (double)_rubberbandingRange
{
  double v2;

  -[SBSceneResizeGestureSwitcherModifier _switcherWidth](self, "_switcherWidth");
  return v2 * 0.1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rampedLayoutSettings, 0);
  objc_storeStrong((id *)&self->_rampingProperty, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
