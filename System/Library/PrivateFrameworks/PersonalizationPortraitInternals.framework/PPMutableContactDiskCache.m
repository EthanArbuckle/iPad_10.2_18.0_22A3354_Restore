@implementation PPMutableContactDiskCache

- (BOOL)updateNameRecordCacheWithHistoryRecords:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  BOOL v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v7 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5136;
  v16 = __Block_byref_object_dispose__5137;
  v17 = 0;
  -[PPMutableContactDiskCache _recordSetBucketsForNameRecords:](self, "_recordSetBucketsForNameRecords:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PPMutableContactDiskCache_updateNameRecordCacheWithHistoryRecords_error___block_invoke;
  v11[3] = &unk_1E7E17120;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v18;
  v11[7] = a2;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (*((_BYTE *)v19 + 24))
  {
    v9 = 1;
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease((id)v13[5]);
    -[PPMutableContactDiskCache deleteNameRecordCache](self, "deleteNameRecordCache");
    v9 = *((_BYTE *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

- (BOOL)addNameRecords:(id)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  int64_t lastCreatedAt;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  SEL v41;
  id v42;
  id *v43;
  char v44;
  PPMutableContactDiskCache *v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  -[PPMutableContactDiskCache _recordSetBucketsForNameRecords:](self, "_recordSetBucketsForNameRecords:");
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v47)
  {
    v41 = a2;
    v43 = a4;
    v46 = *(_QWORD *)v61;
    v44 = 1;
    v45 = self;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v61 != v46)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("pb"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v9);
        if (objc_msgSend(v10, "length") != 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", v41, self, CFSTR("PPContactDiskCache.m"), 266, CFSTR("Unexpected filename: %@"), v10);

        }
        v11 = (void *)MEMORY[0x1C3BD6630]();
        -[NSString stringByAppendingPathComponent:](self->super._path, "stringByAppendingPathComponent:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v11);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

        if (v14)
        {
          v59 = 0;
          -[PPContactDiskCache _cacheObjectFromFilePath:error:](self, "_cacheObjectFromFilePath:error:", v12, &v59);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v59;
          v17 = v16;
          if (!v15)
          {
            pp_contacts_log_handle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v65 = v12;
              v66 = 2112;
              v67 = v17;
              _os_log_error_impl(&dword_1C392E000, v39, OS_LOG_TYPE_ERROR, "failed to load cache object at %@: %@", buf, 0x16u);
            }

            if (v43)
              *v43 = objc_retainAutorelease(v17);

            v44 = 0;
            goto LABEL_37;
          }
          v52 = v16;
        }
        else
        {
          v18 = (void *)objc_opt_new();
          objc_msgSend(v18, "timeIntervalSinceReferenceDate");
          -[PPMutableContactDiskCache _createNewCacheObjectWithCreatedAt:](self, "_createNewCacheObjectWithCreatedAt:", (uint64_t)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = 0;
        }
        lastCreatedAt = self->super._lastCreatedAt;
        v21 = objc_msgSend(v15, "createdAt");
        v50 = v7;
        v51 = v10;
        v53 = v12;
        if (lastCreatedAt && v21 >= self->super._lastCreatedAt)
          v21 = self->super._lastCreatedAt;
        self->super._lastCreatedAt = v21;
        objc_msgSend(obj, "objectForKeyedSubscript:", v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v49 = v22;
        objc_msgSend(v22, "adds");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v56 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
              pp_private_log_handle();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v28, "sourceIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "firstName");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "lastName");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v65 = v32;
                v66 = 2112;
                v67 = v33;
                v68 = 2112;
                v69 = v34;
                v70 = 2112;
                v71 = v53;
                _os_log_debug_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEBUG, "addNameRecord: %@ %@ %@ path: %@", buf, 0x2Au);

              }
              objc_msgSend(v15, "records");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "pbRecord");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v31);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
          }
          while (v25);
        }

        v54 = 0;
        self = v45;
        v35 = -[PPMutableContactDiskCache _writeCache:path:error:](v45, "_writeCache:path:error:", v15, v53, &v54);
        v36 = v54;
        v37 = v36;
        if (!v35)
        {
          if (v43)
            *v43 = objc_retainAutorelease(v36);
          -[PPMutableContactDiskCache deleteNameRecordCache](v45, "deleteNameRecordCache");
          v44 = 0;
        }

        v7 = v50 + 1;
      }
      while (v50 + 1 != v47);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
      if (v47)
        continue;
      break;
    }
  }
  else
  {
    v44 = 1;
  }
LABEL_37:

  return v44 & 1;
}

- (BOOL)deleteNameRecordCache
{
  unint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  PPMutableContactDiskCache *v17;
  NSString *v18;
  unint64_t v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  NSString *path;
  NSObject *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  NSString *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", self->super._path);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumeratorAtPath:", self->super._path);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v8 = v7;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v32;
        v29 = v8;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v13, "pathExtension", v29);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("pb"));

            if (v15)
            {
              v16 = (void *)MEMORY[0x1C3BD6630]();
              v17 = self;
              -[NSString stringByAppendingPathComponent:](self->super._path, "stringByAppendingPathComponent:", v13);
              v18 = (NSString *)objc_claimAutoreleasedReturnValue();
              objc_autoreleasePoolPop(v16);
              v19 = v3;
              objc_msgSend(*(id *)(v3 + 1568), "defaultManager");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = 0;
              v21 = objc_msgSend(v20, "removeItemAtPath:error:", v18, &v30);
              v22 = v30;

              if ((v21 & 1) == 0)
              {
                pp_contacts_log_handle();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v36 = v18;
                  v37 = 2112;
                  v38 = v22;
                  _os_log_error_impl(&dword_1C392E000, v26, OS_LOG_TYPE_ERROR, "failed to delete name record cache file at: %@ error: %@", buf, 0x16u);
                }

                v8 = v29;
                goto LABEL_24;
              }

              v3 = v19;
              self = v17;
              v8 = v29;
            }
          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v10)
            continue;
          break;
        }
      }

      pp_contacts_log_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEFAULT, "contact name record cache deleted.", buf, 2u);
      }

      v24 = 1;
    }
    else
    {
      pp_contacts_log_handle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        path = self->super._path;
        *(_DWORD *)buf = 138412290;
        v36 = path;
        _os_log_error_impl(&dword_1C392E000, v25, OS_LOG_TYPE_ERROR, "PPContactDiskCache: failed to create enumerator for %@", buf, 0xCu);
      }

      v8 = 0;
LABEL_24:
      v24 = 0;
    }
  }
  else
  {
    pp_contacts_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    v24 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_INFO, "went to delete name record cache but file was missing", buf, 2u);
    }
  }

  return v24;
}

- (BOOL)_writeCache:(id)a3 path:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v8, "writeToFile:options:error:", v7, 1073741825, &v13);
  v10 = v13;

  if ((v9 & 1) == 0)
  {
    pp_contacts_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v10;
      _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "failed to write name record cache at: %@ error: %@", buf, 0x16u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }

  return v9;
}

- (id)_createNewCacheObjectWithCreatedAt:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCreatedAt:", a3);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "setRecords:", v5);

  return v4;
}

- (int64_t)lastCreatedAt
{
  return self->super._lastCreatedAt;
}

- (void)setLastCreatedAt:(int64_t)a3
{
  self->super._lastCreatedAt = a3;
}

- (BOOL)deleteCacheIfTooOld
{
  void *v3;
  int64_t lastCreatedAt;
  double v5;
  NSObject *v6;
  BOOL v7;
  uint8_t v9[16];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -1209600.0);
  lastCreatedAt = self->super._lastCreatedAt;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  if (lastCreatedAt >= (uint64_t)v5)
    goto LABEL_6;
  pp_contacts_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPContactDiskCache: deleting cache since it is too old.", v9, 2u);
  }

  if (-[PPMutableContactDiskCache deleteNameRecordCache](self, "deleteNameRecordCache"))
  {
    self->super._lastCreatedAt = 0;
    v7 = 1;
  }
  else
  {
LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)_recordSetBucketsForNameRecords:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PPMutableContactDiskCache__recordSetBucketsForNameRecords___block_invoke;
  v7[3] = &unk_1E7E17148;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __61__PPMutableContactDiskCache__recordSetBucketsForNameRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PPContactDiskCacheHistoryRecordSet *v7;
  id v8;
  PPContactDiskCacheHistoryRecordSet *v9;
  uint64_t v10;
  NSMutableArray *adds;
  uint64_t v12;
  NSMutableArray *updates;
  uint64_t v14;
  NSMutableArray *deletes;
  NSObject *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringToIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [PPContactDiskCacheHistoryRecordSet alloc];
    v8 = v5;
    if (v7)
    {
      v19.receiver = v7;
      v19.super_class = (Class)PPContactDiskCacheHistoryRecordSet;
      v9 = (PPContactDiskCacheHistoryRecordSet *)objc_msgSendSuper2(&v19, sel_init);
      v7 = v9;
      if (v9)
      {
        objc_storeStrong((id *)&v9->_filename, v5);
        v10 = objc_opt_new();
        adds = v7->_adds;
        v7->_adds = (NSMutableArray *)v10;

        v12 = objc_opt_new();
        updates = v7->_updates;
        v7->_updates = (NSMutableArray *)v12;

        v14 = objc_opt_new();
        deletes = v7->_deletes;
        v7->_deletes = (NSMutableArray *)v14;

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
  }
  switch(objc_msgSend(v3, "changeType"))
  {
    case 0u:
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
      objc_msgSend(v3, "sourceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19.receiver) = 138412290;
      *(id *)((char *)&v19.receiver + 4) = v17;
      _os_log_fault_impl(&dword_1C392E000, v16, OS_LOG_TYPE_FAULT, "PPContactNameRecordChangeTypeNone found when trying to update disk cache for identifier %@", (uint8_t *)&v19, 0xCu);
      goto LABEL_13;
    case 1u:
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject adds](v16, "adds");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2u:
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject updates](v16, "updates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3u:
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject deletes](v16, "deletes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v17 = v18;
      objc_msgSend(v18, "addObject:", v3);
LABEL_13:

LABEL_14:
      break;
    default:
      break;
  }

}

void __75__PPMutableContactDiskCache_updateNameRecordCacheWithHistoryRecords_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  char v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id obj;
  _BYTE v106[128];
  uint8_t v107[128];
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  void *v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD6630]();
  v81 = v5;
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("pb"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);
  if (objc_msgSend(v8, "length") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("PPContactDiskCache.m"), 203, CFSTR("Unexpected filename: %@"), v8);

  }
  v9 = (void *)MEMORY[0x1C3BD6630]();
  v80 = v8;
  objc_msgSend(*(id *)(a1[4] + 16), "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

  v82 = a1;
  v83 = v6;
  v85 = v10;
  if (v12)
  {
    v13 = *(_QWORD *)(a1[5] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    v15 = (void *)a1[4];
    v16 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v16 + 40);
    objc_msgSend(v15, "_cacheObjectFromFilePath:error:", v10, &obj);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v16 + 40), obj);
    if (!v17)
      goto LABEL_45;
    v18 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v6, "updates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    objc_msgSend(v6, "deletes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v18, "initWithCapacity:", objc_msgSend(v21, "count") + v20);

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    objc_msgSend(v6, "updates");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v102 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "sourceIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
      }
      while (v25);
    }

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    objc_msgSend(v6, "deletes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v97, v116, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v98;
      v84 = v29;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v98 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v33);
          pp_private_log_handle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v34, "sourceIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "firstName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "lastName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v109 = v37;
            v110 = 2112;
            v111 = v38;
            v112 = 2112;
            v113 = v39;
            v114 = 2112;
            v115 = v85;
            _os_log_debug_impl(&dword_1C392E000, v35, OS_LOG_TYPE_DEBUG, "updateNameRecordCacheWithHistoryRecords: delete: %@ %@ %@ path: %@", buf, 0x2Au);

            v29 = v84;
          }

          objc_msgSend(v34, "sourceIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v36);

          ++v33;
        }
        while (v31 != v33);
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v97, v116, 16);
      }
      while (v31);
    }

    objc_msgSend(v17, "records");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = __75__PPMutableContactDiskCache_updateNameRecordCacheWithHistoryRecords_error___block_invoke_57;
    v95[3] = &unk_1E7E170F8;
    v96 = v22;
    v41 = v22;
    objc_msgSend(v40, "_pas_filteredArrayWithTest:", v95);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "mutableCopy");
    objc_msgSend(v17, "setRecords:", v43);

    a1 = v82;
    v6 = v83;
  }
  else
  {
    v44 = (void *)a1[4];
    v45 = (void *)objc_opt_new();
    objc_msgSend(v45, "timeIntervalSinceReferenceDate");
    objc_msgSend(v44, "_createNewCacheObjectWithCreatedAt:", (uint64_t)v46);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v47 = *(_QWORD *)(a1[4] + 8);
  v48 = objc_msgSend(v17, "createdAt");
  v49 = a1[4];
  if (v47 && v48 >= *(_QWORD *)(v49 + 8))
    v48 = *(_QWORD *)(v49 + 8);
  *(_QWORD *)(v49 + 8) = v48;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  objc_msgSend(v6, "adds");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v92;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v92 != v53)
          objc_enumerationMutation(v50);
        v55 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v54);
        pp_private_log_handle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v55, "sourceIdentifier");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "firstName");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "lastName");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v109 = v59;
          v110 = 2112;
          v111 = v60;
          v112 = 2112;
          v113 = v61;
          v114 = 2112;
          v115 = v85;
          _os_log_debug_impl(&dword_1C392E000, v56, OS_LOG_TYPE_DEBUG, "updateNameRecordCacheWithHistoryRecords: add: %@ %@ %@ path: %@", buf, 0x2Au);

        }
        objc_msgSend(v17, "records");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "pbRecord");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObject:", v58);

        ++v54;
      }
      while (v52 != v54);
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
    }
    while (v52);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v83, "updates");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v88;
    do
    {
      v66 = 0;
      do
      {
        if (*(_QWORD *)v88 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v66);
        pp_private_log_handle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v67, "sourceIdentifier");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "firstName");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "lastName");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v109 = v71;
          v110 = 2112;
          v111 = v72;
          v112 = 2112;
          v113 = v73;
          v114 = 2112;
          v115 = v85;
          _os_log_debug_impl(&dword_1C392E000, v68, OS_LOG_TYPE_DEBUG, "updateNameRecordCacheWithHistoryRecords: update: %@ %@ %@ path: %@", buf, 0x2Au);

        }
        objc_msgSend(v17, "records");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "pbRecord");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v70);

        ++v66;
      }
      while (v64 != v66);
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
    }
    while (v64);
  }

  v74 = *(_QWORD *)(v82[5] + 8);
  v75 = *(void **)(v74 + 40);
  *(_QWORD *)(v74 + 40) = 0;

  v76 = (void *)v82[4];
  v77 = *(_QWORD *)(v82[5] + 8);
  v86 = *(id *)(v77 + 40);
  v10 = v85;
  v78 = objc_msgSend(v76, "_writeCache:path:error:", v17, v85, &v86);
  objc_storeStrong((id *)(v77 + 40), v86);
  *(_BYTE *)(*(_QWORD *)(v82[6] + 8) + 24) = v78;

  v6 = v83;
LABEL_45:

}

uint64_t __75__PPMutableContactDiskCache_updateNameRecordCacheWithHistoryRecords_error___block_invoke_57(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

@end
