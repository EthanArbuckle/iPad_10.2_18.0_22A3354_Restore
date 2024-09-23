@implementation PLTableThumbnailMigrator

- (PLTableThumbnailMigrator)init
{
  PLTableThumbnailMigrator *v2;
  PLTableThumbnailMigrator *v3;
  uint64_t v4;
  NSMutableSet *pendingAssetObjectIDs;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLTableThumbnailMigrator;
  v2 = -[PLTableThumbnailMigrator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_pendingAssetObjectIDsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    pendingAssetObjectIDs = v3->_pendingAssetObjectIDs;
    v3->_pendingAssetObjectIDs = (NSMutableSet *)v4;

  }
  return v3;
}

- (id)_bulkMigratorQueue
{
  if (_bulkMigratorQueue_s_onceToken != -1)
    dispatch_once(&_bulkMigratorQueue_s_onceToken, &__block_literal_global_79324);
  return (id)_bulkMigratorQueue_s_bulkMigratorQueue;
}

- (void)_rebuildTablesForBatch:(id)a3 inLibrary:(id)a4 toFormats:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  size_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  PLTableThumbnailMigrator *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v22 = v9;
    os_unfair_lock_lock(&self->_pendingAssetObjectIDsLock);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v15), "asset");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            -[NSMutableSet addObject:](self->_pendingAssetObjectIDs, "addObject:", v17);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v13);
    }

    os_unfair_lock_unlock(&self->_pendingAssetObjectIDsLock);
    v18 = objc_msgSend(v11, "count");
    v19 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke;
    block[3] = &unk_1E3671D58;
    v20 = v11;
    v29 = v20;
    v30 = self;
    v31 = v10;
    v9 = v22;
    v21 = v22;
    v32 = v21;
    dispatch_apply(v18, 0, block);
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke_76;
    v25[3] = &unk_1E3677C18;
    v26 = v20;
    v27 = v21;
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke_2;
    v23[3] = &unk_1E3677C18;
    v23[4] = self;
    v24 = v26;
    objc_msgSend(v27, "performTransaction:completionHandler:withPriority:", v25, v23, 0);

  }
}

- (void)rebuildTableThumbForAsset:(id)a3 inLibrary:(id)a4 toTableFormats:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTableThumbnailMigrator.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTableThumbnailMigrator.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

LABEL_3:
  objc_msgSend(v10, "thumbnailManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v11)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTableThumbnailMigrator.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library.thumbnailManager"));

    if (v11)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTableThumbnailMigrator.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableFormats"));

LABEL_5:
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__79312;
  v33 = __Block_byref_object_dispose__79313;
  v34 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__PLTableThumbnailMigrator_rebuildTableThumbForAsset_inLibrary_toTableFormats___block_invoke;
  v25[3] = &unk_1E3676EC8;
  v28 = &v29;
  v25[4] = self;
  v13 = v9;
  v26 = v13;
  v14 = v10;
  v27 = v14;
  objc_msgSend(v14, "performBlockAndWait:", v25);
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_92_79314);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLThumbnailsGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)v30[5], "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v17;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Processing asset %@ for table thumb migration...", buf, 0xCu);

  }
  v35 = v30[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTableThumbnailMigrator _rebuildTablesForBatch:inLibrary:toFormats:](self, "_rebuildTablesForBatch:inLibrary:toFormats:", v18, v14, v15);

  PLThumbnailsGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)v30[5], "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v20;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Completed asset %@ for table thumb migration", buf, 0xCu);

  }
  _Block_object_dispose(&v29, 8);

}

- (void)migrateAllAssetsPendingTableThumbRebuildInLibrary:(id)a3 toTableFormats:(id)a4 limit:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  PLTableThumbnailMigrator *v20;
  id v21;
  unint64_t v22;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTableThumbnailMigrator.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v9, "thumbnailManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTableThumbnailMigrator.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library.thumbnailManager"));

    if (v10)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLTableThumbnailMigrator.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableFormats"));

    goto LABEL_5;
  }
  if (!v10)
    goto LABEL_7;
LABEL_5:
  -[PLTableThumbnailMigrator _bulkMigratorQueue](self, "_bulkMigratorQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PLTableThumbnailMigrator_migrateAllAssetsPendingTableThumbRebuildInLibrary_toTableFormats_limit___block_invoke;
  block[3] = &unk_1E3674F30;
  v19 = v10;
  v20 = self;
  v21 = v9;
  v22 = a5;
  v13 = v9;
  v17 = v10;
  dispatch_sync(v12, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAssetObjectIDs, 0);
}

void __99__PLTableThumbnailMigrator_migrateAllAssetsPendingTableThumbRebuildInLibrary_toTableFormats_limit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  double v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  double v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingComparator:", &__block_literal_global_93_79297);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  v5 = 0;
  if (*(_QWORD *)(a1 + 56))
    v6 = *(unint64_t *)(a1 + 56);
  else
    *(double *)&v6 = NAN;
  while (v5 <= v6)
  {
    v7 = (void *)MEMORY[0x19AEC1554](v2);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(*(id *)(a1 + 48), "libraryBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLTableThumbnailMigrator migrateAllAssetsPendingTableThumbRebuildInLibrary:toTableFormats:limit:]_block_invoke", v9);

    v11 = (void *)objc_opt_class();
    v27 = 0;
    objc_msgSend(v11, "_nextBatchOfItemsPendingTableRebuildInLibrary:excludingAssetIDs:sourceObjects:", v10, v8, &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;
    v14 = objc_msgSend(v12, "count");
    PLThumbnailsGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(double *)&v17 = COERCE_DOUBLE(objc_msgSend(v12, "count"));
        *(_DWORD *)buf = 134217984;
        v29 = *(double *)&v17;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Processing batch of %ld assets for table thumb migration...", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_rebuildTablesForBatch:inLibrary:toFormats:", v12, v10, v26);
      v5 += objc_msgSend(v12, "count");
      PLThumbnailsGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(double *)&v18 = COERCE_DOUBLE(objc_msgSend(v12, "count"));
      *(_DWORD *)buf = 134218496;
      v29 = *(double *)&v18;
      v30 = 2048;
      v31 = v5;
      v32 = 2048;
      v33 = v6;
      v19 = v15;
      v20 = "Processed batch of %ld assets for table thumb migration.  Total processed in session: %ld (limit: %ld).";
      v21 = 32;
      goto LABEL_12;
    }
    if (v16)
    {
      *(_WORD *)buf = 0;
      v19 = v15;
      v20 = "Done migrating table thumbs, no more assets remaining.";
      v21 = 2;
LABEL_12:
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
    }
LABEL_13:

    objc_autoreleasePoolPop(v7);
    if (!v14)
      break;
  }
  if (v5 > v6)
  {
    PLThumbnailsGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = *(double *)&v6;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Reached limit of %ld assets to process for table thumb migration.", buf, 0xCu);
    }

  }
  PLThumbnailsGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 134217984;
    v29 = v25 - v4;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Table thumb migration ended. (duration: %.3fs)", buf, 0xCu);

  }
}

uint64_t __99__PLTableThumbnailMigrator_migrateAllAssetsPendingTableThumbRebuildInLibrary_toTableFormats_limit___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __79__PLTableThumbnailMigrator_rebuildTableThumbForAsset_inLibrary_toTableFormats___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)objc_opt_class();
  v3 = a1[5];
  v4 = (void *)a1[6];
  objc_msgSend(v4, "thumbnailManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_workItemForAsset:library:thumbnailManager:", v3, v4, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __79__PLTableThumbnailMigrator_rebuildTableThumbForAsset_inLibrary_toTableFormats___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGImageSourceRef v7;
  CGImageSourceRef v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "masterThumbFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (v5 = (void *)MEMORY[0x1E0C99E98],
        objc_msgSend(v3, "masterThumbFilePath"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "fileURLWithPath:", v6),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v4)
    && (v7 = CGImageSourceCreateWithURL((CFURLRef)v4, 0)) != 0)
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    objc_msgSend(v3, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = objc_msgSend(v3, "destinationThumbnailIndex");
    objc_msgSend(*(id *)(a1 + 56), "thumbnailManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "_writeCompressedTableThumbsFromMasterThumb:uuid:formats:toIndex:thumbnailManager:", v8, v10, v11, v12, v13);

    objc_msgSend(v3, "setSucceeded:", v14);
    CFRelease(v8);
  }
  else
  {
    PLThumbnailsGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Unable to open image source for masterThumb for asset uuid: %{public}@", (uint8_t *)&v17, 0xCu);

    }
  }

}

void __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke_76(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "asset", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = objc_msgSend(v8, "succeeded");
          v11 = objc_msgSend(v8, "destinationThumbnailIndex");
          if ((v10 & 1) == 0)
          {
            objc_msgSend(v2, "addIndex:", v11);
            v11 = 0x7FFFFFFFFFFFFFFFLL;
          }
          objc_msgSend(v9, "setEffectiveThumbnailIndex:", v11);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
    +[PLThumbnailIndexes recycleThumbnailIndexes:inLibrary:](PLThumbnailIndexes, "recycleThumbnailIndexes:inLibrary:", v2, *(_QWORD *)(a1 + 40));

}

void __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "asset", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __46__PLTableThumbnailMigrator__bulkMigratorQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("-[PLTableThumbnailMigrator _bulkMigratorQueue]_block_invoke", attr);
  v2 = (void *)_bulkMigratorQueue_s_bulkMigratorQueue;
  _bulkMigratorQueue_s_bulkMigratorQueue = (uint64_t)v1;

}

+ (id)_predicateForAssetsPendingTableRebuild
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("thumbnailIndex"), 4294967294);
}

+ (id)_fetchRequstForAssetsPendingTableRebuildWithLimit:(int64_t)a3 excludingAssetIDs:(id)a4
{
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
  void *v17;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    objc_msgSend(v9, "setFetchLimit:", a3);
  objc_msgSend(a1, "_predicateForAssetsPendingTableRebuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  if (objc_msgSend(v6, "count"))
  {
    v11 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(v9, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT self IN %@"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v15);

  }
  objc_msgSend(v9, "setIncludesPropertyValues:", 1);
  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v17);

  return v9;
}

+ (BOOL)_writeCompressedTableThumbsFromMasterThumb:(CGImageSource *)a3 uuid:(id)a4 formats:(id)a5 toIndex:(unint64_t)a6 thumbnailManager:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  unsigned int v30;
  id v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t buf[4];
  _BYTE v43[18];
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a7;
  v41 = 0;
  +[PLTableThumbnailEncoder encodeThumbnailSource:toFormats:withUUID:error:](PLTableThumbnailEncoder, "encodeThumbnailSource:toFormats:withUUID:error:", a3, v12, v11, &v41);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v41;
  v35 = (void *)v14;
  if (v14)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = v12;
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (!v17)
    {
      v26 = 1;
      goto LABEL_25;
    }
    v18 = v17;
    v32 = v15;
    v33 = v12;
    v34 = v11;
    v19 = *(_QWORD *)v38;
LABEL_4:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v20);
      objc_msgSend(v13, "thumbManagerForFormatID:", objc_msgSend(v21, "formatID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isTable"))
      {
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __109__PLTableThumbnailMigrator__writeCompressedTableThumbsFromMasterThumb_uuid_formats_toIndex_thumbnailManager___block_invoke;
        v36[3] = &unk_1E3671CE0;
        v36[4] = v21;
        objc_msgSend(v35, "_pl_filter:", v36);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          PLThumbnailsGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            goto LABEL_22;
          v27 = objc_msgSend(v21, "formatID");
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v43 = v27;
          *(_WORD *)&v43[4] = 2114;
          v11 = v34;
          *(_QWORD *)&v43[6] = v34;
          _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Failed to find result for format: %hu, asset uuid: %{public}@", buf, 0x12u);
LABEL_23:
          v15 = v32;
          v12 = v33;

          goto LABEL_24;
        }
        -[NSObject entryDataForEntryLength:](v24, "entryDataForEntryLength:", objc_msgSend(v22, "entryLength"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "writeEntryData:toIndex:", v25, a6) & 1) == 0)
        {
          PLThumbnailsGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = objc_msgSend(v25, "length");
            v30 = objc_msgSend(v21, "formatID");
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)v43 = v29;
            *(_WORD *)&v43[8] = 2114;
            *(_QWORD *)&v43[10] = v34;
            v44 = 2048;
            v45 = v30;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Failed to write compressed thumbnail image of len: %ld, for asset uuid: %{public}@, to table format: %ld", buf, 0x20u);
          }

LABEL_22:
          v11 = v34;
          goto LABEL_23;
        }

      }
      if (v18 == ++v20)
      {
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        v26 = 1;
        if (v18)
          goto LABEL_4;
        v12 = v33;
        v11 = v34;
        v15 = v32;
        goto LABEL_25;
      }
    }
  }
  PLThumbnailsGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v43 = v11;
    *(_WORD *)&v43[8] = 2112;
    *(_QWORD *)&v43[10] = v15;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to generate compressed thumbnails for asset uuid: %{public}@, error:%@", buf, 0x16u);
  }
LABEL_24:
  v26 = 0;
LABEL_25:

  return v26;
}

+ (id)_workItemForAsset:(id)a3 library:(id)a4 thumbnailManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  PLThumbnailMigratorWorkItem *v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PLThumbnailMigratorWorkItem);
  objc_msgSend(v9, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLThumbnailMigratorWorkItem setUuid:](v10, "setUuid:", v11);

  v12 = +[PLThumbnailIndexes nextAvailableThumbnailIndexInLibrary:](PLThumbnailIndexes, "nextAvailableThumbnailIndexInLibrary:", v8);
  -[PLThumbnailMigratorWorkItem setDestinationThumbnailIndex:](v10, "setDestinationThumbnailIndex:", v12);
  objc_msgSend(v7, "thumbnailJPEGPathForPhoto:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLThumbnailMigratorWorkItem setMasterThumbFilePath:](v10, "setMasterThumbFilePath:", v13);
  -[PLThumbnailMigratorWorkItem setAsset:](v10, "setAsset:", v9);

  return v10;
}

+ (id)_nextBatchOfItemsPendingTableRebuildInLibrary:(id)a3 excludingAssetIDs:(id)a4 sourceObjects:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "thumbnailManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__79312;
  v33 = __Block_byref_object_dispose__79313;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__79312;
  v27 = __Block_byref_object_dispose__79313;
  v28 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke;
  v16[3] = &unk_1E3671D30;
  v11 = v8;
  v17 = v11;
  v22 = a1;
  v12 = v9;
  v18 = v12;
  v20 = &v23;
  v21 = &v29;
  v13 = v10;
  v19 = v13;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v16);
  if (a5)
    *a5 = objc_retainAutorelease((id)v24[5]);
  v14 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

+ (unint64_t)countOfAssetsPendingTableThumbRebuildInLibrary:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLTableThumbnailMigrator.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PLTableThumbnailMigrator_countOfAssetsPendingTableThumbRebuildInLibrary___block_invoke;
  v10[3] = &unk_1E3675800;
  v12 = &v14;
  v13 = a1;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

void __75__PLTableThumbnailMigrator_countOfAssetsPendingTableThumbRebuildInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "_fetchRequstForAssetsPendingTableRebuildWithLimit:excludingAssetIDs:", 500, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = objc_msgSend(v3, "countForFetchRequest:error:", v2, &v7);
  v5 = v7;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLThumbnailsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to determine count of assets pending table thumb rebuild: %@", buf, 0xCu);
    }

  }
}

void __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke_2;
  v7[3] = &unk_1E3671D30;
  v13 = *(_QWORD *)(a1 + 72);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v8 = v3;
  v11 = v4;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 64);
  v9 = v5;
  v12 = v6;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performBlockAndWait:", v7);

}

void __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 72), "_fetchRequstForAssetsPendingTableRebuildWithLimit:excludingAssetIDs:", 500, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v16);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v16;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke_3;
  v12[3] = &unk_1E3671D08;
  v15 = *(_QWORD *)(a1 + 72);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v8, "_pl_map:", v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "_workItemForAsset:library:thumbnailManager:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __109__PLTableThumbnailMigrator__writeCompressedTableThumbsFromMasterThumb_uuid_formats_toIndex_thumbnailManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "imageFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToFormat:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
