@implementation SBDismissForEmptySwitcherSwitcherEventResponse

- (SBDismissForEmptySwitcherSwitcherEventResponse)init
{
  return -[SBDismissForEmptySwitcherSwitcherEventResponse initWithHIDEventSenderID:](self, "initWithHIDEventSenderID:", 0);
}

- (SBDismissForEmptySwitcherSwitcherEventResponse)initWithHIDEventSenderID:(unint64_t)a3
{
  SBDismissForEmptySwitcherSwitcherEventResponse *v4;
  SBHapticSwitcherEventResponse *v5;
  SBHapticSwitcherEventResponse *v6;
  SBPerformTransitionSwitcherEventResponse *v7;
  void *v8;
  SBPerformTransitionSwitcherEventResponse *v9;
  SBHapticSwitcherEventResponse *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBDismissForEmptySwitcherSwitcherEventResponse;
  v4 = -[SBChainableModifierEventResponse init](&v12, sel_init);
  if (v4)
  {
    v5 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 1, 0);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v5);

    v6 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 1, 1);
    -[SBHapticSwitcherEventResponse setHidEventSenderID:](v6, "setHidEventSenderID:", a3);
    v7 = [SBPerformTransitionSwitcherEventResponse alloc];
    +[SBSwitcherTransitionRequest requestForActivatingHomeScreen](SBSwitcherTransitionRequest, "requestForActivatingHomeScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:](v7, "initWithTransitionRequest:gestureInitiated:", v8, 0);

    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v6);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v9);
    v10 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 1, 2);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v10);

  }
  return v4;
}

- (int64_t)type
{
  return 16;
}

@end
