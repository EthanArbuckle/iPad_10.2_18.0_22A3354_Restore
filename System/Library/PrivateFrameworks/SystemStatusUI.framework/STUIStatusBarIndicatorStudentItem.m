@implementation STUIStatusBarIndicatorStudentItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0D50];
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return 0;
}

- (id)imageNameForUpdate:(id)a3
{
  return CFSTR("Student");
}

@end
