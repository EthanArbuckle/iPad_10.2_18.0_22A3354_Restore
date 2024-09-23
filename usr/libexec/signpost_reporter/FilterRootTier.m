@implementation FilterRootTier

- (FilterRootTier)init
{
  FilterRootTier *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FilterRootTier;
  v2 = -[FilterRootTier init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FilterTier setChildTiers:](v2, "setChildTiers:", v3);

  }
  return v2;
}

- (id)keyForChildren:(id)a3
{
  return objc_msgSend(a3, "subsystem");
}

- (id)newChildInstance
{
  return objc_alloc_init(FilterSubsystemTier);
}

@end
