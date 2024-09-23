@implementation REMStoreInvocationValueStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueStorage, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMStoreInvocationValueStorage)init
{
  REMStoreInvocationValueStorage *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *valueStorage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMStoreInvocationValueStorage;
  v2 = -[REMStoreInvocationValueStorage init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    valueStorage = v2->_valueStorage;
    v2->_valueStorage = v3;

  }
  return v2;
}

- (void)storeProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[REMStoreInvocationValueStorage valueStorage](self, "valueStorage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)storedPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMStoreInvocationValueStorage valueStorage](self, "valueStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMStoreInvocationValueStorage valueStorage](self, "valueStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("valueStorage"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMStoreInvocationValueStorage valueStorage](self, "valueStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p valueStorage: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)valueStorage
{
  return self->_valueStorage;
}

- (REMStoreInvocationValueStorage)initWithCoder:(id)a3
{
  id v4;
  REMStoreInvocationValueStorage *v5;
  uint64_t v6;
  NSMutableDictionary *valueStorage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMStoreInvocationValueStorage;
  v5 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_39);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder____sClasses, CFSTR("valueStorage"));
    v6 = objc_claimAutoreleasedReturnValue();
    valueStorage = v5->_valueStorage;
    v5->_valueStorage = (NSMutableDictionary *)v6;

  }
  return v5;
}

void __48__REMStoreInvocationValueStorage_initWithCoder___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v18 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v17, v16, v15, v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(),
    0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)initWithCoder____sClasses;
  initWithCoder____sClasses = v10;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[REMStoreInvocationValueStorage valueStorage](self, "valueStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setValueStorage:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "valueStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMStoreInvocationValueStorage valueStorage](self, "valueStorage");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "valueStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMStoreInvocationValueStorage valueStorage](self, "valueStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  -[REMStoreInvocationValueStorage valueStorage](self, "valueStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ objc_msgSend(v4, "hash") ^ 0x1F;

  return v5;
}

- (void)setValueStorage:(id)a3
{
  objc_storeStrong((id *)&self->_valueStorage, a3);
}

@end
