@implementation SBGetManagedWindowingModeDisplayConfigurationForName

id __SBGetManagedWindowingModeDisplayConfigurationForName_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "_fbsDisplayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
