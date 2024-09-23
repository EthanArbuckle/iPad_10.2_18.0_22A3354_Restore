@implementation _UIStatusBarIndicatorTTYItem

- (id)indicatorEntryKey
{
  return CFSTR("ttyEntry");
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("teletype");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
