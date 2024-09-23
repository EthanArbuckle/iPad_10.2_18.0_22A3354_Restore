@implementation SBCenterWindowToNewSplitViewSwitcherModifier

- (SBCenterWindowToNewSplitViewSwitcherModifier)initWithTransitionID:(id)a3 fromFullScreenAppLayout:(id)a4 toSpaceAppLayout:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SBCenterWindowToNewSplitViewSwitcherModifier *v13;
  SBCenterWindowToNewSplitViewSwitcherModifier *v14;
  SBAppLayout *toSpaceAppLayout;
  void *v16;
  uint64_t v17;
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
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCenterWindowToNewSplitViewSwitcherModifier.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromFullScreenAppLayout"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCenterWindowToNewSplitViewSwitcherModifier.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSpaceAppLayout"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v23, sel_initWithTransitionID_, v9);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fromFullScreenAppLayout, a4);
    objc_storeStrong((id *)&v14->_toSpaceAppLayout, a5);
    toSpaceAppLayout = v14->_toSpaceAppLayout;
    objc_msgSend(v10, "itemForLayoutRole:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SBAppLayout layoutRoleForItem:](toSpaceAppLayout, "layoutRoleForItem:", v16);

    if (!SBLayoutRoleIsValidForSplitView(v17))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBCenterWindowToNewSplitViewSwitcherModifier.m"), 36, CFSTR("Couldn't find previous fullscreen item in the new combined split layout"));

    }
    v18 = 2;
    if (v17 != 1)
      v18 = 1;
    v14->_layoutRoleBeingAdded = v18;
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
  v7.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
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
  v10.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  LOBYTE(v7) = -[SBCenterWindowToNewSplitViewSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v10, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBCenterWindowToNewSplitViewSwitcherModifier _wasItemPreviouslyFullScreen:](self, "_wasItemPreviouslyFullScreen:", v8)|| -[SBCenterWindowToNewSplitViewSwitcherModifier _wasItemPreviouslyCenter:](self, "_wasItemPreviouslyCenter:", v8))
  {
    v7 = -[SBCenterWindowToNewSplitViewSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v6) ^ 1;
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
  v14.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  v6 = a4;
  -[SBCenterWindowToNewSplitViewSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v14, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  objc_msgSend(v6, "itemForLayoutRole:", a3, v14.receiver, v14.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBCenterWindowToNewSplitViewSwitcherModifier _wasItemPreviouslyFullScreen:](self, "_wasItemPreviouslyFullScreen:", v9)|| -[SBCenterWindowToNewSplitViewSwitcherModifier _wasItemPreviouslyCenter:](self, "_wasItemPreviouslyCenter:", v9))
  {
    -[SBCenterWindowToNewSplitViewSwitcherModifier switcherSettings](self, "switcherSettings");
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
  v10.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  v6 = a4;
  v7 = -[SBCenterWindowToNewSplitViewSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v10, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  objc_msgSend(v6, "itemForLayoutRole:", a3, v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBCenterWindowToNewSplitViewSwitcherModifier _wasItemPreviouslyFullScreen:](self, "_wasItemPreviouslyFullScreen:", v8)|| -[SBCenterWindowToNewSplitViewSwitcherModifier _wasItemPreviouslyCenter:](self, "_wasItemPreviouslyCenter:", v8))
  {
    v7 = 1;
  }

  return v7;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  v4 = a3;
  -[SBCenterWindowToNewSplitViewSwitcherModifier topMostLayoutRolesForAppLayout:](&v11, sel_topMostLayoutRolesForAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", self->_toSpaceAppLayout, v11.receiver, v11.super_class);

  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_layoutRoleBeingAdded);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_layoutRoleBeingAdded);
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

- (BOOL)_wasItemPreviouslyFullScreen:(id)a3
{
  SBAppLayout *fromFullScreenAppLayout;
  id v4;
  void *v5;
  char v6;

  fromFullScreenAppLayout = self->_fromFullScreenAppLayout;
  v4 = a3;
  -[SBAppLayout itemForLayoutRole:](fromFullScreenAppLayout, "itemForLayoutRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (BOOL)_wasItemPreviouslyCenter:(id)a3
{
  SBAppLayout *fromFullScreenAppLayout;
  id v4;
  void *v5;
  char v6;

  fromFullScreenAppLayout = self->_fromFullScreenAppLayout;
  v4 = a3;
  -[SBAppLayout itemForLayoutRole:](fromFullScreenAppLayout, "itemForLayoutRole:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toSpaceAppLayout, 0);
  objc_storeStrong((id *)&self->_fromFullScreenAppLayout, 0);
}

@end
