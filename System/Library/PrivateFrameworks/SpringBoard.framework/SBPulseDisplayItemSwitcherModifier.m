@implementation SBPulseDisplayItemSwitcherModifier

- (SBPulseDisplayItemSwitcherModifier)initWithDisplayItem:(id)a3
{
  id v5;
  SBPulseDisplayItemSwitcherModifier *v6;
  SBPulseDisplayItemSwitcherModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  v6 = -[SBSwitcherModifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayItem, a3);
    objc_storeStrong((id *)&v7->_displayItemToPulse, a3);
  }

  return v7;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  void *v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  SBTimerEventSwitcherEventResponse *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutHeaderEvent:](&v14, sel_handleTapAppLayoutHeaderEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 3);
  SBAppendSwitcherModifierResponse(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPulseDisplayItemSwitcherModifier switcherSettings](self, "switcherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pulseSecondStageDelay");
  v10 = v9;

  v11 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("SBPulseDisplayItemSwitcherModifierTimerReason"), v10);
  SBAppendSwitcherModifierResponse(v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBDisplayItem *displayItemToPulse;
  SBUpdateLayoutSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v11, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("SBPulseDisplayItemSwitcherModifierTimerReason"));
  if ((_DWORD)v4)
  {
    displayItemToPulse = self->_displayItemToPulse;
    self->_displayItemToPulse = 0;

    v8 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 3);
    SBAppendSwitcherModifierResponse(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    -[SBChainableModifier setState:](self, "setState:", 1);
    v5 = (void *)v9;
  }
  return v5;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  v6 = a4;
  -[SBPulseDisplayItemSwitcherModifier scaleForLayoutRole:inAppLayout:](&v15, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  objc_msgSend(v6, "itemForLayoutRole:", a3, v15.receiver, v15.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isEqual:", self->_displayItemToPulse);
  if (v10)
  {
    -[SBPulseDisplayItemSwitcherModifier switcherSettings](self, "switcherSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pulseScale");
    v8 = v8 * v13;

  }
  return v8;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  -[SBPulseDisplayItemSwitcherModifier animationAttributesForLayoutElement:](&v11, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!objc_msgSend(v4, "switcherLayoutElementType")
    && objc_msgSend(v4, "containsItem:", self->_displayItemToPulse))
  {
    -[SBPulseDisplayItemSwitcherModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pulseScaleSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v9);

  }
  return v6;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  unsigned __int16 v5;
  SBSwitcherAsyncRenderingAttributes v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "containsItem:", self->_displayItemToPulse))
  {
    v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
    v5 = (unsigned __int16)-[SBPulseDisplayItemSwitcherModifier asyncRenderingAttributesForAppLayout:](&v8, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;
  _QWORD v12[5];

  -[SBPulseDisplayItemSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__SBPulseDisplayItemSwitcherModifier_topMostLayoutElements__block_invoke;
  v12[3] = &unk_1E8E9DF78;
  v12[4] = self;
  objc_msgSend(v3, "bs_firstObjectPassingTest:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPulseDisplayItemSwitcherModifier appLayoutOnStage](self, "appLayoutOnStage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOrContainsAppLayout:", v4);

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
    -[SBPulseDisplayItemSwitcherModifier topMostLayoutElements](&v11, sel_topMostLayoutElements);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
    -[SBPulseDisplayItemSwitcherModifier topMostLayoutElements](&v10, sel_topMostLayoutElements);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __59__SBPulseDisplayItemSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (SBDisplayItem)displayItemToPulse
{
  return self->_displayItemToPulse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItemToPulse, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
}

@end
