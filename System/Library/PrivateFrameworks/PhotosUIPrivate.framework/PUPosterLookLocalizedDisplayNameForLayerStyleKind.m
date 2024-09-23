@implementation PUPosterLookLocalizedDisplayNameForLayerStyleKind

void __PUPosterLookLocalizedDisplayNameForLayerStyleKind_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[11];
  _QWORD v14[13];

  v14[11] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D75600];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_ORIGINAL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v13[1] = *MEMORY[0x1E0D75608];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_STUDIO"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v0;
  v13[2] = *MEMORY[0x1E0D755B8];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_BLACK_AND_WHITE"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v1;
  v13[3] = *MEMORY[0x1E0D755B0];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_BLACK_AND_WHITE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v2;
  v13[4] = *MEMORY[0x1E0D755C8];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_COLOR_BACKDROP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v3;
  v13[5] = *MEMORY[0x1E0D755D8];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_COLOR_WASH"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v4;
  v13[6] = *MEMORY[0x1E0D755D0];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_COLOR_WASH_DUOTONE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v5;
  v13[7] = *MEMORY[0x1E0D755E0];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_GREEN_SCREEN"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v6;
  v13[8] = *MEMORY[0x1E0D755F8];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_GREEN_SCREEN_MONO"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v7;
  v13[9] = *MEMORY[0x1E0D755E8];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_GREEN_SCREEN_BLUR"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v8;
  v13[10] = *MEMORY[0x1E0D755F0];
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_LOOK_GREEN_SCREEN_GRAPHIC"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)PUPosterLookLocalizedDisplayNameForLayerStyleKind_displayNamesByStyleKind;
  PUPosterLookLocalizedDisplayNameForLayerStyleKind_displayNamesByStyleKind = v10;

}

@end
