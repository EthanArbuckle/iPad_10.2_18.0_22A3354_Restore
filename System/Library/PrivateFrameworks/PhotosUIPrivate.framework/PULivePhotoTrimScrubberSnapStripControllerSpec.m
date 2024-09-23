@implementation PULivePhotoTrimScrubberSnapStripControllerSpec

- (id)disabledColor
{
  void *v2;
  void *v3;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoEditingAdjustmentsBarCurrentPositionDisabledMarkerColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentPositionMarkerColor
{
  void *v2;
  void *v3;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoEditingAdjustmentsBarCurrentPositionMarkerColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)originalPositionMarkerColor
{
  void *v2;
  void *v3;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoEditingAdjustmentsBarOriginalPositionMarkerColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)suggestedMarkerColor
{
  void *v2;
  void *v3;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoEditingAdjustmentsBarSuggestedMarkerColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
