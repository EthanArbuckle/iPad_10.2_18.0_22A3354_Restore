@implementation _UIStatusBarIndicatorRotationLockItem

- (id)indicatorEntryKey
{
  return CFSTR("rotationLockEntry");
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
