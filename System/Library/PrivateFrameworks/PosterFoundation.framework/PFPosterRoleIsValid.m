@implementation PFPosterRoleIsValid

void __PFPosterRoleIsValid_block_invoke()
{
  uint64_t v0;
  void *v1;

  PFPosterRolesSupportedForCurrentDeviceClass();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PFPosterRoleIsValid_validPosterRoles;
  PFPosterRoleIsValid_validPosterRoles = v0;

}

@end
