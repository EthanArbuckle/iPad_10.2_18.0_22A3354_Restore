@implementation SXBookmarkManager

- (SXBookmarkManager)init
{
  SXBookmarkManager *v2;
  uint64_t v3;
  NSMutableDictionary *applicators;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXBookmarkManager;
  v2 = -[SXBookmarkManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    applicators = v2->_applicators;
    v2->_applicators = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)registerApplicator:(id)a3 bookmarkType:(Class)a4
{
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a3;
      -[SXBookmarkManager applicators](self, "applicators");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v6, v7);

    }
  }
}

- (void)applyBookmark:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[SXBookmarkManager applicators](self, "applicators");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "applyBookmark:", v4);
  }
}

- (NSMutableDictionary)applicators
{
  return self->_applicators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicators, 0);
}

@end
