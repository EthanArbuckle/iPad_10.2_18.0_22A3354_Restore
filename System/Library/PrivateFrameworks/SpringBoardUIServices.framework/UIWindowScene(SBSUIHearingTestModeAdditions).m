@implementation UIWindowScene(SBSUIHearingTestModeAdditions)

- (uint64_t)SBSUI_hearingTestMode
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "hearingTestMode");
  else
    v3 = 0;

  return v3;
}

- (void)SBSUI_setHearingTestMode:()SBSUIHearingTestModeAdditions
{
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(a1, "_FBSScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__UIWindowScene_SBSUIHearingTestModeAdditions__SBSUI_setHearingTestMode___block_invoke;
    v6[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
    v6[4] = a3;
    objc_msgSend(v5, "updateClientSettings:", v6);
  }

}

@end
