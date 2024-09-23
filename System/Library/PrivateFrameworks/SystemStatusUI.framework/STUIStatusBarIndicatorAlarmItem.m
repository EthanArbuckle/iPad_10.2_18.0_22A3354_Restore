@implementation STUIStatusBarIndicatorAlarmItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0C78];
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("alarm.fill");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
