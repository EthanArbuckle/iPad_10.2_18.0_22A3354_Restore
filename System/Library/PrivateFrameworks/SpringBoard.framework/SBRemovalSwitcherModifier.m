@implementation SBRemovalSwitcherModifier

- (SBRemovalSwitcherModifier)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 reason:(int64_t)a5
{
  id v10;
  SBRemovalSwitcherModifier *v11;
  void *v13;
  objc_super v14;

  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBRemovalSwitcherModifier;
  v11 = -[SBSwitcherModifier init](&v14, sel_init);
  if (v11)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBRemovalSwitcherModifier.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    v11->_layoutRole = a3;
    objc_storeStrong((id *)&v11->_appLayout, a4);
    v11->_reason = a5;
    v11->_phase = 0;
    v11->_indexToScrollToAfterRemoval = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (id)_remainingAppLayoutForRemovingLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  if ((objc_msgSend(v5, "isCenterOverFull") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "itemForLayoutRole:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__SBRemovalSwitcherModifier__remainingAppLayoutForRemovingLayoutRole_inAppLayout___block_invoke;
    v10[3] = &unk_1E8E9DF50;
    v11 = v7;
    v8 = v7;
    objc_msgSend(v5, "appLayoutWithItemsPassingTest:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

BOOL __82__SBRemovalSwitcherModifier__remainingAppLayoutForRemovingLayoutRole_inAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *appLayout;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  NSSet *v11;
  NSSet *visibleAppLayoutsPriorToRemoval;
  SBAppLayout *v13;
  SBAppLayout *resultingAppLayoutIfAny;
  SBUpdateLayoutSwitcherEventResponse *v15;
  uint64_t v16;
  SBUpdateLayoutSwitcherEventResponse *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  SBScrollToAppLayoutSwitcherEventResponse *v23;
  uint64_t v24;
  SBUpdateLayoutSwitcherEventResponse *v25;
  SBInvalidateSnapshotCacheSwitcherEventResponse *v26;
  void *v27;
  SBInvalidateSnapshotCacheSwitcherEventResponse *v28;
  objc_super v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBRemovalSwitcherModifier;
  -[SBSwitcherModifier handleRemovalEvent:](&v31, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  appLayout = self->_appLayout;
  objc_msgSend(v4, "appLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(appLayout) = -[SBAppLayout isEqual:](appLayout, "isEqual:", v7);

  if ((_DWORD)appLayout)
  {
    v8 = objc_msgSend(v4, "phase");
    self->_phase = v8;
    switch(v8)
    {
      case 3uLL:
        if (self->_reason != 1)
        {
          v17 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
          +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v17, v5);
          v18 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v18;
        }
        v15 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, 3);
        +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v15, v5);
        v19 = objc_claimAutoreleasedReturnValue();

        -[SBChainableModifier setState:](self, "setState:", 1);
        v5 = (void *)v19;
        goto LABEL_19;
      case 2uLL:
        v15 = objc_alloc_init(SBSwitcherModifierEventResponse);
        -[SBRemovalSwitcherModifier appLayouts](self, "appLayouts");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        if (self->_indexToScrollToAfterRemoval >= v21)
        {
          v24 = v21;
          SBLogAppSwitcher();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            -[SBRemovalSwitcherModifier handleRemovalEvent:].cold.1((uint64_t *)&self->_indexToScrollToAfterRemoval, v24, v22);
        }
        else
        {
          objc_msgSend(v20, "objectAtIndex:");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v22, 0, 0);
          -[SBChainableModifierEventResponse addChildResponse:](v15, "addChildResponse:", v23);

        }
        if (self->_reason == 1)
        {
          v25 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
          -[SBChainableModifierEventResponse addChildResponse:](v15, "addChildResponse:", v25);
          if (self->_resultingAppLayoutIfAny)
          {
            v26 = [SBInvalidateSnapshotCacheSwitcherEventResponse alloc];
            -[SBAppLayout allItems](self->_resultingAppLayoutIfAny, "allItems");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = -[SBInvalidateSnapshotCacheSwitcherEventResponse initWithDisplayItems:](v26, "initWithDisplayItems:", v27);

            -[SBChainableModifierEventResponse addChildResponse:](v15, "addChildResponse:", v28);
          }

        }
        +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v15, v5);
        v16 = objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      case 1uLL:
        -[SBRemovalSwitcherModifier appLayouts](self, "appLayouts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "indexOfObject:", self->_appLayout);

        self->_indexToScrollToAfterRemoval = -[SBRemovalSwitcherModifier indexToScrollToAfterRemovingIndex:](self, "indexToScrollToAfterRemovingIndex:", v10);
        self->_indexOfAppLayoutPriorToRemoval = v10;
        v30.receiver = self;
        v30.super_class = (Class)SBRemovalSwitcherModifier;
        -[SBRemovalSwitcherModifier visibleAppLayouts](&v30, sel_visibleAppLayouts);
        v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
        visibleAppLayoutsPriorToRemoval = self->_visibleAppLayoutsPriorToRemoval;
        self->_visibleAppLayoutsPriorToRemoval = v11;

        -[SBRemovalSwitcherModifier _remainingAppLayoutForRemovingLayoutRole:inAppLayout:](self, "_remainingAppLayoutForRemovingLayoutRole:inAppLayout:", self->_layoutRole, self->_appLayout);
        v13 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
        resultingAppLayoutIfAny = self->_resultingAppLayoutIfAny;
        self->_resultingAppLayoutIfAny = v13;

        v15 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
        +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v15, v5);
        v16 = objc_claimAutoreleasedReturnValue();

LABEL_18:
        v5 = (void *)v16;
LABEL_19:

        break;
    }
  }

  return v5;
}

- (id)handleInsertionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRemovalSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleInsertionEvent:](&v8, sel_handleInsertionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = BSEqualObjects();
  if ((_DWORD)v4)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (id)handleResizeProgressEvent:(id)a3
{
  id v4;
  void *v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "progress");
  -[SBRemovalSwitcherModifier medusaSettings](self, "medusaSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resizeAnimationUnblurThresholdPercentage");
  self->_hasResizedEnoughToUnblur = BSFloatGreaterThanOrEqualToFloat();

  v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  v10.receiver = self;
  v10.super_class = (Class)SBRemovalSwitcherModifier;
  -[SBSwitcherModifier handleResizeProgressEvent:](&v10, sel_handleResizeProgressEvent_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  v9.receiver = self;
  v9.super_class = (Class)SBRemovalSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v9, sel_handleSceneReadyEvent_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  unsigned __int16 v5;
  SBSwitcherAsyncRenderingAttributes v6;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isOrContainsAppLayout:", self->_appLayout) & 1) != 0
    || objc_msgSend(v4, "isOrContainsAppLayout:", self->_resultingAppLayoutIfAny))
  {
    v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRemovalSwitcherModifier;
    v5 = (unsigned __int16)-[SBRemovalSwitcherModifier asyncRenderingAttributesForAppLayout:](&v8, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  SBAppLayout **p_appLayout;
  BOOL v8;
  SBAppLayout *v9;
  SBAppLayout *v10;

  v6 = a4;
  p_appLayout = &self->_appLayout;
  if (((objc_msgSend(v6, "isOrContainsAppLayout:", self->_appLayout) & 1) != 0
     || objc_msgSend(v6, "isOrContainsAppLayout:", self->_resultingAppLayoutIfAny))
    && self->_layoutRole == 4)
  {
    goto LABEL_6;
  }
  if (self->_phase == 1)
  {
    if (self->_layoutRole == a3)
    {
LABEL_6:
      v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    p_appLayout = &self->_resultingAppLayoutIfAny;
  }
  v9 = *p_appLayout;
  v10 = v9;
  v8 = v9
    && -[SBAppLayout isEqual:](v9, "isEqual:", v6)
    && (!-[SBRemovalSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, v10)|| !self->_hasResizedEnoughToUnblur);

LABEL_15:
  return v8;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t phase;
  void *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  objc_super v18;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  v18.receiver = self;
  v18.super_class = (Class)SBRemovalSwitcherModifier;
  -[SBRemovalSwitcherModifier visibleAppLayouts](&v18, sel_visibleAppLayouts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSet:", v4);

  -[NSSet allObjects](self->_visibleAppLayoutsPriorToRemoval, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(v5, "addObject:", self->_appLayout);
  phase = self->_phase;
  if (phase)
  {
    if (phase == 1)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__95;
      v16 = __Block_byref_object_dispose__95;
      v17 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __46__SBRemovalSwitcherModifier_visibleAppLayouts__block_invoke;
      v11[3] = &unk_1E8E9DFA0;
      v11[4] = self;
      v11[5] = &v12;
      -[SBRemovalSwitcherModifier _performBlockWhileSimulatingPostRemovalAppLayoutState:](self, "_performBlockWhileSimulatingPostRemovalAppLayoutState:", v11);
      v8 = (void *)v13[5];
      if (v8)
      {
        objc_msgSend(v8, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v9);

      }
      _Block_object_dispose(&v12, 8);

    }
    else if (self->_reason == 1)
    {
      objc_msgSend(v5, "removeObject:", self->_appLayout);
    }
  }
  return v5;
}

void __46__SBRemovalSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBRemovalSwitcherModifier;
  objc_msgSendSuper2(&v5, sel_visibleAppLayouts);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBRemovalSwitcherModifier;
  -[SBRemovalSwitcherModifier animationAttributesForLayoutElement:](&v17, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (self->_phase == 2)
  {
    v7 = 3;
LABEL_5:
    objc_msgSend(v6, "setUpdateMode:", v7);
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "updateMode") == 1)
  {
    v7 = 2;
    goto LABEL_5;
  }
LABEL_6:
  if (!objc_msgSend(v4, "switcherLayoutElementType")
    && objc_msgSend(v4, "isOrContainsAppLayout:", self->_appLayout))
  {
    -[SBRemovalSwitcherModifier medusaSettings](self, "medusaSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resizeAnimationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setLayoutSettings:", v9);
    objc_msgSend(v6, "setPositionSettings:", v9);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    -[SBRemovalSwitcherModifier switcherSettings](self, "switcherSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appSwitcherTitleAndIconFadeInSlowDownFactor");
    v14 = v13;

    objc_msgSend(v9, "response");
    objc_msgSend(v10, "setResponse:", v14 * v15);
    objc_msgSend(v6, "setOpacitySettings:", v10);

  }
  return v6;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  BOOL v7;
  objc_super v9;

  -[SBRemovalSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_appLayout)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBRemovalSwitcherModifier;
    v7 = -[SBRemovalSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  SBAppLayout *resultingAppLayoutIfAny;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBRemovalSwitcherModifier;
  -[SBRemovalSwitcherModifier resizeProgressNotificationsForLayoutRole:inAppLayout:](&v16, sel_resizeProgressNotificationsForLayoutRole_inAppLayout_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  resultingAppLayoutIfAny = self->_resultingAppLayoutIfAny;
  if (resultingAppLayoutIfAny && -[SBAppLayout isEqual:](resultingAppLayoutIfAny, "isEqual:", v6))
  {
    -[SBRemovalSwitcherModifier medusaSettings](self, "medusaSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resizeAnimationUnblurThresholdPercentage");
    v11 = v10;

    v17[0] = &unk_1E91CFA08;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v14;
  }

  return v7;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  if (!self->_resultingAppLayoutIfAny || self->_phase < 2)
    return 0;
  -[SBRemovalSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBAppLayout isEqual:](self->_resultingAppLayoutIfAny, "isEqual:", v6);
  return v7;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[SBAppLayout isOrContainsAppLayout:](self->_appLayout, "isOrContainsAppLayout:", v4))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRemovalSwitcherModifier;
    v5 = -[SBRemovalSwitcherModifier shouldAccessoryDrawShadowForAppLayout:](&v7, sel_shouldAccessoryDrawShadowForAppLayout_, v4);
  }

  return v5;
}

- (void)_performBlockWhileSimulatingPostRemovalAppLayoutState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  SBAppLayout *appLayout;
  id v9;
  id v10;
  SBOverrideAppLayoutsSwitcherModifier *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[SBRemovalSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  appLayout = self->_appLayout;
  if (self->_resultingAppLayoutIfAny)
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", objc_msgSend(v7, "indexOfObject:", appLayout), self->_resultingAppLayoutIfAny);
  else
    objc_msgSend(v7, "removeObject:", appLayout);
  v11 = -[SBOverrideAppLayoutsSwitcherModifier initWithAppLayouts:]([SBOverrideAppLayoutsSwitcherModifier alloc], "initWithAppLayouts:", v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__SBRemovalSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke;
  v12[3] = &unk_1E8E9F7B8;
  v12[4] = self;
  v13 = v7;
  v14 = v4;
  v9 = v4;
  v10 = v7;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v11, v12);

}

void __83__SBRemovalSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke(id *a1)
{
  unint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  SBOverrideScrollViewContentOffsetSwitcherModifier *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v2 = *((_QWORD *)a1[4] + 17);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL || v2 >= objc_msgSend(a1[5], "count"))
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v3 = *((_QWORD *)a1[4] + 17);
    v10.receiver = a1[4];
    v10.super_class = (Class)SBRemovalSwitcherModifier;
    objc_msgSendSuper2(&v10, sel_contentOffsetForIndex_alignment_, v3, 0);
    v6 = -[SBOverrideScrollViewContentOffsetSwitcherModifier initWithScrollViewContentOffset:]([SBOverrideScrollViewContentOffsetSwitcherModifier alloc], "initWithScrollViewContentOffset:", v4, v5);
    v7 = a1[4];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__SBRemovalSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke_2;
    v8[3] = &unk_1E8E9E8D0;
    v9 = a1[6];
    objc_msgSend(v7, "performTransactionWithTemporaryChildModifier:usingBlock:", v6, v8);

  }
}

uint64_t __83__SBRemovalSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  int *v7;
  double v8;
  double v9;
  objc_super v11;

  -[SBRemovalSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (objc_class *)objc_claimAutoreleasedReturnValue();

  if (self->_phase == 1)
    v7 = &OBJC_IVAR___SBRemovalSwitcherModifier__appLayout;
  else
    v7 = &OBJC_IVAR___SBRemovalSwitcherModifier__resultingAppLayoutIfAny;
  if (v6 == *(objc_class **)((char *)&self->super.super.super.isa + *v7))
  {
    v9 = 0.0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRemovalSwitcherModifier;
    -[SBRemovalSwitcherModifier blurViewIconScaleForIndex:](&v11, sel_blurViewIconScaleForIndex_, a3);
    v9 = v8;
  }

  return v9;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t indexOfAppLayoutPriorToRemoval;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)SBRemovalSwitcherModifier;
  -[SBRemovalSwitcherModifier topMostLayoutElements](&v23, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_phase == 2)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)MEMORY[0x1E0CB36B8];
    v7 = objc_msgSend(v4, "count");
    if (v7 >= self->_indexOfAppLayoutPriorToRemoval)
      indexOfAppLayoutPriorToRemoval = self->_indexOfAppLayoutPriorToRemoval;
    else
      indexOfAppLayoutPriorToRemoval = v7;
    objc_msgSend(v6, "indexSetWithIndexesInRange:", 0, indexOfAppLayoutPriorToRemoval);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

    -[SBAppLayout leafAppLayoutForRole:](self->_appLayout, "leafAppLayoutForRole:", self->_layoutRole);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);
    if (v4)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v12 = v4;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v5, "containsObject:", v17, (_QWORD)v19) & 1) == 0)
              objc_msgSend(v5, "addObject:", v17);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v14);
      }

    }
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultingAppLayoutIfAny, 0);
  objc_storeStrong((id *)&self->_visibleAppLayoutsPriorToRemoval, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (void)handleRemovalEvent:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "Not scrolling after app removal. The index to scroll to (%lu) is no longer valid. The list of app layouts has %lu elements only.", (uint8_t *)&v4, 0x16u);
}

@end
