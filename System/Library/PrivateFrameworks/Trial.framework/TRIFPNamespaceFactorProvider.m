@implementation TRIFPNamespaceFactorProvider

- (id)treatmentId
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id *p_treatmentId;
  NSObject *v8;
  NSObject *v9;
  NSString *parentId;
  int deploymentId;
  TRIFactorPackId *v13;
  TRIFactorPackId *factorPackId;
  int v15;
  NSObject *v16;
  __int16 v17;
  _WORD v18[17];

  *(_QWORD *)&v18[13] = *MEMORY[0x1E0C80C00];
  if (self->_isFlatbufferWriteEnabled && !self->_isFlatbufferReadEnabled)
  {
    -[TRIFBFastFactorLevels sourceAsFactorPackId](self->_fastFactorLevels, "sourceAsFactorPackId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[TRIFBFastFactorLevels sourceAsFactorPackId](self->_fastFactorLevels, "sourceAsFactorPackId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateFactorPackId(v4);
      v5 = objc_claimAutoreleasedReturnValue();

      if ((-[NSObject isEqualToString:](v5, "isEqualToString:", self->_factorPackId) & 1) == 0)
      {
        TRILogCategory_ClientFramework();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          factorPackId = self->_factorPackId;
          v15 = 138412546;
          v16 = v5;
          v17 = 2112;
          *(_QWORD *)v18 = factorPackId;
          _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, "Flatbuffer factor pack id: %@ does not match with protobuf factor pack id: %@", (uint8_t *)&v15, 0x16u);
        }

      }
    }
    else
    {
      TRILogCategory_ClientFramework();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        parentId = self->_parentId;
        deploymentId = self->_deploymentId;
        v13 = self->_factorPackId;
        v15 = 138543874;
        v16 = parentId;
        v17 = 1024;
        *(_DWORD *)v18 = deploymentId;
        v18[2] = 2114;
        *(_QWORD *)&v18[3] = v13;
        _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier within TRIFBFastFactorLevels object for rollout:%{public}@ deployment:%d, factor-pack: %{public}@", (uint8_t *)&v15, 0x1Cu);
      }
    }

  }
  p_treatmentId = (id *)&self->_treatmentId;
  if (self->_treatmentId)
  {
    TRILogCategory_ClientFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *p_treatmentId;
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_19B89C000, v8, OS_LOG_TYPE_DEFAULT, "Factor pack had explicit treatment ID, returning that instead of factor pack ID as the treatment ID: %{public}@", (uint8_t *)&v15, 0xCu);
    }

  }
  else
  {
    p_treatmentId = (id *)&self->_factorPackId;
  }
  return *p_treatmentId;
}

- (id)levelForFactor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSMutableDictionary count](self->_warmupPersistentFactorLevelCache, "count"))
  {
    if (self->_isFlatbufferReadEnabled)
    {
      v7 = 0;
      v6 = 0;
    }
    else
    {
      -[TRIFactorLevelCaching objectForKeyedSubscript:](self->_factorLevels, "objectForKeyedSubscript:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v9)
      {
        objc_msgSend(v9, "level");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[TRILevelChecked wrapLevel:](TRILevelChecked, "wrapLevel:", v10);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }
    }
    if (self->_isFlatbufferWriteEnabled)
    {
      -[TRIFBFastFactorLevels levelsAsDict](self->_fastFactorLevels, "levelsAsDict");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[NSString stringByDeletingLastPathComponent](self->_fbFactorPath, "stringByDeletingLastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIFBFastFactorLevels namespaceName](self->_fastFactorLevels, "namespaceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIFlatbufferUtils convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:](TRIFlatbufferUtils, "convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:", v12, v13, v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
      if (!self->_isFlatbufferReadEnabled && (objc_msgSend(v6, "isEqual:", v15) & 1) == 0)
      {
        objc_msgSend(v15, "factor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "metadataKeysArray");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "factor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "metadataKeysArray");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 != v20)
        {
          objc_msgSend(v15, "level");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "metadata");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "level");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "metadata");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          v25 = v23 ? v23 : MEMORY[0x1E0C9AA70];
          v26 = objc_msgSend(v21, "isEqualToDictionary:", v25);

          if ((v26 & 1) == 0)
          {
            TRILogCategory_ClientFramework();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v15;
              _os_log_error_impl(&dword_19B89C000, v27, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage:%@ does not match factor level from pb", buf, 0xCu);
            }

            TRILogCategory_ClientFramework();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v6;
              _os_log_error_impl(&dword_19B89C000, v28, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage does not match factor level from pb: %@", buf, 0xCu);
            }

          }
        }
      }
      if (v15)
      {
        objc_msgSend(v15, "level");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRILevelChecked wrapLevel:](TRILevelChecked, "wrapLevel:", v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
    if (self->_isFlatbufferReadEnabled)
      v30 = v16;
    else
      v30 = v7;
    v8 = v30;

    goto LABEL_39;
  }
  -[NSMutableDictionary objectForKey:](self->_warmupPersistentFactorLevelCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "hasLevel"))
  {
    objc_msgSend(v6, "level");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRILevelChecked wrapLevel:](TRILevelChecked, "wrapLevel:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

    goto LABEL_40;
  }
  v8 = 0;
LABEL_40:

  return v8;
}

- (id)experimentId
{
  return self->_parentId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

void __119__TRIFPNamespaceFactorProvider__factorLevelsWithFactorPackData_referencePath_outFactorPackId_outNamespaceName_outNCVs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  if (objc_msgSend(v18, "hasFactor"))
  {
    objc_msgSend(v18, "factor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "hasName"))
    {
LABEL_11:

      goto LABEL_12;
    }
    v4 = objc_msgSend(v18, "hasLevel");

    if (v4)
    {
      objc_msgSend(v18, "level");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fileOrDirectoryLevelWithIsDir:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        if (objc_msgSend(v3, "hasPath"))
        {
          objc_msgSend(v3, "path");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "isAbsolutePath");

          if ((v7 & 1) == 0)
          {
            v8 = *(void **)(a1 + 32);
            objc_msgSend(v3, "path");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setPath:", v10);

          }
        }
      }
      objc_msgSend(v18, "factor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasNamespaceName");

      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v18, "factor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "namespaceName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "intern:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "factor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setNamespaceName:", v16);

      }
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);
      goto LABEL_11;
    }
  }
LABEL_12:

}

void __119__TRIFPNamespaceFactorProvider__factorLevelsWithFactorPackData_referencePath_outFactorPackId_outNamespaceName_outNCVs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (unsigned)namespaceCompatibilityVersion
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  signed int v7;
  uint64_t i;
  signed int v9;
  uint64_t v11;
  void *v12;
  NSSet *namespaceCompatibilityVersions;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSSet *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NSSet *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_isFlatbufferWriteEnabled && !self->_isFlatbufferReadEnabled)
  {
    -[TRIFBFastFactorLevels ncvs](self->_fastFactorLevels, "ncvs");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      namespaceCompatibilityVersions = self->_namespaceCompatibilityVersions;
      v14 = (void *)MEMORY[0x1E0C99E60];
      -[TRIFBFastFactorLevels ncvs](self->_fastFactorLevels, "ncvs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(namespaceCompatibilityVersions) = -[NSSet isEqual:](namespaceCompatibilityVersions, "isEqual:", v16);

      if ((namespaceCompatibilityVersions & 1) == 0)
      {
        TRILogCategory_ClientFramework();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (void *)MEMORY[0x1E0C99E60];
          -[TRIFBFastFactorLevels ncvs](self->_fastFactorLevels, "ncvs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setWithArray:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = self->_namespaceCompatibilityVersions;
          *(_DWORD *)buf = 138412546;
          v28 = v20;
          v29 = 2112;
          v30 = v21;
          _os_log_error_impl(&dword_19B89C000, v17, OS_LOG_TYPE_ERROR, "Flatbuffer ncvs:%@ do not match with protobuf ncvs: %@", buf, 0x16u);

        }
      }
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_namespaceCompatibilityVersions;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

    return 0;
  }
  v5 = v4;
  v6 = *(_QWORD *)v23;
  v7 = 0x80000000;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "intValue", (_QWORD)v22);
      if (v7 <= v9)
        v7 = v9;
    }
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v5);

  if (v7 == 0x80000000)
    return 0;
  return v7;
}

- (void)dispose
{
  -[TRIReferenceManagedDirReaderLock unlock](self->_dirLock, "unlock");
}

- (void)dealloc
{
  objc_super v3;

  -[TRIFPNamespaceFactorProvider dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)TRIFPNamespaceFactorProvider;
  -[TRIFPNamespaceFactorProvider dealloc](&v3, sel_dealloc);
}

- (id)_factorLevelsWithFactorPackData:(id)a3 referencePath:(id)a4 outFactorPackId:(id *)a5 outNamespaceName:(id *)a6 outNCVs:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  TRIClientFactorPackStreamingParser *v14;
  TRIClientFactorPackStreamingParser *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void *)MEMORY[0x1A1AC6B8C]();
  v54 = 0;
  v14 = -[TRIClientFactorPackStreamingParser initWithData:error:]([TRIClientFactorPackStreamingParser alloc], "initWithData:error:", v11, &v54);
  v15 = v14;
  if (!v14)
  {
    TRILogCategory_ClientFramework();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 138412546;
    v56 = v12;
    v57 = 2112;
    v58 = v54;
    v43 = "Unable to parse factor pack %@: %@";
    v44 = v21;
    v45 = 22;
LABEL_24:
    _os_log_error_impl(&dword_19B89C000, v44, OS_LOG_TYPE_ERROR, v43, buf, v45);
    goto LABEL_18;
  }
  if (!-[TRIClientFactorPackStreamingParser hasSelectedNamespace](v14, "hasSelectedNamespace"))
    goto LABEL_17;
  -[TRIClientFactorPackStreamingParser selectedNamespace](v15, "selectedNamespace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "hasName") & 1) == 0)
  {

    goto LABEL_17;
  }
  -[TRIClientFactorPackStreamingParser selectedNamespace](v15, "selectedNamespace");
  v47 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  v13 = v47;
  if (!v19)
  {
LABEL_17:
    TRILogCategory_ClientFramework();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 138412290;
    v56 = v12;
    v43 = "Factor pack has unset or empty namespace name: %@";
    goto LABEL_23;
  }
  if (!-[TRIClientFactorPackStreamingParser hasFactorPackId](v15, "hasFactorPackId"))
  {
    TRILogCategory_ClientFramework();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 138412290;
    v56 = v12;
    v43 = "Factor pack has unset factor pack id: %@";
LABEL_23:
    v44 = v21;
    v45 = 12;
    goto LABEL_24;
  }
  -[TRIClientFactorPackStreamingParser factorPackId](v15, "factorPackId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateFactorPackId(v20);
  v21 = objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
LABEL_18:
    v42 = 0;
    goto LABEL_19;
  }
  if (a5)
    objc_storeStrong(a5, v21);
  if (a6)
  {
    -[TRIClientFactorPackStreamingParser selectedNamespace](v15, "selectedNamespace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *a6;
    *a6 = v23;

  }
  v25 = MEMORY[0x1E0C809B0];
  if (a7)
  {
    v26 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[TRIClientFactorPackStreamingParser selectedNamespace](v15, "selectedNamespace");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithCapacity:", objc_msgSend(v27, "compatibilityVersionArray_Count"));

    -[TRIClientFactorPackStreamingParser selectedNamespace](v15, "selectedNamespace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "compatibilityVersionArray");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v25;
    v52[1] = 3221225472;
    v52[2] = __119__TRIFPNamespaceFactorProvider__factorLevelsWithFactorPackData_referencePath_outFactorPackId_outNamespaceName_outNCVs___block_invoke;
    v52[3] = &unk_1E3BFF048;
    v31 = v28;
    v53 = v31;
    objc_msgSend(v30, "enumerateValuesWithBlock:", v52);

    v32 = *a7;
    *a7 = v31;
    v33 = v31;

  }
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815B8]), "initWithBehavior:copyWithZone:", 1, 0);
  -[TRIClientFactorPackStreamingParser selectedNamespace](v15, "selectedNamespace");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "name");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v34, "intern:", v36);

  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48[0] = v25;
  v48[1] = 3221225472;
  v48[2] = __119__TRIFPNamespaceFactorProvider__factorLevelsWithFactorPackData_referencePath_outFactorPackId_outNamespaceName_outNCVs___block_invoke_2;
  v48[3] = &unk_1E3BFF070;
  v39 = v12;
  v49 = v39;
  v50 = v34;
  v51 = v38;
  v40 = v38;
  v41 = v34;
  -[TRIClientFactorPackStreamingParser enumerateFactorLevelsWithBlock:](v15, "enumerateFactorLevelsWithBlock:", v48);
  +[TRINamespaceFactorProvider populateMAPathsForFactorLevels:loadedFromParentDir:](TRINamespaceFactorProvider, "populateMAPathsForFactorLevels:loadedFromParentDir:", v40, v39);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v47;
LABEL_19:

  objc_autoreleasePoolPop(v13);
  return v42;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_fbFactorPath, 0);
  objc_storeStrong((id *)&self->_pbFactorPath, 0);
  objc_storeStrong((id *)&self->_referencePath, 0);
  objc_storeStrong((id *)&self->_fastFactorLevels, 0);
  objc_storeStrong((id *)&self->_warmupPersistentFactorLevelCache, 0);
  objc_storeStrong((id *)&self->_dirLock, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_factorLevels, 0);
  objc_storeStrong((id *)&self->_namespaceCompatibilityVersions, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
}

- (TRIFPNamespaceFactorProvider)initWithParentId:(id)a3 deploymentId:(int)a4 promotable:(BOOL)a5
{
  id v9;
  TRIFPNamespaceFactorProvider *v10;
  TRIFPNamespaceFactorProvider *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TRIFPNamespaceFactorProvider;
  v10 = -[TRIFPNamespaceFactorProvider init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parentId, a3);
    v11->_deploymentId = a4;
    v11->_promotable = a5;
  }

  return v11;
}

- (TRIFPNamespaceFactorProvider)initWithPath:(id)a3 parentId:(id)a4 deploymentId:(int)a5 treatmentId:(id)a6 promotable:(BOOL)a7
{
  id v14;
  id v15;
  id v16;
  TRIFPNamespaceFactorProvider *v17;
  TRIFPNamespaceFactorProvider *v18;
  TRIReferenceManagedDirReaderLock *v19;
  TRIReferenceManagedDirReaderLock *dirLock;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSString *fbFactorPath;
  void *v26;
  NSObject *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *warmupPersistentFactorLevelCache;
  TRIFBFastFactorLevels *v30;
  TRIFBFastFactorLevels *fastFactorLevels;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSSet *namespaceCompatibilityVersions;
  uint64_t v37;
  NSString *namespaceName;
  void *v39;
  _BOOL4 v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  NSString *pbFactorPath;
  void *v46;
  int v47;
  id v48;
  NSString *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  TRIFactorLevelCaching *v54;
  TRIFPNamespaceFactorProvider *v55;
  TRINaiveFactorLevelCache *v57;
  TRIFactorLevelCaching *factorLevels;
  NSString *v59;
  TRIPruningFactorLevelCache *v60;
  void *v61;
  _QWORD v62[4];
  NSObject *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  objc_super v68;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFPNamespaceFactorProvider.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v68.receiver = self;
  v68.super_class = (Class)TRIFPNamespaceFactorProvider;
  v17 = -[TRIFPNamespaceFactorProvider init](&v68, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_36;
  objc_storeStrong((id *)&v17->_parentId, a4);
  v18->_deploymentId = a5;
  objc_storeStrong((id *)&v18->_treatmentId, a6);
  v18->_promotable = a7;
  v19 = -[TRIReferenceManagedDirReaderLock initWithDir:]([TRIReferenceManagedDirReaderLock alloc], "initWithDir:", v14);
  dirLock = v18->_dirLock;
  v18->_dirLock = v19;

  if (!v18->_dirLock)
  {
LABEL_40:
    v55 = 0;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "fileExistsAtPath:", v22))
  {
    v18->_isFlatbufferReadEnabled = _os_feature_enabled_impl();
    v18->_isFlatbufferWriteEnabled = _os_feature_enabled_impl();
    objc_storeStrong((id *)&v18->_fbFactorPath, v22);
  }
  if (v18->_isFlatbufferReadEnabled && !v18->_isFlatbufferWriteEnabled)
  {
    TRILogCategory_ClientFramework();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_19B89C000, v23, OS_LOG_TYPE_ERROR, "Invalid configuration for flatbuffer storage", (uint8_t *)location, 2u);
    }

  }
  if (v18->_fbFactorPath && v18->_isFlatbufferWriteEnabled)
  {
    v24 = objc_alloc(MEMORY[0x1E0C99D50]);
    fbFactorPath = v18->_fbFactorPath;
    v67 = 0;
    v26 = (void *)objc_msgSend(v24, "initWithContentsOfFile:options:error:", fbFactorPath, 8, &v67);
    v27 = v67;
    if (!v26)
    {
      TRILogCategory_ClientFramework();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v27;
        _os_log_error_impl(&dword_19B89C000, v43, OS_LOG_TYPE_ERROR, "Failed to open factor pack: %@", (uint8_t *)location, 0xCu);
      }

      goto LABEL_39;
    }
    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    warmupPersistentFactorLevelCache = v18->_warmupPersistentFactorLevelCache;
    v18->_warmupPersistentFactorLevelCache = v28;

    v30 = -[TRIFBFastFactorLevels initVerifiedRootObjectFromData:]([TRIFBFastFactorLevels alloc], "initVerifiedRootObjectFromData:", v26);
    fastFactorLevels = v18->_fastFactorLevels;
    v18->_fastFactorLevels = v30;

    objc_storeStrong((id *)&v18->_referencePath, a3);
    -[TRIFBFastFactorLevels ncvs](v18->_fastFactorLevels, "ncvs");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = (void *)MEMORY[0x1E0C99E60];
      -[TRIFBFastFactorLevels ncvs](v18->_fastFactorLevels, "ncvs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setWithArray:", v34);
      v35 = objc_claimAutoreleasedReturnValue();
      namespaceCompatibilityVersions = v18->_namespaceCompatibilityVersions;
      v18->_namespaceCompatibilityVersions = (NSSet *)v35;

    }
    if (v18->_isFlatbufferReadEnabled)
    {
      -[TRIFBFastFactorLevels namespaceName](v18->_fastFactorLevels, "namespaceName");
      v37 = objc_claimAutoreleasedReturnValue();
      namespaceName = v18->_namespaceName;
      v18->_namespaceName = (NSString *)v37;

      -[TRIFBFastFactorLevels sourceAsFactorPackId](v18->_fastFactorLevels, "sourceAsFactorPackId");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39 == 0;

      if (v40)
      {
        TRILogCategory_ClientFramework();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v59 = v18->_fbFactorPath;
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v59;
          _os_log_error_impl(&dword_19B89C000, v42, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier in TRIFBFastFactorLevels object for path: %@", (uint8_t *)location, 0xCu);
        }
      }
      else
      {
        -[TRIFBFastFactorLevels sourceAsFactorPackId](v18->_fastFactorLevels, "sourceAsFactorPackId");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        TRIValidateFactorPackId(v41);
        v42 = objc_claimAutoreleasedReturnValue();

        if (v42)
          objc_storeStrong((id *)&v18->_factorPackId, v42);
      }

    }
  }
  if (!v18->_isFlatbufferReadEnabled)
  {
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
    v44 = objc_claimAutoreleasedReturnValue();
    pbFactorPath = v18->_pbFactorPath;
    v18->_pbFactorPath = (NSString *)v44;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "fileExistsAtPath:", v18->_pbFactorPath);

    if (v47)
    {
      v48 = objc_alloc(MEMORY[0x1E0C99D50]);
      v49 = v18->_pbFactorPath;
      v66 = 0;
      v50 = objc_msgSend(v48, "initWithContentsOfFile:options:error:", v49, 8, &v66);
      v27 = v66;
      if (v50)
      {
        -[TRIFPNamespaceFactorProvider _factorLevelsWithFactorPackData:referencePath:outFactorPackId:outNamespaceName:outNCVs:](v18, "_factorLevelsWithFactorPackData:referencePath:outFactorPackId:outNamespaceName:outNCVs:", v50, v14, &v18->_factorPackId, &v18->_namespaceName, &v18->_namespaceCompatibilityVersions);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
        {
          if ((unint64_t)objc_msgSend(v51, "count") < 0x11)
          {
            v57 = -[TRINaiveFactorLevelCache initWithFactorLevels:]([TRINaiveFactorLevelCache alloc], "initWithFactorLevels:", v52);
            factorLevels = v18->_factorLevels;
            v18->_factorLevels = (TRIFactorLevelCaching *)v57;

          }
          else
          {
            objc_initWeak(location, v18);
            v60 = [TRIPruningFactorLevelCache alloc];
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __90__TRIFPNamespaceFactorProvider_initWithPath_parentId_deploymentId_treatmentId_promotable___block_invoke;
            v62[3] = &unk_1E3BFF020;
            objc_copyWeak(&v65, location);
            v63 = v50;
            v64 = v14;
            v53 = -[TRIPruningFactorLevelCache initWithPruningDelaySeconds:loadFactorLevels:](v60, "initWithPruningDelaySeconds:loadFactorLevels:", v62, 5.0);
            v54 = v18->_factorLevels;
            v18->_factorLevels = (TRIFactorLevelCaching *)v53;

            objc_destroyWeak(&v65);
            objc_destroyWeak(location);
          }

          goto LABEL_35;
        }
      }
      else
      {
        TRILogCategory_ClientFramework();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v27;
          _os_log_error_impl(&dword_19B89C000, v50, OS_LOG_TYPE_ERROR, "Failed to open factor pack: %@", (uint8_t *)location, 0xCu);
        }
      }

      goto LABEL_39;
    }
  }
  if (!v18->_fbFactorPath)
  {
    TRILogCategory_ClientFramework();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_19B89C000, v27, OS_LOG_TYPE_ERROR, "Failed to open factor pack storage based on any storage type", (uint8_t *)location, 2u);
    }
LABEL_39:

    goto LABEL_40;
  }
LABEL_35:

LABEL_36:
  v55 = v18;
LABEL_41:

  return v55;
}

id __90__TRIFPNamespaceFactorProvider_initWithPath_parentId_deploymentId_treatmentId_promotable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_factorLevelsWithFactorPackData:referencePath:outFactorPackId:outNamespaceName:outNCVs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (unsigned)namespaceId
{
  void *v3;
  unsigned int v5;

  v5 = 0;
  TRINamespace_NamespaceId_EnumDescriptor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v3, "getValue:forEnumTextFormatName:", &v5, self->_namespaceName);

  if ((_DWORD)self)
    return v5;
  else
    return 0;
}

- (id)namespaceName
{
  NSString *namespaceName;
  void *v4;
  NSObject *v5;
  void *v7;
  NSString *v8;
  int v9;
  void *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_isFlatbufferWriteEnabled && !self->_isFlatbufferReadEnabled)
  {
    namespaceName = self->_namespaceName;
    -[TRIFBFastFactorLevels namespaceName](self->_fastFactorLevels, "namespaceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(namespaceName) = -[NSString isEqualToString:](namespaceName, "isEqualToString:", v4);

    if ((namespaceName & 1) == 0)
    {
      TRILogCategory_ClientFramework();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        -[TRIFBFastFactorLevels namespaceName](self->_fastFactorLevels, "namespaceName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = self->_namespaceName;
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "Flatbuffer namespace name: %@ does not match with protobuf name: %@", (uint8_t *)&v9, 0x16u);

      }
    }
  }
  return self->_namespaceName;
}

- (id)rolloutId
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSString *parentId;
  int deploymentId;
  TRIFactorPackId *v10;
  TRIFactorPackId *factorPackId;
  int v12;
  NSObject *v13;
  __int16 v14;
  _WORD v15[17];

  *(_QWORD *)&v15[13] = *MEMORY[0x1E0C80C00];
  if (self->_isFlatbufferWriteEnabled && !self->_isFlatbufferReadEnabled)
  {
    -[TRIFBFastFactorLevels sourceAsFactorPackId](self->_fastFactorLevels, "sourceAsFactorPackId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[TRIFBFastFactorLevels sourceAsFactorPackId](self->_fastFactorLevels, "sourceAsFactorPackId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateFactorPackId(v4);
      v5 = objc_claimAutoreleasedReturnValue();

      if ((-[NSObject isEqualToString:](v5, "isEqualToString:", self->_factorPackId) & 1) == 0)
      {
        TRILogCategory_ClientFramework();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          factorPackId = self->_factorPackId;
          v12 = 138412546;
          v13 = v5;
          v14 = 2112;
          *(_QWORD *)v15 = factorPackId;
          _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, "Flatbuffer rollout id: %@ does not match with protobuf rollout id: %@", (uint8_t *)&v12, 0x16u);
        }

      }
    }
    else
    {
      TRILogCategory_ClientFramework();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        parentId = self->_parentId;
        deploymentId = self->_deploymentId;
        v10 = self->_factorPackId;
        v12 = 138543874;
        v13 = parentId;
        v14 = 1024;
        *(_DWORD *)v15 = deploymentId;
        v15[2] = 2114;
        *(_QWORD *)&v15[3] = v10;
        _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier within TRIFBFastFactorLevels object for rollout:%{public}@ deployment:%d, factor-pack: %{public}@", (uint8_t *)&v12, 0x1Cu);
      }
    }

  }
  return self->_factorPackId;
}

- (id)_readAllFactorLevelsFromStorage
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  TRIFactorLevelCaching *factorLevels;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  NSString *namespaceName;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  void *context;
  id v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[4];
  id v59;
  uint8_t buf[4];
  NSString *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  v4 = MEMORY[0x1E0C809B0];
  if (self->_isFlatbufferReadEnabled)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    factorLevels = self->_factorLevels;
    v58[0] = v4;
    v58[1] = 3221225472;
    v58[2] = __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke;
    v58[3] = &unk_1E3BFEBB8;
    v5 = v6;
    v59 = v5;
    -[TRIFactorLevelCaching enumerateFactorLevelsUsingBlock:](factorLevels, "enumerateFactorLevelsUsingBlock:", v58);

  }
  if (self->_isFlatbufferWriteEnabled)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[TRIFBFastFactorLevels levels](self->_fastFactorLevels, "levels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    -[TRIFBFastFactorLevels levels](self->_fastFactorLevels, "levels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v4;
    v56[1] = 3221225472;
    v56[2] = __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_2;
    v56[3] = &unk_1E3BFEC30;
    v56[4] = self;
    v12 = v10;
    v57 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v56);

    if (!self->_isFlatbufferReadEnabled)
    {
      v52 = v3;
      context = (void *)MEMORY[0x1A1AC6B8C]();
      objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v12;
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_6);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqual:") & 1) == 0)
      {
        v14 = objc_msgSend(v13, "count");
        if (v14 == objc_msgSend(v55, "count"))
        {
          if (objc_msgSend(v13, "count"))
          {
            v16 = 0;
            v53 = 0;
            *(_QWORD *)&v15 = 138412290;
            v49 = v15;
            v54 = v13;
            while (1)
            {
              objc_msgSend(v13, "objectAtIndexedSubscript:", v16, v49);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectAtIndexedSubscript:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "factor");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "id_p");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "factor");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "id_p");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v20, "isEqualToString:", v22);

              if ((v23 & 1) != 0)
                break;
              v33 = v53;
              if (v53 <= 2)
              {
                TRILogCategory_ClientFramework();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v17, "factor");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "id_p");
                  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "factor");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "id_p");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v61 = v37;
                  v62 = 2112;
                  v63 = (uint64_t)v39;
                  _os_log_error_impl(&dword_19B89C000, v35, OS_LOG_TYPE_ERROR, "primary id does not match for factors in arrays, pb:%@, fb:%@", buf, 0x16u);

                  v33 = v53;
                }
LABEL_22:

                v53 = v33 + 1;
              }
LABEL_23:

              ++v16;
              v13 = v54;
              if (objc_msgSend(v54, "count") <= v16)
                goto LABEL_29;
            }
            if ((objc_msgSend(v17, "isEqual:", v18) & 1) != 0)
              goto LABEL_23;
            objc_msgSend(v18, "factor");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "metadataKeysArray");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "factor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "metadataKeysArray");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25 == v27)
              goto LABEL_23;
            objc_msgSend(v18, "level");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "metadata");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "level");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "metadata");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v29, "isEqualToDictionary:", v31);

            if ((v32 & 1) != 0)
              goto LABEL_23;
            v33 = v53;
            if (v53 > 2)
              goto LABEL_23;
            TRILogCategory_ClientFramework();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v49;
              v61 = (NSString *)v18;
              _os_log_error_impl(&dword_19B89C000, v34, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage:%@ does not match factor level from pb", buf, 0xCu);
            }

            TRILogCategory_ClientFramework();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v49;
              v61 = (NSString *)v17;
              _os_log_error_impl(&dword_19B89C000, v35, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage does not match factor level from pb: %@", buf, 0xCu);
            }
            goto LABEL_22;
          }
        }
        else
        {
          TRILogCategory_ClientFramework();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            namespaceName = self->_namespaceName;
            v47 = objc_msgSend(v13, "count");
            v48 = objc_msgSend(v55, "count");
            *(_DWORD *)buf = 138412802;
            v61 = namespaceName;
            v62 = 2048;
            v63 = v47;
            v64 = 2048;
            v65 = v48;
            _os_log_error_impl(&dword_19B89C000, v40, OS_LOG_TYPE_ERROR, "Factor levels from flatbuffers do not match factor levels for protobuf for namespace: %@, with counts forPb:%lu forFb:%lu", buf, 0x20u);
          }

        }
      }
LABEL_29:

      objc_autoreleasePoolPop(context);
      v12 = v51;
      v3 = v52;
    }

  }
  else
  {
    v12 = 0;
  }
  if (self->_isFlatbufferReadEnabled)
  {
    v41 = v12;

    v5 = v41;
  }
  v42 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v5)
    v43 = v5;
  else
    v43 = (id)MEMORY[0x1E0C9AA60];
  v44 = (void *)objc_msgSend(v42, "initWithArray:copyItems:", v43, 1);

  objc_autoreleasePoolPop(v3);
  return v44;
}

uint64_t __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "namespaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFlatbufferUtils convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:](TRIFlatbufferUtils, "convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:", v7, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  objc_autoreleasePoolPop(v3);

}

uint64_t __63__TRIFPNamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "factor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "id_p");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "id_p");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (id)factorLevels
{
  if (-[NSMutableDictionary count](self->_warmupPersistentFactorLevelCache, "count"))
    -[NSMutableDictionary allValues](self->_warmupPersistentFactorLevelCache, "allValues");
  else
    -[TRIFPNamespaceFactorProvider _readAllFactorLevelsFromStorage](self, "_readAllFactorLevelsFromStorage");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cacheFactorLevels
{
  id v3;
  _QWORD v4[5];

  -[TRIFPNamespaceFactorProvider _readAllFactorLevelsFromStorage](self, "_readAllFactorLevelsFromStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__TRIFPNamespaceFactorProvider_cacheFactorLevels__block_invoke;
  v4[3] = &unk_1E3BFEC78;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __49__TRIFPNamespaceFactorProvider_cacheFactorLevels__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v3 = a2;
  objc_msgSend(v3, "factor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (TRIFactorPackId)factorPackId
{
  return self->_factorPackId;
}

- (BOOL)promotable
{
  return self->_promotable;
}

@end
