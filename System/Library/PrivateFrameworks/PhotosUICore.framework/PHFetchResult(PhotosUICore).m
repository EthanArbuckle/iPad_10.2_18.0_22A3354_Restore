@implementation PHFetchResult(PhotosUICore)

- (uint64_t)px_sortOrder
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "px_sortByDatePropertySetClass");
  if (v1 == objc_opt_class())
    return 1;
  else
    return 2 * (v1 == objc_opt_class());
}

- (id)px_sortByDatePropertySetClass
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "fetchSortDescriptors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13A0], "propertiesToFetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
    goto LABEL_3;
  objc_msgSend(v2, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13E8], "propertiesToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
LABEL_3:
    v11 = (void *)objc_opt_class();
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (uint64_t)px_indexOfSortedAssetNearestToAsset:()PhotosUICore
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = objc_msgSend(a1, "px_sortByDatePropertySetClass");
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "fetchPropertySetsIfNeeded");
    objc_msgSend(v4, "curationProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addedDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "creationDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_8;
LABEL_7:
    v8 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__PHFetchResult_PhotosUICore__px_indexOfSortedAssetNearestToAsset___block_invoke;
    v18[3] = &unk_1E51407B0;
    v9 = v6;
    v19 = v9;
    objc_msgSend(a1, "px_fetchAssetSortDatesWithDateRangeEliminationBlock:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0x7FEFFFFFFFFFFFFFLL;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __67__PHFetchResult_PhotosUICore__px_indexOfSortedAssetNearestToAsset___block_invoke_2;
    v13[3] = &unk_1E51407D8;
    v6 = v9;
    v14 = v6;
    v15 = v17;
    v16 = &v20;
    objc_msgSend(v10, "enumerateFetchedItemsUsingBlock:", v13);

    _Block_object_dispose(v17, 8);
    goto LABEL_8;
  }
  v6 = 0;
LABEL_8:
  v11 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (PXAssetSortByDatesFetchResult)px_fetchAssetSortDatesWithDateRangeEliminationBlock:()PhotosUICore
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  PXAssetSortByDatesFetchResult *v23;
  NSObject *v24;
  void *v25;
  PXAssetSortByDatesFetchResult *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  objc_class *aClass;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  _BYTE *v54;
  _QWORD v55[4];
  id v56;
  _BYTE buf[24];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v45 = a1;
  v4 = objc_msgSend(a1, "px_sortByDatePropertySetClass");
  if (v4 == objc_opt_class())
  {
    v5 = &__block_literal_global_257599;
  }
  else
  {
    if (v4 != objc_opt_class())
    {
LABEL_23:
      v23 = 0;
      goto LABEL_30;
    }
    v5 = &__block_literal_global_132_257600;
  }
  v40 = v5;
  if (!v4)
    goto LABEL_23;
  aClass = (objc_class *)v4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v45, "count"));
  v42 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v41 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v8 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v9 = MEMORY[0x1E0C809B0];
    while (1)
    {
      v10 = (void *)MEMORY[0x1A85CE17C]();
      objc_msgSend(v7, "removeAllIndexes");
      if ((unint64_t)objc_msgSend(v6, "count") >= 3)
      {
        objc_msgSend(v7, "addIndex:", objc_msgSend(v6, "firstIndex"));
        objc_msgSend(v7, "addIndex:", objc_msgSend(v6, "lastIndex"));
        objc_msgSend(v6, "removeIndexes:", v7);
      }
      if ((unint64_t)objc_msgSend(v7, "count") <= 0x3E7)
      {
        do
        {
          if (!objc_msgSend(v6, "count"))
            break;
          v11 = objc_msgSend(v6, "count");
          if ((unint64_t)(objc_msgSend(v7, "count") + v11) > 0x3E7)
          {
            v55[0] = v9;
            v55[1] = 3221225472;
            v55[2] = __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_3;
            v55[3] = &unk_1E5140880;
            v56 = v7;
            objc_msgSend(v6, "enumerateRangesUsingBlock:", v55);

          }
          else
          {
            objc_msgSend(v7, "addIndexes:", v6);
          }
          objc_msgSend(v6, "removeIndexes:", v7);
        }
        while ((unint64_t)objc_msgSend(v7, "count") < 0x3E8);
      }
      PLUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "%@ batchedBinarySearch fetchItems:%@", buf, 0x16u);

      }
      objc_msgSend(v45, "fetchPropertiesForPropertySetClass:forObjectsAtIndexes:", aClass, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        break;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v58 = 0;
      v50[0] = v9;
      v50[1] = 3221225472;
      v50[2] = __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_137;
      v50[3] = &unk_1E51408A8;
      v16 = v43;
      v51 = v16;
      v53 = v40;
      v17 = v15;
      v52 = v17;
      v54 = buf;
      objc_msgSend(v7, "enumerateIndexesUsingBlock:", v50);
      objc_msgSend(v42, "addIndexes:", v7);

      _Block_object_dispose(buf, 8);
      v18 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v46[0] = v9;
      v46[1] = 3221225472;
      v46[2] = __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_2_140;
      v46[3] = &unk_1E51408D0;
      v47 = v16;
      v49 = v44;
      v19 = v18;
      v48 = v19;
      objc_msgSend(v6, "enumerateRangesUsingBlock:", v46);
      PLUIGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "%@ batchedBinarySearch eliminated ranges:%@", buf, 0x16u);

      }
      objc_msgSend(v6, "removeIndexes:", v19);
      objc_msgSend(v41, "addIndexes:", v19);

      objc_autoreleasePoolPop(v10);
      ++v8;
      if (!objc_msgSend(v6, "count"))
        goto LABEL_27;
    }
    PLUIGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromClass(aClass);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 2112;
      v58 = (uint64_t)v25;
      _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "%@ unable to fetch properties from %@ for propertySetClass %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }
LABEL_27:
  v26 = [PXAssetSortByDatesFetchResult alloc];
  objc_msgSend(v45, "fetchSortDescriptors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PXAssetSortByDatesFetchResult initWithSortDescriptor:fetchedIndexes:dateByIndex:](v26, "initWithSortDescriptor:fetchedIndexes:dateByIndex:", v28, v42, v43);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "timeIntervalSinceDate:", v38);
  v31 = v30;

  PLUIGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v41, "count");
    v36 = objc_msgSend(v43, "count");
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2048;
    v58 = v36;
    v59 = 2048;
    v60 = v8;
    v61 = 2048;
    v62 = v31;
    _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_DEBUG, "%@ batchedBinarySearch skippedItems:%lu fetchedItems:%lu fetchesDone:%ld duration:%.3fs", buf, 0x34u);

  }
LABEL_30:

  return v23;
}

- (id)px_fetchedObjectIDsSortedByLocalIdentifiers:()PhotosUICore
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "localIdentifier", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v4, "indexOfObject:", v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "keysSortedByValueUsingComparator:", &__block_literal_global_143_257598);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)px_fetchedObjectIDsSortedByUUIDs:()PhotosUICore
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "uuid", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v4, "indexOfObject:", v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "keysSortedByValueUsingComparator:", &__block_literal_global_144_257597);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)px_safelyPrefetchObjectAtIndex:()PhotosUICore
{
  unint64_t v5;
  id v6;

  v5 = objc_msgSend(a1, "count");
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", a3);
    objc_msgSend(a1, "prefetchObjectsAtIndexes:", v6);

  }
}

- (void)px_safelyPrefetchThumbnailAssetAtIndex:()PhotosUICore
{
  unint64_t v5;
  id v6;

  v5 = objc_msgSend(a1, "count");
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", a3);
    objc_msgSend(a1, "prefetchThumbnailAssetsAtIndexes:", v6);

  }
}

- (id)px_opaqueIdentifiers
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "fetchedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "oids");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "fetchedObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("px_opaqueIdentifier"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v7 = (void *)v5;
    v3 = v7;

  }
  return v3;
}

- (id)px_subfetchResultWithObjectsAtIndexes:()PhotosUICore objectClass:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  id v20;
  id v21;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __81__PHFetchResult_PhotosUICore__px_subfetchResultWithObjectsAtIndexes_objectClass___block_invoke;
  v19 = &unk_1E5140938;
  v20 = v6;
  v21 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v16);

  v11 = objc_alloc(MEMORY[0x1E0CD1620]);
  objc_msgSend(a1, "photoLibrary", v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a4, "fetchType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v9, v12, v13, 0, 0, 1);

  return v14;
}

@end
