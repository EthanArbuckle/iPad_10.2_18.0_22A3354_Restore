@implementation TRIClientTreatment

void __67__TRIClientTreatment_CloudKit__assetURLsFromCKRecord_assetIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
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
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _BYTE *v38;
  void *context;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8232A5C]();
  v40 = a2;
  objc_msgSend(MEMORY[0x1E0C95048], "keyForListField:withIndexRange:", *MEMORY[0x1E0DC0DD8], a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = (uint64_t)v8;
    _os_log_debug_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEBUG, "asset key: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "triArrayValueForField:isNestedValue:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = (uint64_t)v10;
    _os_log_debug_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEBUG, "assetRange: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C95048], "keyForListField:withIndexRange:", *MEMORY[0x1E0DC0DD0], v40, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = (uint64_t)v12;
    _os_log_debug_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEBUG, "sig key: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "triArrayValueForField:isNestedValue:", v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = (uint64_t)v14;
    _os_log_debug_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEBUG, "sigRange: %@", buf, 0xCu);
  }

  if (objc_msgSend(v10, "count") == a3 && objc_msgSend(v14, "count") == a3)
  {
    v38 = a4;
    if (a3)
    {
      v16 = 0;
      while (1)
      {
        v17 = (void *)MEMORY[0x1D8232A5C]();
        v18 = v10;
        objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fileURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("TRIClientTreatment+CloudKit.m"), 117, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetRange[i].fileURL"));

        }
        v21 = *(void **)(a1 + 40);
        objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("TRIClientTreatment+CloudKit.m"), 120, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetURL.path"));

        }
        v24 = objc_msgSend(v21, "validateBase64Signature:forFile:", v22, v23);

        if ((v24 & 1) == 0)
          break;
        v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v40 + v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, v26);

        objc_autoreleasePoolPop(v17);
        ++v16;
        v10 = v18;
        if (a3 == v16)
          goto LABEL_23;
      }
      TRILogCategory_Server();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "recordID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = (uint64_t)v36;
        _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Bad assetSignature in Treatment record with CKRecordID %@", buf, 0xCu);

      }
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = 0;

      *v38 = 1;
      objc_autoreleasePoolPop(v17);
      v10 = v18;
    }
  }
  else
  {
    TRILogCategory_Server();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(v10, "count");
      v35 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 134218496;
      v42 = v34;
      v43 = 2048;
      v44 = v35;
      v45 = 2048;
      v46 = a3;
      _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "assetRange and sigRange have unexpected counts (%tu, %tu; expected %tu)",
        buf,
        0x20u);
    }

    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = 0;

    *a4 = 1;
  }
LABEL_23:

  objc_autoreleasePoolPop(context);
}

uint64_t __120__TRIClientTreatment_TRIUtil___triRequiredCKAssetsForInstallationWithAssetStore_subscriptionSettings_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  if (!objc_msgSend(a4, "isOnDemand"))
    goto LABEL_9;
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v8, "factor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "namespaceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subscribedFactorsForNamespaceName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v8, "factor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = v15 ? (void *)v15 : v14;
  v18 = v17;

  v19 = objc_msgSend(v12, "containsObject:", v18);
  if (!v19)
    v20 = 0;
  else
LABEL_9:
    v20 = objc_msgSend(*(id *)(a1 + 48), "hasAssetWithIdentifier:type:", v7, 0) ^ 1;

  return v20;
}

void __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a2, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasAssetType")
    && objc_msgSend(v8, "hasAssetSpecifier")
    && (objc_msgSend(v8, "hasAssetVersion") & 1) != 0)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC0AB0]);
    objc_msgSend(v8, "assetType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithType:specifier:version:", v11, v12, v13);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v14);
  }
  else
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "treatmentId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2114;
      v22 = v9;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has MA reference with missing information for factor %{public}@.", (uint8_t *)&v19, 0x16u);

    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

    *a5 = 1;
  }

}

uint64_t __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke_194(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TRIMAAssetMetadata *v19;
  uint64_t v20;
  void *v21;
  TRIMAAssetMetadata *v22;
  uint64_t v23;
  TRIRequiredMAAsset *v24;
  uint64_t v25;
  TRIRequiredMAAsset *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v33, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v9;
  v13 = v12;

  if ((objc_msgSend(v7, "hasAssetType") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("TRIClientTreatment+TRIUtil.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maRef.hasAssetType"));

  }
  if ((objc_msgSend(v7, "hasAssetSpecifier") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("TRIClientTreatment+TRIUtil.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maRef.hasAssetSpecifier"));

  }
  if ((objc_msgSend(v7, "hasAssetVersion") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("TRIClientTreatment+TRIUtil.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maRef.hasAssetVersion"));

  }
  v14 = objc_alloc(MEMORY[0x1E0DC0AB0]);
  objc_msgSend(v7, "assetType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetSpecifier");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithType:specifier:version:", v15, v16, v17);

  LOBYTE(v16) = +[TRIAssetMetadataReservedKeys isEncryptedForMetadata:](TRIAssetMetadataReservedKeys, "isEncryptedForMetadata:", v8);
  v19 = [TRIMAAssetMetadata alloc];
  v20 = objc_msgSend(v7, "size");
  if ((v16 & 1) != 0)
  {
    objc_msgSend(v33, "namespaceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TRIMAAssetMetadata initWithDownloadSize:namespaceNameForEncryptionKey:](v19, "initWithDownloadSize:namespaceNameForEncryptionKey:", v20, v21);

  }
  else
  {
    v22 = -[TRIMAAssetMetadata initWithDownloadSize:namespaceNameForEncryptionKey:](v19, "initWithDownloadSize:namespaceNameForEncryptionKey:", v20, 0);
  }
  v23 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", v18);
  v24 = [TRIRequiredMAAsset alloc];
  if (objc_msgSend(v7, "hasIsOnDemand"))
    v25 = objc_msgSend(v7, "isOnDemand");
  else
    v25 = 0;
  v26 = -[TRIRequiredMAAsset initWithFactorName:isInstalled:isOnDemand:metadata:fullAssetId:](v24, "initWithFactorName:isInstalled:isOnDemand:metadata:fullAssetId:", v13, v23, v25, v22, v18);
  v27 = *(void **)(a1 + 56);
  if (v27)
  {
    objc_msgSend(v33, "namespaceName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "subscribedFactorsForNamespaceName:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (!-[TRIRequiredMAAsset isOnDemand](v26, "isOnDemand") || objc_msgSend(v29, "containsObject:", v13))
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v26);

}

uint64_t __53__TRIClientTreatment_TRIUtil__unlinkedOnDemandAssets__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;
  uint64_t v5;

  v4 = a4;
  if (objc_msgSend(v4, "isOnDemand"))
    v5 = objc_msgSend(v4, "hasPath") ^ 1;
  else
    v5 = 0;

  return v5;
}

void __53__TRIClientTreatment_TRIUtil__unlinkedOnDemandAssets__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

@end
