@implementation PGPersonaFeatureValidator

- (int64_t)isValidEntity:(id)a3 graph:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PGFeatureExtractorPhotoLibraryAverage *v14;
  PGFeatureExtractorAssetPhotoLibrary *v15;
  int64_t v16;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  +[PGFeatureExtractorPhotoLibraryAverage resetPreCalculatedFeatureVector](PGFeatureExtractorPhotoLibraryAverage, "resetPreCalculatedFeatureVector");
  -[PGFeatureAggregationValidator _composeFeatureExtractorWithGraph:error:](self, "_composeFeatureExtractorWithGraph:error:", v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[PGFeatureExtractorPhotoLibraryAverage initWithAssetFeatureExtractor:assetFetchOptionPropertySet:]([PGFeatureExtractorPhotoLibraryAverage alloc], "initWithAssetFeatureExtractor:assetFetchOptionPropertySet:", v13, v11);
    v15 = -[PGFeatureExtractorAssetPhotoLibrary initWithPhotoLibraryFeatureExtractor:]([PGFeatureExtractorAssetPhotoLibrary alloc], "initWithPhotoLibraryFeatureExtractor:", v14);
    v16 = -[PGFeatureValidator _isValidEntity:featureExtractor:error:](self, "_isValidEntity:featureExtractor:error:", v10, v15, a6);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)featureValidatorType
{
  return 6;
}

@end
