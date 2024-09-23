@implementation WFConfiguredSystemControlAction(SBSystemAction)

- (SBControlSystemAction)sb_newSystemActionWithInstanceIdentity:()SBSystemAction
{
  id v4;
  SBControlSystemAction *v5;

  v4 = a3;
  v5 = -[SBControlSystemAction initWithConfiguredAction:instanceIdentity:]([SBControlSystemAction alloc], "initWithConfiguredAction:instanceIdentity:", a1, v4);

  return v5;
}

@end
