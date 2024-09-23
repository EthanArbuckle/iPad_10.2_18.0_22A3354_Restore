@implementation SSVPlaybackAsset

- (SSVPlaybackAsset)initWithAssetDictionary:(id)a3
{
  id v4;
  SSVPlaybackAsset *v5;
  uint64_t v6;
  NSDictionary *assetDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVPlaybackAsset;
  v5 = -[SSVPlaybackAsset init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assetDictionary = v5->_assetDictionary;
    v5->_assetDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSString)downloadKey
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_assetDictionary, "objectForKey:", CFSTR("downloadKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSString)flavor
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_assetDictionary, "objectForKey:", CFSTR("flavor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSArray)sinfs
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_assetDictionary, "objectForKey:", CFSTR("sinfs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSArray *)v3;
}

- (NSString)URLString
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_assetDictionary, "objectForKey:", CFSTR("URL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SSVPlaybackAsset;
  -[SSVPlaybackAsset description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPlaybackAsset flavor](self, "flavor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPlaybackAsset URLString](self, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [Flavor: %@, URL: %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[SSVPlaybackAsset URLString](self, "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "hash");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVPlaybackAsset;
    v5 = -[SSVPlaybackAsset hash](&v8, sel_hash);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[SSVPlaybackAsset URLString](self, "URLString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)assetDictionary
{
  return self->_assetDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDictionary, 0);
}

@end
