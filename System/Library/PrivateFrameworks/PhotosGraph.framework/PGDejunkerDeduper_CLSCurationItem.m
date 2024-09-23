@implementation PGDejunkerDeduper_CLSCurationItem

- (id)dejunkedDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
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
  -[PGDejunkerDeduper_CLSCurationItem _buildCachesWithItems:options:](self, "_buildCachesWithItems:options:", v13, v12);
  v16.receiver = self;
  v16.super_class = (Class)PGDejunkerDeduper_CLSCurationItem;
  -[PGDejunkerDeduper dejunkedDedupedItemsInItems:options:debugInfo:progressBlock:](&v16, sel_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock_, v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)dejunkedDedupedItemIdentifiersWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  PGDejunkerDeduperOptions *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0D77E18]);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __95__PGDejunkerDeduper_CLSCurationItem_dejunkedDedupedItemIdentifiersWithItems_options_debugInfo___block_invoke;
  v31[3] = &unk_1E8430348;
  v24 = v10;
  v32 = v24;
  v11 = v8;
  v33 = v11;
  v12 = v9;
  v34 = v12;
  v26 = v7;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v31);
  v13 = -[PGDejunkerDeduperOptions initWithDictionaryRepresentation:]([PGDejunkerDeduperOptions alloc], "initWithDictionaryRepresentation:", v11);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B140]), "initWithItems:", v12);
  -[PGDejunkerDeduper_CLSCurationItem dejunkedDedupedItemsInItems:options:debugInfo:progressBlock:](self, "dejunkedDedupedItemsInItems:options:debugInfo:progressBlock:", v12, v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "clsIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  if (a5)
  {
    objc_msgSend(v14, "dictionaryRepresentationWithAppendExtraItemInfoBlock:", 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)_buildCachesWithItems:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  NSDictionary *v7;
  int v8;
  id v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  _BOOL4 v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  NSDictionary *v33;
  NSDictionary *v34;
  NSDictionary *personLocalIdentifiersByItemIdentifier;
  NSDictionary *v36;
  NSDictionary *peopleScenesByItemIdentifier;
  NSDictionary *v38;
  NSDictionary *averageFaceQualityByItemIdentifier;
  NSDictionary *v40;
  id v41;
  uint64_t v42;
  int v43;
  id v44;
  NSDictionary *v45;
  id v46;
  NSDictionary *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("#people#"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "useOnlyScenesForDeduping") & 1) != 0)
    v8 = 0;
  else
    v8 = objc_msgSend(v6, "useAllPersonsForDeduping");
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v9 = v5;
  v10 = v47;
  v50 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v50)
  {
    v11 = *(_QWORD *)v60;
    v41 = v6;
    v42 = *(_QWORD *)v60;
    v44 = v9;
    v45 = v7;
    v43 = v8;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v60 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v12);
        objc_msgSend(v13, "clsIdentifier");
        v52 = v13;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v12;
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v13;
            objc_msgSend(v14, "faceInfos");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v15;
            if (!objc_msgSend(v15, "count"))
            {
              v16 = 0;
              v10 = v47;
              goto LABEL_40;
            }
            v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v17 = v15;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            if (!v18)
            {
              v9 = v44;
              v7 = v45;
              v10 = v47;
LABEL_38:

              v8 = v43;
              v11 = v42;
              goto LABEL_40;
            }
            v19 = v18;
            v46 = v14;
            v20 = *(_QWORD *)v56;
            v21 = 0.0;
            v22 = 0.0;
            while (1)
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v56 != v20)
                  objc_enumerationMutation(v17);
                v24 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("personLocalIdentifier"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("size"));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "doubleValue");
                  if (v27 >= 0.05)
                  {

                  }
                  else
                  {
                    v28 = -[NSSet containsObject:](self->_verifiedPersonLocalIdentifiers, "containsObject:", v25);

                    if (!v28)
                      goto LABEL_27;
                  }
                  objc_msgSend(v16, "addObject:", v25);
                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("quality"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "doubleValue");
                  v31 = v30;

                  if (v31 >= 0.0)
                    v21 = v21 + 1.0;
                  v32 = -0.0;
                  if (v31 >= 0.0)
                    v32 = v31;
                  v22 = v22 + v32;
                }
LABEL_27:

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
              if (!v19)
              {

                v10 = v47;
                if (v21 > 0.0)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22 / v21);
                  v17 = (id)objc_claimAutoreleasedReturnValue();
                  -[NSDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v17, v53);
                  v6 = v41;
                  v9 = v44;
                  v7 = v45;
                  v14 = v46;
                  goto LABEL_38;
                }
                v6 = v41;
                v11 = v42;
                v9 = v44;
                v7 = v45;
                v8 = v43;
                v14 = v46;
LABEL_40:

LABEL_41:
                goto LABEL_42;
              }
            }
          }
        }
        if ((objc_msgSend(v6, "useOnlyScenesForDeduping") & 1) == 0)
        {
          objc_msgSend(v13, "clsPersonLocalIdentifiers");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = 0;
          }
          goto LABEL_41;
        }
        v16 = 0;
LABEL_42:
        if (objc_msgSend(v16, "count"))
          -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v16, v53);
        if (objc_msgSend(v52, "clsIsInhabited"))
          -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v49, v53);

        v12 = v51 + 1;
      }
      while (v51 + 1 != v50);
      v50 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v50);
  }

  v33 = v7;
  v34 = v10;
  personLocalIdentifiersByItemIdentifier = self->_personLocalIdentifiersByItemIdentifier;
  self->_personLocalIdentifiersByItemIdentifier = v33;
  v36 = v33;

  peopleScenesByItemIdentifier = self->_peopleScenesByItemIdentifier;
  self->_peopleScenesByItemIdentifier = v34;
  v38 = v34;

  averageFaceQualityByItemIdentifier = self->_averageFaceQualityByItemIdentifier;
  self->_averageFaceQualityByItemIdentifier = v40;

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
  NSDictionary *averageFaceQualityByItemIdentifier;
  void *v22;
  void *v23;
  double v24;
  double v25;
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
          && (averageFaceQualityByItemIdentifier = self->_averageFaceQualityByItemIdentifier,
              objc_msgSend(v18, "clsIdentifier"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSDictionary objectForKeyedSubscript:](averageFaceQualityByItemIdentifier, "objectForKeyedSubscript:", v22), v23 = (void *)objc_claimAutoreleasedReturnValue(), v22, v23))
        {
          objc_msgSend(v23, "doubleValue");
          v15 = v24;
          if (!v12)
            goto LABEL_21;
        }
        else
        {
          objc_msgSend(v18, "clsAestheticScore");
          v15 = v25;
          v23 = 0;
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

- (id)bestItemsInItems:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  int v22;
  double v23;
  double v24;
  NSDictionary *averageFaceQualityByItemIdentifier;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  int v31;
  BOOL v32;
  id v33;
  id v34;
  void *v36;
  id v37;
  id v38;
  PGDejunkerDeduper_CLSCurationItem *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v45 = 0;
  -[PGDejunkerDeduper_CLSCurationItem requiredItemsInItems:options:containStronglyRequiredItems:](self, "requiredItemsInItems:options:containStronglyRequiredItems:", v6, v7, &v45);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v45)
  {
    v10 = v8;
    goto LABEL_33;
  }
  if ((objc_msgSend(v7, "useOnlyScenesForDeduping") & 1) != 0)
    v11 = 0;
  else
    v11 = objc_msgSend(v7, "useFaceQualityForElection");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (!v13)
  {

    v15 = 0;
    goto LABEL_31;
  }
  v14 = v13;
  v38 = v6;
  v39 = self;
  v36 = v9;
  v37 = v7;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v42;
  v18 = -1.79769313e308;
  v19 = -1.79769313e308;
  obj = v12;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v42 != v17)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      v22 = objc_msgSend(v21, "isFavorite");
      objc_msgSend(v21, "clsContentScore");
      v24 = v23;
      if (v11
        && (averageFaceQualityByItemIdentifier = v39->_averageFaceQualityByItemIdentifier,
            objc_msgSend(v21, "clsIdentifier"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSDictionary objectForKeyedSubscript:](averageFaceQualityByItemIdentifier, "objectForKeyedSubscript:", v26), v27 = (void *)objc_claimAutoreleasedReturnValue(), v26, v27))
      {
        objc_msgSend(v27, "doubleValue");
        v29 = v28;
        if (!v15)
          goto LABEL_23;
      }
      else
      {
        objc_msgSend(v21, "clsAestheticScore");
        v29 = v30;
        v27 = 0;
        if (!v15)
          goto LABEL_23;
      }
      v31 = v22 & (v16 ^ 1);
      if ((v31 & 1) != 0 || ((v16 ^ v22) & 1) != 0)
      {
        if (!v31)
          goto LABEL_24;
LABEL_23:
        v33 = v21;

        v15 = v33;
        v16 = v22;
        v18 = v24;
        v19 = v29;
        goto LABEL_24;
      }
      v32 = v29 > v19;
      if (v24 != v18)
        v32 = v24 > v18;
      if (v32)
        goto LABEL_23;
LABEL_24:

    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  }
  while (v14);

  if (v15)
  {
    v9 = v36;
    v7 = v37;
    v6 = v38;
    if (!objc_msgSend(v36, "containsObject:", v15))
    {
      objc_msgSend(v36, "arrayByAddingObject:", v15);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
  }
  else
  {
    v7 = v37;
    v6 = v38;
    v9 = v36;
  }
LABEL_31:
  v34 = v9;
LABEL_32:
  v10 = v34;

LABEL_33:
  return v10;
}

- (BOOL)isJunkForItem:(id)a3
{
  double v3;

  objc_msgSend(a3, "clsContentScore");
  return v3 == *MEMORY[0x1E0D77DF0];
}

- (id)debugPersonStringForItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PGDejunkerDeduper_CLSCurationItem featureWithItem:](self, "featureWithItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personLocalIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peopleScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "substringToIndex:", 8, (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "sortUsingSelector:", sel_compare_);
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "count"))
    {
      v13 = CFSTR("nobody");
      goto LABEL_13;
    }
    objc_msgSend(v5, "allObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v13;
}

- (id)faceprintByPersonLocalIdentifierByItemIdentifierWithItems:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v27 = v4;
        v5 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v4);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v7 = (void *)MEMORY[0x1E0C9AA60];
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v5, "faceInfos");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v26 = v5;
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v9 = v7;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("faceprint"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                v16 = objc_alloc(MEMORY[0x1E0CEDEE8]);
                v28 = 0;
                v17 = (void *)objc_msgSend(v16, "initWithState:error:", v15, &v28);
                v18 = v28;
                if (v17)
                {
                  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("personLocalIdentifier"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v19);

                }
              }

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v11);
        }

        objc_msgSend(v26, "clsIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, v20);

        v4 = v27 + 1;
      }
      while (v27 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v25);
  }

  return v24;
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
  objc_msgSend(v4, "clsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_personLocalIdentifiersByItemIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_peopleScenesByItemIdentifier, "objectForKeyedSubscript:", v5);
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
  v11[2] = __73__PGDejunkerDeduper_CLSCurationItem_itemsSortedByScoreWithItems_options___block_invoke;
  v11[3] = &unk_1E842A3E0;
  v12 = v8;
  v11[4] = self;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)item:(id)a3 isStrongRequiredWithOptions:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isFavorite") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "identifiersOfRequiredItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v9);

  }
  return v7;
}

- (BOOL)item:(id)a3 isWeaklyRequiredWithOptions:(id)a4
{
  return objc_msgSend(a3, "clsIsLoopOrBounce");
}

- (id)requiredItemsInItems:(id)a3 options:(id)a4 containStronglyRequiredItems:(BOOL *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "identifiersOfRequiredItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifiersOfEligibleItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v12)
  {
    v21 = 0;
    goto LABEL_17;
  }
  v13 = v12;
  v21 = 0;
  v14 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v23 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v16, "clsIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (objc_msgSend(v10, "containsObject:", v17) & 1) != 0
        || objc_msgSend(v20, "containsObject:", v17))
      {
        if (-[PGDejunkerDeduper_CLSCurationItem item:isStrongRequiredWithOptions:](self, "item:isStrongRequiredWithOptions:", v16, v8))
        {
          v21 = 1;
        }
        else if (!-[PGDejunkerDeduper_CLSCurationItem item:isWeaklyRequiredWithOptions:](self, "item:isWeaklyRequiredWithOptions:", v16, v8))
        {
          goto LABEL_13;
        }
        objc_msgSend(v9, "addObject:", v16);
      }
LABEL_13:

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v13);
LABEL_17:

  if (a5)
    *a5 = v21 & 1;

  return v9;
}

- (NSSet)verifiedPersonLocalIdentifiers
{
  return self->_verifiedPersonLocalIdentifiers;
}

- (void)setVerifiedPersonLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedPersonLocalIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_averageFaceQualityByItemIdentifier, 0);
  objc_storeStrong((id *)&self->_peopleScenesByItemIdentifier, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersByItemIdentifier, 0);
}

@end
