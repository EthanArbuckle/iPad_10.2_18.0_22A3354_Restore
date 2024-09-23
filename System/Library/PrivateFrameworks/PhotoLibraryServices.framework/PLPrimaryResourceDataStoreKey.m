@implementation PLPrimaryResourceDataStoreKey

- (PLPrimaryResourceDataStoreKey)initWithKeyStruct:(const void *)a3
{
  unsigned int v5;
  id v6;
  PLPrimaryResourceDataStoreKey *v7;

  v5 = *(unsigned __int8 *)a3;
  if (v5 >= 0x10)
    v5 = 16;
  if (v5 == 3 || v5 == 4 || v5 == 16)
    v6 = (id)objc_opt_class();
  else
    v6 = 0;
  v7 = (PLPrimaryResourceDataStoreKey *)objc_msgSend(objc_alloc((Class)v6), "initWithKeyStruct:", a3);

  return v7;
}

- (id)keyData
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Subclasses must override %@"), v4);

  return 0;
}

- (id)fileURLForAssetID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Subclasses must override %@"), v5);

  return 0;
}

- (id)uniformTypeIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Subclasses must override %@"), v4);

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPrimaryResourceDataStoreKey;
  return -[PLPrimaryResourceDataStoreKey init](&v3, sel_init);
}

- (id)_initWithKeyStruct:(const void *)a3
{
  PLPrimaryResourceDataStoreKey *v5;
  PLPrimaryResourceDataStoreKey *v6;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreKey;
  v5 = -[PLPrimaryResourceDataStoreKey init](&v9, sel_init);
  v6 = v5;
  if (!a3 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PLPrimaryResourceDataStoreKey.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyStruct"));

  }
  return v6;
}

- (id)_initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  PLPrimaryResourceDataStoreKey *v7;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLPrimaryResourceDataStoreKey;
  v7 = -[PLPrimaryResourceDataStoreKey init](&v11, sel_init);
  if (v7)
  {
    if (a4)
    {
      if (a3)
        return v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLPrimaryResourceDataStoreKey.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

      if (a3)
        return v7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLPrimaryResourceDataStoreKey.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

  }
  return v7;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "strategyFromExternalResource:asset:", v6, v7);
  if (v8 == 3 || v8 == 4 || v8 == 16)
    v9 = (id)objc_opt_class();
  else
    v9 = 0;
  v10 = (void *)objc_msgSend(objc_alloc((Class)v9), "initFromExistingLocationOfExternalResource:asset:", v6, v7);

  return v10;
}

- (BOOL)isEqualToKey:(id)a3
{
  return PLResourceDataStoreKeyIsEqual(self, a3);
}

- (BOOL)isEqual:(id)a3
{
  PLPrimaryResourceDataStoreKey *v4;
  BOOL v5;

  v4 = (PLPrimaryResourceDataStoreKey *)a3;
  if (v4 == self)
    v5 = 1;
  else
    v5 = (objc_opt_respondsToSelector() & 1) != 0
      && -[PLPrimaryResourceDataStoreKey isEqualToKey:](self, "isEqualToKey:", v4);

  return v5;
}

- (id)descriptionForAssetID:(id)a3
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPrimaryResourceDataStoreKey fileURLForAssetID:](self, "fileURLForAssetID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@>, fileURL: %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Subclasses must override %@"), v6);

  return 0;
}

+ (unsigned)strategyFromExternalResource:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPrimaryResourceDataStoreKey.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPrimaryResourceDataStoreKey.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:

  return 3;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Subclasses must override %@"), v5);

  return 0;
}

@end
