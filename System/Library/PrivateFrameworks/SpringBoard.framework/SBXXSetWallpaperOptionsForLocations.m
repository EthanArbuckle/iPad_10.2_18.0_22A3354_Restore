@implementation SBXXSetWallpaperOptionsForLocations

void ___SBXXSetWallpaperOptionsForLocations_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperConfigurationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D652D0], "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:", v3, *(_BYTE *)(a1 + 80) != 0, *(_BYTE *)(a1 + 81) != 0, *(_BYTE *)(a1 + 82) != 0, *(float *)(a1 + 72), *(float *)(a1 + 76), *(float *)(a1 + 56), *(float *)(a1 + 60), *(float *)(a1 + 64), *(float *)(a1 + 68), *(double *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  **(_BYTE **)(a1 + 48) = objc_msgSend(v5, "setWallpaperOptions:forVariants:", v4, *(unsigned __int8 *)(a1 + 83));

}

@end
