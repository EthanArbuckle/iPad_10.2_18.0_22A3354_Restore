@implementation SBWorkspaceApplicationCanLaunchWhilePasscodeLockedIfSecureLaunchRequested

void __SBWorkspaceApplicationCanLaunchWhilePasscodeLockedIfSecureLaunchRequested_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.sidecar"), CFSTR("com.apple.ContinuityCaptureShieldUI"), 0);
  v1 = (void *)SBWorkspaceApplicationCanLaunchWhilePasscodeLockedIfSecureLaunchRequested___canLaunchSecureWhileLocked;
  SBWorkspaceApplicationCanLaunchWhilePasscodeLockedIfSecureLaunchRequested___canLaunchSecureWhileLocked = v0;

}

@end
