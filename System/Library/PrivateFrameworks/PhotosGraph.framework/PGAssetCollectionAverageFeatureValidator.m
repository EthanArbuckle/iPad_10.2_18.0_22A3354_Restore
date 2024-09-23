@implementation PGAssetCollectionAverageFeatureValidator

- (int64_t)isValidEntity:(id)a3 graph:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  PGFeatureExtractorAssetCollectionAverage *v13;
  int64_t v14;

  v10 = a3;
  v11 = a5;
  -[PGFeatureAggregationValidator _composeFeatureExtractorWithGraph:error:](self, "_composeFeatureExtractorWithGraph:error:", a4, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[PGFeatureExtractorAssetCollectionAverage initWithAssetFeatureExtractor:assetFetchOptionPropertySet:name:]([PGFeatureExtractorAssetCollectionAverage alloc], "initWithAssetFeatureExtractor:assetFetchOptionPropertySet:name:", v12, v11, CFSTR("AssetCollectionAverage"));
    v14 = -[PGFeatureValidator _isValidEntity:featureExtractor:error:](self, "_isValidEntity:featureExtractor:error:", v10, v13, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)featureValidatorType
{
  return 4;
}

@end
