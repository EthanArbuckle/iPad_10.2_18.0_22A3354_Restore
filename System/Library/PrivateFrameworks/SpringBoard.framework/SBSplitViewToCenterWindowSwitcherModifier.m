@implementation SBSplitViewToCenterWindowSwitcherModifier

- (SBSplitViewToCenterWindowSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SBSplitViewToCenterWindowSwitcherModifier *v13;
  SBSplitViewToCenterWindowSwitcherModifier *v14;
  SBAppLayout *fromAppLayout;
  void *v16;
  int64_t layoutRoleBeingMoved;
  uint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSplitViewToCenterWindowSwitcherModifier.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSplitViewToCenterWindowSwitcherModifier.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v23, sel_initWithTransitionID_, v9);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fromAppLayout, a4);
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    fromAppLayout = v14->_fromAppLayout;
    -[SBAppLayout itemForLayoutRole:](v14->_toAppLayout, "itemForLayoutRole:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_layoutRoleBeingMoved = -[SBAppLayout layoutRoleForItem:](fromAppLayout, "layoutRoleForItem:", v16);

    layoutRoleBeingMoved = v14->_layoutRoleBeingMoved;
    if (!layoutRoleBeingMoved)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBSplitViewToCenterWindowSwitcherModifier.m"), 37, CFSTR("Couldn't find the new center item in the from appLayout"));

      layoutRoleBeingMoved = v14->_layoutRoleBeingMoved;
    }
    if (layoutRoleBeingMoved == 1)
      v18 = 2;
    else
      v18 = 1;
    v14->_layoutRoleBeingResized = v18;
  }

  return v14;
}

- (id)handleSceneReadyEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v7, sel_handleSceneReadyEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  int v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  LOBYTE(v7) = -[SBSplitViewToCenterWindowSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v10, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSplitViewToCenterWindowSwitcherModifier _isItemBeingMovedToCenter:](self, "_isItemBeingMovedToCenter:", v8)
    || -[SBSplitViewToCenterWindowSwitcherModifier _isItemBeingResized:](self, "_isItemBeingResized:", v8))
  {
    v7 = -[SBSplitViewToCenterWindowSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v6) ^ 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  v6 = a4;
  -[SBSplitViewToCenterWindowSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v14, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  objc_msgSend(v6, "itemForLayoutRole:", a3, v14.receiver, v14.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBSplitViewToCenterWindowSwitcherModifier _isItemBeingMovedToCenter:](self, "_isItemBeingMovedToCenter:", v9)
    || -[SBSplitViewToCenterWindowSwitcherModifier _isItemBeingResized:](self, "_isItemBeingResized:", v9))
  {
    -[SBSplitViewToCenterWindowSwitcherModifier switcherSettings](self, "switcherSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resizeBlurDelay");
    v8 = v12;

  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  v6 = a4;
  v7 = -[SBSplitViewToCenterWindowSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v10, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  objc_msgSend(v6, "itemForLayoutRole:", a3, v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBSplitViewToCenterWindowSwitcherModifier _isItemBeingMovedToCenter:](self, "_isItemBeingMovedToCenter:", v8)
    || -[SBSplitViewToCenterWindowSwitcherModifier _isItemBeingResized:](self, "_isItemBeingResized:", v8))
  {
    v7 = 1;
  }

  return v7;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unsigned __int16 v7;
  SBSwitcherAsyncRenderingAttributes v8;
  objc_super v10;

  v4 = a3;
  -[SBAppLayout itemForLayoutRole:](self->_fromAppLayout, "itemForLayoutRole:", self->_layoutRoleBeingResized);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsItem:", v5);

  if (v6)
  {
    v7 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
    v7 = (unsigned __int16)-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v10, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v8 = (SBSwitcherAsyncRenderingAttributes)v7;

  return v8;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  SBAppLayout *toAppLayout;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  objc_super v31;
  UIRectCornerRadii result;

  topRight = a5.topRight;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topLeft = a5.topLeft;
  v31.receiver = self;
  v31.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  v11 = a4;
  -[SBSplitViewToCenterWindowSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v31, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v11, topLeft, bottomLeft, bottomRight, topRight);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SBSplitViewToCenterWindowSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  objc_msgSend(v11, "itemForLayoutRole:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBSplitViewToCenterWindowSwitcherModifier _isItemBeingMovedToCenter:](self, "_isItemBeingMovedToCenter:", v20))
  {
    toAppLayout = self->_toAppLayout;
    v30.receiver = self;
    v30.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
    -[SBSplitViewToCenterWindowSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v30, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, 4, toAppLayout, topLeft, bottomLeft, bottomRight, topRight);
LABEL_5:
    v13 = v22;
    v15 = v23;
    v17 = v24;
    v19 = v25;
    goto LABEL_6;
  }
  if (-[SBSplitViewToCenterWindowSwitcherModifier _isItemBeingResized:](self, "_isItemBeingResized:", v20))
  {
    SBRectCornerRadiiForRadius();
    goto LABEL_5;
  }
LABEL_6:

  v26 = v13;
  v27 = v15;
  v28 = v17;
  v29 = v19;
  result.topRight = v29;
  result.bottomRight = v28;
  result.bottomLeft = v27;
  result.topLeft = v26;
  return result;
}

- (BOOL)_isItemBeingMovedToCenter:(id)a3
{
  SBAppLayout *fromAppLayout;
  int64_t layoutRoleBeingMoved;
  id v5;
  void *v6;

  fromAppLayout = self->_fromAppLayout;
  layoutRoleBeingMoved = self->_layoutRoleBeingMoved;
  v5 = a3;
  -[SBAppLayout itemForLayoutRole:](fromAppLayout, "itemForLayoutRole:", layoutRoleBeingMoved);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(layoutRoleBeingMoved) = objc_msgSend(v6, "isEqual:", v5);

  return layoutRoleBeingMoved;
}

- (BOOL)_isItemBeingResized:(id)a3
{
  SBAppLayout *fromAppLayout;
  int64_t layoutRoleBeingResized;
  id v5;
  void *v6;

  fromAppLayout = self->_fromAppLayout;
  layoutRoleBeingResized = self->_layoutRoleBeingResized;
  v5 = a3;
  -[SBAppLayout itemForLayoutRole:](fromAppLayout, "itemForLayoutRole:", layoutRoleBeingResized);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(layoutRoleBeingResized) = objc_msgSend(v6, "isEqual:", v5);

  return layoutRoleBeingResized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
