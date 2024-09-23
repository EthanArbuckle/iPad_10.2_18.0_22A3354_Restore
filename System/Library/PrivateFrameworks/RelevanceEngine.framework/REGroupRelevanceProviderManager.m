@implementation REGroupRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[REFeature groupFeature](REFeature, "groupFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
