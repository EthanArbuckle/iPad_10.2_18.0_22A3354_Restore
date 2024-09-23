@implementation _UIStatusBarIndicatorCarPlayItem

- (id)indicatorEntryKey
{
  return CFSTR("carPlayEntry");
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("carplay");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
