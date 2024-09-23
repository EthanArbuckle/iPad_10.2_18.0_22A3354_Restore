@implementation PGAssetCollectionFeatureProvider

- (PGAssetCollectionFeatureProvider)initWithFeatureSpecifications:(id)a3
{
  id v5;
  PGAssetCollectionFeatureProvider *v6;
  PGAssetCollectionFeatureProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGAssetCollectionFeatureProvider;
  v6 = -[PGAssetCollectionFeatureProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_featureSpecifications, a3);

  return v7;
}

- (id)featureInstancesWithMomentNode:(id)a3 atMomentIngest:(BOOL)a4
{
  int v4;
  id v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_featureSpecifications;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "shouldRunAtMomentIngest", (_QWORD)v16) == v4)
        {
          objc_msgSend(v13, "instanceWithMomentNode:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (PGAssetCollectionFeatureProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PGAssetCollectionFeatureProvider *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("featureSpecifications"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PGAssetCollectionFeatureProvider initWithFeatureSpecifications:](self, "initWithFeatureSpecifications:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_featureSpecifications, CFSTR("featureSpecifications"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)PGAssetCollectionFeatureProvider;
  -[PGAssetCollectionFeatureProvider description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray description](self->_featureSpecifications, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PGAssetCollectionFeatureProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (PGAssetCollectionFeatureProvider *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_featureSpecifications);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0C99E60];
      -[PGAssetCollectionFeatureProvider featureSpecifications](v4, "featureSpecifications");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v5, "isEqualToSet:", v8);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSArray)featureSpecifications
{
  return self->_featureSpecifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSpecifications, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
