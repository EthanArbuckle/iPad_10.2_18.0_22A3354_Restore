@implementation PLCTMPairingProcessor

- (id)groupIDForAsset:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "additionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spatialOverCaptureGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)firstGroupFromAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  int v18;
  BOOL v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  int v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v30;
    v26 = v5;
    v27 = v4;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v12, "metadataFromMediaPropertiesOrOriginalResource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v28 = 0;
        if (!v14)
        {
          objc_msgSend(v4, "addObject:", v12);
          if (!v9)
            goto LABEL_30;
          goto LABEL_19;
        }
        if (objc_msgSend(v14, "isSpatialOverCapture"))
        {
          if (v8)
            goto LABEL_18;
          if (v9)
          {
            if (!_arePairableCTMAssetKinds(v9, v12, &v28)
              || (v16 = v12,
                  v17 = objc_msgSend(v9, "savedAssetType"),
                  v18 = objc_msgSend(v16, "savedAssetType"),
                  v16,
                  v19 = v17 == v18,
                  v5 = v26,
                  v4 = v27,
                  !v19))
            {
              v20 = 0;
LABEL_29:
              v8 = v20;
              v4 = v27;
              goto LABEL_30;
            }
          }
          v8 = v12;
          if (v9)
            goto LABEL_19;
        }
        else
        {
          if (v9)
          {
LABEL_18:
            if (!v9)
              goto LABEL_30;
LABEL_19:
            if (v8)
            {
              v33[0] = &unk_1E375F3A8;
              v34[0] = v9;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v28);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v33[1] = v22;
              v34[1] = v8;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              objc_autoreleasePoolPop(v13);
              goto LABEL_37;
            }
            goto LABEL_30;
          }
          if (v8)
          {
            if (!_arePairableCTMAssetKinds(v12, v8, &v28))
            {
              v20 = v8;
              goto LABEL_29;
            }
            v20 = v8;
            v25 = objc_msgSend(v12, "savedAssetType");
            v21 = objc_msgSend(v20, "savedAssetType");

            v19 = v25 == v21;
            v5 = v26;
            if (!v19)
              goto LABEL_29;
          }
          v9 = v12;
          v4 = v27;
          if (v9)
            goto LABEL_19;
        }
LABEL_30:

        objc_autoreleasePoolPop(v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (!v7)
        goto LABEL_34;
    }
  }
  v8 = 0;
  v9 = 0;
LABEL_34:

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v5, "removeObjectsInArray:", v4);
  v23 = 0;
LABEL_37:

  return v23;
}

- (id)combinePair:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _BOOL4 v23;
  id v24;
  id v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E375F3A8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E375F3C0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E375F420);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73310], "maskForReferencedAsset");
  objc_msgSend(v9, "savedAssetType");
  if (PLValidatedSavedAssetTypeApplies())
  {
    if (v10)
    {
      v39 = 0;
      -[PLCTMPairingProcessor _mapResourcesFromSoc:toPrimary:error:](self, "_mapResourcesFromSoc:toPrimary:error:", v10, v9, &v39);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v39;
      objc_msgSend(v8, "addEntriesFromDictionary:", v12);

      if (v13)
      {
        PLBackendGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v43 = v15;
          v44 = 2112;
          v45 = v16;
          v46 = 2112;
          v47 = v13;
          v17 = "Failed to map resources from asset '%@' (soc) to asset '%@' (primary): %@";
LABEL_25:
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);

          goto LABEL_26;
        }
        goto LABEL_26;
      }
      -[PLCTMPairingProcessor _installSocResourcesFromSoc:toPrimary:referencedResourceURLs:](self, "_installSocResourcesFromSoc:toPrimary:referencedResourceURLs:", v10, v9, v8);
      goto LABEL_30;
    }
    if (v11)
    {
      v10 = v11;
      objc_msgSend(v10, "primaryStoreOriginalResource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "referenceMediaFileURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, &unk_1E375F408);
        v22 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:](PLResourceInstaller, "onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:", v9, v8);
        v13 = 0;
      }
      else
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0D74498];
        v28 = *MEMORY[0x1E0CB2938];
        v41[0] = CFSTR("Couldn't get file URL.");
        v40[0] = v28;
        v40[1] = CFSTR("Resource Object Id");
        objc_msgSend(v10, "primaryStoreOriginalResource");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v34;
        v40[2] = CFSTR("Asset UUID");
        objc_msgSend(v10, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", v35, 41003, v30);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (v13)
        goto LABEL_27;
      goto LABEL_30;
    }
LABEL_20:
    v10 = 0;
    goto LABEL_30;
  }
  if (!v10)
  {
    if (!v11)
      goto LABEL_20;
    v10 = v11;
    v37 = 0;
    v23 = -[PLPairingProcessor _copyResourceOfType:onAsset:toType:onAsset:error:](self, "_copyResourceOfType:onAsset:toType:onAsset:error:", 1, v10, 11, v9, &v37);
    v24 = v37;
    v13 = v24;
    if (!v23)
    {
      if (v24)
      {
        PLBackendGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v43 = v15;
          v44 = 2112;
          v45 = v16;
          v46 = 2112;
          v47 = v13;
          v17 = "Failed to combine resource from asset '%@' (vidcomp) with asset '%@' (pri_img) as a CTM (vidcomp_soc) resource: %@";
          goto LABEL_25;
        }
        goto LABEL_26;
      }
      goto LABEL_30;
    }
    v25 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:](PLResourceInstaller, "onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:", v9, 0);
    if (!v13)
      goto LABEL_30;
LABEL_27:
    v26 = 0;
    goto LABEL_31;
  }
  v38 = 0;
  v18 = -[PLCTMPairingProcessor _copyResourcesFromSoc:toPrimary:error:](self, "_copyResourcesFromSoc:toPrimary:error:", v10, v9, &v38);
  v19 = v38;
  v13 = v19;
  if (v18)
  {
    -[PLCTMPairingProcessor _installSocResourcesFromSoc:toPrimary:referencedResourceURLs:](self, "_installSocResourcesFromSoc:toPrimary:referencedResourceURLs:", v10, v9, 0);
    if (!v13)
      goto LABEL_30;
    goto LABEL_27;
  }
  if (v19)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v43 = v15;
      v44 = 2112;
      v45 = v16;
      v46 = 2112;
      v47 = v13;
      v17 = "Failed to copy resources from asset '%@' (soc) to asset '%@' (primary): %@";
      goto LABEL_25;
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_30:
  -[PLPairingProcessor updatePrimaryAsset:andRemoveAssetIfPossible:](self, "updatePrimaryAsset:andRemoveAssetIfPossible:", v9, v10);
  v13 = 0;
  v26 = 1;
LABEL_31:
  _updateCameraProcessingAdjustmentState(v9);
  if (a4)
    *a4 = objc_retainAutorelease(v13);
  if (v26)
    v31 = v9;
  else
    v31 = 0;
  v32 = v31;

  return v32;
}

- (id)fetchRequestForLibrary
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil and %K != '' and noindex:(%K) == %d"), CFSTR("additionalAttributes.spatialOverCaptureGroupIdentifier"), CFSTR("additionalAttributes.spatialOverCaptureGroupIdentifier"), CFSTR("trashedState"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCTMPairingProcessor ctmFetchRequestWithPredicate:](self, "ctmFetchRequestWithPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchBatchSize:", 100);

  return v4;
}

- (id)fetchRequestForSortedGroupIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K in %@ and noindex:(%K) == %d"), CFSTR("additionalAttributes.spatialOverCaptureGroupIdentifier"), v5, CFSTR("trashedState"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCTMPairingProcessor ctmFetchRequestWithPredicate:](self, "ctmFetchRequestWithPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");

  if (v8 >= 0x65)
    objc_msgSend(v7, "setFetchBatchSize:", 100);

  return v7;
}

- (id)ctmFetchRequestWithPredicate:(id)a3
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
  _QWORD v14[3];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    v15[0] = v4;
    -[PLPairingProcessor locatedInUsersPhotoLibrary](self, "locatedInUsersPhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setPredicate:", v9);
    objc_msgSend(v5, "setResultType:", 0);
    v14[0] = CFSTR("additionalAttributes");
    v14[1] = CFSTR("albums");
    v14[2] = CFSTR("modernResources");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", v12);

  }
  else
  {
    v9 = 0;
  }

  return v5;
}

- (void)setDeferredProcessingIfNescessaryForAsset:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "additionalAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unmanagedAdjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "adjustmentRenderTypes");

  if ((v6 & 0x30) != 0)
  {
    objc_msgSend(v7, "setDeferredProcessingNeeded:", 2);
    -[PLCTMPairingProcessor setDeferredProcessingNeeded:](self, "setDeferredProcessingNeeded:", 1);
  }

}

- (id)_mapResourcesFromSoc:(id)a3 toPrimary:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "primaryStoreOriginalResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "referenceMediaFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D74498];
    v17 = *MEMORY[0x1E0CB2938];
    v28[0] = CFSTR("Couldn't get file URL.");
    v27[0] = v17;
    v27[1] = CFSTR("Resource Object Id");
    objc_msgSend(v6, "primaryStoreOriginalResource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    v27[2] = CFSTR("Asset UUID");
    objc_msgSend(v6, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 41003, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, &unk_1E375F438);
  if (!objc_msgSend(v6, "isPhotoIris"))
  {
    v14 = 0;
    if (!a5)
      goto LABEL_10;
    goto LABEL_9;
  }
  _originalResourceOfType(v6, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "referenceMediaFileURL");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, &unk_1E375F408);
      v14 = 0;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0D74498];
      v23 = *MEMORY[0x1E0CB2938];
      v30[0] = CFSTR("Couldn't get file URL.");
      v29[0] = v23;
      v29[1] = CFSTR("Resource Object Id");
      objc_msgSend(v11, "objectID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v24;
      v29[2] = CFSTR("Asset UUID");
      objc_msgSend(v6, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 41003, v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
    }
    goto LABEL_7;
  }
  v14 = 0;
LABEL_8:

  if (a5)
LABEL_9:
    *a5 = objc_retainAutorelease(v14);
LABEL_10:

  return v7;
}

- (BOOL)_copyResourcesFromSoc:(id)a3 toPrimary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v23 = 0;
  v10 = -[PLPairingProcessor _copyResourceOfType:onAsset:toType:onAsset:error:](self, "_copyResourceOfType:onAsset:toType:onAsset:error:", objc_msgSend(v9, "isPhoto") ^ 1, v8, 10, v9, &v23);
  v11 = v23;
  if (v10 && objc_msgSend(v8, "isPhotoIris"))
  {
    v22 = v11;
    v12 = -[PLPairingProcessor _copyResourceOfType:onAsset:toType:onAsset:error:](self, "_copyResourceOfType:onAsset:toType:onAsset:error:", 3, v8, 11, v9, &v22);
    v13 = v22;

    if (!v12)
    {
      _pathForResourceType(v9, 10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v17 = objc_msgSend(v16, "removeItemAtURL:error:", v15, &v21);
        v18 = v21;

        if ((v17 & 1) == 0)
        {
          PLBackendGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v25 = v15;
            v26 = 2112;
            v27 = v18;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error trying to clean up copy at %@: %@", buf, 0x16u);
          }

        }
      }

    }
  }
  else
  {
    v13 = v11;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v13 == 0;
}

- (void)_installSocResourcesFromSoc:(id)a3 toPrimary:(id)a4 referencedResourceURLs:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v12, "isPhoto"))
  {
    v9 = +[PLResourceInstaller onDemand_installOriginalSOCImagePresentForAsset:referencedResourceURLs:](PLResourceInstaller, "onDemand_installOriginalSOCImagePresentForAsset:referencedResourceURLs:", v7, v8);
    if (objc_msgSend(v12, "isPhotoIris"))
      v10 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:](PLResourceInstaller, "onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:", v7, v8);
  }
  else
  {
    v11 = +[PLResourceInstaller onDemand_installOriginalSOCVideoPresentForAsset:referencedResourceURLs:](PLResourceInstaller, "onDemand_installOriginalSOCVideoPresentForAsset:referencedResourceURLs:", v7, v8);
  }

}

- (BOOL)deferredProcessingNeeded
{
  return self->_deferredProcessingNeeded;
}

- (void)setDeferredProcessingNeeded:(BOOL)a3
{
  self->_deferredProcessingNeeded = a3;
}

@end
