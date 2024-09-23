@implementation SBWorkspaceApplicationCanResumeWhilePasscodeLocked

void __SBWorkspaceApplicationCanResumeWhilePasscodeLocked_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.Maps"), CFSTR("com.apple.VoiceMemos"), CFSTR("com.apple.purplebuddy"), 0);
  v1 = (void *)SBWorkspaceApplicationCanResumeWhilePasscodeLocked___canResumeWhileLocked;
  SBWorkspaceApplicationCanResumeWhilePasscodeLocked___canResumeWhileLocked = v0;

}

@end
