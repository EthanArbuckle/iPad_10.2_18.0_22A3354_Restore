@implementation CRLineWrappingContextCache

- (CRLineWrappingContextCache)init
{
  CRLineWrappingContextCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLineWrappingContextCache;
  v2 = -[CRLineWrappingContextCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)contextForLocale:(id)a3
{
  id v4;
  void *v5;
  CRLineWrappingContext *v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[CRLineWrappingContext initWithLocale:]([CRLineWrappingContext alloc], "initWithLocale:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v6, v4);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
