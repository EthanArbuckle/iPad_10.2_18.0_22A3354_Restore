@implementation SXRelatedWebViewCache

- (SXRelatedWebViewCache)init
{
  SXRelatedWebViewCache *v2;
  uint64_t v3;
  NSMapTable *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXRelatedWebViewCache;
  v2 = -[SXRelatedWebViewCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMapTable *)v3;

  }
  return v2;
}

- (id)relatedWebViewForBaseURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXRelatedWebViewCache cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)storeRelatedWebView:(id)a3 baseURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    if (v6)
    {
      -[SXRelatedWebViewCache relatedWebViewForBaseURL:](self, "relatedWebViewForBaseURL:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[SXRelatedWebViewCache cache](self, "cache");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v9, v6);

      }
    }
  }

}

- (NSMapTable)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
