@implementation SBCardDropSwitcherModifier

- (SBCardDropSwitcherModifier)initWithDropContext:(id)a3
{
  id v5;
  SBCardDropSwitcherModifier *v6;
  SBCardDropSwitcherModifier *v7;
  uint64_t v8;
  SBAppLayout *finalAppLayout;
  uint64_t v10;
  SBAppLayout *remainingAppLayout;
  uint64_t v12;
  SBAppLayout *evictedAppLayout;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBCardDropSwitcherModifier;
  v6 = -[SBSwitcherModifier init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dropContext, a3);
    objc_msgSend(v5, "finalTargetAppLayout");
    v8 = objc_claimAutoreleasedReturnValue();
    finalAppLayout = v7->_finalAppLayout;
    v7->_finalAppLayout = (SBAppLayout *)v8;

    objc_msgSend(v5, "remainingAppLayout");
    v10 = objc_claimAutoreleasedReturnValue();
    remainingAppLayout = v7->_remainingAppLayout;
    v7->_remainingAppLayout = (SBAppLayout *)v10;

    objc_msgSend(v5, "evictedAppLayout");
    v12 = objc_claimAutoreleasedReturnValue();
    evictedAppLayout = v7->_evictedAppLayout;
    v7->_evictedAppLayout = (SBAppLayout *)v12;

    v7->_shouldExpectMainTransitionEvent = SBSwitcherDropRegionWarrantsModelUpdate(objc_msgSend(v5, "currentDropRegion"));
    v7->_handledMainTransitionEvent = 0;
    v7->_waitingForReflowAnimation = 1;
    v7->_waitingForHeaderFadeIn = 1;
  }

  return v7;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  objc_super v8;
  objc_super v9;
  CGPoint result;

  if (self->_phase == 2)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBCardDropSwitcherModifier;
    -[SBCardDropSwitcherModifier contentOffsetForIndex:alignment:](&v9, sel_contentOffsetForIndex_alignment_, a3, a4);
    v7 = v6 - self->_referenceCardOffsetFromPageBoundary.x;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCardDropSwitcherModifier;
    -[SBCardDropSwitcherModifier contentOffsetForIndex:alignment:](&v8, sel_contentOffsetForIndex_alignment_, a3, a4);
  }
  result.y = v5;
  result.x = v7;
  return result;
}

- (void)_completeIfNeeded
{
  if (self->_phase == 3 && !self->_waitingForHeaderFadeIn)
    -[SBChainableModifier setState:](self, "setState:", 1);
}

- (id)handleSwitcherDropEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SBOverrideScrollViewContentOffsetSwitcherModifier *v13;
  __int128 v14;
  SBSwitcherModifierEventResponse *v15;
  void *v16;
  void *v17;
  SBScrollToAppLayoutSwitcherEventResponse *v18;
  void *v19;
  SBInvalidateSnapshotCacheSwitcherEventResponse *v20;
  SBInvalidateItemContainerBackdropEventResponse *v21;
  SBUpdateLayoutSwitcherEventResponse *v22;
  SBUpdateLayoutSwitcherEventResponse *v23;
  SBUpdateDragPlatterBlurSwitcherEventResponse *v24;
  uint64_t v25;
  _QWORD v27[7];
  uint64_t v28;
  double *v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SBCardDropSwitcherModifier;
  -[SBSwitcherModifier handleSwitcherDropEvent:](&v34, sel_handleSwitcherDropEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase");
  self->_phase = v6;
  -[SBCardDropSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v7);

  if (v6 == 3)
  {
    -[SBCardDropSwitcherModifier _completeIfNeeded](self, "_completeIfNeeded");
  }
  else if (v6 == 2)
  {
    v15 = objc_alloc_init(SBSwitcherModifierEventResponse);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SBCardDropSwitcherModifier appLayouts](self, "appLayouts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v17, 0, 0);
      -[SBChainableModifierEventResponse addChildResponse:](v15, "addChildResponse:", v18);

    }
    -[SBSwitcherDropRegionContext displayItemsToReloadSnapshots](self->_dropContext, "displayItemsToReloadSnapshots");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SBInvalidateSnapshotCacheSwitcherEventResponse initWithDisplayItems:]([SBInvalidateSnapshotCacheSwitcherEventResponse alloc], "initWithDisplayItems:", v19);
    -[SBChainableModifierEventResponse addChildResponse:](v15, "addChildResponse:", v20);
    v21 = -[SBInvalidateItemContainerBackdropEventResponse initWithUpdateMode:]([SBInvalidateItemContainerBackdropEventResponse alloc], "initWithUpdateMode:", 3);
    -[SBChainableModifierEventResponse addChildResponse:](v15, "addChildResponse:", v21);
    v22 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
    -[SBChainableModifierEventResponse addChildResponse:](v15, "addChildResponse:", v22);
    v23 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 2);
    -[SBChainableModifierEventResponse addChildResponse:](v15, "addChildResponse:", v23);
    v24 = objc_alloc_init(SBUpdateDragPlatterBlurSwitcherEventResponse);
    -[SBChainableModifierEventResponse addChildResponse:](v15, "addChildResponse:", v24);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v15, v5);
    v25 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v25;
  }
  else if (v6 == 1 && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBSwitcherModifier scaledFrameForIndex:](self, "scaledFrameForIndex:", v8);
    v10 = v9;
    -[SBCardDropSwitcherModifier contentOffsetForIndex:alignment:](self, "contentOffsetForIndex:alignment:", v8, 0);
    v13 = -[SBOverrideScrollViewContentOffsetSwitcherModifier initWithScrollViewContentOffset:]([SBOverrideScrollViewContentOffsetSwitcherModifier alloc], "initWithScrollViewContentOffset:", v11, v12);
    v28 = 0;
    v29 = (double *)&v28;
    v30 = 0x4010000000;
    v31 = &unk_1D0FA064E;
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v32 = *MEMORY[0x1E0C9D648];
    v33 = v14;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __54__SBCardDropSwitcherModifier_handleSwitcherDropEvent___block_invoke;
    v27[3] = &unk_1E8E9FD08;
    v27[4] = self;
    v27[5] = &v28;
    v27[6] = v8;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v13, v27);
    self->_referenceCardOffsetFromPageBoundary.x = v10 - v29[4];
    self->_referenceCardOffsetFromPageBoundary.y = 0.0;
    _Block_object_dispose(&v28, 8);

  }
  return v5;
}

uint64_t __54__SBCardDropSwitcherModifier_handleSwitcherDropEvent___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "scaledFrameForIndex:", *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (id)handleAnimatablePropertyChangedEvent:(id)a3
{
  void *v4;
  void *v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  void *v7;
  SBTimerEventSwitcherEventResponse *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBCardDropSwitcherModifier;
  -[SBSwitcherModifier handleAnimatablePropertyChangedEvent:](&v10, sel_handleAnimatablePropertyChangedEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCardDropSwitcherModifier presentationValueForAnimatableProperty:](self, "presentationValueForAnimatableProperty:", CFSTR("SBCardDropSwitcherModifierAnimatablePropertyIdentifier"));
  -[SBCardDropSwitcherModifier medusaSettings](self, "medusaSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reflowAnimationProgressForCardHeaderFadeIn");

  if (BSFloatGreaterThanOrEqualToFloat() && self->_waitingForReflowAnimation)
  {
    self->_waitingForReflowAnimation = 0;
    v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
    SBAppendSwitcherModifierResponse(v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("SBCardDropSwitcherModifierTimerEventHeaderVisibleReason"), 0.0);
    SBAppendSwitcherModifierResponse(v8, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  _QWORD v9[5];
  objc_super v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__34;
  v15 = __Block_byref_object_dispose__34;
  v10.receiver = self;
  v10.super_class = (Class)SBCardDropSwitcherModifier;
  -[SBSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SBCardDropSwitcherModifier_handleTimerEvent___block_invoke;
  v9[3] = &unk_1E8EAABA8;
  v9[4] = &v11;
  -[SBCardDropSwitcherModifier _recomputeBlurStateWithCompletion:](self, "_recomputeBlurStateWithCompletion:", v9);
  objc_msgSend(v4, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SBCardDropSwitcherModifierTimerEventHeaderVisibleReason"));

  if (v6)
  {
    self->_waitingForHeaderFadeIn = 0;
    -[SBCardDropSwitcherModifier _completeIfNeeded](self, "_completeIfNeeded");
  }
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __47__SBCardDropSwitcherModifier_handleTimerEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  SBAppendSwitcherModifierResponse(a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  objc_super v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__34;
  v16 = __Block_byref_object_dispose__34;
  v11.receiver = self;
  v11.super_class = (Class)SBCardDropSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v11, sel_handleSceneReadyEvent_, v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  SBAppendSwitcherModifierResponse(v5, v13[5]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v13[5];
  v13[5] = v6;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__SBCardDropSwitcherModifier_handleSceneReadyEvent___block_invoke;
  v10[3] = &unk_1E8EAABA8;
  v10[4] = &v12;
  -[SBCardDropSwitcherModifier _recomputeBlurStateWithCompletion:](self, "_recomputeBlurStateWithCompletion:", v10);
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __52__SBCardDropSwitcherModifier_handleSceneReadyEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  SBAppendSwitcherModifierResponse(a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)handleBlurProgressEvent:(id)a3
{
  id v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  objc_super v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__34;
  v16 = __Block_byref_object_dispose__34;
  v11.receiver = self;
  v11.super_class = (Class)SBCardDropSwitcherModifier;
  -[SBSwitcherModifier handleBlurProgressEvent:](&v11, sel_handleBlurProgressEvent_, v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  SBAppendSwitcherModifierResponse(v5, v13[5]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v13[5];
  v13[5] = v6;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__SBCardDropSwitcherModifier_handleBlurProgressEvent___block_invoke;
  v10[3] = &unk_1E8EAABA8;
  v10[4] = &v12;
  -[SBCardDropSwitcherModifier _recomputeBlurStateWithCompletion:](self, "_recomputeBlurStateWithCompletion:", v10);
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __54__SBCardDropSwitcherModifier_handleBlurProgressEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  SBAppendSwitcherModifierResponse(a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *v6;
  SBAppLayout *finalAppLayout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCardDropSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTransitionEvent:](&v9, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAppLayout", v9.receiver, v9.super_class);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  finalAppLayout = self->_finalAppLayout;
  if (v6 == finalAppLayout)
    self->_handledMainTransitionEvent = 1;
  return v5;
}

- (void)_recomputeBlurStateWithCompletion:(id)a3
{
  void (**v4)(id, SBUpdateDragPlatterBlurSwitcherEventResponse *);
  _BOOL4 isFinalAppLayoutBlurred;
  SBAppLayout *finalAppLayout;
  uint64_t *v7;
  char v8;
  SBUpdateDragPlatterBlurSwitcherEventResponse *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = (void (**)(id, SBUpdateDragPlatterBlurSwitcherEventResponse *))a3;
  isFinalAppLayoutBlurred = self->_isFinalAppLayoutBlurred;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (self->_shouldExpectMainTransitionEvent && !self->_handledMainTransitionEvent)
  {
    v8 = 1;
    v14 = 1;
    v7 = &v11;
  }
  else
  {
    finalAppLayout = self->_finalAppLayout;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__SBCardDropSwitcherModifier__recomputeBlurStateWithCompletion___block_invoke;
    v10[3] = &unk_1E8EA85E0;
    v10[4] = self;
    v10[5] = &v11;
    -[SBAppLayout enumerate:](finalAppLayout, "enumerate:", v10);
    v7 = v12;
    v8 = *((_BYTE *)v12 + 24);
  }
  self->_isFinalAppLayoutBlurred = v8;
  if (isFinalAppLayoutBlurred && v4 && !*((_BYTE *)v7 + 24))
  {
    v9 = objc_alloc_init(SBUpdateDragPlatterBlurSwitcherEventResponse);
    v4[2](v4, v9);

  }
  _Block_object_dispose(&v11, 8);

}

uint64_t __64__SBCardDropSwitcherModifier__recomputeBlurStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isLayoutRoleContentReady:inAppLayout:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  void *v7;
  BOOL v8;
  void *v9;

  v6 = (SBAppLayout *)a4;
  -[SBAppLayout leafAppLayoutForRole:](v6, "leafAppLayoutForRole:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_finalAppLayout == v6)
  {
    -[SBSwitcherDropRegionContext droppedLeafAppLayout](self->_dropContext, "droppedLeafAppLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7 != v9 && self->_isFinalAppLayoutBlurred;
  }
  else
  {
    v8 = -[SBCardDropSwitcherModifier _appLayoutContainsModifiedAppLayout:](self, "_appLayoutContainsModifiedAppLayout:", v6);
  }

  return v8;
}

- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return -[SBCardDropSwitcherModifier _appLayoutContainsModifiedAppLayout:](self, "_appLayoutContainsModifiedAppLayout:", a4);
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  SBCardDropSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBCardDropSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[SBCardDropSwitcherModifier _appLayoutContainsModifiedAppLayout:](v4, "_appLayoutContainsModifiedAppLayout:", v6);

  return (char)v4;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  SBCardDropSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBCardDropSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[SBCardDropSwitcherModifier _appLayoutContainsModifiedAppLayout:](v4, "_appLayoutContainsModifiedAppLayout:", v6);

  return (char)v4;
}

- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)topMostLayoutElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  if (self->_phase < 2)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCardDropSwitcherModifier;
    -[SBCardDropSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E10]);
    v9.receiver = self;
    v9.super_class = (Class)SBCardDropSwitcherModifier;
    -[SBCardDropSwitcherModifier topMostLayoutElements](&v9, sel_topMostLayoutElements);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

    if (self->_finalAppLayout)
    {
      if ((objc_msgSend(v5, "containsObject:") & 1) == 0)
        objc_msgSend(v5, "insertObject:atIndex:", self->_finalAppLayout, 0);
    }
    objc_msgSend(v5, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBCardDropSwitcherModifier;
  -[SBCardDropSwitcherModifier titleAndIconOpacityForIndex:](&v10, sel_titleAndIconOpacityForIndex_);
  v6 = v5;
  -[SBCardDropSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBCardDropSwitcherModifier _appLayoutContainsModifiedAppLayout:](self, "_appLayoutContainsModifiedAppLayout:", v8)&& self->_waitingForReflowAnimation)
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCardDropSwitcherModifier;
  -[SBCardDropSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBCardDropSwitcherModifier medusaSettings](self, "medusaSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switcherCardDropAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLayoutSettings:", v7);
  objc_msgSend(v5, "setPositionSettings:", v7);
  objc_msgSend(v5, "setScaleSettings:", v7);
  objc_msgSend(v5, "setCornerRadiusSettings:", v7);
  objc_msgSend(v5, "setUpdateMode:", 3);

  return v5;
}

- (id)animatablePropertyIdentifiers
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("SBCardDropSwitcherModifierAnimatablePropertyIdentifier"), 0);
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBCardDropSwitcherModifierAnimatablePropertyIdentifier")) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCardDropSwitcherModifier;
    v5 = -[SBCardDropSwitcherModifier updateModeForAnimatableProperty:](&v7, sel_updateModeForAnimatableProperty_, v4);
  }

  return v5;
}

- (id)settingsForAnimatableProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBCardDropSwitcherModifierAnimatablePropertyIdentifier")))
  {
    -[SBCardDropSwitcherModifier medusaSettings](self, "medusaSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medusaAnimationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCardDropSwitcherModifier;
    -[SBCardDropSwitcherModifier settingsForAnimatableProperty:](&v8, sel_settingsForAnimatableProperty_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SBCardDropSwitcherModifierAnimatablePropertyIdentifier")))
  {
    if (v5)
      v9 = 0.0;
    else
      v9 = 1.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBCardDropSwitcherModifier;
    -[SBCardDropSwitcherModifier modelValueForAnimatableProperty:currentValue:creating:](&v12, sel_modelValueForAnimatableProperty_currentValue_creating_, v8, v5, a4);
    v9 = v10;
  }

  return v9;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  unsigned __int16 v5;
  SBSwitcherAsyncRenderingAttributes v6;
  objc_super v8;

  v4 = a3;
  if (-[SBCardDropSwitcherModifier _appLayoutContainsModifiedAppLayout:](self, "_appLayoutContainsModifiedAppLayout:", v4))
  {
    v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCardDropSwitcherModifier;
    v5 = (unsigned __int16)-[SBCardDropSwitcherModifier asyncRenderingAttributesForAppLayout:](&v8, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (BOOL)isScrollEnabled
{
  return 0;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  BOOL v7;
  objc_super v9;

  -[SBCardDropSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_finalAppLayout || v6 == self->_evictedAppLayout || v6 == self->_remainingAppLayout)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBCardDropSwitcherModifier;
    v7 = -[SBCardDropSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (BOOL)_appLayoutContainsModifiedAppLayout:(id)a3
{
  id v4;
  id v5;
  void *v6;
  SBAppLayout *remainingAppLayout;
  void *v8;
  SBAppLayout *evictedAppLayout;
  void *v10;
  char v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[SBAppLayout allItems](self->_finalAppLayout, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  remainingAppLayout = self->_remainingAppLayout;
  if (remainingAppLayout)
  {
    -[SBAppLayout allItems](remainingAppLayout, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

  }
  evictedAppLayout = self->_evictedAppLayout;
  if (evictedAppLayout)
  {
    -[SBAppLayout allItems](evictedAppLayout, "allItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

  }
  v11 = objc_msgSend(v4, "containsAnyItemFromSet:", v5);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evictedAppLayout, 0);
  objc_storeStrong((id *)&self->_remainingAppLayout, 0);
  objc_storeStrong((id *)&self->_finalAppLayout, 0);
  objc_storeStrong((id *)&self->_dropContext, 0);
}

@end
