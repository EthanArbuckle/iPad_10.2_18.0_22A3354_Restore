@implementation REForcedRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[REFeature forcedFeature](REFeature, "forcedFeature");
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

- (float)_relevanceForProvider:(id)a3
{
  float result;

  objc_msgSend(a3, "relevance");
  return result;
}

+ (BOOL)_supportsHistoricProviders
{
  return 1;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  return objc_msgSend(a3, "isHistoric");
}

- (float)_relevanceForHistoricProvider:(id)a3
{
  float result;

  objc_msgSend(a3, "relevance");
  return result;
}

@end
