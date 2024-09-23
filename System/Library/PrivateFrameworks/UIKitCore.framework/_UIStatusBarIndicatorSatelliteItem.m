@implementation _UIStatusBarIndicatorSatelliteItem

- (id)indicatorEntryKey
{
  return CFSTR("satelliteEntry");
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("satellite.fill");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
