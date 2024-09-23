@implementation RMDeclarationManifest

+ (id)declarationManifestWithDeclarations:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  RMDeclarationManifestItem *v13;
  void *v14;
  void *v15;
  RMDeclarationManifestItem *v16;
  void *v17;
  RMDeclarationManifestItem *v18;
  RMDeclarationManifestItem *v19;
  RMDeclarationManifestItem *v20;
  RMDeclarationManifest *v21;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v28 = (void *)objc_opt_new();
  v27 = (void *)objc_opt_new();
  v25 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    v8 = *MEMORY[0x24BE7EC20];
    v9 = *MEMORY[0x24BE7EC30];
    v26 = *MEMORY[0x24BE7EC28];
    v24 = *MEMORY[0x24BE7EC38];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "declarationClassType", v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v8))
        {
          v13 = [RMDeclarationManifestItem alloc];
          objc_msgSend(v11, "declarationIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "declarationServerToken");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[RMDeclarationManifestItem initWithIdentifier:version:](v13, "initWithIdentifier:version:", v14, v15);
          v17 = v28;
        }
        else if (objc_msgSend(v12, "isEqualToString:", v9))
        {
          v18 = [RMDeclarationManifestItem alloc];
          objc_msgSend(v11, "declarationIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "declarationServerToken");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[RMDeclarationManifestItem initWithIdentifier:version:](v18, "initWithIdentifier:version:", v14, v15);
          v17 = v27;
        }
        else if (objc_msgSend(v12, "isEqualToString:", v26))
        {
          v19 = [RMDeclarationManifestItem alloc];
          objc_msgSend(v11, "declarationIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "declarationServerToken");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[RMDeclarationManifestItem initWithIdentifier:version:](v19, "initWithIdentifier:version:", v14, v15);
          v17 = v25;
        }
        else
        {
          if (!objc_msgSend(v12, "isEqualToString:", v24))
            goto LABEL_15;
          v20 = [RMDeclarationManifestItem alloc];
          objc_msgSend(v11, "declarationIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "declarationServerToken");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[RMDeclarationManifestItem initWithIdentifier:version:](v20, "initWithIdentifier:version:", v14, v15);
          v17 = v23;
        }
        objc_msgSend(v17, "addObject:", v16);

LABEL_15:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v6);
  }

  v21 = -[RMDeclarationManifest initWithActivations:configurations:assets:management:]([RMDeclarationManifest alloc], "initWithActivations:configurations:assets:management:", v28, v27, v25, v23);
  return v21;
}

- (RMDeclarationManifest)initWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RMDeclarationManifest *v14;
  uint64_t v15;
  NSArray *activations;
  uint64_t v17;
  NSArray *configurations;
  uint64_t v19;
  NSArray *assets;
  uint64_t v21;
  NSArray *management;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RMDeclarationManifest;
  v14 = -[RMDeclarationManifest init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    activations = v14->_activations;
    v14->_activations = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    configurations = v14->_configurations;
    v14->_configurations = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    assets = v14->_assets;
    v14->_assets = (NSArray *)v19;

    v21 = objc_msgSend(v13, "copy");
    management = v14->_management;
    v14->_management = (NSArray *)v21;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMDeclarationManifest)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  RMDeclarationManifest *v24;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("activations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("configurations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("assets"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDBCF20];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("management"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[RMDeclarationManifest initWithActivations:configurations:assets:management:](self, "initWithActivations:configurations:assets:management:", v8, v13, v18, v23);
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RMDeclarationManifest activations](self, "activations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activations"));

  -[RMDeclarationManifest configurations](self, "configurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("configurations"));

  -[RMDeclarationManifest assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("assets"));

  -[RMDeclarationManifest management](self, "management");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("management"));

}

- (BOOL)isEqual:(id)a3
{
  RMDeclarationManifest *v4;
  BOOL v5;

  v4 = (RMDeclarationManifest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMDeclarationManifest isEqualToManifest:](self, "isEqualToManifest:", v4);
  }

  return v5;
}

- (BOOL)isEqualToManifest:(id)a3
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
  char v13;

  v4 = a3;
  -[RMDeclarationManifest activations](self, "activations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToArray:", v6))
  {
    -[RMDeclarationManifest configurations](self, "configurations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToArray:", v8))
    {
      -[RMDeclarationManifest assets](self, "assets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "assets");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToArray:", v10))
      {
        -[RMDeclarationManifest management](self, "management");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "management");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToArray:", v12);

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
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSArray)activations
{
  return self->_activations;
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSArray)management
{
  return self->_management;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_management, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_activations, 0);
}

@end
