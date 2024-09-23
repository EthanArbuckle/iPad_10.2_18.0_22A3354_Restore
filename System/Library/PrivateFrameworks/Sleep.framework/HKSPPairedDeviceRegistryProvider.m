@implementation HKSPPairedDeviceRegistryProvider

- (id)getActivePairedDevice
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
