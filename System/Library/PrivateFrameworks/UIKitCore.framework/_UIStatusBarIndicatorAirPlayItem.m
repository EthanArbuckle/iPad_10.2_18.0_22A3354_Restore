@implementation _UIStatusBarIndicatorAirPlayItem

- (id)indicatorEntryKey
{
  return CFSTR("airPlayEntry");
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("airplayvideo");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
