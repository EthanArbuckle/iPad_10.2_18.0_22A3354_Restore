@implementation SBSecureAppWindow

+ (BOOL)sb_autorotates
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleSecureApp")) ^ 1;
}

@end
