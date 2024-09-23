@implementation PXStickersReviewRadarConfigurationProvider

- (BOOL)includeAssetImages
{
  return 1;
}

- (BOOL)includeAssetThumbnails
{
  return 0;
}

- (PXRadarConfiguration)radarConfiguration
{
  PXRadarConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(PXRadarConfiguration);
  -[PXRadarConfiguration setComponent:](v2, "setComponent:", 36);
  -[PXRadarConfiguration setClassification:](v2, "setClassification:", 7);
  +[PXFeedbackTapToRadarUtilities defaultDescription](PXFeedbackTapToRadarUtilities, "defaultDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRadarConfiguration setDescription:](v2, "setDescription:", v3);

  -[PXRadarConfiguration setWantsPhotosDiagnostics:](v2, "setWantsPhotosDiagnostics:", 1);
  return v2;
}

@end
