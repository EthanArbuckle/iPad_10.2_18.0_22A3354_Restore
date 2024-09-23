@implementation TUResultGroup

- (TUResultGroup)initWithTitle:(id)a3 results:(id)a4
{
  id v6;
  id v7;
  TUResultGroup *v8;
  TUGroupTitle *v9;
  TUGroupTitle *title;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUResultGroup;
  v8 = -[TUResultGroup init](&v12, sel_init);
  if (v8)
  {
    if (objc_msgSend(v6, "length"))
    {
      v9 = -[TUGroupTitle initWithString:]([TUGroupTitle alloc], "initWithString:", v6);
      title = v8->_title;
      v8->_title = v9;

    }
    objc_storeStrong((id *)&v8->_resultsCache, a4);
  }

  return v8;
}

- (void)removeSearchItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUResultGroup resultsCache](self, "resultsCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_title);
    objc_storeStrong(v5 + 2, self->_resultsCache);
  }
  return v5;
}

- (unint64_t)groupType
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;

  -[TUResultGroup results](self, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 0;
  -[TUResultGroup results](self, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
    return 1;
  -[TUResultGroup results](self, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
    return 2;
  else
    return 0;
}

- (TUGroupTitle)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSMutableArray)resultsCache
{
  return self->_resultsCache;
}

- (void)setResultsCache:(id)a3
{
  objc_storeStrong((id *)&self->_resultsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsCache, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
