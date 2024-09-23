@implementation TRIPurgeableConstructs

- (TRIPurgeableConstructs)initWithPurgeabilityLevel:(int)a3 purgeableNamespacesProvider:(id)a4 paths:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  TRIPurgeableConstructs *v10;
  TRIPurgeableConstructs *v11;
  id *p_eagerPurgeableFactorsByNamespaceName;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v6 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TRIPurgeableConstructs;
  v10 = -[TRIPurgeableConstructs init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    p_eagerPurgeableFactorsByNamespaceName = (id *)&v10->_eagerPurgeableFactorsByNamespaceName;
    objc_msgSend(v8, "partitionPurgeableNamespacesForPurgeabilityLevel:namespaceNamesPurgeableAtNamespaceLevel:eagerPurgeableFactorsByNamespaceName:cacheDeleteableFactorsByNamespaceName:", v6, &v10->_namespaceNamesPurgeableAtNamespaceLevel, &v10->_eagerPurgeableFactorsByNamespaceName, &v10->_cacheDeleteableFactorsByNamespaceName);
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[NSMutableSet count](v11->_namespaceNamesPurgeableAtNamespaceLevel, "count");
      v15 = objc_msgSend(*p_eagerPurgeableFactorsByNamespaceName, "count");
      *(_DWORD *)buf = 134218240;
      v27 = v14;
      v28 = 2048;
      v29 = v15;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable namespaces and %lu namespaces with purgeable factors", buf, 0x16u);
    }

    v16 = (void *)objc_opt_new();
    v17 = *p_eagerPurgeableFactorsByNamespaceName;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __86__TRIPurgeableConstructs_initWithPurgeabilityLevel_purgeableNamespacesProvider_paths___block_invoke;
    v22[3] = &unk_1E932F6A0;
    v23 = v9;
    v18 = v16;
    v24 = v18;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
    v19 = *p_eagerPurgeableFactorsByNamespaceName;
    *p_eagerPurgeableFactorsByNamespaceName = v18;
    v20 = v18;

  }
  return v11;
}

void __86__TRIPurgeableConstructs_initWithPurgeabilityLevel_purgeableNamespacesProvider_paths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0DC0AE8];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "factorProviderWithPaths:namespaceName:", v6, v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v7, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "factorNamesWithObfuscation:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v12, v8);
}

- (NSMutableSet)namespaceNamesPurgeableAtNamespaceLevel
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)eagerPurgeableFactorsByNamespaceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)cacheDeleteableFactorsByNamespaceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteableFactorsByNamespaceName, 0);
  objc_storeStrong((id *)&self->_eagerPurgeableFactorsByNamespaceName, 0);
  objc_storeStrong((id *)&self->_namespaceNamesPurgeableAtNamespaceLevel, 0);
}

@end
