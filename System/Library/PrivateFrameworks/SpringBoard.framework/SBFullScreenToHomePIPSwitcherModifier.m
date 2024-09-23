@implementation SBFullScreenToHomePIPSwitcherModifier

- (SBFullScreenToHomePIPSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 layoutRole:(int64_t)a5
{
  id v9;
  id v10;
  SBFullScreenToHomePIPSwitcherModifier *v11;
  SBFullScreenToHomePIPSwitcherModifier *v12;
  void *v14;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFullScreenToHomePIPSwitcherModifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout != nil"));

  }
  v15.receiver = self;
  v15.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v15, sel_initWithTransitionID_, v9);
  v12 = v11;
  if (v11)
  {
    v11->_layoutRole = a5;
    objc_storeStrong((id *)&v11->_appLayout, a4);
  }

  return v12;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBCoplanarSwitcherModifier *v5;
  SBCoplanarSwitcherModifier *coplanarModifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
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

- (id)transitionWillBegin
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  SBUpdateContinuousExposeStripsPresentationResponse *v5;
  SBSetupPIPMorphingSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  SBUpdateLayoutSwitcherEventResponse *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v12, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = -[SBUpdateContinuousExposeStripsPresentationResponse initWithPresentationOptions:dismissalOptions:]([SBUpdateContinuousExposeStripsPresentationResponse alloc], "initWithPresentationOptions:dismissalOptions:", 0, 1);
  v6 = objc_alloc_init(SBSetupPIPMorphingSwitcherEventResponse);
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_appLayout);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingBox");
  -[SBSetupPIPMorphingSwitcherEventResponse setAppLayoutBoundingBox:](v6, "setAppLayoutBoundingBox:");

  SBAppendSwitcherModifierResponse(v5, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v8);

  v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v9);

  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v6);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)handleHideMorphToPIPAppLayoutEvent:(id)a3
{
  id v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  self->_shouldHide = 1;
  v4 = a3;
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 2);
  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  -[SBSwitcherModifier handleHideMorphToPIPAppLayoutEvent:](&v9, sel_handleHideMorphToPIPAppLayoutEvent_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
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
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  objc_super v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;
  CGPoint v46;
  CGRect v47;
  CGRect v48;
  CGRect result;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[SBFullScreenToHomePIPSwitcherModifier _shouldApplyMorphToPIPToIndex:](self, "_shouldApplyMorphToPIPToIndex:"))
  {
    v38.receiver = self;
    v38.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier frameForIndex:](&v38, sel_frameForIndex_, a3);
    SBRectWithSize();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SBFullScreenToHomePIPSwitcherModifier morphToPIPTargetCenter](self, "morphToPIPTargetCenter");
    v35 = v14;
    v36 = v13;
    SBUnintegralizedRectCenteredAboutPoint();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    SBLogPIP();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v47.origin.x = v6;
      v47.origin.y = v8;
      v47.size.width = v10;
      v47.size.height = v12;
      NSStringFromCGRect(v47);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46.y = v35;
      v46.x = v36;
      NSStringFromCGPoint(v46);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v48.origin.x = v16;
      v48.origin.y = v18;
      v48.size.width = v20;
      v48.size.height = v22;
      NSStringFromCGRect(v48);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v32;
      v41 = 2114;
      v42 = v33;
      v43 = 2114;
      v44 = v34;
      _os_log_debug_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEBUG, "[FullscreenToHomeModifier] frameForIndex frame[%{public}@] morphToPIPTargetCenter[%{public}@] centeredFrame:[%{public}@]", buf, 0x20u);

    }
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier frameForIndex:](&v37, sel_frameForIndex_, a3);
    v16 = v24;
    v18 = v25;
    v20 = v26;
    v22 = v27;
  }
  v28 = v16;
  v29 = v18;
  v30 = v20;
  v31 = v22;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double result;
  objc_super v6;

  if (-[SBFullScreenToHomePIPSwitcherModifier _shouldApplyMorphToPIPToIndex:](self, "_shouldApplyMorphToPIPToIndex:"))
  {
    -[SBFullScreenToHomePIPSwitcherModifier morphToPIPTargetScale](self, "morphToPIPTargetScale");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier scaleForIndex:](&v6, sel_scaleForIndex_, a3);
  }
  return result;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
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
  if (-[SBFullScreenToHomePIPSwitcherModifier _isIndexSelectedAppLayout:](self, "_isIndexSelectedAppLayout:")
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    -[SBFullScreenToHomePIPSwitcherModifier morphToPIPClippingFrame](self, "morphToPIPClippingFrame");
  }
  else if (-[SBFullScreenToHomePIPSwitcherModifier _isIndexSelectedAppLayout:](self, "_isIndexSelectedAppLayout:", a3))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier clippingFrameForIndex:withBounds:](&v15, sel_clippingFrameForIndex_withBounds_, a3, x, y, width, height);
    SBRectWithSize();
    if (self->_shouldClippingTakeShadowIntoAccount)
      -[SBFullScreenToHomePIPSwitcherModifier _insetFrameForDiffuseShadowRadius:](self, "_insetFrameForDiffuseShadowRadius:");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier clippingFrameForIndex:withBounds:](&v14, sel_clippingFrameForIndex_withBounds_, a3, x, y, width, height);
  }
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
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
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  objc_super v42;
  CGRect v43;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a4;
  if (-[SBFullScreenToHomePIPSwitcherModifier _isIndexSelectedAppLayout:](self, "_isIndexSelectedAppLayout:", a5)
    && !-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
  {
    -[SBFullScreenToHomePIPSwitcherModifier morphToPIPClippingFrame](self, "morphToPIPClippingFrame");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[SBFullScreenToHomePIPSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v13, x, y, width, height);
    v35 = -v34;
    v37 = -v36;
    v43.origin.x = v27;
    v43.origin.y = v29;
    v43.size.width = v31;
    v43.size.height = v33;
    *(CGRect *)&v22 = CGRectOffset(v43, v35, v37);
    goto LABEL_8;
  }
  if (!-[SBFullScreenToHomePIPSwitcherModifier _isIndexSelectedAppLayout:](self, "_isIndexSelectedAppLayout:", a5))
  {
    v42.receiver = self;
    v42.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier clippingFrameForLayoutRole:inAppLayout:atIndex:withBounds:](&v42, sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_, a3, v13, a5, x, y, width, height);
    goto LABEL_8;
  }
  -[SBFullScreenToHomePIPSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v13, x, y, width, height);
  SBRectWithSize();
  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  if (self->_shouldClippingTakeShadowIntoAccount)
  {
    -[SBFullScreenToHomePIPSwitcherModifier _insetFrameForDiffuseShadowRadius:](self, "_insetFrameForDiffuseShadowRadius:", v14, v15, v16, v17);
LABEL_8:
    v18 = v22;
    v19 = v23;
    v20 = v24;
    v21 = v25;
  }

  v38 = v18;
  v39 = v19;
  v40 = v20;
  v41 = v21;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (CGRect)_insetFrameForDiffuseShadowRadius:(CGRect)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  CGRect v7;

  -[SBFullScreenToHomePIPSwitcherModifier switcherSettings](self, "switcherSettings", a3.origin.x, a3.origin.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chamoisSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diffuseShadowRadius");
  v6 = v5;

  SBRectWithSize();
  return CGRectInset(v7, v6 * -2.8, v6 * -2.8);
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  -[SBFullScreenToHomePIPSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_appLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  _BOOL4 v7;
  double result;

  v5 = 0.0;
  v6 = 0.0;
  if (-[SBFullScreenToHomePIPSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation") != 1)
  {
    if (-[SBFullScreenToHomePIPSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation") == 4)
    {
      v6 = -1.57079633;
    }
    else if (-[SBFullScreenToHomePIPSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation") == 3)
    {
      v6 = 1.57079633;
    }
    else if (-[SBFullScreenToHomePIPSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation") == 2)
    {
      v6 = 3.14159265;
    }
    else
    {
      v6 = 0.0;
    }
  }
  if (-[SBFullScreenToHomePIPSwitcherModifier homeScreenInterfaceOrientation](self, "homeScreenInterfaceOrientation") != 1)
  {
    if (-[SBFullScreenToHomePIPSwitcherModifier homeScreenInterfaceOrientation](self, "homeScreenInterfaceOrientation") == 4)
    {
      v5 = -1.57079633;
    }
    else if (-[SBFullScreenToHomePIPSwitcherModifier homeScreenInterfaceOrientation](self, "homeScreenInterfaceOrientation") == 3)
    {
      v5 = 1.57079633;
    }
    else if (-[SBFullScreenToHomePIPSwitcherModifier homeScreenInterfaceOrientation](self, "homeScreenInterfaceOrientation") == 2)
    {
      v5 = 3.14159265;
    }
    else
    {
      v5 = 0.0;
    }
  }
  v7 = -[SBFullScreenToHomePIPSwitcherModifier _shouldApplyMorphToPIPToIndex:](self, "_shouldApplyMorphToPIPToIndex:", a3);
  result = v5 - v6;
  if (!v7)
    return 0.0;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v13, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBFullScreenToHomePIPSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconZoomDownSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v8);

  +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fluidTransitionsSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceClippingFluidBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClippingSettings:", v11);

  return v5;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  BOOL v5;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v5 = -[SBFullScreenToHomePIPSwitcherModifier _isIndexSelectedAppLayout:](self, "_isIndexSelectedAppLayout:", a3),
        v6 = 0.5,
        v7 = 0.5,
        !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier anchorPointForIndex:](&v8, sel_anchorPointForIndex_, a3);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBFullScreenToHomePIPSwitcherModifier _isIndexSelectedAppLayout:](self, "_isIndexSelectedAppLayout:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  return -[SBFullScreenToHomePIPSwitcherModifier shouldPinLayoutRolesToSpace:](&v6, sel_shouldPinLayoutRolesToSpace_, a3);
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBFullScreenToHomePIPSwitcherModifier _isIndexSelectedAppLayout:](self, "_isIndexSelectedAppLayout:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  return -[SBFullScreenToHomePIPSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v6, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
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
    v9.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier perspectiveAngleForAppLayout:](&v9, sel_perspectiveAngleForAppLayout_, v5);
    v6 = v7;
  }

  return v6;
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
    -[SBFullScreenToHomePIPSwitcherModifier appLayouts](self, "appLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenToHomePIPSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v11, "indexOfObject:", self->_appLayout));
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
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
    v15.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
    -[SBFullScreenToHomePIPSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
    v9 = v11;
    v10 = v12;
  }

  v13 = v9;
  v14 = v10;
  result.y = v14;
  result.x = v13;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
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
  UIRectCornerRadii result;

  -[SBFullScreenToHomePIPSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  SBRectCornerRadiiForRadius();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[SBFullScreenToHomePIPSwitcherModifier _shouldApplyMorphToPIPToIndex:](self, "_shouldApplyMorphToPIPToIndex:", a3))
  {
    -[SBFullScreenToHomePIPSwitcherModifier morphToPIPClippingCornerRadius](self, "morphToPIPClippingCornerRadius");
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v13 = v6;
    v14 = v8;
    v15 = v10;
    v16 = v12;
  }
  result.topRight = v16;
  result.bottomRight = v15;
  result.bottomLeft = v14;
  result.topLeft = v13;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 0.0;
  if (!self->_shouldHide)
  {
    if (-[SBFullScreenToHomePIPSwitcherModifier _shouldApplyMorphToPIPToIndex:](self, "_shouldApplyMorphToPIPToIndex:", a5))
    {
      -[SBFullScreenToHomePIPSwitcherModifier morphToPIPSourceAlpha](self, "morphToPIPSourceAlpha");
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
      -[SBFullScreenToHomePIPSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    }
    v9 = v10;
  }

  return v9;
}

- (int64_t)homeScreenBackdropBlurType
{
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

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomePIPSwitcherModifier;
  -[SBFullScreenToHomePIPSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = objc_msgSend(v5, "indexOfObject:", self->_appLayout);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "insertObject:atIndex:", self->_appLayout, 0);
    else
      objc_msgSend(v5, "exchangeObjectAtIndex:withObjectAtIndex:", v6, 0);
  }
  else
  {
    v9[0] = self->_appLayout;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)_shouldApplyMorphToPIPToIndex:(unint64_t)a3
{
  _BOOL4 v5;

  v5 = -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout");
  if (v5)
    LOBYTE(v5) = -[SBFullScreenToHomePIPSwitcherModifier _isIndexSelectedAppLayout:](self, "_isIndexSelectedAppLayout:", a3);
  return v5;
}

- (BOOL)_isIndexSelectedAppLayout:(unint64_t)a3
{
  SBFullScreenToHomePIPSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBFullScreenToHomePIPSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_appLayout);
  return (char)v4;
}

- (BOOL)shouldForceDefaultAnchorPointForTransition
{
  return self->_shouldForceDefaultAnchorPointForTransition;
}

- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3
{
  self->_shouldForceDefaultAnchorPointForTransition = a3;
}

- (BOOL)shouldClippingTakeShadowIntoAccount
{
  return self->_shouldClippingTakeShadowIntoAccount;
}

- (void)setShouldClippingTakeShadowIntoAccount:(BOOL)a3
{
  self->_shouldClippingTakeShadowIntoAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
