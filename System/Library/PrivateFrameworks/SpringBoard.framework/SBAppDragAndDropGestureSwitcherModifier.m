@implementation SBAppDragAndDropGestureSwitcherModifier

- (SBAppDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3 floatingSwitcherVisible:(BOOL)a4 fullScreenAppLayout:(id)a5
{
  id v10;
  SBAppDragAndDropGestureSwitcherModifier *v11;
  void *v13;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  v11 = -[SBGestureSwitcherModifier initWithGestureID:](&v14, sel_initWithGestureID_, a3);
  if (v11)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBAppDragAndDropGestureSwitcherModifier.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullScreenAppLayout"));

    }
    v11->_floatingSwitcherVisible = a4;
    objc_storeStrong((id *)&v11->_fullScreenAppLayout, a5);
    objc_storeStrong((id *)&v11->_initialFullScreenAppLayout, v11->_fullScreenAppLayout);
  }

  return v11;
}

- (BOOL)completesWhenChildrenComplete
{
  return self->_transitionModifier != 0;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  NSString *v14;
  NSString *draggedSceneIdentifier;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  BOOL v27;
  _QWORD v29[5];
  objc_super v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v4 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__96;
  v35 = __Block_byref_object_dispose__96;
  v30.receiver = self;
  v30.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v30, sel_handleGestureEvent_, v4);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCanceled"))
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
    v5 = (id)v32[5];
  }
  else
  {
    -[SBAppDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", self->_fullScreenAppLayout);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v7;
    -[SBAppDragAndDropGestureSwitcherModifier frameForIndex:](self, "frameForIndex:", v8);
    v10 = v9;
    v12 = v11;
    v13 = v4;
    self->_shouldPushInFullScreenContent = -[SBAppDragAndDropGestureSwitcherModifier _shouldPushInFullScreenContentForEvent:](self, "_shouldPushInFullScreenContentForEvent:", v13);
    self->_dropAction = objc_msgSend(v13, "dropAction");
    objc_msgSend(v13, "draggedSceneIdentifier");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    draggedSceneIdentifier = self->_draggedSceneIdentifier;
    self->_draggedSceneIdentifier = v14;

    self->_isWindowDrag = objc_msgSend(v13, "isWindowDrag");
    self->_hasPlatterized = objc_msgSend(v13, "hasPlatterized");
    self->_hasPreviewLifted = objc_msgSend(v13, "hasPreviewLifted");
    self->_draggedSceneOriginalLayoutRole = objc_msgSend(v13, "draggedSceneLayoutRole");
    objc_msgSend(v13, "platterViewFrame");
    self->_platterFrame.origin.x = v16;
    self->_platterFrame.origin.y = v17;
    self->_platterFrame.size.width = v18;
    self->_platterFrame.size.height = v19;
    objc_msgSend(v13, "locationInContainerView");
    self->_location.x = v20;
    self->_location.y = v21;
    self->_gestureEnded = objc_msgSend(v13, "phase") == 3;
    -[SBAppDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "indexOfObject:", self->_fullScreenAppLayout);

    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      v24 = 0;
    else
      v24 = v23;
    -[SBAppDragAndDropGestureSwitcherModifier frameForIndex:](self, "frameForIndex:", v24);
    v27 = (v10 != v26 || v12 != v25) && !self->_gestureEnded;
    self->_needsBlurBecauseFramesWillMismatch = v27;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __62__SBAppDragAndDropGestureSwitcherModifier_handleGestureEvent___block_invoke;
    v29[3] = &unk_1E8EAABA8;
    v29[4] = &v31;
    -[SBAppDragAndDropGestureSwitcherModifier _recomputeBlurStateWithCompletion:](self, "_recomputeBlurStateWithCompletion:", v29);
    v5 = (id)v32[5];

  }
  _Block_object_dispose(&v31, 8);

  return v5;
}

void __62__SBAppDragAndDropGestureSwitcherModifier_handleGestureEvent___block_invoke(uint64_t a1, uint64_t a2)
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

- (id)handleResizeProgressEvent:(id)a3
{
  id v4;
  void *v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  objc_super v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__96;
  v17 = __Block_byref_object_dispose__96;
  v12.receiver = self;
  v12.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  -[SBSwitcherModifier handleResizeProgressEvent:](&v12, sel_handleResizeProgressEvent_, v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  self->_isResizing = BSFloatIsOne() ^ 1;
  objc_msgSend(v4, "progress");
  -[SBAppDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dropAnimationUnblurThresholdPercentage");
  self->_hasResizedEnoughToUnblur = BSFloatGreaterThanOrEqualToFloat();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__SBAppDragAndDropGestureSwitcherModifier_handleResizeProgressEvent___block_invoke;
  v11[3] = &unk_1E8EAABA8;
  v11[4] = &v13;
  -[SBAppDragAndDropGestureSwitcherModifier _recomputeBlurStateWithCompletion:](self, "_recomputeBlurStateWithCompletion:", v11);
  v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  SBAppendSwitcherModifierResponse(v6, v14[5]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v14[5];
  v14[5] = v7;

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __69__SBAppDragAndDropGestureSwitcherModifier_handleResizeProgressEvent___block_invoke(uint64_t a1, uint64_t a2)
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
  v15 = __Block_byref_object_copy__96;
  v16 = __Block_byref_object_dispose__96;
  v11.receiver = self;
  v11.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  -[SBSwitcherModifier handleBlurProgressEvent:](&v11, sel_handleBlurProgressEvent_, v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  self->_isBlurring = BSFloatIsOne() ^ 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__SBAppDragAndDropGestureSwitcherModifier_handleBlurProgressEvent___block_invoke;
  v10[3] = &unk_1E8EAABA8;
  v10[4] = &v12;
  -[SBAppDragAndDropGestureSwitcherModifier _recomputeBlurStateWithCompletion:](self, "_recomputeBlurStateWithCompletion:", v10);
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  SBAppendSwitcherModifierResponse(v5, v13[5]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v13[5];
  v13[5] = v6;

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __67__SBAppDragAndDropGestureSwitcherModifier_handleBlurProgressEvent___block_invoke(uint64_t a1, uint64_t a2)
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
  v15 = __Block_byref_object_copy__96;
  v16 = __Block_byref_object_dispose__96;
  v11.receiver = self;
  v11.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v11, sel_handleSceneReadyEvent_, v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SBAppDragAndDropGestureSwitcherModifier_handleSceneReadyEvent___block_invoke;
  v10[3] = &unk_1E8EAABA8;
  v10[4] = &v12;
  -[SBAppDragAndDropGestureSwitcherModifier _recomputeBlurStateWithCompletion:](self, "_recomputeBlurStateWithCompletion:", v10);
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  SBAppendSwitcherModifierResponse(v5, v13[5]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v13[5];
  v13[5] = v6;

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __65__SBAppDragAndDropGestureSwitcherModifier_handleSceneReadyEvent___block_invoke(uint64_t a1, uint64_t a2)
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
  SBAppLayout *dropTransitionFromAppLayout;
  SBDragAndDropToAppTransitionSwitcherModifier *v8;
  void *v9;
  SBDragAndDropToAppTransitionSwitcherModifier *v10;
  SBDragAndDropToAppTransitionSwitcherModifier *transitionModifier;
  SBAppLayout *v12;
  SBAppLayout *fullScreenAppLayout;
  id v14;
  _QWORD v16[5];
  objc_super v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v5 = v4;
  if (self->_gestureEnded && !self->_transitionModifier)
  {
    objc_msgSend(v4, "fromAppLayout");
    v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
    self->_dropTransitionFromAppLayout = v6;

    v8 = [SBDragAndDropToAppTransitionSwitcherModifier alloc];
    objc_msgSend(v5, "transitionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](v8, "initWithTransitionID:", v9);
    transitionModifier = self->_transitionModifier;
    self->_transitionModifier = v10;

    -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_transitionModifier);
  }
  else if (objc_msgSend(v4, "isGestureInitiated") && !self->_transitionModifier)
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }
  objc_msgSend(v5, "toAppLayout");
  v12 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  fullScreenAppLayout = self->_fullScreenAppLayout;
  self->_fullScreenAppLayout = v12;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__96;
  v22 = __Block_byref_object_dispose__96;
  v17.receiver = self;
  v17.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v17, sel_handleTransitionEvent_, v5);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__SBAppDragAndDropGestureSwitcherModifier_handleTransitionEvent___block_invoke;
  v16[3] = &unk_1E8EAABA8;
  v16[4] = &v18;
  -[SBAppDragAndDropGestureSwitcherModifier _recomputeBlurStateWithCompletion:](self, "_recomputeBlurStateWithCompletion:", v16);
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __65__SBAppDragAndDropGestureSwitcherModifier_handleTransitionEvent___block_invoke(uint64_t a1, uint64_t a2)
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

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  SBAppLayout *dropTransitionFromAppLayout;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  objc_super v26;
  CGRect result;

  -[SBAppDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!self->_gestureEnded)
    goto LABEL_5;
  dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
  if (dropTransitionFromAppLayout == self->_fullScreenAppLayout)
    goto LABEL_5;
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "allItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBAppLayout containsAnyItemFromSet:](dropTransitionFromAppLayout, "containsAnyItemFromSet:", v11);

  if (v12)
    -[SBAppDragAndDropGestureSwitcherModifier frameForIndex:](&v26, sel_frameForIndex_, objc_msgSend(v5, "indexOfObject:", self->_fullScreenAppLayout), v25.receiver, v25.super_class, self, SBAppDragAndDropGestureSwitcherModifier);
  else
LABEL_5:
    -[SBAppDragAndDropGestureSwitcherModifier frameForIndex:](&v25, sel_frameForIndex_, a3, self, SBAppDragAndDropGestureSwitcherModifier, v26.receiver, v26.super_class);
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;

  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  SBAppLayout *v7;
  unsigned __int8 isBlurred;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (SBAppLayout *)a4;
  v7 = v6;
  if (self->_fullScreenAppLayout == v6)
  {
    if (self->_gestureEnded)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[SBAppLayout allItems](v6, "allItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (-[SBAppLayout layoutRoleForItem:](v7, "layoutRoleForItem:", v14) == a3)
            {
              objc_msgSend(v14, "uniqueIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", self->_draggedSceneIdentifier);

              if ((v16 & 1) != 0)
              {

                isBlurred = 0;
                goto LABEL_16;
              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
    isBlurred = self->_isBlurred;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    isBlurred = -[SBAppDragAndDropGestureSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v18, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  }
LABEL_16:

  return isBlurred;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  int v5;
  double result;
  objc_super v7;

  v5 = -[SBAppDragAndDropGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  result = 0.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier backgroundOpacityForIndex:](&v7, sel_backgroundOpacityForIndex_, a3, 0.0);
  }
  return result;
}

- (double)homeScreenDimmingAlpha
{
  SBAppDragAndDropGestureSwitcherModifier **v3;
  SBDragAndDropToAppTransitionSwitcherModifier *transitionModifier;
  unint64_t v5;
  double result;
  SBAppDragAndDropGestureSwitcherModifier *v7;
  SBAppDragAndDropGestureSwitcherModifier *v8;

  if (-[SBAppDragAndDropGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
  {
    v8 = self;
    v3 = &v8;
LABEL_6:
    v3[1] = (SBAppDragAndDropGestureSwitcherModifier *)SBAppDragAndDropGestureSwitcherModifier;
    objc_msgSendSuper2((objc_super *)v3, sel_homeScreenDimmingAlpha, v7);
    return result;
  }
  transitionModifier = self->_transitionModifier;
  if (!transitionModifier
    || (v5 = -[SBTransitionSwitcherModifier transitionPhase](transitionModifier, "transitionPhase"),
        result = 1.0,
        v5 <= 1))
  {
    v7 = self;
    v3 = &v7;
    goto LABEL_6;
  }
  return result;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  objc_super v4;

  if (self->_fullScreenAppLayout == a3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  return -[SBAppDragAndDropGestureSwitcherModifier isResizeGrabberVisibleForAppLayout:](&v4, sel_isResizeGrabberVisibleForAppLayout_);
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return self->_transitionModifier != 0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  int64_t dropAction;
  uint64_t *v14;
  objc_super v15;

  v6 = (SBAppLayout *)a4;
  if (self->_fullScreenAppLayout != v6 || !self->_dropAction)
  {
    v15.receiver = self;
    v15.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v15, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
    v8 = v7;
    goto LABEL_3;
  }
  -[SBAppDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultDimmingOpacity");
  v12 = v11;

  v8 = 0.0;
  if (self->_gestureEnded)
    goto LABEL_3;
  dropAction = self->_dropAction;
  switch(dropAction)
  {
    case 3:
      v14 = &SBLayoutRoleSide;
      goto LABEL_12;
    case 2:
      v14 = &SBLayoutRolePrimary;
LABEL_12:
      if (*v14 == a3)
        v8 = v12;
      else
        v8 = 0.0;
      break;
    case 1:
      v8 = v12;
      break;
  }
LABEL_3:

  return v8;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 1;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  SBAppLayout *v11;
  SBAppLayout *fullScreenAppLayout;
  SBAppLayout *dropTransitionFromAppLayout;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  SBAppLayout *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  SBAppLayout *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SBAppLayout *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  SBAppLayout *initialFullScreenAppLayout;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  SBAppLayout *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  int64_t v61;
  int64_t dropAction;
  int64_t draggedSceneOriginalLayoutRole;
  uint64_t *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  objc_super v77;
  objc_super v78;
  _QWORD v79[6];
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  objc_super v84;
  objc_super v85;
  objc_super v86;
  objc_super v87;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (SBAppLayout *)a4;
  if (self->_fullScreenAppLayout == v11 && !self->_gestureEnded)
  {
    if (-[SBAppDragAndDropGestureSwitcherModifier _isDraggingLiveWindow](self, "_isDraggingLiveWindow")
      && !self->_hasPlatterized)
    {
      dropAction = self->_dropAction;
      if (dropAction == 4)
      {
        draggedSceneOriginalLayoutRole = self->_draggedSceneOriginalLayoutRole;
        v64 = &SBLayoutRoleSide;
      }
      else
      {
        if (dropAction != 5)
          goto LABEL_38;
        draggedSceneOriginalLayoutRole = self->_draggedSceneOriginalLayoutRole;
        v64 = &SBLayoutRolePrimary;
      }
      if (draggedSceneOriginalLayoutRole == *v64)
      {
        v87.receiver = self;
        v87.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
        -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v87, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v11, x, y, width, height);
        v30 = v65;
        v32 = v66;
        v34 = v67;
        v36 = v68;
        v86.receiver = self;
        v86.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
        -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v86, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v11, x, y, width, height);
        if (a3 == 1)
        {
          v30 = v30 + v71 + v69 - (v30 + v34);
          goto LABEL_40;
        }
        if (a3 == 2)
        {
          v36 = v72;
          v34 = v71;
          v32 = v70;
          goto LABEL_40;
        }
      }
      goto LABEL_38;
    }
    if (a3 != 1)
      goto LABEL_38;
    -[SBAppLayout itemForLayoutRole:](v11, "itemForLayoutRole:", 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52 || (self->_dropAction & 0xFFFFFFFFFFFFFFFELL) != 4)
      goto LABEL_38;
    v85.receiver = self;
    v85.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v85, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v11, x, y, width, height);
    v30 = v53;
    v32 = v54;
    v56 = v55;
    v36 = v57;
    -[SBAppDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "draggingPlatterSideActivationGutterPadding");

    -[SBAppDragAndDropGestureSwitcherModifier screenScale](self, "screenScale");
    BSFloatRoundForScale();
    v60 = v59;
    v61 = self->_dropAction;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      if (v61 == 4)
        goto LABEL_35;
    }
    else if (v61 != 4)
    {
LABEL_35:
      v34 = v56 - v60;
      goto LABEL_40;
    }
    v30 = v30 + v60;
    goto LABEL_35;
  }
  if (-[SBAppLayout isOrContainsAppLayout:](self->_initialFullScreenAppLayout, "isOrContainsAppLayout:", v11)
    && !self->_gestureEnded)
  {
    initialFullScreenAppLayout = self->_initialFullScreenAppLayout;
    -[SBAppLayout itemForLayoutRole:](v11, "itemForLayoutRole:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[SBAppLayout layoutRoleForItem:](initialFullScreenAppLayout, "layoutRoleForItem:", v38);

    -[SBAppDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "indexOfObject:", v11);

    if (v41 == 0x7FFFFFFFFFFFFFFFLL)
      v42 = 0;
    else
      v42 = v41;
    v43 = self->_initialFullScreenAppLayout;
    -[SBAppDragAndDropGestureSwitcherModifier frameForIndex:](self, "frameForIndex:", v42);
    SBRectWithSize();
    v84.receiver = self;
    v84.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v84, sel_frameForLayoutRole_inAppLayout_withBounds_, v39, v43, v44, v45, v46, v47);
    goto LABEL_39;
  }
  fullScreenAppLayout = self->_fullScreenAppLayout;
  if (fullScreenAppLayout == v11)
    goto LABEL_38;
  if (!self->_gestureEnded)
    goto LABEL_38;
  dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
  if (dropTransitionFromAppLayout == fullScreenAppLayout)
    goto LABEL_38;
  v14 = (void *)MEMORY[0x1E0C99E60];
  -[SBAppLayout allItems](v11, "allItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SBAppLayout containsAnyItemFromSet:](dropTransitionFromAppLayout, "containsAnyItemFromSet:", v16);

  v18 = self->_dropTransitionFromAppLayout;
  v19 = (void *)MEMORY[0x1E0C99E60];
  -[SBAppLayout allItems](self->_fullScreenAppLayout, "allItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SBAppLayout containsAnyItemFromSet:](v18, "containsAnyItemFromSet:", v21);

  if (!v17 || !v22)
  {
LABEL_38:
    v77.receiver = self;
    v77.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v77, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
LABEL_39:
    v30 = v48;
    v32 = v49;
    v34 = v50;
    v36 = v51;
    goto LABEL_40;
  }
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  v23 = self->_dropTransitionFromAppLayout;
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __85__SBAppDragAndDropGestureSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
  v79[3] = &unk_1E8EA85E0;
  v79[4] = self;
  v79[5] = &v80;
  -[SBAppLayout enumerate:](v23, "enumerate:", v79);
  -[SBAppDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "indexOfObject:", v11);

  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    v26 = 0;
  else
    v26 = v25;
  v27 = v81[3];
  v28 = self->_dropTransitionFromAppLayout;
  -[SBAppDragAndDropGestureSwitcherModifier frameForIndex:](self, "frameForIndex:", v26);
  SBRectWithSize();
  v78.receiver = self;
  v78.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v78, sel_frameForLayoutRole_inAppLayout_withBounds_, v27, v28);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  _Block_object_dispose(&v80, 8);
LABEL_40:

  v73 = v30;
  v74 = v32;
  v75 = v34;
  v76 = v36;
  result.size.height = v76;
  result.size.width = v75;
  result.origin.y = v74;
  result.origin.x = v73;
  return result;
}

uint64_t __85__SBAppDragAndDropGestureSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "containsItem:");
  if ((result & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  void *v4;
  BOOL v5;

  if (!self->_isResizing)
    return 0;
  -[SBAppLayout itemForLayoutRole:](self->_fullScreenAppLayout, "itemForLayoutRole:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBAppDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_fullScreenAppLayout && self->_shouldPushInFullScreenContent && !self->_gestureEnded)
  {
    v8 = 0.98;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_, a3);
    v8 = v7;
  }

  return v8;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  UIRectCornerRadii result;

  -[SBAppDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "environment") == 1)
  {
    -[SBAppDragAndDropGestureSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier cornerRadiiForIndex:](&v19, sel_cornerRadiiForIndex_, a3);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.topRight = v18;
  result.bottomRight = v17;
  result.bottomLeft = v16;
  result.topLeft = v15;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBAppDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resizeAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v7);

  objc_msgSend(v5, "setUpdateMode:", 3);
  return v5;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  void *v7;
  SBAppLayout *fullScreenAppLayout;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  v6 = (SBAppLayout *)a4;
  -[SBAppDragAndDropGestureSwitcherModifier resizeProgressNotificationsForLayoutRole:inAppLayout:](&v16, sel_resizeProgressNotificationsForLayoutRole_inAppLayout_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fullScreenAppLayout = self->_fullScreenAppLayout;

  if (fullScreenAppLayout == v6)
  {
    -[SBAppDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings", v16.receiver, v16.super_class);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dropAnimationUnblurThresholdPercentage");
    v11 = v10;

    v17[0] = &unk_1E91CFA18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    v17[2] = &unk_1E91CFA28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v14;
  }
  return v7;
}

- (BOOL)_shouldPushInFullScreenContentForEvent:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "dropAction");
  if ((unint64_t)(v5 - 1) < 5)
    goto LABEL_5;
  if ((unint64_t)(v5 - 6) > 3)
  {
    v6 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isWindowDrag"))
    v6 = objc_msgSend(v4, "hasPlatterized");
  else
LABEL_5:
    v6 = 1;
LABEL_6:
  if (-[SBAppDragAndDropGestureSwitcherModifier _isDraggingLiveWindow](self, "_isDraggingLiveWindow")
    && !self->_hasPreviewLifted)
  {
    v6 = 0;
  }
  if (self->_floatingSwitcherVisible)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (BOOL)_showResizeUI
{
  return !self->_gestureEnded
      && (self->_dropAction & 0xFFFFFFFFFFFFFFFELL) == 4
      && (!-[SBAppDragAndDropGestureSwitcherModifier _isDraggingLiveWindow](self, "_isDraggingLiveWindow")
       || self->_hasPlatterized);
}

- (BOOL)_isDraggingLiveWindow
{
  return self->_draggedSceneIdentifier && self->_isWindowDrag && self->_draggedSceneOriginalLayoutRole != 0;
}

- (void)_recomputeBlurStateWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  _BOOL4 isBlurred;
  SBAppLayout *fullScreenAppLayout;
  _BOOL4 isResizing;
  int v8;
  int v9;
  SBUpdateDragPlatterBlurSwitcherEventResponse *v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = (void (**)(id, void *))a3;
  isBlurred = self->_isBlurred;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  fullScreenAppLayout = self->_fullScreenAppLayout;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__SBAppDragAndDropGestureSwitcherModifier__recomputeBlurStateWithCompletion___block_invoke;
  v12[3] = &unk_1E8EA85E0;
  v12[4] = self;
  v12[5] = &v13;
  -[SBAppLayout enumerate:](fullScreenAppLayout, "enumerate:", v12);
  if (!self->_gestureEnded)
  {
    if (self->_isBlurred)
    {
      isResizing = self->_isResizing;
      goto LABEL_7;
    }
LABEL_6:
    isResizing = 0;
    goto LABEL_7;
  }
  if (!self->_isBlurred)
    goto LABEL_6;
  isResizing = !self->_hasResizedEnoughToUnblur;
LABEL_7:
  v8 = !*((_BYTE *)v14 + 24)
    || ((isResizing | -[SBAppDragAndDropGestureSwitcherModifier _showResizeUI](self, "_showResizeUI")) & 1) != 0
    || self->_needsBlurBecauseFramesWillMismatch;
  v9 = self->_isBlurred;
  if (v9 != v8)
  {
    self->_isBlurred = v8;
    v9 = v8;
  }
  if (isBlurred && self->_gestureEnded && !v9)
  {
    v10 = objc_alloc_init(SBUpdateDragPlatterBlurSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, v11);

  }
  _Block_object_dispose(&v13, 8);

}

void __77__SBAppDragAndDropGestureSwitcherModifier__recomputeBlurStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;

  v14 = a3;
  v5 = *(id **)(a1 + 32);
  objc_msgSend(v5[17], "leafAppLayoutForRole:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a2) = objc_msgSend(v5, "isLayoutRoleContentReady:inAppLayout:", a2, v6);

  if ((a2 & 1) != 0)
    goto LABEL_2;
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 246))
  {
    v9 = *(_QWORD *)(v8 + 160);
    if (v9 > 7)
      goto LABEL_8;
    if (((1 << v9) & 0xC) != 0)
    {
      v11 = 244;
LABEL_13:
      v7 = *(_BYTE *)(v8 + v11) == 0;
      goto LABEL_15;
    }
    if (((1 << v9) & 0x30) == 0)
    {
      if (((1 << v9) & 0xC0) != 0)
      {
LABEL_2:
        v7 = 1;
        goto LABEL_15;
      }
LABEL_8:
      if (!*(_BYTE *)(v8 + 176))
      {
        objc_msgSend(v14, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));

        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (*(_BYTE *)(v8 + 176))
    {
      v11 = 177;
      goto LABEL_13;
    }
  }
LABEL_14:
  v7 = 0;
LABEL_15:
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v12 + 24))
    v13 = v7;
  else
    v13 = 0;
  *(_BYTE *)(v12 + 24) = v13;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggedSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionModifier, 0);
  objc_storeStrong((id *)&self->_dropTransitionFromAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_initialFullScreenAppLayout, 0);
}

@end
