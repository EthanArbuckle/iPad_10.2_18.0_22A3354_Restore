@implementation CBStackAdaptorBTStack

- (Class)accessoryMonitorClass
{
  return (Class)objc_opt_class(CBStackAccessoryMonitorBTStack);
}

- (Class)addressMonitorClass
{
  return (Class)objc_opt_class(CBStackAddressMonitorBTStack);
}

- (Class)bleAdvertiserClass
{
  return (Class)objc_opt_class(CBStackBLEAdvertiserBTStack);
}

- (Class)bleScannerClass
{
  return (Class)objc_opt_class(CBStackBLEScannerBTStack);
}

- (Class)classicScannerClass
{
  return (Class)objc_opt_class(CBStackClassicScannerBTStack);
}

- (Class)controllerClass
{
  return (Class)objc_opt_class(CBStackControllerBTStack);
}

- (Class)deviceMonitorClass
{
  return (Class)objc_opt_class(CBStackDeviceMonitorBTStack);
}

- (Class)userControllerClass
{
  return (Class)objc_opt_class(CBUserController);
}

@end
