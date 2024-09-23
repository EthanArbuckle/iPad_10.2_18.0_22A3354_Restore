@implementation SBWallpaperLegacyDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenWallpaperIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("kSBProceduralWallpaperHomeDefaultKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenWallpaperOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("kSBProceduralWallpaperHomeOptionsKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenWallpaperWasUserSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("kSBProceduralWallpaperHomeUserSetKey"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenWallpaperIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("kSBProceduralWallpaperLockDefaultKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenWallpaperOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("kSBProceduralWallpaperLockOptionsKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenWallpaperWasUserSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("kSBProceduralWallpaperLockUserSetKey"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenParallaxFactor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("SBWallpaperParallaxFactorHomeScreen"), &unk_1E203B9E8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenZoomScale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("SBWallpaperZoomScaleHomeScreen"), &unk_1E203B9E8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenCropRectString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("SBWallpaperCropRectHomeScreenKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenSupportsCropping");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v13, CFSTR("SBWallpaperScrollHomeScreenKey"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenMagnifyEnabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("SBWallpaperMagnifyHomeScreenKey"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenPortrait");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v15, CFSTR("SBWallpaperPortraitHomeScreenKey"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenWallpaperName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v17, CFSTR("SBWallpaperNameHomeScreenKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenWallpaperKitData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v18, CFSTR("SBWallpaperWallpaperKitDataHomeScreenKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenParallaxFactor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v19, CFSTR("SBWallpaperParallaxFactorLockScreen"), &unk_1E203B9E8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenZoomScale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v20, CFSTR("SBWallpaperZoomScaleLockScreen"), &unk_1E203B9E8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenCropRectString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v21, CFSTR("SBWallpaperCropRectLockScreenKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenSupportsCropping");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v22, CFSTR("SBWallpaperScrollLockScreenKey"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenMagnifyEnabled");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v23, CFSTR("SBWallpaperMagnifyLockScreenKey"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenPortrait");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v24, CFSTR("SBWallpaperPortraitLockScreenKey"), v16, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenHasVideo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v25, CFSTR("SBWallpaperHasVideoKey"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenStillTimeInVideo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v26, CFSTR("SBWallpaperStillTimeInVideoKey"), &unk_1E203AAB0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenWallpaperName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v27, CFSTR("SBWallpaperNameLockScreenKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenWallpaperKitData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v28, CFSTR("SBWallpaperWallpaperKitDataLockScreenKey"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenColorData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v29, CFSTR("SBWallpaperColorLockScreen"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenColorData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v30, CFSTR("SBWallpaperColorHomeScreen"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenColorName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v31, CFSTR("SBWallpaperColorLockScreen"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenColorName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v32, CFSTR("SBWallpaperColorHomeScreen"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenImageHashData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v33, CFSTR("SBWallpaperImageHashLockScreen"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenImageHashData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v34, CFSTR("SBWallpaperImageHashHomeScreen"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lockScreenGradientData");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v35, CFSTR("SBWallpaperGradientLockScreen"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeScreenGradientData");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v36, CFSTR("SBWallpaperGradientHomeScreen"), 0, 1);

}

@end
