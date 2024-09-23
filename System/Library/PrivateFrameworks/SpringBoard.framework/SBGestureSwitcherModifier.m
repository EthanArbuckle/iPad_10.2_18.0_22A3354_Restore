@implementation SBGestureSwitcherModifier

- (SBGestureSwitcherModifier)initWithGestureID:(id)a3
{
  id v5;
  SBGestureSwitcherModifier *v6;
  SBGestureSwitcherModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBGestureSwitcherModifier;
  v6 = -[SBSwitcherModifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gestureID, a3);
    v7->_gesturePhase = 0;
  }

  return v7;
}

- (BOOL)isPreparingLayout
{
  return self->_gesturePhase == 1;
}

- (BOOL)isUpdatingLayout
{
  return (self->_gesturePhase & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)requireStripContentsInViewHierarchy
{
  return 1;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBGestureSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v6, sel_animationAttributesForLayoutElement_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setUpdateMode:", 5);
  return v4;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  CGRect v4;

  -[SBGestureSwitcherModifier frameForIndex:](self, "frameForIndex:", a3);
  return CGRectGetWidth(v4);
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isHitTestBlockingViewVisible
{
  return 1;
}

- (id)handleEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  SBGestureSwitcherModifierEvent *lastGestureEvent;
  SBGestureSwitcherModifierEvent *v9;
  SBGestureSwitcherModifierEvent *v10;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "isGestureEvent")
    && (objc_msgSend(v4, "gestureID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqual:", self->_gestureID),
        v5,
        (v6 & 1) == 0))
  {
    lastGestureEvent = self->_lastGestureEvent;
    if (lastGestureEvent && self->_gesturePhase != 3)
    {
      -[SBGestureSwitcherModifierEvent setPhase:](lastGestureEvent, "setPhase:", 3);
      v9 = self->_lastGestureEvent;
      v13.receiver = self;
      v13.super_class = (Class)SBGestureSwitcherModifier;
      -[SBChainableModifier handleEvent:](&v13, sel_handleEvent_, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    -[SBChainableModifier setState:](self, "setState:", 1);
    v10 = self->_lastGestureEvent;
    self->_lastGestureEvent = 0;

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBGestureSwitcherModifier;
    -[SBChainableModifier handleEvent:](&v12, sel_handleEvent_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)handleGestureEvent:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  SBUpdateLayoutSwitcherEventResponse *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBGestureSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v17, sel_handleGestureEvent_, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gestureID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", self->_gestureID);

  if (v9)
  {
    v10 = objc_msgSend(v6, "phase");
    if (v10 < self->_gesturePhase)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SBStringFromGesturePhase(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SBStringFromGesturePhase(self->_gesturePhase);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBGestureSwitcherModifier.m"), 115, CFSTR("Expected the same or a more advanced phase. Got %@, currently %@."), v15, v16);

    }
    self->_gesturePhase = v10;
    if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v11 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v11, v7);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
    objc_storeStrong((id *)&self->_lastGestureEvent, a3);
  }

  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isGestureInitiated") & 1) == 0
    && (objc_msgSend(v4, "isAppLaunchDuringWindowDragGestureTransition") & 1) == 0)
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }
  v7.receiver = self;
  v7.super_class = (Class)SBGestureSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v7, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBGestureSwitcherModifier;
  -[SBChainableModifier descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromGesturePhase(self->_gesturePhase);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("phase"));

  return v4;
}

- (unint64_t)gesturePhase
{
  return self->_gesturePhase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGestureEvent, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
}

@end
