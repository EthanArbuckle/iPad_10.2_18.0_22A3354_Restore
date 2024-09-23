@implementation PGFacesFromAssetAverageFeatureValidator

- (int64_t)isValidEntity:(id)a3 error:(id *)a4
{
  id v6;
  PGFeatureExtractorFacesFromAssetAverage *v7;
  void *v8;
  PGFeatureExtractorFacesFromAssetAverage *v9;
  int64_t v10;

  v6 = a3;
  v7 = [PGFeatureExtractorFacesFromAssetAverage alloc];
  -[PGFeatureValidator featureExtractor](self, "featureExtractor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGFeatureExtractorFacesFromAssetAverage initWithFaceFeatureExtractor:name:](v7, "initWithFaceFeatureExtractor:name:", v8, CFSTR("FacesAverage"));

  v10 = -[PGFeatureValidator _isValidEntity:featureExtractor:error:](self, "_isValidEntity:featureExtractor:error:", v6, v9, a4);
  return v10;
}

- (int64_t)featureValidatorType
{
  return 3;
}

@end
