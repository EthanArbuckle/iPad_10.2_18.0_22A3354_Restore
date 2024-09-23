@implementation SBSwitcherToAppExposeSwitcherModifier

- (SBSwitcherToAppExposeSwitcherModifier)initWithTransitionID:(id)a3 bundleIdentifier:(id)a4 appExposeModifier:(id)a5
{
  id v9;
  id v10;
  SBSwitcherToAppExposeSwitcherModifier *v11;
  SBRouteToAppExposeSwitcherModifier *v12;
  id v13;
  SBRouteToAppExposeSwitcherModifier *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, v9);
  if (v11)
  {
    if (a4)
    {
      if (v10)
      {
LABEL_4:
        objc_storeStrong((id *)&v11->_appExposeModifier, a5);
        v12 = [SBRouteToAppExposeSwitcherModifier alloc];
        v13 = -[SBSwitcherToAppExposeSwitcherModifier _newAppExposeModifier](v11, "_newAppExposeModifier");
        v14 = -[SBRouteToAppExposeSwitcherModifier initWithTransitionID:appExposeModifier:](v12, "initWithTransitionID:appExposeModifier:", v9, v13);

        -[SBChainableModifier addChildModifier:atLevel:key:](v11, "addChildModifier:atLevel:key:", v14, 0, 0);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBSwitcherToAppExposeSwitcherModifier.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

      if (v10)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBSwitcherToAppExposeSwitcherModifier.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appExposeModifier"));

    goto LABEL_4;
  }
LABEL_5:

  return v11;
}

- (id)transitionWillBegin
{
  void *v3;
  NSSet *v4;
  NSSet *appLayoutsVisibleBeforeTransition;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v6;
  void *v7;
  SBTimerEventSwitcherEventResponse *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v12, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  -[SBSwitcherToAppExposeSwitcherModifier visibleAppLayouts](&v11, sel_visibleAppLayouts);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  appLayoutsVisibleBeforeTransition = self->_appLayoutsVisibleBeforeTransition;
  self->_appLayoutsVisibleBeforeTransition = v4;

  -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_appExposeModifier, 1, 0);
  v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("Switcher to App Expose did begin"), 0.0);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SBScrollToAppLayoutSwitcherEventResponse *v17;
  void *v18;
  SBUpdateLayoutSwitcherEventResponse *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v25, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Switcher to App Expose did begin"));

  if (v7)
  {
    -[SBSwitcherToAppExposeSwitcherModifier appLayouts](self, "appLayouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        v14 = 0;
        v15 = v9;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
          if (objc_msgSend(v16, "environment", (_QWORD)v21) == 1)
          {
            v9 = v15;
            goto LABEL_12;
          }
          v9 = v16;

          ++v14;
          v15 = v9;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_12:

    if (v9)
    {
      v17 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v9, 0, 0);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v17, v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v19, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (id)transitionWillUpdate
{
  SBAppExposeGridSwitcherModifier *appExposeModifier;
  objc_super v5;

  -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", self->_appExposeModifier);
  appExposeModifier = self->_appExposeModifier;
  self->_appExposeModifier = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v5, sel_transitionWillUpdate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  -[SBSwitcherToAppExposeSwitcherModifier frameForIndex:](&v19, sel_frameForIndex_);
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  if (self->_appExposeModifier)
  {
    -[SBSwitcherToAppExposeSwitcherModifier _offsetForPushingCardsOffscreenAtIndex:](self, "_offsetForPushingCardsOffscreenAtIndex:", a3);
    v14 = v13;
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v21 = CGRectOffset(v20, v14, 0.0);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  -[SBSwitcherToAppExposeSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", self->_appLayoutsVisibleBeforeTransition);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBSwitcherToAppExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toggleAppSwitcherSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v8);

  return v5;
}

- (double)_offsetForPushingCardsOffscreenAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[SBSwitcherToAppExposeSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "environment") != 2;
  -[SBSwitcherToAppExposeSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v8 = v7;
  if (-[SBSwitcherToAppExposeSwitcherModifier isRTLEnabled](self, "isRTLEnabled") != v5)
    v8 = -v8;

  return v8;
}

- (id)_newAppExposeModifier
{
  return (id)-[SBAppExposeGridSwitcherModifier copy](self->_appExposeModifier, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutsVisibleBeforeTransition, 0);
  objc_storeStrong((id *)&self->_appExposeModifier, 0);
}

@end
