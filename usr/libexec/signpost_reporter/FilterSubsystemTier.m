@implementation FilterSubsystemTier

- (FilterSubsystemTier)init
{
  FilterSubsystemTier *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FilterSubsystemTier;
  v2 = -[FilterSubsystemTier init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FilterTier setChildTiers:](v2, "setChildTiers:", v3);

  }
  return v2;
}

- (id)keyForChildren:(id)a3
{
  return objc_msgSend(a3, "category");
}

- (id)newChildInstance
{
  return objc_alloc_init(FilterCategoryTier);
}

@end
