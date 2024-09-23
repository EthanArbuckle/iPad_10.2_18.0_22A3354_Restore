@implementation SBXXSetProceduralWallpaper

void ___SBXXSetProceduralWallpaper_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProceduralWallpaperIdentifier:options:forVariants:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  SBLogWallpaper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SETTING PROCEDURAL WALLPAPER %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
  }

}

@end
