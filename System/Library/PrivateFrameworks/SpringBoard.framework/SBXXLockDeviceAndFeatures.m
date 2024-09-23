@implementation SBXXLockDeviceAndFeatures

void ___SBXXLockDeviceAndFeatures_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBS External Client (pid: %d) - LockDeviceAndFeatures"), objc_msgSend(*(id *)(a1 + 32), "pid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "revokeAuthenticationImmediatelyForPublicReason:", v3);

  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteLock:", *(_BYTE *)(a1 + 41) != 0);

}

@end
