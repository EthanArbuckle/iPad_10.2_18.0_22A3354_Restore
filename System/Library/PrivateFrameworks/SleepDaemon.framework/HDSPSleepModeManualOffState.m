@implementation HDSPSleepModeManualOffState

- (unint64_t)defaultChangeReason
{
  return 1;
}

- (id)stateName
{
  return CFSTR("Manual Off");
}

@end
