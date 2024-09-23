@implementation PFPosterRolesSupportedForCurrentDeviceClass

void __PFPosterRolesSupportedForCurrentDeviceClass_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = PFCurrentDeviceClass();
  PFPosterRolesSupportedForDeviceClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PFPosterRolesSupportedForCurrentDeviceClass_appropriateForCurrentDeviceClass;
  PFPosterRolesSupportedForCurrentDeviceClass_appropriateForCurrentDeviceClass = v1;

}

@end
