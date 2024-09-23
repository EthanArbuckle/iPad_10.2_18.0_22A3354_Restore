@implementation PXBadgeHelper

+ (UIImageSymbolConfiguration)miniSymbolConfiguration
{
  if (miniSymbolConfiguration_onceToken != -1)
    dispatch_once(&miniSymbolConfiguration_onceToken, &__block_literal_global_186560);
  return (UIImageSymbolConfiguration *)(id)miniSymbolConfiguration_miniSymbolConfiguration;
}

+ (UIImageSymbolConfiguration)smallSymbolConfiguration
{
  if (smallSymbolConfiguration_onceToken != -1)
    dispatch_once(&smallSymbolConfiguration_onceToken, &__block_literal_global_12_186559);
  return (UIImageSymbolConfiguration *)(id)smallSymbolConfiguration_smallSymbolConfiguration;
}

+ (UIImageSymbolConfiguration)mediumSymbolConfiguration
{
  if (mediumSymbolConfiguration_onceToken != -1)
    dispatch_once(&mediumSymbolConfiguration_onceToken, &__block_literal_global_13_186558);
  return (UIImageSymbolConfiguration *)(id)mediumSymbolConfiguration_mediumSymbolConfiguration;
}

+ (UIImageSymbolConfiguration)largeSymbolConfiguration
{
  if (largeSymbolConfiguration_onceToken != -1)
    dispatch_once(&largeSymbolConfiguration_onceToken, &__block_literal_global_14_186556);
  return (UIImageSymbolConfiguration *)(id)largeSymbolConfiguration_largeSymbolConfiguration;
}

+ (UIImageSymbolConfiguration)mediumBodySymbolConfiguration
{
  if (mediumBodySymbolConfiguration_onceToken != -1)
    dispatch_once(&mediumBodySymbolConfiguration_onceToken, &__block_literal_global_15_186555);
  return 0;
}

+ (UIImageSymbolConfiguration)smallBodySymbolConfiguration
{
  if (smallBodySymbolConfiguration_onceToken != -1)
    dispatch_once(&smallBodySymbolConfiguration_onceToken, &__block_literal_global_16_186554);
  return 0;
}

+ (UIImage)gradientImage
{
  if (gradientImage_onceToken != -1)
    dispatch_once(&gradientImage_onceToken, &__block_literal_global_17_186551);
  return (UIImage *)(id)gradientImage_image;
}

+ (UIImage)livePhotoBadgeShadowedImage
{
  if (livePhotoBadgeShadowedImage_onceToken != -1)
    dispatch_once(&livePhotoBadgeShadowedImage_onceToken, &__block_literal_global_21_186548);
  return (UIImage *)(id)livePhotoBadgeShadowedImage_image;
}

+ (UIImage)spatialBadgeImage
{
  if (spatialBadgeImage_onceToken != -1)
    dispatch_once(&spatialBadgeImage_onceToken, &__block_literal_global_24_186545);
  return (UIImage *)(id)spatialBadgeImage_image;
}

+ (UIImage)loopingBadgeImage
{
  if (loopingBadgeImage_onceToken != -1)
    dispatch_once(&loopingBadgeImage_onceToken, &__block_literal_global_29);
  return (UIImage *)(id)loopingBadgeImage_image;
}

+ (UIImage)loopingBadgeTemplateImage
{
  if (loopingBadgeTemplateImage_onceToken != -1)
    dispatch_once(&loopingBadgeTemplateImage_onceToken, &__block_literal_global_32_186542);
  return (UIImage *)(id)loopingBadgeTemplateImage_image;
}

+ (UIImage)cloudBadgeImage
{
  if (cloudBadgeImage_onceToken != -1)
    dispatch_once(&cloudBadgeImage_onceToken, &__block_literal_global_33_186539);
  return (UIImage *)(id)cloudBadgeImage_image;
}

+ (UIImage)sharedLibraryBadgeImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[PXBadgeHelper smallSymbolConfiguration](PXBadgeHelper, "smallSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "px_systemImageNamed:", CFSTR("person.2.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithSymbolConfiguration:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_tintedImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (UIImage)autoReframingImage
{
  if (autoReframingImage_onceToken != -1)
    dispatch_once(&autoReframingImage_onceToken, &__block_literal_global_38);
  return (UIImage *)(id)autoReframingImage_image;
}

void __35__PXBadgeHelper_autoReframingImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXAutoReframingBadge"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)autoReframingImage_image;
  autoReframingImage_image = v0;

}

void __32__PXBadgeHelper_cloudBadgeImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("icloud.fill"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cloudBadgeImage_image;
  cloudBadgeImage_image = v0;

  v2 = (void *)cloudBadgeImage_image;
  +[PXBadgeHelper smallSymbolConfiguration](PXBadgeHelper, "smallSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithSymbolConfiguration:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)cloudBadgeImage_image;
  cloudBadgeImage_image = v4;

  v6 = (void *)cloudBadgeImage_image;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_tintedImageWithColor:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)cloudBadgeImage_image;
  cloudBadgeImage_image = v7;

}

void __42__PXBadgeHelper_loopingBadgeTemplateImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXAssetsSceneBadgeLoop"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)loopingBadgeTemplateImage_image;
  loopingBadgeTemplateImage_image = v0;

  objc_msgSend((id)loopingBadgeTemplateImage_image, "imageWithRenderingMode:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)loopingBadgeTemplateImage_image;
  loopingBadgeTemplateImage_image = v2;

}

void __34__PXBadgeHelper_loopingBadgeImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXAssetsSceneBadgeLoop"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)loopingBadgeImage_image;
  loopingBadgeImage_image = v0;

}

void __34__PXBadgeHelper_spatialBadgeImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("spatial"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spatialBadgeImage_image;
  spatialBadgeImage_image = v0;

  v2 = (void *)spatialBadgeImage_image;
  +[PXBadgeHelper mediumSymbolConfiguration](PXBadgeHelper, "mediumSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithSymbolConfiguration:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)spatialBadgeImage_image;
  spatialBadgeImage_image = v4;

  v6 = (void *)spatialBadgeImage_image;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_tintedImageWithColor:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)spatialBadgeImage_image;
  spatialBadgeImage_image = v7;

}

void __44__PXBadgeHelper_livePhotoBadgeShadowedImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXAssetsSceneBadgeOverContentLivePhotoOn"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)livePhotoBadgeShadowedImage_image;
  livePhotoBadgeShadowedImage_image = v0;

  objc_msgSend((id)livePhotoBadgeShadowedImage_image, "imageWithRenderingMode:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)livePhotoBadgeShadowedImage_image;
  livePhotoBadgeShadowedImage_image = v2;

}

void __30__PXBadgeHelper_gradientImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXAssetsSceneBadgeBannerGradient"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gradientImage_image;
  gradientImage_image = v0;

}

void __41__PXBadgeHelper_largeSymbolConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)largeSymbolConfiguration_largeSymbolConfiguration;
  largeSymbolConfiguration_largeSymbolConfiguration = v0;

}

void __42__PXBadgeHelper_mediumSymbolConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mediumSymbolConfiguration_mediumSymbolConfiguration;
  mediumSymbolConfiguration_mediumSymbolConfiguration = v0;

}

void __41__PXBadgeHelper_smallSymbolConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)smallSymbolConfiguration_smallSymbolConfiguration;
  smallSymbolConfiguration_smallSymbolConfiguration = v0;

}

void __40__PXBadgeHelper_miniSymbolConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 11.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)miniSymbolConfiguration_miniSymbolConfiguration;
  miniSymbolConfiguration_miniSymbolConfiguration = v0;

}

+ (PXAssetBadgeInfo)topLeftPrimaryBadgeInfoForBadgeInfo:(SEL)a3
{
  *(_OWORD *)&retstr->badges = 0u;
  *(_OWORD *)&retstr->count = 0u;
  return (PXAssetBadgeInfo *)PXAssetBadgeInfoCreateWithBadges();
}

+ (PXAssetBadgeInfo)topLeftSecondaryBadgeInfoForBadgeInfo:(SEL)a3
{
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  PXAssetBadgeInfo *result;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v7 = *(_OWORD *)&a4->count;
  v13 = *(_OWORD *)&a4->badges;
  v14 = v7;
  objc_msgSend(a2, "topLeftPrimaryBadgeInfoForBadgeInfo:", &v13);
  v8 = v15;
  v9 = *(_OWORD *)&a4->count;
  v13 = *(_OWORD *)&a4->badges;
  v14 = v9;
  result = (PXAssetBadgeInfo *)objc_msgSend(a2, "topRightBadgeInfoForBadgeInfo:", &v13);
  a4->badges &= ~(v12 | v8);
  v11 = *(_OWORD *)&a4->count;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&a4->badges;
  *(_OWORD *)&retstr->count = v11;
  return result;
}

+ (PXAssetBadgeInfo)topRightBadgeInfoForBadgeInfo:(SEL)a3
{
  *(_OWORD *)&retstr->badges = 0u;
  *(_OWORD *)&retstr->count = 0u;
  return (PXAssetBadgeInfo *)PXAssetBadgeInfoCreateWithBadges();
}

+ (id)imageForBadgeInfo:(PXAssetBadgeInfo *)a3 style:(int64_t)a4 isOverContent:(BOOL)a5
{
  unint64_t badges;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  badges = a3->badges;
  if (a4 == 1 && (badges & 0x380) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "loopingBadgeTemplateImage");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 5 || ((badges & 0x40) != 0 ? (v7 = !a5) : (v7 = 1), v7))
    {
      v9 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend((id)objc_opt_class(), "systemImageNameForBadges:", a3->badges);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_systemImageNamed:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
    objc_msgSend((id)objc_opt_class(), "livePhotoBadgeShadowedImage");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;
  return v8;
}

+ (id)systemImageNameForBadges:(unint64_t)a3
{
  const __CFString *v4;
  const __CFString *v5;

  if ((a3 & 4) != 0)
    return CFSTR("square.stack.3d.up");
  if ((a3 & 0x400) != 0)
    return CFSTR("tv");
  if ((a3 & 8) != 0)
    return CFSTR("square.stack.3d.down.right");
  if ((a3 & 0x40) != 0)
  {
    v4 = CFSTR("livephoto.portrait");
    v5 = CFSTR("livephoto.slash");
    if ((a3 & 0x1000000) == 0)
      v5 = CFSTR("livephoto");
    if ((a3 & 0x10) == 0)
      v4 = v5;
    if ((~(_DWORD)a3 & 0x1000010) != 0)
      return (id)v4;
    else
      return CFSTR("livephoto.slash.portrait");
  }
  else if ((a3 & 0x200) != 0)
  {
    return CFSTR("livephoto.long.exposure");
  }
  else if ((a3 & 0x80) != 0)
  {
    return CFSTR("livephoto.loop");
  }
  else if ((a3 & 0x100) != 0)
  {
    return CFSTR("livephoto.bounce");
  }
  else if ((a3 & 0x10) != 0)
  {
    return CFSTR("f.cursive.circle");
  }
  else if ((a3 & 0x8000000000) != 0)
  {
    return CFSTR("person.2.fill");
  }
  else if ((a3 & 0x4000000000) != 0)
  {
    return CFSTR("person.fill");
  }
  else if ((a3 & 0x800000000) != 0)
  {
    return CFSTR("cinematic.video");
  }
  else if ((a3 & 0x200000E0000) == 0x20000000000)
  {
    return CFSTR("spatial");
  }
  else
  {
    return 0;
  }
}

+ (id)textForBadgeInfo:(PXAssetBadgeInfo *)a3 style:(int64_t)a4
{
  unint64_t badges;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  badges = a3->badges;
  if ((a3->badges & 0x404) != 0)
    goto LABEL_2;
  if ((badges & 8) != 0)
  {
    PXLocalizedStringFromTable(CFSTR("AVALANCHE_BADGE_TEXT"), CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v6, CFSTR("%ld"));
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if ((badges & 0x3C0) == 0)
  {
    if ((badges & 0x10) == 0 && (badges & 0x20000) == 0 && (badges & 0x40000) == 0 && (badges & 0x80000) == 0)
    {
      if ((badges & 0x400000000) != 0)
      {
        PXLocalizedStringFromTable(CFSTR("PXInfoPanelEXIFVideoProResBadge"), CFSTR("PhotosUICore"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        return v8;
      }
      if ((badges & 0x800000000) == 0 && (badges & 0x20000000000) == 0)
      {
        v8 = 0;
        return v8;
      }
    }
    goto LABEL_2;
  }
  v8 = 0;
  if ((unint64_t)a4 <= 6 && ((1 << a4) & 0x58) != 0)
  {
    if ((badges & 0x80) == 0 && (badges & 0x100) == 0 && (badges & 0x200) == 0 && (badges & 0x10) != 0)
    {
      PLServicesLivePortraitLocalizedFrameworkString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
LABEL_2:
    PLLocalizedFrameworkString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v6 = v5;
    objc_msgSend(v5, "localizedUppercaseString");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v8 = (void *)v7;

  }
  return v8;
}

+ (UIImage)favoriteBadgeImage
{
  void *v2;
  void *v3;

  +[PXBadgeHelper smallSymbolConfiguration](PXBadgeHelper, "smallSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper _favoriteBadgeImageWithSymbolConfiguration:](PXBadgeHelper, "_favoriteBadgeImageWithSymbolConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (UIImage)favoriteBadgeImageMini
{
  void *v2;
  void *v3;

  +[PXBadgeHelper miniSymbolConfiguration](PXBadgeHelper, "miniSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper _favoriteBadgeImageWithSymbolConfiguration:](PXBadgeHelper, "_favoriteBadgeImageWithSymbolConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (UIImage)favoritesCollectionBadgeImage
{
  void *v2;
  void *v3;

  +[PXBadgeHelper mediumSymbolConfiguration](PXBadgeHelper, "mediumSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper _favoriteBadgeImageWithSymbolConfiguration:](PXBadgeHelper, "_favoriteBadgeImageWithSymbolConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (id)_favoriteBadgeImageWithSymbolConfiguration:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  objc_msgSend(v3, "systemImageNamed:", CFSTR("heart.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithSymbolConfiguration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_tintedImageWithColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (UIImage)panoramaBadgeImage
{
  if (panoramaBadgeImage_onceToken != -1)
    dispatch_once(&panoramaBadgeImage_onceToken, &__block_literal_global_295377);
  return (UIImage *)(id)panoramaBadgeImage_panoBadgeImage;
}

+ (UIImage)panoramaBadgeImageMini
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pano.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper miniSymbolConfiguration](PXBadgeHelper, "miniSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithSymbolConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_tintedImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (UIImage)contentSyndicationBadgeImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("message"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper smallSymbolConfiguration](PXBadgeHelper, "smallSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithSymbolConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_tintedImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (UIImage)contentSyndicationBadgeImageMini
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("message"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper miniSymbolConfiguration](PXBadgeHelper, "miniSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithSymbolConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_tintedImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (UIImage)contentSyndicationGuestAssetBadgeImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("message"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper smallSymbolConfiguration](PXBadgeHelper, "smallSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithSymbolConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_tintedImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (UIImage)ocrAssetBadgeImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("text.viewfinder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper smallSymbolConfiguration](PXBadgeHelper, "smallSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithSymbolConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_tintedImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (UIImage)sharedLibraryBadgeImageMini
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_systemImageNamed:", CFSTR("person.2.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper miniSymbolConfiguration](PXBadgeHelper, "miniSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithSymbolConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_tintedImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (UIImage)cloudBadgeImageMini
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("icloud.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper miniSymbolConfiguration](PXBadgeHelper, "miniSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithSymbolConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_tintedImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (id)leadingCornerGradientBackgroundImageForLayoutDirection:(int64_t)a3
{
  void *v3;
  void *v4;

  if ((unint64_t)(a3 + 1) > 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", *off_1E5147738[a3 + 1]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)trailingCornerGradientBackgroundImageForLayoutDirection:(int64_t)a3
{
  void *v3;
  void *v4;

  if ((unint64_t)(a3 + 1) > 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", *off_1E5147750[a3 + 1]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)debugBackgroundImageWithBadges:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  CGSize v19;

  v18[3] = *MEMORY[0x1E0C80C00];
  if (debugBackgroundImageWithBadges__onceToken != -1)
    dispatch_once(&debugBackgroundImageWithBadges__onceToken, &__block_literal_global_198_295366);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)debugBackgroundImageWithBadges__cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((a3 & 0x20000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v6;
    }
    v9 = v8;
    if ((a3 & 0x40000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v7;
    }
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 10.0, 2.0);
    v13 = objc_retainAutorelease(v9);
    v18[0] = objc_msgSend(v13, "CGColor");
    v14 = objc_retainAutorelease(v7);
    v18[1] = objc_msgSend(v14, "CGColor", v18[0]);
    v15 = objc_retainAutorelease(v11);
    v18[2] = objc_msgSend(v15, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColors:", v16);

    objc_msgSend(v12, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v12, "setEndPoint:", 1.0, 0.5);
    v19.width = 10.0;
    v19.height = 2.0;
    UIGraphicsBeginImageContext(v19);
    objc_msgSend(v12, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend((id)debugBackgroundImageWithBadges__cache, "setObject:forKey:", v5, v4);

  }
  return v5;
}

void __53__PXBadgeHelper_iOS__debugBackgroundImageWithBadges___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)debugBackgroundImageWithBadges__cache;
  debugBackgroundImageWithBadges__cache = (uint64_t)v0;

}

void __40__PXBadgeHelper_iOS__panoramaBadgeImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pano.fill"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)panoramaBadgeImage_panoBadgeImage;
  panoramaBadgeImage_panoBadgeImage = v0;

  +[PXBadgeHelper smallSymbolConfiguration](PXBadgeHelper, "smallSymbolConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)panoramaBadgeImage_symbolConfig;
  panoramaBadgeImage_symbolConfig = v2;

  objc_msgSend((id)panoramaBadgeImage_panoBadgeImage, "imageWithSymbolConfiguration:", panoramaBadgeImage_symbolConfig);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)panoramaBadgeImage_panoBadgeImage;
  panoramaBadgeImage_panoBadgeImage = v4;

  v6 = (void *)panoramaBadgeImage_panoBadgeImage;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_tintedImageWithColor:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)panoramaBadgeImage_panoBadgeImage;
  panoramaBadgeImage_panoBadgeImage = v7;

}

@end
