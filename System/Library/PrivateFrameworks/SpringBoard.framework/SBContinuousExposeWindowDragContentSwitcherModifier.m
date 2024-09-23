@implementation SBContinuousExposeWindowDragContentSwitcherModifier

- (SBContinuousExposeWindowDragContentSwitcherModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4 selectedDisplayItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBContinuousExposeWindowDragContentSwitcherModifier *v11;
  SBContinuousExposeWindowDragContentSwitcherModifier *v12;
  SBContinuousExposeWindowDragSwitcherModifier *v13;
  SBContinuousExposeWindowDragSwitcherModifier *gestureModifier;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeWindowDragContentSwitcherModifier;
  v11 = -[SBSwitcherModifier init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_selectedDisplayItem, a5);
    v13 = -[SBContinuousExposeWindowDragSwitcherModifier initWithGestureID:initialAppLayout:selectedDisplayItem:]([SBContinuousExposeWindowDragSwitcherModifier alloc], "initWithGestureID:initialAppLayout:selectedDisplayItem:", v8, v9, v10);
    gestureModifier = v12->_gestureModifier;
    v12->_gestureModifier = v13;

    -[SBChainableModifier addChildModifier:atLevel:key:](v12, "addChildModifier:atLevel:key:", v12->_gestureModifier, 0, 0);
    -[SBContinuousExposeWindowDragContentSwitcherModifier _createFloorAndMultitaskingModifiersWithAppLayout:](v12, "_createFloorAndMultitaskingModifiersWithAppLayout:", v9);
  }

  return v12;
}

- (void)updateFloorModifiersWithAppLayout:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("SBContinuousExposeWindowDragContentSwitcherModifierFloorModifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v4);
  -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("SBContinuousExposeWindowDragContentSwitcherModifierMultitaskingModifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v5);
  -[SBContinuousExposeWindowDragContentSwitcherModifier _createFloorAndMultitaskingModifiersWithAppLayout:](self, "_createFloorAndMultitaskingModifiersWithAppLayout:", v6);

}

- (void)_createFloorAndMultitaskingModifiersWithAppLayout:(id)a3
{
  id v4;
  SBAppSwitcherContinuousExposeSwitcherModifier *v5;
  SBFullScreenContinuousExposeSwitcherModifier *v6;

  v4 = a3;
  v6 = -[SBFullScreenContinuousExposeSwitcherModifier initWithFullScreenAppLayout:]([SBFullScreenContinuousExposeSwitcherModifier alloc], "initWithFullScreenAppLayout:", v4);

  -[SBFullScreenContinuousExposeSwitcherModifier setHandlesTapAppLayoutEvents:](v6, "setHandlesTapAppLayoutEvents:", 0);
  -[SBFullScreenContinuousExposeSwitcherModifier setHandlesTapAppLayoutHeaderEvents:](v6, "setHandlesTapAppLayoutHeaderEvents:", 0);
  -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v6, 1, CFSTR("SBContinuousExposeWindowDragContentSwitcherModifierFloorModifier"));
  v5 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
  -[SBAppSwitcherContinuousExposeSwitcherModifier setHandlesTapAppLayoutEvents:](v5, "setHandlesTapAppLayoutEvents:", 0);
  -[SBAppSwitcherContinuousExposeSwitcherModifier setHandlesTapAppLayoutHeaderEvents:](v5, "setHandlesTapAppLayoutHeaderEvents:", 0);
  -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v5, 2, CFSTR("SBContinuousExposeWindowDragContentSwitcherModifierMultitaskingModifier"));

}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeWindowDragContentSwitcherModifier;
  -[SBContinuousExposeWindowDragContentSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v16, sel_adjustedAppLayoutsForAppLayouts_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "containsItem:", self->_selectedDisplayItem))
          v13 = v5;
        else
          v13 = v6;
        objc_msgSend(v13, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (SBContinuousExposeWindowDragSwitcherModifier)gestureModifier
{
  return self->_gestureModifier;
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_gestureModifier, 0);
}

@end
