@implementation SBLowBatteryLogTestRecipe

- (id)title
{
  return CFSTR("Print LowBattery Log");
}

- (void)handleVolumeIncrease
{
  +[SBBatteryLogger saveLowBatteryLogWithCapacity:voltage:completion:](SBBatteryLogger, "saveLowBatteryLogWithCapacity:voltage:completion:", 30, 5, 0);
}

- (void)handleVolumeDecrease
{
  +[SBBatteryLogger saveLowBatteryLogWithCapacity:voltage:completion:](SBBatteryLogger, "saveLowBatteryLogWithCapacity:voltage:completion:", 30, 5, &__block_literal_global_327);
}

@end
