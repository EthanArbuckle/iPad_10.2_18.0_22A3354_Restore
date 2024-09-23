@implementation SBXXSetWallpaperImageSurfaceForLocations

void ___SBXXSetWallpaperImageSurfaceForLocations_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;
  CGRect v35;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEA0]), "initWithMachPort:", *(unsigned int *)(a1 + 80));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEA0]), "initWithMachPort:", *(unsigned int *)(a1 + 84));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 88), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 92), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v6 = 0;
    if (v3)
      goto LABEL_3;
LABEL_11:
    v8 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "sbf_imageWithIOSurface:scale:orientation:", v2, 0, SBScreenScale());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_11;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CEA638], "sbf_imageWithIOSurface:scale:orientation:", v3, 0, SBScreenScale());
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wallpaperConfigurationManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 48));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = *(float *)(a1 + 96);
    v13 = *(float *)(a1 + 100);
    v14 = *(float *)(a1 + 104);
    v15 = *(float *)(a1 + 108);
    v28 = v12;
    v29 = v13;
    v30 = v14;
    v31 = v15;
    v16 = *(float *)(a1 + 112);
    v27 = v16;
    if (*(_QWORD *)(a1 + 56) && *(_DWORD *)(a1 + 116))
    {
      v17 = v10;
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 116), 0);
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v18, 0, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v19 = 0;
      }

      v11 = (void *)v17;
    }
    else
    {
      v19 = 0;
    }
    v35.origin.x = v12;
    v35.origin.y = v13;
    v35.size.width = v14;
    v35.size.height = v15;
    if (CGRectIsEmpty(v35)
      && *(float *)(a1 + 120) != 0.0
      && BSFloatIsOne()
      && !*(_BYTE *)(a1 + 124)
      && !v11)
    {
      objc_msgSend(v6, "size");
      v28 = 0.0;
      v29 = 0.0;
      v30 = v20;
      v31 = v21;
      objc_msgSend(v26, "getBestCropRect:zoomScale:forImageSize:portrait:parallaxFactor:", &v28, &v27, *(_BYTE *)(a1 + 125) != 0);
      v16 = v27;
      v12 = v28;
      v13 = v29;
      v14 = v30;
      v15 = v31;
    }
    v25 = v19;
    v22 = v11;
    objc_msgSend(MEMORY[0x1E0D652D0], "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v11, *(_BYTE *)(a1 + 126) != 0, *(_BYTE *)(a1 + 125) != 0, *(_BYTE *)(a1 + 124) != 0, *(unsigned __int8 *)(a1 + 127), *(unsigned __int8 *)(a1 + 128), *(float *)(a1 + 120), v16, v12, v13, v14, v15, *(double *)(a1 + 64), v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogWallpaper();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v23;
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "SETTING WALLPAPER: %{public}@", buf, 0xCu);
    }

    **(_BYTE **)(a1 + 72) = objc_msgSend(v26, "setWallpaperImage:adjustedImage:thumbnailData:imageHashData:wallpaperOptions:forVariants:wallpaperMode:", v6, v8, v4, v5, v23, *(unsigned __int8 *)(a1 + 129), *(unsigned __int8 *)(a1 + 130));
  }
LABEL_22:

}

void ___SBXXSetWallpaperImageSurfaceForLocations_block_invoke_125(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

@end
