@implementation SBSceneResizeTransitionSwitcherModifier

- (SBSceneResizeTransitionSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 minimumCardWithForDismissal:(double)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  SBSceneResizeTransitionSwitcherModifier *v15;
  SBSceneResizeTransitionSwitcherModifier *v16;
  void **p_fromAppLayout;
  void *v18;
  SBSceneResizeTransitionSwitcherModifier *v19;
  uint64_t v20;
  SBAppLayout *discardedAppLayout;
  SBAppLayout *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  _QWORD v28[4];
  SBSceneResizeTransitionSwitcherModifier *v29;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (!v12 || !v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneResizeTransitionSwitcherModifier.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout && toAppLayout"));

  }
  if ((objc_msgSend(v12, "isSplitConfiguration") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneResizeTransitionSwitcherModifier.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[fromAppLayout isSplitConfiguration]"));

  }
  v30.receiver = self;
  v30.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  v15 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v30, sel_initWithTransitionID_, v11);
  v16 = v15;
  if (v15)
  {
    p_fromAppLayout = (void **)&v15->_fromAppLayout;
    objc_storeStrong((id *)&v15->_fromAppLayout, a4);
    objc_storeStrong((id *)&v16->_toAppLayout, a5);
    v16->_minimumCardWithForDismissal = a6;
    v18 = *p_fromAppLayout;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __118__SBSceneResizeTransitionSwitcherModifier_initWithTransitionID_fromAppLayout_toAppLayout_minimumCardWithForDismissal___block_invoke;
    v28[3] = &unk_1E8E9DF50;
    v19 = v16;
    v29 = v19;
    objc_msgSend(v18, "appLayoutWithItemsPassingTest:", v28);
    v20 = objc_claimAutoreleasedReturnValue();
    discardedAppLayout = v19->_discardedAppLayout;
    v19->_discardedAppLayout = (SBAppLayout *)v20;

    v22 = v19->_discardedAppLayout;
    if (v22)
    {
      v23 = *p_fromAppLayout;
      -[SBAppLayout itemForLayoutRole:](v22, "itemForLayoutRole:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_discardedLayoutRole = objc_msgSend(v23, "layoutRoleForItem:", v24);

    }
    else
    {
      v19->_discardedLayoutRole = 0;
    }

  }
  return v16;
}

uint64_t __118__SBSceneResizeTransitionSwitcherModifier_initWithTransitionID_fromAppLayout_toAppLayout_minimumCardWithForDismissal___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "containsItem:", a2) ^ 1;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBSceneResizeTransitionSwitcherModifier medusaSettings](self, "medusaSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "medusaAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLayoutSettings:", v7);
  objc_msgSend(v5, "setPositionSettings:", v7);
  objc_msgSend(v5, "setScaleSettings:", v7);
  objc_msgSend(v5, "setOpacitySettings:", v7);
  objc_msgSend(v5, "setCornerRadiusSettings:", v7);
  objc_msgSend(v5, "setUpdateMode:", 3);

  return v5;
}

- (id)handleSceneReadyEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v7, sel_handleSceneReadyEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  v7 = -[SBSceneResizeTransitionSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v9, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  if (-[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", v6)
    || -[SBAppLayout isOrContainsAppLayout:](self->_discardedAppLayout, "isOrContainsAppLayout:", v6))
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBAppLayout *v7;
  SBAppLayout *fromAppLayout;
  SBAppLayout *discardedAppLayout;
  BOOL v10;
  BOOL v11;
  int v12;
  objc_super v14;

  v6 = a4;
  objc_msgSend(v6, "leafAppLayoutForRole:", a3);
  v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  if (!-[SBAppLayout isOrContainsAppLayout:](self->_fromAppLayout, "isOrContainsAppLayout:", v7)
    && !-[SBAppLayout isOrContainsAppLayout:](self->_toAppLayout, "isOrContainsAppLayout:", v7))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
    LOBYTE(self) = -[SBSceneResizeTransitionSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v14, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
    goto LABEL_18;
  }
  fromAppLayout = self->_fromAppLayout;
  if (fromAppLayout == self->_toAppLayout)
    goto LABEL_15;
  discardedAppLayout = self->_discardedAppLayout;
  if (discardedAppLayout)
    v10 = v7 == discardedAppLayout;
  else
    v10 = 0;
  if (v10)
  {
    LOBYTE(self) = 1;
    goto LABEL_18;
  }
  if (discardedAppLayout)
    v11 = v7 == discardedAppLayout;
  else
    v11 = 1;
  if (v11)
  {
    if (-[SBAppLayout isOrContainsAppLayout:](fromAppLayout, "isOrContainsAppLayout:", v7))
    {
      v12 = -[SBSceneResizeTransitionSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", 1, self->_fromAppLayout);
      LODWORD(self) = v12 & -[SBSceneResizeTransitionSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", 2, self->_fromAppLayout) ^ 1;
      goto LABEL_18;
    }
LABEL_15:
    LOBYTE(self) = 0;
    goto LABEL_18;
  }
  LODWORD(self) = -[SBSceneResizeTransitionSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", 1, v7) ^ 1;
LABEL_18:

  return (char)self;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  v8 = a4;
  -[SBSceneResizeTransitionSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v14, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
  v10 = v9;
  LODWORD(a5) = objc_msgSend(v8, "isOrContainsAppLayout:", self->_discardedAppLayout, v14.receiver, v14.super_class);

  if ((_DWORD)a5)
  {
    -[SBSceneResizeTransitionSwitcherModifier medusaSettings](self, "medusaSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resizeAnimationDismissItemOpacity");
    v10 = v12;

  }
  return v10;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_discardedAppLayout)
  {
    v5[0] = self->_discardedAppLayout;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
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
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double minimumCardWithForDismissal;
  double v20;
  double v21;
  int64_t discardedLayoutRole;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect result;

  v27.receiver = self;
  v27.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  -[SBSceneResizeTransitionSwitcherModifier frameForIndex:](&v27, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBSceneResizeTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isOrContainsAppLayout:", self->_discardedAppLayout))
  {
    -[SBSceneResizeTransitionSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    v16 = v15;
    -[SBSceneResizeTransitionSwitcherModifier separatorViewWidth](self, "separatorViewWidth");
    v18 = v17 * 0.5;
    minimumCardWithForDismissal = self->_minimumCardWithForDismissal;
    SBRectWithSize();
    v10 = v20;
    v12 = v21;
    discardedLayoutRole = self->_discardedLayoutRole;
    if (discardedLayoutRole == 1)
    {
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1)
        goto LABEL_7;
      discardedLayoutRole = self->_discardedLayoutRole;
    }
    if (discardedLayoutRole != 2 || objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1)
    {
      v6 = v16 + v18;
      goto LABEL_9;
    }
LABEL_7:
    v6 = -(v18 + minimumCardWithForDismissal);
LABEL_9:
    v8 = 0.0;
  }

  v23 = v6;
  v24 = v8;
  v25 = v10;
  v26 = v12;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
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
  SBAppLayout *v20;
  SBAppLayout *discardedAppLayout;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  v11 = a4;
  -[SBSceneResizeTransitionSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v31, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "leafAppLayoutForRole:", a3, v31.receiver, v31.super_class);
  v20 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  discardedAppLayout = self->_discardedAppLayout;
  if (discardedAppLayout)
    v22 = v20 == discardedAppLayout;
  else
    v22 = 0;
  if (v22)
  {
    SBRectWithSize();
    v13 = v23;
    v15 = v24;
    v17 = v25;
    v19 = v26;
  }

  v27 = v13;
  v28 = v15;
  v29 = v17;
  v30 = v19;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIRectCornerRadii result;

  -[SBSceneResizeTransitionSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  BOOL v7;
  objc_super v9;

  -[SBSceneResizeTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_toAppLayout)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
    v7 = -[SBSceneResizeTransitionSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  void *v4;
  int v5;
  int64_t discardedLayoutRole;
  int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  -[SBSceneResizeTransitionSwitcherModifier resizeGrabberLayoutAttributesForAppLayout:](&v13, sel_resizeGrabberLayoutAttributesForAppLayout_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_discardedAppLayout)
  {
    v5 = -[SBSceneResizeTransitionSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    discardedLayoutRole = self->_discardedLayoutRole;
    if (discardedLayoutRole == 1)
      v7 = v5;
    else
      v7 = 1;
    v8 = ((discardedLayoutRole == 2) & v5) == 0;
    v9 = 8;
    if (!v8)
      v9 = 2;
    if (v7)
      v10 = v9;
    else
      v10 = 2;
    objc_msgSend(v4, "setEdge:", v10);
    -[SBAppLayout leafAppLayoutForRole:](self->_toAppLayout, "leafAppLayoutForRole:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeafAppLayout:", v11);

  }
  return v4;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (void)setSelectedAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAppLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_discardedAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
