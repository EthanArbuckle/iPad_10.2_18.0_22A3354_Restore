@implementation PGMemoryGeneratorUtils

+ (id)babyAndChildPersonNodesAtHomeOrFrequentLocationInGraph:(id)a3
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
  PGGraphPersonNodeCollection *v14;

  v3 = a3;
  +[PGGraphPersonNodeCollection personNodesInAgeCategories:includingMe:inGraph:](PGGraphPersonNodeCollection, "personNodesInAgeCategories:includingMe:inGraph:", &unk_1E84E9C58, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "meNodeCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addressNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "momentNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "momentNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "personNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "collectionByFormingUnionWith:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionByIntersecting:", v4);
    v14 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();

    v3 = v9;
  }
  else
  {
    v14 = -[MAElementCollection initWithGraph:]([PGGraphPersonNodeCollection alloc], "initWithGraph:", v3);
  }

  return v14;
}

+ (id)outdoorROINodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_outdoorROITypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphROINodeCollection roiNodesOfTypes:inGraph:](PGGraphROINodeCollection, "roiNodesOfTypes:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)outdoorROIMomentNodesNotAtHomeOrFrequentLocationInGraph:(id)a3 useMomentFeatureEdges:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphHomeWorkNodeCollection, "nodesInGraph:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addressNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "momentNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "momentNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionByFormingUnionWith:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "outdoorROINodesInGraph:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v13, "featureNodeCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "momentNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v13, "momentNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "collectionBySubtracting:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_outdoorROITypes
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 2);
  objc_msgSend(v2, "addIndex:", 3);
  objc_msgSend(v2, "addIndex:", 4);
  objc_msgSend(v2, "addIndex:", 5);
  return v2;
}

+ (id)momentNodesAtHomeOrWorkOrFrequentLocationInGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphHomeWorkNodeCollection, "nodesInGraph:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addressNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "collectionByFormingUnionWith:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)filterImportedAssetsWithoutLocationAndWithoutSceneOrPersonOverlapFromAllAssets:(id)a3 withGraph:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E0D71860];
        objc_msgSend(v14, "locationCoordinate", (_QWORD)v22);
        if ((objc_msgSend(v15, "canUseCoordinate:") & 1) == 0
          && objc_msgSend(a1, "isImportedAsset:", v14))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v16 = (double)(unint64_t)objc_msgSend(v8, "count");
    v17 = v16 / (double)(unint64_t)objc_msgSend(v9, "count");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v9);
    objc_msgSend(v18, "minusSet:", v8);
    if (v17 >= 0.25 || (unint64_t)objc_msgSend(v18, "count") <= 0xD)
    {
      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);
    }
    else
    {
      objc_msgSend(a1, "filterImportedAssets:byOverlapWithRelevantAssets:withGraph:", v8, v18, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unionSet:", v19);
      v20 = v18;

    }
  }
  else
  {
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);
  }

  return v20;
}

+ (id)filterImportedAssets:(id)a3 byOverlapWithRelevantAssets:(id)a4 withGraph:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  double v30;
  double v31;
  double v32;
  void *v34;
  void *v35;
  id obj;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0C99E20]);
  v38 = v9;
  objc_msgSend(a1, "personAndPetLocalIdentifiersInAssets:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithSet:", v12);

  v35 = v10;
  objc_msgSend(v10, "meNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v13, "addObject:", v15);
  v34 = (void *)v15;
  v37 = v13;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B260]), "initWithSimilarityModelClass:", objc_opt_class());
  v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v8;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v17)
  {
    v18 = v17;
    v40 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v46 != v40)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v21 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(v20, "clsPersonAndPetLocalIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithArray:", v22);

        if (objc_msgSend(v23, "count") && objc_msgSend(v23, "isSubsetOfSet:", v37))
        {
          objc_msgSend(v39, "addObject:", v20);
        }
        else
        {
          v24 = objc_msgSend(v20, "clsSimilarityModelVersion");
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v25 = v38;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v42;
            while (2)
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v42 != v28)
                  objc_enumerationMutation(v25);
                objc_msgSend(v16, "distanceBetweenItem:andItem:", v20, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
                v31 = v30;
                objc_msgSend(v16, "distanceThresholdForSimilarity:withSimilarityModelVersion:", 2, v24);
                if (v31 < v32)
                {
                  objc_msgSend(v39, "addObject:", v20);
                  goto LABEL_21;
                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              if (v27)
                continue;
              break;
            }
          }
LABEL_21:

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v18);
  }

  return v39;
}

+ (id)personAndPetLocalIdentifiersInAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "clsPersonAndPetLocalIdentifiers", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)isImportedAsset:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "importProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "importedBy");

  return (v4 < 0xD) & (0xFF8u >> v4);
}

@end
