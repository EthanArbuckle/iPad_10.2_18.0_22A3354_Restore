@implementation HDSPSleepModeManualOnState

- (id)stateName
{
  return CFSTR("Manual Bedtime");
}

- (unint64_t)defaultChangeReason
{
  return 1;
}

@end
