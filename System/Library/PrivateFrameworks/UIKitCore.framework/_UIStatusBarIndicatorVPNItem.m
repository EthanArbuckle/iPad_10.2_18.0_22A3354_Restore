@implementation _UIStatusBarIndicatorVPNItem

- (id)indicatorEntryKey
{
  return CFSTR("vpnEntry");
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
  return CFSTR("VPN");
}

@end
