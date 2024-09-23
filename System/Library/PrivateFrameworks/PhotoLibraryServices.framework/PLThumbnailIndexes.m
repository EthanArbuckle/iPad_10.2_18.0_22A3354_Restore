@implementation PLThumbnailIndexes

- (PLThumbnailIndexes)init
{
  PLThumbnailIndexes *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *isolationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLThumbnailIndexes;
  v2 = -[PLThumbnailIndexes init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.assetsd.thumbnailindexes", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unusedIndexes, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

+ (void)getAvailableThumbnailIndexesInLibrary:(id)a3 withCount:(unint64_t)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "thumbnailIndexes");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getAvailableThumbnailIndexesWithCount:inLibrary:handler:", a4, v8, v7);

}

+ (void)getAvailableThumbnailIndexInLibrary:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "thumbnailIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PLThumbnailIndexes_getAvailableThumbnailIndexInLibrary_withHandler___block_invoke;
  v9[3] = &unk_1E36667F8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getAvailableThumbnailIndexesWithCount:inLibrary:handler:", 1, v6, v9);

}

+ (unint64_t)nextAvailableThumbnailIndexInLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "thumbnailIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAvailableThumbnailIndexesWithCount:inLibrary:", 1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "firstIndex");
  return v6;
}

+ (void)recycleThumbnailIndexes:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "recycleThumbnailIndexes:inLibrary:timestamp:", v7, v6, mach_absolute_time());

}

+ (void)recycleThumbnailIndexes:(id)a3 inLibrary:(id)a4 timestamp:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a3;
  objc_msgSend(a4, "thumbnailIndexes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recycleThumbnailIndexes:timestamp:", v7, a5);

}

+ (id)occupiedThumbnailIndexesWithLibrary:(id)a3 fetchTimestampToUpdate:(unint64_t *)a4
{
  return (id)objc_msgSend(a1, "occupiedThumbnailIndexesWithLibrary:fetchTimestampToUpdate:outFetchCount:", a3, a4, 0);
}

+ (id)occupiedThumbnailIndexesWithLibrary:(id)a3 fetchTimestampToUpdate:(unint64_t *)a4 outFetchCount:(unint64_t *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  __CFString *v22;
  id v23;
  id v24;
  unint64_t *v25;
  unint64_t *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x19AEC1554]();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFetchRequest fetchRequestWithEntityName:](PLFetchRequest, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setResultType:", 2);
  v27[0] = CFSTR("thumbnailIndex");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPropertiesToFetch:", v12);

  objc_msgSend(v11, "setPl_importantFetchName:", CFSTR("fetchOccupiedThumbnailIndexes"));
  objc_msgSend(v7, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95__PLThumbnailIndexes_occupiedThumbnailIndexesWithLibrary_fetchTimestampToUpdate_outFetchCount___block_invoke;
  v19[3] = &unk_1E3666820;
  v20 = v13;
  v21 = v11;
  v25 = a4;
  v22 = CFSTR("thumbnailIndex");
  v14 = v8;
  v23 = v14;
  v15 = v7;
  v24 = v15;
  v26 = a5;
  v16 = v11;
  v17 = v13;
  objc_msgSend(v15, "performBlockAndWait:", v19);

  objc_autoreleasePoolPop(v9);
  return v14;
}

void __95__PLThumbnailIndexes_occupiedThumbnailIndexesWithLibrary_fetchTimestampToUpdate_outFetchCount___block_invoke(uint64_t a1)
{
  double Current;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  NSObject *log;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  PLThumbnailsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FetchAndBuildAvailableThumbnailIndexSet", ", buf, 2u);
  }
  log = v3;
  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v4, "count");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      v28 = v8;
      v12 = -v8;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        v14 = (void *)MEMORY[0x19AEC1554]();
        if (v12 == v11)
        {
          v15 = mach_absolute_time();
          v9 = v15;
          v16 = *(uint64_t **)(a1 + 72);
          if (v16)
            *v16 = v15;
        }
        objc_msgSend(v13, "objectForKey:", *(_QWORD *)(a1 + 48));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = objc_msgSend(v17, "integerValue");
          if (v19 < 0xFFFFFFFFFFFFFFFDLL && v19 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(*(id *)(a1 + 56), "addIndex:", v19);
        }

        objc_autoreleasePoolPop(v14);
        ++v11;
      }
      while (v7 != v11);
      v8 = v28 + v7;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  if (os_signpost_enabled(log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, log, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FetchAndBuildAvailableThumbnailIndexSet", ", buf, 2u);
  }
  v21 = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 64), "libraryServicesManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "wellKnownPhotoLibraryIdentifier");
  PLStringFromWellKnownPhotoLibraryIdentifier();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  PLThumbnailsGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v34 = v26;
    v35 = 2048;
    v36 = v9;
    v37 = 2048;
    v38 = v21 - Current;
    v39 = 2112;
    v40 = v23;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "All indexes (count = %lu), fetched at %llu, duration: %.4fs, library type: %@", buf, 0x2Au);
  }

  v25 = *(uint64_t **)(a1 + 80);
  if (v25)
    *v25 = v26;

}

uint64_t __70__PLThumbnailIndexes_getAvailableThumbnailIndexInLibrary_withHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    objc_msgSend(a2, "firstIndex");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getAvailableThumbnailIndexesWithCount:(unint64_t)a3 inLibrary:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  pl_dispatch_sync();
  v6 = v8;

  return v6;
}

- (void)getAvailableThumbnailIndexesWithCount:(unint64_t)a3 inLibrary:(id)a4 handler:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  pl_dispatch_async();

}

- (void)getAvailableThumbnailIndexesFromLibrary:(id)a3
{
  id v4;
  void *v5;
  NSMutableIndexSet *v6;
  int64_t v7;
  NSMutableIndexSet *v8;
  NSMutableIndexSet *unusedIndexes;
  int64_t v10;
  NSMutableIndexSet *v11;
  NSMutableIndexSet *v12;
  NSObject *v13;
  NSObject *v14;
  NSMutableIndexSet *v15;
  int64_t usedMax;
  int v17;
  NSMutableIndexSet *v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend((id)objc_opt_class(), "occupiedThumbnailIndexesWithLibrary:fetchTimestampToUpdate:", v4, &self->_fetchTimestamp);
  v6 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSMutableIndexSet lastIndex](v6, "lastIndex");
  self->_usedMax = v7;
  if ((v7 | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL)
  {
    v8 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    unusedIndexes = self->_unusedIndexes;
    self->_unusedIndexes = v8;

    v10 = 0;
  }
  else
  {
    v11 = (NSMutableIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, self->_usedMax);
    v12 = self->_unusedIndexes;
    self->_unusedIndexes = v11;

    -[NSMutableIndexSet removeIndexes:](self->_unusedIndexes, "removeIndexes:", v6);
    v10 = self->_usedMax + 1;
  }
  self->_usedMax = v10;
  PLThumbnailsGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Thumbnail indexes in use: %@", (uint8_t *)&v17, 0xCu);
  }

  PLThumbnailsGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = self->_unusedIndexes;
    usedMax = self->_usedMax;
    v17 = 138412546;
    v18 = v15;
    v19 = 2048;
    v20 = usedMax;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Available thumbnail indexes in use: %@ (used max = %ld)", (uint8_t *)&v17, 0x16u);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)recycleThumbnailIndexes:(id)a3 timestamp:(unint64_t)a4
{
  id v4;
  id v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
    pl_dispatch_async();

  }
}

void __65__PLThumbnailIndexes_Private__recycleThumbnailIndexes_timestamp___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLThumbnailsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[6];
    v6 = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Recycling thumbnail indexes %@ with timestamp %llu", (uint8_t *)&v6, 0x16u);
  }

  v5 = a1[5];
  if (a1[6] >= *(_QWORD *)(v5 + 32))
    objc_msgSend(*(id *)(v5 + 16), "addIndexes:", a1[4]);
}

void __87__PLThumbnailIndexes_Private__getAvailableThumbnailIndexesWithCount_inLibrary_handler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
    objc_msgSend(v2, "getAvailableThumbnailIndexesFromLibrary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 56))
  {
    v4 = 0;
    while (1)
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstIndex");
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v6 = v5;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeIndex:", v5);
      objc_msgSend(v3, "addIndex:", v6);
      ++v4;
      v7 = *(_QWORD *)(a1 + 56);
      if (v4 >= v7)
        goto LABEL_10;
    }
    v7 = *(_QWORD *)(a1 + 56);
LABEL_10:
    v8 = v7 - v4;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "addIndexesInRange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v8);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) += v8;
  PLThumbnailsGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Handing out thumbnail indexes %@", buf, 0xCu);
  }

  PLThumbnailsGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v11 + 16);
    v12 = *(_QWORD *)(v11 + 24);
    *(_DWORD *)buf = 138412546;
    v17 = v13;
    v18 = 2048;
    v19 = v12;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Available thumbnail indexes in use: %@ (used max = %ld)", buf, 0x16u);
  }

  v15 = *(id *)(a1 + 48);
  v14 = v3;
  pl_dispatch_async();

}

uint64_t __87__PLThumbnailIndexes_Private__getAvailableThumbnailIndexesWithCount_inLibrary_handler___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __79__PLThumbnailIndexes_Private__getAvailableThumbnailIndexesWithCount_inLibrary___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
    objc_msgSend(v2, "getAvailableThumbnailIndexesFromLibrary:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 56))
  {
    v3 = 0;
    while (1)
    {
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstIndex");
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v5 = v4;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeIndex:", v4);
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", v5);
      ++v3;
      v6 = *(_QWORD *)(a1 + 56);
      if (v3 >= v6)
        goto LABEL_10;
    }
    v6 = *(_QWORD *)(a1 + 56);
LABEL_10:
    v7 = v6 - v3;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "addIndexesInRange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v7);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) += v7;
  PLThumbnailsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 48);
    v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Handing out thumbnail indexes %@", (uint8_t *)&v14, 0xCu);
  }

  PLThumbnailsGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(v11 + 16);
    v12 = *(_QWORD *)(v11 + 24);
    v14 = 138412546;
    v15 = v13;
    v16 = 2048;
    v17 = v12;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Available thumbnail indexes in use: %@ (used max = %ld)", (uint8_t *)&v14, 0x16u);
  }

}

@end
