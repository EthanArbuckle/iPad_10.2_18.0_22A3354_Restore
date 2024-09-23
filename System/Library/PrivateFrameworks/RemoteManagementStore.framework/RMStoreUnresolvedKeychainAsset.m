@implementation RMStoreUnresolvedKeychainAsset

- (RMStoreUnresolvedKeychainAsset)initWithAsset:(id)a3 assetKey:(id)a4 configurationKey:(id)a5 group:(id)a6 defaultAccessibility:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RMStoreUnresolvedKeychainAsset *v17;
  RMStoreUnresolvedKeychainAsset *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RMStoreUnresolvedKeychainAsset;
  v17 = -[RMStoreUnresolvedAsset initWithAsset:queryParameters:](&v20, sel_initWithAsset_queryParameters_, a3, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetKey, a4);
    objc_storeStrong((id *)&v18->_configurationKey, a5);
    objc_storeStrong((id *)&v18->_keychainGroup, a6);
    objc_storeStrong((id *)&v18->_keychainDefaultAccessibility, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMStoreUnresolvedKeychainAsset)initWithCoder:(id)a3
{
  id v4;
  RMStoreUnresolvedKeychainAsset *v5;
  uint64_t v6;
  RMStoreDeclarationKey *assetKey;
  uint64_t v8;
  RMStoreDeclarationKey *configurationKey;
  uint64_t v10;
  NSString *keychainGroup;
  uint64_t v12;
  NSString *keychainDefaultAccessibility;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RMStoreUnresolvedKeychainAsset;
  v5 = -[RMStoreUnresolvedAsset initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset-key"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetKey = v5->_assetKey;
    v5->_assetKey = (RMStoreDeclarationKey *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration-key"));
    v8 = objc_claimAutoreleasedReturnValue();
    configurationKey = v5->_configurationKey;
    v5->_configurationKey = (RMStoreDeclarationKey *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keychain-group"));
    v10 = objc_claimAutoreleasedReturnValue();
    keychainGroup = v5->_keychainGroup;
    v5->_keychainGroup = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keychain-default-accessibility"));
    v12 = objc_claimAutoreleasedReturnValue();
    keychainDefaultAccessibility = v5->_keychainDefaultAccessibility;
    v5->_keychainDefaultAccessibility = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RMStoreUnresolvedKeychainAsset;
  v4 = a3;
  -[RMStoreUnresolvedAsset encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[RMStoreUnresolvedKeychainAsset assetKey](self, "assetKey", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("asset-key"));

  -[RMStoreUnresolvedKeychainAsset configurationKey](self, "configurationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("configuration-key"));

  -[RMStoreUnresolvedKeychainAsset keychainGroup](self, "keychainGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("keychain-group"));

  -[RMStoreUnresolvedKeychainAsset keychainDefaultAccessibility](self, "keychainDefaultAccessibility");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("keychain-default-accessibility"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RMStoreUnresolvedKeychainAsset;
  v5 = -[RMStoreUnresolvedAsset isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[RMStoreUnresolvedKeychainAsset isEqualToUnresolvedKeychainAsset:](self, "isEqualToUnresolvedKeychainAsset:", v4);

  return v5;
}

- (BOOL)isEqualToUnresolvedKeychainAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;

  v4 = a3;
  -[RMStoreUnresolvedKeychainAsset assetKey](self, "assetKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v10 = 0;
  v11 = v8;
  v12 = v7;
  if (!v7 || !v8)
    goto LABEL_29;
  v13 = objc_msgSend(v7, "isEqual:", v8);

  if (v13)
  {
LABEL_7:
    -[RMStoreUnresolvedKeychainAsset configurationKey](self, "configurationKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v16 = v15;
    v11 = v16;
    if (v12 == v16)
    {

    }
    else
    {
      v10 = 0;
      v17 = v16;
      v18 = v12;
      if (!v12 || !v16)
        goto LABEL_28;
      v19 = objc_msgSend(v12, "isEqual:", v16);

      if (!v19)
      {
        v10 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    -[RMStoreUnresolvedKeychainAsset keychainGroup](self, "keychainGroup");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keychainGroup");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;
    v22 = v21;
    v30 = v22;
    if (v18 != v22)
    {
      v10 = 0;
      if (v18)
      {
        v23 = v22;
        v24 = v18;
        if (v22)
        {
          v25 = objc_msgSend(v18, "isEqual:", v22);

          if (!v25)
          {
            v10 = 0;
LABEL_27:
            v17 = v30;
LABEL_28:

            goto LABEL_29;
          }
          goto LABEL_19;
        }
      }
      else
      {
        v23 = v22;
        v24 = 0;
      }
LABEL_26:

      goto LABEL_27;
    }

LABEL_19:
    -[RMStoreUnresolvedKeychainAsset keychainDefaultAccessibility](self, "keychainDefaultAccessibility");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keychainDefaultAccessibility");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;
    v28 = v27;
    v23 = v28;
    if (v24 == v28)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v24 && v28)
        v10 = objc_msgSend(v24, "isEqual:", v28);
    }

    goto LABEL_26;
  }
  v10 = 0;
LABEL_30:

  return v10;
}

- (RMStoreDeclarationKey)assetKey
{
  return self->_assetKey;
}

- (RMStoreDeclarationKey)configurationKey
{
  return self->_configurationKey;
}

- (NSString)keychainGroup
{
  return self->_keychainGroup;
}

- (NSString)keychainDefaultAccessibility
{
  return self->_keychainDefaultAccessibility;
}

- (BOOL)useSystemKeychain
{
  return self->_useSystemKeychain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainDefaultAccessibility, 0);
  objc_storeStrong((id *)&self->_keychainGroup, 0);
  objc_storeStrong((id *)&self->_configurationKey, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
}

@end
