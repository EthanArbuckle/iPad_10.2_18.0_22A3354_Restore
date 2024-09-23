@implementation TRINamespaceFactorProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencePath, 0);
  objc_storeStrong((id *)&self->_fastFactorLevels, 0);
  objc_storeStrong((id *)&self->_warmupPersistentFactorLevelCache, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_factorDirectoryLock, 0);
  objc_storeStrong((id *)&self->_factorLevels, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

uint64_t __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

id __119__TRINamespaceFactorProvider_factorLevelsWithTreatmentData_referencePath_filteredByNamespaceName_outTreatmentId_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC6B8C]();
  if (!objc_msgSend(v3, "hasFactor"))
    goto LABEL_16;
  objc_msgSend(v3, "factor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isInNamespaceName:", a1[4]))
  {
LABEL_18:
    v28 = 0;
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v3, "factor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasName") & 1) == 0)
  {

    goto LABEL_18;
  }
  v7 = objc_msgSend(v3, "hasLevel");

  if (v7)
  {
    objc_msgSend(v3, "level");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileOrDirectoryLevelWithIsDir:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (a1[5])
    {
      if (v5)
      {
        if (objc_msgSend(v5, "hasPath"))
        {
          objc_msgSend(v5, "path");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isAbsolutePath");

          if ((v10 & 1) == 0)
          {
            v11 = (void *)a1[5];
            objc_msgSend(v5, "path");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setPath:", v13);

          }
        }
      }
    }
    objc_msgSend(v3, "factor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasNamespaceName");

    if (v15)
    {
      v16 = (void *)a1[6];
      objc_msgSend(v3, "factor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "namespaceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "intern:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "factor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setNamespaceName:", v19);

    }
    if (objc_msgSend(v5, "hasAsset"))
    {
      objc_msgSend(v5, "asset");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "hasTreatmentId");

      if (v22)
      {
        v23 = (void *)a1[6];
        objc_msgSend(v5, "asset");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "treatmentId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "intern:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "asset");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setTreatmentId:", v26);

      }
    }
    v28 = v3;
    goto LABEL_19;
  }
LABEL_16:
  v28 = 0;
LABEL_20:
  objc_autoreleasePoolPop(v4);

  return v28;
}

void __81__TRINamespaceFactorProvider_populateMAPathsForFactorLevels_loadedFromParentDir___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;

  v49 = a2;
  objc_msgSend(v49, "level");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "levelOneOfCase");

  if (v4 == 104)
  {
    v5 = objc_msgSend(v49, "copy");
    v6 = (void *)objc_opt_new();
    objc_msgSend(v49, "level");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mobileAssetReferenceValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasIsOnDemand");

    if (v9)
    {
      objc_msgSend(v49, "level");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mobileAssetReferenceValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIsOnDemand:", objc_msgSend(v11, "isOnDemand"));

    }
    v45 = (void *)v5;
    v48 = a1;
    objc_msgSend(v49, "level");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mobileAssetReferenceValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasSize");

    if (v14)
    {
      objc_msgSend(v49, "level");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mobileAssetReferenceValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "size");
      objc_msgSend(v6, "asset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSize:", v17);

    }
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v49, "level");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mobileAssetReferenceValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "assetType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "level");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "mobileAssetReferenceValue");
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "assetSpecifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "level");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mobileAssetReferenceValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "assetVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@-%@-%@"), v20, v24, v27);
    objc_msgSend(v22, "asset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAssetId:", v28);

    v30 = v22;
    v32 = *(_QWORD *)(v48 + 40);
    v31 = *(void **)(v48 + 48);
    objc_msgSend(v49, "factor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_maAutoAssetReferencedInDir:byFactorName:", v32, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      objc_msgSend(v30, "setPath:", v35);
    objc_msgSend(v49, "level");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "mobileAssetReferenceValue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v37, "hasIsFileFactor") & 1) != 0)
    {
      objc_msgSend(v49, "level");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "mobileAssetReferenceValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isFileFactor");

      v41 = v45;
      if (v40)
      {
        objc_msgSend(v45, "factor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setType:", 100);

        objc_msgSend(v45, "level");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setFileValue:", v30);
LABEL_14:

        objc_msgSend(*(id *)(v48 + 32), "addObject:", v41);
        goto LABEL_15;
      }
    }
    else
    {

      v41 = v45;
    }
    objc_msgSend(v41, "factor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setType:", 101);

    objc_msgSend(v41, "level");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setDirectoryValue:", v30);
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v49);
LABEL_15:

}

+ (id)factorProviderWithNamespaceName:(id)a3 paths:(id)a4 treatmentLayer:(unint64_t)a5 faultOnMissingFactors:(BOOL)a6 shouldLockFactorDirectory:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v24;

  v7 = a7;
  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = v14;
  switch(a5)
  {
    case 1uLL:
      objc_msgSend(v14, "namespaceDescriptorsDefaultDir");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      objc_msgSend(v14, "namespaceDescriptorsRolloutDir");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_15;
    case 4uLL:
      goto LABEL_5;
    case 8uLL:
      objc_msgSend(v14, "namespaceDescriptorsDevOverrideDir");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      if (a5 == 16)
      {
        objc_msgSend(v14, "namespaceDescriptorsBMLTDir");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a5 != 32)
          goto LABEL_15;
LABEL_5:
        objc_msgSend(v14, "namespaceDescriptorsExperimentDir");
        v16 = objc_claimAutoreleasedReturnValue();
      }
LABEL_9:
      v17 = (void *)v16;
      if (v16)
        goto LABEL_10;
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRINamespaceFactorProvider.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

      v17 = 0;
LABEL_10:
      +[TRINamespaceDescriptor loadWithNamespaceName:fromDirectory:](TRINamespaceDescriptor, "loadWithNamespaceName:fromDirectory:", v13, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18
        && (objc_msgSend(v18, "namespaceName"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "isEqualToString:", v13),
            v20,
            v21))
      {
        +[TRINamespaceFactorProvider factorProviderWithNamespaceDescriptor:paths:faultOnMissingFactors:shouldLockFactorDirectory:](TRINamespaceFactorProvider, "factorProviderWithNamespaceDescriptor:paths:faultOnMissingFactors:shouldLockFactorDirectory:", v19, v15, v8, v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }

      return v22;
  }
}

+ (id)factorProviderWithNamespaceDescriptor:(id)a3 paths:(id)a4 faultOnMissingFactors:(BOOL)a5 shouldLockFactorDirectory:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  TRINaiveFactorLevelCache *v16;
  TRIReferenceManagedDirReaderLock *v17;
  TRINaiveFactorLevelCache *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v6 = a6;
  v7 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "factorsAbsolutePathAsOwner:", +[TRIProcessInfo hostingProcessIsTriald](TRIProcessInfo, "hostingProcessIsTriald") ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v18 = [TRINaiveFactorLevelCache alloc];
    v16 = -[TRINaiveFactorLevelCache initWithFactorLevels:](v18, "initWithFactorLevels:", MEMORY[0x1E0C9AA60]);
    v19 = objc_alloc((Class)a1);
    objc_msgSend(v10, "namespaceName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v19, "initWithNamespaceName:namespaceCompatibilityVersion:paths:referencePath:factorLevels:fastFactorLevels:treatmentId:factorDirectoryLock:", v20, objc_msgSend(v10, "downloadNCV"), v11, 0, v16, 0, 0, 0);

LABEL_33:
    goto LABEL_34;
  }
  *__error() = 0;
  if (v7
    || (v13 = objc_retainAutorelease(v12), !access((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 4))
    || *__error() != 1)
  {
    objc_msgSend(v12, "stringByDeletingLastPathComponent");
    v16 = (TRINaiveFactorLevelCache *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v17 = -[TRIReferenceManagedDirReaderLock initWithDir:]([TRIReferenceManagedDirReaderLock alloc], "initWithDir:", v16);
      if (!v17)
      {
        TRILogCategory_ClientFramework();
        v17 = (TRIReferenceManagedDirReaderLock *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v12;
          _os_log_impl(&dword_19B89C000, &v17->super, OS_LOG_TYPE_DEFAULT, "Unable to acquire lock on factory directory: %@. Returning nil factor provider", buf, 0xCu);
        }
        v15 = 0;
        goto LABEL_32;
      }
    }
    else
    {
      v17 = 0;
    }
    v33 = 0;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v12, 8, &v33);
    v22 = v33;
    if (v21)
    {
      if (objc_msgSend(v21, "length"))
      {
        v23 = objc_msgSend(v12, "hasSuffix:", CFSTR(".fb"));
        v32 = 0;
        v24 = objc_alloc((Class)a1);
        objc_msgSend(v10, "namespaceName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v24, "initWithNamespaceName:treatmentData:namespaceCompatibilityVersion:paths:referencePath:isFlatbufferStorage:factorDirectoryLock:error:", v25, v21, objc_msgSend(v10, "downloadNCV"), v11, v16, v23, v17, &v32);

        if (!v15)
        {
          TRILogCategory_ClientFramework();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v35 = v12;
            v36 = 2112;
            v37 = v32;
            _os_log_error_impl(&dword_19B89C000, v26, OS_LOG_TYPE_ERROR, "Failed to parse ClientTreatment from file \"%@\": %@", buf, 0x16u);
          }

        }
        goto LABEL_31;
      }
      TRILogCategory_ClientFramework();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "namespaceName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v29;
        v36 = 2112;
        v37 = v12;
        _os_log_impl(&dword_19B89C000, v28, OS_LOG_TYPE_DEFAULT, "Factors file for namespace %@ at path %@ was empty, acting as if the file didn't exist", buf, 0x16u);

      }
    }
    else
    {
      if (v7)
      {
        TRILogCategory_ClientFramework();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "namespaceName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v35 = v31;
          v36 = 2112;
          v37 = v12;
          v38 = 2112;
          v39 = v22;
          _os_log_error_impl(&dword_19B89C000, v27, OS_LOG_TYPE_ERROR, "No factor for namespace %@ found at path: %@ (%@)", buf, 0x20u);

        }
      }
      TRILogCategory_ClientFramework();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v12;
        v36 = 2112;
        v37 = v22;
        _os_log_error_impl(&dword_19B89C000, v28, OS_LOG_TYPE_ERROR, "Failed to read data from file %@: %@", buf, 0x16u);
      }
    }

    v15 = 0;
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  TRILogCategory_ClientFramework();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v13;
    _os_log_impl(&dword_19B89C000, v14, OS_LOG_TYPE_DEFAULT, "factors defined at %@ are not accessible with triald sandbox", buf, 0xCu);
  }

  v15 = 0;
LABEL_34:

  return v15;
}

- (TRINamespaceFactorProvider)initWithNamespaceName:(id)a3 treatmentData:(id)a4 namespaceCompatibilityVersion:(unsigned int)a5 paths:(id)a6 referencePath:(id)a7 isFlatbufferStorage:(BOOL)a8 factorDirectoryLock:(id)a9 error:(id *)a10
{
  _BOOL4 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  int v22;
  void *v23;
  void *v24;
  TRINamespaceFactorProvider *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  uint64_t v30;
  TRINaiveFactorLevelCache *v31;
  void *v32;
  TRIPruningFactorLevelCache *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v38;
  void *v39;
  id v40;
  int v41;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id *v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v10 = a8;
  v56 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v43 = MEMORY[0x1A1AC6B8C]();
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProvider.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProvider.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentData"));

LABEL_3:
  if (v10)
  {
    v21 = _os_feature_enabled_impl();
    v22 = _os_feature_enabled_impl() ^ 1;
  }
  else
  {
    v21 = 0;
    v22 = 1;
  }
  v41 = v22;
  v49 = 0;
  objc_msgSend((id)objc_opt_class(), "factorLevelsWithTreatmentData:referencePath:filteredByNamespaceName:outTreatmentId:error:", v17, v19, v16, &v49, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if ((v21 & 1) != 0 || v23)
  {
    v40 = v18;
    v27 = objc_msgSend(v23, "count");
    TRILogCategory_ClientFramework();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
    if (v27 > 0x10)
    {
      if (v29)
      {
        v34 = objc_msgSend(v24, "count");
        *(_DWORD *)buf = 134218498;
        v51 = v34;
        v52 = 2112;
        v53 = v49;
        v54 = 2112;
        v55 = v16;
        _os_log_impl(&dword_19B89C000, v28, OS_LOG_TYPE_INFO, "Found %tu factors in treatment \"%@\" for namespace \"%@\"; using pruning cache",
          buf,
          0x20u);
      }

      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __162__TRINamespaceFactorProvider_initWithNamespaceName_treatmentData_namespaceCompatibilityVersion_paths_referencePath_isFlatbufferStorage_factorDirectoryLock_error___block_invoke;
      v44[3] = &unk_1E3BFEBE0;
      v45 = v17;
      v46 = v19;
      v47 = v16;
      v48 = a10;
      v35 = (void *)MEMORY[0x1A1AC6D30](v44);
      v33 = -[TRIPruningFactorLevelCache initWithPruningDelaySeconds:loadFactorLevels:]([TRIPruningFactorLevelCache alloc], "initWithPruningDelaySeconds:loadFactorLevels:", v35, 5.0);

    }
    else
    {
      if (v29)
      {
        v30 = objc_msgSend(v24, "count");
        *(_DWORD *)buf = 134218498;
        v51 = v30;
        v52 = 2112;
        v53 = v49;
        v54 = 2112;
        v55 = v16;
        _os_log_impl(&dword_19B89C000, v28, OS_LOG_TYPE_INFO, "Found %tu factors in treatment \"%@\" for namespace \"%@\"; using naive cache",
          buf,
          0x20u);
      }

      v31 = [TRINaiveFactorLevelCache alloc];
      if (v24)
        v32 = v24;
      else
        v32 = (void *)MEMORY[0x1E0C9AA60];
      v33 = -[TRINaiveFactorLevelCache initWithFactorLevels:](v31, "initWithFactorLevels:", v32);
    }
    v18 = v40;
    if (((!v10 | v41) & 1) != 0)
      v36 = 0;
    else
      v36 = -[TRIFBFastFactorLevels initVerifiedRootObjectFromData:]([TRIFBFastFactorLevels alloc], "initVerifiedRootObjectFromData:", v17);
    v26 = (void *)v43;
    self = -[TRINamespaceFactorProvider initWithNamespaceName:namespaceCompatibilityVersion:paths:referencePath:factorLevels:fastFactorLevels:treatmentId:factorDirectoryLock:](self, "initWithNamespaceName:namespaceCompatibilityVersion:paths:referencePath:factorLevels:fastFactorLevels:treatmentId:factorDirectoryLock:", v16, a5, v40, v19, v33, v36, v49, v20);

    v25 = self;
  }
  else
  {
    v25 = 0;
    v26 = (void *)v43;
  }

  objc_autoreleasePoolPop(v26);
  return v25;
}

- (TRINamespaceFactorProvider)initWithNamespaceName:(id)a3 namespaceCompatibilityVersion:(unsigned int)a4 paths:(id)a5 referencePath:(id)a6 factorLevels:(id)a7 fastFactorLevels:(id)a8 treatmentId:(id)a9 factorDirectoryLock:(id)a10
{
  id v16;
  unint64_t v17;
  unint64_t v18;
  TRINamespaceFactorProvider *v19;
  TRINamespaceFactorProvider *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *warmupPersistentFactorLevelCache;
  void *v24;
  void *v25;
  id obj;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v16 = a3;
  v32 = a5;
  v31 = a6;
  v17 = (unint64_t)a7;
  obj = a8;
  v18 = (unint64_t)a8;
  v30 = a9;
  v29 = a10;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProvider.m"), 384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  if (!(v17 | v18))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProvider.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorLevels"));

  }
  v33.receiver = self;
  v33.super_class = (Class)TRINamespaceFactorProvider;
  v19 = -[TRINamespaceFactorProvider init](&v33, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_namespaceName, a3);
    v20->_namespaceCompatibilityVersion = a4;
    objc_storeStrong((id *)&v20->_factorLevels, a7);
    objc_storeStrong((id *)&v20->_treatmentId, a9);
    objc_storeStrong((id *)&v20->_factorDirectoryLock, a10);
    objc_storeStrong((id *)&v20->_paths, a5);
    if (v18)
    {
      v20->_isFBReadEnabled = _os_feature_enabled_impl();
      v20->_isFBWriteEnabled = _os_feature_enabled_impl();
      objc_storeStrong((id *)&v20->_referencePath, a6);
      objc_storeStrong((id *)&v20->_fastFactorLevels, obj);
    }
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    warmupPersistentFactorLevelCache = v20->_warmupPersistentFactorLevelCache;
    v20->_warmupPersistentFactorLevelCache = v21;

  }
  return v20;
}

- (unsigned)namespaceCompatibilityVersion
{
  return self->_namespaceCompatibilityVersion;
}

- (id)factorLevels
{
  if (-[NSMutableDictionary count](self->_warmupPersistentFactorLevelCache, "count"))
    -[NSMutableDictionary allValues](self->_warmupPersistentFactorLevelCache, "allValues");
  else
    -[TRINamespaceFactorProvider _readAllFactorLevelsFromStorage](self, "_readAllFactorLevelsFromStorage");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_readAllFactorLevelsFromStorage
{
  void *v3;
  void *v4;
  TRIFactorLevelCaching *factorLevels;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
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
  id v52;
  void *v53;
  void *v54;
  int v55;
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
  v4 = (void *)objc_opt_new();
  factorLevels = self->_factorLevels;
  v6 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke;
  v58[3] = &unk_1E3BFEBB8;
  v7 = v4;
  v59 = v7;
  -[TRIFactorLevelCaching enumerateFactorLevelsUsingBlock:](factorLevels, "enumerateFactorLevelsUsingBlock:", v58);
  if (self->_isFBWriteEnabled)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[TRIFBFastFactorLevels levels](self->_fastFactorLevels, "levels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    -[TRIFBFastFactorLevels levels](self->_fastFactorLevels, "levels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v6;
    v56[1] = 3221225472;
    v56[2] = __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_2;
    v56[3] = &unk_1E3BFEC30;
    v56[4] = self;
    v12 = v10;
    v57 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v56);

    if (!self->_isFBReadEnabled)
    {
      v53 = v3;
      context = (void *)MEMORY[0x1A1AC6B8C]();
      v52 = v7;
      objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v12;
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "count");
      v54 = v14;
      if (v15 == objc_msgSend(v14, "count"))
      {
        if (objc_msgSend(v13, "count"))
        {
          v17 = 0;
          v55 = 0;
          *(_QWORD *)&v16 = 138412290;
          v49 = v16;
          while (1)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v17, v49);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectAtIndexedSubscript:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "factor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "id_p");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "factor");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "id_p");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v21, "isEqualToString:", v23);

            if ((v24 & 1) != 0)
              break;
            if (v55 <= 2)
            {
              TRILogCategory_ClientFramework();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v18, "factor");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "id_p");
                v37 = (NSString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "factor");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "id_p");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v61 = v37;
                v62 = 2112;
                v63 = (uint64_t)v39;
                _os_log_error_impl(&dword_19B89C000, v35, OS_LOG_TYPE_ERROR, "primary id does not match for factors in arrays, pb:%@, fb:%@", buf, 0x16u);

              }
LABEL_18:

              ++v55;
            }
LABEL_19:

            if (objc_msgSend(v13, "count") <= (unint64_t)++v17)
              goto LABEL_25;
          }
          if ((objc_msgSend(v18, "isEqual:", v19) & 1) != 0)
            goto LABEL_19;
          objc_msgSend(v19, "factor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "metadataKeysArray");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "factor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "metadataKeysArray");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26 == v28)
            goto LABEL_19;
          objc_msgSend(v19, "level");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "metadata");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "level");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "metadata");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v30, "isEqualToDictionary:", v32);

          if ((v33 & 1) != 0 || v55 > 2)
            goto LABEL_19;
          TRILogCategory_ClientFramework();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v49;
            v61 = (NSString *)v19;
            _os_log_error_impl(&dword_19B89C000, v34, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage:%@ does not match factor level from pb", buf, 0xCu);
          }

          TRILogCategory_ClientFramework();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v49;
            v61 = (NSString *)v18;
            _os_log_error_impl(&dword_19B89C000, v35, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage does not match factor level from pb: %@", buf, 0xCu);
          }
          goto LABEL_18;
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
          v48 = objc_msgSend(v54, "count");
          *(_DWORD *)buf = 138412802;
          v61 = namespaceName;
          v62 = 2048;
          v63 = v47;
          v64 = 2048;
          v65 = v48;
          _os_log_error_impl(&dword_19B89C000, v40, OS_LOG_TYPE_ERROR, "Factor levels from flatbuffers do not match factor levels for protobuf for namespace: %@, with counts forPb:%lu forFb:%lu", buf, 0x20u);
        }

      }
LABEL_25:

      objc_autoreleasePoolPop(context);
      v7 = v52;
      v3 = v53;
      v12 = v51;
    }

  }
  else
  {
    v12 = 0;
  }
  if (self->_isFBReadEnabled)
  {
    v41 = v12;

    v7 = v41;
  }
  v42 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v7)
    v43 = v7;
  else
    v43 = (id)MEMORY[0x1E0C9AA60];
  v44 = (void *)objc_msgSend(v42, "initWithArray:copyItems:", v43, 1);

  objc_autoreleasePoolPop(v3);
  return v44;
}

+ (id)factorLevelsWithTreatmentData:(id)a3 referencePath:(id)a4 filteredByNamespaceName:(id)a5 outTreatmentId:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  id (*v32)(_QWORD *, void *);
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void *)MEMORY[0x1A1AC6B8C]();
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0DC0EA8], "parseFromData:error:", v11, &v37);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v37;
  if (v15)
  {

    objc_autoreleasePoolPop(v14);
    if (a6)
    {
      if (objc_msgSend(v15, "hasTreatmentId"))
      {
        objc_msgSend(v15, "treatmentId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      v20 = *a6;
      *a6 = v17;

    }
    if (objc_msgSend(v15, "factorLevelArray_Count"))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815B8]), "initWithBehavior:copyWithZone:", 1, 0);
      v22 = (id)objc_msgSend(v21, "intern:", v13);
      if (objc_msgSend(v15, "hasTreatmentId"))
      {
        objc_msgSend(v15, "treatmentId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v21, "intern:", v23);

      }
      objc_msgSend(v15, "factorLevelArray");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __119__TRINamespaceFactorProvider_factorLevelsWithTreatmentData_referencePath_filteredByNamespaceName_outTreatmentId_error___block_invoke;
      v33 = &unk_1E3BFEC08;
      v34 = v13;
      v26 = v12;
      v35 = v26;
      v27 = v21;
      v36 = v27;
      objc_msgSend(v25, "_pas_mappedArrayWithTransform:", &v30);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        +[TRINamespaceFactorProvider populateMAPathsForFactorLevels:loadedFromParentDir:](TRINamespaceFactorProvider, "populateMAPathsForFactorLevels:loadedFromParentDir:", v28, v26, v30, v31, v32, v33, v34, v35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v18 = *a7;
    *a7 = v16;

    objc_autoreleasePoolPop(v14);
    v19 = 0;
  }

  return v19;
}

+ (id)populateMAPathsForFactorLevels:(id)a3 loadedFromParentDir:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC6B8C]();
  if (v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__TRINamespaceFactorProvider_populateMAPathsForFactorLevels_loadedFromParentDir___block_invoke;
    v13[3] = &unk_1E3BFEB90;
    v14 = v9;
    v16 = a1;
    v15 = v7;
    v10 = v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v10, 1);

  }
  else
  {
    v11 = v6;
  }
  objc_autoreleasePoolPop(v8);

  return v11;
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
  NSString *referencePath;
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
  void *v28;
  void *v29;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSMutableDictionary count](self->_warmupPersistentFactorLevelCache, "count"))
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
    if (self->_isFBWriteEnabled)
    {
      -[TRIFBFastFactorLevels levelsAsDict](self->_fastFactorLevels, "levelsAsDict");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        referencePath = self->_referencePath;
        -[TRIFBFastFactorLevels namespaceName](self->_fastFactorLevels, "namespaceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIFlatbufferUtils convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:](TRIFlatbufferUtils, "convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:", v12, referencePath, v14, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
      if (!self->_isFBReadEnabled && (objc_msgSend(v6, "isEqual:", v15) & 1) == 0)
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
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "metadata");
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
              *(_DWORD *)buf = 138412546;
              v33 = v15;
              v34 = 2112;
              v35 = v6;
              _os_log_error_impl(&dword_19B89C000, v27, OS_LOG_TYPE_ERROR, "factor level from flatbuffer storage:%@ does not match factor level from pb: %@", buf, 0x16u);
            }

          }
        }
      }
      if (v15)
      {
        objc_msgSend(v15, "level");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRILevelChecked wrapLevel:](TRILevelChecked, "wrapLevel:", v28);
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
    if (self->_isFBReadEnabled)
      v29 = v16;
    else
      v29 = v7;
    v8 = v29;

    goto LABEL_35;
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
LABEL_35:

    goto LABEL_36;
  }
  v8 = 0;
LABEL_36:

  return v8;
}

id __162__TRINamespaceFactorProvider_initWithNamespaceName_treatmentData_namespaceCompatibilityVersion_paths_referencePath_isFlatbufferStorage_factorDirectoryLock_error___block_invoke(_QWORD *a1)
{
  return +[TRINamespaceFactorProvider factorLevelsWithTreatmentData:referencePath:filteredByNamespaceName:outTreatmentId:error:](TRINamespaceFactorProvider, "factorLevelsWithTreatmentData:referencePath:filteredByNamespaceName:outTreatmentId:error:", a1[4], a1[5], a1[6], 0, a1[7]);
}

- (void)dispose
{
  -[TRIReferenceManagedDirReaderLock unlock](self->_factorDirectoryLock, "unlock");
}

+ (id)_maAutoAssetReferencedInDir:(id)a3 byFactorName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(v6, "triFilenameForFactorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/maRefs/%@"), v5, v8);
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v9, 4, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  objc_msgSend(v10, "triTrim");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (v11)
    {
      objc_msgSend(v11, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        v18 = objc_msgSend(v11, "code");

        if (v18 == 260)
          goto LABEL_18;
      }
      else
      {

      }
    }
    TRILogCategory_ClientFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v9;
      v24 = 2112;
      v25 = v11;
      _os_log_error_impl(&dword_19B89C000, v19, OS_LOG_TYPE_ERROR, "Unable to read MA path from reference path: %{public}@: %@", buf, 0x16u);
    }
LABEL_17:

LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v12, "length"))
  {
    TRILogCategory_ClientFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl(&dword_19B89C000, v19, OS_LOG_TYPE_DEFAULT, "Path for factor %{public}@ is empty. This usually means that the level is about to be deleted.", buf, 0xCu);
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

  if ((v14 & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v12;
      _os_log_error_impl(&dword_19B89C000, v15, OS_LOG_TYPE_ERROR, "Trial asset path does not exist on disk: %{public}@.", buf, 0xCu);
    }

  }
  v16 = v12;
LABEL_19:

  objc_autoreleasePoolPop(v7);
  return v16;
}

- (id)overlayLevelsFromFactorProvider:(id)a3
{
  id v5;
  void *v6;
  NSString *namespaceName;
  void *v8;
  void *v9;
  TRIFactorLevelCaching *factorLevels;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSString *v33;
  void *v34;
  void *v35;
  NSString *v36;
  SEL v37;
  void *v38;
  void *v39;
  NSString *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  NSObject *v46;
  uint8_t v47[128];
  uint8_t buf[4];
  NSString *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC6B8C]();
  namespaceName = self->_namespaceName;
  objc_msgSend(v5, "namespaceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(namespaceName) = -[NSString isEqualToString:](namespaceName, "isEqualToString:", v8);

  if ((namespaceName & 1) != 0)
  {
    v37 = a2;
    v38 = v6;
    v9 = (void *)objc_opt_new();
    factorLevels = self->_factorLevels;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __62__TRINamespaceFactorProvider_overlayLevelsFromFactorProvider___block_invoke;
    v45[3] = &unk_1E3BFEBB8;
    v11 = v9;
    v46 = v11;
    -[TRIFactorLevelCaching enumerateFactorLevelsUsingBlock:](factorLevels, "enumerateFactorLevelsUsingBlock:", v45);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = v5;
    objc_msgSend(v5, "factorLevels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v17, "factor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isInNamespaceName:", self->_namespaceName);

          if ((v19 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = self->_namespaceName;
            objc_msgSend(v17, "factor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "namespaceString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("TRINamespaceFactorProvider.m"), 283, CFSTR("namespace mismatch (exp %@, act %@)"), v36, v24);

          }
          objc_msgSend(v17, "factor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, v21);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v14);
    }

    v25 = (void *)objc_opt_new();
    v5 = v39;
    objc_msgSend(v39, "treatmentId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTreatmentId:", v26);

    -[NSObject allValues](v11, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");
    objc_msgSend(v25, "setFactorLevelArray:", v28);

    objc_msgSend(v25, "data");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("TRINamespaceFactorProvider.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentData"));

    }
    v40 = 0;
    v30 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNamespaceName:treatmentData:namespaceCompatibilityVersion:paths:referencePath:isFlatbufferStorage:factorDirectoryLock:error:", self->_namespaceName, v29, self->_namespaceCompatibilityVersion, self->_paths, 0, 0, 0, &v40);
    if (!v30)
    {
      TRILogCategory_ClientFramework();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v40;
        _os_log_error_impl(&dword_19B89C000, v31, OS_LOG_TYPE_ERROR, "Failed to parse ClientTreatment from in-memory representation: %@", buf, 0xCu);
      }

    }
    v6 = v38;
  }
  else
  {
    TRILogCategory_ClientFramework();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v33 = self->_namespaceName;
      objc_msgSend(v5, "namespaceName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v33;
      v50 = 2112;
      v51 = v34;
      _os_log_error_impl(&dword_19B89C000, v11, OS_LOG_TYPE_ERROR, "cannot set factor levels for namespace %@, provider is for different namespace %@", buf, 0x16u);

    }
    v30 = 0;
  }

  objc_autoreleasePoolPop(v6);
  return v30;
}

void __62__TRINamespaceFactorProvider_overlayLevelsFromFactorProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "factor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

- (id)experimentId
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_treatmentId && self->_namespaceName)
  {
    +[TRITreatmentInfo loadInfoForTreatment:namespaceName:paths:](TRITreatmentInfo, "loadInfoForTreatment:namespaceName:paths:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "experimentId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int)deploymentId
{
  void *v2;
  void *v3;
  int v4;

  if (!self->_treatmentId || !self->_namespaceName)
    return -1;
  +[TRITreatmentInfo loadInfoForTreatment:namespaceName:paths:](TRITreatmentInfo, "loadInfoForTreatment:namespaceName:paths:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "deploymentId");
  else
    v4 = -1;

  return v4;
}

- (id)treatmentId
{
  return self->_treatmentId;
}

- (id)rolloutId
{
  return 0;
}

+ (id)_assetFilenameForFactor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v5 = a3;
  if ((objc_msgSend(v5, "hasNamespaceName") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRINamespaceFactorProvider.m"), 588, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factor.hasNamespaceName"));

  }
  if ((objc_msgSend(v5, "hasName") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRINamespaceFactorProvider.m"), 589, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factor.hasName"));

  }
  objc_msgSend(v5, "namespaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  v22 = 0;
  objc_msgSend(v5, "namespaceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "triSanitizedPathComponentWithMaxLength:addHash:error:", 30, 0, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "namespaceName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRINamespaceFactorProvider.m"), 593, CFSTR("Could not get sanitized name for namespace %@: %@"), v19, v22);

  }
  objc_msgSend(v5, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "triSanitizedPathComponentWithMaxLength:addHash:error:", 50, 0, &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRINamespaceFactorProvider.m"), 595, CFSTR("Could not get sanitized name for factor %@: %@"), v21, v22);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ns-%@.%lu.%@"), v11, v9 + 37 * v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)pathForFactor:(id)a3 directory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_assetFilenameForFactor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  v12[0] = v6;
  v12[1] = CFSTR("assets");
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathWithComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)overwriteItemAtPath:(id)a3 withItemAtPath:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  v7 = (void *)MEMORY[0x1E0CB3620];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByStandardizingPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByStandardizingPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v10, "triCreateDirectoryForPath:isDirectory:error:", v12, 0, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && objc_msgSend(v10, "triRemoveItemAtPath:error:", v12, a5))
      v13 = objc_msgSend(v10, "triSafeCopyItemAtPath:toPath:error:", v11, v12, a5);
    else
      v13 = 0;
  }

  return v13;
}

- (id)_copyAssetsToDirectory:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  TRIFactorLevelCaching *factorLevels;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  TRINamespaceFactorProvider *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  SEL v33;
  void *v34;
  uint64_t v35;
  TRINamespaceFactorProvider *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC6B8C]();
  v7 = (void *)objc_opt_new();
  v36 = self;
  factorLevels = self->_factorLevels;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __53__TRINamespaceFactorProvider__copyAssetsToDirectory___block_invoke;
  v42[3] = &unk_1E3BFEBB8;
  v9 = v7;
  v43 = v9;
  -[TRIFactorLevelCaching enumerateFactorLevelsUsingBlock:](factorLevels, "enumerateFactorLevelsUsingBlock:", v42);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  v12 = v10;
  if (v11)
  {
    v13 = v11;
    v33 = a2;
    v34 = v6;
    v14 = *(_QWORD *)v39;
    v15 = v36;
    v35 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v17, "level");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileOrDirectoryLevelWithIsDir:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19 && (objc_msgSend(v19, "isOnDemand") & 1) == 0)
        {
          objc_msgSend(v19, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_opt_class();
          objc_msgSend(v17, "factor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "pathForFactor:directory:", v22, v5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v33, v15, CFSTR("TRINamespaceFactorProvider.m"), 637, CFSTR("failed to get asset path"));

          }
          v37 = 0;
          v24 = -[TRINamespaceFactorProvider overwriteItemAtPath:withItemAtPath:error:](v15, "overwriteItemAtPath:withItemAtPath:error:", v23, v20, &v37);
          v25 = v37;
          if (!v24)
          {
            TRILogCategory_ClientFramework();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v45 = v20;
              v46 = 2112;
              v47 = v23;
              v48 = 2112;
              v49 = v25;
              _os_log_error_impl(&dword_19B89C000, v31, OS_LOG_TYPE_ERROR, "failed to copy asset from %@ to %@ -- %@", buf, 0x20u);
            }

            v12 = 0;
            goto LABEL_18;
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "triPath:relativeToParentPath:", v23, v5);
          v27 = v10;
          v28 = v5;
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "setPath:", v29);
          v5 = v28;
          v10 = v27;
          v15 = v36;

          v14 = v35;
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v13)
        continue;
      break;
    }
    v12 = v10;
LABEL_18:
    v6 = v34;
  }

  objc_autoreleasePoolPop(v6);
  return v12;
}

void __53__TRINamespaceFactorProvider__copyAssetsToDirectory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)saveToPath:(id)a3 copyAssets:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  char v13;
  void *v14;
  TRIFactorLevelCaching *factorLevels;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v9, "triCreateDirectoryForPath:isDirectory:error:", v7, 0, &v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v25;
  if (!v10)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v7;
      v28 = 2112;
      v29 = v11;
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "failed to create directory for treatement at path %@ -- %@", buf, 0x16u);
    }
    v13 = 0;
    goto LABEL_16;
  }
  if (!v4)
  {
    v14 = (void *)objc_opt_new();
    factorLevels = self->_factorLevels;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__TRINamespaceFactorProvider_saveToPath_copyAssets___block_invoke;
    v23[3] = &unk_1E3BFEBB8;
    v12 = v14;
    v24 = v12;
    -[TRIFactorLevelCaching enumerateFactorLevelsUsingBlock:](factorLevels, "enumerateFactorLevelsUsingBlock:", v23);

    goto LABEL_9;
  }
  v12 = -[TRINamespaceFactorProvider _copyAssetsToDirectory:](self, "_copyAssetsToDirectory:", v10);
  if (v12)
  {
LABEL_9:
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setTreatmentId:", self->_treatmentId);
    v17 = -[NSObject mutableCopy](v12, "mutableCopy");
    objc_msgSend(v16, "setFactorLevelArray:", v17);

    objc_msgSend(v16, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProvider.m"), 683, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentData"));

    }
    v22 = 0;
    v13 = objc_msgSend(v18, "writeToFile:options:error:", v7, 1, &v22);
    v11 = v22;
    if ((v13 & 1) == 0)
    {
      TRILogCategory_ClientFramework();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v7;
        v28 = 2112;
        v29 = v11;
        _os_log_error_impl(&dword_19B89C000, v19, OS_LOG_TYPE_ERROR, "failed to save factors to file %@: %@", buf, 0x16u);
      }

    }
LABEL_16:

    goto LABEL_17;
  }
  v13 = 0;
LABEL_17:

  objc_autoreleasePoolPop(v8);
  return v13;
}

uint64_t __52__TRINamespaceFactorProvider_saveToPath_copyAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1A1AC6B8C]();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 80);
  objc_msgSend(*(id *)(v4 + 72), "namespaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFlatbufferUtils convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:](TRIFlatbufferUtils, "convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:", v8, v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  objc_autoreleasePoolPop(v3);

}

uint64_t __61__TRINamespaceFactorProvider__readAllFactorLevelsFromStorage__block_invoke_3(uint64_t a1, void *a2, void *a3)
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

- (void)cacheFactorLevels
{
  id v3;
  _QWORD v4[5];

  -[TRINamespaceFactorProvider _readAllFactorLevelsFromStorage](self, "_readAllFactorLevelsFromStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__TRINamespaceFactorProvider_cacheFactorLevels__block_invoke;
  v4[3] = &unk_1E3BFEC78;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __47__TRINamespaceFactorProvider_cacheFactorLevels__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v3 = a2;
  objc_msgSend(v3, "factor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (unsigned)namespaceId
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0DC0F18];
  -[TRINamespaceFactorProvider namespaceName](self, "namespaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "namespaceIdFromName:", v3);

  return v2;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

@end
