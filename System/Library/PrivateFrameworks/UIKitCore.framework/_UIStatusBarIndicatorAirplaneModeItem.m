@implementation _UIStatusBarIndicatorAirplaneModeItem

- (id)indicatorEntryKey
{
  return CFSTR("airplaneModeEntry");
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 1;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("airplane");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
