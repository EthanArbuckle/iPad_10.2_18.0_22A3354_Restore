@implementation WFConfiguredStaccatoAction(SBSystemAction)

- (SBLinkSystemAction)sb_newSystemActionWithInstanceIdentity:()SBSystemAction
{
  id v4;
  SBLinkSystemAction *v5;

  v4 = a3;
  v5 = -[SBSystemAction initWithConfiguredAction:instanceIdentity:]([SBLinkSystemAction alloc], "initWithConfiguredAction:instanceIdentity:", a1, v4);

  return v5;
}

@end
