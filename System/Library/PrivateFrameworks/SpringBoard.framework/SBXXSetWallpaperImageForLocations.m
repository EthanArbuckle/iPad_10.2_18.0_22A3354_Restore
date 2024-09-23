@implementation SBXXSetWallpaperImageForLocations

void ___SBXXSetWallpaperImageForLocations_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x1E0C80C00];
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(float *)(a1 + 72);
  v6 = *(float *)(a1 + 76);
  v7 = *(float *)(a1 + 80);
  v8 = *(float *)(a1 + 84);
  v17 = v5;
  v18 = v6;
  v19 = v7;
  v20 = v8;
  v9 = *(float *)(a1 + 88);
  v16 = v9;
  if (*(_QWORD *)(a1 + 48) && *(_DWORD *)(a1 + 92))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 92), 0);
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  v24.origin.x = v5;
  v24.origin.y = v6;
  v24.size.width = v7;
  v24.size.height = v8;
  if (CGRectIsEmpty(v24) && *(float *)(a1 + 96) != 0.0 && BSFloatIsOne() && !*(_BYTE *)(a1 + 100) && !v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "size");
    v17 = 0.0;
    v18 = 0.0;
    v19 = v12;
    v20 = v13;
    objc_msgSend(v3, "getBestCropRect:zoomScale:forImageSize:portrait:parallaxFactor:", &v17, &v16, *(_BYTE *)(a1 + 101) != 0);
    v9 = v16;
    v5 = v17;
    v6 = v18;
    v7 = v19;
    v8 = v20;
  }
  objc_msgSend(MEMORY[0x1E0D652D0], "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v4, *(_BYTE *)(a1 + 102) != 0, *(_BYTE *)(a1 + 101) != 0, *(_BYTE *)(a1 + 100) != 0, *(unsigned __int8 *)(a1 + 103), *(unsigned __int8 *)(a1 + 104), *(float *)(a1 + 96), v9, v5, v6, v7, v8, *(double *)(a1 + 56), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWallpaper();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v14;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "SETTING WALLPAPER: %{public}@", buf, 0xCu);
  }

  **(_BYTE **)(a1 + 64) = objc_msgSend(v3, "setWallpaperImage:adjustedImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:wallpaperMode:", *(_QWORD *)(a1 + 32), 0, 0, 0, v14, *(unsigned __int8 *)(a1 + 105), *(unsigned __int8 *)(a1 + 106));
}

@end
