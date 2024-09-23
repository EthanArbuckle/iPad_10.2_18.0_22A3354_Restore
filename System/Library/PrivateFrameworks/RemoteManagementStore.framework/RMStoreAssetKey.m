@implementation RMStoreAssetKey

+ (id)newAssetKey:(id)a3
{
  id v3;
  RMStoreAssetKey *v4;

  v3 = a3;
  v4 = -[RMStoreAssetKey initWithAssetKey:]([RMStoreAssetKey alloc], "initWithAssetKey:", v3);

  return v4;
}

+ (id)newAssetKeyWithAsset:(id)a3
{
  id v3;
  RMStoreAssetKey *v4;

  v3 = a3;
  v4 = -[RMStoreAssetKey initWithAsset:]([RMStoreAssetKey alloc], "initWithAsset:", v3);

  return v4;
}

+ (id)newAssetKeyWithAssetIdentifier:(id)a3 assetServerToken:(id)a4
{
  id v5;
  id v6;
  RMStoreAssetKey *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RMStoreAssetKey initWithAssetIdentifier:assetServerToken:]([RMStoreAssetKey alloc], "initWithAssetIdentifier:assetServerToken:", v6, v5);

  return v7;
}

- (RMStoreAssetKey)initWithAssetKey:(id)a3
{
  id v5;
  RMStoreAssetKey *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *assetIdentifier;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *assetServerToken;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RMStoreAssetKey;
  v6 = -[RMStoreAssetKey init](&v17, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 2)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v8, 0);
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);

      assetIdentifier = v6->_assetIdentifier;
      v6->_assetIdentifier = (NSString *)v10;

      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 0);
      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v13, 4);

      assetServerToken = v6->_assetServerToken;
      v6->_assetServerToken = (NSString *)v14;

      objc_storeStrong((id *)&v6->_key, a3);
    }

  }
  return v6;
}

- (RMStoreAssetKey)initWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RMStoreAssetKey *v7;

  v4 = a3;
  objc_msgSend(v4, "declarationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "declarationServerToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[RMStoreAssetKey initWithAssetIdentifier:assetServerToken:](self, "initWithAssetIdentifier:assetServerToken:", v5, v6);
  return v7;
}

- (RMStoreAssetKey)initWithAssetIdentifier:(id)a3 assetServerToken:(id)a4
{
  id v7;
  id v8;
  RMStoreAssetKey *v9;
  RMStoreAssetKey *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *key;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RMStoreAssetKey;
  v9 = -[RMStoreAssetKey init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetIdentifier, a3);
    objc_storeStrong((id *)&v10->_assetServerToken, a4);
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[NSString dataUsingEncoding:](v10->_assetIdentifier, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSString dataUsingEncoding:](v10->_assetServerToken, "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    key = v10->_key;
    v10->_key = (NSString *)v16;

  }
  return v10;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[RMStoreAssetKey key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreAssetKey assetIdentifier](self, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMStoreAssetKey assetServerToken](self, "assetServerToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { identifier = %@, serverToken = %@ }>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  RMStoreAssetKey *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (RMStoreAssetKey *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RMStoreAssetKey key](self, "key");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RMStoreAssetKey key](v4, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RMStoreAssetKey key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  id v4;

  -[RMStoreAssetKey key](self, "key", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[RMStoreAssetKey newAssetKey:](RMStoreAssetKey, "newAssetKey:", v3);

  return v4;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSString)assetServerToken
{
  return self->_assetServerToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetServerToken, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
