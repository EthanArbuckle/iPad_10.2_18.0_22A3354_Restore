@implementation ICStoreFileAssetFairPlayInfo

- (ICStoreFileAssetFairPlayInfo)initWithResponseSinfDictionary:(id)a3
{
  id v4;
  ICStoreFileAssetFairPlayInfo *v5;
  uint64_t v6;
  NSDictionary *responseSinfDictionary;

  v4 = a3;
  v5 = -[ICStoreFileAssetFairPlayInfo init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseSinfDictionary = v5->_responseSinfDictionary;
    v5->_responseSinfDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (int64_t)identifier
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_responseSinfDictionary, "objectForKey:", CFSTR("id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSData)dpInfoData
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_responseSinfDictionary, "objectForKey:", CFSTR("dpInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ICStoreFileAssetFairPlayInfoValueForValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)pinfData
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_responseSinfDictionary, "objectForKey:", CFSTR("pinf"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ICStoreFileAssetFairPlayInfoValueForValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)sinfData
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_responseSinfDictionary, "objectForKey:", CFSTR("sinf"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ICStoreFileAssetFairPlayInfoValueForValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)sinf2Data
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_responseSinfDictionary, "objectForKey:", CFSTR("sinf2"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ICStoreFileAssetFairPlayInfoValueForValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSDictionary)purchaseBundleSinfDictionary
{
  id v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSDictionary objectForKey:](self->_responseSinfDictionary, "objectForKey:", CFSTR("id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[ICStoreFileAssetFairPlayInfo identifier](self, "identifier");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("id"));

  }
  -[ICStoreFileAssetFairPlayInfo dpInfoData](self, "dpInfoData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dpInfo"));
  -[ICStoreFileAssetFairPlayInfo pinfData](self, "pinfData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("pinf"));
  -[ICStoreFileAssetFairPlayInfo sinfData](self, "sinfData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sinf"));
  -[ICStoreFileAssetFairPlayInfo sinf2Data](self, "sinf2Data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sinf2"));

  return (NSDictionary *)v3;
}

- (NSDictionary)responseSinfDictionary
{
  return self->_responseSinfDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseSinfDictionary, 0);
}

@end
