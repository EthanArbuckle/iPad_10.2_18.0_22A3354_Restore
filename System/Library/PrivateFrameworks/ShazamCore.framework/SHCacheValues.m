@implementation SHCacheValues

- (SHCacheValues)initWithValues:(id)a3
{
  id v5;
  SHCacheValues *v6;
  SHCacheValues *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHCacheValues;
  v6 = -[SHCacheValues init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cacheValues, a3);

  return v7;
}

- (int64_t)lookupMaxAge
{
  void *v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[SHCacheValues cacheValues](self, "cacheValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("lookupMaxAgeInDays"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v4)
    v5 = v4;
  else
    v5 = 7;

  return v5;
}

- (NSDictionary)cacheValues
{
  return self->_cacheValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheValues, 0);
}

@end
