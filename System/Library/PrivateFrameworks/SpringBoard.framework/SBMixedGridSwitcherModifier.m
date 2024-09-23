@implementation SBMixedGridSwitcherModifier

- (SBMixedGridSwitcherModifier)initWithFullScreenCardSize:(CGSize)a3 floatingCardSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat v6;
  CGFloat v7;
  SBMixedGridSwitcherModifier *v8;
  SBMixedGridSwitcherModifier *v9;
  uint64_t v10;
  NSMutableDictionary *cachedFrameForIndex;
  objc_super v13;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)SBMixedGridSwitcherModifier;
  v8 = -[SBSwitcherModifier init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_fullScreenCardSize.width = v7;
    v8->_fullScreenCardSize.height = v6;
    v8->_floatingCardSize.width = width;
    v8->_floatingCardSize.height = height;
    v8->_maximumNumberOfFullScreenCardsForSingleRow = 0;
    v8->_lowDensityGridLayoutAlignment = 0;
    v8->_reversesFloatingCardDirection = 1;
    v8->_cachedVisibleAppsRangeIsValid = 0;
    v8->_lastAppLayoutsGenerationCount = 0x7FFFFFFFFFFFFFFFLL;
    v10 = objc_opt_new();
    cachedFrameForIndex = v9->_cachedFrameForIndex;
    v9->_cachedFrameForIndex = (NSMutableDictionary *)v10;

  }
  return v9;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBGridSwitcherModifier *v5;
  SBSwitcherModifier *gridModifier;
  SBDefaultImplementationsSwitcherModifier *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMixedGridSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v8, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_gridModifier)
    {
      v5 = objc_alloc_init(SBGridSwitcherModifier);
      gridModifier = self->_gridModifier;
      self->_gridModifier = &v5->super;

      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_gridModifier);
      v7 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", v7);

    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMixedGridSwitcherModifier;
  v4 = -[SBChainableModifier copyWithZone:](&v6, sel_copyWithZone_, a3);
  *(CGSize *)(v4 + 248) = self->_fullScreenCardSize;
  *(CGSize *)(v4 + 264) = self->_floatingCardSize;
  v4[228] = self->_reversesFloatingCardDirection;
  *((_QWORD *)v4 + 29) = self->_lowDensityGridLayoutAlignment;
  *((_QWORD *)v4 + 30) = self->_maximumNumberOfFullScreenCardsForSingleRow;
  v4[130] = self->_cachedVisibleAppsRangeIsValid;
  *(_NSRange *)(v4 + 136) = self->_cachedVisibleAppsRange;
  *((_QWORD *)v4 + 23) = *(_QWORD *)&self->_cachedFullScreenCardScale;
  *((_QWORD *)v4 + 21) = self->_lastAppLayoutsGenerationCount;
  *((_QWORD *)v4 + 22) = self->_cachedIndexOfFirstMainAppLayout;
  *((_QWORD *)v4 + 23) = *(_QWORD *)&self->_cachedFullScreenCardScale;
  *((_OWORD *)v4 + 12) = self->_cachedContentSize;
  objc_storeStrong((id *)v4 + 26, self->_cachedFrameForIndex);
  *((_DWORD *)v4 + 56) = self->_cachesValidity;
  return v4;
}

- (id)handleScrollEvent:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double x;
  void *v9;
  objc_super v11;

  v4 = a3;
  self->_isScrolling = objc_msgSend(v4, "phase") == 0;
  objc_msgSend(v4, "contentOffset");
  x = self->_previousContentOffset.x;
  if (x != 1.79769313e308 || self->_previousContentOffset.y != 1.79769313e308)
    self->_isScrollingForward = x > v5;
  self->_previousContentOffset.x = v5;
  self->_previousContentOffset.y = v6;
  self->_cachedVisibleAppsRangeIsValid = 0;
  v11.receiver = self;
  v11.super_class = (Class)SBMixedGridSwitcherModifier;
  -[SBSwitcherModifier handleScrollEvent:](&v11, sel_handleScrollEvent_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBScrollToAppLayoutSwitcherEventResponse *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBMixedGridSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v12, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "toEnvironmentMode") == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
    self->_floatingConfiguration = objc_msgSend(v4, "fromFloatingConfiguration");
    if (objc_msgSend(v4, "phase") == 2
      && !-[SBMixedGridSwitcherModifier _numberOfFullScreenAppLayouts](self, "_numberOfFullScreenAppLayouts")
      && -[SBMixedGridSwitcherModifier numberOfFloatingAppLayouts](self, "numberOfFloatingAppLayouts"))
    {
      -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v7, 0, 1);
      SBAppendSwitcherModifierResponse(v8, v5);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
  }
  objc_msgSend(v4, "toAppLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasForegroundFullScreenApp = v10 != 0;

  self->_isSwitcherVisible = objc_msgSend(v4, "toEnvironmentMode") == 2;
  return v5;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[5];
  id v14;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBMixedGridSwitcherModifier;
  -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](&v15, sel_responseForProposedChildResponse_childModifier_event_, a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v8, "type") == 17)
  {
    objc_msgSend(v8, "appLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "environment") == 2 && !self->_hasForegroundFullScreenApp)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __84__SBMixedGridSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
      v13[3] = &unk_1E8EA6068;
      v13[4] = self;
      v14 = v10;
      objc_msgSend(v9, "responseByTransformingResponseWithTransformer:", v13);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }

  }
  return v9;
}

SBPerformTransitionSwitcherEventResponse *__84__SBMixedGridSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  SBPerformTransitionSwitcherEventResponse *v3;
  _BYTE *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  SBMutableSwitcherTransitionRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  SBAppLayout *v15;
  SBAppLayout *v16;
  uint64_t v17;
  SBPerformTransitionSwitcherEventResponse *v18;
  SBPerformTransitionSwitcherEventResponse *v19;
  uint64_t v20;
  SBPerformTransitionSwitcherEventResponse *v21;
  SBPerformTransitionSwitcherEventResponse *v22;
  SBPerformTransitionSwitcherEventResponse *v23;
  void *v24;
  void *v25;
  SBPerformTransitionSwitcherEventResponse *v26;
  SBPerformTransitionSwitcherEventResponse *v27;
  SBPerformTransitionSwitcherEventResponse *v28;
  void *v29;
  void *v30;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (-[SBPerformTransitionSwitcherEventResponse type](v3, "type") == 1)
  {
    v4 = *(_BYTE **)(a1 + 32);
    if (v4[129])
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      objc_msgSend(v4, "appLayouts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v40;
LABEL_5:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v40 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v8);
          if (objc_msgSend(v9, "environment") == 1)
            break;
          if (v6 == ++v8)
          {
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
            if (v6)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v10 = v9;

        if (!v10)
          goto LABEL_17;
        v11 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
        v33 = 0;
        v34 = &v33;
        v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__19;
        v37 = __Block_byref_object_dispose__19;
        v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __84__SBMixedGridSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_15;
        v32[3] = &unk_1E8EA6040;
        v32[4] = &v33;
        objc_msgSend(v10, "enumerate:", v32);
        v12 = (void *)v34[5];
        objc_msgSend(*(id *)(a1 + 40), "itemForLayoutRole:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v13, v14);

        v15 = [SBAppLayout alloc];
        v16 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v15, "initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v34[5], objc_msgSend(v10, "configuration"), objc_msgSend(v10, "centerConfiguration"), objc_msgSend(v10, "environment"), objc_msgSend(v10, "isHidden"), objc_msgSend(*(id *)(a1 + 32), "displayOrdinal"));
        -[SBSwitcherTransitionRequest setAppLayout:](v11, "setAppLayout:", v16);
        -[SBSwitcherTransitionRequest setAppLayoutEnvironment:](v11, "setAppLayoutEnvironment:", 1);
        v17 = objc_opt_class();
        v18 = v3;
        if (v17)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = v18;
          else
            v19 = 0;
        }
        else
        {
          v19 = 0;
        }
        v28 = v19;

        -[SBPerformTransitionSwitcherEventResponse transitionRequest](v28, "transitionRequest");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "activatingDisplayItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherTransitionRequest setActivatingDisplayItem:](v11, "setActivatingDisplayItem:", v30);

        v3 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v11, 0);
        _Block_object_dispose(&v33, 8);

        goto LABEL_25;
      }
LABEL_11:

    }
LABEL_17:
    +[SBSwitcherTransitionRequest requestForActivatingHomeScreen](SBSwitcherTransitionRequest, "requestForActivatingHomeScreen");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    -[SBSwitcherTransitionRequest setAppLayout:](v11, "setAppLayout:", *(_QWORD *)(a1 + 40));
    -[SBSwitcherTransitionRequest setAppLayoutEnvironment:](v11, "setAppLayoutEnvironment:", 1);
    v20 = objc_opt_class();
    v21 = v3;
    if (v20)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    v23 = v22;

    -[SBPerformTransitionSwitcherEventResponse transitionRequest](v23, "transitionRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "activatingDisplayItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherTransitionRequest setActivatingDisplayItem:](v11, "setActivatingDisplayItem:", v25);

    v26 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v10, 0);
    v27 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v11, 0);
    -[SBChainableModifierEventResponse setDelay:withValidator:](v27, "setDelay:withValidator:", 0, 0.2);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v27, v26);
    v3 = (SBPerformTransitionSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  }
  return v3;
}

void __84__SBMixedGridSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  id v5;
  id v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = -[SBMixedGridSwitcherModifier reversesFloatingCardDirection](self, "reversesFloatingCardDirection");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "environment", (_QWORD)v16) != 3
          && -[SBMixedGridSwitcherModifier isAppLayoutMostRecentRepresentationOfDisplayItems:](self, "isAppLayoutMostRecentRepresentationOfDisplayItems:", v13))
        {
          if (objc_msgSend(v13, "environment") == 1)
          {
            v14 = v5;
          }
          else
          {
            v14 = v6;
            if (v7)
            {
              objc_msgSend(v6, "insertObject:atIndex:", v13, 0);
              continue;
            }
          }
          objc_msgSend(v14, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "addObjectsFromArray:", v5);
  return v6;
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[SBMixedGridSwitcherModifier _frameForIndex:applyScrollViewContentOffset:](self, "_frameForIndex:applyScrollViewContentOffset:", a3, 1);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (!-[SBMixedGridSwitcherModifier _isIndexFullScreen:](self, "_isIndexFullScreen:", a3))
    -[SBMixedGridSwitcherModifier _adjustedFrame:forFloatingAppIndex:](self, "_adjustedFrame:forFloatingAppIndex:", a3, v6, v8, v10, v12);
  UIRectGetCenter();
  -[SBMixedGridSwitcherModifier screenScale](self, "screenScale");
  UIRectCenteredAboutPointScale();
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_adjustedFrame:(CGRect)a3 forFloatingAppIndex:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  int v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  double v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBMixedGridSwitcherModifier _floatingAppsStackRange](self, "_floatingAppsStackRange");
  if (!v13)
    goto LABEL_35;
  v14 = v12;
  if (a4 < v12)
    goto LABEL_35;
  v15 = v13;
  if (a4 - v12 >= v13)
    goto LABEL_35;
  -[SBMixedGridSwitcherModifier floatingCardSize](self, "floatingCardSize");
  v17 = v16;
  -[SBMixedGridSwitcherModifier unadjustedScaleForIndex:](self, "unadjustedScaleForIndex:", a4);
  v19 = v18;
  -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v21 = v20;
  -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v23 = v22;
  v24 = -[SBMixedGridSwitcherModifier _indexOfFirstFloatingLayoutFromAppLayouts:](self, "_indexOfFirstFloatingLayoutFromAppLayouts:", v11);
  if (v24 == a4)
    goto LABEL_35;
  v25 = v24;
  v26 = v17 * v19 + v21;
  v27 = v24 - 1;
  -[SBMixedGridSwitcherModifier contentOffsetForIndex:alignment:](self, "contentOffsetForIndex:alignment:", a4, 0);
  v29 = v28;
  if (v27 == a4)
  {
    v30 = v28 - v26 + 20.0;
    if (v10)
      v30 = v26 + v29 + -20.0;
  }
  else
  {
    v31 = v15 - a4 + v14;
    if (v27 < v14 || v27 - v14 >= v15 || v25 < v14 || v25 - v14 >= v15)
    {
      v32 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
      v33 = -v26;
      if (!v32)
        v33 = v26;
      v30 = v29 - v33 * (double)v31;
    }
    else
    {
      v30 = v28 + v26 * (double)v31 + -20.0;
      if (!v10)
        v30 = v29 - v26 * (double)v31 + 20.0;
    }
  }
  if (v23 <= v30)
    v34 = v23;
  else
    v34 = v30;
  if (v23 >= v30)
    v30 = v23;
  if (v10)
    v30 = v34;
  v35 = x - (v29 - v30);
  -[SBMixedGridSwitcherModifier _frameForIndex:applyScrollViewContentOffset:](self, "_frameForIndex:applyScrollViewContentOffset:", v25, 1);
  if (v10)
  {
    if (v35 >= x)
      x = v35;
    if (x <= v36)
      goto LABEL_35;
LABEL_34:
    x = v36;
    goto LABEL_35;
  }
  if (v35 < x)
    x = v35;
  if (x < v36)
    goto LABEL_34;
LABEL_35:

  v37 = x;
  v38 = y;
  v39 = width;
  v40 = height;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (_NSRange)_floatingAppsStackRange
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger location;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBMixedGridSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = objc_msgSend(v3, "count");
  if (v4 >= 4)
    v5 = 4;
  else
    v5 = v4;
  if (v5)
  {
    if (self->_cachedVisibleAppsRangeIsValid)
    {
      location = self->_cachedVisibleAppsRange.location;
    }
    else
    {
      -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
      v7 = -[SBMixedGridSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
      v9 = v7 == 1;
      if (v7 <= 1)
      {
        location = 0;
      }
      else
      {
        v9 = 2;
        location = v7 - 2;
      }
      self->_cachedVisibleAppsRange.location = location;
      self->_cachedVisibleAppsRange.length = v8 + v9;
      self->_cachedVisibleAppsRangeIsValid = 1;
    }
  }
  else
  {
    location = 0;
  }

  v10 = location;
  v11 = v5;
  result.length = v11;
  result.location = v10;
  return result;
}

- (double)unadjustedScaleForIndex:(unint64_t)a3
{
  double result;

  if (-[SBMixedGridSwitcherModifier _isIndexFullScreen:](self, "_isIndexFullScreen:", a3))
    -[SBMixedGridSwitcherModifier _fullScreenCardScale](self, "_fullScreenCardScale");
  else
    -[SBMixedGridSwitcherModifier _floatingCardScale](self, "_floatingCardScale");
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double result;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double x;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;

  if (-[SBMixedGridSwitcherModifier _isIndexFullScreen:](self, "_isIndexFullScreen:"))
  {
    -[SBMixedGridSwitcherModifier _cachedFullScreenCardScale](self, "_cachedFullScreenCardScale");
  }
  else
  {
    -[SBMixedGridSwitcherModifier _floatingCardScale](self, "_floatingCardScale");
    v7 = v6;
    v8 = v6 * 0.899999976;
    -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMixedGridSwitcherModifier _indexOfFirstFloatingLayoutFromAppLayouts:](self, "_indexOfFirstFloatingLayoutFromAppLayouts:", v9);

    -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
    v11 = v10;
    -[SBMixedGridSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v13 = v12;
    if (-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      v14 = 0.0;
    else
      v14 = v13;
    v15 = v11 + v14;
    -[SBMixedGridSwitcherModifier _frameForIndex:applyScrollViewContentOffset:](self, "_frameForIndex:applyScrollViewContentOffset:", a3, 0);
    x = v23.origin.x;
    v17 = v7 * CGRectGetWidth(v23);
    -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
    v19 = v17 + v18 * 2.0;
    if (-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      v20 = v19;
    else
      v20 = 0.0;
    v21 = x + v20;
    if (-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      v22 = 0.0;
    else
      v22 = v19;
    result = v8 + (v7 - v8) * (v15 - v21) / (x + v22 - v21);
    if (v8 >= result)
      result = v7 * 0.899999976;
    if (v7 <= result)
      return v7;
  }
  return result;
}

- (id)visibleAppLayouts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBMixedGridSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", v3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_NSRange)rangeOfVisibleAppLayouts
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBMixedGridSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
  result.length = v4;
  result.location = v3;
  return result;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  SBMutableSwitcherAnimationAttributes *v5;
  void *v6;
  void *v7;

  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  -[SBSwitcherAnimationAttributes setUpdateMode:](v5, "setUpdateMode:", 1);
  -[SBSwitcherAnimationAttributes setCornerRadiusUpdateMode:](v5, "setCornerRadiusUpdateMode:", 3);
  objc_msgSend(v4, "layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAnimationAttributes setLayoutSettings:](v5, "setLayoutSettings:", v6);

  objc_msgSend(v4, "opacitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAnimationAttributes setOpacitySettings:](v5, "setOpacitySettings:", v7);

  return v5;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)objc_msgSend(v5, "count") < 3)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "addIndex:", v6 - 1);
      if (v6 != 1)
        objc_msgSend(v8, "addIndex:", v6 - 2);
    }
    if (v6 < objc_msgSend(v5, "count") - 1)
      objc_msgSend(v8, "addIndex:", v6 + 1);
    if (v6 < objc_msgSend(v5, "count") - 2)
      objc_msgSend(v8, "addIndex:", v6 + 2);
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "objectsAtIndexes:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  CGRect v4;

  -[SBMixedGridSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  return CGRectGetWidth(v4);
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v32;

  v5 = 1.0;
  if (!-[SBMixedGridSwitcherModifier _isIndexFullScreen:](self, "_isIndexFullScreen:"))
  {
    -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBSwitcherModifier indexOfFirstFloatingAppFromAppLayouts:](self, "indexOfFirstFloatingAppFromAppLayouts:", v6);

    if (v7 != a3)
    {
      -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
      v9 = v8;
      -[SBMixedGridSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v11 = v10;
      if (-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
        v12 = 0.0;
      else
        v12 = v11;
      v13 = v9 + v12;
      -[SBMixedGridSwitcherModifier _frameForIndex:applyScrollViewContentOffset:](self, "_frameForIndex:applyScrollViewContentOffset:", a3, 0);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[SBMixedGridSwitcherModifier _floatingCardScale](self, "_floatingCardScale");
      v23 = v22;
      v32.origin.x = v15;
      v32.origin.y = v17;
      v32.size.width = v19;
      v32.size.height = v21;
      v24 = v23 * CGRectGetWidth(v32);
      -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
      v26 = v24 + v25;
      v27 = v25 * 1.5;
      if (-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
        v28 = v26;
      else
        v28 = v27;
      v29 = v15 + v28;
      if (-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
        v30 = v27;
      else
        v30 = v26;
      return fmin(fmax((v13 - v29) / (v15 + v30 - v29) + 0.0, 0.0), 1.0);
    }
  }
  return v5;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (a3 == 4)
    return 2;
  else
    return 1;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIRectCornerRadii result;

  -[SBMixedGridSwitcherModifier _cardCornerRadiusInSwitcher](self, "_cardCornerRadiusInSwitcher");
  -[SBMixedGridSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (double)splitViewInnerCornerRadius
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBMixedGridSwitcherModifier;
  -[SBMixedGridSwitcherModifier splitViewInnerCornerRadius](&v11, sel_splitViewInnerCornerRadius);
  v4 = v3;
  -[SBMixedGridSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  v6 = v5;
  if ((BSFloatIsZero() & 1) == 0)
  {
    -[SBMixedGridSwitcherModifier _cardCornerRadiusInSwitcher](self, "_cardCornerRadiusInSwitcher");
    v8 = v7;
    -[SBMixedGridSwitcherModifier _cachedFullScreenCardScale](self, "_cachedFullScreenCardScale");
    return v4 * (v8 / v9 / v6);
  }
  return v4;
}

- (BOOL)canFocusableAppLayoutBeEffectivelyObscured:(id)a3
{
  return objc_msgSend(a3, "environment") == 2;
}

- (id)appLayoutsToCacheSnapshots
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v3 = -[SBMixedGridSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
  v5 = v4;
  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSnapshotsToCacheInSwitcher");

  return -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v3, v5, v7, self->_isScrollingForward);
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SBMixedGridSwitcherModifier *v10;

  if (-[SBMixedGridSwitcherModifier _isDoubleStackingFullScreenCards](self, "_isDoubleStackingFullScreenCards"))
    return MEMORY[0x1E0C9AA60];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SBMixedGridSwitcherModifier appLayoutsToCacheSnapshots](self, "appLayoutsToCacheSnapshots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBMixedGridSwitcherModifier_appLayoutsToCacheFullsizeSnapshots__block_invoke;
  v8[3] = &unk_1E8EA4710;
  v6 = v4;
  v9 = v6;
  v10 = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v7 = v6;
  return v7;
}

void __65__SBMixedGridSwitcherModifier_appLayoutsToCacheFullsizeSnapshots__block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "environment") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  v6 = objc_msgSend(*(id *)(a1 + 32), "count");
  *a4 = v6 == objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfFullScreenCardsForSingleRow");

}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return -[SBMixedGridSwitcherModifier isIndexVisible:](self, "isIndexVisible:", a4);
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t result;

  result = -[SBMixedGridSwitcherModifier _indexOfLeadingCard](self, "_indexOfLeadingCard", a3);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return result;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;

  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = -[SBMixedGridSwitcherModifier _indexOfLeadingCard](self, "_indexOfLeadingCard");
  v8 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  if (v7 >= v5 - 1)
    v9 = v8;
  else
    v9 = 0;
  return v7 - v9;
}

- (unint64_t)indexOfFirstMainAppLayoutFromAppLayouts:(id)a3
{
  id v4;
  uint64_t *v5;
  unint64_t cachedIndexOfFirstMainAppLayout;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  -[SBMixedGridSwitcherModifier _invalidateCachesIfNeeded](self, "_invalidateCachesIfNeeded");
  if ((*(_BYTE *)&self->_cachesValidity & 1) != 0)
  {
    cachedIndexOfFirstMainAppLayout = self->_cachedIndexOfFirstMainAppLayout;
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__SBMixedGridSwitcherModifier_indexOfFirstMainAppLayoutFromAppLayouts___block_invoke;
    v8[3] = &unk_1E8EA5FF0;
    v8[4] = &v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
    v5 = v10;
    self->_cachedIndexOfFirstMainAppLayout = v10[3];
    *(_BYTE *)&self->_cachesValidity |= 1u;
    cachedIndexOfFirstMainAppLayout = v5[3];
    _Block_object_dispose(&v9, 8);
  }

  return cachedIndexOfFirstMainAppLayout;
}

uint64_t __71__SBMixedGridSwitcherModifier_indexOfFirstMainAppLayoutFromAppLayouts___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "environment");
  if (result == 1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)_indexOfFirstFloatingLayoutFromAppLayouts:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[SBMixedGridSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v4);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_msgSend(v4, "count");
    if (v7)
      v6 = v7 - 1;
  }
  else
  {
    v6 = v5 - 1;
  }

  return v6;
}

- (unint64_t)numberOfFloatingAppLayouts
{
  void *v3;
  unint64_t v4;

  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBMixedGridSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)isIndexVisible:(unint64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[SBMixedGridSwitcherModifier _frameForIndex:applyScrollViewContentOffset:](self, "_frameForIndex:applyScrollViewContentOffset:", a3, 1);
  -[SBMixedGridSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "switcherCardShadowRadius");
  v15 = v14;

  -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v18 = CGRectInset(v17, v15 * -2.8, v15 * -2.8);
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  return CGRectIntersectsRect(v18, v19);
}

- (BOOL)isIndexFullyVisible:(unint64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[SBMixedGridSwitcherModifier _frameForIndex:applyScrollViewContentOffset:](self, "_frameForIndex:applyScrollViewContentOffset:", a3, 1);
  -[SBMixedGridSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "switcherCardShadowRadius");
  v15 = v14;

  -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v18 = CGRectInset(v17, v15 * -2.8, v15 * -2.8);
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  return CGRectContainsRect(v18, v19);
}

- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isCenterOverFull") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMixedGridSwitcherModifier;
    v5 = -[SBMixedGridSwitcherModifier shouldTetherItemsAndAccessoriesInAppLayout:](&v7, sel_shouldTetherItemsAndAccessoriesInAppLayout_, v4);
  }

  return v5;
}

- (double)firstFloatingCardPeekingWidth
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spacingBetweenLeadingEdgeAndIcon");
  v4 = v3;
  objc_msgSend(v2, "iconSideLength");
  v6 = v4 + v5;
  objc_msgSend(v2, "spacingBetweenLeadingEdgeAndIcon");
  v8 = v6 + v7 * 2.0;

  return v8;
}

- (unint64_t)_indexOfLeadingCard
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  int v15;
  void *v17;
  BOOL v18;
  CGRect v19;
  CGRect v20;

  v3 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v4 = -[SBMixedGridSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v4;
  -[SBSwitcherModifier scaledFrameForIndex:](self, "scaledFrameForIndex:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  if (!CGRectIntersectsRect(v19, v20))
  {
    if (v6)
      v15 = v3;
    else
      v15 = 0;
    if (v15 == 1)
    {
      --v6;
    }
    else if ((v3 & 1) == 0)
    {
      -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v6 < objc_msgSend(v17, "count") - 1;

      v6 += v18;
    }
  }
  return v6;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  return a3;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  return a3;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double result;

  if (objc_msgSend(a4, "environment", a3) == 1)
    -[SBMixedGridSwitcherModifier _fullScreenCardScale](self, "_fullScreenCardScale");
  else
    -[SBMixedGridSwitcherModifier _floatingCardScale](self, "_floatingCardScale");
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  double result;

  if (objc_msgSend(a3, "environment", a4) == 1)
    -[SBMixedGridSwitcherModifier _fullScreenCardScale](self, "_fullScreenCardScale");
  else
    -[SBMixedGridSwitcherModifier _floatingCardScale](self, "_floatingCardScale");
  return result;
}

- (id)scrollViewAttributes
{
  SBMutableSwitcherScrollViewAttributes *v3;

  v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  -[SBMixedGridSwitcherModifier _contentSize](self, "_contentSize");
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  -[SBSwitcherScrollViewAttributes setDecelerationRate:](v3, "setDecelerationRate:", *MEMORY[0x1E0CEBBA8]);
  -[SBSwitcherScrollViewAttributes setScrollViewPagingEnabled:](v3, "setScrollViewPagingEnabled:", 0);
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[SBSwitcherScrollViewAttributes setInterpolatesDuringSwipeToKill:](v3, "setInterpolatesDuringSwipeToKill:", 0);
  return v3;
}

- (double)_cardCornerRadiusInSwitcher
{
  double v2;
  BOOL v3;
  double result;

  -[SBMixedGridSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  v3 = v2 <= 0.0;
  result = 7.0;
  if (!v3)
    return 10.0;
  return result;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  CGRect v6;

  -[SBMixedGridSwitcherModifier frameForIndex:](self, "frameForIndex:");
  -[SBMixedGridSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  return CGRectGetMinY(v6);
}

- (CGSize)_contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double width;
  CGFloat x;
  CGFloat y;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double height;
  double v16;
  CGSize result;
  CGRect v18;
  CGRect v19;

  -[SBMixedGridSwitcherModifier _invalidateCachesIfNeeded](self, "_invalidateCachesIfNeeded");
  if ((*(_BYTE *)&self->_cachesValidity & 4) != 0)
  {
    width = self->_cachedContentSize.width;
    height = self->_cachedContentSize.height;
  }
  else
  {
    -[SBMixedGridSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
    v4 = v3;
    v6 = v5;
    -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
    width = v4 + v7 * 2.0;
    -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    x = v18.origin.x;
    y = v18.origin.y;
    v11 = v18.size.width;
    v12 = v18.size.height;
    v13 = CGRectGetWidth(v18);
    if (width < v13)
      width = v13;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = v11;
    v19.size.height = v12;
    v14 = CGRectGetHeight(v19);
    if (v6 >= v14)
      height = v6;
    else
      height = v14;
    self->_cachedContentSize.width = width;
    self->_cachedContentSize.height = height;
    *(_BYTE *)&self->_cachesValidity |= 4u;
  }
  v16 = width;
  result.height = height;
  result.width = v16;
  return result;
}

- (CGSize)_fittedContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char IsZero;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[SBMixedGridSwitcherModifier _fittedFullScreenContentSize](self, "_fittedFullScreenContentSize");
  v4 = v3;
  -[SBMixedGridSwitcherModifier _fittedFloatingContentSize](self, "_fittedFloatingContentSize");
  v6 = v5;
  -[SBMixedGridSwitcherModifier _minimumFullScreenContentSize](self, "_minimumFullScreenContentSize");
  v8 = v7;
  IsZero = BSFloatIsZero();
  v10 = 0.0;
  if ((IsZero & 1) == 0)
    -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing", 0.0);
  if (v4 >= v8)
    v11 = v4;
  else
    v11 = v8;
  v12 = v6 + v11 + v10;
  -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v14 = v13;
  v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (CGSize)_fittedFullScreenContentSize
{
  unint64_t v3;
  double v4;
  double v5;
  unint64_t v6;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = -[SBMixedGridSwitcherModifier _numberOfFullScreenAppLayouts](self, "_numberOfFullScreenAppLayouts");
  -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v5 = v4;
  v6 = -[SBMixedGridSwitcherModifier _numberOfFullScreenColumns](self, "_numberOfFullScreenColumns");
  width = self->_fullScreenCardSize.width;
  -[SBMixedGridSwitcherModifier _fullScreenCardScale](self, "_fullScreenCardScale");
  if (v3)
    v9 = -(v5 - (double)v6 * (v5 + width * v8));
  else
    v9 = 0.0;
  -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v11 = v10;
  v12 = v9;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGSize)_fittedFloatingContentSize
{
  unint64_t v3;
  double v4;
  double v5;
  unint64_t v6;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = -[SBMixedGridSwitcherModifier numberOfFloatingAppLayouts](self, "numberOfFloatingAppLayouts");
  -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v5 = v4;
  v6 = -[SBMixedGridSwitcherModifier _numberOfFloatingColumns](self, "_numberOfFloatingColumns");
  width = self->_floatingCardSize.width;
  -[SBMixedGridSwitcherModifier _floatingCardScale](self, "_floatingCardScale");
  if (v3)
    v9 = -(v5 - (double)v6 * (v5 + width * v8));
  else
    v9 = 0.0;
  -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v11 = v10;
  v12 = v9;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGSize)_minimumFullScreenContentSize
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;
  CGRect v15;

  -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v7 = CGRectGetWidth(v14);
  -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v9 = v7 + v8 * -2.0;
  if (-[SBMixedGridSwitcherModifier numberOfFloatingAppLayouts](self, "numberOfFloatingAppLayouts"))
  {
    -[SBMixedGridSwitcherModifier firstFloatingCardPeekingWidth](self, "firstFloatingCardPeekingWidth");
    v9 = v9 - v10;
  }
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v11 = CGRectGetHeight(v15);
  v12 = v9;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double Width;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGPoint result;

  v7 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  -[SBMixedGridSwitcherModifier _contentSize](self, "_contentSize");
  v9 = v8;
  -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v11 = v10;
  -[SBMixedGridSwitcherModifier _scaledCardSizeForIndex:](self, "_scaledCardSizeForIndex:", a3);
  v13 = v12;
  -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v15 = v14;
  -[SBMixedGridSwitcherModifier _frameForIndex:applyScrollViewContentOffset:](self, "_frameForIndex:applyScrollViewContentOffset:", a3, 0);
  -[SBMixedGridSwitcherModifier unadjustedScaleForIndex:](self, "unadjustedScaleForIndex:", a3);
  SBTransformedRectWithScale();
  v20 = v19;
  v21 = 0.0;
  v22 = v13 + v15;
  switch(a4)
  {
    case 0:
      if (v7)
        v21 = -v15;
      else
        v21 = v13 + v15;
      -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SBMixedGridSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v23);
      if (v24 == 0x7FFFFFFFFFFFFFFFLL)
        v24 = objc_msgSend(v23, "count");
      objc_msgSend(v23, "objectAtIndex:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMixedGridSwitcherModifier keyboardFocusedAppLayout](self, "keyboardFocusedAppLayout");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (a3 && (void *)v26 == v25 && v24 - 1 > a3 && objc_msgSend(v25, "environment") == 2)
      {
        v28 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
        v29 = 20.0;
        if (v28)
          v29 = -20.0;
        v21 = v21 + v29;
      }

      break;
    case 1:
      v30 = v22 - v11;
      if (v7)
        v21 = v30;
      else
        v21 = v11 - v15;
      break;
    case 2:
      v31 = -(v15 + v22);
      v32 = v22 + v22;
      if (v7)
        v21 = v31;
      else
        v21 = v32;
      break;
    case 3:
      if (v7)
      {
        v33 = v20;
        Width = CGRectGetWidth(*(CGRect *)(&v16 - 1));
        -[SBMixedGridSwitcherModifier firstFloatingCardPeekingWidth](self, "firstFloatingCardPeekingWidth");
        v21 = Width - v35;
      }
      else
      {
        -[SBMixedGridSwitcherModifier firstFloatingCardPeekingWidth](self, "firstFloatingCardPeekingWidth", v22);
        v21 = v36;
      }
      break;
    default:
      break;
  }
  if (v7)
    v37 = 0.0;
  else
    v37 = v11;
  v38 = fmax(v20 + v21 - v37, 0.0);
  if (v9 - v11 <= v38)
    v38 = v9 - v11;
  v39 = 0.0;
  result.y = v39;
  result.x = v38;
  return result;
}

- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSUInteger v15;
  NSUInteger v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _NSRange result;

  y = a3.y;
  x = a3.x;
  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = -[SBMixedGridSwitcherModifier _numberOfFullScreenAppLayouts](self, "_numberOfFullScreenAppLayouts");
    v9 = -[SBMixedGridSwitcherModifier numberOfFloatingAppLayouts](self, "numberOfFloatingAppLayouts");
    if (-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    {
      v10 = -[SBMixedGridSwitcherModifier _numberOfOffScreenTrailingFloatingCardsForContentOffset:](self, "_numberOfOffScreenTrailingFloatingCardsForContentOffset:", x, y);
      if (v10 == v9)
      {
        v11 = x;
        if (v8 && v9)
        {
          -[SBMixedGridSwitcherModifier _fittedFloatingContentSize](self, "_fittedFloatingContentSize", v10, x);
          v13 = v12;
          -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
          v11 = x - (v13 + v14);
        }
        v10 = -[SBMixedGridSwitcherModifier _numberOfOffScreenTrailingFullScreenCardsForContentOffset:](self, "_numberOfOffScreenTrailingFullScreenCardsForContentOffset:", v10, v11, y)+ v9;
      }
    }
    else
    {
      v17 = -[SBMixedGridSwitcherModifier _numberOfOffScreenTrailingFullScreenCardsForContentOffset:](self, "_numberOfOffScreenTrailingFullScreenCardsForContentOffset:", x, y);
      if (v17 == v8)
      {
        if (v8)
        {
          -[SBMixedGridSwitcherModifier _fittedFullScreenContentSize](self, "_fittedFullScreenContentSize");
          v19 = v18;
          -[SBMixedGridSwitcherModifier _minimumFullScreenContentSize](self, "_minimumFullScreenContentSize");
          if (v19 < v20)
            v19 = v20;
        }
        else
        {
          -[SBMixedGridSwitcherModifier _minimumFullScreenContentSize](self, "_minimumFullScreenContentSize");
          v19 = v21;
        }
        -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
        v17 = -[SBMixedGridSwitcherModifier _numberOfOffScreenTrailingFloatingCardsForContentOffset:](self, "_numberOfOffScreenTrailingFloatingCardsForContentOffset:", x - (v19 + v22), y)+ v8;
      }
      v10 = v7 + ~v17;
    }
    v15 = -[SBMixedGridSwitcherModifier _visibleAppLayoutRangeForContentOffset:lastVisibleIndex:](self, "_visibleAppLayoutRangeForContentOffset:lastVisibleIndex:", v10, x, y);
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  result.length = v16;
  result.location = v15;
  return result;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5;
  unsigned __int8 v6;
  char v7;
  char v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBMixedGridSwitcherModifier;
  v5 = a4;
  v6 = -[SBMixedGridSwitcherModifier shouldSuppressHighlightEffectForLayoutRole:inAppLayout:](&v10, sel_shouldSuppressHighlightEffectForLayoutRole_inAppLayout_, a3, v5);
  v7 = objc_msgSend(v5, "isCenterOverSplit", v10.receiver, v10.super_class);

  if (a3 == 4)
    v8 = 0;
  else
    v8 = v7;
  return v8 | v6;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  char v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBMixedGridSwitcherModifier;
  v7 = a4;
  LOBYTE(a5) = -[SBMixedGridSwitcherModifier isLayoutRoleKillable:inAppLayout:atIndex:](&v10, sel_isLayoutRoleKillable_inAppLayout_atIndex_, a3, v7, a5);
  v8 = objc_msgSend(v7, "isCenterOverSplit", v10.receiver, v10.super_class);

  return ((a3 == 4) | ~v8) & a5;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 1;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  v6 = a4;
  if (-[SBMixedGridSwitcherModifier isSplitViewSupported](self, "isSplitViewSupported"))
  {
    objc_msgSend(v6, "itemForLayoutRole:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

    objc_msgSend(v6, "itemForLayoutRole:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.PrintKit.Print-Center"));

    v12 = v8 & ~v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_cacheKeyForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%p"), a3, a4);
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  double v3;

  -[SBMixedGridSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  return 1.0 / v3;
}

- (id)_appLayoutWithPrimaryLeafAppLayout:(id)a3 sideLeafAppLayout:(id)a4 configuration:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SBAppLayout *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "itemForLayoutRole:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemForLayoutRole:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v13, a5, 1, -[SBMixedGridSwitcherModifier displayOrdinal](self, "displayOrdinal"));
  return v14;
}

- (id)switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double height;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  unint64_t v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat width;
  char v57;
  uint64_t v58;
  SBSwitcherDropRegionContext *v59;
  void *v60;
  double v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  unsigned int v65;
  id v66;
  id v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  _BOOL4 v80;
  uint64_t v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGFloat v91;
  double v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  int v101;
  unint64_t v102;
  void *v103;
  void *v104;
  int v105;
  void *v106;
  int v107;
  void *v108;
  SBSwitcherDropRegionContext *v109;
  int v110;
  BOOL v111;
  void *v112;
  void *v113;
  double v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  uint64_t v129;
  void *v130;
  int v131;
  void *v132;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  double v142;
  double v143;
  double v144;
  int64_t v146;
  uint64_t v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  uint64_t v155;
  uint64_t v156;
  double rect;
  BOOL recta;
  id v159;
  SBSwitcherDropRegionContext *v160;
  void *v161;
  void *v162;
  void *v163;
  CGPoint v164;
  CGPoint v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  objc_msgSend(v9, "leafAppLayoutForRole:", a3);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
  v10 = -[SBMixedGridSwitcherModifier _visibleAppLayoutRangeForContentOffset:](self, "_visibleAppLayoutRangeForContentOffset:");
  v12 = v11;
  v13 = -[SBMixedGridSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "indexOfObject:", v9);

  -[SBSwitcherModifier scaledFrameForLayoutRole:inAppLayout:atIndex:](self, "scaledFrameForLayoutRole:inAppLayout:atIndex:", a3, v9, v15);
  v151 = v16;
  v152 = v17;
  v19 = v18;
  v21 = v20;
  v23 = *MEMORY[0x1E0C9D648];
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  rect = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v146 = a3;
  v159 = v9;
  v160 = -[SBSwitcherDropRegionContext initWithDraggingLayoutRole:inAppLayout:]([SBSwitcherDropRegionContext alloc], "initWithDraggingLayoutRole:inAppLayout:", a3, v9);
  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SBSwitcherModifier indexOfFirstFloatingAppFromAppLayouts:](self, "indexOfFirstFloatingAppFromAppLayouts:", v25);

  v149 = v21;
  v150 = v19;
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
  }
  else
  {
    v153 = v23;
    v30 = v22;
    v31 = height;
    -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[SBMixedGridSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v32);

    -[SBSwitcherModifier scaledFrameForIndex:](self, "scaledFrameForIndex:", v33);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    if ((-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled") & 1) == 0)
    {
      v166.origin.x = v35;
      v166.origin.y = v37;
      v166.size.width = v39;
      v166.size.height = v41;
      if (x > CGRectGetMaxX(v166))
        goto LABEL_7;
    }
    if (!-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled")
      || (v167.origin.x = v35,
          v167.origin.y = v37,
          v167.size.width = v39,
          v167.size.height = v41,
          x >= CGRectGetMinX(v167)))
    {
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v21 = v149;
      v19 = v150;
      height = v31;
      v22 = v30;
      v23 = v153;
    }
    else
    {
LABEL_7:
      -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndex:", v26);
      v43 = objc_claimAutoreleasedReturnValue();

      v44 = v26;
      v28 = (void *)v43;
      v29 = 1;
      -[SBSwitcherModifier scaledFrameForIndex:](self, "scaledFrameForIndex:", v44);
      v23 = v45;
      v22 = v46;
      rect = v47;
      height = v48;
      v27 = SBEffectiveAppLayoutConfigurationForInterfaceOrientation(objc_msgSend(v28, "configuration"), v13);
      v21 = v149;
      v19 = v150;
    }
  }
  v49 = 1;
  if (v10 < v10 + v12 && !v28)
  {
    v154 = v23;
    v143 = height;
    v147 = v29;
    v50 = v12;
    v51 = v10;
    while (1)
    {
      -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectAtIndex:", v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBMixedGridSwitcherModifier frameForIndex:](self, "frameForIndex:", v51);
      -[SBMixedGridSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v51);
      SBTransformedRectWithScale();
      v54 = v168.origin.x;
      v55 = v168.origin.y;
      width = v168.size.width;
      height = v168.size.height;
      v164.x = x;
      v164.y = y;
      if (CGRectContainsPoint(v168, v164))
        break;

      ++v51;
      if (!--v50)
      {
        v28 = 0;
        v57 = 1;
        v58 = 0;
        v60 = v159;
        v59 = v160;
        v19 = v150;
        v61 = v151;
        v21 = v149;
        goto LABEL_58;
      }
    }
    v62 = v53;
    v27 = SBEffectiveAppLayoutConfigurationForInterfaceOrientation(objc_msgSend(v62, "configuration"), v13);
    if (objc_msgSend(v62, "environment") == 2)
    {
      v49 = 1;
      rect = width;
      v22 = v55;
      v23 = v54;
      v58 = 0;
      v60 = v159;
      v28 = v62;
      v29 = 1;
    }
    else
    {
      v60 = v159;
      if (objc_msgSend(v62, "environment") != 1)
      {
        v49 = 1;
        v58 = 0;
        v28 = v62;
        v29 = v147;
        v21 = v149;
        v19 = v150;
        height = v143;
        v23 = v154;
LABEL_47:

        goto LABEL_48;
      }
      -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = -[SBMixedGridSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v63);

      LOBYTE(v63) = -[SBMixedGridSwitcherModifier _subtreeIndexForIndex:indexOfFirstMainAppLayout:](self, "_subtreeIndexForIndex:indexOfFirstMainAppLayout:", v51, v64);
      v65 = !-[SBMixedGridSwitcherModifier _isDoubleStackingFullScreenCards](self, "_isDoubleStackingFullScreenCards");
      if ((v63 & 1) != 0)
        v49 = v65;
      else
        v49 = 1;
      if (objc_msgSend(v62, "isSplitConfiguration"))
      {
        v66 = v62;
      }
      else
      {
        -[SBMixedGridSwitcherModifier _appLayoutWithPrimaryLeafAppLayout:sideLeafAppLayout:configuration:](self, "_appLayoutWithPrimaryLeafAppLayout:sideLeafAppLayout:configuration:", v163, v62, 3);
        v66 = (id)objc_claimAutoreleasedReturnValue();
      }
      v67 = v66;
      -[SBSwitcherModifier scaledFrameForLayoutRole:inAppLayout:atIndex:](self, "scaledFrameForLayoutRole:inAppLayout:atIndex:");
      v69 = v68;
      v71 = v70;
      v73 = v72;
      height = v74;
      v141 = v67;
      -[SBSwitcherModifier scaledFrameForLayoutRole:inAppLayout:atIndex:](self, "scaledFrameForLayoutRole:inAppLayout:atIndex:");
      v76 = v75;
      v148 = v77;
      v142 = v79;
      v144 = v78;
      v169.origin.x = v69;
      v169.origin.y = v71;
      v169.size.width = v73;
      v169.size.height = height;
      v165.x = x;
      v165.y = y;
      v80 = CGRectContainsPoint(v169, v165);
      v81 = 1;
      if (!v80)
        v81 = 2;
      v155 = v81;
      v161 = v62;
      if (objc_msgSend(v62, "isSplitConfiguration")
        && objc_msgSend(v62, "isOrContainsAppLayout:", v163)
        && v155 != v146)
      {
        objc_msgSend(v62, "appLayoutByModifyingConfiguration:", v27);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "flippedAppLayout");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherModifier scaledFrameForLayoutRole:inAppLayout:atIndex:](self, "scaledFrameForLayoutRole:inAppLayout:atIndex:", 1, v82, v51);
        v69 = v83;
        v71 = v84;
        v73 = v85;
        height = v86;
        -[SBSwitcherModifier scaledFrameForLayoutRole:inAppLayout:atIndex:](self, "scaledFrameForLayoutRole:inAppLayout:atIndex:", 2, v82, v51);
        v76 = v87;
        v148 = v88;
        v142 = v90;
        v144 = v89;

      }
      v28 = v161;
      v58 = v155;
      if (objc_msgSend(v161, "isSplitConfiguration"))
        v29 = v155;
      else
        v29 = 1;
      if (v155 != 1)
        height = v142;
      v91 = v144;
      if (v155 == 1)
        v91 = v73;
      rect = v91;
      v92 = v76;
      if (v155 == 1)
        v22 = v71;
      else
        v22 = v148;
      if (v155 == 1)
        v23 = v69;
      else
        v23 = v92;

    }
    v21 = v149;
    v19 = v150;
    goto LABEL_47;
  }
  v58 = 0;
  v60 = v159;
LABEL_48:
  v147 = v29;
  if (v28)
  {
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v134 = v58;
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMixedGridSwitcherModifier.m"), 1135, CFSTR("intersectingLayoutRole should not be undefined"));

      v58 = v134;
    }
    v170.origin.x = v23;
    v170.origin.y = v22;
    v170.size.width = rect;
    v170.size.height = height;
    if (CGRectIsEmpty(v170))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v136 = v58;
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMixedGridSwitcherModifier.m"), 1136, CFSTR("targetRect should not have an empty size"));

      v58 = v136;
    }
    if (!v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v138 = v58;
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMixedGridSwitcherModifier.m"), 1137, CFSTR("intersectingLayoutRoleConfiguration should not be undefined"));

      v58 = v138;
    }
    v59 = v160;
    -[SBSwitcherDropRegionContext setIntersectingAppLayout:](v160, "setIntersectingAppLayout:", v28);
    -[SBSwitcherDropRegionContext setIntersectingLayoutRole:](v160, "setIntersectingLayoutRole:", v29);
    -[SBSwitcherDropRegionContext setScaledIntersectingAppLayoutSize:](v160, "setScaledIntersectingAppLayoutSize:", rect, height);
    SBTransformedSizeWithScale();
    -[SBSwitcherDropRegionContext setUnscaledIntersectingAppLayoutSize:](v160, "setUnscaledIntersectingAppLayoutSize:");
    -[SBSwitcherDropRegionContext setIntersectingAppLayoutConfiguration:](v160, "setIntersectingAppLayoutConfiguration:", v27);
    -[SBSwitcherDropRegionContext setIntersectingAppLayoutIsOnFirstRow:](v160, "setIntersectingAppLayoutIsOnFirstRow:", v49);
    -[SBSwitcherDropRegionContext setTargetRect:](v160, "setTargetRect:", v23, v22, rect, height);
    v57 = 0;
  }
  else
  {
    v57 = 1;
    v59 = v160;
  }
  v61 = v151;
LABEL_58:
  -[SBSwitcherDropRegionContext setOriginRect:](v59, "setOriginRect:", v61, v19, v152, v21);
  v156 = v58;
  if (objc_msgSend(v60, "configuration") == 1)
    v93 = 1;
  else
    v93 = v58;
  v162 = v28;
  objc_msgSend(v28, "itemForLayoutRole:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "uniqueIdentifier");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "itemForLayoutRole:", 1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "uniqueIdentifier");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v95, "isEqualToString:", v97);

  if ((v57 & 1) != 0 || (v98 & 1) != 0)
  {
    if ((v57 & 1) != 0)
    {
      if (v98)
        v102 = 1;
      else
        v102 = 2;
      goto LABEL_73;
    }
    recta = 0;
    v101 = 1;
    v99 = v162;
  }
  else
  {
    v99 = v162;
    objc_msgSend(v162, "itemForLayoutRole:", 4);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      recta = 0;
      v101 = 1;
    }
    else
    {
      v101 = 0;
      recta = objc_msgSend(v162, "environment") == 2;
    }
  }
  objc_msgSend(v99, "leafAppLayoutForRole:", 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "itemForLayoutRole:", 1);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = -[SBMixedGridSwitcherModifier displayItemSupportsMedusa:](self, "displayItemSupportsMedusa:", v104);

  objc_msgSend(v163, "itemForLayoutRole:", 1);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = -[SBMixedGridSwitcherModifier displayItemSupportsMedusa:](self, "displayItemSupportsMedusa:", v106);

  if ((v98 & 1) != 0)
  {
    v102 = 1;
LABEL_73:
    v108 = v159;
    v109 = v160;
    goto LABEL_81;
  }
  v110 = v101 | v107 ^ 1 | v105 ^ 1;
  if (v110)
    v102 = 7;
  else
    v102 = 6;
  v108 = v159;
  v109 = v160;
  if (((v110 | recta) & 1) == 0)
  {
    if (v156 == 1)
      v102 = 4;
    else
      v102 = 5;
  }
LABEL_81:
  v111 = (objc_msgSend(v108, "isSplitConfiguration") & 1) == 0 && objc_msgSend(v108, "environment") != 2;
  v112 = v162;
  if (v102 == 2 && !v111)
  {
    -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "indexOfObject:", v108);

    if (v10 >= v10 + v12)
    {
      v102 = 3;
    }
    else
    {
      v114 = 9.22337204e18;
      v102 = 3;
      do
      {
        -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "objectAtIndex:", v10);
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v116, "environment") == 1)
        {
          -[SBSwitcherModifier scaledFrameForIndex:](self, "scaledFrameForIndex:", v10);
          v118 = v117;
          v120 = v119;
          v122 = v121;
          v124 = v123;
          UIRectGetCenter();
          v127 = hypot(x - v125, y - v126);
          if (v127 < v114)
          {
            v128 = v127;
            -[SBSwitcherDropRegionContext setTargetRect:](v109, "setTargetRect:", v118, v120, v122, v124);
            -[SBSwitcherDropRegionContext setClosestVisibleAppLayout:](v109, "setClosestVisibleAppLayout:", v116);
            v114 = v128;
          }
        }

        ++v10;
        --v12;
      }
      while (v12);
      v112 = v162;
    }
  }
  -[SBSwitcherDropRegionContext setCurrentDropRegion:](v109, "setCurrentDropRegion:", v102);
  if (objc_msgSend(v108, "isSplitConfiguration")
    && SBSwitcherDropRegionWarrantsModelUpdate(v102))
  {
    if (v146 == 1)
      v129 = 2;
    else
      v129 = 1;
    objc_msgSend(v108, "leafAppLayoutForRole:", v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherDropRegionContext setRemainingAppLayout:](v109, "setRemainingAppLayout:", v130);

  }
  v131 = objc_msgSend(v112, "isSplitConfiguration");
  if (v102 == 3 || v131)
  {
    if ((v102 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      objc_msgSend(v112, "leafAppLayoutForRole:", v147);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherDropRegionContext setEvictedAppLayout:](v109, "setEvictedAppLayout:", v132);

    }
    else if (v102 == 3)
    {
      -[SBSwitcherDropRegionContext setEvictedAppLayout:](v109, "setEvictedAppLayout:", v163);
    }
  }

  return v109;
}

- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3 lastVisibleIndex:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  _BOOL4 v13;
  _BOOL4 v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  if ((-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled", a3.x, a3.y) & 1) != 0)
  {
    -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 > a4 && -[SBMixedGridSwitcherModifier isIndexVisible:](self, "isIndexVisible:", a4))
    {
      v8 = v7 - 1;
      v9 = a4;
      do
      {
        v10 = v9;
        if (v8 == v9)
          break;
        ++v9;
      }
      while (-[SBMixedGridSwitcherModifier isIndexVisible:](self, "isIndexVisible:", v10 + 1));
    }
    else
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if ((a4 & 0x8000000000000000) != 0
         || !-[SBMixedGridSwitcherModifier isIndexVisible:](self, "isIndexVisible:", a4))
  {
    v10 = a4;
    a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v11 = a4;
    while (v11-- >= 1)
    {
      if (!-[SBMixedGridSwitcherModifier isIndexVisible:](self, "isIndexVisible:", v11))
      {
        v10 = a4;
        a4 = v11 + 1;
        goto LABEL_16;
      }
    }
    v10 = a4;
    a4 = 0;
  }
LABEL_16:
  v13 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  v14 = v10 != 0x7FFFFFFFFFFFFFFFLL;
  if (v14 && v13)
    v15 = a4;
  else
    v15 = 0;
  if (v14 && v13)
    v16 = v10 - a4 + 1;
  else
    v16 = 0;
  result.length = v16;
  result.location = v15;
  return result;
}

- (unint64_t)_numberOfOffScreenTrailingFullScreenCardsForContentOffset:(CGPoint)a3
{
  double x;
  unint64_t v5;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double width;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t result;

  x = a3.x;
  v5 = -[SBMixedGridSwitcherModifier _numberOfFullScreenAppLayouts](self, "_numberOfFullScreenAppLayouts", a3.x, a3.y);
  if (!v5)
    return 0;
  v6 = v5;
  -[SBMixedGridSwitcherModifier _fittedFullScreenContentSize](self, "_fittedFullScreenContentSize");
  v8 = v7;
  -[SBMixedGridSwitcherModifier _minimumFullScreenContentSize](self, "_minimumFullScreenContentSize");
  v10 = v9 - v8;
  v11 = v8 > v9;
  v12 = 0.0;
  if (!v11)
    v12 = v10;
  v13 = x - v12;
  width = self->_fullScreenCardSize.width;
  -[SBMixedGridSwitcherModifier _fullScreenCardScale](self, "_fullScreenCardScale");
  v16 = width * v15;
  -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v18 = v13 / (v16 + v17);
  v19 = BSFloatLessThanOrEqualToFloat();
  v20 = vcvtmd_u64_f64(v18);
  if (v19)
    v21 = 0;
  else
    v21 = v20;
  v22 = -[SBMixedGridSwitcherModifier _numberOfFullScreenColumns](self, "_numberOfFullScreenColumns");
  if (v21 >= v22)
    v21 = v22;
  if (!-[SBMixedGridSwitcherModifier _isDoubleStackingFullScreenCards](self, "_isDoubleStackingFullScreenCards")
    || !v21)
  {
    return v21;
  }
  v23 = 2 * v21;
  if (!-[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    return v23 - (v6 & 1);
  result = -[SBMixedGridSwitcherModifier _numberOfFullScreenAppLayouts](self, "_numberOfFullScreenAppLayouts");
  if (v23 < result)
    return v23;
  return result;
}

- (unint64_t)_numberOfOffScreenTrailingFloatingCardsForContentOffset:(CGPoint)a3
{
  double x;
  unint64_t result;
  double v6;
  double v7;
  double width;
  double v9;
  double v10;
  int v11;
  unint64_t v12;
  unint64_t v13;

  x = a3.x;
  result = -[SBMixedGridSwitcherModifier numberOfFloatingAppLayouts](self, "numberOfFloatingAppLayouts", a3.x, a3.y);
  if (result)
  {
    -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
    v7 = v6;
    width = self->_floatingCardSize.width;
    -[SBMixedGridSwitcherModifier _floatingCardScale](self, "_floatingCardScale");
    v10 = x / (v7 + width * v9);
    v11 = BSFloatLessThanOrEqualToFloat();
    v12 = vcvtmd_u64_f64(v10);
    if (v11)
      v13 = 0;
    else
      v13 = v12;
    result = -[SBMixedGridSwitcherModifier _numberOfFloatingColumns](self, "_numberOfFloatingColumns");
    if (v13 < result)
      return v13;
  }
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  double result;

  -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  -[SBSwitcherModifier distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:](self, "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:", a3, 1, 0);
  return result;
}

- (unint64_t)slideOverTongueDirection
{
  if (SBFloatingConfigurationIsLeft(self->_floatingConfiguration))
    return 2;
  else
    return 1;
}

- (id)topMostLayoutElements
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "environment", (_QWORD)v11) == 2)
          objc_msgSend(v3, "insertObject:atIndex:", v9, 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (double)_verticalSpacing
{
  void *v3;
  double v4;
  double v5;

  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(-[SBMixedGridSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation")- 1) > 1)objc_msgSend(v3, "gridSwitcherVerticalNaturalSpacingLandscape");
  else
    objc_msgSend(v3, "gridSwitcherVerticalNaturalSpacingPortrait");
  -[SBMixedGridSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  v5 = v4;

  return v5;
}

- (double)_horizontalSpacing
{
  void *v3;
  double v4;
  double v5;

  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(-[SBMixedGridSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation")- 1) > 1)objc_msgSend(v3, "gridSwitcherHorizontalInterpageSpacingLandscape");
  else
    objc_msgSend(v3, "gridSwitcherHorizontalInterpageSpacingPortrait");
  -[SBMixedGridSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  v5 = v4;

  return v5;
}

- (unint64_t)_numberOfFullScreenAppLayouts
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = v4 - -[SBMixedGridSwitcherModifier numberOfFloatingAppLayouts](self, "numberOfFloatingAppLayouts");

  return v5;
}

- (unint64_t)_numberOfFullScreenRows
{
  if (-[SBMixedGridSwitcherModifier _isDoubleStackingFullScreenCards](self, "_isDoubleStackingFullScreenCards"))
    return 2;
  else
    return 1;
}

- (unint64_t)_numberOfFullScreenColumns
{
  unint64_t v3;
  _BOOL4 v4;
  double v5;
  double v6;

  v3 = -[SBMixedGridSwitcherModifier _numberOfFullScreenAppLayouts](self, "_numberOfFullScreenAppLayouts");
  v4 = -[SBMixedGridSwitcherModifier _isDoubleStackingFullScreenCards](self, "_isDoubleStackingFullScreenCards");
  v5 = (double)v3;
  v6 = ceil((double)v3 * 0.5);
  if (v4)
    return (unint64_t)v6;
  return (unint64_t)v5;
}

- (double)_cachedFullScreenCardScale
{
  double v3;

  -[SBMixedGridSwitcherModifier _invalidateCachesIfNeeded](self, "_invalidateCachesIfNeeded");
  if ((*(_BYTE *)&self->_cachesValidity & 2) == 0)
  {
    -[SBMixedGridSwitcherModifier _fullScreenCardScale](self, "_fullScreenCardScale");
    self->_cachedFullScreenCardScale = v3;
    *(_BYTE *)&self->_cachesValidity |= 2u;
  }
  return self->_cachedFullScreenCardScale;
}

- (double)_fullScreenCardScale
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double Width;
  CGRect v9;

  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBMixedGridSwitcherModifier _isDoubleStackingFullScreenCards](self, "_isDoubleStackingFullScreenCards"))
    objc_msgSend(v3, "appExposeNonFloatingDoubleRowScale");
  else
    objc_msgSend(v3, "appExposeNonFloatingSingleRowScale");
  v5 = v4;
  if (-[SBMixedGridSwitcherModifier disableFullScreenCardScaleRounding](self, "disableFullScreenCardScaleRounding"))
  {
    v6 = v5;
  }
  else
  {
    -[SBMixedGridSwitcherModifier containerViewBounds](self, "containerViewBounds");
    Width = CGRectGetWidth(v9);
    v6 = 0.0;
    if ((BSFloatIsZero() & 1) == 0)
      v6 = round(v5 * Width) / Width;
  }

  return v6;
}

- (double)_floatingCardScale
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBMixedGridSwitcherModifier _isDoubleStackingFullScreenCards](self, "_isDoubleStackingFullScreenCards"))
  {
    objc_msgSend(v3, "appExposeFloatingDoubleRowScale");
    v5 = v4;
  }
  else
  {
    -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    v7 = v6;
    objc_msgSend(v3, "appExposeNonFloatingSingleRowScale");
    v5 = v8 * v7 / self->_floatingCardSize.height;
  }

  return v5;
}

- (CGSize)_scaledCardSizeForIndex:(unint64_t)a3
{
  _BOOL4 v4;
  int *v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = -[SBMixedGridSwitcherModifier _isIndexFullScreen:](self, "_isIndexFullScreen:", a3);
  v5 = &OBJC_IVAR___SBMixedGridSwitcherModifier__floatingCardSize;
  if (v4)
    v5 = &OBJC_IVAR___SBMixedGridSwitcherModifier__fullScreenCardSize;
  v6 = (double *)((char *)self + *v5);
  v8 = *v6;
  v7 = v6[1];
  if (v4)
    -[SBMixedGridSwitcherModifier _fullScreenCardScale](self, "_fullScreenCardScale");
  else
    -[SBMixedGridSwitcherModifier _floatingCardScale](self, "_floatingCardScale");
  v10 = v7 * v9;
  v11 = v8 * v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (BOOL)_isDoubleStackingFullScreenCards
{
  unint64_t v3;

  if (!-[SBMixedGridSwitcherModifier _numberOfFullScreenAppLayouts](self, "_numberOfFullScreenAppLayouts"))
    return 1;
  v3 = -[SBMixedGridSwitcherModifier _numberOfFullScreenAppLayouts](self, "_numberOfFullScreenAppLayouts");
  return v3 > -[SBMixedGridSwitcherModifier maximumNumberOfFullScreenCardsForSingleRow](self, "maximumNumberOfFullScreenCardsForSingleRow");
}

- (CGRect)_frameForIndex:(unint64_t)a3 applyScrollViewContentOffset:(BOOL)a4
{
  _BOOL4 v4;
  int *v7;
  unint64_t v8;
  NSMutableDictionary *cachedFrameForIndex;
  void *v10;
  void *v11;
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
  void *v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  double v26;
  double v27;
  unint64_t v28;
  _BOOL8 v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  int v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  int v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGRect result;

  v4 = a4;
  -[SBMixedGridSwitcherModifier _invalidateCachesIfNeeded](self, "_invalidateCachesIfNeeded");
  v7 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
  v8 = 0x1E0CB3000uLL;
  if ((*(_BYTE *)&self->_cachesValidity & 8) != 0)
  {
    cachedFrameForIndex = self->_cachedFrameForIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](cachedFrameForIndex, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "CGRectValue");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;

      if (!v4)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  v21 = v20;
  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SBMixedGridSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v22);

  if (-[SBMixedGridSwitcherModifier _isIndexFullScreen:](self, "_isIndexFullScreen:", a3))
  {
    v24 = -[SBMixedGridSwitcherModifier numberOfFloatingAppLayouts](self, "numberOfFloatingAppLayouts");
    v25 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    -[SBMixedGridSwitcherModifier _contentSize](self, "_contentSize");
    v27 = v26;
    v28 = -[SBMixedGridSwitcherModifier _subtreeIndexForIndex:indexOfFirstMainAppLayout:](self, "_subtreeIndexForIndex:indexOfFirstMainAppLayout:", a3, v23);
    v29 = -[SBMixedGridSwitcherModifier _isDoubleStackingFullScreenCards](self, "_isDoubleStackingFullScreenCards");
    v30 = -[SBMixedGridSwitcherModifier _numberOfFullScreenAppLayouts](self, "_numberOfFullScreenAppLayouts");
    -[SBMixedGridSwitcherModifier _fullScreenCardScale](self, "_fullScreenCardScale");
    -[SBMixedGridSwitcherModifier _unpaddedCoplanarFrameForIndex:doubleStack:count:cardSize:scale:contentWidth:](self, "_unpaddedCoplanarFrameForIndex:doubleStack:count:cardSize:scale:contentWidth:", v28, v29, v30, self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, v31, v27);
    v33 = v32;
    v15 = v34;
    v17 = v35;
    v19 = v36;
    v37 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v38 = -v21;
    if (v37)
      v38 = v21;
    v13 = v33 + v38;
    if (v24)
    {
      -[SBMixedGridSwitcherModifier _fittedFloatingContentSize](self, "_fittedFloatingContentSize");
      v40 = v21 + v39;
      v41 = v13 + v40;
      v42 = v13 - v40;
      if ((v25 & 1) != 0)
        v13 = v41;
      else
        v13 = v42;
    }
    v8 = 0x1E0CB3000;
    v7 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
  }
  else
  {
    -[SBMixedGridSwitcherModifier _contentSize](self, "_contentSize");
    v44 = v43;
    v45 = -[SBMixedGridSwitcherModifier _subtreeIndexForIndex:indexOfFirstMainAppLayout:](self, "_subtreeIndexForIndex:indexOfFirstMainAppLayout:", a3, v23);
    v46 = -[SBMixedGridSwitcherModifier numberOfFloatingAppLayouts](self, "numberOfFloatingAppLayouts");
    -[SBMixedGridSwitcherModifier unadjustedScaleForIndex:](self, "unadjustedScaleForIndex:", a3);
    -[SBMixedGridSwitcherModifier _unpaddedCoplanarFrameForIndex:doubleStack:count:cardSize:scale:contentWidth:](self, "_unpaddedCoplanarFrameForIndex:doubleStack:count:cardSize:scale:contentWidth:", v45, 0, v46, self->_floatingCardSize.width, self->_floatingCardSize.height, v47, v44);
    v49 = v48;
    v15 = v50;
    v17 = v51;
    v19 = v52;
    v53 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v54 = -v21;
    if (v53)
      v54 = v21;
    v13 = v49 + v54;
  }
  if (self->_lowDensityGridLayoutAlignment == 1)
  {
    -[SBMixedGridSwitcherModifier _contentSize](self, "_contentSize");
    v56 = v55;
    -[SBMixedGridSwitcherModifier _fittedContentSize](self, "_fittedContentSize");
    v58 = v57 + v21 * 2.0;
    if (BSFloatLessThanOrEqualToFloat())
    {
      v59 = -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
      v60 = -0.5;
      if (v59)
        v60 = 0.5;
      v13 = v13 + (v56 - v58) * v60;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v13, v15, v17, v19);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = *(Class *)((char *)&self->super.super.super.isa + v7[217]);
  objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInteger:", a3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, v63);

  *(_BYTE *)&self->_cachesValidity |= 8u;
  if (v4)
  {
LABEL_22:
    -[SBMixedGridSwitcherModifier scrollViewContentOffset](self, "scrollViewContentOffset");
    v13 = v13 - v64;
  }
LABEL_23:
  v65 = v13;
  v66 = v15;
  v67 = v17;
  v68 = v19;
  result.size.height = v68;
  result.size.width = v67;
  result.origin.y = v66;
  result.origin.x = v65;
  return result;
}

- (CGRect)_unpaddedCoplanarFrameForIndex:(unint64_t)a3 doubleStack:(BOOL)a4 count:(unint64_t)a5 cardSize:(CGSize)a6 scale:(double)a7 contentWidth:(double)a8
{
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[SBMixedGridSwitcherModifier switcherViewBounds](self, "switcherViewBounds", a3, a4, a5);
  -[SBMixedGridSwitcherModifier _horizontalSpacing](self, "_horizontalSpacing");
  -[SBMixedGridSwitcherModifier _verticalSpacing](self, "_verticalSpacing");
  -[SBMixedGridSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  -[SBMixedGridSwitcherModifier _cardHeaderHeight](self, "_cardHeaderHeight");
  -[SBMixedGridSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  -[SBMixedGridSwitcherModifier _verticalSpacing](self, "_verticalSpacing");
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)_cardHeaderHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[SBMixedGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spacingBetweenSnapshotAndIcon");
  v4 = v3;
  objc_msgSend(v2, "iconSideLength");
  v6 = v4 + v5;

  return v6;
}

- (BOOL)_isIndexFullScreen:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[SBMixedGridSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMixedGridSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self, "indexOfFirstMainAppLayoutFromAppLayouts:", v5);

  return v6 != 0x7FFFFFFFFFFFFFFFLL && v6 <= a3;
}

- (unint64_t)_subtreeIndexForIndex:(unint64_t)a3 indexOfFirstMainAppLayout:(unint64_t)a4
{
  unint64_t v5;
  unint64_t v6;

  if (a3 < a4 || a3 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = a4;
  v6 = a3 - v5;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  else
    return v6;
}

- (void)_invalidateCachesIfNeeded
{
  id v3;
  int64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBMixedGridSwitcherModifier;
  v3 = -[SBMixedGridSwitcherModifier appLayoutsGenerationCount](&v5, sel_appLayoutsGenerationCount);
  v4 = -[SBMixedGridSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  if ((id)self->_lastAppLayoutsGenerationCount != v3 || self->_lastInterfaceOrientation == v4)
  {
    self->_lastAppLayoutsGenerationCount = (unint64_t)v3;
    self->_lastInterfaceOrientation = v4;
    *(_BYTE *)&self->_cachesValidity &= 0xF0u;
    -[NSMutableDictionary removeAllObjects](self->_cachedFrameForIndex, "removeAllObjects");
  }
}

- (BOOL)reversesFloatingCardDirection
{
  return self->_reversesFloatingCardDirection;
}

- (void)setReversesFloatingCardDirection:(BOOL)a3
{
  self->_reversesFloatingCardDirection = a3;
}

- (CGSize)fullScreenCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fullScreenCardSize.width;
  height = self->_fullScreenCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)floatingCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_floatingCardSize.width;
  height = self->_floatingCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)lowDensityGridLayoutAlignment
{
  return self->_lowDensityGridLayoutAlignment;
}

- (void)setLowDensityGridLayoutAlignment:(unint64_t)a3
{
  self->_lowDensityGridLayoutAlignment = a3;
}

- (unint64_t)maximumNumberOfFullScreenCardsForSingleRow
{
  return self->_maximumNumberOfFullScreenCardsForSingleRow;
}

- (void)setMaximumNumberOfFullScreenCardsForSingleRow:(unint64_t)a3
{
  self->_maximumNumberOfFullScreenCardsForSingleRow = a3;
}

- (BOOL)disableFullScreenCardScaleRounding
{
  return self->_disableFullScreenCardScaleRounding;
}

- (void)setDisableFullScreenCardScaleRounding:(BOOL)a3
{
  self->_disableFullScreenCardScaleRounding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFrameForIndex, 0);
  objc_storeStrong((id *)&self->_gridModifier, 0);
}

@end
