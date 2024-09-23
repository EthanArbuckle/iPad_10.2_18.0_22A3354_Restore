@implementation STUIStatusBarIndicatorDisplayWarningItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0CD0];
}

- (BOOL)useMultiColorSystemImageForUpdate:(id)a3
{
  return 1;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("display.trianglebadge.exclamationmark");
}

@end
