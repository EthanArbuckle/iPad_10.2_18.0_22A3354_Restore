@implementation RMStoreDeclarationKeyPair

+ (id)newDeclarationKeyPairWithNewKey:(id)a3
{
  id v3;
  RMStoreDeclarationKeyPair *v4;

  v3 = a3;
  v4 = -[RMStoreDeclarationKeyPair initWithNewKey:replaceKey:]([RMStoreDeclarationKeyPair alloc], "initWithNewKey:replaceKey:", v3, 0);

  return v4;
}

+ (id)newDeclarationKeyPairWithUpdateKey:(id)a3 replaceKey:(id)a4
{
  id v5;
  id v6;
  RMStoreDeclarationKeyPair *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RMStoreDeclarationKeyPair initWithNewKey:replaceKey:]([RMStoreDeclarationKeyPair alloc], "initWithNewKey:replaceKey:", v6, v5);

  return v7;
}

- (RMStoreDeclarationKeyPair)initWithNewKey:(id)a3 replaceKey:(id)a4
{
  id v7;
  id v8;
  RMStoreDeclarationKeyPair *v9;
  RMStoreDeclarationKeyPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreDeclarationKeyPair;
  v9 = -[RMStoreDeclarationKeyPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applyKey, a3);
    objc_storeStrong((id *)&v10->_replaceKey, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  RMStoreDeclarationKeyPair *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  char v13;

  v4 = (RMStoreDeclarationKeyPair *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RMStoreDeclarationKeyPair applyKey](self, "applyKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RMStoreDeclarationKeyPair applyKey](v4, "applyKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[RMStoreDeclarationKeyPair replaceKey](self, "replaceKey");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
          v9 = (__CFString *)v7;
        else
          v9 = &stru_25162FD48;
        -[RMStoreDeclarationKeyPair replaceKey](v4, "replaceKey");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (const __CFString *)v10;
        else
          v12 = &stru_25162FD48;
        v13 = -[__CFString isEqual:](v9, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[RMStoreDeclarationKeyPair applyKey](self, "applyKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RMStoreDeclarationKeyPair replaceKey](self, "replaceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (RMStoreDeclarationKey)applyKey
{
  return self->_applyKey;
}

- (RMStoreDeclarationKey)replaceKey
{
  return self->_replaceKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceKey, 0);
  objc_storeStrong((id *)&self->_applyKey, 0);
}

@end
