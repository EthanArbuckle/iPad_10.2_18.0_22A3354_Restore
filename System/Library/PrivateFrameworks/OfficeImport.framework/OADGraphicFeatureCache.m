@implementation OADGraphicFeatureCache

- (OADGraphicFeatureCache)init
{
  OADGraphicFeatureCache *v2;
  NSMutableArray *v3;
  NSMutableArray *mFeatureUsageArray;
  OITSUNoCopyDictionary *v5;
  OITSUNoCopyDictionary *mFeatureMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADGraphicFeatureCache;
  v2 = -[OADGraphicFeatureCache init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mFeatureUsageArray = v2->mFeatureUsageArray;
    v2->mFeatureUsageArray = v3;

    v5 = objc_alloc_init(OITSUNoCopyDictionary);
    mFeatureMap = v2->mFeatureMap;
    v2->mFeatureMap = v5;

  }
  return v2;
}

- (unint64_t)cacheFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  OADCountedGraphicFeature *v10;

  v4 = a3;
  if (v4)
  {
    -[OITSUNoCopyDictionary objectForKey:](self->mFeatureMap, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      -[OADGraphicFeatureCache countedFeatureAtIndex:](self, "countedFeatureAtIndex:", objc_msgSend(v5, "unsignedIntegerValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "incrementUsageCount");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableArray count](self->mFeatureUsageArray, "count") + 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[OADCountedGraphicFeature initWithFeature:]([OADCountedGraphicFeature alloc], "initWithFeature:", v4);
      -[NSMutableArray addObject:](self->mFeatureUsageArray, "addObject:", v10);

      -[OITSUNoCopyDictionary setObject:forKey:](self->mFeatureMap, "setObject:forKey:", v9, v4);
      v6 = (void *)v9;
    }
    v8 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  NSMutableArray *mFeatureUsageArray;
  OITSUNoCopyDictionary *mFeatureMap;
  objc_super v5;

  mFeatureUsageArray = self->mFeatureUsageArray;
  self->mFeatureUsageArray = 0;

  mFeatureMap = self->mFeatureMap;
  self->mFeatureMap = 0;

  v5.receiver = self;
  v5.super_class = (Class)OADGraphicFeatureCache;
  -[OADGraphicFeatureCache dealloc](&v5, sel_dealloc);
}

- (id)countedFeatureAtIndex:(unint64_t)a3
{
  if (!a3)
    return 0;
  -[NSMutableArray objectAtIndex:](self->mFeatureUsageArray, "objectAtIndex:", a3 - 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)featuresSortedByUsageCount
{
  return (id)-[NSMutableArray sortedArrayUsingSelector:](self->mFeatureUsageArray, "sortedArrayUsingSelector:", sel_compareUsageCount_);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFeatureMap, 0);
  objc_storeStrong((id *)&self->mFeatureUsageArray, 0);
}

@end
