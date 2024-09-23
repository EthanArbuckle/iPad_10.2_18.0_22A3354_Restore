@implementation PLLivePhotoPairingProcessor

- (id)groupIDForAsset:(id)a3
{
  return (id)objc_msgSend(a3, "mediaGroupUUID");
}

- (id)firstGroupFromAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  id v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (!v4)
  {
    v6 = 0;
    v5 = 0;
    goto LABEL_31;
  }
  v5 = 0;
  v6 = 0;
  v7 = *(_QWORD *)v23;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v8);
      v10 = (void *)MEMORY[0x19AEC1554]();
      if (!objc_msgSend(v9, "isVideo"))
      {
        if (objc_msgSend(v9, "isPhoto"))
        {
          if (!v6)
          {
            if (v5)
            {
              v14 = v9;
              v15 = objc_msgSend(v5, "savedAssetType");
              v16 = objc_msgSend(v14, "savedAssetType");

              if (v15 != v16)
              {
                v6 = 0;
                goto LABEL_23;
              }
            }
            v6 = v9;
          }
LABEL_17:
          if (!v6)
            goto LABEL_23;
        }
        else
        {
          PLBackendGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = objc_msgSend(v9, "kind");
            objc_msgSend(v9, "uuid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67240450;
            v29 = v18;
            v30 = 2114;
            v31 = v19;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unexpected asset kind (%{public}d) for asset %{public}@", buf, 0x12u);

          }
          if (!v6)
            goto LABEL_23;
        }
LABEL_22:
        if (v5)
        {
          v26[0] = &unk_1E375F3D8;
          v26[1] = &unk_1E375F3F0;
          v27[0] = v6;
          v27[1] = v5;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v10);
          goto LABEL_31;
        }
        goto LABEL_23;
      }
      if (v5)
        goto LABEL_17;
      if (v6)
      {
        v11 = v9;
        v12 = objc_msgSend(v6, "savedAssetType");
        v13 = objc_msgSend(v11, "savedAssetType");

        if (v12 != v13)
        {
          v5 = 0;
          goto LABEL_23;
        }
      }
      v5 = v9;
      if (v6)
        goto LABEL_22;
LABEL_23:
      objc_autoreleasePoolPop(v10);
      v8 = (char *)v8 + 1;
    }
    while (v4 != v8);
    v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    v4 = (void *)v20;
  }
  while (v20);
LABEL_31:

  return v4;
}

- (id)combinePair:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  void *v34;
  id v35;
  NSObject *v37;
  void *v38;
  void *v39;
  PLLivePhotoPairingProcessor *v40;
  id *v41;
  _QWORD v42[3];
  _QWORD v43[3];
  id v44;
  uint64_t v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E375F3D8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E375F3F0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73310], "maskForReferencedAsset");
  objc_msgSend(v7, "savedAssetType");
  v9 = PLValidatedSavedAssetTypeApplies();
  _originalResourceOfType(v8, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_4;
  if (v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(v10, "referenceMediaFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, &unk_1E375F408);

    v13 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:](PLResourceInstaller, "onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:", v7, v11);
    goto LABEL_4;
  }
  v44 = 0;
  v19 = -[PLPairingProcessor _copyResourceOfType:onAsset:toType:onAsset:error:](self, "_copyResourceOfType:onAsset:toType:onAsset:error:", 10, v8, 11, v7, &v44);
  v20 = v44;
  v21 = v20;
  if (v19)
  {
    v22 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:](PLResourceInstaller, "onDemand_installOriginalSOCVideoComplementPresentForAsset:referencedResourceURLs:", v7, 0);
    if (!v21)
    {
LABEL_4:
      objc_msgSend(v8, "mainFileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PFVideoComplementMetadataForVideoAtPath();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "mediaGroupUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mainFileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v16, "videoDuration");
        objc_msgSend(v16, "imageDisplayTime");
      }
      else
      {
        memset(v43, 0, sizeof(v43));
        memset(v42, 0, sizeof(v42));
      }
      if (v9)
        v23 = 2;
      else
        v23 = 0;
      v24 = objc_msgSend(v7, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:", v17, 0, v18, v43, v42, v23);

      if (v24)
      {

      }
      else
      {
        v40 = self;
        v41 = a4;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = *MEMORY[0x1E0D74498];
        v45 = *MEMORY[0x1E0CB2938];
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("Failed to combine asset '%@' (prim_img) and asset '%@' (vidcomp) as a LivePhoto"), v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 41003, v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        PLBackendGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v48 = v21;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        self = v40;
        -[PLPairingProcessor _deleteResourceOfType:forAsset:verifyInserted:deleteFile:](v40, "_deleteResourceOfType:forAsset:verifyInserted:deleteFile:", 11, v7, 0, 1);

        v33 = 0;
        a4 = v41;
        if (v21)
        {
LABEL_19:
          if (!a4)
            goto LABEL_21;
          goto LABEL_20;
        }
      }
      -[PLPairingProcessor updatePrimaryAsset:andRemoveAssetIfPossible:](self, "updatePrimaryAsset:andRemoveAssetIfPossible:", v7, v8);
      v21 = 0;
      v33 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    if (!v20)
      goto LABEL_4;
    PLBackendGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "uuid");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v48 = v38;
      v49 = 2112;
      v50 = v39;
      v51 = 2112;
      v52 = v21;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "Failed to combine resource from asset '%@' (vidcomp) with asset '%@' (pri_img) as a CTM (soc) resource: %@", buf, 0x20u);

    }
  }
  v33 = 0;
  if (a4)
LABEL_20:
    *a4 = objc_retainAutorelease(v21);
LABEL_21:
  if (v33)
    v34 = v7;
  else
    v34 = 0;
  v35 = v34;

  return v35;
}

- (id)fetchRequestForLibrary
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil and %K != '' and noindex:(%K) == %d and SUBQUERY(modernResources, $r, $r.resourceType == %d).@count == 0"), CFSTR("mediaGroupUUID"), CFSTR("mediaGroupUUID"), CFSTR("trashedState"), 0, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLivePhotoPairingProcessor livePhotoFetchRequestWithPredicate:](self, "livePhotoFetchRequestWithPredicate:", v3);
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
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K in %@ and noindex:(%K) == %d and SUBQUERY(modernResources, $r, $r.resourceType == %d).@count == 0"), CFSTR("mediaGroupUUID"), v5, CFSTR("trashedState"), 0, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLivePhotoPairingProcessor livePhotoFetchRequestWithPredicate:](self, "livePhotoFetchRequestWithPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");

  if (v8 >= 0x65)
    objc_msgSend(v7, "setFetchBatchSize:", 100);

  return v7;
}

- (id)livePhotoFetchRequestWithPredicate:(id)a3
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

@end
