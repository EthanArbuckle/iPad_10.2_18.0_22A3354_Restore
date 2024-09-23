@implementation STUIStatusBarIndicatorCarPlayItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0CA8];
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
