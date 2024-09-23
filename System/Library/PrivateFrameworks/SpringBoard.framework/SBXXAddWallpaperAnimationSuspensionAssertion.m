@implementation SBXXAddWallpaperAnimationSuspensionAssertion

void ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Disabling dynamic wallpapers and parallax for assertion with reason=%@", buf, 0xCu);
  }

  objc_msgSend(v2, "suspendWallpaperAnimationForReason:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", &__block_literal_global_131, 0.1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D017A0]), "initWithPort:", *(unsigned int *)(a1 + 40));
  v7 = (void *)MEMORY[0x1E0D01810];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_2;
  v9[3] = &unk_1E8E9E820;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v8 = v5;
  objc_msgSend(v7, "monitorSendRight:withHandler:", v6, v9);

}

uint64_t ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_130()
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "_recenterMotionEffects");
}

void ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_3;
  v2[3] = &unk_1E8E9E820;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Re-enabling dynamic wallpapers and parallax for assertion with reason=%@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

@end
