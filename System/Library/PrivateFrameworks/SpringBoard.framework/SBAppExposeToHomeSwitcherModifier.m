@implementation SBAppExposeToHomeSwitcherModifier

- (SBAppExposeToHomeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 bundleIdentifier:(id)a5 appExposeModifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBAppExposeToHomeSwitcherModifier *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  SBRouteToAppExposeSwitcherModifier *v17;
  id v18;
  SBRouteToAppExposeSwitcherModifier *v19;
  SBHomeToGridSwitcherModifier *v20;
  id v21;
  SBHomeToGridSwitcherModifier *v22;
  void *v24;
  objc_super v25;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SBAppExposeToHomeSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v25, sel_initWithTransitionID_, v11);
  if (v14)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBAppExposeToHomeSwitcherModifier.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appExposeModifier"));

    }
    v14->_direction = a4;
    v15 = objc_msgSend(v12, "copy");
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_appExposeModifier, a6);
    v17 = [SBRouteToAppExposeSwitcherModifier alloc];
    v18 = -[SBAppExposeToHomeSwitcherModifier _newAppExposeModifier](v14, "_newAppExposeModifier");
    v19 = -[SBRouteToAppExposeSwitcherModifier initWithTransitionID:appExposeModifier:](v17, "initWithTransitionID:appExposeModifier:", v11, v18);

    -[SBChainableModifier addChildModifier:atLevel:key:](v14, "addChildModifier:atLevel:key:", v19, 0, 0);
    v20 = [SBHomeToGridSwitcherModifier alloc];
    v21 = -[SBAppExposeToHomeSwitcherModifier _newAppExposeModifier](v14, "_newAppExposeModifier");
    v22 = -[SBHomeToSwitcherSwitcherModifier initWithTransitionID:direction:multitaskingModifier:](v20, "initWithTransitionID:direction:multitaskingModifier:", v11, a4, v21);

    -[SBChainableModifier addChildModifier:atLevel:key:](v14, "addChildModifier:atLevel:key:", v22, 1, 0);
  }

  return v14;
}

- (id)transitionWillBegin
{
  void *v3;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SBScrollToAppLayoutSwitcherEventResponse *v16;
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
  v23.super_class = (Class)SBAppExposeToHomeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v23, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppExposeToHomeSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](self, "adjustedAppLayoutsForAppLayouts:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        if (objc_msgSend(v15, "environment", (_QWORD)v19) == 1)
        {
          v8 = v14;
          goto LABEL_11;
        }
        v8 = v15;

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  if (v8)
  {
    v16 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v8, 0, 0);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v16, v5);
    v17 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v17;
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
  v7.super_class = (Class)SBAppExposeToHomeSwitcherModifier;
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

- (double)plusButtonAlpha
{
  _BOOL4 v2;
  double result;

  v2 = -[SBAppExposeToHomeSwitcherModifier _isEffectivelyHome](self, "_isEffectivelyHome");
  result = 1.0;
  if (v2)
    return 0.0;
  return result;
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
  v8[2] = __74__SBAppExposeToHomeSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
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

uint64_t __74__SBAppExposeToHomeSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 152), "asyncRenderingAttributesForAppLayout:", a1[5]);
  *(_WORD *)(*(_QWORD *)(a1[6] + 8) + 32) = result;
  return result;
}

- (id)_newAppExposeModifier
{
  return (id)-[SBAppExposeGridSwitcherModifier copy](self->_appExposeModifier, "copy");
}

- (BOOL)_isEffectivelyHome
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appExposeModifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
