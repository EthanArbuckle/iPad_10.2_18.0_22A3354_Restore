@implementation _UIStatusBarIndicatorAlarmItem

- (id)indicatorEntryKey
{
  return CFSTR("alarmEntry");
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
