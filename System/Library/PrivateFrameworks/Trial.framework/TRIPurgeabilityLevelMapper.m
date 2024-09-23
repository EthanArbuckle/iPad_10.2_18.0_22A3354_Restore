@implementation TRIPurgeabilityLevelMapper

- (TRIPurgeabilityLevelMapper)initWithPaths:(id)a3 namespaceMetadataStorage:(id)a4
{
  id v7;
  id v8;
  TRIPurgeabilityLevelMapper *v9;
  TRIPurgeabilityLevelMapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIPurgeabilityLevelMapper;
  v9 = -[TRIPurgeabilityLevelMapper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_namespaceMetadataStorage, a4);
  }

  return v10;
}

+ (id)purgeabilityLevelFromCacheDeleteUrgency:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  else
    return (id)qword_1E3BFF860[a3 - 1];
}

+ (int)availableSpaceClassFromPurgeabilityLevel:(int)a3
{
  if ((a3 - 1) > 2)
    return 1;
  else
    return dword_19B917848[a3 - 1];
}

- (int)purgeabilityLevelForNamespace:(id)a3
{
  TRIPaths *paths;
  id v4;
  void *v5;
  void *v6;
  int v7;

  paths = self->_paths;
  v4 = a3;
  -[TRIPaths namespaceDescriptorsDefaultDir](paths, "namespaceDescriptorsDefaultDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptor loadWithNamespaceName:fromDirectory:](TRINamespaceDescriptor, "loadWithNamespaceName:fromDirectory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "purgeabilityLevel");
  else
    v7 = 3;

  return v7;
}

- (int)availableSpaceClassForFactorNames:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  int v18;
  TRIPurgeabilityLevelMapper *v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TRIClientNamespaceMetadataStoring loadNamespaceMetadataForNamespaceName:error:](self->_namespaceMetadataStorage, "loadNamespaceMetadataForNamespaceName:error:", v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 && v8)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v20 = self;
      LODWORD(v13) = 0;
      v14 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v21 = 0;
          objc_msgSend(v9, "factorNamePurgeabilityLevels", v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = objc_msgSend(v17, "getEnum:forKey:", &v21, v16);

          if ((v16 & 1) == 0)
          {
            v13 = -[TRIPurgeabilityLevelMapper purgeabilityLevelForNamespace:](v20, "purgeabilityLevelForNamespace:", v7);
            goto LABEL_18;
          }
          if ((int)v13 <= v21)
            v13 = v21;
          else
            v13 = v13;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v13 = 0;
    }
LABEL_18:

  }
  else
  {
    v13 = -[TRIPurgeabilityLevelMapper purgeabilityLevelForNamespace:](self, "purgeabilityLevelForNamespace:", v7);
  }
  v18 = +[TRIPurgeabilityLevelMapper availableSpaceClassFromPurgeabilityLevel:](TRIPurgeabilityLevelMapper, "availableSpaceClassFromPurgeabilityLevel:", v13);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceMetadataStorage, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
