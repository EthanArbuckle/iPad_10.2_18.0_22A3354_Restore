@implementation REIntrinsicFeatureSet

void __REIntrinsicFeatureSet_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[REFeatureSet featureSet](REMutableFeatureSet, "featureSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[REFeature forcedFeature](REFeature, "forcedFeature");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFeature:", v0);

  +[REFeature groupFeature](REFeature, "groupFeature");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFeature:", v1);

  +[REFeature relevanceThresholdFeature](REFeature, "relevanceThresholdFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFeature:", v2);

  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)REIntrinsicFeatureSet_IntrinsicFeatures;
  REIntrinsicFeatureSet_IntrinsicFeatures = v3;

}

@end
