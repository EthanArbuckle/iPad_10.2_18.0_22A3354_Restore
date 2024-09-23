@implementation SBContinuousExposeAppToInlineAppExposeSwitcherModifier

- (SBContinuousExposeAppToInlineAppExposeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 activeAppLayout:(id)a5 appExposeBundleIdentifier:(id)a6
{
  id v11;
  id v12;
  SBContinuousExposeAppToInlineAppExposeSwitcherModifier *v13;
  SBContinuousExposeAppToInlineAppExposeSwitcherModifier *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
  v13 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v16, sel_initWithTransitionID_, a3);
  v14 = v13;
  if (v13)
  {
    v13->_direction = a4;
    objc_storeStrong((id *)&v13->_activeAppLayout, a5);
    objc_storeStrong((id *)&v14->_appExposeBundleIdentifier, a6);
  }

  return v14;
}

- (id)transitionWillBegin
{
  void *v3;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v4;
  void *v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v9, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") == 1)
  {
    v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
    SBAppendSwitcherModifierResponse(v6, v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
  -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_direction)
  {
    v5 = v3;
  }
  else
  {
    -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier _inlineAppExposeAppLayouts](self, "_inlineAppExposeAppLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObjectsFromArray:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = v4;
  if (self->_direction == 1)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
    -[SBTransitionSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v9, sel_adjustedAppLayoutsForAppLayouts_, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
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
  unint64_t v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int64_t direction;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  v29.receiver = self;
  v29.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
  -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier frameForIndex:](&v29, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase");
  if ((objc_msgSend(v14, "isEqual:", self->_activeAppLayout) & 1) == 0)
  {
    objc_msgSend(v14, "continuousExposeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsString:", self->_appExposeBundleIdentifier);

    if ((v17 & 1) == 0)
    {
      -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stripWidth");
      v20 = v19;

      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      {
        -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v22 = v10 * 0.5 + v21;
      }
      else
      {
        v22 = v10 * -0.5 - v20;
      }
      direction = self->_direction;
      if (direction || v15 != 2)
      {
        if (v15 == 1 && direction == 1)
          v6 = v22;
      }
      else
      {
        v6 = v22;
      }
    }
  }

  v25 = v6;
  v26 = v8;
  v27 = v10;
  v28 = v12;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
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
  CGRect result;

  v5 = a4;
  -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier frameForIndex:](self, "frameForIndex:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
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
  -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier appLayouts](self, "appLayouts");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appExposeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activeAppLayout, 0);
}

@end
