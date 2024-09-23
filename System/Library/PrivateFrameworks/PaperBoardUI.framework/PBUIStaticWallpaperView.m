@implementation PBUIStaticWallpaperView

- (int64_t)wallpaperType
{
  return 1;
}

+ (BOOL)_canCacheImages
{
  return 1;
}

+ (BOOL)_canDownscaleSampleImage
{
  return 1;
}

- (void)_setupWallpaperImageFromConfiguration:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  double v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  _BYTE v51[64];
  _QWORD v52[5];
  id v53;
  double v54;
  BOOL v55;
  _QWORD v56[6];
  uint8_t v57[64];
  uint8_t v58[4];
  void *v59;
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "wallpaperOptions");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperImageHashData");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "base64EncodedStringWithOptions:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIStaticWallpaperView setDisplayedImageHashData:](self, "setDisplayedImageHashData:", v48);
  -[PBUIStaticWallpaperView setDisplayedImageHashString:](self, "setDisplayedImageHashString:", v47);
  objc_msgSend(v5, "wallpaperImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "size");
    v9 = v8;
    v11 = v10;
  }
  else
  {
    objc_msgSend(v43, "cropRect");
    v9 = v12;
    v11 = v13;
  }
  v14 = objc_msgSend((id)objc_opt_class(), "_canDownscaleSampleImage");
  v15 = 16.0;
  v16 = v9 >= 16.0;
  if (v11 >= 16.0)
    v16 = 1;
  if (!v16)
    v15 = 1.0;
  if (v14)
    v17 = !v16;
  else
    v17 = 1;
  if (v14)
    v18 = v16;
  else
    v18 = 0;
  v42 = v18;
  if (v14)
    v19 = v15;
  else
    v19 = 1.0;
  -[PBUIStaticWallpaperView _setSampleImage:](self, "_setSampleImage:", v7, 1.0, v15);
  -[PBUIStaticWallpaperView _setDisplayedImage:](self, "_setDisplayedImage:", v7);
  PBUILogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(-[PBUIWallpaperView variant](self, "variant"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v21;
    _os_log_impl(&dword_1B71C0000, v20, OS_LOG_TYPE_DEFAULT, "[LegacyPoster displayedImage] configuration wallpaper image for display image %{public}@ for variant %{public}@", buf, 0x16u);

  }
  -[PBUIStaticWallpaperView _setDisplayedImageURL:](self, "_setDisplayedImageURL:", 0);
  -[PBUIWallpaperView cacheGroup](self, "cacheGroup");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v46, "length");
  v23 = v22 != 0;
  if (v22)
  {
    v24 = objc_msgSend((id)objc_opt_class(), "_canCacheImages");
    -[PBUIStaticWallpaperView traitCollection](self, "traitCollection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      PBUIWallpaperBackdropParametersMakeIdentity((uint64_t)v57);
      -[PBUIWallpaperView _cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:](self, "_cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:", v57, 0, v45, v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
      v23 = 0;
    }
  }
  else
  {
    -[PBUIStaticWallpaperView traitCollection](self, "traitCollection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  v63 = 0;
  v26 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke;
  v56[3] = &unk_1E6B948A0;
  v56[4] = self;
  v56[5] = buf;
  v27 = (void *)MEMORY[0x1BCCA5978](v56);
  v28 = objc_msgSend(v5, "needsWallpaperDimmingTreatment");
  v29 = objc_msgSend(v5, "needsInactiveAppearanceTreatment");
  v52[0] = v26;
  v52[1] = 3221225472;
  v52[2] = __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke_2;
  v52[3] = &unk_1E6B948C8;
  v54 = v19;
  v55 = v17;
  v52[4] = self;
  v30 = v25;
  v53 = v30;
  -[PBUIStaticWallpaperView _generateImageForImage:cacheKey:options:downsampleFactor:needsDimmingTreatment:needsInactiveAppearanceTreatment:averageColorProvider:generationHandler:](self, "_generateImageForImage:cacheKey:options:downsampleFactor:needsDimmingTreatment:needsInactiveAppearanceTreatment:averageColorProvider:generationHandler:", v7, v30, a4, v28, v29, v27, v19, v52);
  if (v42)
  {
    if (v23)
    {
      PBUIWallpaperBackdropParametersMakeIdentity((uint64_t)v51);
      -[PBUIWallpaperView _cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:](self, "_cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:", v51, 0, v45, 1.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    v49[0] = v26;
    v49[1] = 3221225472;
    v49[2] = __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke_2;
    v49[3] = &unk_1E6B948F0;
    v49[4] = self;
    v32 = v31;
    v50 = v32;
    -[PBUIStaticWallpaperView _generateImageForImage:cacheKey:options:downsampleFactor:needsDimmingTreatment:needsInactiveAppearanceTreatment:averageColorProvider:generationHandler:](self, "_generateImageForImage:cacheKey:options:downsampleFactor:needsDimmingTreatment:needsInactiveAppearanceTreatment:averageColorProvider:generationHandler:", v7, v32, a4, v28, v29, v27, 1.0, v49);

  }
  -[PBUIStaticWallpaperView _computeAverageColor](self, "_computeAverageColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperView resetLegibilitySettingsForAverageColor:](self, "resetLegibilitySettingsForAverageColor:", v33);

  v34 = (void *)objc_msgSend(objc_alloc((Class)getPUIColorStatisticsClass()), "initWithDelegate:", 0);
  -[PBUIStaticWallpaperView colorBoxes](self, "colorBoxes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "updateWithColorBoxes:", v35);

  objc_msgSend(v34, "averageColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
    goto LABEL_31;
  objc_msgSend(v34, "averageColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "_isSimilarToColor:withinPercentage:", v38, 0.00000011920929);

  if (v39)
  {
LABEL_31:
    PBUILogCommon();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(-[PBUIWallpaperView variant](self, "variant"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v58 = 138543362;
      v59 = v41;
      _os_log_impl(&dword_1B71C0000, v40, OS_LOG_TYPE_DEFAULT, "[LegacyPoster displayedImage] displayed image similar to black color for variant %{public}@!!", v58, 0xCu);

    }
  }

  _Block_object_dispose(buf, 8);
}

id __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_computeAverageColor");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return v2;
}

void __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBUILogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(unsigned __int8 *)(a1 + 56);
    PBUIStringForWallpaperVariant(objc_msgSend(*(id *)(a1 + 32), "variant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v3;
    v13 = 2048;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_1B71C0000, v4, OS_LOG_TYPE_DEFAULT, "[LegacyPoster displayedImage] generated sample image %{public}@ at scale factor %f (same as display: %{BOOL}u) for variant %{public}@", (uint8_t *)&v11, 0x26u);

  }
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setSampleImage:", v3);
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "_setDisplayedImage:", v3);
      v8 = *(void **)(a1 + 32);
      +[PBUIWallpaperCache wallpaperCache](PBUIWallpaperCache, "wallpaperCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageURLForKey:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setDisplayedImageURL:", v10);

      objc_msgSend(*(id *)(a1 + 32), "_displayImage:", v3);
      objc_msgSend(*(id *)(a1 + 32), "_updateColorBoxesWithKey:image:", *(_QWORD *)(a1 + 40), v3);
    }
  }

}

{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBUILogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(objc_msgSend(*(id *)(a1 + 32), "variant"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1B71C0000, v4, OS_LOG_TYPE_DEFAULT, "[LegacyPoster displayedImage] generated display image %{public}@ for variant %{public}@", (uint8_t *)&v9, 0x16u);

  }
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setDisplayedImage:", v3);
    v6 = *(void **)(a1 + 32);
    +[PBUIWallpaperCache wallpaperCache](PBUIWallpaperCache, "wallpaperCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageURLForKey:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setDisplayedImageURL:", v8);

    objc_msgSend(*(id *)(a1 + 32), "_displayImage:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_updateColorBoxesWithKey:image:", *(_QWORD *)(a1 + 40), v3);
  }

}

+ (BOOL)isRunningInPreferencesApp
{
  if (isRunningInPreferencesApp_onceToken != -1)
    dispatch_once(&isRunningInPreferencesApp_onceToken, &__block_literal_global_1);
  return isRunningInPreferencesApp___result;
}

void __52__PBUIStaticWallpaperView_isRunningInPreferencesApp__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningInPreferencesApp___result = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Preferences"));

}

- (BOOL)workaround_alwaysForceNoTreatment
{
  void *v2;
  BOOL v3;

  if (!+[PBUIStaticWallpaperView isRunningInPreferencesApp](PBUIStaticWallpaperView, "isRunningInPreferencesApp"))return 0;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (void)_generateImageForImage:(id)a3 cacheKey:(id)a4 options:(unint64_t)a5 downsampleFactor:(double)a6 needsDimmingTreatment:(BOOL)a7 needsInactiveAppearanceTreatment:(BOOL)a8 averageColorProvider:(id)a9 generationHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  char v36;
  _QWORD v37[4];
  void (**v38)(_QWORD);
  char v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43[3];
  BOOL v44;
  BOOL v45;
  id location[2];

  v17 = a3;
  v18 = a4;
  v19 = a9;
  v20 = a10;
  objc_initWeak(location, self);
  v21 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke;
  v40[3] = &unk_1E6B94918;
  objc_copyWeak(v43, location);
  v43[1] = (id)a5;
  v40[4] = self;
  v22 = v17;
  v41 = v22;
  v44 = a8;
  v43[2] = *(id *)&a6;
  v45 = a7;
  v23 = v19;
  v42 = v23;
  v24 = (void (**)(_QWORD))MEMORY[0x1BCCA5978](v40);
  v25 = v24;
  if (v18)
  {
    v33 = v22;
    v26 = a5 & 2;
    v27 = v26 >> 1;
    v37[0] = v21;
    v37[1] = 3221225472;
    v37[2] = __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_2;
    v37[3] = &unk_1E6B94940;
    v39 = v27;
    v38 = v24;
    v28 = (void *)MEMORY[0x1BCCA5978](v37);
    +[PBUIWallpaperCache wallpaperCache](PBUIWallpaperCache, "wallpaperCache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v21;
    v34[1] = 3221225472;
    v34[2] = __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_3;
    v34[3] = &unk_1E6B94990;
    v36 = v27;
    v30 = v20;
    v35 = v30;
    objc_msgSend(v29, "imageForKey:generatingIfNecessaryWithBlock:completion:", v18, v28, v34);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *, BOOL))v30 + 2))(v30, v31, v26 != 0);
    v32 = v38;
    v22 = v33;
  }
  else
  {
    v24[2](v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, uint64_t))v20 + 2))(v20, v32, 1);
  }

  objc_destroyWeak(v43);
  objc_destroyWeak(location);

}

id __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  id v7;
  void *v8;
  PBUIWallpaperLegibilityTreatment *v9;
  PBUICodableImage *v10;
  PBUITreatImageRequest *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "wallpaperDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 64);
  v5 = objc_msgSend(*(id *)(a1 + 32), "workaround_alwaysForceNoTreatment");
  v6 = 0;
  if ((v5 & 1) == 0 && (v4 & 4) == 0)
    v6 = objc_msgSend(WeakRetained, "imageRequiresLuminanceTreatment");
  v7 = *(id *)(a1 + 40);
  if (!v7)
  {
    objc_msgSend(v3, "wallpaperView:wallpaperConfigurationIncludingValueTypes:", WeakRetained, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wallpaperImage");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "setUntreatedWallpaperImage:", v7);
  if (!*(_BYTE *)(a1 + 80))
  {
    if ((v5 & 1) == 0 && ((v6 & 1) != 0 || *(double *)(a1 + 72) > 1.0 || (v4 & 4) == 0 && *(_BYTE *)(a1 + 81)))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(PBUIWallpaperLegibilityTreatment);
      -[PBUIWallpaperLegibilityTreatment setAverageColor:](v9, "setAverageColor:", v17);
      -[PBUIWallpaperLegibilityTreatment setNeedsDimmingTreatment:](v9, "setNeedsDimmingTreatment:", *(unsigned __int8 *)(a1 + 81));
      -[PBUIWallpaperLegibilityTreatment setNeedsLuminanceTreatment:](v9, "setNeedsLuminanceTreatment:", v6);

      if (v9)
        goto LABEL_8;
    }
LABEL_15:
    v16 = v7;
    goto LABEL_16;
  }
  v9 = (PBUIWallpaperLegibilityTreatment *)objc_opt_new();
  if (!v9)
    goto LABEL_15;
LABEL_8:
  v10 = -[PBUICodableImage initWithUIImage:error:]([PBUICodableImage alloc], "initWithUIImage:error:", v7, 0);
  v11 = -[PBUITreatImageRequest initWithImage:downscaleFactor:treatment:]([PBUITreatImageRequest alloc], "initWithImage:downscaleFactor:treatment:", v10, v9, *(double *)(a1 + 72));
  +[PBUICARemoteRenderer remoteRendererIfPossible](PBUICARemoteRenderer, "remoteRendererIfPossible");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "renderRequest:error:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CEA638]);
  -[PBUICodableImage scale](v10, "scale");
  v15 = (void *)objc_msgSend(v14, "_initWithIOSurface:scale:orientation:", v13, 0);
  objc_msgSend(v15, "pbui_CGImageBackedImageUsingDataProvider");
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
  objc_msgSend(v16, "pbui_CGImageBackedImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = MGGetBoolAnswer();
  v5 = 4;
  if (!v4)
    v5 = 0;
  v6 = *a2 | v5;
  *a2 = v6;
  if (!*(_BYTE *)(a1 + 40))
    *a2 = v6 | 1;
  if (MGGetBoolAnswer())
    *a2 |= 2uLL;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v4 = a3;
  if (!*(_BYTE *)(a1 + 40))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_4;
    v5[3] = &unk_1E6B94968;
    v7 = *(id *)(a1 + 32);
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

- (id)cacheUniqueIdentifier
{
  void *v2;
  void *v3;

  -[PBUIStaticWallpaperView displayedImageHashString](self, "displayedImageHashString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PBUIStaticWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  PBUIStaticWallpaperView *v18;
  PBUIStaticWallpaperView *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PBUIStaticWallpaperView;
  v18 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v21, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, a6, a7, a8, x, y, width, height);
  v19 = v18;
  if (v18)
  {
    *(_QWORD *)&v18->_overallContrast = PBUIWallpaperViewUnknownContrast;
    v18->_needsInactiveAppearanceTreatment = objc_msgSend(v17, "needsInactiveAppearanceTreatment");
    -[PBUIStaticWallpaperView _setupWallpaperImageFromConfiguration:options:](v19, "_setupWallpaperImageFromConfiguration:options:", v17, a8);
    -[PBUIStaticWallpaperView _setupContentViewWithOptions:](v19, "_setupContentViewWithOptions:", a8);
  }

  return v19;
}

- (void)preheatImageData
{
  void *v3;
  void *v4;
  void *v5;
  _BYTE v6[64];

  -[PBUIStaticWallpaperView traitCollection](self, "traitCollection", *(double *)PBUIWallpaperBackdropParametersMakeIdentity((uint64_t)v6).i64);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperView _cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:](self, "_cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:", v6, 0, v3, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PBUIWallpaperCache wallpaperCache](PBUIWallpaperCache, "wallpaperCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "warmupForKey:", v4);

}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  char v13;

  v5 = a3;
  objc_msgSend(v5, "wallpaperImageHashData");
  v6 = objc_claimAutoreleasedReturnValue();
  -[PBUIStaticWallpaperView displayedImageHashData](self, "displayedImageHashData");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[PBUIWallpaperView wallpaperMode](self, "wallpaperMode");
  objc_msgSend(v5, "wallpaperOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "wallpaperMode");

  if (v8 == v10
    && (v11 = -[PBUIWallpaperView needsWallpaperDimmingTreatment](self, "needsWallpaperDimmingTreatment"),
        v11 == objc_msgSend(v5, "needsWallpaperDimmingTreatment"))
    && (v12 = -[PBUIStaticWallpaperView needsInactiveAppearanceTreatment](self, "needsInactiveAppearanceTreatment"),
        v12 == objc_msgSend(v5, "needsInactiveAppearanceTreatment"))
    && v6 | v7)
  {
    v13 = BSEqualObjects();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)allowsParallax
{
  return 1;
}

+ (BOOL)_allowsRasterization
{
  return 0;
}

- (id)_computeAverageColor
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PBUIStaticWallpaperView _imageSize](self, "_imageSize");
  return -[PBUIStaticWallpaperView _averageColorInContentViewRect:smudgeRadius:](self, "_averageColorInContentViewRect:smudgeRadius:", v3, v4, v5, v6, 0.0);
}

- (BOOL)hasContentOutsideVisibleBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v13;
  CGRect v14;

  -[PBUIStaticWallpaperView _displayedImage](self, "_displayedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  -[PBUIStaticWallpaperView bounds](self, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  if (round(v5) <= round(CGRectGetWidth(v13)))
    return 0;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  return round(v7) > round(CGRectGetHeight(v14));
}

- (void)setContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__PBUIStaticWallpaperView_setContentsRect___block_invoke;
    v11[3] = &unk_1E6B949B8;
    v11[4] = self;
    *(double *)&v11[5] = x;
    *(double *)&v11[6] = y;
    *(double *)&v11[7] = width;
    *(double *)&v11[8] = height;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__PBUIStaticWallpaperView_setContentsRect___block_invoke_2;
    v10[3] = &unk_1E6B949E0;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v11, v10, 0.0);
  }
  else
  {
    -[PBUIWallpaperView contentView](self, "contentView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentsRect:", x, y, width, height);

  }
}

void __43__PBUIStaticWallpaperView_setContentsRect___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_beginDisallowRasterizationBlock");
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentsRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

uint64_t __43__PBUIStaticWallpaperView_setContentsRect___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endDisallowRasterizationBlock");
}

- (BOOL)imageRequiresLuminanceTreatment
{
  void *v2;
  uint64_t v3;

  -[PBUIWallpaperView legibilitySettings](self, "legibilitySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  return v3 != 2;
}

- (double)contrast
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  -[PBUIStaticWallpaperView _wallpaperImageForAnalysis](self, "_wallpaperImageForAnalysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  -[PBUIStaticWallpaperView colorBoxes](self, "colorBoxes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = soft_PUICalculateContrastFromColorBoxes(v8, 0, 0, 0.0, 0.0, v5, v7);

  return v9;
}

- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  double result;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PBUIWallpaperView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v14.receiver = self;
    v14.super_class = (Class)PBUIStaticWallpaperView;
    -[PBUIWallpaperView contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:](&v14, sel_contrastInRect_contrastWithinBoxes_contrastBetweenBoxes_, a4, a5, x, y, width, height);
  }
  else
  {
    -[PBUIStaticWallpaperView _contrastInContentViewRect:contrastWithinBoxes:contrastBetweenBoxes:](self, "_contrastInContentViewRect:contrastWithinBoxes:contrastBetweenBoxes:", a4, a5, x, y, width, height);
  }
  return result;
}

- (double)_contrastInContentViewRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  double v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PBUIStaticWallpaperView colorBoxes](self, "colorBoxes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = soft_PUICalculateContrastFromColorBoxes(v11, (uint64_t)a4, (uint64_t)a5, x, y, width, height);

  return v12;
}

- (id)_averageColorInContentViewRect:(CGRect)a3 smudgeRadius:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PBUIStaticWallpaperView colorBoxes](self, "colorBoxes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  soft_PUIAverageColorFromColorBoxes(v9, x, y, width, height, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setCropRect:(CGRect)a3 zoomScale:(double)a4
{
  -[PBUIWallpaperView setZoomFactor:](self, "setZoomFactor:", a4, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)handlesInactiveAppearanceTreatment
{
  return 1;
}

- (void)_setupContentViewWithOptions:(unint64_t)a3
{
  PBUIStaticWallpaperImageView *v4;
  void *v5;
  PBUIStaticWallpaperImageView *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  PBUIStaticWallpaperImageView *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = [PBUIStaticWallpaperImageView alloc];
  -[PBUIStaticWallpaperView _displayedImage](self, "_displayedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBUIStaticWallpaperImageView initWithImage:](v4, "initWithImage:", v5);

  -[PBUIStaticWallpaperImageView setOpaque:](v6, "setOpaque:", 1);
  -[PBUIStaticWallpaperImageView layer](v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentsOpaque:", 1);

  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[PBUIStaticWallpaperView _displayedImage](self, "_displayedImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_INFO, "set up content view %{public}@ with image %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[PBUIStaticWallpaperView _setUpStaticImageContentView:](self, "_setUpStaticImageContentView:", v6);
  -[PBUIWallpaperView setContentView:](self, "setContentView:", v6);

}

- (void)_displayImage:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  -[PBUIWallpaperView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "setImage:", v9);
    objc_msgSend(v9, "size");
    objc_msgSend(v4, "setBounds:", 0.0, 0.0, v7, v8);
  }

}

- (float)_zoomScale
{
  return 1.0;
}

- (CGSize)_imageSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PBUIStaticWallpaperView wallpaperImage](self, "wallpaperImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_createColorBoxes
{
  void *v3;
  void *v4;

  v3 = 0;
  if ((soft_PUIFeatureEnabled(0) & 1) == 0)
  {
    -[PBUIStaticWallpaperView _wallpaperImageForAnalysis](self, "_wallpaperImageForAnalysis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getPUIColorBoxesClass(), "colorBoxesForImage:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_updateColorBoxesWithKey:(id)a3 image:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_msgSend(a4, "pbui_CGImageBackedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBUIWallpaperCache wallpaperCache](PBUIWallpaperCache, "wallpaperCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorBoxesForKey:generatingIfNeceesaryFromImage:", v9, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBUIStaticWallpaperView setColorBoxes:](self, "setColorBoxes:", v8);
  }
  else
  {
    -[PBUIStaticWallpaperView _createColorBoxes](self, "_createColorBoxes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIStaticWallpaperView setColorBoxes:](self, "setColorBoxes:", v6);
  }

}

- (void)setColorBoxes:(id)a3
{
  double v5;
  PUIColorBoxes *v6;

  v6 = (PUIColorBoxes *)a3;
  if (self->_colorBoxes != v6)
  {
    objc_storeStrong((id *)&self->_colorBoxes, a3);
    -[PUIColorBoxes contrast](v6, "contrast");
    self->_overallContrast = v5;
  }

}

- (PUIColorBoxes)colorBoxes
{
  PUIColorBoxes *colorBoxes;
  void *v4;

  colorBoxes = self->_colorBoxes;
  if (!colorBoxes)
  {
    -[PBUIStaticWallpaperView _createColorBoxes](self, "_createColorBoxes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIStaticWallpaperView setColorBoxes:](self, "setColorBoxes:", v4);

    colorBoxes = self->_colorBoxes;
  }
  return colorBoxes;
}

- (UIImage)_displayedImage
{
  return self->_displayedImage;
}

- (void)_setDisplayedImage:(id)a3
{
  objc_storeStrong((id *)&self->_displayedImage, a3);
}

- (NSURL)_displayedImageURL
{
  return self->_displayedImageURL;
}

- (void)_setDisplayedImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_displayedImageURL, a3);
}

- (UIImage)_sampleImage
{
  return self->_sampleImage;
}

- (void)_setSampleImage:(id)a3
{
  objc_storeStrong((id *)&self->_sampleImage, a3);
}

- (NSData)displayedImageHashData
{
  return self->_displayedImageHashData;
}

- (void)setDisplayedImageHashData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (NSString)displayedImageHashString
{
  return self->_displayedImageHashString;
}

- (void)setDisplayedImageHashString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (BOOL)needsInactiveAppearanceTreatment
{
  return self->_needsInactiveAppearanceTreatment;
}

- (void)setNeedsInactiveAppearanceTreatment:(BOOL)a3
{
  self->_needsInactiveAppearanceTreatment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedImageHashString, 0);
  objc_storeStrong((id *)&self->_displayedImageHashData, 0);
  objc_storeStrong((id *)&self->_sampleImage, 0);
  objc_storeStrong((id *)&self->_displayedImageURL, 0);
  objc_storeStrong((id *)&self->_displayedImage, 0);
  objc_storeStrong((id *)&self->_colorBoxes, 0);
}

@end
