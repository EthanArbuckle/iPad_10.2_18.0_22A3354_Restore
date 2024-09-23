@implementation SXActionEngine

- (SXActionEngine)init
{
  SXActionEngine *v2;
  uint64_t v3;
  NSMutableDictionary *additionFactories;
  uint64_t v5;
  NSMutableDictionary *hostNameFactories;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXActionEngine;
  v2 = -[SXActionEngine init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    additionFactories = v2->_additionFactories;
    v2->_additionFactories = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    hostNameFactories = v2->_hostNameFactories;
    v2->_hostNameFactories = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)actionForAddition:(id)a3
{
  id v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v4 && v6)
  {
    -[SXActionEngine additionFactories](self, "additionFactories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "actionForAddition:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)actionForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "scheme"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("action")),
        v6,
        v7))
  {
    -[SXActionEngine hostNameFactories](self, "hostNameFactories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "actionForURL:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)registerFactory:(id)a3 additionType:(Class)a4
{
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a3;
      -[SXActionEngine additionFactories](self, "additionFactories");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v6, v7);

    }
  }
}

- (void)registerFactory:(id)a3 URLHost:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[SXActionEngine hostNameFactories](self, "hostNameFactories");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v6);

    }
  }
}

- (NSMutableDictionary)additionFactories
{
  return self->_additionFactories;
}

- (NSMutableDictionary)hostNameFactories
{
  return self->_hostNameFactories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostNameFactories, 0);
  objc_storeStrong((id *)&self->_additionFactories, 0);
}

@end
