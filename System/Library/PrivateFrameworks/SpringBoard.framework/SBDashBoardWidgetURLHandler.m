@implementation SBDashBoardWidgetURLHandler

- (void)openURL:(id)a3
{
  id v3;
  SBLockScreenUnlockRequest *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v4, "setSource:", 24);
  -[SBLockScreenUnlockRequest setIntent:](v4, "setIntent:", 3);
  -[SBLockScreenUnlockRequest setName:](v4, "setName:", CFSTR("Open URL From CoverSheet Widget"));
  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v4, "setWantsBiometricPresentation:", 1);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SBDashBoardWidgetURLHandler_openURL___block_invoke;
  v7[3] = &unk_1E8E9E980;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "unlockWithRequest:completion:", v4, v7);

}

uint64_t __39__SBDashBoardWidgetURLHandler_openURL___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return SBWorkspaceActivateApplicationFromURL(*(void **)(result + 32), 0, &__block_literal_global_96);
  return result;
}

uint64_t __39__SBDashBoardWidgetURLHandler_openURL___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSource:", 7);
}

@end
