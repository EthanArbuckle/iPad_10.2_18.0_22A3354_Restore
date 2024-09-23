@implementation PLSearchIndexingIncrementalUpdateBatch

- (PLSearchIndexingIncrementalUpdateBatch)initWithWorkItems:(id)a3 flags:(int64_t)a4
{
  id v7;
  PLSearchIndexingIncrementalUpdateBatch *v8;
  PLSearchIndexingIncrementalUpdateBatch *v9;
  uint64_t v10;
  NSArray *possibleEntities;
  NSMutableDictionary *v12;
  NSMutableDictionary *normalizedWorkItemsByIdentifiers;
  NSMutableSet *v14;
  NSMutableSet *identifiers;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLSearchIndexingIncrementalUpdateBatch;
  v8 = -[PLSearchIndexingIncrementalUpdateBatch init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workItems, a3);
    v9->_originalFlags = a4;
    PLBackgroundJobSearchIndexingEntitiesFromJobFlags(a4);
    v10 = objc_claimAutoreleasedReturnValue();
    possibleEntities = v9->_possibleEntities;
    v9->_possibleEntities = (NSArray *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    normalizedWorkItemsByIdentifiers = v9->_normalizedWorkItemsByIdentifiers;
    v9->_normalizedWorkItemsByIdentifiers = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    identifiers = v9->_identifiers;
    v9->_identifiers = v14;

  }
  return v9;
}

- (BOOL)hasDonations
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PLSearchIndexingIncrementalUpdateBatch eligibleManagedObjects](self, "eligibleManagedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[PLSearchIndexingIncrementalUpdateBatch ineligibleIdentifiers](self, "ineligibleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (unint64_t)targetEntity
{
  void *v3;
  unint64_t v4;

  if (-[NSArray count](self->_possibleEntities, "count") != 1)
    return 0;
  -[NSArray firstObject](self->_possibleEntities, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)_flagsAreIncompatible
{
  return !-[NSArray count](self->_possibleEntities, "count") && self->_originalFlags != 1;
}

- (BOOL)_flagsAreAmbiguous
{
  return -[NSArray count](self->_possibleEntities, "count") > 1;
}

- (void)_inPerformBlock_removeWorkItemsNotMatchingOriginalFlags
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSUInteger v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *workItems;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  NSUInteger v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_workItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        PLBackgroundJobSearchIndexingEntitiesFromJobFlags(objc_msgSend(v9, "jobFlags", (_QWORD)v21));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[PLSearchIndexingIncrementalUpdateBatch _flagsAreAmbiguous](self, "_flagsAreAmbiguous");
        v12 = objc_msgSend(v10, "count");
        if (v11)
        {
          if (v12 > 1)
            goto LABEL_13;
        }
        else
        {
          if (v12 == 1)
          {
            objc_msgSend(v10, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "unsignedIntegerValue");

          }
          else
          {
            v14 = 0;
          }
          if (-[PLSearchIndexingIncrementalUpdateBatch targetEntity](self, "targetEntity") == v14)
LABEL_13:
            objc_msgSend(v3, "addObject:", v9);
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }

  v15 = objc_msgSend(v3, "count");
  if (v15 != -[NSArray count](self->_workItems, "count"))
  {
    PLSearchBackendIndexingEngineGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = -[NSArray count](self->_workItems, "count");
      v18 = objc_msgSend(v3, "count");
      *(_DWORD *)buf = 134217984;
      v26 = v17 - v18;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Search indexing batch initialized with work items that don't match the batch job flags, %lu items have been removed and will be processed in a future batch", buf, 0xCu);
    }

    v19 = (NSArray *)objc_msgSend(v3, "copy");
    workItems = self->_workItems;
    self->_workItems = v19;

  }
}

- (void)_inPerformBlock_coalesceWithLibrary:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableSet *identifiers;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  char v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  int v32;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  PLSearchIndexingNormalizedWorkItem *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSMutableDictionary *normalizedWorkItemsByIdentifiers;
  void *v44;
  NSMutableSet *v45;
  void *v46;
  NSArray *v47;
  NSArray *coalescedWorkItems;
  __int128 v49;
  PLSearchIndexingIncrementalUpdateBatch *v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  NSArray *obj;
  uint64_t v57;
  id v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  if (!-[PLSearchIndexingIncrementalUpdateBatch _flagsAreIncompatible](self, "_flagsAreIncompatible")
    && !-[PLSearchIndexingIncrementalUpdateBatch _flagsAreAmbiguous](self, "_flagsAreAmbiguous"))
  {
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = self->_workItems;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    if (!v4)
      goto LABEL_49;
    v6 = v4;
    v7 = *(_QWORD *)v66;
    *(_QWORD *)&v5 = 134218242;
    v49 = v5;
    v52 = *(_QWORD *)v66;
    v50 = self;
    while (1)
    {
      v8 = 0;
      v54 = v6;
      do
      {
        if (*(_QWORD *)v66 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v8);
        identifiers = self->_identifiers;
        objc_msgSend(v9, "identifier", v49);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(identifiers) = -[NSMutableSet containsObject:](identifiers, "containsObject:", v11);

        if ((identifiers & 1) == 0)
        {
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "managedObjectContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = 0;
          +[PLBackgroundJobWorkItem workItemsSortedByTimestampWithIdentifier:jobTypes:inManagedObjectContext:error:](PLBackgroundJobWorkItem, "workItemsSortedByTimestampWithIdentifier:jobTypes:inManagedObjectContext:error:", v12, &unk_1E3763DE8, v13, &v64);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v64;

          if (v14)
          {
            v15 = objc_msgSend(v9, "jobType");
            v59 = v14;
            v57 = v8;
            if ((unint64_t)objc_msgSend(v14, "count") < 2)
            {
              v34 = objc_msgSend(v9, "jobFlags");
              goto LABEL_44;
            }
            PLSearchBackendIndexingEngineGetLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = objc_msgSend(v14, "count");
              objc_msgSend(v9, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v49;
              v71 = v17;
              v72 = 2114;
              v73 = v18;
              _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Coalescing %ld work items for identifier: %{public}@", buf, 0x16u);

            }
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            v19 = v14;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
            if (!v20)
            {

              v34 = 0;
              goto LABEL_44;
            }
            v21 = v20;
            v51 = v9;
            v22 = 0;
            v23 = 0;
            v24 = *(_QWORD *)v61;
            while (1)
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v61 != v24)
                  objc_enumerationMutation(v19);
                v26 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
                v23 |= objc_msgSend(v26, "jobFlags");
                v27 = objc_msgSend(v26, "jobFlags");
                v28 = (v27 & 2) == 0;
                if ((v27 & 2) != 0)
                {
                  v23 &= ~1uLL;
                  PLSearchBackendIndexingEngineGetLog();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    v30 = v29;
                    v31 = "Coalesced an insertion into index";
                    goto LABEL_25;
                  }
                }
                else
                {
                  if ((objc_msgSend(v26, "jobFlags") & 1) == 0)
                    goto LABEL_27;
                  v23 &= ~2uLL;
                  PLSearchBackendIndexingEngineGetLog();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    v30 = v29;
                    v31 = "Coalesced a removal from index";
LABEL_25:
                    _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEBUG, v31, buf, 2u);
                  }
                }

                v22 = v28;
LABEL_27:
                if (objc_msgSend(v26, "jobType") == 1)
                {
                  v15 = 1;
                }
                else
                {
                  v32 = objc_msgSend(v26, "jobType");
                  if (v15 == 3 && v32 == 2)
                    v15 = 2;
                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
              if (!v21)
              {

                if (v22)
                  v34 = 1;
                else
                  v34 = v23;
                self = v50;
                v9 = v51;
LABEL_44:
                objc_msgSend(v53, "addObjectsFromArray:", v59);
                v37 = [PLSearchIndexingNormalizedWorkItem alloc];
                objc_msgSend(v9, "identifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = -[PLSearchIndexingIncrementalUpdateBatch targetEntity](self, "targetEntity");
                objc_msgSend(v59, "lastObject");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "timestamp");
                v41 = v9;
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = -[PLSearchIndexingNormalizedWorkItem initWithIdentifier:jobType:jobFlags:entityToIndex:timestamp:](v37, "initWithIdentifier:jobType:jobFlags:entityToIndex:timestamp:", v38, v15, v34, v39, v42);

                normalizedWorkItemsByIdentifiers = self->_normalizedWorkItemsByIdentifiers;
                objc_msgSend(v41, "identifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](normalizedWorkItemsByIdentifiers, "setObject:forKeyedSubscript:", v35, v44);

                v45 = self->_identifiers;
                objc_msgSend(v41, "identifier");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = v59;
                -[NSMutableSet addObject:](v45, "addObject:", v46);

                v7 = v52;
                v6 = v54;
                v8 = v57;
LABEL_45:
                v36 = v58;
                goto LABEL_46;
              }
            }
          }
          PLSearchBackendIndexingEngineGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            goto LABEL_45;
          *(_DWORD *)buf = 138543618;
          v71 = (uint64_t)v9;
          v72 = 2112;
          v36 = v58;
          v73 = v58;
          _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "Failed to fetch work items for coalescing, skipping item %{public}@, error: %@", buf, 0x16u);
LABEL_46:

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (!v6)
      {
LABEL_49:

        v47 = (NSArray *)objc_msgSend(v53, "copy");
        coalescedWorkItems = self->_coalescedWorkItems;
        self->_coalescedWorkItems = v47;

        goto LABEL_50;
      }
    }
  }
  objc_storeStrong((id *)&self->_coalescedWorkItems, self->_workItems);
LABEL_50:

}

- (void)inPerformBlock_prepareDonationsWithLibrary:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSError *error;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSMutableDictionary *normalizedWorkItemsByIdentifiers;
  void *v42;
  id v43;
  id v44;
  id v45;
  NSError *v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  __CFString *v55;
  NSObject *v56;
  unint64_t v57;
  NSError *v58;
  __CFString *v59;
  NSError *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  NSArray *v64;
  NSArray *eligibleManagedObjects;
  NSArray *v66;
  NSArray *ineligibleIdentifiers;
  NSDictionary *v68;
  NSDictionary *partialUpdateMasks;
  void *v70;
  id v71;
  id v72;
  PLSearchIndexingIncrementalUpdateBatch *v73;
  id v74;
  id v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  __CFString *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLSearchIndexingIncrementalUpdateBatch _inPerformBlock_removeWorkItemsNotMatchingOriginalFlags](self, "_inPerformBlock_removeWorkItemsNotMatchingOriginalFlags");
  -[PLSearchIndexingIncrementalUpdateBatch _inPerformBlock_coalesceWithLibrary:](self, "_inPerformBlock_coalesceWithLibrary:", v4);
  if (!-[PLSearchIndexingIncrementalUpdateBatch _flagsAreAmbiguous](self, "_flagsAreAmbiguous")
    && !-[PLSearchIndexingIncrementalUpdateBatch _flagsAreIncompatible](self, "_flagsAreIncompatible"))
  {
    v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = 0;
    v73 = self;
    switch(-[PLSearchIndexingIncrementalUpdateBatch targetEntity](self, "targetEntity"))
    {
      case 0uLL:
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v6 = self->_identifiers;
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v82 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_normalizedWorkItemsByIdentifiers, "objectForKeyedSubscript:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v12, "jobFlags") & 1) != 0)
                objc_msgSend(v74, "addObject:", v11);

            }
            v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
          }
          while (v8);
        }

        objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", MEMORY[0x1E0C9AA60]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 1uLL:
        -[NSMutableSet allObjects](self->_identifiers, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "managedObjectContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset fetchAssetsWithUUIDs:managedObjectContext:](PLManagedAsset, "fetchAssetsWithUUIDs:managedObjectContext:", v13, v14);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 3uLL:
        -[NSMutableSet allObjects](self->_identifiers, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "managedObjectContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLGenericAlbum fetchAlbumsWithUUIDs:managedObjectContext:](PLGenericAlbum, "fetchAlbumsWithUUIDs:managedObjectContext:", v13, v14);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 4uLL:
        -[NSMutableSet allObjects](self->_identifiers, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "managedObjectContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPhotosHighlight fetchHighlightsWithUUIDs:managedObjectContext:](PLPhotosHighlight, "fetchHighlightsWithUUIDs:managedObjectContext:", v13, v14);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 5uLL:
        -[NSMutableSet allObjects](self->_identifiers, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "managedObjectContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMemory fetchMemoriesWithUUIDs:managedObjectContext:](PLMemory, "fetchMemoriesWithUUIDs:managedObjectContext:", v13, v14);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v5 = (void *)v15;

        break;
      case 7uLL:
        v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v16 = self->_identifiers;
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v86;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v86 != v19)
                objc_enumerationMutation(v16);
              +[PLSearchEntity fetchSearchEntityWithEncodedIdentifierString:inLibrary:](PLSearchEntity, "fetchSearchEntityWithEncodedIdentifierString:inLibrary:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j), v4);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v21, "isSuccess"))
              {
                objc_msgSend(v21, "result");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "count");

                if (v23)
                {
                  objc_msgSend(v21, "result");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "firstObject");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "sourceNode");
                  v26 = v4;
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "addObject:", v27);

                  v4 = v26;
                }
              }

            }
            v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
          }
          while (v18);
        }

        objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v75);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        self = v73;
        break;
      default:
        break;
    }
    if (objc_msgSend(v5, "isSuccess"))
    {
      v71 = v4;
      error = (NSError *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v70 = v5;
      objc_msgSend(v5, "result");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v33 = v31;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
      v72 = v33;
      if (v34)
      {
        v35 = v34;
        v76 = *(_QWORD *)v78;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v78 != v76)
              objc_enumerationMutation(v33);
            v37 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
            objc_msgSend(v37, "searchIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v38);

            if (objc_msgSend(v37, "isEligibleForSearchIndexing"))
            {
              v39 = v37;
              -[NSError addObject:](error, "addObject:", v39);
              objc_msgSend(v39, "searchIdentifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v40);

              if (-[PLSearchIndexingIncrementalUpdateBatch targetEntity](self, "targetEntity") == 1)
              {
                normalizedWorkItemsByIdentifiers = self->_normalizedWorkItemsByIdentifiers;
                objc_msgSend(v39, "searchIdentifier");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](normalizedWorkItemsByIdentifiers, "objectForKeyedSubscript:", v42);
                v43 = v32;
                v44 = v30;
                v45 = v29;
                v46 = error;
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v47, "jobFlags");
                if ((v48 & 2) != 0)
                  v49 = 3;
                else
                  v49 = (v48 >> 2) & 2 | ((v48 & 0x14) != 0);

                error = v46;
                v29 = v45;
                v30 = v44;
                v32 = v43;
                v33 = v72;

              }
              else
              {
                v49 = 0;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectID");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v50, v51);

              self = v73;
            }
            else
            {
              objc_msgSend(v37, "searchIdentifier");
              v39 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "addObject:", v39);
            }

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
        }
        while (v35);
      }

      if (-[PLSearchIndexingIncrementalUpdateBatch targetEntity](self, "targetEntity"))
      {
        v52 = (void *)-[NSMutableSet mutableCopy](self->_identifiers, "mutableCopy");
        objc_msgSend(v52, "minusSet:", v32);
        objc_msgSend(v52, "allObjects");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addObjectsFromArray:", v53);

        self = v73;
      }
      PLSearchBackendIndexingEngineGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexingIncrementalUpdateBatch _descriptionForSearchableIdentifiers:ineligibleIdentifiers:entity:](self, "_descriptionForSearchableIdentifiers:ineligibleIdentifiers:entity:", v29, v74, -[PLSearchIndexingIncrementalUpdateBatch targetEntity](self, "targetEntity"));
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v90 = v55;
        _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_DEFAULT, "Coalesced batch of %{public}@", buf, 0xCu);

      }
      PLSearchBackendIndexingEngineGetLog();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        v57 = -[PLSearchIndexingIncrementalUpdateBatch targetEntity](self, "targetEntity");
        v58 = error;
        if (v57 > 8)
          v59 = CFSTR("invalid");
        else
          v59 = off_1E366EDE0[v57];
        v61 = v59;
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "componentsJoinedByString:", CFSTR(", "));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v90 = v61;
        v91 = 2112;
        v92 = v62;
        v93 = 2112;
        v94 = v63;
        _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_DEBUG, "Searchable object entity: %@, identifiers: %@, ineligible identifiers: %@", buf, 0x20u);

        error = v58;
        v33 = v72;
        self = v73;
      }

      v64 = (NSArray *)-[NSError copy](error, "copy");
      eligibleManagedObjects = self->_eligibleManagedObjects;
      self->_eligibleManagedObjects = v64;

      v66 = (NSArray *)objc_msgSend(v74, "copy");
      ineligibleIdentifiers = self->_ineligibleIdentifiers;
      self->_ineligibleIdentifiers = v66;

      v68 = (NSDictionary *)objc_msgSend(v30, "copy");
      partialUpdateMasks = self->_partialUpdateMasks;
      self->_partialUpdateMasks = v68;

      v5 = v70;
      v4 = v71;
    }
    else
    {
      if (!objc_msgSend(v5, "isFailure"))
      {
LABEL_60:

        goto LABEL_61;
      }
      objc_msgSend(v5, "error");
      v60 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v60;
    }

    goto LABEL_60;
  }
LABEL_61:

}

- (void)inPerformTransaction_cleanUpWithSuccess:(BOOL)a3 library:(id)a4
{
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t n;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t ii;
  NSMutableDictionary *normalizedWorkItemsByIdentifiers;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSMutableSet *v43;
  NSObject *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t jj;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  NSMutableSet *v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  __objc2_class **v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t m;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  NSObject *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t k;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  id v116;
  __int128 v117;
  NSMutableSet *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  NSObject *v123;
  NSObject *v124;
  void *v125;
  PLSearchIndexingIncrementalUpdateBatch *v126;
  NSMutableSet *obj;
  id obja;
  NSMutableSet *objb;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[4];
  id v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _QWORD v145[4];
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD v157[4];
  id v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _QWORD v164[5];
  NSMutableSet *v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  uint8_t v177[128];
  uint8_t buf[4];
  void *v179;
  __int16 v180;
  NSObject *v181;
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v126 = self;
  if (a3)
  {
    if (!-[PLSearchIndexingIncrementalUpdateBatch _flagsAreAmbiguous](self, "_flagsAreAmbiguous")
      && !-[PLSearchIndexingIncrementalUpdateBatch _flagsAreIncompatible](self, "_flagsAreIncompatible"))
    {
      switch(-[PLSearchIndexingIncrementalUpdateBatch targetEntity](self, "targetEntity"))
      {
        case 0uLL:
          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v7 = self->_identifiers;
          v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v134, v175, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v135;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v135 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * i);
                -[NSMutableDictionary objectForKeyedSubscript:](v126->_normalizedWorkItemsByIdentifiers, "objectForKeyedSubscript:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v13, "jobFlags") & 1) == 0)
                {
                  v14 = objc_msgSend(v13, "jobFlags");
                  objc_msgSend(v6, "managedObjectContext");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v12, v14, v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v13, "timestamp");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setTimestamp:", v17);

                  objc_msgSend(v16, "setJobType:", objc_msgSend(v13, "jobType"));
                }

              }
              v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v134, v175, 16);
            }
            while (v9);
          }

          goto LABEL_95;
        case 2uLL:
          -[NSMutableSet allObjects](self->_identifiers, "allObjects");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "managedObjectContext");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v164[0] = MEMORY[0x1E0C809B0];
          v164[1] = 3221225472;
          v164[2] = __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke;
          v164[3] = &unk_1E366F730;
          v164[4] = self;
          v165 = (NSMutableSet *)v6;
          +[PLPerson enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs:managedObjectContext:assetUUIDHandler:](PLPerson, "enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs:managedObjectContext:assetUUIDHandler:", v52, v53, v164);

          v43 = v165;
          goto LABEL_30;
        case 6uLL:
          v162 = 0u;
          v163 = 0u;
          v160 = 0u;
          v161 = 0u;
          obj = self->_identifiers;
          v54 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v160, v183, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v161;
            do
            {
              for (j = 0; j != v55; ++j)
              {
                if (*(_QWORD *)v161 != v56)
                  objc_enumerationMutation(obj);
                v58 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * j);
                -[NSMutableDictionary objectForKeyedSubscript:](self->_normalizedWorkItemsByIdentifiers, "objectForKeyedSubscript:", v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "managedObjectContext");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "libraryServicesManager");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = objc_msgSend(v61, "wellKnownPhotoLibraryIdentifier");
                v157[0] = MEMORY[0x1E0C809B0];
                v157[1] = 3221225472;
                v157[2] = __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_2;
                v157[3] = &unk_1E36701C0;
                v158 = v6;
                v159 = v59;
                v63 = v59;
                v64 = v62;
                self = v126;
                +[PLPerson enumerateAssetUUIDsForSearchIndexingWithPersonUUID:managedObjectContext:libraryIdentifier:assetUUIDHandler:](PLPerson, "enumerateAssetUUIDsForSearchIndexingWithPersonUUID:managedObjectContext:libraryIdentifier:assetUUIDHandler:", v58, v60, v64, v157);

              }
              v55 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v160, v183, 16);
            }
            while (v55);
          }
          goto LABEL_29;
        case 7uLL:
          v155 = 0u;
          v156 = 0u;
          v153 = 0u;
          v154 = 0u;
          v65 = self->_identifiers;
          v66 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v153, v182, 16);
          if (!v66)
            goto LABEL_86;
          v68 = v66;
          v69 = off_1E365A000;
          v70 = *(_QWORD *)v154;
          *(_QWORD *)&v67 = 138543362;
          v117 = v67;
          v118 = v65;
          v119 = *(_QWORD *)v154;
          break;
        case 8uLL:
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          objb = self->_identifiers;
          v107 = -[NSMutableSet countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v141, v176, 16);
          if (v107)
          {
            v108 = v107;
            v109 = *(_QWORD *)v142;
            do
            {
              for (k = 0; k != v108; ++k)
              {
                if (*(_QWORD *)v142 != v109)
                  objc_enumerationMutation(objb);
                v111 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * k);
                -[NSMutableDictionary objectForKeyedSubscript:](v126->_normalizedWorkItemsByIdentifiers, "objectForKeyedSubscript:", v111);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "managedObjectContext");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "libraryServicesManager");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = objc_msgSend(v114, "wellKnownPhotoLibraryIdentifier");
                v138[0] = MEMORY[0x1E0C809B0];
                v138[1] = 3221225472;
                v138[2] = __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_48;
                v138[3] = &unk_1E36701C0;
                v139 = v6;
                v140 = v112;
                v116 = v112;
                +[PLMoment enumerateAssetUUIDsForSearchIndexingWithMomentUUID:managedObjectContext:libraryIdentifier:assetUUIDHandler:](PLMoment, "enumerateAssetUUIDsForSearchIndexingWithMomentUUID:managedObjectContext:libraryIdentifier:assetUUIDHandler:", v111, v113, v115, v138);

              }
              v108 = -[NSMutableSet countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v141, v176, 16);
            }
            while (v108);
          }

LABEL_95:
          self = v126;
          goto LABEL_31;
        default:
          goto LABEL_31;
      }
      while (1)
      {
        v71 = 0;
        v120 = v68;
        do
        {
          if (*(_QWORD *)v154 != v70)
            objc_enumerationMutation(v65);
          v72 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v71);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_normalizedWorkItemsByIdentifiers, "objectForKeyedSubscript:", v72, v117);
          obja = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(obja, "jobFlags") & 0x400) != 0)
          {
            -[__objc2_class fetchSearchEntityWithEncodedIdentifierString:inLibrary:](v69[325], "fetchSearchEntityWithEncodedIdentifierString:inLibrary:", v72, v6);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v73, "isSuccess"))
            {
              PLSearchBackendIndexingEngineGetLog();
              v95 = objc_claimAutoreleasedReturnValue();
              v125 = v73;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v73, "error");
                v96 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v179 = v72;
                v180 = 2112;
                v181 = v96;
                _os_log_impl(&dword_199541000, v95, OS_LOG_TYPE_ERROR, "Failed to fetch search entity with identifier: %@, error: %@", buf, 0x16u);

              }
              goto LABEL_82;
            }
            objc_msgSend(v73, "result");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v74, "count");

            if (v75)
            {
              v125 = v73;
              objc_msgSend(v73, "result");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "firstObject");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v152 = 0;
              objc_msgSend(v77, "fetchAllMomentsWithError:", &v152);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = v152;

              v79 = v78;
              if (v78)
              {
                if (objc_msgSend(v78, "count"))
                {
                  v121 = v71;
                  v150 = 0u;
                  v151 = 0u;
                  v148 = 0u;
                  v149 = 0u;
                  v80 = v78;
                  v81 = -[NSObject countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
                  v124 = v80;
                  if (v81)
                  {
                    v82 = v81;
                    v122 = v78;
                    v83 = *(_QWORD *)v149;
                    do
                    {
                      for (m = 0; m != v82; ++m)
                      {
                        if (*(_QWORD *)v149 != v83)
                          objc_enumerationMutation(v80);
                        v85 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * m);
                        PLSearchBackendIndexingEngineGetLog();
                        v86 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(v85, "uuid");
                          v87 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v125, "result");
                          v88 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v88, "firstObject");
                          v89 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v89, "uuid");
                          v90 = objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543618;
                          v179 = v87;
                          v180 = 2114;
                          v181 = v90;
                          _os_log_impl(&dword_199541000, v86, OS_LOG_TYPE_DEFAULT, "Fanning out to moment %{public}@ for search entity %{public}@", buf, 0x16u);

                          v80 = v124;
                        }

                        objc_msgSend(v85, "uuid");
                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v6, "managedObjectContext");
                        v92 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v6, "libraryServicesManager");
                        v93 = (void *)objc_claimAutoreleasedReturnValue();
                        v94 = objc_msgSend(v93, "wellKnownPhotoLibraryIdentifier");
                        v145[0] = MEMORY[0x1E0C809B0];
                        v145[1] = 3221225472;
                        v145[2] = __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_47;
                        v145[3] = &unk_1E36701C0;
                        v146 = v6;
                        v147 = obja;
                        +[PLMoment enumerateAssetUUIDsForSearchIndexingWithMomentUUID:managedObjectContext:libraryIdentifier:assetUUIDHandler:](PLMoment, "enumerateAssetUUIDsForSearchIndexingWithMomentUUID:managedObjectContext:libraryIdentifier:assetUUIDHandler:", v91, v92, v94, v145);

                      }
                      v82 = -[NSObject countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
                    }
                    while (v82);
                    self = v126;
                    v65 = v118;
                    v70 = v119;
                    v68 = v120;
                    v71 = v121;
                    v69 = off_1E365A000;
                    v95 = v123;
LABEL_76:
                    v79 = v122;
LABEL_81:

LABEL_82:
                    v73 = v125;
                    goto LABEL_83;
                  }
                  v69 = off_1E365A000;
                  v70 = v119;
                }
                else
                {
                  PLSearchBackendIndexingEngineGetLog();
                  v102 = objc_claimAutoreleasedReturnValue();
                  v124 = v102;
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v125, "result");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v103, "firstObject");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v104, "uuid");
                    v105 = v71;
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v117;
                    v179 = v106;
                    _os_log_impl(&dword_199541000, v102, OS_LOG_TYPE_DEFAULT, "Found 0 moments for search entity with uuid %{public}@, will not index any assets", buf, 0xCu);

                    v71 = v105;
                    v70 = v119;
                    v69 = off_1E365A000;

                    v68 = v120;
                    v65 = v118;

                  }
                }
              }
              else
              {
                PLBackendGetLog();
                v97 = objc_claimAutoreleasedReturnValue();
                v124 = v97;
                if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v125, "result");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v98, "firstObject");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "uuid");
                  v100 = v71;
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v179 = v101;
                  v180 = 2112;
                  v122 = 0;
                  v181 = v123;
                  _os_log_impl(&dword_199541000, v97, OS_LOG_TYPE_ERROR, "Fetch failed for all moment associated with search entity %{public}@ error: %@", buf, 0x16u);

                  v71 = v100;
                  v70 = v119;
                  v69 = off_1E365A000;

                  v68 = v120;
                  v65 = v118;

                  v95 = v123;
                  goto LABEL_76;
                }
              }
              v95 = v123;
              goto LABEL_81;
            }
LABEL_83:

          }
          ++v71;
        }
        while (v71 != v68);
        v68 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v153, v182, 16);
        if (!v68)
        {
LABEL_86:

          break;
        }
      }
    }
  }
  else
  {
    v172 = 0u;
    v173 = 0u;
    v170 = 0u;
    v171 = 0u;
    v18 = self->_ineligibleIdentifiers;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v170, v185, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v171;
      do
      {
        for (n = 0; n != v20; ++n)
        {
          if (*(_QWORD *)v171 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * n);
          objc_msgSend(v6, "managedObjectContext");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLBackgroundJobWorkItem insertBackgroundJobWorkItemWithIdentifier:jobType:jobFlags:inManagedObjectContext:](PLBackgroundJobWorkItem, "insertBackgroundJobWorkItemWithIdentifier:jobType:jobFlags:inManagedObjectContext:", v23, 3, 1, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKeyedSubscript:](self->_normalizedWorkItemsByIdentifiers, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "timestamp");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setTimestamp:", v27);

          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 60.0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setDelayUntilDate:", v28);

        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v170, v185, 16);
      }
      while (v20);
    }

    v168 = 0u;
    v169 = 0u;
    v166 = 0u;
    v167 = 0u;
    obj = self->_eligibleManagedObjects;
    v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v166, v184, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v167;
      do
      {
        for (ii = 0; ii != v30; ++ii)
        {
          if (*(_QWORD *)v167 != v31)
            objc_enumerationMutation(obj);
          normalizedWorkItemsByIdentifiers = self->_normalizedWorkItemsByIdentifiers;
          v34 = *(id *)(*((_QWORD *)&v166 + 1) + 8 * ii);
          objc_msgSend(v34, "searchIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](normalizedWorkItemsByIdentifiers, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "searchIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "jobFlags");
          objc_msgSend(v6, "managedObjectContext");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          +[PLBackgroundJobWorkItem insertBackgroundJobWorkItemWithIdentifier:jobType:jobFlags:inManagedObjectContext:](PLBackgroundJobWorkItem, "insertBackgroundJobWorkItemWithIdentifier:jobType:jobFlags:inManagedObjectContext:", v37, 3, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          self = v126;
          objc_msgSend(v36, "timestamp");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setTimestamp:", v41);

          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setDelayUntilDate:", v42);

        }
        v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v166, v184, 16);
      }
      while (v30);
    }
LABEL_29:
    v43 = obj;
LABEL_30:

  }
LABEL_31:
  if (-[PLSearchIndexingIncrementalUpdateBatch _flagsAreAmbiguous](self, "_flagsAreAmbiguous"))
  {
    PLSearchBackendIndexingEngineGetLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "Search indexing job flags map to mutliple entities, replacing with unambiguous jobs", buf, 2u);
    }

    -[PLSearchIndexingIncrementalUpdateBatch _inPerformTransaction_processAmbiguousEntityJobsWithFlags:library:](self, "_inPerformTransaction_processAmbiguousEntityJobsWithFlags:library:", self->_originalFlags, v6);
  }
  v45 = self->_coalescedWorkItems;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v130, v174, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v131;
    do
    {
      for (jj = 0; jj != v47; ++jj)
      {
        if (*(_QWORD *)v131 != v48)
          objc_enumerationMutation(v45);
        v50 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * jj);
        objc_msgSend(v6, "managedObjectContext");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "deleteObject:", v50);

      }
      v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v130, v174, 16);
    }
    while (v47);
  }

}

- (id)_descriptionForSearchableIdentifiers:(id)a3 ineligibleIdentifiers:(id)a4 entity:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10 = objc_msgSend(v7, "count");
  if (a5 > 8)
    v11 = CFSTR("invalid");
  else
    v11 = off_1E366EDE0[a5];
  v12 = v11;
  objc_msgSend(v9, "appendFormat:", CFSTR("%tu %@ searchable objects"), v10, v12);

  if (objc_msgSend(v7, "count") && (unint64_t)objc_msgSend(v7, "count") <= 9)
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" (%@)"), v13);

  }
  objc_msgSend(v9, "appendFormat:", CFSTR(", %tu ineligible identifiers to remove"), objc_msgSend(v8, "count"));
  if (objc_msgSend(v8, "count") && (unint64_t)objc_msgSend(v8, "count") <= 9)
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" (%@)"), v14);

  }
  return v9;
}

- (unint64_t)_inLibraryPerform_searchableEntityForAmbiguousIdentifier:(id)a3 library:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    +[PLGenericAlbum albumWithUUID:inLibrary:](PLGenericAlbum, "albumWithUUID:inLibrary:", v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = 3;
    }
    else
    {
      v16[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSearchIndexManager fetchHighlightsWithUUIDs:managedObjectContext:error:](PLSearchIndexManager, "fetchHighlightsWithUUIDs:managedObjectContext:error:", v10, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v8 = 4;
      }
      else
      {
        +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", v5, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          v8 = 5;
        else
          v8 = 0;

      }
    }

  }
  return v8;
}

- (void)_inPerformTransaction_processAmbiguousEntityJobsWithFlags:(int64_t)a3 library:(id)a4
{
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  NSObject *v27;
  __CFString *v28;
  NSUInteger v29;
  PLSearchIndexingIncrementalUpdateBatch *v30;
  NSArray *obj;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v29 = -[NSArray count](self->_workItems, "count");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_workItems;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v33)
  {
    v34 = 0;
    v32 = *(_QWORD *)v36;
    v30 = self;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PLSearchIndexingIncrementalUpdateBatch _inLibraryPerform_searchableEntityForAmbiguousIdentifier:library:](self, "_inLibraryPerform_searchableEntityForAmbiguousIdentifier:library:", v9, v6);

        if (v10 > 8)
          v11 = 3;
        else
          v11 = qword_199B9F718[v10];
        v12 = v11 & a3;
        PLSearchBackendIndexingEngineGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            PLBackgroundJobWorkerSearchJobFlagsDescription(a3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            PLBackgroundJobWorkerSearchJobFlagsDescription(v12);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v17 = CFSTR("invalid");
            if (v10 <= 8)
              v17 = off_1E366EDE0[v10];
            v18 = v17;
            objc_msgSend(v8, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v40 = v15;
            v41 = 2112;
            v42 = v16;
            v43 = 2112;
            v44 = v18;
            v45 = 2112;
            v46 = v19;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Converting ambiguous job with flags: %@ to new job with flags: %@, entity: %@, identifier: %@", buf, 0x2Au);

            self = v30;
          }

          objc_msgSend(v8, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "managedObjectContext");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLBackgroundJobWorkItem insertSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v20, v12, v21);
          v14 = objc_claimAutoreleasedReturnValue();

          -[NSObject setJobType:](v14, "setJobType:", objc_msgSend(v8, "jobType"));
          ++v34;
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          PLBackgroundJobWorkerSearchJobFlagsDescription(a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = CFSTR("invalid");
          if (v10 <= 8)
            v23 = off_1E366EDE0[v10];
          v24 = v23;
          objc_msgSend(v8, "identifier");
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v22;
          v41 = 2114;
          v42 = v24;
          v43 = 2114;
          v44 = v25;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Incompatible job flags: %{public}@ for entity: %{public}@ with identifier: %{public}@, job will be a no op", buf, 0x20u);

          self = v30;
        }

        objc_msgSend(v6, "managedObjectContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "deleteObject:", v8);

      }
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v33);
  }
  else
  {
    v34 = 0;
  }

  PLSearchBackendIndexingEngineGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    PLBackgroundJobWorkerSearchJobFlagsDescription(a3);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v40 = v34;
    v41 = 2048;
    v42 = (__CFString *)v29;
    v43 = 2114;
    v44 = v28;
    _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Converted %lu out of %lu ambiguous jobs with flags: %{public}@ to resolvable jobs", buf, 0x20u);

  }
}

- (NSArray)eligibleManagedObjects
{
  return self->_eligibleManagedObjects;
}

- (NSDictionary)partialUpdateMasks
{
  return self->_partialUpdateMasks;
}

- (NSArray)ineligibleIdentifiers
{
  return self->_ineligibleIdentifiers;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)coalescedWorkItems
{
  return self->_coalescedWorkItems;
}

- (NSArray)identifiersRequiringAdditionalWork
{
  return self->_identifiersRequiringAdditionalWork;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersRequiringAdditionalWork, 0);
  objc_storeStrong((id *)&self->_coalescedWorkItems, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_ineligibleIdentifiers, 0);
  objc_storeStrong((id *)&self->_partialUpdateMasks, 0);
  objc_storeStrong((id *)&self->_eligibleManagedObjects, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_normalizedWorkItemsByIdentifiers, 0);
  objc_storeStrong((id *)&self->_possibleEntities, 0);
  objc_storeStrong((id *)&self->_workItems, 0);
}

void __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v6, 4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimestamp:", v9);

  objc_msgSend(v8, "setJobType:", objc_msgSend(v10, "jobType"));
}

void __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v4, 4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimestamp:", v6);

  objc_msgSend(v7, "setJobType:", objc_msgSend(*(id *)(a1 + 40), "jobType"));
}

void __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_47(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v4, 4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimestamp:", v6);

  objc_msgSend(v7, "setJobType:", objc_msgSend(*(id *)(a1 + 40), "jobType"));
}

void __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_48(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v4, 4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimestamp:", v6);

  objc_msgSend(v7, "setJobType:", objc_msgSend(*(id *)(a1 + 40), "jobType"));
}

@end
