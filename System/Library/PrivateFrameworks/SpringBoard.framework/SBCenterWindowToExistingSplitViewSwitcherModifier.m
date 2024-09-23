@implementation SBCenterWindowToExistingSplitViewSwitcherModifier

- (SBCenterWindowToExistingSplitViewSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SBCenterWindowToExistingSplitViewSwitcherModifier *v13;
  SBCenterWindowToExistingSplitViewSwitcherModifier *v14;
  id *p_fromAppLayout;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  SBAppLayout *appLayoutBeingReplaced;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

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
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCenterWindowToExistingSplitViewSwitcherModifier.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAppLayout"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCenterWindowToExistingSplitViewSwitcherModifier.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v25, sel_initWithTransitionID_, v9);
  v14 = v13;
  if (v13)
  {
    p_fromAppLayout = (id *)&v13->_fromAppLayout;
    objc_storeStrong((id *)&v13->_fromAppLayout, a4);
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    objc_msgSend(*p_fromAppLayout, "itemForLayoutRole:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SBAppLayout layoutRoleForItem:](v14->_toAppLayout, "layoutRoleForItem:", v16);
    v14->_layoutRoleBeingReplaced = v17;
    if (!SBLayoutRoleIsValidForSplitView(v17))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBCenterWindowToExistingSplitViewSwitcherModifier.m"), 40, CFSTR("Should only be replacing a split view role"));

    }
    objc_msgSend(*p_fromAppLayout, "leafAppLayoutForRole:", v14->_layoutRoleBeingReplaced);
    v18 = objc_claimAutoreleasedReturnValue();
    appLayoutBeingReplaced = v14->_appLayoutBeingReplaced;
    v14->_appLayoutBeingReplaced = (SBAppLayout *)v18;

    if (!v14->_appLayoutBeingReplaced)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBCenterWindowToExistingSplitViewSwitcherModifier.m"), 43, CFSTR("Didn't find _appLayoutBeingReplaced"));

    }
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
  v7.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v7, sel_handleSceneReadyEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  -[SBCenterWindowToExistingSplitViewSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "addObject:", self->_appLayoutBeingReplaced);
  return v4;
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
  int64_t layoutRoleBeingReplaced;
  SBAppLayout *fromAppLayout;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v34.receiver = self;
  v34.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v11 = a4;
  -[SBCenterWindowToExistingSplitViewSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  LODWORD(a3) = -[SBAppLayout isEqual:](self->_appLayoutBeingReplaced, "isEqual:", v11, v34.receiver, v34.super_class);

  if ((_DWORD)a3)
  {
    layoutRoleBeingReplaced = self->_layoutRoleBeingReplaced;
    fromAppLayout = self->_fromAppLayout;
    -[SBCenterWindowToExistingSplitViewSwitcherModifier containerViewBounds](self, "containerViewBounds");
    -[SBCenterWindowToExistingSplitViewSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", layoutRoleBeingReplaced, fromAppLayout, -[SBCenterWindowToExistingSplitViewSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), v22, v23, v24, v25);
    v13 = v26;
    v15 = v27;
    v17 = v28;
    v19 = v29;
  }
  v30 = v13;
  v31 = v15;
  v32 = v17;
  v33 = v19;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  double result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v8 = a4;
  -[SBCenterWindowToExistingSplitViewSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
  v10 = v9;
  LODWORD(a5) = -[SBAppLayout isEqual:](self->_appLayoutBeingReplaced, "isEqual:", v8, v12.receiver, v12.super_class);

  result = 1.0;
  if (!(_DWORD)a5)
    return v10;
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v6 = a4;
  -[SBCenterWindowToExistingSplitViewSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v12, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  LODWORD(a3) = -[SBAppLayout isEqual:](self->_appLayoutBeingReplaced, "isEqual:", v6, v12.receiver, v12.super_class);

  if ((_DWORD)a3)
  {
    -[SBCenterWindowToExistingSplitViewSwitcherModifier medusaSettings](self, "medusaSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultDimmingOpacity");
    v8 = v10;

  }
  return v8;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  int v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  LOBYTE(v7) = -[SBCenterWindowToExistingSplitViewSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v9, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  if (-[SBCenterWindowToExistingSplitViewSwitcherModifier _wasPreviousCenterAppLayout:layoutRole:](self, "_wasPreviousCenterAppLayout:layoutRole:", v6, a3))
  {
    v7 = -[SBCenterWindowToExistingSplitViewSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v6) ^ 1;
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
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v6 = a4;
  -[SBCenterWindowToExistingSplitViewSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v13, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  LODWORD(a3) = -[SBCenterWindowToExistingSplitViewSwitcherModifier _wasPreviousCenterAppLayout:layoutRole:](self, "_wasPreviousCenterAppLayout:layoutRole:", v6, a3, v13.receiver, v13.super_class);

  if ((_DWORD)a3)
  {
    -[SBCenterWindowToExistingSplitViewSwitcherModifier switcherSettings](self, "switcherSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resizeBlurDelay");
    v8 = v11;

  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  unsigned __int8 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v6 = a4;
  v7 = -[SBCenterWindowToExistingSplitViewSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v9, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  LOBYTE(a3) = -[SBCenterWindowToExistingSplitViewSwitcherModifier _wasPreviousCenterAppLayout:layoutRole:](self, "_wasPreviousCenterAppLayout:layoutRole:", v6, a3, v9.receiver, v9.super_class);

  return a3 | v7;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v4 = a3;
  -[SBCenterWindowToExistingSplitViewSwitcherModifier topMostLayoutRolesForAppLayout:](&v11, sel_topMostLayoutRolesForAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBCenterWindowToExistingSplitViewSwitcherModifier _wasPreviousCenterAppLayout:layoutRole:](self, "_wasPreviousCenterAppLayout:layoutRole:", v4, self->_layoutRoleBeingReplaced, v11.receiver, v11.super_class);

  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_layoutRoleBeingReplaced);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_layoutRoleBeingReplaced);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObject:atIndex:", v9, 0);

    v5 = v7;
  }
  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)_wasPreviousCenterAppLayout:(id)a3 layoutRole:(int64_t)a4
{
  SBAppLayout *fromAppLayout;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  fromAppLayout = self->_fromAppLayout;
  v7 = a3;
  -[SBAppLayout itemForLayoutRole:](fromAppLayout, "itemForLayoutRole:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemForLayoutRole:", self->_layoutRoleBeingReplaced);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqual:", v9))
    v10 = self->_layoutRoleBeingReplaced == a4;
  else
    v10 = 0;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutBeingReplaced, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
