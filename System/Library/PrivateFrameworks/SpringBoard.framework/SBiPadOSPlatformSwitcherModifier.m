@implementation SBiPadOSPlatformSwitcherModifier

- (void)setDelegate:(id)a3
{
  void *v5;
  int v6;
  __objc2_class **v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  -[SBChainableModifier setDelegate:](&v9, sel_setDelegate_);
  if (a3)
  {
    -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("kiPadOSPlatformModifierChildKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = -[SBiPadOSPlatformSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
      v7 = off_1E8E95460;
      if (!v6)
        v7 = off_1E8E96EA8;
      v8 = objc_alloc_init(*v7);
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v8, 0, CFSTR("kiPadOSPlatformModifierChildKey"));

    }
  }
}

- (id)handlePrepareForSceneUpdateEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSSet *v7;
  NSSet *activatingLiveAppLayouts;
  void *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v5, "liveAppLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  activatingLiveAppLayouts = self->_activatingLiveAppLayouts;
  self->_activatingLiveAppLayouts = v7;

  v11.receiver = self;
  v11.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  -[SBSwitcherModifier handlePrepareForSceneUpdateEvent:](&v11, sel_handlePrepareForSceneUpdateEvent_, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SBiPadOSWindowModeChangeTransitionModifier *v11;
  void *v12;
  SBiPadOSWindowModeChangeTransitionModifier *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSSet *v20;
  NSSet *previousDisplayItems;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSSet *v28;
  NSSet *displayItems;
  SBDisplayItem *lastGesturedDisplayItem;
  void *v31;
  void *v32;
  SBDisplayItem *v33;
  SBDisplayItem *lastPulsedDisplayItem;
  SBTransitionSwitcherModifierEvent *v35;
  SBTransitionSwitcherModifierEvent *lastTransitionEvent;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v38, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isiPadOSWindowingModeChangeEvent")
    && objc_msgSend(v4, "phase") == 1
    && objc_msgSend(v4, "isAnimated"))
  {
    objc_msgSend(v4, "fromAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAppLayout");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (self->_currentUnlockedEnvironmentMode == 3 && v6 != 0 && v7 != 0)
    {
      v11 = [SBiPadOSWindowModeChangeTransitionModifier alloc];
      objc_msgSend(v4, "transitionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SBiPadOSWindowModeChangeTransitionModifier initWithTransitionID:fromAppLayout:toAppLayout:](v11, "initWithTransitionID:fromAppLayout:toAppLayout:", v12, v6, v8);

      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v13, 0, 0);
    }

  }
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "fromAppLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromFloatingAppLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v19);
  v20 = (NSSet *)objc_claimAutoreleasedReturnValue();
  previousDisplayItems = self->_previousDisplayItems;
  self->_previousDisplayItems = v20;

  v22 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "toAppLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allItems");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toFloatingAppLayout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allItems");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v27);
  v28 = (NSSet *)objc_claimAutoreleasedReturnValue();
  displayItems = self->_displayItems;
  self->_displayItems = v28;

  if ((objc_msgSend(v4, "isGestureInitiated") & 1) == 0)
  {
    lastGesturedDisplayItem = self->_lastGesturedDisplayItem;
    self->_lastGesturedDisplayItem = 0;

  }
  objc_msgSend(v4, "activatingAppLayout");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31
    && objc_msgSend(v4, "isMainPulseEvent")
    && (objc_msgSend(v4, "toAppLayout"), v32 = (void *)objc_claimAutoreleasedReturnValue(),
                                         v32,
                                         v31 != v32))
  {
    objc_msgSend(v31, "itemForLayoutRole:", 1);
    v33 = (SBDisplayItem *)objc_claimAutoreleasedReturnValue();
    lastPulsedDisplayItem = self->_lastPulsedDisplayItem;
    self->_lastPulsedDisplayItem = v33;
  }
  else
  {
    lastPulsedDisplayItem = self->_lastPulsedDisplayItem;
    self->_lastPulsedDisplayItem = 0;
  }

  objc_msgSend(v4, "unhandledCopy");
  v35 = (SBTransitionSwitcherModifierEvent *)objc_claimAutoreleasedReturnValue();
  lastTransitionEvent = self->_lastTransitionEvent;
  self->_lastTransitionEvent = v35;

  self->_currentUnlockedEnvironmentMode = objc_msgSend(v4, "toEnvironmentMode");
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SBDisplayItem *v9;
  SBDisplayItem *lastGesturedDisplayItem;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleGestureEvent:](&v12, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedAppLayout", v12.receiver, v12.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    objc_msgSend(v6, "itemForLayoutRole:", 1);
    v9 = (SBDisplayItem *)objc_claimAutoreleasedReturnValue();
    lastGesturedDisplayItem = self->_lastGesturedDisplayItem;
    self->_lastGesturedDisplayItem = v9;
  }
  else
  {
    lastGesturedDisplayItem = self->_lastGesturedDisplayItem;
    self->_lastGesturedDisplayItem = 0;
  }

  return v5;
}

- (id)handleUpdateWindowingModeEvent:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v7;
  void *v8;
  SBUpdateLayoutSwitcherEventResponse *v9;
  uint64_t v10;
  SBInvalidateSnapshotCacheSwitcherEventResponse *v11;
  __objc2_class **v12;
  id v13;
  SBTransitionSwitcherModifierEvent *lastTransitionEvent;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  -[SBSwitcherModifier handleUpdateWindowingModeEvent:](&v22, sel_handleUpdateWindowingModeEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("kiPadOSPlatformModifierChildKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBiPadOSPlatformSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_currentUnlockedEnvironmentMode != 3)
    {
      v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
      SBAppendSwitcherModifierResponse(v9, v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    v11 = -[SBInvalidateSnapshotCacheSwitcherEventResponse initWithDisplayItems:]([SBInvalidateSnapshotCacheSwitcherEventResponse alloc], "initWithDisplayItems:", 0);
    SBAppendSwitcherModifierResponse(v11, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v5);
    v12 = off_1E8E95460;
    if (!v6)
      v12 = off_1E8E96EA8;
    v13 = objc_alloc_init(*v12);

    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v13, 0, CFSTR("kiPadOSPlatformModifierChildKey"));
    lastTransitionEvent = self->_lastTransitionEvent;
    if (lastTransitionEvent)
    {
      v15 = (void *)-[SBTransitionSwitcherModifierEvent copy](lastTransitionEvent, "copy");
      -[SBTransitionSwitcherModifierEvent fromAppLayout](self->_lastTransitionEvent, "fromAppLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appLayoutByAdjustingCenterWindowItemsForChamois");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFromAppLayout:", v17);

      -[SBTransitionSwitcherModifierEvent toAppLayout](self->_lastTransitionEvent, "toAppLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appLayoutByAdjustingCenterWindowItemsForChamois");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setToAppLayout:", v19);

      v20 = (id)objc_msgSend(v13, "handleEvent:", v15);
    }

  }
  else
  {
    v13 = v5;
  }

  return v4;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[5];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__SBiPadOSPlatformSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke;
  v11[3] = &unk_1E8EABBA8;
  v11[4] = self;
  v6 = a3;
  objc_msgSend(a4, "sortedArrayUsingComparator:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  -[SBiPadOSPlatformSwitcherModifier preferredAppLayoutToReuseAccessoryForAppLayout:fromAppLayouts:](&v10, sel_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __98__SBiPadOSPlatformSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112)) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v6, "containsItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112)) & 1) != 0
    || objc_msgSend(v5, "containsAnyItemFromSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
    && !objc_msgSend(v6, "containsAnyItemFromSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96)))
  {
    goto LABEL_4;
  }
  if ((objc_msgSend(v5, "containsAnyItemFromSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96)) & 1) == 0
    && (objc_msgSend(v6, "containsAnyItemFromSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96)) & 1) != 0
    || objc_msgSend(v5, "environment") == 2)
  {
    goto LABEL_2;
  }
  if (objc_msgSend(v6, "environment") == 2)
  {
LABEL_4:
    v7 = -1;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "environment") != 3)
  {
    if (objc_msgSend(v6, "environment") == 3)
      goto LABEL_4;
    v9 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v9 + 120))
      goto LABEL_19;
    if ((objc_msgSend(v5, "containsItem:") & 1) == 0)
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v9 + 120))
      {
        if ((objc_msgSend(v6, "containsItem:") & 1) != 0)
          goto LABEL_4;
        v9 = *(_QWORD *)(a1 + 32);
      }
LABEL_19:
      if (!objc_msgSend(v5, "containsAnyItemFromSet:", *(_QWORD *)(v9 + 96))
        || (objc_msgSend(v5, "containsAnyItemFromSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104)) & 1) == 0)
      {
        if (!objc_msgSend(v6, "containsAnyItemFromSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
          || (objc_msgSend(v6, "containsAnyItemFromSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104)) & 1) == 0)
        {
          v7 = 0;
          goto LABEL_5;
        }
        goto LABEL_2;
      }
      goto LABEL_4;
    }
  }
LABEL_2:
  v7 = 1;
LABEL_5:

  return v7;
}

- (id)foregroundAppLayouts
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  -[SBiPadOSPlatformSwitcherModifier foregroundAppLayouts](&v6, sel_foregroundAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet count](self->_activatingLiveAppLayouts, "count"))
  {
    objc_msgSend(v3, "setByAddingObjectsFromSet:", self->_activatingLiveAppLayouts);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (char)jetsamModeForAppLayout:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  if (-[NSSet containsObject:](self->_activatingLiveAppLayouts, "containsObject:", v4))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
    v5 = -[SBiPadOSPlatformSwitcherModifier jetsamModeForAppLayout:](&v7, sel_jetsamModeForAppLayout_, v4);
  }

  return v5;
}

- (char)activityModeForAppLayout:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  if (-[NSSet containsObject:](self->_activatingLiveAppLayouts, "containsObject:", v4))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
    v5 = -[SBiPadOSPlatformSwitcherModifier activityModeForAppLayout:](&v7, sel_activityModeForAppLayout_, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTransitionEvent, 0);
  objc_storeStrong((id *)&self->_activatingLiveAppLayouts, 0);
  objc_storeStrong((id *)&self->_lastPulsedDisplayItem, 0);
  objc_storeStrong((id *)&self->_lastGesturedDisplayItem, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_previousDisplayItems, 0);
}

@end
