@implementation SBMixedGridToFullScreenSwitcherModifier

- (SBMixedGridToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 floatingAppLayout:(id)a6 floatingConfiguration:(int64_t)a7 gridModifier:(id)a8 fullScreenModifier:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  SBMixedGridToFullScreenSwitcherModifier *v18;
  void *v19;
  void *v20;
  SBAppLayout *floatingAppLayout;
  SBGridToActiveAppLayoutsSwitcherModifier *v22;
  id v23;
  SBGridToActiveAppLayoutsSwitcherModifier *v24;
  SBRouteToMixedGridSwitcherModifier *v25;
  id v26;
  uint64_t v27;
  SBRouteToMixedGridSwitcherModifier *routeToMixedGridModifier;
  SBRelocateFloatingAppLayoutSwitcherModifier *v29;
  uint64_t v30;
  id v31;
  SBRelocateFloatingAppLayoutSwitcherModifier *v32;
  void *v34;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v41;
  objc_super v42;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v41 = a9;
  v42.receiver = self;
  v42.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  v18 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v42, sel_initWithTransitionID_, v14);
  if (!v18)
    goto LABEL_14;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("SBMixedGridToFullScreenSwitcherModifier.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullScreenAppLayout"));

    if (v17)
      goto LABEL_4;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("SBMixedGridToFullScreenSwitcherModifier.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gridModifier"));

    goto LABEL_4;
  }
  if (!v17)
    goto LABEL_16;
LABEL_4:
  v36 = v17;
  v37 = v15;
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("SBMixedGridToFullScreenSwitcherModifier.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullScreenModifier"));

  }
  v18->_direction = a4;
  objc_storeStrong((id *)&v18->_fullScreenAppLayout, a5);
  objc_storeStrong((id *)&v18->_floatingAppLayout, a6);
  objc_storeStrong((id *)&v18->_mixedGridModifier, a8);
  objc_storeStrong((id *)&v18->_fullscreenModifier, a9);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v18->_fullScreenAppLayout, 0);
  v20 = v19;
  floatingAppLayout = v18->_floatingAppLayout;
  if (floatingAppLayout)
    objc_msgSend(v19, "insertObject:atIndex:", floatingAppLayout, 0);
  v22 = [SBGridToActiveAppLayoutsSwitcherModifier alloc];
  v23 = -[SBMixedGridToFullScreenSwitcherModifier _newMixedGridModifier](v18, "_newMixedGridModifier");
  v24 = -[SBGridToActiveAppLayoutsSwitcherModifier initWithTransitionID:direction:activeAppLayouts:gridModifier:](v22, "initWithTransitionID:direction:activeAppLayouts:gridModifier:", v14, a4, v20, v23);

  -[SBChainableModifier addChildModifier:](v18, "addChildModifier:", v24);
  v25 = [SBRouteToMixedGridSwitcherModifier alloc];
  v26 = -[SBMixedGridToFullScreenSwitcherModifier _newMixedGridModifier](v18, "_newMixedGridModifier");
  v27 = -[SBRouteToMixedGridSwitcherModifier initWithTransitionID:mixedGridModifier:](v25, "initWithTransitionID:mixedGridModifier:", v14, v26);
  routeToMixedGridModifier = v18->_routeToMixedGridModifier;
  v18->_routeToMixedGridModifier = (SBRouteToMixedGridSwitcherModifier *)v27;

  -[SBChainableModifier addChildModifier:](v18, "addChildModifier:", v18->_routeToMixedGridModifier);
  if (v16)
  {
    v29 = [SBRelocateFloatingAppLayoutSwitcherModifier alloc];
    if (a4)
      v30 = 1;
    else
      v30 = 2;
    v31 = -[SBMixedGridToFullScreenSwitcherModifier _newMixedGridModifier](v18, "_newMixedGridModifier");
    v32 = -[SBRelocateFloatingAppLayoutSwitcherModifier initWithTransitionID:floatingAppLayout:floatingConfiguration:direction:mixedGridModifier:](v29, "initWithTransitionID:floatingAppLayout:floatingConfiguration:direction:mixedGridModifier:", v14, v16, a7, v30, v31);

    -[SBChainableModifier addChildModifier:](v18, "addChildModifier:", v32);
  }

  v17 = v36;
  v15 = v37;
LABEL_14:

  return v18;
}

- (id)transitionWillBegin
{
  void *v3;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v4;
  void *v5;
  NSArray *v6;
  NSArray *appLayoutsBeforeTransition;
  void *v8;
  SBScrollToAppLayoutSwitcherEventResponse *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v12, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBMixedGridToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  appLayoutsBeforeTransition = self->_appLayoutsBeforeTransition;
  self->_appLayoutsBeforeTransition = v6;

  if (self->_direction == 1)
  {
    -[SBMixedGridToFullScreenSwitcherModifier _appLayoutToScrollTo](self, "_appLayoutToScrollTo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v8, 0, 0);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v5);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }

  }
  return v5;
}

- (id)transitionDidEnd
{
  void *v3;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v7, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_direction)
  {
    v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  SBRouteToMixedGridSwitcherModifier *routeToMixedGridModifier;
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  objc_super v10;

  routeToMixedGridModifier = self->_routeToMixedGridModifier;
  v5 = a3;
  v6 = -[SBRouteToMixedGridSwitcherModifier reversesFloatingCardDirection](routeToMixedGridModifier, "reversesFloatingCardDirection");
  -[SBRouteToMixedGridSwitcherModifier setReversesFloatingCardDirection:](self->_routeToMixedGridModifier, "setReversesFloatingCardDirection:", self->_direction == 1);
  v10.receiver = self;
  v10.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v10, sel_adjustedAppLayoutsForAppLayouts_, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBRouteToMixedGridSwitcherModifier setReversesFloatingCardDirection:](self->_routeToMixedGridModifier, "setReversesFloatingCardDirection:", v6);
  if (self->_direction)
    return v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
  if ((objc_msgSend(v9, "containsObject:", self->_fullScreenAppLayout) & 1) == 0)
    objc_msgSend(v9, "addObject:", self->_fullScreenAppLayout);
  if (self->_floatingAppLayout)
  {
    if ((objc_msgSend(v9, "containsObject:") & 1) == 0)
      objc_msgSend(v9, "insertObject:atIndex:", self->_floatingAppLayout, 0);
  }

  return v9;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  v7.receiver = self;
  v7.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  -[SBMixedGridToFullScreenSwitcherModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSet:", v4);

  objc_msgSend(v5, "addObject:", self->_fullScreenAppLayout);
  if (self->_floatingAppLayout)
    objc_msgSend(v5, "addObject:");
  return v5;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  if (self->_direction)
    return 0;
  else
    return self->_fullScreenAppLayout;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (id)topMostLayoutElements
{
  id v3;
  id v4;
  SBMixedGridSwitcherProviding *mixedGridModifier;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SBAppLayout *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_direction == 1)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32.receiver = self;
    v32.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
    -[SBMixedGridToFullScreenSwitcherModifier slideOverTongueLayoutElement](&v32, sel_slideOverTongueLayoutElement);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v3, "addObject:", v4);
    mixedGridModifier = self->_mixedGridModifier;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __64__SBMixedGridToFullScreenSwitcherModifier_topMostLayoutElements__block_invoke;
    v30[3] = &unk_1E8E9E820;
    v30[4] = self;
    v6 = v3;
    v31 = v6;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v30);
    v7 = v31;
    v8 = v6;

    v9 = v8;
    goto LABEL_32;
  }
  -[SBMixedGridToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMixedGridToFullScreenSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = v10;
  v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (!v13)
    goto LABEL_19;
  v14 = v13;
  v15 = *(_QWORD *)v27;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v27 != v15)
        objc_enumerationMutation(v4);
      v17 = *(SBAppLayout **)(*((_QWORD *)&v26 + 1) + 8 * v16);
      if (objc_msgSend(v8, "containsObject:", v17))
      {
        if (-[SBAppLayout environment](v17, "environment") == 2)
        {
          v18 = v11;
          if (v17 == self->_floatingAppLayout)
            goto LABEL_14;
LABEL_13:
          objc_msgSend(v18, "addObject:", v17);
          goto LABEL_14;
        }
        v19 = -[SBAppLayout isEqual:](v17, "isEqual:", self->_fullScreenAppLayout);
        v18 = v12;
        if (!v19)
          goto LABEL_13;
      }
LABEL_14:
      ++v16;
    }
    while (v14 != v16);
    v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    v14 = v20;
  }
  while (v20);
LABEL_19:

  v9 = (void *)objc_opt_new();
  v25.receiver = self;
  v25.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  -[SBMixedGridToFullScreenSwitcherModifier slideOverTongueLayoutElement](&v25, sel_slideOverTongueLayoutElement);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v9, "addObject:", v21);
  if (self->_floatingAppLayout)
    objc_msgSend(v9, "addObject:");
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v9, "addObjectsFromArray:", v11);
  v24.receiver = self;
  v24.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  -[SBMixedGridToFullScreenSwitcherModifier switcherDimmingViewLayoutElement](&v24, sel_switcherDimmingViewLayoutElement);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v9, "addObject:", v22);
  if (self->_fullScreenAppLayout)
    objc_msgSend(v9, "addObject:");
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v9, "addObjectsFromArray:", v12);

LABEL_32:
  return v9;
}

void __64__SBMixedGridToFullScreenSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "appLayouts");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "rangeOfVisibleAppLayouts");
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v6, "subarrayWithRange:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  SBMixedGridSwitcherProviding *mixedGridModifier;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  __int16 v15;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2810000000;
  v14 = &unk_1D0FA064E;
  v15 = 0;
  mixedGridModifier = self->_mixedGridModifier;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__SBMixedGridToFullScreenSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
  v8[3] = &unk_1E8E9FD30;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v8);
  LOWORD(self) = *((_WORD *)v12 + 16);

  _Block_object_dispose(&v11, 8);
  return (SBSwitcherAsyncRenderingAttributes)self;
}

uint64_t __80__SBMixedGridToFullScreenSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 160), "asyncRenderingAttributesForAppLayout:", a1[5]);
  *(_WORD *)(*(_QWORD *)(a1[6] + 8) + 32) = result;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
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
  SBAppLayout *floatingAppLayout;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;
  CGRect result;

  -[SBMixedGridToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  if (-[SBAppLayout environment](v6, "environment") != 2
    || self->_direction
    || (floatingAppLayout = self->_floatingAppLayout, v6 == floatingAppLayout))
  {
    -[SBMixedGridToFullScreenSwitcherModifier frameForIndex:](&v26, sel_frameForIndex_, a3, self, SBMixedGridToFullScreenSwitcherModifier);
LABEL_4:
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    goto LABEL_5;
  }
  if (floatingAppLayout)
  {
    v20 = objc_msgSend(v5, "indexOfObject:");
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v28.receiver = self;
      v28.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
      -[SBMixedGridToFullScreenSwitcherModifier frameForIndex:](&v28, sel_frameForIndex_, v20, v26.receiver, v26.super_class);
      goto LABEL_4;
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  -[SBMixedGridToFullScreenSwitcherModifier frameForIndex:](&v27, sel_frameForIndex_, a3);
  v12 = v22;
  v13 = v23;
  v14 = v24;
  if (self->_floatingAppLayout)
  {
    v11 = v21;
  }
  else if (-[SBMixedGridToFullScreenSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
  {
    v11 = -v13;
  }
  else
  {
    -[SBMixedGridToFullScreenSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    v11 = v25;
  }
LABEL_5:

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  SBMixedGridSwitcherProviding *mixedGridModifier;
  double v8;
  double v9;
  objc_super v11;
  _QWORD v12[7];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  -[SBMixedGridToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "environment") == 2 && self->_direction == 1)
  {
    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x2020000000;
    v16 = 0;
    mixedGridModifier = self->_mixedGridModifier;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__SBMixedGridToFullScreenSwitcherModifier_scaleForIndex___block_invoke;
    v12[3] = &unk_1E8E9FD08;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v12);
    v8 = v14[3];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
    -[SBMixedGridToFullScreenSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3);
    v8 = v9;
  }

  return v8;
}

uint64_t __57__SBMixedGridToFullScreenSwitcherModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 160), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (id)_newMixedGridModifier
{
  return (id)-[SBMixedGridSwitcherProviding copy](self->_mixedGridModifier, "copy");
}

- (BOOL)_isEffectivelyFullScreen
{
  BOOL v3;
  BOOL v4;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v3 = self->_direction == 1;
  else
    v3 = 0;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v4 = self->_direction == 0;
  else
    v4 = 0;
  return v3 || v4;
}

- (BOOL)_isIndexActive:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  SBAppLayout *floatingAppLayout;

  -[SBMixedGridToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_fullScreenAppLayout, "isEqual:", v6))
  {
    v7 = 1;
  }
  else
  {
    floatingAppLayout = self->_floatingAppLayout;
    if (floatingAppLayout)
      v7 = -[SBAppLayout isEqual:](floatingAppLayout, "isEqual:", v6);
    else
      v7 = 0;
  }

  return v7;
}

- (id)_appLayoutToScrollTo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SBAppLayout *v7;
  SBAppLayout *v8;
  SBMixedGridSwitcherProviding *mixedGridModifier;
  SBAppLayout *fullScreenAppLayout;
  SBAppLayout *v11;
  SBAppLayout *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  -[SBMixedGridToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMixedGridToFullScreenSwitcherModifier adjustedAppLayoutsForAppLayouts:](self, "adjustedAppLayoutsForAppLayouts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBMixedGridToFullScreenSwitcherModifier _firstFloatingAppLayout:](self, "_firstFloatingAppLayout:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (self->_fullScreenAppLayout)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    mixedGridModifier = self->_mixedGridModifier;
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__SBMixedGridToFullScreenSwitcherModifier__appLayoutToScrollTo__block_invoke;
    v14[3] = &unk_1E8EA4CE8;
    v14[4] = self;
    v15 = v4;
    v16 = &v17;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", mixedGridModifier, v14);
    fullScreenAppLayout = v8;
    if (*((_BYTE *)v18 + 24))
      fullScreenAppLayout = self->_fullScreenAppLayout;
    v11 = fullScreenAppLayout;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = v7;
  }
  v12 = v11;

  return v12;
}

void __63__SBMixedGridToFullScreenSwitcherModifier__appLayoutToScrollTo__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SBMixedGridToFullScreenSwitcherModifier__appLayoutToScrollTo__block_invoke_2;
  v5[3] = &unk_1E8EA4CE8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_performBlockWhileSimulatingPostPresentationScrollViewContentOffset:", v5);

}

uint64_t __63__SBMixedGridToFullScreenSwitcherModifier__appLayoutToScrollTo__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "isIndexFullyVisible:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144)));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_firstFloatingAppLayout:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (objc_msgSend(v10, "environment", (_QWORD)v12) == 1)
        {
          v6 = v9;
          goto LABEL_12;
        }
        v6 = v10;

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_12:

  return v6;
}

- (void)_performBlockWhileSimulatingPostPresentationScrollViewContentOffset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  SBOverrideScrollViewContentOffsetSwitcherModifier *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  -[SBMixedGridToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMixedGridToFullScreenSwitcherModifier adjustedAppLayoutsForAppLayouts:](self, "adjustedAppLayoutsForAppLayouts:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[SBMixedGridToFullScreenSwitcherModifier _firstFloatingAppLayout:](self, "_firstFloatingAppLayout:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v14, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[SBMixedGridToFullScreenSwitcherModifier contentOffsetForIndex:alignment:](self, "contentOffsetForIndex:alignment:", objc_msgSend(v14, "indexOfObject:", v8, v14), 3);
  v12 = -[SBOverrideScrollViewContentOffsetSwitcherModifier initWithScrollViewContentOffset:]([SBOverrideScrollViewContentOffsetSwitcherModifier alloc], "initWithScrollViewContentOffset:", v10, v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __111__SBMixedGridToFullScreenSwitcherModifier__performBlockWhileSimulatingPostPresentationScrollViewContentOffset___block_invoke;
  v16[3] = &unk_1E8E9E8D0;
  v17 = v4;
  v13 = v4;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v12, v16);

}

uint64_t __111__SBMixedGridToFullScreenSwitcherModifier__performBlockWhileSimulatingPostPresentationScrollViewContentOffset___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutsBeforeTransition, 0);
  objc_storeStrong((id *)&self->_routeToMixedGridModifier, 0);
  objc_storeStrong((id *)&self->_fullscreenModifier, 0);
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
  objc_storeStrong((id *)&self->_floatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end
