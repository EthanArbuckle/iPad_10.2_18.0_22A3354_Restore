@implementation SBInlineAppExposeContinuousExposeSwitcherModifier

- (SBInlineAppExposeContinuousExposeSwitcherModifier)initWithActiveAppLayout:(id)a3 appExposeBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  SBInlineAppExposeContinuousExposeSwitcherModifier *v9;
  SBInlineAppExposeContinuousExposeSwitcherModifier *v10;
  uint64_t v11;
  NSString *appExposeBundleIdentifier;
  NSMutableSet *v13;
  NSMutableSet *highlightedByHoverAppLayouts;
  NSMutableSet *v15;
  NSMutableSet *highlightedByTouchAppLayouts;
  SBFullScreenAppLayoutSwitcherModifier *v17;
  SBFullScreenAppLayoutSwitcherModifier *fullScreenAppLayoutModifier;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  v9 = -[SBSwitcherModifier init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activeAppLayout, a3);
    v11 = objc_msgSend(v8, "copy");
    appExposeBundleIdentifier = v10->_appExposeBundleIdentifier;
    v10->_appExposeBundleIdentifier = (NSString *)v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    highlightedByHoverAppLayouts = v10->_highlightedByHoverAppLayouts;
    v10->_highlightedByHoverAppLayouts = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    highlightedByTouchAppLayouts = v10->_highlightedByTouchAppLayouts;
    v10->_highlightedByTouchAppLayouts = v15;

    v17 = -[SBFullScreenAppLayoutSwitcherModifier initWithActiveAppLayout:]([SBFullScreenAppLayoutSwitcherModifier alloc], "initWithActiveAppLayout:", v10->_activeAppLayout);
    fullScreenAppLayoutModifier = v10->_fullScreenAppLayoutModifier;
    v10->_fullScreenAppLayoutModifier = v17;

    -[SBChainableModifier addChildModifier:](v10, "addChildModifier:", v10->_fullScreenAppLayoutModifier);
  }

  return v10;
}

- (id)handleInsertionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleInsertionEvent:](&v10, sel_handleInsertionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v10.receiver, v10.super_class);

  if (v6 == 2)
  {
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded](self, "_responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *v6;
  SBAppLayout *activeAppLayout;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  SBInvalidateReopenButtonTextSwitcherEventResponse *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v14, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAppLayout");
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  activeAppLayout = self->_activeAppLayout;
  self->_activeAppLayout = v6;

  if (objc_msgSend(v4, "phase") == 2)
  {
    objc_msgSend(v4, "fromAppExposeBundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(v4, "toAppExposeBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SBInlineAppExposeContinuousExposeSwitcherModifier _responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded](self, "_responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SBAppendSwitcherModifierResponse(v9, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
      SBAppendSwitcherModifierResponse(v12, v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
LABEL_7:

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBMutableSwitcherTransitionRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  SBPerformTransitionSwitcherEventResponse *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutEvent:](&v14, sel_handleTapAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", self->_activeAppLayout))
    {
      +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4);
      v7 = (SBMutableSwitcherTransitionRequest *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherTransitionRequest setRetainsSiri:](v7, "setRetainsSiri:", -[SBInlineAppExposeContinuousExposeSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
    }
    else
    {
      objc_msgSend(v6, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayoutByBringingItemToFront:inAppLayout:](self, "appLayoutByBringingItemToFront:inAppLayout:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherTransitionRequest setAppLayout:](v7, "setAppLayout:", v10);

      -[SBSwitcherTransitionRequest setActivatingDisplayItem:](v7, "setActivatingDisplayItem:", v8);
      if ((objc_msgSend(v4, "modifierFlags") & 0x20000) != 0)
        -[SBSwitcherTransitionRequest setEntityInsertionPolicy:](v7, "setEntityInsertionPolicy:", 1);

    }
    v11 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v7, 0);
    SBAppendSwitcherModifierResponse(v11, v5);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "handleWithReason:", CFSTR("In-line App Exposé"));
    v5 = (void *)v12;
  }

  return v5;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  SBMutableSwitcherTransitionRequest *v10;
  SBPerformTransitionSwitcherEventResponse *v11;
  void *v12;
  void *v13;
  void *v14;
  SBPerformTransitionSwitcherEventResponse *v15;
  uint64_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTapAppLayoutHeaderEvent:](&v18, sel_handleTapAppLayoutHeaderEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBInlineAppExposeContinuousExposeSwitcherModifier displayItemSupportsMultipleWindowsIndicator:](self, "displayItemSupportsMultipleWindowsIndicator:", v7))
    {
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", self->_appExposeBundleIdentifier);

      if (v9)
      {
        if (objc_msgSend(v6, "isEqual:", self->_activeAppLayout))
        {
          +[SBSwitcherTransitionRequest requestForTapAppLayoutHeaderEvent:](SBSwitcherTransitionRequest, "requestForTapAppLayoutHeaderEvent:", v4);
          v10 = (SBMutableSwitcherTransitionRequest *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
          -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayoutByBringingItemToFront:inAppLayout:](self, "appLayoutByBringingItemToFront:inAppLayout:", v7, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSwitcherTransitionRequest setAppLayout:](v10, "setAppLayout:", v14);

          -[SBSwitcherTransitionRequest setActivatingDisplayItem:](v10, "setActivatingDisplayItem:", v7);
        }
      }
      else
      {
        v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
        -[SBSwitcherTransitionRequest setSource:](v10, "setSource:", 3);
        objc_msgSend(v7, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherTransitionRequest setBundleIdentifierForAppExpose:](v10, "setBundleIdentifierForAppExpose:", v12);

      }
      v11 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v10, 0);
    }
    else
    {
      v10 = -[SBPulseDisplayItemSwitcherModifier initWithDisplayItem:]([SBPulseDisplayItemSwitcherModifier alloc], "initWithDisplayItem:", v7);
      v11 = -[SBAddModifierSwitcherEventResponse initWithModifier:level:]([SBAddModifierSwitcherEventResponse alloc], "initWithModifier:level:", v10, 3);
    }
    v15 = v11;
    SBAppendSwitcherModifierResponse(v11, v5);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "handleWithReason:", CFSTR("In-line App Exposé"));
    v5 = (void *)v16;
  }

  return v5;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBPerformTransitionSwitcherEventResponse *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTapOutsideToDismissEvent:](&v10, sel_handleTapOutsideToDismissEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", self->_activeAppLayout, v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v6, 0);
  SBAppendSwitcherModifierResponse(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "handleWithReason:", CFSTR("In-line App Exposé"));
  return v8;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("SBInlineAppExposeContinuousExposeSwitcherModifierTimerEventReason"));
  if ((_DWORD)v4)
  {
    self->_showingReopenClosedWindowsButton = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleHighlightEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  SBUpdateLayoutSwitcherEventResponse *v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleHighlightEvent:](&v35, sel_handleHighlightEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "phase") - 1;
    objc_msgSend(v4, "appLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", self->_activeAppLayout);
    v9 = objc_msgSend(v4, "isHoverEvent");
    if ((v8 & 1) == 0 && v6 > 1)
    {
      if (v9)
        v10 = 120;
      else
        v10 = 128;
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v10), "addObject:", v7);
      goto LABEL_35;
    }
    if (v6 < 2)
      v11 = v9;
    else
      v11 = 0;
    if (v11 == 1)
    {
      v12 = 120;
      if (!-[NSMutableSet containsObject:](self->_highlightedByHoverAppLayouts, "containsObject:", v7))
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v13 = (void *)-[NSMutableSet copy](self->_highlightedByHoverAppLayouts, "copy");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              if (objc_msgSend(v18, "containsAnyItemFromAppLayout:", v7))
                -[NSMutableSet removeObject:](self->_highlightedByHoverAppLayouts, "removeObject:", v18);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          }
          while (v15);
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      v12 = 128;
      if (!-[NSMutableSet containsObject:](self->_highlightedByTouchAppLayouts, "containsObject:", v7))
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v13 = (void *)-[NSMutableSet copy](self->_highlightedByTouchAppLayouts, "copy", 0);
        v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(v13);
              v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              if (objc_msgSend(v23, "containsAnyItemFromAppLayout:", v7))
                -[NSMutableSet removeObject:](self->_highlightedByTouchAppLayouts, "removeObject:", v23);
            }
            v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          }
          while (v20);
        }
        goto LABEL_34;
      }
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v12), "removeObject:", v7);
LABEL_35:
    v24 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 12, 3);
    SBAppendSwitcherModifierResponse(v24, v5);
    v25 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "handleWithReason:", CFSTR("In-line App Exposé"));
    v5 = (void *)v25;
  }

  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v13, sel_adjustedAppLayoutsForAppLayouts_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__SBInlineAppExposeContinuousExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v12[3] = &unk_1E8EA43E8;
  v12[4] = self;
  objc_msgSend(v4, "bs_compactMap:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_flatten");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v8 = -[SBInlineAppExposeContinuousExposeSwitcherModifier _maximumNumberOfInlineAppExposeAppLayouts](self, "_maximumNumberOfInlineAppExposeAppLayouts");
  if (v7 >= v8 + 1)
    v9 = v8 + 1;
  else
    v9 = v7;
  objc_msgSend(v6, "subarrayWithRange:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __85__SBInlineAppExposeContinuousExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104)) & 1) != 0
    || (objc_msgSend(v3, "continuousExposeIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112)),
        v4,
        v5))
  {
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)visibleAppLayouts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  __int128 v10;
  SBAppLayout *activeAppLayout;
  double v12;
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
  objc_super v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (objc_msgSend(v9, "isEqual:", self->_activeAppLayout))
  {
    v32 = 0;
    v33 = (double *)&v32;
    v34 = 0x4010000000;
    v35 = &unk_1D0FA064E;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    activeAppLayout = self->_activeAppLayout;
    v36 = *MEMORY[0x1E0C9D628];
    v37 = v10;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __98__SBInlineAppExposeContinuousExposeSwitcherModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke;
    v25[3] = &unk_1E8EAFED8;
    v25[4] = self;
    v28 = x;
    v29 = y;
    v30 = width;
    v31 = height;
    v26 = v9;
    v27 = &v32;
    -[SBAppLayout enumerate:](activeAppLayout, "enumerate:", v25);
    v12 = v33[4];
    v13 = v33[5];
    v14 = v33[6];
    v15 = v33[7];

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    -[SBInlineAppExposeContinuousExposeSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v24, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    v12 = v16;
    v13 = v17;
    v14 = v18;
    v15 = v19;
  }

  v20 = v12;
  v21 = v13;
  v22 = v14;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

void __98__SBInlineAppExposeContinuousExposeSwitcherModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  _BOOL4 IsNull;
  CGRect *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  SBRectWithSize();
  objc_msgSend(v4, "frameForLayoutRole:inAppLayout:withBounds:", a2, v5);
  CGRectOffset(v18, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
  v6 = *(_QWORD *)(a1 + 40);
  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  objc_msgSendSuper2(&v17, sel_scaleForLayoutRole_inAppLayout_, a2, v6);
  objc_msgSend(*(id *)(a1 + 32), "_scaleForActiveAppLayoutLeafAppLayouts");
  SBTransformedRectWithScale();
  v8 = v7;
  y = v9;
  width = v11;
  height = v13;
  IsNull = CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  v16 = *(CGRect **)(*(_QWORD *)(a1 + 48) + 8);
  if (IsNull)
  {
    v16[1].origin.x = v8;
  }
  else
  {
    v20.origin.x = v8;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v19 = CGRectUnion(v16[1], v20);
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
    v16 = *(CGRect **)(*(_QWORD *)(a1 + 48) + 8);
    v16[1].origin.x = v19.origin.x;
  }
  v16[1].origin.y = y;
  v16[1].size.width = width;
  v16[1].size.height = height;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;

  v37.receiver = self;
  v37.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier frameForIndex:](&v37, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier _inlineAppExposeAppLayouts](self, "_inlineAppExposeAppLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndex:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "containsObject:", v15))
  {
    -[SBInlineAppExposeContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    round(CGRectGetHeight(v38) * 0.0625);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    round(CGRectGetHeight(v39) * 0.0625);
    if (-[SBInlineAppExposeContinuousExposeSwitcherModifier isDisplayEmbedded](self, "isDisplayEmbedded"))
      v20 = 192.0;
    else
      v20 = 132.0;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v21 = CGRectGetHeight(v40);
    -[SBInlineAppExposeContinuousExposeSwitcherModifier floatingDockPresentedHeight](self, "floatingDockPresentedHeight");
    round((v21- v22+ -128.0+ -128.0- (double)(-[SBInlineAppExposeContinuousExposeSwitcherModifier _maximumNumberOfInlineAppExposeRows](self, "_maximumNumberOfInlineAppExposeRows")- 1)* v20)/ (double)-[SBInlineAppExposeContinuousExposeSwitcherModifier _maximumNumberOfInlineAppExposeRows](self, "_maximumNumberOfInlineAppExposeRows"));
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeRows](self, "_numberOfInlineAppExposeRows");
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeRows](self, "_numberOfInlineAppExposeRows");
    objc_msgSend(v13, "indexOfObject:", v15);
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeRows](self, "_numberOfInlineAppExposeRows");
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeRows](self, "_numberOfInlineAppExposeRows");
    -[SBInlineAppExposeContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "defaultWindowSize");
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _scaleForInlineAppExposeAppLayouts](self, "_scaleForInlineAppExposeAppLayouts");

    v24 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v25 = x;
    v26 = y;
    v27 = width;
    v28 = height;
    if (v24 == 1)
      CGRectGetMaxX(*(CGRect *)&v25);
    else
      CGRectGetMinX(*(CGRect *)&v25);
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeColumns](self, "_numberOfInlineAppExposeColumns");
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeColumns](self, "_numberOfInlineAppExposeColumns");
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    CGRectGetMinX(v41);
    UIRectCenteredAboutPoint();
    v6 = v29;
    v8 = v30;
    v10 = v31;
    v12 = v32;
  }

  v33 = v6;
  v34 = v8;
  v35 = v10;
  v36 = v12;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
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
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double MidX;
  id *v30;
  double MinX;
  double v32;
  double v33;
  double MidY;
  CGFloat v35;
  uint64_t v36;
  uint64_t v37;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  objc_super v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v52.receiver = self;
  v52.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v52, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (objc_msgSend(v11, "isEqual:", self->_activeAppLayout))
  {
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "boundingBox");
    v50 = v21;
    v51 = v22;
    v24 = v23;
    v26 = v25;

    -[SBInlineAppExposeContinuousExposeSwitcherModifier scaleForLayoutRole:inAppLayout:](self, "scaleForLayoutRole:inAppLayout:", a3, v11);
    v28 = v27;
    v53.origin.x = v13;
    v53.origin.y = v15;
    v53.size.width = v17;
    v53.size.height = v19;
    MidX = CGRectGetMidX(v53);
    v30 = (id *)MEMORY[0x1E0CEB258];
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      v54.origin.x = v50;
      v54.origin.y = v51;
      v54.size.width = v24;
      v54.size.height = v26;
      MinX = CGRectGetMinX(v54);
    }
    else
    {
      v55.origin.x = v50;
      v55.origin.y = v51;
      v55.size.width = v24;
      v55.size.height = v26;
      MinX = CGRectGetMaxX(v55);
    }
    v32 = MidX - MinX;
    v33 = 1.0 - v28;
    v49 = (1.0 - v28) * v32;
    v56.origin.x = v13;
    v56.origin.y = v15;
    v56.size.width = v17;
    v56.size.height = v19;
    MidY = CGRectGetMidY(v56);
    v57.origin.x = v50;
    v57.origin.y = v51;
    v57.size.width = v24;
    v57.size.height = v26;
    v35 = v15 - v33 * (MidY - CGRectGetMidY(v57));
    v36 = objc_msgSend(*v30, "userInterfaceLayoutDirection");
    v58.origin.x = v13 - v49;
    v58.origin.y = v35;
    v58.size.width = v17;
    v58.size.height = v19;
    CGRectGetMinX(v58);
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _inlineAppExposeSwitcherFrame](self, "_inlineAppExposeSwitcherFrame");
    if (v36 == 1)
    {
      CGRectGetMinX(*(CGRect *)&v37);
      v59.origin.x = v50;
      v59.origin.y = v51;
      v59.size.width = v24;
      v59.size.height = v26;
      CGRectGetWidth(v59);
    }
    else
    {
      CGRectGetMaxX(*(CGRect *)&v37);
      v60.origin.x = v50;
      v60.origin.y = v51;
      v60.size.width = v24;
      v60.size.height = v26;
      CGRectGetMinX(v60);
    }
    -[SBInlineAppExposeContinuousExposeSwitcherModifier screenScale](self, "screenScale");
    UIRectRoundToScale();
    v13 = v41;
    v15 = v42;
    v17 = v43;
    v19 = v44;
  }

  v45 = v13;
  v46 = v15;
  v47 = v17;
  v48 = v19;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqual:", self->_activeAppLayout))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    -[SBInlineAppExposeContinuousExposeSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_, a3);
  }
  else
  {
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _scaleForInlineAppExposeAppLayouts](self, "_scaleForInlineAppExposeAppLayouts");
  }
  v8 = v7;

  return v8;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier scaleForLayoutRole:inAppLayout:](&v20, sel_scaleForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "autoLayoutItemForDisplayItem:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isFullyOccluded"))
  {
    objc_msgSend(v9, "stageOcclusionDodgingPeekScale");
  }
  else
  {
    if (!objc_msgSend(v12, "isOverlapped"))
      goto LABEL_6;
    objc_msgSend(v12, "size");
    objc_msgSend(v9, "partiallyOccludedStageScaleForItemWithSize:");
  }
  v8 = v8 * v13;
LABEL_6:
  if (objc_msgSend(v6, "isEqual:", self->_activeAppLayout))
  {
    -[SBInlineAppExposeContinuousExposeSwitcherModifier _scaleForActiveAppLayoutLeafAppLayouts](self, "_scaleForActiveAppLayoutLeafAppLayouts");
LABEL_16:
    v8 = v8 * v14;
    goto LABEL_17;
  }
  -[SBInlineAppExposeContinuousExposeSwitcherModifier highlightedByHoverAppLayouts](self, "highlightedByHoverAppLayouts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v6);

  -[SBInlineAppExposeContinuousExposeSwitcherModifier highlightedByTouchAppLayouts](self, "highlightedByTouchAppLayouts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v6);

  if (v16 && v18)
  {
    v14 = 0.98;
    goto LABEL_16;
  }
  if (((v16 ^ 1 | v18) & 1) == 0)
  {
    v14 = 1.1;
    goto LABEL_16;
  }
  if (v18)
    v8 = v8 * 0.9;
LABEL_17:

  return v8;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", self->_activeAppLayout) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    v7 = -[SBInlineAppExposeContinuousExposeSwitcherModifier shouldPinLayoutRolesToSpace:](&v9, sel_shouldPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", self->_activeAppLayout) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    v7 = -[SBInlineAppExposeContinuousExposeSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  SBInlineAppExposeContinuousExposeSwitcherModifier *v4;
  void *v5;
  void *v6;
  double result;

  v4 = self;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEqual:", v4->_activeAppLayout);

  result = 1.0;
  if ((_DWORD)v4)
    return 0.0;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (BOOL)isContainerStatusBarVisible
{
  return 0;
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 10;
}

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  return 1;
}

- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3
{
  return 10.0;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  _BOOL4 v7;

  v6 = a4;
  if (objc_msgSend(v6, "isEqual:", self->_activeAppLayout))
    v7 = !-[SBInlineAppExposeContinuousExposeSwitcherModifier isLayoutRoleOccluded:inAppLayout:](self, "isLayoutRoleOccluded:inAppLayout:", a3, v6);
  else
    LOBYTE(v7) = 1;

  return v7;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *activeAppLayout;
  id v7;
  _BOOL4 v8;
  id v9;
  objc_super v11;

  activeAppLayout = self->_activeAppLayout;
  v7 = a4;
  if (objc_msgSend(v7, "isEqual:", activeAppLayout))
  {
    v8 = -[SBInlineAppExposeContinuousExposeSwitcherModifier isLayoutRoleOccluded:inAppLayout:](self, "isLayoutRoleOccluded:inAppLayout:", a3, v7);

    if (v8)
      return 1;
    else
      return 2;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    v9 = -[SBInlineAppExposeContinuousExposeSwitcherModifier touchBehaviorForLayoutRole:inAppLayout:](&v11, sel_touchBehaviorForLayoutRole_inAppLayout_, a3, v7);

  }
  return (int64_t)v9;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return self->_appExposeBundleIdentifier;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  return 1;
}

- (double)plusButtonAlpha
{
  return 1.0;
}

- (int64_t)plusButtonStyle
{
  return 0;
}

- (double)reopenClosedWindowsButtonAlpha
{
  double result;
  BOOL v4;
  objc_super v5;

  if (!-[SBInlineAppExposeContinuousExposeSwitcherModifier _canShowReopenClosedWindowsButton](self, "_canShowReopenClosedWindowsButton")|| (v4 = -[SBInlineAppExposeContinuousExposeSwitcherModifier isShowingReopenClosedWindowsButton](self, "isShowingReopenClosedWindowsButton"), result = 1.0, !v4))
  {
    v5.receiver = self;
    v5.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    -[SBInlineAppExposeContinuousExposeSwitcherModifier reopenClosedWindowsButtonAlpha](&v5, sel_reopenClosedWindowsButtonAlpha, result);
  }
  return result;
}

- (double)reopenClosedWindowsButtonScale
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (-[SBInlineAppExposeContinuousExposeSwitcherModifier isShowingReopenClosedWindowsButton](self, "isShowingReopenClosedWindowsButton"))
  {
    return 1.0;
  }
  -[SBInlineAppExposeContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reopenButtonInitialScale");
  v7 = v6;

  return v7;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return objc_msgSend(a3, "isEqual:", self->_activeAppLayout) ^ 1;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  return 1;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
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
  double v19;
  UIRectCornerRadii result;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stageCornerRadii");
  objc_msgSend(v5, "stripCornerRadii");
  -[SBInlineAppExposeContinuousExposeSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", self->_activeAppLayout)
    && -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayoutContainsAnUnoccludedMaximizedDisplayItem:](self, "appLayoutContainsAnUnoccludedMaximizedDisplayItem:", self->_activeAppLayout))
  {
    BSFloatIsZero();
  }
  -[SBInlineAppExposeContinuousExposeSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBRectCornerRadiiForRadius();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.topRight = v19;
  result.bottomRight = v18;
  result.bottomLeft = v17;
  result.topLeft = v16;
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (double)dockProgress
{
  return 0.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isScrollEnabled
{
  return 0;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (double)homeScreenAlpha
{
  return 0.0;
}

- (double)homeScreenBackdropBlurProgress
{
  return 1.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
}

- (double)homeScreenDimmingAlpha
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v4 = v3;
  v6 = v5;
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_activeAppLayout);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingBox");
  v9 = v8;
  v11 = v10;

  v12 = fmin(fmax((v9 * v11 / (v4 * v6) + -0.7) * 0.5 / 0.3 + 0.0, 0.0), 1.0);
  -[SBInlineAppExposeContinuousExposeSwitcherModifier continuousExposeStripProgress](self, "continuousExposeStripProgress");
  return v12 + v13 * (v12 * 0.5 - v12);
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;

  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_activeAppLayout);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stageArea");
  v6 = v4 + v5;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v8 = v7;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  v10 = v9;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier floatingDockViewTopMargin](self, "floatingDockViewTopMargin");
  v12 = v8 - (v10 + v11);
  if (!-[SBInlineAppExposeContinuousExposeSwitcherModifier isSoftwareKeyboardVisible](self, "isSoftwareKeyboardVisible"))
  {
    if (v6 > v12)
    {
      v13 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v13 = -[SBInlineAppExposeContinuousExposeSwitcherModifier prefersDockHidden](self, "prefersDockHidden");
    goto LABEL_8;
  }
  v13 = 1;
  if ((-[SBInlineAppExposeContinuousExposeSwitcherModifier isMedusaHostedKeyboardVisible](self, "isMedusaHostedKeyboardVisible") & 1) == 0&& v6 <= v12)
  {
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (BOOL)shouldScrollViewBlockTouches
{
  return 0;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (id)_inlineAppExposeAppLayouts
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "continuousExposeIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "containsString:", self->_appExposeBundleIdentifier))
        {
          v10 = objc_msgSend(v8, "isEqual:", self->_activeAppLayout);

          if ((v10 & 1) == 0)
            objc_msgSend(v12, "addObject:", v8);
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v12;
}

- (CGRect)_inlineAppExposeSwitcherFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat Height;
  double v20;
  double MinY;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeColumns](self, "_numberOfInlineAppExposeColumns");
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v12 = round(CGRectGetHeight(v25) * 0.0625);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v13 = round(CGRectGetHeight(v26) * 0.0625);
  -[SBInlineAppExposeContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "defaultWindowSize");
  v16 = v15;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier _scaleForInlineAppExposeAppLayouts](self, "_scaleForInlineAppExposeAppLayouts");
  v18 = v12 + v12 + v16 * v17 * (double)v11 + v13 * (double)(uint64_t)(v11 - 1) + -10.0;

  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  Height = CGRectGetHeight(v27);
  v20 = 0.0;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    v20 = CGRectGetMaxX(v28) - v18;
  }
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  MinY = CGRectGetMinY(v29);
  v22 = v20;
  v23 = v18;
  v24 = Height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = MinY;
  result.origin.x = v22;
  return result;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a4;
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemForLayoutRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "autoLayoutItemForDisplayItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isFullyOccluded") & 1) != 0 || (objc_msgSend(v9, "isOverlapped") & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v9, "isPartiallyCoveredByPeekingItem");

  return v10;
}

- (unint64_t)_maximumNumberOfInlineAppExposeAppLayouts
{
  unint64_t v3;

  v3 = -[SBInlineAppExposeContinuousExposeSwitcherModifier _maximumNumberOfInlineAppExposeColumns](self, "_maximumNumberOfInlineAppExposeColumns");
  return -[SBInlineAppExposeContinuousExposeSwitcherModifier _maximumNumberOfInlineAppExposeRows](self, "_maximumNumberOfInlineAppExposeRows")* v3;
}

- (unint64_t)_maximumNumberOfInlineAppExposeColumns
{
  if (-[SBInlineAppExposeContinuousExposeSwitcherModifier isDisplayEmbedded](self, "isDisplayEmbedded"))
    return 3;
  else
    return 4;
}

- (unint64_t)_maximumNumberOfInlineAppExposeRows
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chamoisSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBInlineAppExposeContinuousExposeSwitcherModifier isDisplayEmbedded](self, "isDisplayEmbedded"))
    v5 = objc_msgSend(v4, "numberOfRowsWhileInAppOnEmbeddedDisplay");
  else
    v5 = objc_msgSend(v4, "numberOfRowsWhileInAppOnExternalDisplay");
  v6 = v5;

  return v6;
}

- (unint64_t)_numberOfInlineAppExposeAppLayouts
{
  void *v2;
  unint64_t v3;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier _inlineAppExposeAppLayouts](self, "_inlineAppExposeAppLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)_numberOfInlineAppExposeColumns
{
  double v3;
  double v4;

  v3 = ceil((double)-[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeAppLayouts](self, "_numberOfInlineAppExposeAppLayouts")/ (double)-[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeRows](self, "_numberOfInlineAppExposeRows"));
  v4 = (double)-[SBInlineAppExposeContinuousExposeSwitcherModifier _maximumNumberOfInlineAppExposeColumns](self, "_maximumNumberOfInlineAppExposeColumns");
  if (v3 <= v4)
    return (unint64_t)v3;
  return (unint64_t)v4;
}

- (unint64_t)_numberOfInlineAppExposeRows
{
  unint64_t v3;
  unint64_t result;

  v3 = -[SBInlineAppExposeContinuousExposeSwitcherModifier _numberOfInlineAppExposeAppLayouts](self, "_numberOfInlineAppExposeAppLayouts");
  result = -[SBInlineAppExposeContinuousExposeSwitcherModifier _maximumNumberOfInlineAppExposeRows](self, "_maximumNumberOfInlineAppExposeRows");
  if (v3 < result)
    return v3;
  return result;
}

- (double)_scaleForActiveAppLayoutLeafAppLayouts
{
  double Height;
  double v4;
  double v5;
  void *v6;
  double v7;
  double result;
  CGRect v9;
  CGRect v10;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
  Height = CGRectGetHeight(v9);
  -[SBInlineAppExposeContinuousExposeSwitcherModifier floatingDockPresentedHeight](self, "floatingDockPresentedHeight");
  v5 = Height - v4 + -192.0;
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_activeAppLayout);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingBox");
  v7 = CGRectGetHeight(v10);

  result = v5 / v7;
  if (v5 / v7 > 1.0)
    return 1.0;
  return result;
}

- (double)_scaleForInlineAppExposeAppLayouts
{
  void *v2;
  double v3;
  double v4;

  -[SBInlineAppExposeContinuousExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stripCardScale");
  v4 = v3;

  return v4;
}

- (BOOL)_canShowReopenClosedWindowsButton
{
  return self->_numberOfHiddenAppLayouts != 0;
}

- (id)_responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded
{
  BOOL v3;
  SBTimerEventSwitcherEventResponse *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  SBTimerEventSwitcherEventResponse *v9;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = -[SBInlineAppExposeContinuousExposeSwitcherModifier _canShowReopenClosedWindowsButton](self, "_canShowReopenClosedWindowsButton");
  self->_numberOfHiddenAppLayouts = -[SBInlineAppExposeContinuousExposeSwitcherModifier numberOfHiddenAppLayoutsForBundleIdentifier:](self, "numberOfHiddenAppLayoutsForBundleIdentifier:", self->_appExposeBundleIdentifier);
  v4 = 0;
  if (-[SBInlineAppExposeContinuousExposeSwitcherModifier _canShowReopenClosedWindowsButton](self, "_canShowReopenClosedWindowsButton")&& !v3)
  {
    self->_showingReopenClosedWindowsButton = 0;
    -[SBInlineAppExposeContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reopenButtonFadeInDelay");
    v8 = v7;

    objc_initWeak(&location, self);
    v9 = [SBTimerEventSwitcherEventResponse alloc];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __111__SBInlineAppExposeContinuousExposeSwitcherModifier__responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded__block_invoke;
    v11[3] = &unk_1E8EA3468;
    objc_copyWeak(&v12, &location);
    v4 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v9, "initWithDelay:validator:reason:", v11, CFSTR("SBInlineAppExposeContinuousExposeSwitcherModifierTimerEventReason"), v8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v4;
}

BOOL __111__SBInlineAppExposeContinuousExposeSwitcherModifier__responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SBAppLayout)activeAppLayout
{
  return self->_activeAppLayout;
}

- (NSString)appExposeBundleIdentifier
{
  return self->_appExposeBundleIdentifier;
}

- (NSMutableSet)highlightedByHoverAppLayouts
{
  return self->_highlightedByHoverAppLayouts;
}

- (void)setHighlightedByHoverAppLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedByHoverAppLayouts, a3);
}

- (NSMutableSet)highlightedByTouchAppLayouts
{
  return self->_highlightedByTouchAppLayouts;
}

- (void)setHighlightedByTouchAppLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedByTouchAppLayouts, a3);
}

- (SBFullScreenAppLayoutSwitcherModifier)fullScreenAppLayoutModifier
{
  return self->_fullScreenAppLayoutModifier;
}

- (void)setFullScreenAppLayoutModifier:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenAppLayoutModifier, a3);
}

- (unint64_t)numberOfHiddenAppLayouts
{
  return self->_numberOfHiddenAppLayouts;
}

- (void)setNumberOfHiddenAppLayouts:(unint64_t)a3
{
  self->_numberOfHiddenAppLayouts = a3;
}

- (BOOL)isShowingReopenClosedWindowsButton
{
  return self->_showingReopenClosedWindowsButton;
}

- (void)setShowingReopenClosedWindowsButton:(BOOL)a3
{
  self->_showingReopenClosedWindowsButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenAppLayoutModifier, 0);
  objc_storeStrong((id *)&self->_highlightedByTouchAppLayouts, 0);
  objc_storeStrong((id *)&self->_highlightedByHoverAppLayouts, 0);
  objc_storeStrong((id *)&self->_appExposeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activeAppLayout, 0);
}

@end
