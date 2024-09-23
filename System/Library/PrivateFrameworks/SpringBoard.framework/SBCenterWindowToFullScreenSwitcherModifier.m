@implementation SBCenterWindowToFullScreenSwitcherModifier

- (SBCenterWindowToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 fullScreenWithCenterAppLayout:(id)a4
{
  id v7;
  id v8;
  SBCenterWindowToFullScreenSwitcherModifier *v9;
  id v10;
  uint64_t v11;
  SBAppLayout *fullScreenAppLayoutWithCenterRemoved;
  uint64_t v13;
  SBDisplayItem *movingCenterItem;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCenterWindowToFullScreenSwitcherModifier.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullScreenWithCenterAppLayout"));

  }
  v20.receiver = self;
  v20.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  v9 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v20, sel_initWithTransitionID_, v7);
  if (v9)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __97__SBCenterWindowToFullScreenSwitcherModifier_initWithTransitionID_fullScreenWithCenterAppLayout___block_invoke;
    v18[3] = &unk_1E8E9DF50;
    v10 = v8;
    v19 = v10;
    objc_msgSend(v10, "appLayoutWithItemsPassingTest:", v18);
    v11 = objc_claimAutoreleasedReturnValue();
    fullScreenAppLayoutWithCenterRemoved = v9->_fullScreenAppLayoutWithCenterRemoved;
    v9->_fullScreenAppLayoutWithCenterRemoved = (SBAppLayout *)v11;

    objc_msgSend(v10, "itemForLayoutRole:", 4);
    v13 = objc_claimAutoreleasedReturnValue();
    movingCenterItem = v9->_movingCenterItem;
    v9->_movingCenterItem = (SBDisplayItem *)v13;

    if (!v9->_movingCenterItem)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBCenterWindowToFullScreenSwitcherModifier.m"), 37, CFSTR("fullScreenWithCenterAppLayout must have center item"));

    }
  }

  return v9;
}

BOOL __97__SBCenterWindowToFullScreenSwitcherModifier_initWithTransitionID_fullScreenWithCenterAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutRoleForItem:", a2) != 4;
}

- (id)handleSceneReadyEvent:(id)a3
{
  SBCenterWindowToFullScreenSwitcherModifier *v3;
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v3 = self;
  v10.receiver = self;
  v10.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v10, sel_handleSceneReadyEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v6, "containsItem:", v3->_movingCenterItem);
  if ((_DWORD)v3)
  {
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  unsigned __int8 v7;
  SBDisplayItem *movingCenterItem;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  v6 = a4;
  v7 = -[SBCenterWindowToFullScreenSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v11, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  movingCenterItem = self->_movingCenterItem;
  objc_msgSend(v6, "itemForLayoutRole:", a3, v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(movingCenterItem) = -[SBDisplayItem isEqual:](movingCenterItem, "isEqual:", v9);
  return movingCenterItem | v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  int v7;
  SBDisplayItem *movingCenterItem;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  LOBYTE(v7) = -[SBCenterWindowToFullScreenSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v11, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  movingCenterItem = self->_movingCenterItem;
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(movingCenterItem) = -[SBDisplayItem isEqual:](movingCenterItem, "isEqual:", v9);

  if ((_DWORD)movingCenterItem)
    v7 = -[SBCenterWindowToFullScreenSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v6) ^ 1;

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  SBDisplayItem *movingCenterItem;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  v6 = a4;
  -[SBCenterWindowToFullScreenSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v15, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  movingCenterItem = self->_movingCenterItem;
  objc_msgSend(v6, "itemForLayoutRole:", a3, v15.receiver, v15.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(movingCenterItem) = -[SBDisplayItem isEqual:](movingCenterItem, "isEqual:", v10);
  if ((_DWORD)movingCenterItem)
  {
    -[SBCenterWindowToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resizeBlurDelay");
    v8 = v13;

  }
  return v8;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  unsigned __int16 v5;
  SBSwitcherAsyncRenderingAttributes v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "containsItem:", self->_movingCenterItem))
  {
    v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
    v5 = (unsigned __int16)-[SBTransitionSwitcherModifier asyncRenderingAttributesForAppLayout:](&v8, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movingCenterItem, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayoutWithCenterRemoved, 0);
}

@end
