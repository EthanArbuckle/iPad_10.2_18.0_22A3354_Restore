@implementation SBFullScreenToHomeSlideOverSwitcherModifier

- (SBFullScreenToHomeSlideOverSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 direction:(unint64_t)a5
{
  id v9;
  SBFullScreenToHomeSlideOverSwitcherModifier *v10;
  SBFullScreenToHomeSlideOverSwitcherModifier *v11;
  SBFullScreenAppLayoutSwitcherModifier *v12;
  SBFullScreenAppLayoutSwitcherModifier *fullScreenModifier;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v15, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a4);
    v11->_direction = a5;
    v12 = -[SBFullScreenAppLayoutSwitcherModifier initWithActiveAppLayout:]([SBFullScreenAppLayoutSwitcherModifier alloc], "initWithActiveAppLayout:", v11->_appLayout);
    fullScreenModifier = v11->_fullScreenModifier;
    v11->_fullScreenModifier = v12;

  }
  return v11;
}

- (id)transitionWillBegin
{
  void *v3;
  int64_t v4;
  int64_t v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  uint64_t v7;
  SBUpdateLayoutSwitcherEventResponse *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v11, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBFullScreenToHomeSlideOverSwitcherModifier homeScreenBackdropBlurType](self, "homeScreenBackdropBlurType");
  if (!self->_direction)
  {
    v6 = [SBUpdateLayoutSwitcherEventResponse alloc];
    goto LABEL_5;
  }
  v5 = v4;
  v6 = [SBUpdateLayoutSwitcherEventResponse alloc];
  if (v5 == 3)
  {
LABEL_5:
    v7 = 2;
    goto LABEL_6;
  }
  v7 = 10;
LABEL_6:
  v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v6, "initWithOptions:updateMode:", v7, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleSceneReadyEvent:(id)a3
{
  void *v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v8, sel_handleSceneReadyEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldBlurUnreadyScenes)
  {
    v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
    SBAppendSwitcherModifierResponse(v5, v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  __int128 v13;
  SBFullScreenAppLayoutSwitcherModifier *fullScreenModifier;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[7];
  uint64_t v25;
  double *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  v31.receiver = self;
  v31.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  -[SBFullScreenToHomeSlideOverSwitcherModifier frameForIndex:](&v31, sel_frameForIndex_);
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  if (-[SBFullScreenToHomeSlideOverSwitcherModifier _isIndexSlideOverAppLayout:](self, "_isIndexSlideOverAppLayout:", a3))
  {
    v25 = 0;
    v26 = (double *)&v25;
    v27 = 0x4010000000;
    v28 = &unk_1D0FA064E;
    v13 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v29 = *MEMORY[0x1E0C9D648];
    v30 = v13;
    fullScreenModifier = self->_fullScreenModifier;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__SBFullScreenToHomeSlideOverSwitcherModifier_frameForIndex___block_invoke;
    v24[3] = &unk_1E8E9FD08;
    v24[4] = self;
    v24[5] = &v25;
    v24[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fullScreenModifier, v24);
    x = v26[4];
    y = v26[5];
    width = v26[6];
    height = v26[7];
    _Block_object_dispose(&v25, 8);
  }
  if (-[SBFullScreenToHomeSlideOverSwitcherModifier _shouldApplySlideOverLayoutToIndex:](self, "_shouldApplySlideOverLayoutToIndex:", a3))
  {
    -[SBFullScreenToHomeSlideOverSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v16 = v15;
    v17 = -[SBFullScreenToHomeSlideOverSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v18 = -v16;
    if (!v17)
      v18 = v16;
    if (self->_startingScreenEdge == 1)
      v19 = -v18;
    else
      v19 = v18;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v33 = CGRectOffset(v32, v19, 0.0);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

uint64_t __61__SBFullScreenToHomeSlideOverSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 152), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  BOOL v5;
  double result;
  objc_super v7;

  v5 = -[SBFullScreenToHomeSlideOverSwitcherModifier _isIndexSlideOverAppLayout:](self, "_isIndexSlideOverAppLayout:");
  result = 1.0;
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier scaleForIndex:](&v7, sel_scaleForIndex_, a3, 1.0);
  }
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  BOOL v5;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v5 = -[SBFullScreenToHomeSlideOverSwitcherModifier _isIndexSlideOverAppLayout:](self, "_isIndexSlideOverAppLayout:", a3), v6 = 0.5, v7 = 0.5, !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier anchorPointForIndex:](&v8, sel_anchorPointForIndex_, a3);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBFullScreenToHomeSlideOverSwitcherModifier _isIndexSlideOverAppLayout:](self, "_isIndexSlideOverAppLayout:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  return -[SBFullScreenToHomeSlideOverSwitcherModifier shouldPinLayoutRolesToSpace:](&v6, sel_shouldPinLayoutRolesToSpace_, a3);
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBFullScreenToHomeSlideOverSwitcherModifier _isIndexSlideOverAppLayout:](self, "_isIndexSlideOverAppLayout:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  return -[SBFullScreenToHomeSlideOverSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v6, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
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
    v9.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier perspectiveAngleForAppLayout:](&v9, sel_perspectiveAngleForAppLayout_, v5);
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
    -[SBFullScreenToHomeSlideOverSwitcherModifier appLayouts](self, "appLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenToHomeSlideOverSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v11, "indexOfObject:", self->_appLayout));
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
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
    v15.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
    v9 = v11;
    v10 = v12;
  }

  v13 = v9;
  v14 = v10;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  -[SBFullScreenToHomeSlideOverSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_appLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBFullScreenToHomeSlideOverSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "slideOverSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v8);

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 1.0;
  if (!-[SBFullScreenToHomeSlideOverSwitcherModifier _isIndexSlideOverAppLayout:](self, "_isIndexSlideOverAppLayout:", a5))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (-[SBFullScreenToHomeSlideOverSwitcherModifier hasHomeButton](self, "hasHomeButton"))
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

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return self->_direction != 1;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v5;

  if (self->_appLayout == a4)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  return -[SBFullScreenToHomeSlideOverSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v5, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3);
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  objc_super v8;
  objc_super v9;

  v6 = (SBAppLayout *)a4;
  if (self->_appLayout == v6 && self->_shouldBlurUnreadyScenes)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    LODWORD(a3) = -[SBFullScreenToHomeSlideOverSwitcherModifier isLayoutRoleContentReady:inAppLayout:](&v9, sel_isLayoutRoleContentReady_inAppLayout_, a3, v6) ^ 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    LOBYTE(a3) = -[SBFullScreenToHomeSlideOverSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v8, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  }

  return a3;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  SBAppLayout *appLayout;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
  v6 = (SBAppLayout *)a4;
  -[SBFullScreenToHomeSlideOverSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v14, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  appLayout = self->_appLayout;

  if (appLayout == v6)
  {
    -[SBFullScreenToHomeSlideOverSwitcherModifier switcherSettings](self, "switcherSettings", v14.receiver, v14.super_class);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resizeBlurDelay");
    v8 = v12;

  }
  return v8;
}

- (double)homeScreenAlpha
{
  int64_t v3;
  double result;
  objc_super v5;

  v3 = -[SBFullScreenToHomeSlideOverSwitcherModifier homeScreenBackdropBlurType](self, "homeScreenBackdropBlurType");
  result = 1.0;
  if (v3 == 3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFullScreenToHomeSlideOverSwitcherModifier;
    -[SBFullScreenToHomeSlideOverSwitcherModifier homeScreenAlpha](&v5, sel_homeScreenAlpha, 1.0);
  }
  return result;
}

- (BOOL)_shouldApplySlideOverLayoutToIndex:(unint64_t)a3
{
  _BOOL4 v4;

  v4 = -[SBFullScreenToHomeSlideOverSwitcherModifier _isIndexSlideOverAppLayout:](self, "_isIndexSlideOverAppLayout:", a3);
  if (v4)
  {
    if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout") && !self->_direction)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      v4 = -[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout");
      if (v4)
        LOBYTE(v4) = self->_direction == 1;
    }
  }
  return v4;
}

- (BOOL)_isIndexSlideOverAppLayout:(unint64_t)a3
{
  SBFullScreenToHomeSlideOverSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBFullScreenToHomeSlideOverSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_appLayout);
  return (char)v4;
}

- (int64_t)startingScreenEdge
{
  return self->_startingScreenEdge;
}

- (void)setStartingScreenEdge:(int64_t)a3
{
  self->_startingScreenEdge = a3;
}

- (BOOL)shouldBlurUnreadyScenes
{
  return self->_shouldBlurUnreadyScenes;
}

- (void)setShouldBlurUnreadyScenes:(BOOL)a3
{
  self->_shouldBlurUnreadyScenes = a3;
}

- (BOOL)shouldForceDefaultAnchorPointForTransition
{
  return self->_shouldForceDefaultAnchorPointForTransition;
}

- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3
{
  self->_shouldForceDefaultAnchorPointForTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
