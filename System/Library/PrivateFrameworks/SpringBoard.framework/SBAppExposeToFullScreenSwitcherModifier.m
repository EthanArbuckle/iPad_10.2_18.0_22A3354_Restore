@implementation SBAppExposeToFullScreenSwitcherModifier

- (SBAppExposeToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 floatingAppLayout:(id)a6 bundleIdentifier:(id)a7 appExposeModifier:(id)a8 fullScreenModifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  SBAppExposeToFullScreenSwitcherModifier *v19;
  uint64_t v20;
  NSString *bundleIdentifier;
  SBRouteToAppExposeSwitcherModifier *v22;
  id v23;
  uint64_t v24;
  SBRouteToAppExposeSwitcherModifier *routeToAppExposeModifier;
  void *v26;
  void *v27;
  SBAppLayout *floatingAppLayout;
  SBGridToActiveAppLayoutsSwitcherModifier *v29;
  id v30;
  SBGridToActiveAppLayoutsSwitcherModifier *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  objc_super v40;

  v15 = a3;
  v16 = a5;
  v38 = a6;
  v17 = a7;
  v39 = a8;
  v18 = a9;
  v40.receiver = self;
  v40.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  v19 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v40, sel_initWithTransitionID_, v15);
  if (!v19)
    goto LABEL_9;
  v37 = v17;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBAppExposeToFullScreenSwitcherModifier.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullScreenAppLayout"));

  }
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBAppExposeToFullScreenSwitcherModifier.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appExposeModifier"));

    if (v18)
      goto LABEL_6;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBAppExposeToFullScreenSwitcherModifier.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullScreenModifier"));

    goto LABEL_6;
  }
  if (!v18)
    goto LABEL_11;
LABEL_6:
  v19->_direction = a4;
  objc_storeStrong((id *)&v19->_fullScreenAppLayout, a5);
  objc_storeStrong((id *)&v19->_floatingAppLayout, a6);
  v20 = objc_msgSend(v37, "copy");
  bundleIdentifier = v19->_bundleIdentifier;
  v19->_bundleIdentifier = (NSString *)v20;

  objc_storeStrong((id *)&v19->_appExposeModifier, a8);
  objc_storeStrong((id *)&v19->_fullscreenModifier, a9);
  v22 = [SBRouteToAppExposeSwitcherModifier alloc];
  v23 = -[SBAppExposeToFullScreenSwitcherModifier _newAppExposeModifier](v19, "_newAppExposeModifier");
  v24 = -[SBRouteToAppExposeSwitcherModifier initWithTransitionID:appExposeModifier:](v22, "initWithTransitionID:appExposeModifier:", v15, v23);
  routeToAppExposeModifier = v19->_routeToAppExposeModifier;
  v19->_routeToAppExposeModifier = (SBRouteToAppExposeSwitcherModifier *)v24;

  -[SBChainableModifier addChildModifier:atLevel:key:](v19, "addChildModifier:atLevel:key:", v19->_routeToAppExposeModifier, 0, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v19->_fullScreenAppLayout, 0);
  v27 = v26;
  floatingAppLayout = v19->_floatingAppLayout;
  if (floatingAppLayout)
    objc_msgSend(v26, "insertObject:atIndex:", floatingAppLayout, 0);
  v29 = [SBGridToActiveAppLayoutsSwitcherModifier alloc];
  v30 = -[SBAppExposeToFullScreenSwitcherModifier _newAppExposeModifier](v19, "_newAppExposeModifier");
  v31 = -[SBGridToActiveAppLayoutsSwitcherModifier initWithTransitionID:direction:activeAppLayouts:gridModifier:](v29, "initWithTransitionID:direction:activeAppLayouts:gridModifier:", v15, a4, v27, v30);

  -[SBChainableModifier addChildModifier:atLevel:key:](v19, "addChildModifier:atLevel:key:", v31, 1, 0);
  v17 = v37;
LABEL_9:

  return v19;
}

- (id)transitionWillBegin
{
  void *v3;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v4;
  void *v5;
  NSArray *v6;
  NSArray *appLayoutsBeforeTransition;
  void *v8;
  void *v9;
  SBAppLayout *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SBAppLayout *v16;
  void *v17;
  SBScrollToAppLayoutSwitcherEventResponse *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v25, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppExposeToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  appLayoutsBeforeTransition = self->_appLayoutsBeforeTransition;
  self->_appLayoutsBeforeTransition = v6;

  if (self->_direction == 1)
  {
    -[SBAppExposeToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppExposeToFullScreenSwitcherModifier adjustedAppLayoutsForAppLayouts:](self, "adjustedAppLayoutsForAppLayouts:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = self->_fullScreenAppLayout;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        v15 = 0;
        v16 = v10;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
          if (objc_msgSend(v17, "environment", (_QWORD)v21) == 1)
          {
            v10 = v16;
            goto LABEL_12;
          }
          v10 = v17;

          ++v15;
          v16 = v10;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_12:

    if (v10)
    {
      v18 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v10, 0, 0);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v18, v5);
      v19 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v19;
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
  v7.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
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

- (id)appLayouts
{
  objc_super v3;

  if (self->_isSimulatingPreTransitionState)
    return self->_appLayoutsBeforeTransition;
  v3.receiver = self;
  v3.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  -[SBAppExposeToFullScreenSwitcherModifier appLayouts](&v3, sel_appLayouts);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  SBRouteToAppExposeSwitcherModifier *routeToAppExposeModifier;
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  objc_super v10;

  routeToAppExposeModifier = self->_routeToAppExposeModifier;
  v5 = a3;
  v6 = -[SBRouteToAppExposeSwitcherModifier reversesFloatingCardDirection](routeToAppExposeModifier, "reversesFloatingCardDirection");
  -[SBRouteToAppExposeSwitcherModifier setReversesFloatingCardDirection:](self->_routeToAppExposeModifier, "setReversesFloatingCardDirection:", self->_direction == 1);
  v10.receiver = self;
  v10.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v10, sel_adjustedAppLayoutsForAppLayouts_, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBRouteToAppExposeSwitcherModifier setReversesFloatingCardDirection:](self->_routeToAppExposeModifier, "setReversesFloatingCardDirection:", v6);
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
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SBSwitcherModifier *fullscreenModifier;
  NSUInteger v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  objc_super v27;
  objc_super v28;
  _QWORD v29[7];
  _QWORD v30[7];
  uint64_t v31;
  double *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  CGRect result;

  if (!self->_direction)
  {
    -[SBAppExposeToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v15, "containsItemWithBundleIdentifier:", self->_bundleIdentifier) & 1) != 0)
    {
      if (-[SBAppExposeToFullScreenSwitcherModifier _isIndexActive:](self, "_isIndexActive:", a3))
      {
        v28.receiver = self;
        v28.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
        -[SBAppExposeToFullScreenSwitcherModifier frameForIndex:](&v28, sel_frameForIndex_, a3);
        v6 = v16;
        v8 = v17;
        v10 = v18;
        v12 = v19;
LABEL_11:

        goto LABEL_12;
      }
      v31 = 0;
      v32 = (double *)&v31;
      v33 = 0x4010000000;
      v34 = &unk_1D0FA064E;
      v35 = 0u;
      v36 = 0u;
      v21 = -[NSArray indexOfObject:](self->_appLayoutsBeforeTransition, "indexOfObject:", v15);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppExposeToFullScreenSwitcherModifier.m"), 160, CFSTR("preTransitionIndex should be valid for an app layout whose bundle identifier matches what we're showing in app expose"));

      }
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __57__SBAppExposeToFullScreenSwitcherModifier_frameForIndex___block_invoke_2;
      v29[3] = &unk_1E8E9FD08;
      v29[5] = &v31;
      v29[6] = v21;
      v29[4] = self;
      -[SBAppExposeToFullScreenSwitcherModifier _performBlockBySimulatingPreTransitionState:](self, "_performBlockBySimulatingPreTransitionState:", v29);
    }
    else
    {
      v31 = 0;
      v32 = (double *)&v31;
      v33 = 0x4010000000;
      v34 = &unk_1D0FA064E;
      v35 = 0u;
      v36 = 0u;
      fullscreenModifier = self->_fullscreenModifier;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __57__SBAppExposeToFullScreenSwitcherModifier_frameForIndex___block_invoke;
      v30[3] = &unk_1E8E9FD08;
      v30[4] = self;
      v30[5] = &v31;
      v30[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fullscreenModifier, v30);
    }
    v6 = v32[4];
    v8 = v32[5];
    v10 = v32[6];
    v12 = v32[7];
    _Block_object_dispose(&v31, 8);
    goto LABEL_11;
  }
  v27.receiver = self;
  v27.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  -[SBAppExposeToFullScreenSwitcherModifier frameForIndex:](&v27, sel_frameForIndex_, a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
LABEL_12:
  v22 = v6;
  v23 = v8;
  v24 = v10;
  v25 = v12;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

uint64_t __57__SBAppExposeToFullScreenSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 176), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

id __57__SBAppExposeToFullScreenSwitcherModifier_frameForIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v2 = *(_QWORD *)(a1 + 48);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  result = objc_msgSendSuper2(&v9, sel_frameForIndex_, v2);
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v8;
  void *v9;
  double v10;
  SBSwitcherModifier *fullscreenModifier;
  NSUInteger v12;
  void *v14;
  objc_super v15;
  objc_super v16;
  _QWORD v17[7];
  _QWORD v18[7];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  if (!self->_direction)
  {
    -[SBAppExposeToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "containsItemWithBundleIdentifier:", self->_bundleIdentifier) & 1) != 0)
    {
      if (-[SBAppExposeToFullScreenSwitcherModifier _isIndexActive:](self, "_isIndexActive:", a3))
      {
        v16.receiver = self;
        v16.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
        -[SBAppExposeToFullScreenSwitcherModifier scaleForIndex:](&v16, sel_scaleForIndex_, a3);
        v6 = v10;
LABEL_11:

        return v6;
      }
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x2020000000;
      v22 = 0;
      v12 = -[NSArray indexOfObject:](self->_appLayoutsBeforeTransition, "indexOfObject:", v9);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppExposeToFullScreenSwitcherModifier.m"), 186, CFSTR("preTransitionIndex should be valid for an app layout whose bundle identifier matches what we're showing in app expose"));

      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __57__SBAppExposeToFullScreenSwitcherModifier_scaleForIndex___block_invoke_2;
      v17[3] = &unk_1E8E9FD08;
      v17[5] = &v19;
      v17[6] = v12;
      v17[4] = self;
      -[SBAppExposeToFullScreenSwitcherModifier _performBlockBySimulatingPreTransitionState:](self, "_performBlockBySimulatingPreTransitionState:", v17);
    }
    else
    {
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x2020000000;
      v22 = 0;
      fullscreenModifier = self->_fullscreenModifier;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57__SBAppExposeToFullScreenSwitcherModifier_scaleForIndex___block_invoke;
      v18[3] = &unk_1E8E9FD08;
      v18[4] = self;
      v18[5] = &v19;
      v18[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", fullscreenModifier, v18);
    }
    v6 = v20[3];
    _Block_object_dispose(&v19, 8);
    goto LABEL_11;
  }
  v15.receiver = self;
  v15.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  -[SBAppExposeToFullScreenSwitcherModifier scaleForIndex:](&v15, sel_scaleForIndex_, a3);
  return v5;
}

uint64_t __57__SBAppExposeToFullScreenSwitcherModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 176), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

id __57__SBAppExposeToFullScreenSwitcherModifier_scaleForIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  objc_super v5;

  v2 = *(_QWORD *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  result = objc_msgSendSuper2(&v5, sel_scaleForIndex_, v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  NSUInteger v15;
  void *v17;
  objc_super v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  SBAppExposeToFullScreenSwitcherModifier *v22;
  uint64_t *v23;
  int64_t v24;
  NSUInteger v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  v9 = a4;
  if (self->_direction)
  {
    v18.receiver = self;
    v18.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
    -[SBAppExposeToFullScreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v18, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v9, a5);
    v11 = v10;
  }
  else
  {
    -[SBAppExposeToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "containsItemWithBundleIdentifier:", self->_bundleIdentifier) & 1) != 0)
    {
      if (-[SBAppExposeToFullScreenSwitcherModifier _isIndexActive:](self, "_isIndexActive:", a5))
      {
        v19.receiver = self;
        v19.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
        -[SBAppExposeToFullScreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v19, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v13, a5);
        v11 = v14;
      }
      else
      {
        v26 = 0;
        v27 = (double *)&v26;
        v28 = 0x2020000000;
        v29 = 0;
        v15 = -[NSArray indexOfObject:](self->_appLayoutsBeforeTransition, "indexOfObject:", v13);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppExposeToFullScreenSwitcherModifier.m"), 208, CFSTR("preTransitionIndex should be valid for an app layout whose bundle identifier matches what we're showing in app expose"));

        }
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __84__SBAppExposeToFullScreenSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
        v20[3] = &unk_1E8E9FDA8;
        v23 = &v26;
        v24 = a3;
        v25 = v15;
        v21 = v13;
        v22 = self;
        -[SBAppExposeToFullScreenSwitcherModifier _performBlockBySimulatingPreTransitionState:](self, "_performBlockBySimulatingPreTransitionState:", v20);
        v11 = v27[3];

        _Block_object_dispose(&v26, 8);
      }
    }
    else if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
    {
      v11 = 0.0;
    }
    else
    {
      v11 = 1.0;
    }

  }
  return v11;
}

id __84__SBAppExposeToFullScreenSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  result = objc_msgSendSuper2(&v7, sel_opacityForLayoutRole_inAppLayout_atIndex_, v3, v2, v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
  return result;
}

- (double)plusButtonAlpha
{
  _BOOL4 v2;
  double result;

  v2 = -[SBAppExposeToFullScreenSwitcherModifier _isEffectivelyFullScreen](self, "_isEffectivelyFullScreen");
  result = 1.0;
  if (v2)
    return 0.0;
  return result;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  v7.receiver = self;
  v7.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  -[SBAppExposeToFullScreenSwitcherModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSet:", v4);

  objc_msgSend(v5, "addObject:", self->_fullScreenAppLayout);
  if (self->_floatingAppLayout)
    objc_msgSend(v5, "addObject:");
  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  SBAppExposeGridSwitcherModifier *appExposeModifier;
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
  appExposeModifier = self->_appExposeModifier;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__SBAppExposeToFullScreenSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
  v8[3] = &unk_1E8E9FD30;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appExposeModifier, v8);
  LOWORD(self) = *((_WORD *)v12 + 16);

  _Block_object_dispose(&v11, 8);
  return (SBSwitcherAsyncRenderingAttributes)self;
}

uint64_t __80__SBAppExposeToFullScreenSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 168), "asyncRenderingAttributesForAppLayout:", a1[5]);
  *(_WORD *)(*(_QWORD *)(a1[6] + 8) + 32) = result;
  return result;
}

- (id)_newAppExposeModifier
{
  return (id)-[SBAppExposeGridSwitcherModifier copy](self->_appExposeModifier, "copy");
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

  -[SBAppExposeToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
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

- (void)_performBlockBySimulatingPreTransitionState:(id)a3
{
  BOOL isSimulatingPreTransitionState;

  isSimulatingPreTransitionState = self->_isSimulatingPreTransitionState;
  self->_isSimulatingPreTransitionState = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_isSimulatingPreTransitionState = isSimulatingPreTransitionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutsBeforeTransition, 0);
  objc_storeStrong((id *)&self->_routeToAppExposeModifier, 0);
  objc_storeStrong((id *)&self->_fullscreenModifier, 0);
  objc_storeStrong((id *)&self->_appExposeModifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_floatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end
