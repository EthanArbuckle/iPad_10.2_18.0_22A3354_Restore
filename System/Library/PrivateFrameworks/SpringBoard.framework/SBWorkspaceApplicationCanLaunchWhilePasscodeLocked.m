@implementation SBWorkspaceApplicationCanLaunchWhilePasscodeLocked

void __SBWorkspaceApplicationCanLaunchWhilePasscodeLocked_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.calculator"), CFSTR("com.apple.mobiletimer"), CFSTR("com.apple.camera"), CFSTR("com.apple.TVRemoteUIService"), 0);
  v1 = (void *)SBWorkspaceApplicationCanLaunchWhilePasscodeLocked___allowedToLaunchWhileLockedApps;
  SBWorkspaceApplicationCanLaunchWhilePasscodeLocked___allowedToLaunchWhileLockedApps = v0;

}

@end
