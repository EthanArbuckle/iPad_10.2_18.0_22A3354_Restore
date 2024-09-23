@implementation SXComponentInserterManager

- (SXComponentInserterManager)init
{
  SXComponentInserterManager *v2;
  uint64_t v3;
  NSMutableArray *mutableInserters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXComponentInserterManager;
  v2 = -[SXComponentInserterManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    mutableInserters = v2->_mutableInserters;
    v2->_mutableInserters = (NSMutableArray *)v3;

  }
  return v2;
}

- (NSArray)inserters
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[SXComponentInserterManager mutableInserters](self, "mutableInserters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v4;

  return v5;
}

- (void)addInserter:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[SXComponentInserterManager mutableInserters](self, "mutableInserters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v8);

    if (v5)
    {
      -[SXComponentInserterManager mutableInserters](self, "mutableInserters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v8);

    }
    -[SXComponentInserterManager mutableInserters](self, "mutableInserters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)removeInserter:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXComponentInserterManager mutableInserters](self, "mutableInserters");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (NSMutableArray)mutableInserters
{
  return self->_mutableInserters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableInserters, 0);
}

@end
