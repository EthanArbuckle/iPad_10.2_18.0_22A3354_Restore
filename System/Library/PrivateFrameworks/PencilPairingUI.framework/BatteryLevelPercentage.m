@implementation BatteryLevelPercentage

void __BatteryLevelPercentage_block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BatteryLevelPercentage___demoBatteryLevelMode = objc_msgSend(v0, "integerForKey:", CFSTR("internalSettings.pencil.demo.batteryLevelMode"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatForKey:", CFSTR("internalSettings.pencil.demo.batteryLevel"));
  BatteryLevelPercentage___demoBatteryLevel = v2;

  if (*(float *)&BatteryLevelPercentage___demoBatteryLevel == 0.0)
    BatteryLevelPercentage___demoBatteryLevel = 1117126656;
}

@end
