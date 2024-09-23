@implementation PFPosterRolesSupportedForDeviceClass

void __PFPosterRolesSupportedForDeviceClass_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    objc_msgSend(v2, "addObject:", CFSTR("PRPosterRoleLockScreen"));
  if (_os_feature_enabled_impl())
    objc_msgSend(v2, "addObject:", CFSTR("PRPosterRoleAmbient"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)PFPosterRolesSupportedForDeviceClass_roles;
  PFPosterRolesSupportedForDeviceClass_roles = v0;

}

@end
