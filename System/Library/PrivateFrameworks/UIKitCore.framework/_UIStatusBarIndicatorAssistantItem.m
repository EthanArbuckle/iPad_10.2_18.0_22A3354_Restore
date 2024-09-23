@implementation _UIStatusBarIndicatorAssistantItem

- (id)indicatorEntryKey
{
  return CFSTR("assistantEntry");
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("mic.fill");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
