@implementation TRIPurgeableNamespacesProvider

- (TRIPurgeableNamespacesProvider)initWithPaths:(id)a3 clientNamespaceMetadataStorage:(id)a4
{
  id v7;
  id v8;
  TRIPurgeableNamespacesProvider *v9;
  TRIPurgeableNamespacesProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIPurgeableNamespacesProvider;
  v9 = -[TRIPurgeableNamespacesProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_clientNamespaceMetadataStorage, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientNamespaceMetadataStorage, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (void)partitionPurgeableNamespacesForPurgeabilityLevel:(int)a3 namespaceNamesPurgeableAtNamespaceLevel:(id *)a4 eagerPurgeableFactorsByNamespaceName:(id *)a5 cacheDeleteableFactorsByNamespaceName:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  TRIClientNamespaceMetadataStoring *clientNamespaceMetadataStorage;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *context;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  id v42;
  int v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v37 = (void *)objc_opt_new();
  v35 = (void *)objc_opt_new();
  v36 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x1D8232A5C]();
  v8 = (void *)MEMORY[0x1E0DC0AD8];
  -[TRIPaths namespaceDescriptorsDefaultDir](self->_paths, "namespaceDescriptorsDefaultDir");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptorsForDirectory:filterBlock:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v15, "namespaceName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)objc_msgSend(v15, "purgeabilityLevel") <= a3)
          objc_msgSend(v37, "addObject:", v16);
        clientNamespaceMetadataStorage = self->_clientNamespaceMetadataStorage;
        v44 = 0;
        -[TRIClientNamespaceMetadataStoring loadNamespaceMetadataForNamespaceName:error:](clientNamespaceMetadataStorage, "loadNamespaceMetadataForNamespaceName:error:", v16, &v44);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v44;
        v20 = v19;
        if (v19 || !v18)
        {
          if (!v19)
            goto LABEL_16;
          TRILogCategory_Server();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v15, "namespaceName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            TRILoggedNamespaceName(v34);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v50 = v24;
            _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "Unable to load metadata for namespace %{public}@", buf, 0xCu);

          }
        }
        else
        {
          v21 = objc_msgSend(v18, "compatibilityVersion");
          if (v21 != objc_msgSend(v15, "downloadNCV"))
            goto LABEL_16;
          objc_msgSend(v18, "factorNamePurgeabilityLevels");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __198__TRIPurgeableNamespacesProvider_partitionPurgeableNamespacesForPurgeabilityLevel_namespaceNamesPurgeableAtNamespaceLevel_eagerPurgeableFactorsByNamespaceName_cacheDeleteableFactorsByNamespaceName___block_invoke;
          v39[3] = &unk_1E93350F8;
          v40 = v36;
          v41 = v16;
          v43 = a3;
          v42 = v35;
          objc_msgSend(v22, "enumerateKeysAndEnumsUsingBlock:", v39);

          v23 = v40;
        }

LABEL_16:
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(context);
  v25 = *a4;
  *a4 = v37;
  v26 = v37;

  v27 = *a5;
  *a5 = v35;
  v28 = v35;

  v29 = *a6;
  *a6 = v36;

}

void __198__TRIPurgeableNamespacesProvider_partitionPurgeableNamespacesForPurgeabilityLevel_namespaceNamesPurgeableAtNamespaceLevel_eagerPurgeableFactorsByNamespaceName_cacheDeleteableFactorsByNamespaceName___block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  if (*(_DWORD *)(a1 + 56) >= a3)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
}

@end
