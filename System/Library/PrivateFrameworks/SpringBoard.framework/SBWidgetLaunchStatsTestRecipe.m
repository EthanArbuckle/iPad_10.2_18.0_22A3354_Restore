@implementation SBWidgetLaunchStatsTestRecipe

- (id)title
{
  return CFSTR("Trigger Duet for Widgets");
}

- (void)handleVolumeIncrease
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("DuetWidgetLaunchStatsUpdate"), 0);

}

@end
