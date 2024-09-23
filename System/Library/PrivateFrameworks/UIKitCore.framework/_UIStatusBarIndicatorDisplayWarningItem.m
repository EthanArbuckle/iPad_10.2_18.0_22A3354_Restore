@implementation _UIStatusBarIndicatorDisplayWarningItem

- (id)indicatorEntryKey
{
  return CFSTR("displayWarningEntry");
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
