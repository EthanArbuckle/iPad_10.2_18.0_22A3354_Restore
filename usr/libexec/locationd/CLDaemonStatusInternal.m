@implementation CLDaemonStatusInternal

- (void)airplaneModeChanged
{
  objc_msgSend(-[CLServiceVendor proxyForService:](+[CLServiceVendor sharedInstance](CLServiceVendor, "sharedInstance"), "proxyForService:", CFSTR("CLDaemonStatus")), "syncgetDoSync:", &stru_1021493F8);
}

@end
