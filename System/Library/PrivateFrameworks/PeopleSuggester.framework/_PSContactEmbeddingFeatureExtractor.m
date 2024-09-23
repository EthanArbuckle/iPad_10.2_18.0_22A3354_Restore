@implementation _PSContactEmbeddingFeatureExtractor

- (id)featureInputForContact:(id)a3
{
  id v3;
  _PSFamilyFeatureExtractor *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_PSFamilyFeatureExtractor);
  -[_PSFamilyFeatureExtractor featureInputForContact:](v4, "featureInputForContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)featureInputsForContacts:(id)a3
{
  id v3;
  _PSFamilyFeatureExtractor *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_PSFamilyFeatureExtractor);
  -[_PSFamilyFeatureExtractor featureInputsForContacts:](v4, "featureInputsForContacts:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
