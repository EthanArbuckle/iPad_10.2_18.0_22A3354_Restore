@implementation FilterCategoryTier

- (FilterCategoryTier)init
{
  FilterCategoryTier *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FilterCategoryTier;
  v2 = -[FilterCategoryTier init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FilterTier setChildTiers:](v2, "setChildTiers:", v3);

  }
  return v2;
}

- (id)keyForChildren:(id)a3
{
  return objc_msgSend(a3, "name");
}

- (id)newChildInstance
{
  return objc_alloc_init(FilterNameTier);
}

@end
