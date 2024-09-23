@implementation STUIStatusBarIndicatorRotationLockItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0D28];
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("lock.rotation");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
