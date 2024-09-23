@implementation PGDejunkerDeduper_PHAsset

- (id)dejunkedDedupedAssetsInAssets:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PGDejunkerDeduper_PHAsset _buildCachesWithAssets:options:](self, "_buildCachesWithAssets:options:", v13, v12);
  v16.receiver = self;
  v16.super_class = (Class)PGDejunkerDeduper_PHAsset;
  -[PGDejunkerDeduper_CLSCurationItem dejunkedDedupedItemsInItems:options:debugInfo:progressBlock:](&v16, sel_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock_, v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_buildCachesWithAssets:(id)a3 options:(id)a4
{
  id v5;
  int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  double v18;
  void *v19;
  id v20;
  double v21;
  void *v22;
  NSDictionary *personLocalIdentifiersByAssetUUID;
  NSDictionary *v24;
  NSDictionary *peopleScenesByAssetUUID;
  NSDictionary *v26;
  NSDictionary *averageFaceQualityByAssetUUID;
  NSDictionary *v29;
  NSDictionary *v30;
  void *v31;
  id v32;
  id obj;
  NSDictionary *v34;
  _QWORD v35[4];
  id v36;
  uint8_t *v37;
  uint64_t *v38;
  double v39;
  _QWORD v40[4];
  id v41;
  uint8_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[8];
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  v34 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("#people#"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "useOnlyScenesForDeduping") & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v32, "useAllPersonsForDeduping");
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v11, "clsFaceInformationSummary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (!((v13 != 0) | v8 & 1))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Face information expected but not prefetched.", buf, 2u);
            }
            v14 = 0;
            v20 = 0;
            v8 = 1;
            goto LABEL_25;
          }
          if (objc_msgSend(v13, "numberOfFaces"))
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            *(_QWORD *)buf = 0;
            v54 = buf;
            v55 = 0x2020000000;
            v56 = 0;
            v49 = 0;
            v50 = (double *)&v49;
            v51 = 0x2020000000;
            v52 = 0;
            v45 = 0;
            v46 = (double *)&v45;
            v47 = 0x2020000000;
            v48 = 0;
            objc_msgSend(v14, "faceInformationByPersonLocalIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __60__PGDejunkerDeduper_PHAsset__buildCachesWithAssets_options___block_invoke;
            v40[3] = &unk_1E842E940;
            v17 = v15;
            v41 = v17;
            v42 = buf;
            v43 = &v49;
            v44 = &v45;
            objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v40);

            if ((unint64_t)objc_msgSend(v17, "count") <= 2)
            {
              v18 = v46[3];
              objc_msgSend(v14, "faceInformationByPersonLocalIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v35[0] = MEMORY[0x1E0C809B0];
              v35[1] = 3221225472;
              v35[2] = __60__PGDejunkerDeduper_PHAsset__buildCachesWithAssets_options___block_invoke_2;
              v35[3] = &unk_1E842E968;
              v39 = fmax(v18 * 0.5, 0.05);
              v36 = v17;
              v37 = buf;
              v38 = &v49;
              objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v35);

            }
            v20 = v17;
            v21 = v50[3];
            if (v21 > 0.0)
            {
              *((double *)v54 + 3) = *((double *)v54 + 3) / v21;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v22, v12);

            }
            _Block_object_dispose(&v45, 8);
            _Block_object_dispose(&v49, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_25;
          }
LABEL_24:
          v20 = 0;
          goto LABEL_25;
        }
        if ((objc_msgSend(v32, "useOnlyScenesForDeduping") & 1) != 0)
        {
          v20 = 0;
          goto LABEL_26;
        }
        objc_msgSend(v11, "clsPersonLocalIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "count"))
          goto LABEL_24;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
        v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
        if (objc_msgSend(v20, "count"))
          -[NSDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v20, v12);
        if (objc_msgSend(v11, "clsIsInhabited"))
          -[NSDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v31, v12);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v7);
  }

  personLocalIdentifiersByAssetUUID = self->_personLocalIdentifiersByAssetUUID;
  self->_personLocalIdentifiersByAssetUUID = v34;
  v24 = v34;

  peopleScenesByAssetUUID = self->_peopleScenesByAssetUUID;
  self->_peopleScenesByAssetUUID = v30;
  v26 = v30;

  averageFaceQualityByAssetUUID = self->_averageFaceQualityByAssetUUID;
  self->_averageFaceQualityByAssetUUID = v29;

}

- (id)bestItemInItems:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  NSDictionary *averageFaceQualityByAssetUUID;
  void *v22;
  void *v23;
  double v24;
  float v25;
  id v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "useOnlyScenesForDeduping") & 1) != 0)
    v8 = 0;
  else
    v8 = objc_msgSend(v7, "useFaceQualityForElection");
  v29 = v7;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v31;
    v14 = -1.79769313e308;
    v15 = -1.79769313e308;
    while (1)
    {
      v16 = 0;
      v17 = v15;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v9);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
        objc_msgSend(v18, "clsContentScore");
        v20 = v19;
        if (v8
          && (averageFaceQualityByAssetUUID = self->_averageFaceQualityByAssetUUID,
              objc_msgSend(v18, "uuid"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSDictionary objectForKeyedSubscript:](averageFaceQualityByAssetUUID, "objectForKeyedSubscript:", v22),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v22,
              v23))
        {
          objc_msgSend(v23, "doubleValue");
          v15 = v24;
          if (!v12)
            goto LABEL_21;
        }
        else
        {
          objc_msgSend(v18, "overallAestheticScore");
          v23 = 0;
          v15 = v25;
          if (!v12)
            goto LABEL_21;
        }
        if (v20 <= v14 && (v20 != v14 || v15 <= v17))
        {
          v15 = v17;
          goto LABEL_22;
        }
LABEL_21:
        v27 = v18;

        v14 = v20;
        v12 = v27;
        v17 = v15;
LABEL_22:

        ++v16;
      }
      while (v11 != v16);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (!v11)
        goto LABEL_26;
    }
  }
  v12 = 0;
LABEL_26:

  return v12;
}

- (BOOL)isJunkForItem:(id)a3
{
  double v3;

  objc_msgSend(a3, "clsContentScore");
  return v3 == *MEMORY[0x1E0D77DF0];
}

- (id)debugPersonStringForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGDejunkerDeduper_PHAsset featureWithItem:](self, "featureWithItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personLocalIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peopleScenes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v36 = v7;
    v38 = v5;
    v39 = v4;
    objc_msgSend(v4, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v6, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v9;
    objc_msgSend(v10, "fetchPersonsWithLocalIdentifiers:options:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v19, "localIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v16);
    }

    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v37 = v6;
    v22 = v6;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          objc_msgSend(v13, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "displayName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v29, "length"))
          {
            objc_msgSend(v27, "substringToIndex:", 8);
            v30 = objc_claimAutoreleasedReturnValue();

            v29 = (void *)v30;
          }
          objc_msgSend(v21, "addObject:", v29);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v24);
    }

    objc_msgSend(v21, "sortUsingSelector:", sel_compare_);
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v5 = v38;
    v4 = v39;
    v7 = v36;
    v6 = v37;
  }
  else if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sortedArrayUsingSelector:", sel_compare_);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", "));
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = CFSTR("nobody");
  }

  return v31;
}

- (id)faceprintByPersonLocalIdentifierByItemIdentifierWithItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = *MEMORY[0x1E0CD1B50];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFetchPropertySets:", v7);

    objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__PGDejunkerDeduper_PHAsset_faceprintByPersonLocalIdentifierByItemIdentifierWithItems___block_invoke;
    v12[3] = &unk_1E842E990;
    v10 = v9;
    v13 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

- (id)featureWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PGDejunkerDeduperFeature *v8;
  uint64_t v9;
  PGDejunkerDeduperFeature *v10;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_personLocalIdentifiersByAssetUUID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_peopleScenesByAssetUUID, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = [PGDejunkerDeduperFeature alloc];
  v9 = objc_msgSend(v4, "isVideo");

  v10 = -[PGDejunkerDeduperFeature initWithPersonLocalIdentifiers:peopleScenes:isVideo:](v8, "initWithPersonLocalIdentifiers:peopleScenes:isVideo:", v6, v7, v9);
  return v10;
}

- (id)itemsSortedByScoreWithItems:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  _QWORD v11[5];
  char v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "useOnlyScenesForDeduping") & 1) != 0)
    v8 = 0;
  else
    v8 = objc_msgSend(v7, "useFaceQualityForElection");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PGDejunkerDeduper_PHAsset_itemsSortedByScoreWithItems_options___block_invoke;
  v11[3] = &unk_1E842E9B8;
  v12 = v8;
  v11[4] = self;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageFaceQualityByAssetUUID, 0);
  objc_storeStrong((id *)&self->_peopleScenesByAssetUUID, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersByAssetUUID, 0);
}

@end
