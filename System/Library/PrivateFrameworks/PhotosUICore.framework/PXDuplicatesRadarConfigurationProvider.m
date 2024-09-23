@implementation PXDuplicatesRadarConfigurationProvider

- (BOOL)includeAssetImages
{
  return 0;
}

- (BOOL)includeAssetThumbnails
{
  return 1;
}

- (PXRadarConfiguration)radarConfiguration
{
  PXRadarConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(PXRadarConfiguration);
  -[PXRadarConfiguration setComponent:](v2, "setComponent:", 12);
  -[PXRadarConfiguration setClassification:](v2, "setClassification:", 7);
  +[PXFeedbackTapToRadarUtilities defaultDescription](PXFeedbackTapToRadarUtilities, "defaultDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRadarConfiguration setDescription:](v2, "setDescription:", v3);

  -[PXRadarConfiguration setAttachmentsIncludeAnyUserAsset:](v2, "setAttachmentsIncludeAnyUserAsset:", 1);
  -[PXRadarConfiguration setKeywordIDs:](v2, "setKeywordIDs:", &unk_1E53E9960);
  -[PXRadarConfiguration setWantsPhotosDiagnostics:](v2, "setWantsPhotosDiagnostics:", 1);
  return v2;
}

@end
