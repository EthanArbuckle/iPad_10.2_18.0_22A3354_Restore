@implementation FBSMutableSceneSettings(LegacyPoster)

- (void)pb_applyLegacySettings
{
  void *v2;
  int v3;
  uint64_t v4;
  double v5;
  id v6;

  objc_msgSend(a1, "pui_provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("com.apple.PaperBoard.LegacyPoster"));

  if (v3)
  {
    v4 = objc_msgSend(a1, "pb_activeVariant");
    +[PBUIWallpaperDefaults defaults](PBUIWallpaperDefaults, "defaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parallaxFactorForVariant:wallpaperMode:", v4, 0);
    objc_msgSend(a1, "pr_setParallaxEnabled:", v5 > 0.0);

  }
}

@end
