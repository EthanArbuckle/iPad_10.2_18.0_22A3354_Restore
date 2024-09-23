@implementation STUIStatusBarIndicatorTTYItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0D58];
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
