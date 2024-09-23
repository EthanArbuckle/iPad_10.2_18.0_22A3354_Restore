@implementation SearchUIMultiResultRowModel

- (NSArray)multiResults
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (SearchUIMultiResultRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  SearchUIMultiResultRowModel *v7;
  SearchUIMultiResultRowModel *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIMultiResultRowModel;
  v7 = -[SearchUIRowModel initWithResults:itemIdentifier:](&v10, sel_initWithResults_itemIdentifier_, v6, a4);
  v8 = v7;
  if (v7)
    -[SearchUIMultiResultRowModel setMultiResults:](v7, "setMultiResults:", v6);

  return v8;
}

- (void)setMultiResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (BOOL)fillsBackgroundWithContent
{
  return 1;
}

- (int)separatorStyle
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return 0;
}

- (Class)collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (int64_t)removeResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[SearchUIMultiResultRowModel multiResults](self, "multiResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(v6, "indexOfObject:", v4);
  objc_msgSend(v6, "removeObject:", v4);

  -[SearchUIMultiResultRowModel setMultiResults:](self, "setMultiResults:", v6);
  return v7;
}

- (BOOL)isTappable
{
  void *v2;
  BOOL v3;

  -[SearchUIMultiResultRowModel results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 1;

  return v3;
}

- (id)dragAppBundleID
{
  void *v3;
  void *v4;
  void *v5;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLocalApplicationResult"))
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isFocusable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiResults, 0);
}

@end
