@implementation PBFPosterRolesSupportedForDataStoreCurrentDeviceClass

void __PBFPosterRolesSupportedForDataStoreCurrentDeviceClass_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  PFCurrentDeviceClass();
  PFPosterRolesSupportedForDeviceClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeObject:", *MEMORY[0x1E0D7F940]);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)PBFPosterRolesSupportedForDataStoreCurrentDeviceClass_appropriateForCurrentDeviceClass;
  PBFPosterRolesSupportedForDataStoreCurrentDeviceClass_appropriateForCurrentDeviceClass = v1;

}

@end
