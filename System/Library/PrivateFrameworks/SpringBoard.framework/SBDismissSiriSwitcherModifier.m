@implementation SBDismissSiriSwitcherModifier

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBDismissSiriSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleGestureEvent:](&v10, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDismissSiriSwitcherModifier _eventResponseForGestureModifierEvent:](self, "_eventResponseForGestureModifierEvent:", v4, v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (id)_eventResponseForGestureModifierEvent:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBDismissSiriSwitcherEventResponse *v12;

  v3 = a3;
  objc_msgSend(v3, "translationInContainerView");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "velocityInContainerView");
  v9 = v8;
  v11 = v10;

  if (+[SBAssistantController shouldDismissSiriForGestureTranslation:velocity:](SBAssistantController, "shouldDismissSiriForGestureTranslation:velocity:", v5, v7, v9, v11))
  {
    v12 = objc_alloc_init(SBDismissSiriSwitcherEventResponse);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end
