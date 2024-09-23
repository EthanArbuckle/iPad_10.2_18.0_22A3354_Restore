@implementation _UIStatusBarIndicatorAnnounceNotificationsItem

- (id)indicatorEntryKey
{
  return CFSTR("announceNotificationsEntry");
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("bell.and.waveform.fill");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
