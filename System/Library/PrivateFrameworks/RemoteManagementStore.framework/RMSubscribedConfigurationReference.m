@implementation RMSubscribedConfigurationReference

- (RMSubscribedConfigurationReference)initWithDeclaration:(id)a3 subscriberStore:(id)a4 assets:(id)a5
{
  id v8;
  id v9;
  id v10;
  RMSubscribedConfigurationReference *v11;
  RMSubscribedConfigurationReference *v12;
  uint64_t v13;
  RMModelDeclarationBase *declaration;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RMSubscribedConfigurationReference;
  v11 = -[RMSubscribedConfigurationReference init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[RMSubscribedConfigurationReference _resolveDynamicDeclaration:](v11, "_resolveDynamicDeclaration:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    declaration = v12->_declaration;
    v12->_declaration = (RMModelDeclarationBase *)v13;

    objc_storeStrong((id *)&v12->_store, a4);
    objc_storeStrong((id *)&v12->_assets, a5);
  }

  return v12;
}

- (id)_resolveDynamicDeclaration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v12;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "serializeWithType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x24BE7EBD0], "load:serializationType:error:", v4, 0, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    objc_msgSend(MEMORY[0x24BE7EB20], "subscribedConfigurationReference");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      v9 = v5;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[RMSubscribedConfigurationReference _resolveDynamicDeclaration:].cold.2((uint64_t)v5, v8);
        v9 = v5;
      }
    }
    else
    {
      v9 = v3;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[RMSubscribedConfigurationReference _resolveDynamicDeclaration:].cold.1((uint64_t)v6, v8);
        v9 = v3;
      }
    }

    v10 = v9;
  }
  else
  {
    v10 = v3;
  }

  return v10;
}

- (id)assetWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[RMSubscribedConfigurationReference assets](self, "assets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "declarationIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMSubscribedConfigurationReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  RMSubscribedConfigurationReference *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("declaration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("store"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("assets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[RMSubscribedConfigurationReference initWithDeclaration:subscriberStore:assets:](self, "initWithDeclaration:subscriberStore:assets:", v5, v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RMSubscribedConfigurationReference declaration](self, "declaration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("declaration"));

  -[RMSubscribedConfigurationReference store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("store"));

  -[RMSubscribedConfigurationReference assets](self, "assets");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("assets"));

}

- (BOOL)isEqual:(id)a3
{
  RMSubscribedConfigurationReference *v4;
  BOOL v5;

  v4 = (RMSubscribedConfigurationReference *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMSubscribedConfigurationReference isEqualToReference:](self, "isEqualToReference:", v4);
  }

  return v5;
}

- (BOOL)isEqualToReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  -[RMSubscribedConfigurationReference declaration](self, "declaration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "declarationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "declaration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "declarationType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v8))
  {
    -[RMSubscribedConfigurationReference declaration](self, "declaration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "declarationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "declaration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "declarationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v12))
    {
      v24 = v9;
      -[RMSubscribedConfigurationReference declaration](self, "declaration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "declarationServerToken");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "declaration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "declarationServerToken");
      v26 = v13;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:"))
      {
        -[RMSubscribedConfigurationReference store](self, "store");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "store");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v14;
        v15 = objc_msgSend(v14, "isEqual:");
        v9 = v24;
        if (v15)
        {
          -[RMSubscribedConfigurationReference assets](self, "assets");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v20, "count");
          objc_msgSend(v4, "assets");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == objc_msgSend(v19, "count");

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
        v9 = v24;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (RMModelDeclarationBase)declaration
{
  return self->_declaration;
}

- (RMSubscriberStore)store
{
  return self->_store;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_declaration, 0);
}

- (void)_resolveDynamicDeclaration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_245188000, a2, OS_LOG_TYPE_ERROR, "Failed to resolve dynamic configuration: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_resolveDynamicDeclaration:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_245188000, a2, OS_LOG_TYPE_DEBUG, "Resolved dynamic configuration: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
