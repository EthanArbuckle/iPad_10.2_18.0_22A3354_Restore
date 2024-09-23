@implementation TRIFactorDownloadValidator

+ (BOOL)validateDownloadForFactors:(id)a3 withNamespace:(id)a4 paths:(id)a5 container:(int *)a6 factorsState:(id)a7 assetIndexesByTreatment:(id *)a8 experimentIds:(id *)a9 assetIdsByFactorPack:(id *)a10 rolloutFactorNames:(id *)location rolloutDeployments:(id *)a12 error:(id *)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  char v22;
  TRINamespaceResolver *v23;
  TRINamespaceResolver *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  TRINamespaceFactorProviderChain *v29;
  int v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *context;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  char v52;
  _QWORD v53[5];
  id v54;
  id obj;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint8_t buf[4];
  id v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  context = (void *)MEMORY[0x1A1AC6B8C]();
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__6;
  v67 = __Block_byref_object_dispose__6;
  v68 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v57 = 0;
  v58 = 0;
  obj = 0;
  v56 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v53[4] = &v63;
  v54 = 0;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke;
  v53[3] = &unk_1E3BFF7D8;
  v21 = (void *)MEMORY[0x1A1AC6D30](v53);
  v22 = (char)a13;
  if (!objc_msgSend(v16, "count"))
  {
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v77 = *MEMORY[0x1E0CB2D50];
    v78[0] = CFSTR("Factors must be non-empty.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v31);
LABEL_12:
    v35 = (id)v33;
LABEL_14:
    v29 = 0;
    goto LABEL_15;
  }
  if (!v17)
  {
    v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v75 = *MEMORY[0x1E0CB2D50];
    v76 = CFSTR("Namespace name must be non-nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v34, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v31);
    goto LABEL_12;
  }
  if (!+[TRIXPCUtils validateSafeASCIISubsetIdentifier:](TRIXPCUtils, "validateSafeASCIISubsetIdentifier:", v17))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("namespaceName(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)"), v17);
    v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v73 = *MEMORY[0x1E0CB2D50];
    v74 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v37);

    goto LABEL_14;
  }
  v23 = -[TRINamespaceResolver initWithPaths:factorsState:]([TRINamespaceResolver alloc], "initWithPaths:factorsState:", v18, v19);
  v24 = v23;
  if (v23)
  {
    v52 = 0;
    -[TRINamespaceResolver resolveFactorProviderChainForNamespaceName:faultOnMissingInstalledFactors:installedFactorsAccessible:](v23, "resolveFactorProviderChainForNamespaceName:faultOnMissingInstalledFactors:installedFactorsAccessible:", v17, 0, &v52);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (!v52)
    {
      objc_msgSend(v25, "_pas_filteredArrayWithTest:", &__block_literal_global_14);
      v27 = objc_claimAutoreleasedReturnValue();

      TRILogCategory_ClientFramework();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v17;
        _os_log_impl(&dword_19B89C000, v28, OS_LOG_TYPE_DEFAULT, "encountered inaccessible installed factors during on-demand validation for namespace %@", buf, 0xCu);
      }

      v26 = (void *)v27;
    }
    v29 = -[TRINamespaceFactorProviderChain initWithNamespaceName:typedProviderChain:paths:]([TRINamespaceFactorProviderChain alloc], "initWithNamespaceName:typedProviderChain:paths:", v17, v26, v18);

    v47[0] = v20;
    v47[1] = 3221225472;
    v47[2] = __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke_64;
    v47[3] = &unk_1E3BFF820;
    v50 = &v63;
    v48 = v17;
    v51 = &v59;
    v49 = v21;
    -[TRINamespaceFactorProviderChain computeTreatmentAssetIndexes:withAssociatedExperimentIds:andFactorPackAssetIds:withAssociatedRolloutDeployments:withExperimentFactorNames:andRolloutFactorNames:forFactors:usingFilter:](v29, "computeTreatmentAssetIndexes:withAssociatedExperimentIds:andFactorPackAssetIds:withAssociatedRolloutDeployments:withExperimentFactorNames:andRolloutFactorNames:forFactors:usingFilter:", &v58, &v57, &v56, &v54, 0, &obj, v16, v47);

    v30 = 0;
    v31 = 0;
  }
  else
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to resolve namespaces for stale factorsState: %@"), v19);
    v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v71 = *MEMORY[0x1E0CB2D50];
    v72 = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v40, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v41);

    v29 = 0;
    v30 = 2;
  }
  -[TRINamespaceFactorProviderChain dispose](v29, "dispose");
  if (v30 == 2)
  {
    v35 = v31;
    if (!a13)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (location)
    objc_storeStrong(location, obj);
  v42 = (void *)v64[5];
  if (v42)
  {
    v35 = v42;
LABEL_15:

    if (!a13)
    {
LABEL_17:
      v31 = v35;
      goto LABEL_18;
    }
LABEL_16:
    objc_storeStrong(a13, v35);
    v22 = 0;
    goto LABEL_17;
  }
  if (a13)
  {
    v43 = *a13;
    *a13 = 0;

  }
  if (a8)
    objc_storeStrong(a8, v58);
  if (a9)
    objc_storeStrong(a9, v57);
  if (a10)
    objc_storeStrong(a10, v56);
  if (a12)
    objc_storeStrong(a12, v54);
  if (a6)
    *a6 = *((_DWORD *)v60 + 6);
  v22 = 1;
LABEL_18:

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  objc_autoreleasePoolPop(context);
  return v22 & 1;
}

void __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v5 = (objc_class *)MEMORY[0x1E0CB35C8];
    v6 = a2;
    v7 = [v5 alloc];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a3, v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

BOOL __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 1;
}

uint64_t __203__TRIFactorDownloadValidator_validateDownloadForFactors_withNamespace_paths_container_factorsState_assetIndexesByTreatment_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_error___block_invoke_64(_QWORD *a1, void *a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v31;
  uint8_t buf[4];
  NSObject *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "localizedDescription");
      v31 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v31;
      _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "Error downloading on-demand asset, %@", buf, 0xCu);

    }
    v11 = *(_QWORD *)(a1[6] + 8);
    v13 = *(_QWORD *)(v11 + 40);
    v12 = (id *)(v11 + 40);
    if (!v13)
      objc_storeStrong(v12, a4);
    goto LABEL_23;
  }
  if ((objc_msgSend(v8, "isOnDemand") & 1) != 0)
  {
    if (!objc_msgSend(v8, "hasPath")
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "path"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v14, "fileExistsAtPath:", v15),
          v15,
          v14,
          !v16))
    {
      objc_msgSend(v8, "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "hasCloudKitContainer");

      if (v23)
      {
        objc_msgSend(v8, "asset");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "cloudKitContainer");

      }
      else
      {
        v25 = 1;
      }
      v26 = *(_QWORD *)(a1[7] + 8);
      v27 = *(_DWORD *)(v26 + 24);
      if (v27)
      {
        if (v27 != (_DWORD)v25)
        {
          v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Factor \"%@\" in namespace \"%@\" has mismatched cloudKitContainer (%d, %d) and cannot be downloaded on-demand."), v7, a1[4], *(unsigned int *)(*(_QWORD *)(a1[7] + 8) + 24), v25);
          TRILogCategory_ClientFramework();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v17;
            _os_log_error_impl(&dword_19B89C000, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          (*(void (**)(void))(a1[5] + 16))();
          goto LABEL_22;
        }
      }
      else
      {
        *(_DWORD *)(v26 + 24) = v25;
      }
      v29 = 1;
      goto LABEL_24;
    }
    TRILogCategory_ClientFramework();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = a1[4];
      objc_msgSend(v8, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v7;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v19;
      v20 = "Skipping on-demand fetch of factor \"%@\" in namespace \"%@\" which already has local path: %@";
LABEL_13:
      _os_log_impl(&dword_19B89C000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0x20u);

    }
  }
  else
  {
    TRILogCategory_ClientFramework();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = a1[4];
      objc_msgSend(v8, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v7;
      v34 = 2112;
      v35 = v21;
      v36 = 2112;
      v37 = v19;
      v20 = "Skipping on-demand fetch of factor \"%@\" in namespace \"%@\" which is not on-demand: %@";
      goto LABEL_13;
    }
  }
LABEL_22:

LABEL_23:
  v29 = 0;
LABEL_24:

  return v29;
}

@end
