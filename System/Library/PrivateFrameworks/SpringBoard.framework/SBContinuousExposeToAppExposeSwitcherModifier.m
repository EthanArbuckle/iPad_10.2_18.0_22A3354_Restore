@implementation SBContinuousExposeToAppExposeSwitcherModifier

- (SBContinuousExposeToAppExposeSwitcherModifier)initWithTransitionID:(id)a3 appExposeBundleID:(id)a4 direction:(unint64_t)a5 appExposeModifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBContinuousExposeToAppExposeSwitcherModifier *v14;
  uint64_t v15;
  NSString *appExposeBundleID;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *timerReason;
  SBRouteToAppExposeSwitcherModifier *v22;
  void *v23;
  SBRouteToAppExposeSwitcherModifier *v24;
  void *v26;
  void *v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v28, sel_initWithTransitionID_, v11);
  if (v14)
  {
    if (v12)
    {
      if (v13)
      {
LABEL_4:
        v15 = objc_msgSend(v12, "copy");
        appExposeBundleID = v14->_appExposeBundleID;
        v14->_appExposeBundleID = (NSString *)v15;

        v14->_direction = a5;
        objc_storeStrong((id *)&v14->_appExposeModifier, a6);
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("SBContinuousExposeToAppExposeSwitcherModifier:%@"), v19);
        v20 = objc_claimAutoreleasedReturnValue();
        timerReason = v14->_timerReason;
        v14->_timerReason = (NSString *)v20;

        v22 = [SBRouteToAppExposeSwitcherModifier alloc];
        v23 = (void *)-[SBAppExposeContinuousExposeSwitcherModifier copy](v14->_appExposeModifier, "copy");
        v24 = -[SBRouteToAppExposeSwitcherModifier initWithTransitionID:appExposeModifier:](v22, "initWithTransitionID:appExposeModifier:", v11, v23);

        -[SBChainableModifier addChildModifier:atLevel:key:](v14, "addChildModifier:atLevel:key:", v24, 0, 0);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBContinuousExposeToAppExposeSwitcherModifier.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appExposeBundleID"));

      if (v13)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBContinuousExposeToAppExposeSwitcherModifier.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appExposeModifier"));

    goto LABEL_4;
  }
LABEL_5:

  return v14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  id v9;

  -[SBChainableModifier succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifier succinctDescription](self->_appExposeModifier, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("appExposeModifier"));

  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_appExposeBundleID, CFSTR("appExposeBundleID"));
  if (self->_direction)
    v8 = CFSTR("ToSwitcher");
  else
    v8 = CFSTR("ToAppExpose");
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("direction"));
  return v4;
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
  v12.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v12, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  -[SBContinuousExposeToAppExposeSwitcherModifier visibleAppLayouts](&v11, sel_visibleAppLayouts);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  appLayoutsVisibleBeforeTransition = self->_appLayoutsVisibleBeforeTransition;
  self->_appLayoutsVisibleBeforeTransition = v4;

  -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_appExposeModifier, 1, 0);
  v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, self->_timerReason, 0.0);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBScrollToAppLayoutSwitcherEventResponse *v11;
  void *v12;
  SBUpdateLayoutSwitcherEventResponse *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v15, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v15.receiver, v15.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", self->_timerReason);
  if ((_DWORD)v4)
  {
    -[SBContinuousExposeToAppExposeSwitcherModifier continuousExposeIdentifiersInSwitcher](self, "continuousExposeIdentifiersInSwitcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SBContinuousExposeToAppExposeSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v10, 0, 0);
        +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v11, v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
        +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v13, v12);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v5;
}

- (id)transitionWillUpdate
{
  SBAppExposeContinuousExposeSwitcherModifier *appExposeModifier;
  objc_super v5;

  -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", self->_appExposeModifier);
  appExposeModifier = self->_appExposeModifier;
  self->_appExposeModifier = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v5, sel_transitionWillUpdate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  -[SBContinuousExposeToAppExposeSwitcherModifier frameForIndex:](&v19, sel_frameForIndex_, a3);
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  if (self->_appExposeModifier)
  {
    v12 = -[SBContinuousExposeToAppExposeSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    -[SBContinuousExposeToAppExposeSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
    if (v12)
      v14 = v13;
    else
      v14 = -v13;
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
  v6.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  -[SBContinuousExposeToAppExposeSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
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
  v10.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBContinuousExposeToAppExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toggleAppSwitcherSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v8);

  return v5;
}

- (NSString)appExposeBundleID
{
  return self->_appExposeBundleID;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appExposeBundleID, 0);
  objc_storeStrong((id *)&self->_appLayoutsVisibleBeforeTransition, 0);
  objc_storeStrong((id *)&self->_timerReason, 0);
  objc_storeStrong((id *)&self->_appExposeModifier, 0);
}

@end
