@implementation SBTransientlyVisibleSlideOverTongueSwitcherModifier

- (SBTransientlyVisibleSlideOverTongueSwitcherModifier)initWithMode:(unint64_t)a3
{
  SBTransientlyVisibleSlideOverTongueSwitcherModifier *result;
  void *v7;
  objc_super v8;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientlyVisibleSlideOverTongueSwitcherModifier.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mode != SBSlideOverTongueTransientlyVisibleModeNone"));

  }
  v8.receiver = self;
  v8.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  result = -[SBSwitcherModifier init](&v8, sel_init);
  if (result)
  {
    result->_mode = a3;
    result->_rightEdgeHintState = 0;
    result->_edgeProtectEdge = 0;
  }
  return result;
}

+ (unint64_t)slideOverTongueTransientlyVisibleModeForEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  char v16;
  unint64_t v17;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 1)
  {
    v4 = objc_opt_class();
    SBSafeCast(v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "phase") == 1)
    {
      v6 = objc_msgSend(v5, "fromFloatingConfiguration");
      v7 = objc_msgSend(v5, "toFloatingConfiguration") & 0xFFFFFFFFFFFFFFFBLL;
      v8 = objc_msgSend(v5, "toEnvironmentMode") != 3 || (v6 & 0xFFFFFFFFFFFFFFFBLL) == 0;
      if (!v8 && v7 == 0 && (objc_msgSend(v5, "isEnteringAnyPeekEvent") & 1) == 0)
      {
        objc_msgSend(v5, "toAppLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fromFloatingAppLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemForLayoutRole:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "containsItem:", v12);

        if (!v13)
        {

          v17 = 1;
          goto LABEL_18;
        }
      }
    }

    goto LABEL_17;
  }
  if (objc_msgSend(v3, "type") != 26
    || (v14 = objc_opt_class(),
        SBSafeCast(v14, v3),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "isTonguePresented"),
        v15,
        (v16 & 1) == 0))
  {
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  v17 = 2;
LABEL_18:

  return v17;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SBChainableModifier setState:](self, "setState:", 1);
  v7.receiver = self;
  v7.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v7, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  double v10;
  double v11;
  SBTimerEventSwitcherEventResponse *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTransitionEvent:](&v15, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "toFloatingConfiguration", v15.receiver, v15.super_class);

  if (self->_mode == 1 && (v6 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    if (!self->_rightEdgeHintState)
    {
      self->_rightEdgeHintState = 1;
      -[SBTransientlyVisibleSlideOverTongueSwitcherModifier switcherSettings](self, "switcherSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatingSwitcherSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rightEdgePeekDelay");
      v11 = v10;

      v12 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("SBSlideOverTongueRightEdgeHintStartPeekingTimerReason"), v11);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v12, v5);
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v13;
    }
  }
  else
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }
  return v5;
}

- (id)handleSlideOverEdgeProtectTongueEvent:(id)a3
{
  id v4;
  void *v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  -[SBSwitcherModifier handleSlideOverEdgeProtectTongueEvent:](&v9, sel_handleSlideOverEdgeProtectTongueEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mode == 2)
  {
    if (objc_msgSend(v4, "isTonguePresented"))
      self->_edgeProtectEdge = objc_msgSend(v4, "edge");
    else
      -[SBChainableModifier setState:](self, "setState:", 1);
    v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  SBSwitcherModifierEventResponse *v5;
  void *v6;
  void *v7;
  int v8;
  SBUpdateLayoutSwitcherEventResponse *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  SBTimerEventSwitcherEventResponse *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  -[SBSwitcherModifier handleTimerEvent:](&v18, sel_handleTimerEvent_, v4);
  v5 = (SBSwitcherModifierEventResponse *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("SBSlideOverTongueRightEdgeHintStartPeekingTimerReason")))
  {

  }
  else
  {
    objc_msgSend(v4, "reason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SBSlideOverTongueRightEdgeHintStopPeekingTimerReason"));

    if (!v8)
      goto LABEL_10;
  }
  if (!v5)
    v5 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v9 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
  -[SBChainableModifierEventResponse addChildResponse:](v5, "addChildResponse:", v9);
  objc_msgSend(v4, "reason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("SBSlideOverTongueRightEdgeHintStartPeekingTimerReason"));

  if (v11)
  {
    self->_rightEdgeHintState = 2;
    -[SBTransientlyVisibleSlideOverTongueSwitcherModifier switcherSettings](self, "switcherSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatingSwitcherSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rightEdgePeekTimeout");
    v15 = v14;

    v16 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, CFSTR("SBSlideOverTongueRightEdgeHintStopPeekingTimerReason"), v15);
    -[SBChainableModifierEventResponse addChildResponse:](v5, "addChildResponse:", v16);

  }
  else
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }

LABEL_10:
  return v5;
}

- (unint64_t)slideOverTongueState
{
  unint64_t mode;
  objc_super v4;

  mode = self->_mode;
  if (mode)
  {
    return mode != 1 || self->_rightEdgeHintState == 2;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
    return -[SBTransientlyVisibleSlideOverTongueSwitcherModifier slideOverTongueState](&v4, sel_slideOverTongueState);
  }
}

- (unint64_t)slideOverTongueDirection
{
  unint64_t result;
  objc_super v4;

  result = self->_mode;
  if (result != 1)
  {
    if (result == 2)
    {
      if (self->_edgeProtectEdge == 8)
        return 1;
      else
        return 2;
    }
    else
    {
      v4.receiver = self;
      v4.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
      return -[SBTransientlyVisibleSlideOverTongueSwitcherModifier slideOverTongueDirection](&v4, sel_slideOverTongueDirection);
    }
  }
  return result;
}

- (unint64_t)mode
{
  return self->_mode;
}

@end
