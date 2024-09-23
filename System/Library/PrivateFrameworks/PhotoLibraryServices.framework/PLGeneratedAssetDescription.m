@implementation PLGeneratedAssetDescription

+ (id)newNodeContainerWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "pl_graphCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelWithCode:inContext:", 1300, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphNode insertGraphNodeInContext:withPrimaryLabel:](PLGraphNode, "insertGraphNodeInContext:withPrimaryLabel:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___PLGeneratedAssetDescription;
  v8 = (void *)objc_msgSend(objc_msgSendSuper2(&v12, sel_alloc), "initWithNode:", v7);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUuid:", v10);

  return v8;
}

+ (id)_labelWithCode:(unsigned int)a3 context:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  objc_msgSend(v5, "pl_graphCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelWithCode:inContext:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_labelIDWithCode:(unsigned int)a3 context:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  objc_msgSend(v5, "pl_graphCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectIDForLabelWithCode:inContext:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_newNodeContainerWithManagedObjectContext:(id)a3 dictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_msgSend(a1, "newNodeContainerWithManagedObjectContext:", a3);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("descriptionText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDescriptionText:", v8);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("analysisVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnalysisVersion:", (__int16)objc_msgSend(v9, "integerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("analysisSourceType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAnalysisSourceType:", objc_msgSend(v10, "integerValue"));
  return v7;
}

+ (id)_fetchGeneratedAssetDescriptionEdgesForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGeneratedAssetDescription _labelIDWithCode:context:](PLGeneratedAssetDescription, "_labelIDWithCode:context:", 1300, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("primaryLabel"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("sourceAsset"), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v13);

  v19 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v7, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Fetch for edges failed: %@", buf, 0xCu);
    }

  }
  return v14;
}

+ (id)fetchGeneratedAssetDescriptionsGroupedByAssetIdWithType:(int64_t)a3 forAssetsIDs:(id)a4 inLibrary:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  SEL v25;
  id v26;

  v9 = a4;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a5;
  objc_msgSend(v10, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __110__PLGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetIdWithType_forAssetsIDs_inLibrary___block_invoke;
  v20[3] = &unk_1E366FC60;
  v21 = v13;
  v22 = v9;
  v24 = a3;
  v14 = v12;
  v23 = v14;
  v25 = a2;
  v26 = a1;
  v15 = v9;
  v16 = v13;
  objc_msgSend(v11, "performBlockAndWait:", v20);

  v17 = v23;
  v18 = v14;

  return v18;
}

+ (id)fetchGeneratedAssetDescriptionNodesForAsset:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PLGeneratedAssetDescription_fetchGeneratedAssetDescriptionNodesForAsset___block_invoke;
  v13[3] = &unk_1E3662960;
  v11 = v6;
  v14 = v11;
  objc_msgSend(a1, "_enumerateGraphNodesForAssetObjectIDs:inContext:withBlock:", v9, v10, v13);

  return v11;
}

+ (void)_enumerateGraphNodesForAssetObjectIDs:(id)a3 inContext:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
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
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  const __CFString *v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[PLGeneratedAssetDescription _labelIDWithCode:context:](PLGeneratedAssetDescription, "_labelIDWithCode:context:", 1300, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("primaryLabel"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("sourceAsset"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v15);
  objc_msgSend(v16, "setResultType:", 2);
  objc_msgSend(v16, "setFetchBatchSize:", 200);
  v33[0] = CFSTR("objectID");
  v33[1] = CFSTR("targetNode");
  v33[2] = CFSTR("sourceAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPropertiesToFetch:", v17);

  v32 = CFSTR("targetNode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRelationshipKeyPathsForPrefetching:", v18);

  v27 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v16, &v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v27;
  if (!v19)
  {
    PLBackendGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v7;
      v30 = 2112;
      v31 = v20;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch generated asset descriptions for assets %{public}@ with error %@", buf, 0x16u);
    }

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __89__PLGeneratedAssetDescription__enumerateGraphNodesForAssetObjectIDs_inContext_withBlock___block_invoke;
  v24[3] = &unk_1E366E728;
  v25 = v8;
  v26 = v9;
  v22 = v9;
  v23 = v8;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v24);

}

+ (void)_updateAsset:(id)a3 nodeContainer:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "analysisSourceType"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGeneratedAssetDescription.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("description.analysisSourceType != PLGeneratedAssetDescriptionSourceTypeUnknown"));

  }
  objc_msgSend(v13, "mediaAnalysisAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[PLMediaAnalysisAssetAttributes entityName](PLMediaAnalysisAssetAttributes, "entityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v9, (uint64_t)v10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v13, "setMediaAnalysisAttributes:", v8);
  }
  v11 = objc_msgSend(v7, "analysisSourceType");
  if (v11 == 2)
  {
    objc_msgSend(v8, "setVideoCaptionVersion:", objc_msgSend(v7, "analysisVersion"));
  }
  else if (v11 == 1)
  {
    objc_msgSend(v8, "setImageCaptionVersion:", objc_msgSend(v7, "analysisVersion"));
  }

}

+ (void)setGeneratedAssetDescriptionForAsset:(id)a3 fromDictionaries:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id obj;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39 = a4;
  v6 = (void *)objc_msgSend(v39, "mutableCopy");
  v7 = v5;
  +[PLGeneratedAssetDescription _fetchGeneratedAssetDescriptionEdgesForAsset:](PLGeneratedAssetDescription, "_fetchGeneratedAssetDescriptionEdgesForAsset:", v5);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v50;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v50 != v34)
          objc_enumerationMutation(obj);
        v37 = v8;
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v8), "targetNode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGeneratedAssetDescription, "newNodeContainerWithNode:", v9);

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v11 = v39;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v46 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              v17 = objc_msgSend(v16, "integerValue");
              if (v17 == objc_msgSend(v10, "analysisSourceType"))
              {
                objc_msgSend(v11, "objectForKeyedSubscript:", v16);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("descriptionText"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setDescriptionText:", v19);

                objc_msgSend(v11, "objectForKeyedSubscript:", v16);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("analysisVersion"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setAnalysisVersion:", (__int16)objc_msgSend(v21, "integerValue"));

                objc_msgSend(a1, "_updateAsset:nodeContainer:", v7, v10);
                objc_msgSend(v6, "removeObjectForKey:", v16);
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v13);
        }

        v8 = v37 + 1;
      }
      while ((id)(v37 + 1) != v35);
      v35 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v35);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v36 = v6;
  v22 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v22)
  {
    v23 = v22;
    v38 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v42 != v38)
          objc_enumerationMutation(v36);
        v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v7, "managedObjectContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(a1, "newNodeContainerWithManagedObjectContext:", v26);

        objc_msgSend(v39, "objectForKeyedSubscript:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("descriptionText"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setDescriptionText:", v29);

        objc_msgSend(v39, "objectForKeyedSubscript:", v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("analysisVersion"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAnalysisVersion:", (__int16)objc_msgSend(v31, "integerValue"));

        objc_msgSend(v27, "setAnalysisSourceType:", objc_msgSend(v25, "integerValue"));
        v32 = (id)objc_msgSend(v27, "_insertEdgeForAsset:", v7);
        objc_msgSend(a1, "_updateAsset:nodeContainer:", v7, v27);

      }
      v23 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v23);
  }

}

+ (void)resetGeneratedAssetDescriptionsForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGeneratedAssetDescription _fetchGeneratedAssetDescriptionEdgesForAsset:](PLGeneratedAssetDescription, "_fetchGeneratedAssetDescriptionEdgesForAsset:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "targetNode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "deleteObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  objc_msgSend(v3, "mediaAnalysisAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImageCaptionVersion:", 0);

  objc_msgSend(v3, "mediaAnalysisAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVideoCaptionVersion:", 0);

}

- (id)_insertEdgeForAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGeneratedAssetDescription.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGeneratedAssetDescription _labelWithCode:context:](PLGeneratedAssetDescription, "_labelWithCode:context:", 1300, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrimaryLabel:", v10);

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTargetNode:", v11);

  objc_msgSend(v9, "setSourceAsset:", v5);
  return v9;
}

- (NSString)descriptionText
{
  void *v2;
  void *v3;
  void *v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("descriptionText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setDescriptionText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("descriptionText"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStringValue:", v4);
  -[PLGeneratedAssetDescription _updateChangeFlagForProperties](self, "_updateChangeFlagForProperties");

}

- (signed)analysisVersion
{
  void *v2;
  void *v3;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("analysisVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v2) = objc_msgSend(v3, "intValue");
  return (__int16)v2;
}

- (void)setAnalysisVersion:(signed __int16)a3
{
  int v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("analysisVersion"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIntValue:", v3);
  -[PLGeneratedAssetDescription _updateChangeFlagForProperties](self, "_updateChangeFlagForProperties");

}

- (int64_t)analysisSourceType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("analysisSourceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "intValue");
  return v4;
}

- (void)setAnalysisSourceType:(int64_t)a3
{
  void *v5;
  id v6;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("analysisSourceType"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIntValue:", a3);
  -[PLGeneratedAssetDescription _updateChangeFlagForProperties](self, "_updateChangeFlagForProperties");

}

- (id)asset
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "edgesIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateChangeFlagForProperties
{
  id v2;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setChangeFlag0:", objc_msgSend(v2, "changeFlag0") + 1);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLGeneratedAssetDescription asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGeneratedAssetDescription descriptionText](self, "descriptionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\nasset: %@\ndescriptionText: %@\nanalysisVersion: %llu\nanalysisSourceType: %ld"), v5, v6, -[PLGeneratedAssetDescription analysisVersion](self, "analysisVersion"), -[PLGeneratedAssetDescription analysisSourceType](self, "analysisSourceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __89__PLGeneratedAssetDescription__enumerateGraphNodesForAssetObjectIDs_inContext_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("targetNode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectWithID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sourceAsset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, uint64_t))(v8 + 16))(v8, v7, v9, a4);

  }
}

uint64_t __75__PLGeneratedAssetDescription_fetchGeneratedAssetDescriptionNodesForAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __110__PLGeneratedAssetDescription_fetchGeneratedAssetDescriptionsGroupedByAssetIdWithType_forAssetsIDs_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  const __CFString *v41;
  _QWORD v42[5];

  v42[2] = *MEMORY[0x1E0C80C00];
  +[PLGeneratedAssetDescription _labelIDWithCode:context:](PLGeneratedAssetDescription, "_labelIDWithCode:context:", 1300, *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  v30 = (void *)v2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %@"), CFSTR("primaryLabel"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("sourceAsset"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v7;
  objc_msgSend(v8, "setPredicate:", v7);
  objc_msgSend(v8, "setResultType:", 0);
  v41 = CFSTR("targetNode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v9);

  v10 = *(void **)(a1 + 32);
  v35 = 0;
  v28 = v8;
  objc_msgSend(v10, "executeFetchRequest:error:", v8, &v35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v35;
  if (!v11)
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v38 = v14;
      v39 = 2112;
      v40 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch generated asset descriptions for assets %@ with error %@", buf, 0x16u);
    }

  }
  v27 = v12;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v20, "targetNode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sourceAsset");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGeneratedAssetDescription, "newNodeContainerWithNode:", v21);
        if (objc_msgSend(v24, "analysisSourceType") == *(_QWORD *)(a1 + 56))
        {
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("PLGeneratedAssetDescription.m"), 147, CFSTR("Found more that one generated asset description node for type %ld for asset %@"), *(_QWORD *)(a1 + 56), v23, v27);

          }
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v24, v23);
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v17);
  }

}

@end
