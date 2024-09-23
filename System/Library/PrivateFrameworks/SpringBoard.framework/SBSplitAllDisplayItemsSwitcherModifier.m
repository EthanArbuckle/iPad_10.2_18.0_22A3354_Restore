@implementation SBSplitAllDisplayItemsSwitcherModifier

- (id)handleEvent:(id)a3
{
  id v4;
  void *v5;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  if (*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1)
    || -[SBChainableModifier state](self, "state") == 1)
  {
    v5 = 0;
  }
  else
  {
    *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = 1;
    v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12.receiver = self;
  v12.super_class = (Class)SBSplitAllDisplayItemsSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v12, sel_handleEvent_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 2)
    && -[SBChainableModifier state](self, "state") == 1)
  {
    *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 2) = 1;
    v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v9, v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SBSplitAllDisplayItemsSwitcherModifier *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v17 = self;
  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v29;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(obj);
        v21 = v6;
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v7, "allItems", v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
              v23[0] = v5;
              v23[1] = 3221225472;
              v23[2] = __74__SBSplitAllDisplayItemsSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
              v23[3] = &unk_1E8E9DF50;
              v23[4] = v13;
              objc_msgSend(v7, "appLayoutWithItemsPassingTest:", v23);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v14);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v10);
        }

        v6 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v20);
  }

  v22.receiver = v17;
  v22.super_class = (Class)SBSplitAllDisplayItemsSwitcherModifier;
  -[SBSplitAllDisplayItemsSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v22, sel_adjustedAppLayoutsForAppLayouts_, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __74__SBSplitAllDisplayItemsSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke()
{
  return BSEqualObjects();
}

- (BOOL)hasInvalidatedAppLayoutsForInsertion
{
  return *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1);
}

- (void)setHasInvalidatedAppLayoutsForInsertion:(BOOL)a3
{
  *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = a3;
}

- (BOOL)hasInvalidatedAppLayoutsForRemoval
{
  return *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 2);
}

- (void)setHasInvalidatedAppLayoutsForRemoval:(BOOL)a3
{
  *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 2) = a3;
}

@end
