@implementation HDSPSleepModeAutomatedOnState

- (id)stateName
{
  return CFSTR("Automated On");
}

- (unint64_t)defaultChangeReason
{
  return 7;
}

@end
