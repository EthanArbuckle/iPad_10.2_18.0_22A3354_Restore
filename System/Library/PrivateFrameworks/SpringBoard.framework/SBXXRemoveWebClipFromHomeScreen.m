@implementation SBXXRemoveWebClipFromHomeScreen

void ___SBXXRemoveWebClipFromHomeScreen_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkIconForWebClipIdentifier:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "iconManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uninstallIcon:animate:", v4, 1);

  }
  else
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Unable to find icon with webclip identifier [%{public}@] for removal.", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_msgSend((id)SBApp, "noteInstalledWebClipsDidChange");

}

@end
