@implementation SBTraitsHomeFollowsSwitcherRawPolicySpecifier

- (id)roleB
{
  return CFSTR("SBTraitsParticipantRoleSwitcherRaw");
}

- (id)roleA
{
  return CFSTR("SBTraitsParticipantRoleHomeScreen");
}

- (BOOL)force
{
  return 1;
}

- (BOOL)animate
{
  return 0;
}

@end
