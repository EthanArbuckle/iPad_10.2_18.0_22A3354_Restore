@implementation WBSHistoryServiceDatabase

uint64_t __59__WBSHistoryServiceDatabase__fetchEventsForListener_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __51__WBSHistoryServiceDatabase__metadataForKey_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9
{
  -[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:](self->_urlCompletion, "computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:", a3, a4, a5, a6, a7, a9, a8);
}

- (void)fetchDatabaseURL:(id)a3
{
  (*((void (**)(id, NSURL *, _QWORD))a3 + 2))(a3, self->_databaseURL, 0);
}

uint64_t __77__WBSHistoryServiceDatabase_initWithID_url_options_fileOperationGroup_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_prepareDatabase:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

- (id)_fetchVisitsWithOptions:(unint64_t)a3 predicate:(id)a4 writeDescriptor:(int)a5
{
  char v6;
  id v8;
  WBSSQLiteDatabase *database;
  WBSSQLiteStatementCache *statements;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  sqlite3_stmt *v16;
  int v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  sqlite3_stmt *v23;
  _QWORD *v24;
  unsigned int v25;
  int k;
  int i;
  int v28;
  NSObject *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *j;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  WBSSQLiteDatabase *v36;
  void *v37;
  NSObject *v38;
  WBSSQLiteDatabase *v39;
  void *v40;
  NSObject *v41;
  WBSSQLiteDatabase *v42;
  void *v43;
  NSObject *v44;
  WBSSQLiteDatabase *v45;
  void *v46;
  NSObject *v47;
  WBSSQLiteDatabase *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v54;
  id v55;
  id v56;
  WBSHistoryServiceDatabase *v57;
  void *v58;
  uint8_t buf;
  _BYTE v60[15];
  __int128 v61;
  __int128 v62;
  int v63;
  __int128 v64;
  __int128 v65;
  int v66;
  uint8_t v67;
  _BYTE v68[7];
  void *v69[3];
  __int128 v70;
  __int128 v71;
  int v72;
  _OWORD v73[2];
  int v74;
  _OWORD v75[2];
  int v76;
  _HistoryStreamedVisit v77;
  _HistoryStreamedItem v78;
  id v79;
  unint64_t v80[4];
  __int128 v81;
  __int128 v82;
  int v83;
  uint64_t v84;

  v6 = a3;
  v84 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  database = self->_database;
  v56 = v8;
  v57 = self;
  statements = self->_statements;
  v79 = 0;
  objc_msgSend(v8, "statementForDatabase:cache:fetchOptions:error:", database, statements, v6 & 0x2B, &v79);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v79;
  v13 = v12;
  v58 = v11;
  if (v11)
  {
    v55 = v12;
    v78.var0.var0 = 1;
    v77.var0.var0 = 2;
    memset(v75, 0, sizeof(v75));
    v76 = 1065353216;
    memset(v73, 0, sizeof(v73));
    v74 = 1065353216;
    v72 = 1065353216;
    v70 = 0u;
    v71 = 0u;
    v14 = SafariShared::LatestVisitInformationMap::size((SafariShared::LatestVisitInformationMap *)&v57->_latestVisitMap);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v75, vcvtps_u32_f32((float)v14 / 1.0));
    v15 = SafariShared::LatestVisitInformationMap::size((SafariShared::LatestVisitInformationMap *)&v57->_latestVisitMap);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v73, vcvtps_u32_f32((float)v15 / 1.0));
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v69, a5);
    v16 = (sqlite3_stmt *)objc_msgSend(v11, "handle");
    if ((v6 & 1) != 0)
      v17 = 10;
    else
      v17 = 0;
    if (objc_msgSend(v56, "conformsToProtocol:", &unk_1EE73D3B8))
      v18 = v56;
    else
      v18 = 0;
    while (sqlite3_step(v16) == 100)
    {
      if ((v6 & 1) != 0)
      {
        v78.var1 = sqlite3_column_int64(v16, 0);
        v78.var6 = (char *)sqlite3_column_text(v16, 1);
        v78.var2 = sqlite3_column_int64(v16, 3);
        v78.var7 = (int *)sqlite3_column_blob(v16, 4);
        v78.var8 = sqlite3_column_bytes(v16, 4);
        v78.var9 = (int *)sqlite3_column_blob(v16, 5);
        v78.var10 = sqlite3_column_bytes(v16, 5);
        v78.var4 = sqlite3_column_int64(v16, 7);
        v78.var3 = sqlite3_column_int64(v16, 8);
        v78.var5 = sqlite3_column_int64(v16, 9);
        if (!v78.var6)
        {
          v20 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.14(&v67, v68, v20);
        }
        if (!SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)v69, &v78))
        {
          v21 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.13();
          break;
        }
      }
      initializeStreamedHistoryVisitFromSQLiteRow(v16, &v77, v17);
      if (!v18 || objc_msgSend(v18, "evaluateHistoryStreamedVisit:", &v77))
      {
        if (!SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)v69, &v77))
          break;
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v75, (unint64_t *)&v78.var1, &v78.var1);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v73, (unint64_t *)&v77.var1, &v77.var1);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__erase_unique<long long>(&v70, (unint64_t *)&v77.var1);
        if ((v6 & 0x10) != 0)
        {
          if (v77.var8
            && !std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v73, (unint64_t *)&v77.var8))
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v70, (unint64_t *)&v77.var8, &v77.var8);
          }
          if (v77.var9)
          {
            if (!std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v73, (unint64_t *)&v77.var9))std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v70, (unint64_t *)&v77.var9, &v77.var9);
          }
        }
      }
    }
    objc_msgSend(v11, "reset");
    if ((v6 & 0x10) != 0)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", v57->_database, CFSTR("SELECT * FROM history_visits WHERE id IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"));

      if (!v22)
      {
        v54 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorWithMethodName:](v57->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]");
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.1();
        }

        v58 = 0;
        -[WBSSQLiteDatabase lastErrorWithMethodName:](v57->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:]");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_105;
      }
      v58 = v22;
      v23 = (sqlite3_stmt *)objc_msgSend(v22, "handle");
      v81 = 0u;
      v82 = 0u;
      v83 = 1065353216;
      v64 = 0u;
      v65 = 0u;
      v66 = 1065353216;
      v61 = 0u;
      v62 = 0u;
      v63 = 1065353216;
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)&v61, 0x18uLL);
      if (*((_QWORD *)&v71 + 1))
      {
        while (1)
        {
          std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(&v61);
          v24 = (_QWORD *)v71;
          if (!(_QWORD)v71)
            break;
          v25 = 0;
          do
          {
            sqlite3_bind_int64(v23, v25 + 1, v24[2]);
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v61, v24 + 2, v24 + 2);
            if (++v25 > 0x17)
              break;
            v24 = (_QWORD *)*v24;
          }
          while (v24);
          if (v25 < 0x18)
          {
            k = v25 + 1;
            goto LABEL_37;
          }
LABEL_38:
          for (i = 0; ; ++i)
          {
            v28 = sqlite3_step(v23);
            if (v28 != 100)
              break;
            v77.var2 = sqlite3_column_int64(v23, 1);
            v77.var1 = sqlite3_column_int64(v23, 0);
            v77.var3 = sqlite3_column_double(v23, 2);
            v77.var13 = (char *)sqlite3_column_text(v23, 3);
            v77.var4 = sqlite3_column_int64(v23, 4);
            v77.var5 = sqlite3_column_int64(v23, 5);
            v77.var6 = sqlite3_column_int64(v23, 6);
            v77.var8 = sqlite3_column_int64(v23, 7);
            v77.var9 = sqlite3_column_int64(v23, 8);
            v77.var10 = sqlite3_column_int64(v23, 9);
            v77.var11 = sqlite3_column_int64(v23, 10);
            v77.var12 = sqlite3_column_int64(v23, 11);
            v77.var7 = sqlite3_column_int64(v23, 12);
            if (!SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)v69, &v77))
            {
              v29 = WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.12(&buf, v60, v29);
              i = 1;
              break;
            }
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v73, (unint64_t *)&v77.var1, &v77.var1);
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__erase_unique<long long>(&v70, (unint64_t *)&v77.var1);
            if (v77.var8
              && !std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v73, (unint64_t *)&v77.var8))
            {
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v70, (unint64_t *)&v77.var8, &v77.var8);
            }
            if (v77.var9
              && !std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v73, (unint64_t *)&v77.var9))
            {
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v70, (unint64_t *)&v77.var9, &v77.var9);
            }
            if (!std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v75, (unint64_t *)&v77.var2))std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v81, (unint64_t *)&v77.var2, &v77.var2);
          }
          sqlite3_reset(v23);
          if (!i)
          {
            v30 = (_QWORD *)v62;
            if ((_QWORD)v62)
            {
              do
              {
                std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v64, v30 + 2, v30 + 2);
                v30 = (_QWORD *)*v30;
              }
              while (v30);
              v31 = (_QWORD *)v62;
              if ((_QWORD)v62)
              {
                do
                {
                  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v73, v31 + 2, v31 + 2);
                  v31 = (_QWORD *)*v31;
                }
                while (v31);
                for (j = (_QWORD *)v62; j; j = (_QWORD *)*j)
                {
                  v80[0] = j[2];
                  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__erase_unique<long long>(&v70, v80);
                }
              }
            }
          }
          if (!*((_QWORD *)&v71 + 1) || v28 == 100)
            goto LABEL_62;
        }
        for (k = 1; k != 25; ++k)
LABEL_37:
          sqlite3_bind_int64(v23, k, -1);
        goto LABEL_38;
      }
LABEL_62:
      objc_msgSend(v58, "reset");
      if (*((_QWORD *)&v82 + 1) | *((_QWORD *)&v65 + 1))
      {
        v33 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.11();
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v57->_database, 0, CFSTR("PRAGMA foreign_keys = OFF")) != 101)
        {
          v34 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](v57->_database, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.10();
          }

        }
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v57->_database, 0, CFSTR("BEGIN TRANSACTION")) != 101)
        {
          v35 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](v57->_database, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.9();
          }

        }
        if (*((_QWORD *)&v82 + 1))
        {
          v36 = v57->_database;
          createQueryWithList(CFSTR("UPDATE history_visits SET redirect_source = NULL WHERE redirect_source IN (SELECT id FROM history_visits WHERE history_item IN ("), (uint64_t)&v81, CFSTR("))"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v36) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v36, 0, v37);

          if ((_DWORD)v36 != 101)
          {
            v38 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              -[WBSSQLiteDatabase lastErrorMessage](v57->_database, "lastErrorMessage");
              objc_claimAutoreleasedReturnValue();
              -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.6();
            }

          }
          v39 = v57->_database;
          createQueryWithList(CFSTR("UPDATE history_visits SET redirect_destination = NULL WHERE redirect_destination IN (SELECT id FROM history_visits WHERE history_item IN ("), (uint64_t)&v81, CFSTR("))"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v39) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v39, 0, v40);

          if ((_DWORD)v39 != 101)
          {
            v41 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              -[WBSSQLiteDatabase lastErrorMessage](v57->_database, "lastErrorMessage");
              objc_claimAutoreleasedReturnValue();
              -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.6();
            }

          }
          v42 = v57->_database;
          createQueryWithList(CFSTR("DELETE FROM history_visits WHERE history_item IN ("), (uint64_t)&v81, CFSTR(")"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v42, 0, v43);

          if ((_DWORD)v42 != 101)
          {
            v44 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              -[WBSSQLiteDatabase lastErrorMessage](v57->_database, "lastErrorMessage");
              objc_claimAutoreleasedReturnValue();
              -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.6();
            }

          }
        }
        if (*((_QWORD *)&v65 + 1))
        {
          v45 = v57->_database;
          createQueryWithList(CFSTR("UPDATE history_visits SET redirect_source = NULL WHERE redirect_source IN ("), (uint64_t)&v64, CFSTR(")"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v45) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v45, 0, v46);

          if ((_DWORD)v45 != 101)
          {
            v47 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              -[WBSSQLiteDatabase lastErrorMessage](v57->_database, "lastErrorMessage");
              objc_claimAutoreleasedReturnValue();
              -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.5();
            }

          }
          v48 = v57->_database;
          createQueryWithList(CFSTR("UPDATE history_visits SET redirect_destination = NULL WHERE redirect_destination IN ("), (uint64_t)&v64, CFSTR(")"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v48) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v48, 0, v49);

          if ((_DWORD)v48 != 101)
          {
            v50 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              -[WBSSQLiteDatabase lastErrorMessage](v57->_database, "lastErrorMessage");
              objc_claimAutoreleasedReturnValue();
              -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.4();
            }

          }
        }
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v57->_database, 0, CFSTR("COMMIT TRANSACTION")) != 101)
        {
          v51 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](v57->_database, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.3();
          }

        }
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v57->_database, 0, CFSTR("PRAGMA foreign_keys = ON")) != 101)
        {
          v52 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](v57->_database, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _fetchVisitsWithOptions:predicate:writeDescriptor:].cold.2();
          }

        }
      }
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v61);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v64);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v81);
    }
    v19 = 0;
LABEL_105:

    SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v69);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v70);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v73);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v75);

    v13 = v55;
    goto LABEL_106;
  }
  v19 = v12;
LABEL_106:

  return v19;
}

- (id)_updateListenerRegistration:(id)a3 lastSeen:(double)a4
{
  WBSSQLiteStatementCache *statements;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  double v14;
  id v15;

  v15 = a3;
  v14 = a4;
  statements = self->_statements;
  v13 = 0;
  -[WBSSQLiteStatementCache statementForQuery:error:](statements, "statementForQuery:error:", CFSTR("INSERT OR REPLACE INTO history_event_listeners (listener_name, last_seen) VALUES (?, ?)"), &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (!v7)
  {
    v11 = v8;
LABEL_6:
    v10 = v11;
    goto LABEL_7;
  }
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong}&,double &>(v7, &v15, &v14);
  if (objc_msgSend(v7, "execute") != 101)
  {
    objc_msgSend(v7, "reset");
    -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _updateListenerRegistration:lastSeen:]");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v7, "reset");
  -[NSMutableSet addObject:](self->_registeredListeners, "addObject:", v15);
  v10 = 0;
LABEL_7:

  return v10;
}

void __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3_stmt *v14;
  NSObject *v15;
  void *v16[3];
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  int v22;
  const unsigned __int8 *v23;
  sqlite3_int64 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  v20 = 0;
  v21 = 0;
  SafariShared::HistoryObjectStreamWriter::createPipeHandles(&v21, &v20);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v21;
  v4 = v20;
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(id *)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginActivityWithOptions:reason:", 0x80000000000, CFSTR("-[WBSHistoryServiceDatabase fetchDomainExpansions:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x1A859A374]();
    v6 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke_2;
    v17[3] = &unk_1E4B2B448;
    v9 = v4;
    v18 = v9;
    v2 = v8;
    v19 = v2;
    objc_msgSend(v6, "setHandler:", v17);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    objc_msgSend(v3, "closeFile");
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("SELECT history_items.domain_expansion, COUNT(*) AS count FROM history_items WHERE domain_expansion IS NOT NULL GROUP BY domain_expansion"));
    v13 = v12;
    if (v12)
    {
      v14 = (sqlite3_stmt *)objc_msgSend(v12, "handle");
      v22 = 3;
      SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v16, objc_msgSend(v9, "fileDescriptor"));
      do
      {
        if (sqlite3_step(v14) != 100)
          break;
        v23 = sqlite3_column_text(v14, 0);
        v24 = sqlite3_column_int64(v14, 1);
      }
      while (SafariShared::HistoryObjectStreamWriter::write((uint64_t *)v16, (uint64_t)&v22));
      SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v16);
    }
    else
    {
      v15 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase fetchDomainExpansions:]_block_invoke");
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke_cold_1();
      }

    }
  }

}

void __74__WBSHistoryServiceDatabase_fetchWithOptions_predicate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  WBSScopeTimeoutHandler *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  WBSScopeTimeoutHandler *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  objc_msgSend(*(id *)(a1 + 32), "_ensureLatestVisitsAreComputed");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v29 = (id)v2;
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  else
  {
    v33 = 0;
    v34 = 0;
    SafariShared::HistoryObjectStreamWriter::createPipeHandles(&v34, &v33);
    v5 = (WBSScopeTimeoutHandler *)objc_claimAutoreleasedReturnValue();
    v6 = v34;
    v7 = v33;
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

    }
    else if ((*(_BYTE *)(a1 + 56) & 0xE3) != 0)
    {
      v10 = [WBSScopeTimeoutHandler alloc];
      objc_msgSend(*(id *)(a1 + 40), "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[WBSScopeTimeoutHandler initWithTimeout:autoBugCaptureDomain:detectedProcess:context:](v10, "initWithTimeout:autoBugCaptureDomain:detectedProcess:context:", CFSTR("SafariShared"), CFSTR("com.apple.Safari.History"), v11, 10.0);

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "beginActivityWithOptions:reason:", 0x80000000000, CFSTR("-[WBSHistoryServiceDatabase fetchWithOptions:predicate:completionHandler:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      MEMORY[0x1A859A374]();
      v14 = objc_alloc_init(MEMORY[0x1E0D89D00]);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __74__WBSHistoryServiceDatabase_fetchWithOptions_predicate_completionHandler___block_invoke_2;
      v30[3] = &unk_1E4B2B448;
      v15 = v7;
      v31 = v15;
      v16 = v13;
      v32 = v16;
      objc_msgSend(v14, "setHandler:", v30);
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v18 = SafariShared::LatestVisitInformationMap::size((SafariShared::LatestVisitInformationMap *)(*(_QWORD *)(a1 + 32) + 88));
      (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v17 + 16))(v17, v18, v6, 0);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = 0;

      objc_msgSend(v6, "closeFile");
      v21 = *(_QWORD *)(a1 + 56);
      if ((v21 & 2) != 0)
      {
        v22 = (id)objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsWithOptions:predicate:writeDescriptor:", v21, *(_QWORD *)(a1 + 40), objc_msgSend(v15, "fileDescriptor"));
        v21 = *(_QWORD *)(a1 + 56);
      }
      if ((v21 & 0x20) != 0)
      {
        v23 = (id)objc_msgSend(*(id *)(a1 + 32), "_fetchTagsWithOptions:predicate:writeDescriptor:", v21, *(_QWORD *)(a1 + 40), objc_msgSend(v15, "fileDescriptor"));
        v21 = *(_QWORD *)(a1 + 56);
      }
      if ((v21 & 0x40) != 0)
      {
        v24 = (id)objc_msgSend(*(id *)(a1 + 32), "_fetchObjectToTagMappingsWithOptions:predicate:writeDescriptor:", v21, *(_QWORD *)(a1 + 40), objc_msgSend(v15, "fileDescriptor"));
        v21 = *(_QWORD *)(a1 + 56);
      }
      if ((v21 & 0x80) != 0)
        v25 = (id)objc_msgSend(*(id *)(a1 + 32), "_fetchObjectToTagMappingsWithOptions:predicate:writeDescriptor:", v21, *(_QWORD *)(a1 + 40), objc_msgSend(v15, "fileDescriptor"));

    }
    else
    {
      v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v26 + 16))(v26, 0, 0, v27);

      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(WBSScopeTimeoutHandler **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = 0;
    }

  }
}

- (void)_ensureDatabaseIsSynced
{
  id pendingVisitsTimeout;

  pendingVisitsTimeout = self->_pendingVisitsTimeout;
  if (pendingVisitsTimeout)
  {
    dispatch_block_cancel(pendingVisitsTimeout);
    -[WBSHistoryServiceDatabase _commitPendingUpdates](self, "_commitPendingUpdates");
  }
}

id __35__WBSHistoryServiceDatabase_warmUp__block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_ensureLatestVisitsAreComputed");
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "warmUpWithDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (id)_ensureLatestVisitsAreComputed
{
  void *v2;
  int function_v2;
  WBSSQLiteDatabase *database;
  int v6;
  void *v8;
  void *v9;

  if (self->_hasComputedLatestVisit)
  {
    v2 = 0;
  }
  else
  {
    function_v2 = sqlite3_create_function_v2((sqlite3 *)-[WBSSQLiteDatabase handle](self->_database, "handle"), "safari_compute_latest_visit_map", 4, 5, &self->_latestVisitMap, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))WBSSQLiteComputeLatestVisitStep, (void (__cdecl *)(sqlite3_context *))WBSSQLiteComputeLatestVisitFinal, 0);
    database = self->_database;
    if (function_v2
      || (v6 = sqlite3_create_function_v2((sqlite3 *)-[WBSSQLiteDatabase handle](database, "handle"), "safari_latest_visit_for", 1, 5, &self->_latestVisitMap, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))WBSSQLiteLatestVisitFor, 0, 0, 0), database = self->_database, v6))
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _ensureLatestVisitsAreComputed]");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SafariShared::WBSSQLiteDatabaseFetch<>(database, CFSTR("SELECT safari_compute_latest_visit_map(history_item, id, visit_time, synthesized) FROM history_visits"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nextObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 || objc_msgSend(v8, "lastResultCode") == 101)
      {
        v2 = 0;
        self->_hasComputedLatestVisit = 1;
      }
      else
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _ensureLatestVisitsAreComputed]");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  return v2;
}

- (BOOL)_prepareDatabase:(id *)a3
{
  WBSSQLiteDatabase *v5;
  WBSSQLiteDatabase *database;
  NSObject *v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  double v15;
  WBSSQLiteDatabase *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  double v27;
  uint64_t v28;
  const char *v29;
  int function_v2;
  NSObject *v31;
  double v32;
  void *v33;
  int v34;
  NSObject *v35;
  double v36;
  WBSHistoryServiceURLCompletion *v37;
  WBSHistoryServiceURLCompletion *urlCompletion;
  WBSSQLiteStatementCache *v39;
  WBSSQLiteStatementCache *statements;
  WBSHistoryTagDatabaseController *v41;
  WBSHistoryTagDatabaseController *tagController;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v47;
  NSURL *databaseURL;
  void *v50;
  NSURL *v51;
  void *v52;
  NSURL *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  uint8_t v63[4];
  const char *v64;
  __int16 v65;
  NSURL *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  int v74;
  _BYTE buf[14];
  _BYTE v76[10];
  _BYTE v77[30];
  void (*v78)(sqlite3_context *, uint64_t, sqlite3_value **);
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  int v82;
  void (*v83)(sqlite3_context *, uint64_t, sqlite3_value **);
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  int v87;
  void (*v88)(sqlite3_context *, uint64_t, sqlite3_value **);
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  int v92;
  void (*v93)(sqlite3_context *, uint64_t, sqlite3_value **);
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  int v97;
  uint64_t v98;
  _BYTE *(*v99)(sqlite3_context *, uint64_t, sqlite3_value **);
  void (*v100)(sqlite3_context *);
  const char *v101;
  int v102;
  uint64_t v103;
  _BYTE *(*v104)(sqlite3_context *, uint64_t, sqlite3_value **);
  void (*v105)(sqlite3_context *);
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v5 = (WBSSQLiteDatabase *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC0]), "initWithURL:queue:", self->_databaseURL, self->_queue);
  database = self->_database;
  self->_database = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[WBSSQLiteDatabase openWithAccessType:error:](self->_database, "openWithAccessType:error:", 3, a3) & 1) != 0)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v56, "timeIntervalSinceNow");
      -[WBSHistoryServiceDatabase _prepareDatabase:].cold.7(v8);
    }

    if (-[NSDictionary safari_BOOLForKey:](self->_databaseOptions, "safari_BOOLForKey:", CFSTR("WBSHistoryConnectionOptionCheckIntegrity")))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v57 = (id)objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteDatabase checkIntegrity](self->_database, "checkIntegrity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v9);
        v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _prepareDatabase:].cold.6();
        }

        -[WBSSQLiteDatabase close](self->_database, "close");
        v12 = 0;
LABEL_55:

        goto LABEL_56;
      }
      v14 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v57, "timeIntervalSinceNow");
        -[WBSHistoryServiceDatabase _prepareDatabase:].cold.5(v15);
      }

    }
    v16 = self->_database;
    v62 = 0;
    v17 = -[WBSSQLiteDatabase enableWAL:](v16, "enableWAL:", &v62);
    v57 = v62;
    if ((v17 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(&unk_1E4B876B8, "countByEnumeratingWithState:objects:count:", &v58, v106, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v59;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v59 != v19)
              objc_enumerationMutation(&unk_1E4B876B8);
            v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, v22);
            objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v23 == objc_msgSend(v24, "intValue");

            if (!v25)
            {
              v44 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                databaseURL = self->_databaseURL;
                -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544643;
                *(_QWORD *)&buf[4] = v22;
                *(_WORD *)&buf[12] = 2113;
                *(_QWORD *)v76 = databaseURL;
                *(_WORD *)&v76[8] = 1024;
                *(_DWORD *)v77 = v23;
                *(_WORD *)&v77[4] = 2080;
                *(_QWORD *)&v77[6] = "-[WBSHistoryServiceDatabase _prepareDatabase:]";
                *(_WORD *)&v77[14] = 2114;
                *(_QWORD *)&v77[16] = v50;
                *(_WORD *)&v77[24] = 1024;
                *(_DWORD *)&v77[26] = v23;
                _os_log_error_impl(&dword_1A3D90000, v44, OS_LOG_TYPE_ERROR, "Failed to set pragma \"%{public}@\" for History store at URL: %{private}@ with error: %d: %s %{public}@ (%d)", buf, 0x36u);

              }
              -[WBSSQLiteDatabase close](self->_database, "close");
              goto LABEL_53;
            }

          }
          v18 = objc_msgSend(&unk_1E4B876B8, "countByEnumeratingWithState:objects:count:", &v58, v106, 16);
          if (v18)
            continue;
          break;
        }
      }
      v26 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v55, "timeIntervalSinceNow");
        -[WBSHistoryServiceDatabase _prepareDatabase:].cold.3(v27);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      *(_QWORD *)buf = "safari_sha512";
      *(_DWORD *)&buf[8] = 2;
      *(_QWORD *)&v76[2] = WBSSQLiteSHA512;
      *(_QWORD *)v77 = 0;
      *(_QWORD *)&v77[8] = 0;
      *(_QWORD *)&v77[16] = "safari_domainexpansion";
      *(_DWORD *)&v77[24] = 1;
      v78 = WBSSQLiteExtractDomainExpansion;
      v79 = 0;
      v80 = 0;
      v81 = "safari_hostname";
      v82 = 1;
      v83 = WBSSQLiteExtractHostname;
      v84 = 0;
      v85 = 0;
      v86 = "safari_high_level_domain";
      v87 = 1;
      v88 = WBSSQLiteExtractHighLevelDomain;
      v89 = 0;
      v90 = 0;
      v91 = "safari_visit_score";
      v92 = 2;
      v93 = WBSSQLiteVisitScore;
      v94 = 0;
      v95 = 0;
      v96 = "safari_compute_daily_visit_counts";
      v98 = 0;
      v99 = WBSSQLiteDailyVisitCountsStep;
      v97 = 4;
      v100 = WBSSQLiteDailyVisitCountsFinal;
      v101 = "safari_compute_weekly_visit_counts";
      v102 = 4;
      v103 = 0;
      v104 = WBSSQLiteWeeklyVisitCountsStep;
      v105 = WBSSQLiteWeeklyVisitCountsFinal;
      while (1)
      {
        v29 = *(const char **)&buf[v28];
        function_v2 = sqlite3_create_function_v2((sqlite3 *)-[WBSSQLiteDatabase handle](self->_database, "handle"), v29, *(_DWORD *)&buf[v28 + 8], 2049, 0, *(void (__cdecl **)(sqlite3_context *, int, sqlite3_value **))&v76[v28 + 2], *(void (__cdecl **)(sqlite3_context *, int, sqlite3_value **))&v77[v28], *(void (__cdecl **)(sqlite3_context *))&v77[v28 + 8], 0);
        if (function_v2)
          break;
        v28 += 40;
        if (v28 == 280)
        {
          v31 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v22, "timeIntervalSinceNow");
            -[WBSHistoryServiceDatabase _prepareDatabase:].cold.2(v32);
          }

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[WBSHistoryServiceDatabase _migrateToCurrentSchemaVersionIfNeeded](self, "_migrateToCurrentSchemaVersionIfNeeded");
          v12 = v34 == 16;
          if (v34 == 16)
          {
            v35 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v33, "timeIntervalSinceNow");
              -[WBSHistoryServiceDatabase _prepareDatabase:].cold.1(v36);
            }

            v37 = objc_alloc_init(WBSHistoryServiceURLCompletion);
            urlCompletion = self->_urlCompletion;
            self->_urlCompletion = v37;

            v39 = (WBSSQLiteStatementCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CD0]), "initWithDatabase:", self->_database);
            statements = self->_statements;
            self->_statements = v39;

            -[WBSSQLiteDatabase setDelegate:](self->_database, "setDelegate:", self);
            -[WBSHistoryServiceDatabase _registerHistoryTagFrecencyScoringFunction](self, "_registerHistoryTagFrecencyScoringFunction");
            v41 = -[WBSHistoryTagDatabaseController initWithDatabase:]([WBSHistoryTagDatabaseController alloc], "initWithDatabase:", self->_database);
            tagController = self->_tagController;
            self->_tagController = v41;

            -[WBSHistoryServiceDatabase warmUp](self, "warmUp");
          }
          else
          {
            v47 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v53 = self->_databaseURL;
              -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67110403;
              *(_DWORD *)&buf[4] = v34;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = 16;
              *(_WORD *)v76 = 2113;
              *(_QWORD *)&v76[2] = v53;
              *(_WORD *)v77 = 2080;
              *(_QWORD *)&v77[2] = "-[WBSHistoryServiceDatabase _prepareDatabase:]";
              *(_WORD *)&v77[10] = 2114;
              *(_QWORD *)&v77[12] = v54;
              *(_WORD *)&v77[20] = 1024;
              *(_DWORD *)&v77[22] = 0;
              _os_log_error_impl(&dword_1A3D90000, v47, OS_LOG_TYPE_ERROR, "History store schema version (%d) does not match our supported schema version (%d) in store at %{private}@: %s %{public}@ (%d)", buf, 0x32u);

            }
            -[WBSSQLiteDatabase close](self->_database, "close");
          }

          goto LABEL_54;
        }
      }
      v45 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v51 = self->_databaseURL;
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v63 = 136447491;
        v64 = v29;
        v65 = 2113;
        v66 = v51;
        v67 = 1024;
        v68 = function_v2;
        v69 = 2080;
        v70 = "-[WBSHistoryServiceDatabase _prepareDatabase:]";
        v71 = 2114;
        v72 = v52;
        v73 = 1024;
        v74 = function_v2;
        _os_log_error_impl(&dword_1A3D90000, v45, OS_LOG_TYPE_ERROR, "Failed to create function: \"%{public}s\" for History store at URL: %{private}@ with error: %d: %s %{public}@ (%d)", v63, 0x36u);

      }
      -[WBSSQLiteDatabase close](self->_database, "close");
LABEL_53:
      v12 = 0;
LABEL_54:

      v10 = v55;
      goto LABEL_55;
    }
    v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v57, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _prepareDatabase:].cold.4();
    }

    if (a3)
      *a3 = objc_retainAutorelease(v57);
    -[WBSSQLiteDatabase close](self->_database, "close");
  }
  else
  {
    if (a3)
      v57 = *a3;
    else
      v57 = 0;
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v57, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _prepareDatabase:].cold.8();
    }

    -[WBSSQLiteDatabase close](self->_database, "close");
  }
  v12 = 0;
LABEL_56:

  return v12;
}

- (void)warmUp
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __35__WBSHistoryServiceDatabase_warmUp__block_invoke;
  activity_block[3] = &unk_1E4B2A2C8;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1A3D90000, "Warm Up", OS_ACTIVITY_FLAG_DETACHED, activity_block);
}

- (void)_registerHistoryTagFrecencyScoringFunction
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Failed to create a frecency sorting function with error code: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

- (int)_migrateToCurrentSchemaVersionIfNeeded
{
  WBSHistorySQLiteSchema *v3;
  WBSSQLiteDatabase *database;
  WBSHistoryCrypto *crypto;
  void *v6;
  void *v7;
  WBSHistorySQLiteSchema *v8;
  int v9;

  v3 = [WBSHistorySQLiteSchema alloc];
  crypto = self->_crypto;
  database = self->_database;
  -[NSDictionary safari_dateForKey:](self->_databaseOptions, "safari_dateForKey:", CFSTR("WBSHistoryConnectionOptionLegacyDatabaseImportAfterDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[WBSHistorySQLiteSchema initWithDatabase:crypto:migrateVisitsAfterDate:](v3, "initWithDatabase:crypto:migrateVisitsAfterDate:", database, crypto, v7);
  if (!v6)

  v9 = -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded](v8, "migrateToCurrentSchemaVersionIfNeeded");
  return v9;
}

void __68__WBSHistoryServiceDatabase_fetchMetadataForKeys_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      v8 = v4;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v10 = *(void **)(a1 + 40);
        v13 = v8;
        objc_msgSend(v10, "_metadataForKey:error:", v9, &v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v13;

        if (v11)
          v12 = 1;
        else
          v12 = v4 == 0;
        if (!v12)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          goto LABEL_14;
        }
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v9);

        ++v7;
        v8 = v4;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_14:

}

- (id)_metadataForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", CFSTR("SELECT value FROM metadata WHERE key = ?"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__WBSHistoryServiceDatabase__metadataForKey_error___block_invoke;
    v15[3] = &unk_1E4B2A2C8;
    v9 = v7;
    v16 = v9;
    objc_msgSend(v8, "setHandler:", v15);
    objc_msgSend(v9, "bindString:atParameterIndex:", v6, 1);
    objc_msgSend(v9, "fetch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4 && objc_msgSend(v10, "lastResultCode") != 101)
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _metadataForKey:error:]");
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  int v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (*(_BYTE *)(a1 + 64))
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ AND origin = ? %@"), CFSTR("SELECT safari_high_level_domain(url) AS high_level_domain FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE visit_time > ? AND visit_time < ? AND high_level_domain IS NOT NULL AND (url LIKE 'http://%' OR url LIKE 'https://%')"), CFSTR(" GROUP BY high_level_domain"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2;
    v12[3] = &unk_1E4B2B6D0;
    v13 = v2;
    v14 = MEMORY[0x1A8599ED0](v12);
    SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * const {__strong}&,NSDate * const {__strong},int,void({block_pointer} {__strong})(NSString *)>(v3, (uint64_t)&v16, v4, (id *)(a1 + 40), (id *)(a1 + 48), &v15, &v14);
    v5 = &v13;
    v6 = v16;
    v7 = (void *)v14;
  }
  else
  {
    v11 = 0;
    objc_msgSend(CFSTR("SELECT safari_high_level_domain(url) AS high_level_domain FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE visit_time > ? AND visit_time < ? AND high_level_domain IS NOT NULL AND (url LIKE 'http://%' OR url LIKE 'https://%')"), "stringByAppendingString:", CFSTR(" GROUP BY high_level_domain"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_3;
    v8[3] = &unk_1E4B2B6D0;
    v9 = v2;
    v10 = MEMORY[0x1A8599ED0](v8);
    SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * const {__strong}&,NSDate * const {__strong},void({block_pointer} {__strong})(NSString *)>(v3, (uint64_t)&v11, v4, (id *)(a1 + 40), (id *)(a1 + 48), &v10);
    v5 = &v9;
    v6 = v11;
    v7 = (void *)v10;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (int64_t)allocateTemporaryIDRange:(int64_t *)a3
{
  NSObject *queue;
  int64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WBSHistoryServiceDatabase_allocateTemporaryIDRange___block_invoke;
  block[3] = &unk_1E4B3B390;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(queue, block);
  *a3 = v9[3];
  v5 = v13[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)addDelegate:(id)a3 listenerName:(id)a4 forConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__WBSHistoryServiceDatabase_addDelegate_listenerName_forConnection___block_invoke;
  v15[3] = &unk_1E4B399F0;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

id __68__WBSHistoryServiceDatabase_addDelegate_listenerName_forConnection___block_invoke(_QWORD *a1)
{
  id result;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  result = (id)objc_msgSend(*(id *)(a1[4] + 64), "setObject:forKey:", a1[5], a1[6]);
  v3 = a1[7];
  if (v3)
  {
    objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKey:", v3, a1[6]);
    v4 = (void *)a1[4];
    v5 = a1[7];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    return (id)objc_msgSend(v4, "_updateListenerRegistration:lastSeen:", v5);
  }
  return result;
}

void __70__WBSHistoryServiceDatabase_fetchEventsForListener_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "_updateListenerRegistration:lastSeen:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)v4;
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v6 = (void *)a1[4];
    v7 = a1[5];
    v9 = 0;
    objc_msgSend(v6, "_fetchEventsForListener:error:", v7, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    (*(void (**)(void))(a1[6] + 16))();

  }
}

- (id)_fetchEventsForListener:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  WBSHistoryServiceEvent *v19;
  void *v20;
  WBSHistoryServiceEvent *v21;
  NSObject *v22;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", CFSTR("SELECT id, event_type, event_time, value FROM history_events WHERE pending_listeners LIKE ('%:' || ? || ':%') ORDER BY event_time"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v26 = v6;
  if (v6)
  {
    objc_msgSend(v6, "bindString:atParameterIndex:", v27, 1);
    objc_msgSend(v7, "fetch");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D89D00]);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __59__WBSHistoryServiceDatabase__fetchEventsForListener_error___block_invoke;
      v34[3] = &unk_1E4B2A2C8;
      v35 = v26;
      v24 = v8;
      objc_msgSend(v8, "setHandler:", v34);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = v25;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v31 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v13 = objc_msgSend(v12, "int64AtIndex:", 0);
            objc_msgSend(v12, "stringAtIndex:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "doubleAtIndex:", 2);
            v16 = v15;
            objc_msgSend(v12, "dataAtIndex:", 3);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSHistoryCrypto decryptDictionary:](self->_crypto, "decryptDictionary:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = [WBSHistoryServiceEvent alloc];
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = -[WBSHistoryServiceEvent initWithEventID:type:time:value:](v19, "initWithEventID:type:time:value:", v13, v14, v20, v18);

              if (v21)
                objc_msgSend(v28, "addObject:", v21);

            }
            else
            {
              v22 = WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                v37 = v13;
                _os_log_error_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_ERROR, "Failed to decrypt event %lli", buf, 0xCu);
              }
            }

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v9);
      }

    }
    else if (a4)
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _fetchEventsForListener:error:]");
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_DWORD *)self + 52) = 1065353216;
  *((_BYTE *)self + 224) = 0;
  return self;
}

- (WBSHistoryServiceDatabase)initWithID:(id)a3 url:(id)a4 options:(id)a5 fileOperationGroup:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  WBSHistoryServiceDatabase *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  NSMutableArray *v20;
  NSMutableArray *pendingVisits;
  void *v22;
  WBSHistoryCrypto *v23;
  WBSHistoryCrypto *crypto;
  NSObject *v25;
  double v26;
  uint64_t v27;
  NSMapTable *delegates;
  uint64_t v29;
  NSMapTable *listeners;
  void *v31;
  NSObject *v32;
  WBSHistoryServiceDatabase *v33;
  WBSHistoryServiceDatabase *v34;
  NSObject *v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSURL *clearHistoryInProgressFileURL;
  id v42;
  _QWORD block[4];
  WBSHistoryServiceDatabase *v44;
  uint64_t *v45;
  id *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  objc_super v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  double v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v51.receiver = self;
  v51.super_class = (Class)WBSHistoryServiceDatabase;
  v16 = -[WBSHistoryServiceDatabase init](&v51, sel_init);
  if (v16)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryServiceDatabase", v17);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v16->_fileOperationGroup, a6);
    objc_storeStrong((id *)&v16->_databaseID, a3);
    objc_storeStrong((id *)&v16->_databaseURL, a4);
    objc_storeStrong((id *)&v16->_databaseOptions, a5);
    v16->_currentRangeForTemporaryID = 1;
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingVisits = v16->_pendingVisits;
    v16->_pendingVisits = v20;

    objc_msgSend(MEMORY[0x1E0C99D68], "date", v42);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(WBSHistoryCrypto);
    crypto = v16->_crypto;
    v16->_crypto = v23;

    v25 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v22, "timeIntervalSinceNow");
      -[WBSHistoryServiceDatabase initWithID:url:options:fileOperationGroup:error:].cold.1(v26);
    }

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v27 = objc_claimAutoreleasedReturnValue();
    delegates = v16->_delegates;
    v16->_delegates = (NSMapTable *)v27;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v29 = objc_claimAutoreleasedReturnValue();
    listeners = v16->_listeners;
    v16->_listeners = (NSMapTable *)v29;

    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v16->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__WBSHistoryServiceDatabase_initWithID_url_options_fileOperationGroup_error___block_invoke;
    block[3] = &unk_1E4B3B368;
    v45 = &v47;
    v33 = v16;
    v44 = v33;
    v46 = a7;
    dispatch_sync(v32, block);
    if (*((_BYTE *)v48 + 24))
    {
      v34 = 0;
    }
    else
    {
      v35 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v31, "timeIntervalSinceNow");
        *(_DWORD *)buf = 136446466;
        v53 = "database_total_opening";
        v54 = 2048;
        v55 = -v36;
        _os_log_impl(&dword_1A3D90000, v35, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "safari_settingsDirectoryURL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "URLByAppendingPathComponent:isDirectory:", CFSTR("ClearHistoryInProgress"), 0);
      v39 = objc_claimAutoreleasedReturnValue();
      clearHistoryInProgressFileURL = v33->_clearHistoryInProgressFileURL;
      v33->_clearHistoryInProgressFileURL = (NSURL *)v39;

      v34 = v33;
    }

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

_QWORD *__54__WBSHistoryServiceDatabase_allocateTemporaryIDRange___block_invoke(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = ((*(_QWORD *)(result[4] + 24))++ << 47) | 0x8000000000000000;
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = (*(_QWORD *)(result[4] + 24) << 47) | 0x8000000000000000;
  return result;
}

void __35__WBSHistoryServiceDatabase_warmUp__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  dispatch_block_t v3;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WBSHistoryServiceDatabase_warmUp__block_invoke_2;
  block[3] = &unk_1E4B2A2C8;
  block[4] = v1;
  v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v2, v3);

}

- (void)fetchDomainExpansions:(id)a3
{
  NSObject *queue;
  _QWORD v5[6];
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__22;
  v6[4] = __Block_byref_object_dispose__22;
  v7 = (id)MEMORY[0x1A8599ED0](a3, a2);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke;
  v5[3] = &unk_1E4B2BE20;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(queue, v5);
  _Block_object_dispose(v6, 8);

}

- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke;
  block[3] = &unk_1E4B3AD40;
  v21 = a5;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

- (void)fetchMetadataForKeys:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *queue;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  WBSHistoryServiceDatabase *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[WBSHistoryServiceDatabase fetchMetadataForKeys:completionHandler:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__WBSHistoryServiceDatabase_fetchMetadataForKeys_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  v19 = v6;
  v20 = self;
  v21 = v7;
  v16 = v7;
  v17 = v6;
  dispatch_async(queue, block);

}

- (void)fetchWithOptions:(unint64_t)a3 predicate:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD v15[5];
  id v16;

  v8 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__22;
  v15[4] = __Block_byref_object_dispose__22;
  v16 = (id)MEMORY[0x1A8599ED0](a5);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__WBSHistoryServiceDatabase_fetchWithOptions_predicate_completionHandler___block_invoke;
  v11[3] = &unk_1E4B3B3B8;
  v13 = v15;
  v14 = a3;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

  _Block_object_dispose(v15, 8);
}

- (void)fetchEventsForListener:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__WBSHistoryServiceDatabase_fetchEventsForListener_completionHandler___block_invoke;
    block[3] = &unk_1E4B2B178;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

  }
}

- (WBSHistoryServiceDatabase)init
{

  return 0;
}

- (void)dealloc
{
  WBSSQLiteStatementCache *v3;
  WBSSQLiteDatabase *v4;
  NSObject *fileOperationGroup;
  NSObject *queue;
  WBSSQLiteDatabase *v7;
  WBSSQLiteStatementCache *v8;
  objc_super v9;
  _QWORD block[4];
  WBSSQLiteStatementCache *v11;
  WBSSQLiteDatabase *v12;

  v3 = self->_statements;
  v4 = self->_database;
  queue = self->_queue;
  fileOperationGroup = self->_fileOperationGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__WBSHistoryServiceDatabase_dealloc__block_invoke;
  block[3] = &unk_1E4B2B448;
  v11 = v3;
  v12 = v4;
  v7 = v4;
  v8 = v3;
  dispatch_group_async(fileOperationGroup, queue, block);

  v9.receiver = self;
  v9.super_class = (Class)WBSHistoryServiceDatabase;
  -[WBSHistoryServiceDatabase dealloc](&v9, sel_dealloc);
}

uint64_t __36__WBSHistoryServiceDatabase_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(*(id *)(a1 + 40), "close");
}

- (void)forceCloseWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__WBSHistoryServiceDatabase_forceCloseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __61__WBSHistoryServiceDatabase_forceCloseWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_closeTagController");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "close");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_reopenDatabase:(id *)a3
{
  WBSSQLiteStatementCache *statements;
  WBSSQLiteDatabase *database;

  -[WBSSQLiteStatementCache invalidate](self->_statements, "invalidate");
  statements = self->_statements;
  self->_statements = 0;

  -[WBSSQLiteDatabase close](self->_database, "close");
  database = self->_database;
  self->_database = 0;

  SafariShared::LatestVisitInformationMap::clear((SafariShared::LatestVisitInformationMap *)&self->_latestVisitMap);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(&self->_temporaryIDToItem.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(&self->_visitForTemporaryID.__table_.__bucket_list_.__ptr_.__value_);
  self->_hasComputedLatestVisit = 0;
  -[WBSHistoryServiceDatabase _closeTagController](self, "_closeTagController");
  return -[WBSHistoryServiceDatabase _prepareDatabase:](self, "_prepareDatabase:", a3);
}

- (void)_closeTagController
{
  WBSHistoryTagDatabaseController *tagController;

  tagController = self->_tagController;
  self->_tagController = 0;

}

- (void)database:(id)a3 hadSevereError:(id)a4
{
  id v5;
  void *v6;
  atomic<BOOL> *p_integrityCheckPending;
  NSObject *queue;
  _QWORD v10[5];
  id v11;

  v5 = a4;
  v6 = v5;
  p_integrityCheckPending = &self->_integrityCheckPending;
  while (!__ldaxr((unsigned __int8 *)p_integrityCheckPending))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_integrityCheckPending))
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke;
      v10[3] = &unk_1E4B2B448;
      v10[4] = self;
      v11 = v5;
      dispatch_async(queue, v10);

      goto LABEL_6;
    }
  }
  __clrex();
LABEL_6:

}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  dispatch_time_t v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  id v31;
  id v32;
  _QWORD v33[4];
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t *)(a1 + 32);
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 224));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:", 0);
  objc_msgSend(*(id *)(*v1 + 40), "checkIntegrity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *v1;
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 56), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "close");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_closeTagController");
    v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_3();
    }

    v9 = dispatch_group_create();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v36;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
          dispatch_group_enter(v9);
          v16 = *(_QWORD *)(a1 + 40);
          v33[0] = v13;
          v33[1] = 3221225472;
          v33[2] = __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_34;
          v33[3] = &unk_1E4B2A2C8;
          v34 = v9;
          objc_msgSend(v15, "reportSevereError:completionHandler:", v16, v33);

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v11);
    }

    v17 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v9, v17);
    v18 = *(void **)(a1 + 32);
    v32 = 0;
    v19 = objc_msgSend(v18, "_reopenDatabase:", &v32);
    v20 = v32;
    if ((v19 & 1) == 0)
    {
      v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v20, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_2();
      }

      v22 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_DEFAULT, "Falling back to in-memory database", buf, 2u);
      }
      WBSHistoryInMemoryDatabaseURL();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(void **)(v24 + 264);
      *(_QWORD *)(v24 + 264) = v23;

      v26 = *(void **)(a1 + 32);
      v31 = 0;
      v27 = objc_msgSend(v26, "_reopenDatabase:", &v31);
      v28 = v31;
      if ((v27 & 1) == 0)
      {
        v29 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v20, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_1();
        }

      }
    }

  }
  else
  {
    objc_msgSend(*(id *)(v3 + 40), "setDelegate:");
  }
}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_34(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)ensureLatestVisitsAreComputed:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_hasComputedLatestVisit)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
  else
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__WBSHistoryServiceDatabase_ensureLatestVisitsAreComputed___block_invoke;
    v7[3] = &unk_1E4B2A250;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __59__WBSHistoryServiceDatabase_ensureLatestVisitsAreComputed___block_invoke(uint64_t a1)
{
  void *v2;
  qos_class_t v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_ensureLatestVisitsAreComputed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = qos_class_self();
  dispatch_get_global_queue(v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__WBSHistoryServiceDatabase_ensureLatestVisitsAreComputed___block_invoke_2;
  v7[3] = &unk_1E4B29E18;
  v5 = *(id *)(a1 + 40);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  dispatch_async(v4, v7);

}

uint64_t __59__WBSHistoryServiceDatabase_ensureLatestVisitsAreComputed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (unordered_map<long)_recomputeLatestVisitsForItems:(std:(std:(std:(long long>>> *__return_ptr)retstr :(WBSHistoryServiceDatabase *)self allocator<std:(SEL)a3 :(const void *)a4 pair<const long)long :(id *)a5 equal_to<long)long> :hash<long)long> error:
{
  NSObject *v9;
  uint64_t v10;
  LatestVisitInformationMap *p_latestVisitMap;
  WBSSQLiteDatabase *database;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unordered_map<long long, long long, std::hash<long long>, std::equal_to<long long>, std::allocator<std::pair<const long long, long long>>> *result;
  NSObject *v18;
  _QWORD *i;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *VisitID;
  __int128 v23;
  uint8_t buf[16];
  __int128 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_hasComputedLatestVisit)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *((_QWORD *)a4 + 3);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "Recomputing latest visits for %zu items", buf, 0xCu);
    }
    *(_OWORD *)buf = 0u;
    v25 = 0u;
    v26 = 1065353216;
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)buf, (unint64_t)(float)*((unint64_t *)a4 + 3));
    p_latestVisitMap = &self->_latestVisitMap;
    SafariShared::LatestVisitInformationMap::lastVisitsForItems(&self->_latestVisitMap._map.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)a4, (uint64_t)buf);
    SafariShared::LatestVisitInformationMap::removeItems((uint64_t *)&self->_latestVisitMap, (uint64_t)a4);
    database = self->_database;
    createQueryWithList(CFSTR("SELECT safari_compute_latest_visit_map(history_item, id, visit_time, synthesized) FROM history_visits WHERE history_item IN ("), (uint64_t)a4, CFSTR(")"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SafariShared::WBSSQLiteDatabaseFetch<>(database, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "nextObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 && objc_msgSend(v14, "lastResultCode") != 101)
    {
      if (a5)
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _recomputeLatestVisitsForItems:error:]");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _recomputeLatestVisitsForItems:error:]");
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _recomputeLatestVisitsForItems:error:].cold.2();
        }

      }
    }
    retstr->__table_.__bucket_list_ = 0u;
    *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
    retstr->__table_.__p3_.__value_ = 1.0;
    for (i = (_QWORD *)v25; i; i = (_QWORD *)*i)
    {
      v20 = i[2];
      v21 = (_QWORD *)i[3];
      VisitID = SafariShared::LatestVisitInformationMap::lastVisitID((SafariShared::LatestVisitInformationMap *)p_latestVisitMap, v20);
      if (VisitID != v21)
      {
        *(_QWORD *)&v23 = v20;
        *((_QWORD *)&v23 + 1) = VisitID;
        std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::pair<long long,long long>>((uint64_t)retstr, (unint64_t *)&v23, &v23);
      }
    }

    return (unordered_map<long long, long long, std::hash<long long>, std::equal_to<long long>, std::allocator<std::pair<const long long, long long>>> *)std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
  }
  else
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = WBS_LOG_CHANNEL_PREFIXHistory();
    result = (unordered_map<long long, long long, std::hash<long long>, std::equal_to<long long>, std::allocator<std::pair<const long long, long long>>> *)os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
      -[WBSHistoryServiceDatabase _recomputeLatestVisitsForItems:error:].cold.1();
    retstr->__table_.__bucket_list_ = 0u;
    *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
    retstr->__table_.__p3_.__value_ = 1.0;
  }
  return result;
}

- (id)_fetchTagsWithOptions:(unint64_t)a3 predicate:(id)a4 writeDescriptor:(int)a5
{
  id v7;
  WBSSQLiteDatabase *database;
  WBSSQLiteStatementCache *statements;
  void *v10;
  id v11;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  void *v16[3];
  __int128 v17;
  sqlite3_int64 v18;
  sqlite3_int64 v19;
  const unsigned __int8 *v20;
  const unsigned __int8 *v21;
  double v22;
  id v23;

  v7 = a4;
  database = self->_database;
  statements = self->_statements;
  v23 = 0;
  objc_msgSend(v7, "statementForDatabase:cache:fetchOptions:error:", database, statements, 32, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  v12 = v11;
  if (v10)
  {
    LODWORD(v17) = 7;
    SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v16, a5);
    v13 = (sqlite3_stmt *)objc_msgSend(v10, "handle");
    do
    {
      if (sqlite3_step(v13) != 100)
        break;
      *((_QWORD *)&v17 + 1) = sqlite3_column_int64(v13, 0);
      v18 = sqlite3_column_int64(v13, 1);
      v19 = sqlite3_column_int64(v13, 2);
      v20 = sqlite3_column_text(v13, 3);
      v21 = sqlite3_column_text(v13, 4);
      v22 = sqlite3_column_double(v13, 5);
    }
    while (SafariShared::HistoryObjectStreamWriter::write((uint64_t *)v16, &v17));
    objc_msgSend(v10, "reset");
    SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v16);
    v14 = 0;
  }
  else
  {
    v14 = v11;
  }

  return v14;
}

- (id)_fetchObjectToTagMappingsWithOptions:(unint64_t)a3 predicate:(id)a4 writeDescriptor:(int)a5
{
  id v8;
  WBSSQLiteDatabase *database;
  WBSSQLiteStatementCache *statements;
  void *v11;
  id v12;
  void *v13;
  sqlite3_stmt *v14;
  id v15;
  void *v17[3];
  __int128 v18;
  sqlite3_int64 v19;
  double v20;
  id v21;

  v8 = a4;
  database = self->_database;
  statements = self->_statements;
  v21 = 0;
  objc_msgSend(v8, "statementForDatabase:cache:fetchOptions:error:", database, statements, a3, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  v13 = v12;
  if (v11)
  {
    LODWORD(v18) = 8;
    SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v17, a5);
    v14 = (sqlite3_stmt *)objc_msgSend(v11, "handle");
    do
    {
      if (sqlite3_step(v14) != 100)
        break;
      *((_QWORD *)&v18 + 1) = sqlite3_column_int64(v14, 0);
      v19 = sqlite3_column_int64(v14, 1);
      v20 = sqlite3_column_double(v14, 2);
    }
    while (SafariShared::HistoryObjectStreamWriter::write((uint64_t *)v17, &v18));
    objc_msgSend(v11, "reset");
    SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v17);
    v15 = 0;
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

void __74__WBSHistoryServiceDatabase_fetchWithOptions_predicate_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  MEMORY[0x1A859A380](objc_msgSend(*(id *)(a1 + 32), "closeFile"));
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endActivity:", *(_QWORD *)(a1 + 40));

}

void __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke_2(uint64_t a1)
{
  id v2;

  MEMORY[0x1A859A380](objc_msgSend(*(id *)(a1 + 32), "closeFile"));
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endActivity:", *(_QWORD *)(a1 + 40));

}

- (void)getVisitedLinksWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__WBSHistoryServiceDatabase_getVisitedLinksWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __66__WBSHistoryServiceDatabase_getVisitedLinksWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  SafariShared::WBSSQLiteDatabaseFetch<>(*(void **)(*(_QWORD *)(a1 + 32) + 40), CFSTR("SELECT url FROM history_items"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "stringAtIndex:", 0, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_URLWithDataAsString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(v4, "statement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)groupVisitsIntoSessionsBetweenStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__WBSHistoryServiceDatabase_groupVisitsIntoSessionsBetweenStartDate_endDate_completionHandler___block_invoke;
  v15[3] = &unk_1E4B39360;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __95__WBSHistoryServiceDatabase_groupVisitsIntoSessionsBetweenStartDate_endDate_completionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WBSRemoteHistoryItem *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void (**v25)(void);
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_ensureDatabaseIsSynced");
  v2 = (void *)*((_QWORD *)a1[4] + 5);
  objc_msgSend(a1[5], "timeIntervalSinceReferenceDate");
  v43 = v3;
  v20 = a1;
  objc_msgSend(a1[6], "timeIntervalSinceReferenceDate");
  v37 = v4;
  SafariShared::WBSSQLiteDatabaseFetch<double,double>(v2, CFSTR("SELECT url, title, visit_time FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE history_visits.id = safari_latest_visit_for (history_items.id)AND visit_time >= ? AND visit_time <= ? ORDER BY visit_time DESC"), (double *)&v43, (double *)&v37);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__81;
  v47 = __Block_byref_object_dispose__82;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__81;
  v41 = __Block_byref_object_dispose__82;
  v42 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __95__WBSHistoryServiceDatabase_groupVisitsIntoSessionsBetweenStartDate_endDate_completionHandler___block_invoke_83;
  v32[3] = &unk_1E4B3B3E0;
  v27 = v22;
  v33 = v27;
  v35 = &v37;
  v24 = v23;
  v34 = v24;
  v36 = &v43;
  v25 = (void (**)(void))MEMORY[0x1A8599ED0](v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v21;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v49, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1A8599CE4]();
        v10 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v8, "doubleAtIndex:", 2);
        objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v38[5] && (objc_msgSend(v27, "isDate:inSameDayAsDate:", v11) & 1) == 0)
        {
          v25[2]();
          objc_msgSend((id)v44[5], "removeAllObjects");
        }
        v12 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v8, "stringAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "safari_URLWithDataAsString:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "stringAtIndex:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)v44[5];
        v17 = -[WBSRemoteHistoryItem initWithURL:title:lastVisitTime:]([WBSRemoteHistoryItem alloc], "initWithURL:title:lastVisitTime:", v14, v15, v11);
        objc_msgSend(v16, "addObject:", v17);

        v18 = (void *)v38[5];
        v38[5] = v11;

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v49, 16);
    }
    while (v5);
  }

  if (objc_msgSend((id)v44[5], "count"))
    v25[2]();
  objc_msgSend(obj, "statement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "invalidate");

  (*((void (**)(void))v20[7] + 2))();
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

void __95__WBSHistoryServiceDatabase_groupVisitsIntoSessionsBetweenStartDate_endDate_completionHandler___block_invoke_83(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  WBSRemoteHistorySession *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "startOfDayForDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setDay:", 1);
  objc_msgSend(*(id *)(a1 + 32), "dateByAddingComponents:toDate:options:", v2, v6, 4096);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = -[WBSRemoteHistorySession initWithStartDate:endDate:items:]([WBSRemoteHistorySession alloc], "initWithStartDate:endDate:items:", v6, v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(v4, "addObject:", v5);

}

- (void)fetchCloudClientVersionTable:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__WBSHistoryServiceDatabase_fetchCloudClientVersionTable___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __58__WBSHistoryServiceDatabase_fetchCloudClientVersionTable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__WBSHistoryServiceDatabase_fetchCloudClientVersionTable___block_invoke_2;
  v9[3] = &unk_1E4B3B408;
  v4 = v2;
  v10 = v4;
  v11 = (id)MEMORY[0x1A8599ED0](v9);
  v5 = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(int,NSDate *)>(v3, (uint64_t)&v12, CFSTR("SELECT client_version, last_seen FROM history_client_versions"), &v11);
  v6 = v12;

  if (v5)
    v7 = v4;
  else
    v7 = 0;
  if (v5)
    v8 = 0;
  else
    v8 = v6;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, v8);

}

void __58__WBSHistoryServiceDatabase_fetchCloudClientVersionTable___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)_lastSeenDateForCloudClientVersion:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v9;

  v9 = a3;
  SafariShared::WBSSQLiteDatabaseFetch<unsigned long &>(self->_database, CFSTR("SELECT last_seen FROM history_client_versions WHERE client_version = ?"), &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0C99D68];
  if (v4)
  {
    objc_msgSend(v4, "doubleAtIndex:", 0);
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)lastSeenDateForCloudClientVersion:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__WBSHistoryServiceDatabase_lastSeenDateForCloudClientVersion_completionHandler___block_invoke;
  block[3] = &unk_1E4B3B430;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

void __81__WBSHistoryServiceDatabase_lastSeenDateForCloudClientVersion_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_lastSeenDateForCloudClientVersion:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)setLastSeenDate:(id)a3 forCloudClientVersion:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke;
    v12[3] = &unk_1E4B392E8;
    v12[4] = self;
    v15 = a4;
    v13 = v8;
    v14 = v9;
    dispatch_async(queue, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v11);

  }
}

void __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  double v19[6];

  v19[5] = *(double *)MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_lastSeenDateForCloudClientVersion:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(*(id *)(a1 + 40), "compare:", v3) != 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v18 = 0;
    objc_msgSend(v4, "statementForQuery:error:", CFSTR("INSERT OR REPLACE INTO history_client_versions (client_version, last_seen)VALUES (?, ?)"), &v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;
    if (v5)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D89D00]);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke_2;
      v16 = &unk_1E4B2A2C8;
      v8 = v5;
      v17 = v8;
      objc_msgSend(v7, "setHandler:", &v13);
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate", v13, v14, v15, v16);
      v19[0] = v9;
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,unsigned long const&,double>(v8, v2, v19);
      if (objc_msgSend(v8, "execute") == 101)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorMessage");
          objc_claimAutoreleasedReturnValue();
          __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke_cold_1();
        }

        v11 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase setLastSeenDate:forCloudClientVersion:completionHandler:]_block_invoke");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

uint64_t __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (BOOL)_shouldEmitLegacyTombstones
{
  void *v2;
  double v3;
  BOOL v4;

  -[WBSHistoryServiceDatabase _lastSeenDateForCloudClientVersion:](self, "_lastSeenDateForCloudClientVersion:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3 > -7776000.0;

  return v4;
}

- (id)_setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6;
  WBSSQLiteDatabase *database;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  WBSSQLiteDatabase *v12;
  WBSSQLiteDatabase *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  WBSSQLiteDatabase *v17;
  int v18;
  NSObject *v19;
  objc_class *v20;
  WBSSQLiteDatabase *v21;
  uint64_t v22;
  WBSSQLiteDatabase *v23;
  void *v24;
  NSObject *v25;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  _BYTE buf[12];
  __int16 v35;
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      database = self->_database;
      v32 = v6;
      v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSData * {__strong}>(database, 0, CFSTR("INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)"), &v33, &v32);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = self->_database;
        v31 = v6;
        v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}>(v12, 0, CFSTR("INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)"), &v33, &v31);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = self->_database;
          objc_msgSend(v6, "timeIntervalSinceReferenceDate");
          *(_QWORD *)buf = v14;
          v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,double>(v13, 0, CFSTR("INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)"), &v33, (double *)buf);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v19 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = (objc_class *)objc_opt_class();
              NSStringFromClass(v20);
              objc_claimAutoreleasedReturnValue();
              -[WBSHistoryServiceDatabase _setMetadataValue:forKey:].cold.1();
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
            v11 = objc_claimAutoreleasedReturnValue();
            goto LABEL_28;
          }
          v15 = objc_retainAutorelease(v6);
          v16 = (const char *)objc_msgSend(v15, "objCType");
          if (!strcmp(v16, "B"))
          {
            v23 = self->_database;
            buf[0] = objc_msgSend(v15, "BOOLValue");
            v18 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,BOOL>(v23, 0, CFSTR("INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)"), &v33, buf);
          }
          else if (!strcmp(v16, "f") || !strcmp(v16, "d"))
          {
            v21 = self->_database;
            objc_msgSend(v15, "doubleValue");
            *(_QWORD *)buf = v22;
            v18 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,double>(v21, 0, CFSTR("INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)"), &v33, (double *)buf);
          }
          else
          {
            v17 = self->_database;
            *(_QWORD *)buf = objc_msgSend(v15, "longLongValue");
            v18 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,long long>(v17, 0, CFSTR("INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)"), &v33, buf);
          }
          v8 = v18;

        }
      }
    }
    if (v8 == 101)
      goto LABEL_24;
    v25 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = v33;
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v27;
      v35 = 2080;
      v36 = "-[WBSHistoryServiceDatabase _setMetadataValue:forKey:]";
      v37 = 2114;
      v38 = v28;
      v39 = 1024;
      v40 = v8;
      _os_log_error_impl(&dword_1A3D90000, v25, OS_LOG_TYPE_ERROR, "Failed to update metadata value %@: %s %{public}@ (%d)", buf, 0x26u);

    }
    -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _setMetadataValue:forKey:]");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v24 = (void *)v11;
    goto LABEL_29;
  }
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_database, 0, CFSTR("DELETE FROM metadata WHERE key = ?"), &v33);
  if (v9 != 101)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v29 = v33;
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v29;
      v35 = 2080;
      v36 = "-[WBSHistoryServiceDatabase _setMetadataValue:forKey:]";
      v37 = 2114;
      v38 = v30;
      v39 = 1024;
      v40 = v9;
      _os_log_error_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_ERROR, "Failed to delete metadata value %@: %s %{public}@ (%d)", buf, 0x26u);

    }
    -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _setMetadataValue:forKey:]");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_24:
  v24 = 0;
LABEL_29:

  return v24;
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *queue;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v9)
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__WBSHistoryServiceDatabase_setMetadataValue_forKey_completionHandler___block_invoke;
    v14[3] = &unk_1E4B3B458;
    v17 = v10;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    dispatch_async(queue, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v13);

  }
}

void __71__WBSHistoryServiceDatabase_setMetadataValue_forKey_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_setMetadataValue:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (unint64_t)_pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[WBSHistoryServiceDatabase _pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:].cold.2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v15 = v14;
  -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", CFSTR("DELETE FROM history_tombstones WHERE end_time < ?"), a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __89__WBSHistoryServiceDatabase__pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate_error___block_invoke;
    v22[3] = &unk_1E4B2A2C8;
    v18 = v16;
    v23 = v18;
    objc_msgSend(v17, "setHandler:", v22);
    objc_msgSend(v18, "bindDouble:atParameterIndex:", 1, v15);
    if (objc_msgSend(v18, "execute") == 101)
    {
      v19 = -[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount");
    }
    else
    {
      v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:].cold.1();
      }

      if (a4)
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:]");
        v19 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __89__WBSHistoryServiceDatabase__pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)pruneTombstonesWithEndDatePriorToDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__WBSHistoryServiceDatabase_pruneTombstonesWithEndDatePriorToDate_completionHandler___block_invoke;
    block[3] = &unk_1E4B2B178;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

  }
}

void __85__WBSHistoryServiceDatabase_pruneTombstonesWithEndDatePriorToDate_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v5 = 0;
  objc_msgSend(v2, "_pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:", v3, &v5);
  v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)_convertTombstoneWithGenerationToSecureFormat:(int64_t)a3 lastSyncedGeneration:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v24;
  id obj;
  void *v26;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int64_t v33;
  int64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = a4;
  v34 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<long long &,long long &>(self->_database, CFSTR("SELECT id, url FROM history_tombstones WHERE generation > ? AND generation <= ? AND url IS NOT NULL"), &v33, &v34);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v30;
    v24 = CFSTR("url_salt");
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "int64AtIndex:", 0, v24);
        objc_msgSend(v7, "dataAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSHistoryCrypto decryptDictionary:](self->_crypto, "decryptDictionary:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend((id)v10, "mutableCopy");

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("url"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = v12 == 0;

        if ((v10 & 1) == 0)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("url_hash"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 == 0;

          if (v14)
          {
            -[WBSHistoryCrypto salt](self->_crypto, "salt");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "safari_stringForKey:", CFSTR("url"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            WBSHistorySHA512(v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("url_hash"));

            objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, v24);
          }
          objc_msgSend(v11, "removeObjectForKey:", CFSTR("url"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v11, v18);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v4);
  }

  if (!objc_msgSend(v26, "count"))
    goto LABEL_15;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("BEGIN TRANSACTION")) != 101)
  {
    v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:].cold.2();
    }

    -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:]");
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __96__WBSHistoryServiceDatabase__convertTombstoneWithGenerationToSecureFormat_lastSyncedGeneration___block_invoke;
  v28[3] = &unk_1E4B3B480;
  v28[4] = self;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v28);
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("COMMIT TRANSACTION")) != 101)
  {
    v22 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:].cold.1();
    }

    -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:]");
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v19 = (void *)v21;
    goto LABEL_23;
  }
LABEL_15:
  v19 = 0;
LABEL_23:

  return v19;
}

void __96__WBSHistoryServiceDatabase__convertTombstoneWithGenerationToSecureFormat_lastSyncedGeneration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  _BYTE buf[12];
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 40);
  objc_msgSend(*(id *)(v7 + 32), "encryptDictionary:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = objc_msgSend(v5, "integerValue");
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSData * {__strong},long>(v8, 0, CFSTR("UPDATE history_tombstones SET url = ? WHERE id = ?"), &v12, buf);

  if (v9 != 101)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v5;
      v14 = 2080;
      v15 = "-[WBSHistoryServiceDatabase _convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:]_block_invoke";
      v16 = 2114;
      v17 = v11;
      v18 = 1024;
      v19 = v9;
      _os_log_error_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_ERROR, "Failed to convert tombstone %@: %s %{public}@ (%d)", buf, 0x26u);

    }
  }

}

- (void)convertTombstoneWithGenerationToSecureFormat:(int64_t)a3 lastSyncedGeneration:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  int64_t v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__WBSHistoryServiceDatabase_convertTombstoneWithGenerationToSecureFormat_lastSyncedGeneration_completionHandler___block_invoke;
  v11[3] = &unk_1E4B3B4A8;
  v11[4] = self;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v10 = v8;
  dispatch_async(queue, v11);

}

void __113__WBSHistoryServiceDatabase_convertTombstoneWithGenerationToSecureFormat_lastSyncedGeneration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)replayAndAddTombstones:(id)a3 completionHandler:(id)a4
{
  qos_class_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WBSHistoryServiceURLRepresentation *v16;
  WBSHistoryServiceURLRepresentation *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  dispatch_group_t v22;
  id v23;
  dispatch_queue_t queue;
  id v25;
  id obj;
  uint64_t v27;
  void *v29;
  dispatch_group_t group;
  _QWORD block[4];
  id v32;
  _QWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  dispatch_queue_t v39;
  dispatch_group_t v40;
  _QWORD *v41;
  _QWORD v42[5];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v25 = a4;
  v22 = dispatch_group_create();
  v5 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(0, v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create(0, v6);

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__81;
  v42[4] = __Block_byref_object_dispose__82;
  v43 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke;
  v38[3] = &unk_1E4B3B4D0;
  queue = v7;
  v39 = queue;
  v41 = v42;
  group = v22;
  v40 = group;
  v29 = (void *)MEMORY[0x1A8599ED0](v38);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v23;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v8)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v10, "startTime");
        objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v10, "endTime");
        objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "urlString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(group);
        if (v15)
        {
          v16 = -[WBSHistoryServiceURLRepresentation initWithURLString:]([WBSHistoryServiceURLRepresentation alloc], "initWithURLString:", v15);
LABEL_10:
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase clearHistoryItems:afterDate:beforeDate:tombstoneMode:completionHandler:](self, "clearHistoryItems:afterDate:beforeDate:tombstoneMode:completionHandler:", v20, v12, v14, 3, v29);

          goto LABEL_11;
        }
        if ((objc_msgSend(v10, "isSecure") & 1) != 0)
        {
          v17 = [WBSHistoryServiceURLRepresentation alloc];
          objc_msgSend(v10, "urlHash");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "urlSalt");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[WBSHistoryServiceURLRepresentation initWithURLHash:salt:](v17, "initWithURLHash:salt:", v18, v19);

          goto LABEL_10;
        }
        -[WBSHistoryServiceDatabase clearHistoryVisitsAddedAfterDate:beforeDate:tombstoneMode:completionHandler:](self, "clearHistoryVisitsAddedAfterDate:beforeDate:tombstoneMode:completionHandler:", v12, v14, 3, v29);
LABEL_11:

        ++v9;
      }
      while (v8 != v9);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      v8 = v21;
    }
    while (v21);
  }

  if (v25)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_2;
    block[3] = &unk_1E4B3B4F8;
    v32 = v25;
    v33 = v42;
    dispatch_group_notify(group, queue, block);

  }
  _Block_object_dispose(v42, 8);

}

void __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_cold_1();
    }

    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_114;
    v6[3] = &unk_1E4B2BDF8;
    v8 = *(_QWORD *)(a1 + 48);
    v7 = v3;
    dispatch_sync(v5, v6);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_114(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
}

uint64_t __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)fetchAllTombstonesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__WBSHistoryServiceDatabase_fetchAllTombstonesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __69__WBSHistoryServiceDatabase_fetchAllTombstonesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WBSHistoryTombstone *v9;
  WBSHistoryTombstone *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SafariShared::WBSSQLiteDatabaseFetch<>(*(void **)(*(_QWORD *)(a1 + 32) + 40), CFSTR("SELECT * FROM history_tombstones"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = [WBSHistoryTombstone alloc];
        v10 = -[WBSHistoryTombstone initWithSQLiteRow:crypto:](v9, "initWithSQLiteRow:crypto:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), (_QWORD)v11);
        objc_msgSend(v3, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_queuePendingUpdates
{
  dispatch_block_t v3;
  id pendingVisitsTimeout;
  dispatch_time_t v5;
  _QWORD block[5];

  if (!self->_pendingVisitsTimeout)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__WBSHistoryServiceDatabase__queuePendingUpdates__block_invoke;
    block[3] = &unk_1E4B2A2C8;
    block[4] = self;
    v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, block);
    pendingVisitsTimeout = self->_pendingVisitsTimeout;
    self->_pendingVisitsTimeout = v3;

    v5 = dispatch_time(0, 5000000000);
    dispatch_after(v5, (dispatch_queue_t)self->_queue, self->_pendingVisitsTimeout);
  }
}

uint64_t __49__WBSHistoryServiceDatabase__queuePendingUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitPendingUpdates");
}

- (void)_commitPendingUpdates
{
  id pendingVisitsTimeout;
  void *v4;
  WBSSQLiteDatabase *database;
  _QWORD v6[5];

  pendingVisitsTimeout = self->_pendingVisitsTimeout;
  self->_pendingVisitsTimeout = 0;

  v4 = (void *)MEMORY[0x1A8599CE4]();
  database = self->_database;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke;
  v6[3] = &unk_1E4B39388;
  v6[4] = self;
  -[WBSSQLiteDatabase tryToPerformTransactionInBlock:](database, "tryToPerformTransactionInBlock:", v6);
  objc_autoreleasePoolPop(v4);
}

uint64_t __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v9[0] = 0;
  objc_msgSend(v2, "_findItemIDsForPendingVisitsWithError:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9[0];
  if (!v3)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke_cold_1();
    }

    goto LABEL_7;
  }
  v5 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "sortedArrayUsingComparator:", &__block_literal_global_61);
  if ((objc_msgSend(*(id *)(a1 + 32), "_commitPendingItems:", v3) & 1) == 0)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "_commitPendingVisits:", v3);
LABEL_8:

  return v6;
}

uint64_t __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "visitTime");
  v7 = v6;
  objc_msgSend(v5, "visitTime");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "visitTime");
    v11 = v10;
    objc_msgSend(v5, "visitTime");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (id)_findItemIDsForPendingVisitsWithError:(id *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableArray count](self->_pendingVisits, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:error:", self->_database, CFSTR("SELECT id FROM history_items WHERE url = ?"), a3);
  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_pendingVisits;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v20 = 0;
          objc_msgSend(v10, "urlString", v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = &v20;
          v19 = v11;
          v12 = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong},std::tuple<long long &>>(v5, (uint64_t)a3, &v19, (void **)&v18);

          if ((v12 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v20);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "urlString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v14);

          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

    objc_msgSend(v5, "invalidate");
    v15 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_commitPendingItems:(id)a3
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  WBSSQLiteDatabase *database;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  WBSHistoryServiceURLCompletion *urlCompletion;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  WBSSQLiteDatabase *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  WBSHistoryServiceURLCompletion *v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  void *v49;
  BOOL v50;
  NSObject *v51;
  int *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id obj;
  uint64_t v73;
  id v74;
  id location;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE buf[12];
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  int v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v4 = self->_pendingVisits;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v82 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        if ((objc_msgSend(v8, "operation") & 1) != 0)
        {
          objc_msgSend(v8, "urlString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v9);

        }
        objc_msgSend(v8, "urlString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        objc_msgSend(v8, "urlString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v55, "addObject:", v13);
        else
          objc_msgSend(v56, "addObject:", v13);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "statusCode"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "urlString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v55, "count"))
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(v56, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_INFO, "Inserting %zu items", buf, 0xCu);
    }

    v18 = objc_alloc(MEMORY[0x1E0D89CC8]);
    database = self->_database;
    v80 = 0;
    v20 = (void *)objc_msgSend(v18, "initWithDatabase:query:error:", database, CFSTR("INSERT INTO history_items (url, visit_count, visit_count_score, daily_visit_counts, weekly_visit_counts, domain_expansion, should_recompute_derived_visit_counts, status_code)VALUES (?, ?, ?, ?, ?, safari_domainexpansion(?1), 0, ?)"), &v80);
    v21 = v80;
    if (!v20)
    {
      v51 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v21, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _commitPendingItems:].cold.2();
      }
      goto LABEL_51;
    }
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v22 = v55;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v77;
      v53 = &v89;
      do
      {
        v25 = 0;
        v26 = v21;
        do
        {
          if (*(_QWORD *)v77 != v24)
            objc_enumerationMutation(v22);
          *(_QWORD *)buf = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v25);
          v74 = 0;
          location = 0;
          obj = 0;
          v73 = 0;
          urlCompletion = self->_urlCompletion;
          v71 = 0;
          -[WBSHistoryServiceURLCompletion queryVisitCounts:outVisitCountScore:outDailyVisitCounts:outWeeklyVisitCounts:](urlCompletion, "queryVisitCounts:outVisitCountScore:outDailyVisitCounts:outWeeklyVisitCounts:", v53);
          objc_storeStrong(&location, obj);
          objc_storeStrong(&v74, v71);
          v70 = objc_msgSend(v58, "countForObject:", *(_QWORD *)buf);
          objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)buf);
          v28 = objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend((id)v28, "integerValue");
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,unsigned long,long long &,NSData * {__strong}&,NSData * {__strong},long>(v20, buf, &v70, &v73, &location, &v74, &v69);

          v68 = v26;
          LOBYTE(v28) = objc_msgSend(v20, "execute:", &v68);
          v21 = v68;

          if ((v28 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setObject:forKeyedSubscript:", v29, *(_QWORD *)buf);

            objc_msgSend(v20, "reset");
          }
          else
          {
            v30 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v21, "safari_privacyPreservingDescription");
              objc_claimAutoreleasedReturnValue();
              -[WBSHistoryServiceDatabase _commitPendingItems:].cold.3();
            }

          }
          ++v25;
          v26 = v21;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
      }
      while (v23);
    }

    objc_msgSend(v20, "invalidate");
  }
  if (objc_msgSend(v56, "count"))
  {
    v31 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = objc_msgSend(v56, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v32;
      _os_log_impl(&dword_1A3D90000, v31, OS_LOG_TYPE_INFO, "Updating %zu items", buf, 0xCu);
    }

    v33 = objc_alloc(MEMORY[0x1E0D89CC8]);
    v34 = self->_database;
    v67 = 0;
    v35 = objc_msgSend(v33, "initWithDatabase:query:error:", v34, CFSTR("UPDATE history_items SET visit_count = visit_count + ?, visit_count_score = ?, daily_visit_counts = ?, weekly_visit_counts = ?, status_code = ? WHERE id = ?"), &v67);
    v21 = v67;
    if (v35)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v36 = v56;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v88, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v64;
        v54 = 134218242;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v64 != v38)
              objc_enumerationMutation(v36);
            v40 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
            v74 = 0;
            location = 0;
            v73 = 0;
            v70 = 0;
            objc_msgSend(v59, "objectForKeyedSubscript:", v40, v54);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "longValue");

            v70 = v42;
            v43 = self->_urlCompletion;
            v61 = v74;
            v62 = location;
            -[WBSHistoryServiceURLCompletion queryVisitCounts:outVisitCountScore:outDailyVisitCounts:outWeeklyVisitCounts:](v43, "queryVisitCounts:outVisitCountScore:outDailyVisitCounts:outWeeklyVisitCounts:", v40, &v73, &v62, &v61);
            objc_storeStrong(&location, v62);
            objc_storeStrong(&v74, v61);
            *(_QWORD *)buf = objc_msgSend(v58, "countForObject:", v40);
            objc_msgSend(v3, "objectForKeyedSubscript:", v40);
            v44 = objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend((id)v44, "integerValue");
            SafariShared::_WBSSQLiteStatementBindAllParameters<1,unsigned long,long long &,NSData * {__strong}&,NSData * {__strong}&,long,long long &>(v35, buf, &v73, &location, &v74, &v69, &v70);

            v60 = v21;
            LOBYTE(v44) = -[NSObject execute:](v35, "execute:", &v60);
            v45 = v60;

            v21 = v45;
            if ((v44 & 1) == 0)
            {
              v46 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                v47 = v36;
                v48 = v70;
                objc_msgSend(v45, "safari_privacyPreservingDescription");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v54;
                *(_QWORD *)&buf[4] = v48;
                v86 = 2114;
                v87 = v49;
                _os_log_error_impl(&dword_1A3D90000, v46, OS_LOG_TYPE_ERROR, "Failed to update item %lli: %{public}@", buf, 0x16u);

                v36 = v47;
              }

            }
            -[NSObject reset](v35, "reset");

          }
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v88, 16);
        }
        while (v37);
      }

      -[NSObject invalidate](v35, "invalidate");
      v50 = 1;
      v51 = v35;
      goto LABEL_52;
    }
    v51 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v21, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingItems:].cold.1();
    }
LABEL_51:
    v50 = 0;
LABEL_52:

    goto LABEL_53;
  }
  v50 = 1;
LABEL_53:

  return v50;
}

- (BOOL)_commitPendingVisits:(id)a3
{
  id v4;
  WBSSQLiteDatabase *database;
  uint64_t v6;
  id v7;
  id v8;
  WBSSQLiteDatabase *v9;
  id v10;
  id v11;
  WBSSQLiteDatabase *v12;
  id v13;
  id v14;
  WBSSQLiteDatabase *v15;
  id v16;
  NSObject *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  char v30;
  void *v31;
  uint64_t v32;
  sqlite3_int64 *v33;
  uint64_t v34;
  id v35;
  int64_t v36;
  void *v37;
  void *v38;
  sqlite3_int64 *v39;
  double v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  NSMutableArray *v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  char v68;
  void *v69;
  id v70;
  WBSSQLiteDatabase *v71;
  id v72;
  id v73;
  WBSSQLiteDatabase *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  sqlite3_int64 *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  NSObject *v88;
  char v89;
  id v90;
  NSObject *v91;
  sqlite3_int64 *v92;
  void *v93;
  sqlite3_int64 *v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  WBSHistoryServiceEvent *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  BOOL v105;
  NSObject *v106;
  NSMutableArray *obj;
  NSObject *v109;
  NSObject *v110;
  WBSHistoryServiceDatabase *v111;
  SafariShared::LatestVisitInformationMap *v112;
  id v113;
  void *v114;
  NSObject *v115;
  id v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  id v123;
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  sqlite3_int64 **v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  unsigned int v138;
  id v139;
  sqlite3_int64 *v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id v145;
  id v146;
  id v147;
  id v148;
  int64_t v149;
  _QWORD v150[3];
  _QWORD v151[3];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE buf[12];
  __int16 v155;
  void *v156;
  __int16 v157;
  void *v158;
  _BYTE v159[128];
  __int128 v160;
  __int128 v161;
  int v162;
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v113 = a3;
  v149 = -[WBSHistoryServiceDatabase _currentGeneration](self, "_currentGeneration");
  v4 = objc_alloc(MEMORY[0x1E0D89CC8]);
  database = self->_database;
  v148 = 0;
  v6 = objc_msgSend(v4, "initWithDatabase:query:error:", database, CFSTR("SELECT id FROM history_visits WHERE visit_time = ?"), &v148);
  v7 = v148;
  v114 = (void *)v6;
  if (!v6)
  {
    v115 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:].cold.1();
    }
    v105 = 0;
    goto LABEL_99;
  }
  v8 = objc_alloc(MEMORY[0x1E0D89CC8]);
  v9 = self->_database;
  v147 = v7;
  v115 = objc_msgSend(v8, "initWithDatabase:query:error:", v9, CFSTR("INSERT INTO history_visits (history_item, visit_time, title, load_successful, http_non_get, origin, generation, attributes, score)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"), &v147);
  v111 = self;
  v10 = v147;

  if (!v115)
  {
    v110 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:].cold.2();
    }
    v105 = 0;
    goto LABEL_98;
  }
  v11 = objc_alloc(MEMORY[0x1E0D89CC8]);
  v12 = self->_database;
  v146 = v10;
  v110 = objc_msgSend(v11, "initWithDatabase:query:error:", v12, CFSTR("UPDATE history_visits SET title = ? WHERE id = ?"), &v146);
  v13 = v146;

  if (!v110)
  {
    v109 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v13, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:].cold.3();
    }
    v105 = 0;
    goto LABEL_97;
  }
  v14 = objc_alloc(MEMORY[0x1E0D89CC8]);
  v15 = self->_database;
  v145 = v13;
  v109 = objc_msgSend(v14, "initWithDatabase:query:error:", v15, CFSTR("UPDATE history_visits SET attributes = ?, score = ? WHERE id = ?"), &v145);
  v16 = v145;

  if (!v109)
  {
    v17 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v16, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:].cold.4();
    }
    v105 = 0;
    goto LABEL_96;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableArray count](self->_pendingVisits, "count"));
  v17 = objc_claimAutoreleasedReturnValue();
  v160 = 0u;
  v161 = 0u;
  v162 = 1065353216;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v18 = self->_pendingVisits;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v142;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v142 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
        if ((objc_msgSend(v22, "operation") & 1) == 0)
        {
          v140 = 0;
          v132 = v16;
          objc_msgSend(v22, "visitTime");
          *(_QWORD *)buf = v23;
          v134 = &v140;
          v24 = SafariShared::WBSSQLiteDatabaseEnumerate<double,std::tuple<long long &>>(v114, (uint64_t)&v132, (double *)buf, (double *)&v134);
          v25 = v132;

          if ((v24 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v140);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "visitIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v26, v27);

            if ((objc_msgSend(v22, "operation") & 2) == 0)
              goto LABEL_15;
            objc_msgSend(v22, "title");
            v131 = (id)objc_claimAutoreleasedReturnValue();
            SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},long long &>(v110, &v131, &v140);

            v130 = v25;
            v28 = -[NSObject execute:](v110, "execute:", &v130);
            v29 = v130;

            if ((v28 & 1) != 0)
            {
              v25 = v29;
LABEL_15:
              if ((objc_msgSend(v22, "operation") & 4) == 0)
              {
LABEL_32:
                v16 = v25;
                continue;
              }
              *(_QWORD *)buf = objc_msgSend(v22, "attributes");
              v134 = (sqlite3_int64 **)objc_msgSend(v22, "score");
              SafariShared::_WBSSQLiteStatementBindAllParameters<1,unsigned long,unsigned long,long long &>(v109, buf, &v134, &v140);
              v129 = v25;
              v30 = -[NSObject execute:](v109, "execute:", &v129);
              v29 = v129;

              if ((v30 & 1) != 0)
              {
                v25 = v29;
                goto LABEL_32;
              }
              v41 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                v55 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v22, "visitTime");
                objc_msgSend(v55, "dateWithTimeIntervalSinceReferenceDate:");
                v56 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "urlString");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "safari_privacyPreservingDescription");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543875;
                *(_QWORD *)&buf[4] = v56;
                v155 = 2113;
                v156 = v57;
                v157 = 2114;
                v158 = v58;
                _os_log_error_impl(&dword_1A3D90000, v41, OS_LOG_TYPE_ERROR, "Failed to update attributes of visit %{public}@ of item %{private}@: %{public}@", buf, 0x20u);

              }
            }
            else
            {
              v41 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                v47 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v22, "visitTime");
                objc_msgSend(v47, "dateWithTimeIntervalSinceReferenceDate:");
                v48 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "urlString");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "safari_privacyPreservingDescription");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543875;
                *(_QWORD *)&buf[4] = v48;
                v155 = 2113;
                v156 = v49;
                v157 = 2114;
                v158 = v50;
                _os_log_error_impl(&dword_1A3D90000, v41, OS_LOG_TYPE_ERROR, "Failed to update title of visit %{public}@ of item %{private}@: %{public}@", buf, 0x20u);

              }
            }
            v25 = v29;
          }
          else
          {
            v41 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v42 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v22, "visitTime");
              objc_msgSend(v42, "dateWithTimeIntervalSinceReferenceDate:");
              v43 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "urlString");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "safari_privacyPreservingDescription");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543875;
              *(_QWORD *)&buf[4] = v43;
              v155 = 2117;
              v156 = v44;
              v157 = 2114;
              v158 = v45;
              _os_log_error_impl(&dword_1A3D90000, v41, OS_LOG_TYPE_ERROR, "Failed to find ID of visit %{public}@ of item %{sensitive}@: %{public}@", buf, 0x20u);

            }
          }

          goto LABEL_32;
        }
        v140 = 0;
        objc_msgSend(v22, "urlString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "objectForKeyedSubscript:", v31);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (sqlite3_int64 *)objc_msgSend((id)v32, "longLongValue");

        v140 = v33;
        objc_msgSend(v22, "visitTime");
        *(_QWORD *)buf = v34;
        objc_msgSend(v22, "title");
        v139 = (id)objc_claimAutoreleasedReturnValue();
        v138 = objc_msgSend(v22, "loadSuccessful");
        v137 = objc_msgSend(v22, "wasHTTPNonGet");
        v136 = objc_msgSend(v22, "origin");
        v135 = objc_msgSend(v22, "attributes");
        v134 = (sqlite3_int64 **)objc_msgSend(v22, "score");
        SafariShared::_WBSSQLiteStatementBindAllParameters<1,long long &,double,NSString * {__strong},int,int,int,long &,int,unsigned long>(v115, &v140, (double *)buf, &v139, &v138, &v137, &v136, &v149, &v135, &v134);

        v133 = v16;
        LOBYTE(v32) = -[NSObject execute:](v115, "execute:", &v133);
        v35 = v133;

        v16 = v35;
        if ((v32 & 1) != 0)
        {
          v36 = -[WBSSQLiteDatabase lastInsertRowID](v111->_database, "lastInsertRowID");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "visitIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v37, v38);

          -[NSObject reset](v115, "reset");
          v39 = v140;
          objc_msgSend(v22, "visitTime");
          if (SafariShared::LatestVisitInformationMap::update((SafariShared::LatestVisitInformationMap *)&v111->_latestVisitMap, (unint64_t)v39, v36, v40, 0))
          {
            *(_QWORD *)buf = &v140;
            std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)&v160, (unint64_t *)&v140, (uint64_t)&std::piecewise_construct, (_QWORD **)buf)[3] = v36;
          }
        }
        else
        {
          v46 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v51 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v22, "visitTime");
            objc_msgSend(v51, "dateWithTimeIntervalSinceReferenceDate:");
            v52 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "urlString");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "safari_privacyPreservingDescription");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543875;
            *(_QWORD *)&buf[4] = v52;
            v155 = 2113;
            v156 = v53;
            v157 = 2114;
            v158 = v54;
            _os_log_error_impl(&dword_1A3D90000, v46, OS_LOG_TYPE_ERROR, "Failed to insert visit %{public}@ of item %{private}@: %{public}@", buf, 0x20u);

          }
        }
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
    }
    while (v19);
  }

  -[NSObject invalidate](v115, "invalidate");
  -[NSObject invalidate](v110, "invalidate");
  -[NSObject invalidate](v109, "invalidate");
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v59 = v111->_pendingVisits;
  v60 = 0;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v125, v153, 16);
  if (!v61)
    goto LABEL_49;
  v62 = *(_QWORD *)v126;
  do
  {
    v63 = 0;
    v64 = v16;
    do
    {
      if (*(_QWORD *)v126 != v62)
        objc_enumerationMutation(v59);
      objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * v63), "sourceVisitIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v65)
        goto LABEL_43;
      -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v66 == 0;

      if (!v67)
      {
        v60 = 1;
LABEL_43:
        v16 = v64;
        goto LABEL_47;
      }
      *(_QWORD *)buf = 0;
      v124 = v64;
      v140 = (sqlite3_int64 *)buf;
      v68 = SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<long long &>>(v114, (uint64_t)&v124, &v140);
      v16 = v124;

      if ((v68 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)buf);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v69, v65);

      }
      v60 = 1;
LABEL_47:

      ++v63;
      v64 = v16;
    }
    while (v61 != v63);
    v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v125, v153, 16);
  }
  while (v61);
LABEL_49:

  objc_msgSend(v114, "invalidate");
  if ((v60 & 1) == 0)
    goto LABEL_70;
  v70 = objc_alloc(MEMORY[0x1E0D89CC8]);
  v71 = v111->_database;
  v123 = v16;
  v112 = (SafariShared::LatestVisitInformationMap *)objc_msgSend(v70, "initWithDatabase:query:error:", v71, CFSTR("UPDATE history_visits SET redirect_source = ? where id = ?"), &v123);
  v72 = v123;

  if (!v112)
  {
    v104 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v72, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:].cold.5();
    }
    v105 = 0;
LABEL_94:

    v16 = v72;
    goto LABEL_95;
  }
  v73 = objc_alloc(MEMORY[0x1E0D89CC8]);
  v74 = v111->_database;
  v122 = v72;
  v75 = (void *)objc_msgSend(v73, "initWithDatabase:query:error:", v74, CFSTR("UPDATE history_visits SET redirect_destination = ? where id = ?"), &v122);
  v16 = v122;

  if (!v75)
  {
    v106 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v16, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _commitPendingVisits:].cold.6();
    }

    -[SafariShared::LatestVisitInformationMap invalidate](v112, "invalidate");
    v105 = 0;
    v104 = v112;
LABEL_93:
    v72 = v16;
    goto LABEL_94;
  }
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  obj = v111->_pendingVisits;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v118, v152, 16);
  if (v76)
  {
    v77 = *(_QWORD *)v119;
    do
    {
      for (j = 0; j != v76; ++j)
      {
        if (*(_QWORD *)v119 != v77)
          objc_enumerationMutation(obj);
        v79 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * j);
        objc_msgSend(v79, "sourceVisitIdentifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
        {
          v140 = 0;
          objc_msgSend(v79, "visitIdentifier");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = (sqlite3_int64 *)objc_msgSend(v82, "longValue");

          v140 = v83;
          v134 = 0;
          -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v80);
          v84 = objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend((id)v84, "longValue");

          v134 = (sqlite3_int64 **)v85;
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long long &,long long &>(v112, &v134, &v140);
          v117 = v16;
          LOBYTE(v84) = -[SafariShared::LatestVisitInformationMap execute:](v112, "execute:", &v117);
          v86 = v117;

          v87 = v86;
          if ((v84 & 1) == 0)
          {
            v88 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
            {
              v92 = v140;
              objc_msgSend(v87, "safari_privacyPreservingDescription");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v92;
              v155 = 2114;
              v156 = v93;
              _os_log_error_impl(&dword_1A3D90000, v88, OS_LOG_TYPE_ERROR, "Failed to update source of visit %lli: %{public}@", buf, 0x16u);

            }
          }
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long long &,long long &>(v75, &v140, &v134);
          v116 = v87;
          v89 = objc_msgSend(v75, "execute:", &v116);
          v90 = v116;

          v16 = v90;
          if ((v89 & 1) == 0)
          {
            v91 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            {
              v94 = v140;
              objc_msgSend(v16, "safari_privacyPreservingDescription");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v94;
              v155 = 2114;
              v156 = v95;
              _os_log_error_impl(&dword_1A3D90000, v91, OS_LOG_TYPE_ERROR, "Failed to update destionation of visit %lli: %{public}@", buf, 0x16u);

            }
          }
          -[SafariShared::LatestVisitInformationMap reset](v112, "reset");
          objc_msgSend(v75, "reset");
        }

      }
      v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v118, v152, 16);
    }
    while (v76);
  }

  -[SafariShared::LatestVisitInformationMap invalidate](v112, "invalidate");
  objc_msgSend(v75, "invalidate");

LABEL_70:
  v96 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    v97 = -[NSMutableArray count](v111->_pendingVisits, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v97;
    _os_log_impl(&dword_1A3D90000, v96, OS_LOG_TYPE_INFO, "Inserted/Updated %zu visits", buf, 0xCu);
  }

  -[NSMutableArray removeAllObjects](v111->_pendingVisits, "removeAllObjects");
  if (*((_QWORD *)&v161 + 1))
  {
    v98 = [WBSHistoryServiceEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v150[0] = CFSTR("updateLatestVisits");
    -[WBSHistoryServiceDatabase _generateUpdatedLastVisit:](v111, "_generateUpdatedLastVisit:", &v160);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v151[0] = v100;
    v150[1] = CFSTR("updateItems");
    -[WBSHistoryServiceDatabase _generateItemsDictionary:](v111, "_generateItemsDictionary:", &v160);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v151[1] = v101;
    v150[2] = CFSTR("updateVisits");
    -[WBSHistoryServiceDatabase _generateVisitsDictionary:](v111, "_generateVisitsDictionary:", &v160);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v151[2] = v102;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, v150, 3);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = -[WBSHistoryServiceEvent initWithType:time:value:](v98, "initWithType:time:value:", CFSTR("update"), v99, v103);

    -[WBSHistoryServiceDatabase _dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:](v111, "_dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", v104, 0, 0, &__block_literal_global_147);
    v105 = 1;
    goto LABEL_93;
  }
  v105 = 1;
LABEL_95:
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v160);
LABEL_96:

  v13 = v16;
LABEL_97:

  v10 = v13;
LABEL_98:

  v7 = v10;
LABEL_99:

  return v105;
}

void __50__WBSHistoryServiceDatabase__commitPendingVisits___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __50__WBSHistoryServiceDatabase__commitPendingVisits___block_invoke_cold_1();
    }

  }
}

- (int64_t)_permanentIDsForItemIfAvailable:(int64_t)a3
{
  int64_t *v3;
  _QWORD *v4;
  int64_t v6;

  v6 = a3;
  if (a3 < 0)
  {
    v4 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(&self->_temporaryIDToItem.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v6);
    v3 = v4 + 3;
    if (!v4)
      v3 = &v6;
  }
  else
  {
    v3 = &v6;
  }
  return *v3;
}

- (int64_t)_permanentIDsForVisitIfAvailable:(int64_t)a3
{
  int64_t *v3;
  _QWORD *v4;
  int64_t v6;

  v6 = a3;
  if (a3 < 0)
  {
    v4 = std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(&self->_visitForTemporaryID.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v6);
    v3 = v4 + 3;
    if (!v4)
      v3 = &v6;
  }
  else
  {
    v3 = &v6;
  }
  return *v3;
}

- (void)_checkpointWriteAheadLog
{
  void *v3;
  id v4;
  dispatch_block_t v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)os_transaction_create();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__WBSHistoryServiceDatabase__checkpointWriteAheadLog__block_invoke;
  v6[3] = &unk_1E4B2B448;
  v6[4] = self;
  v7 = v3;
  v4 = v3;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, v6);
  _os_activity_initiate(&dword_1A3D90000, "Cleaning WAL", OS_ACTIVITY_FLAG_DETACHED, v5);

}

void __53__WBSHistoryServiceDatabase__checkpointWriteAheadLog__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__WBSHistoryServiceDatabase__checkpointWriteAheadLog__block_invoke_2;
  v4[3] = &unk_1E4B2B448;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __53__WBSHistoryServiceDatabase__checkpointWriteAheadLog__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t buf[4];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "checkpointWriteAheadLogWithLogFrameCount:checkpointedFrameCount:", (char *)&v2 + 4, &v2))
  {
    v1 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v4 = HIDWORD(v2);
      v5 = 1024;
      v6 = v2;
      _os_log_impl(&dword_1A3D90000, v1, OS_LOG_TYPE_INFO, "Checkpointed write ahead log. Log frame count: %d, checkpointed frame count: %d", buf, 0xEu);
    }
  }
}

- (BOOL)_addAutocompleteTrigger:(id)a3 forURL:(id)a4 error:(id *)a5
{
  id v8;
  WBSSQLiteDatabase *database;
  void *v10;
  void *v11;
  id v12;
  int v13;
  BOOL v14;
  id *v16;
  id v17;
  id v18;

  v8 = a3;
  v17 = 0;
  v18 = a4;
  database = self->_database;
  v16 = &v17;
  if ((SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong}&,std::tuple<NSData * {__strong}&>>(database, (uint64_t)a5, CFSTR("SELECT autocomplete_triggers FROM history_items WHERE url = ?"), &v18, &v16) & 1) != 0)
  {
    if (!v17
      || (WBSHistoryDecodeAutocompleteTriggers((uint64_t)v17), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (WBSHistoryAddAutocompleteTriggerToArray(v10, v8)
      && (objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, a5),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = v17,
          v17 = v11,
          v12,
          v17)
      && ((v13 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSData * {__strong}&,NSString * {__strong}&>(self->_database, a5, CFSTR("UPDATE history_items SET autocomplete_triggers = ? WHERE url = ?"), &v17, &v18), v13 == 101)|| !v13))
    {
      -[WBSHistoryServiceURLCompletion updateURLString:autocompleteTriggerData:](self->_urlCompletion, "updateURLString:autocompleteTriggerData:", v18, v17);
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v10 = 0;
  }

  return v14;
}

- (void)addAutocompleteTrigger:(id)a3 forURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && v9)
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__WBSHistoryServiceDatabase_addAutocompleteTrigger_forURL_completionHandler___block_invoke;
    v13[3] = &unk_1E4B39360;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_async(queue, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v12);

  }
}

void __77__WBSHistoryServiceDatabase_addAutocompleteTrigger_forURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = 0;
  objc_msgSend(v2, "_addAutocompleteTrigger:forURL:error:", v3, v4, &v6);
  v5 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)fetchAutocompleteTriggersForURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__WBSHistoryServiceDatabase_fetchAutocompleteTriggersForURLString_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __85__WBSHistoryServiceDatabase_fetchAutocompleteTriggersForURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  v8 = 0;
  v9 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v7 = &v9;
  v3 = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * const {__strong}&,std::tuple<NSData * {__strong}&>>(v2, (uint64_t)&v8, CFSTR("SELECT autocomplete_triggers FROM history_items WHERE url = ?"), (id *)(a1 + 40), &v7);
  v4 = v8;
  if ((v3 & 1) != 0)
  {
    if (v9)
    {
      WBSHistoryDecodeAutocompleteTriggers((uint64_t)v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    if (v5)
      v6 = v5;
    else
      v6 = (void *)MEMORY[0x1E0C9AA60];
    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)recordVisitWithIdentifier:(id)a3 sourceVisit:(id)a4 title:(id)a5 wasHTTPNonGet:(BOOL)a6 loadSuccessful:(BOOL)a7 origin:(int64_t)a8 attributes:(unint64_t)a9 statusCode:(int64_t)a10 completionHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *queue;
  _QWORD block[4];
  id v24;
  WBSHistoryServiceDatabase *v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  BOOL v32;
  BOOL v33;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a11;
  if (v17)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __149__WBSHistoryServiceDatabase_recordVisitWithIdentifier_sourceVisit_title_wasHTTPNonGet_loadSuccessful_origin_attributes_statusCode_completionHandler___block_invoke;
    block[3] = &unk_1E4B3B5A0;
    v29 = a9;
    v24 = v17;
    v25 = self;
    v26 = v18;
    v32 = a6;
    v33 = a7;
    v27 = v19;
    v30 = a8;
    v31 = a10;
    v28 = v20;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v20 + 2))(v20, v21);

  }
}

void __149__WBSHistoryServiceDatabase_recordVisitWithIdentifier_sourceVisit_title_wasHTTPNonGet_loadSuccessful_origin_attributes_statusCode_completionHandler___block_invoke(uint64_t a1)
{
  WBSHistoryServicePendingVisit *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  uint64_t v12;
  WBSHistoryServicePendingVisit *v13;

  v2 = -[WBSHistoryServicePendingVisit initWithWithVisitIdentifier:]([WBSHistoryServicePendingVisit alloc], "initWithWithVisitIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 72);
  v13 = v2;
  if ((v3 & 0xE) == 0)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 272);
    objc_msgSend(*(id *)(a1 + 32), "urlString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastVisitTimeForURLString:", v5);
    v7 = v6;

    if (v7 <= 0.0)
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 32), "visitTime");
    if (v7 >= v8)
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 32), "visitTime");
    v10 = (v9 - v7) / 60.0;
    if (v10 < 1.0)
    {
      v3 |= 2uLL;
LABEL_8:
      v2 = v13;
      goto LABEL_9;
    }
    if (v10 < 8.0)
    {
      v3 |= 4uLL;
      goto LABEL_8;
    }
    v2 = v13;
    if (v10 < 60.0)
      v3 |= 8uLL;
  }
LABEL_9:
  -[WBSHistoryServicePendingVisit setOperation:](v2, "setOperation:", 1);
  -[WBSHistoryServicePendingVisit setSourceVisitIdentifier:](v13, "setSourceVisitIdentifier:", *(_QWORD *)(a1 + 48));
  -[WBSHistoryServicePendingVisit setTitle:](v13, "setTitle:", *(_QWORD *)(a1 + 56));
  -[WBSHistoryServicePendingVisit setWasHTTPNonGet:](v13, "setWasHTTPNonGet:", *(unsigned __int8 *)(a1 + 96));
  -[WBSHistoryServicePendingVisit setLoadSuccessful:](v13, "setLoadSuccessful:", *(unsigned __int8 *)(a1 + 97));
  -[WBSHistoryServicePendingVisit setWasHTTPNonGet:](v13, "setWasHTTPNonGet:", *(unsigned __int8 *)(a1 + 96));
  -[WBSHistoryServicePendingVisit setOrigin:](v13, "setOrigin:", *(_QWORD *)(a1 + 80));
  -[WBSHistoryServicePendingVisit setAttributes:](v13, "setAttributes:", v3);
  -[WBSHistoryServicePendingVisit setStatusCode:](v13, "setStatusCode:", *(_QWORD *)(a1 + 88));
  v11 = WBHistoryVisitWeightForAttributesAndOrigin(v3, *(_QWORD *)(a1 + 80));
  LODWORD(v12) = WBSHistoryVisitScoreForWeightedVisitCount(v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "recordVisit:sourceVisit:title:loadSuccessful:origin:increaseVisitCount:score:statusCode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 97), *(_QWORD *)(a1 + 80), 1, v12, *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "addObject:", v13);
  objc_msgSend(*(id *)(a1 + 40), "_queuePendingUpdates");
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)_updateVisitWithIdentifier:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5 pendingVisit:(id)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v10 = a6;
  v11 = objc_msgSend(v10, "score");
  objc_msgSend(v10, "setAttributes:", objc_msgSend(v10, "attributes") & ~a4);
  objc_msgSend(v10, "setAttributes:", objc_msgSend(v10, "attributes") | a5);
  v12 = objc_msgSend(v10, "score");
  if (v11 != v12)
    -[WBSHistoryServiceURLCompletion updateVisit:oldScore:newScore:completionHandler:](self->_urlCompletion, "updateVisit:oldScore:newScore:completionHandler:", v13, v11, v12, &__block_literal_global_156);

}

- (void)updateVisitWithIdentifier:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;

  v10 = a3;
  v11 = a6;
  if (v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__WBSHistoryServiceDatabase_updateVisitWithIdentifier_removeAttributes_addAttributes_completionHandler___block_invoke;
    block[3] = &unk_1E4B3B5E8;
    block[4] = self;
    v15 = v10;
    v17 = a4;
    v18 = a5;
    v16 = v11;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v13);

  }
}

void __104__WBSHistoryServiceDatabase_updateVisitWithIdentifier_removeAttributes_addAttributes_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  WBSHistoryServicePendingVisit *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE buf[22];
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 216);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "visitIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40));

        if ((v8 & 1) != 0 && (objc_msgSend(v6, "operation") & 5) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_updateVisitWithIdentifier:removeAttributes:addAttributes:pendingVisit:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6);
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          goto LABEL_16;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      if (v3)
        continue;
      break;
    }
  }

  v19 = 0;
  v20 = 0;
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "urlString");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "visitTime");
  v17 = v10;
  *(_QWORD *)buf = &v20;
  *(_QWORD *)&buf[8] = (char *)&v20 + 4;
  LOBYTE(v9) = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong},double,std::tuple<int &,int &>>(v9, (uint64_t)&v19, CFSTR("SELECT origin, attributes FROM history_visits INNER JOIN history_items ON history_visits.history_item = history_items.id WHERE url = ? AND visit_time = ?"), &v18, &v17, (__int128 *)buf);
  v2 = v19;

  if ((v9 & 1) != 0)
  {
    v11 = -[WBSHistoryServicePendingVisit initWithWithVisitIdentifier:]([WBSHistoryServicePendingVisit alloc], "initWithWithVisitIdentifier:", *(_QWORD *)(a1 + 40));
    -[WBSHistoryServicePendingVisit setOrigin:](v11, "setOrigin:", (int)v20);
    -[WBSHistoryServicePendingVisit setAttributes:](v11, "setAttributes:", SHIDWORD(v20));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 32), "_updateVisitWithIdentifier:removeAttributes:addAttributes:pendingVisit:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v11);
    objc_msgSend(*(id *)(a1 + 32), "_queuePendingUpdates");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v12 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "urlString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(*(id *)(a1 + 40), "visitTime");
      objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138740483;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      v26 = 2113;
      v27 = v16;
      _os_log_error_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_ERROR, "Unable to determine existing attributes for visit %{sensitive}@ at %{public}@: %{private}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_16:

}

- (void)updateVisitWithIdentifier:(id)a3 title:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__WBSHistoryServiceDatabase_updateVisitWithIdentifier_title_completionHandler___block_invoke;
    v13[3] = &unk_1E4B39360;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_async(queue, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v12);

  }
}

void __79__WBSHistoryServiceDatabase_updateVisitWithIdentifier_title_completionHandler___block_invoke(uint64_t a1)
{
  WBSHistoryServicePendingVisit *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (WBSHistoryServicePendingVisit *)*(id *)(*(_QWORD *)(a1 + 32) + 216);
  v3 = -[WBSHistoryServicePendingVisit countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v6, "visitIdentifier", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40));

        if ((v8 & 1) != 0)
        {
          objc_msgSend(v6, "setTitle:", *(_QWORD *)(a1 + 48));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "updateVisit:title:databaseID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          goto LABEL_11;
        }
      }
      v3 = -[WBSHistoryServicePendingVisit countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }

  v2 = -[WBSHistoryServicePendingVisit initWithWithVisitIdentifier:]([WBSHistoryServicePendingVisit alloc], "initWithWithVisitIdentifier:", *(_QWORD *)(a1 + 40));
  -[WBSHistoryServicePendingVisit setTitle:](v2, "setTitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "addObject:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_queuePendingUpdates");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_11:

}

- (void)_updateItem:(int64_t)a3 visitCountScore:(int64_t)a4 dailyVisitCounts:(id)a5 weeklyVisitCounts:(id)a6 shouldRecomputeDerivedVisitCounts:(BOOL)a7
{
  id v12;
  id v13;
  WBSSQLiteDatabase *database;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  int64_t v21;
  BOOL v22;

  v12 = a5;
  v13 = a6;
  database = self->_database;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke;
  v17[3] = &unk_1E4B3B610;
  v22 = a7;
  v20 = a3;
  v21 = a4;
  v17[4] = self;
  v18 = v12;
  v19 = v13;
  v15 = v13;
  v16 = v12;
  -[WBSSQLiteDatabase tryToPerformTransactionInBlock:](database, "tryToPerformTransactionInBlock:", v17);

}

uint64_t __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  id v13[5];

  v13[4] = *(id *)MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v13[0] = 0;
    v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long const&>(v2, v13, CFSTR("UPDATE history_items SET should_recompute_derived_visit_counts = 1 WHERE id = ?"), (_QWORD *)(a1 + 56));
    v4 = v13[0];
    v5 = v4;
    if (v3 && v3 != 101)
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke_cold_2();
      }
      goto LABEL_12;
    }
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = v6;
  v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long const&,NSData * const {__strong}&,NSData * const {__strong},long long const&>(v7, &v12, CFSTR("UPDATE history_items SET visit_count_score = ?, daily_visit_counts = ?, weekly_visit_counts = ? WHERE id = ?"), (_QWORD *)(a1 + 64), (_QWORD *)(a1 + 40), (_QWORD *)(a1 + 48), (_QWORD *)(a1 + 56));
  v5 = v12;

  v9 = 1;
  if (v8 && v8 != 101)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke_cold_1();
    }
LABEL_12:

    v9 = 0;
  }

  return v9;
}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__WBSHistoryServiceDatabase_flushWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __56__WBSHistoryServiceDatabase_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int64_t)_currentGeneration
{
  void *v2;
  int64_t v3;

  -[WBSHistoryServiceDatabase _metadataForKey:error:](self, "_metadataForKey:error:", CFSTR("current_generation"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)_lastSyncedGeneration
{
  void *v2;
  int64_t v3;

  -[WBSHistoryServiceDatabase _metadataForKey:error:](self, "_metadataForKey:error:", CFSTR("last_synced_generation"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (id)_clearAllHistoryInsertingTombstoneUpToDate:(id)a3
{
  id v4;
  WBSSQLiteDatabase *database;
  id v6;
  WBSHistoryServiceEvent *v7;
  WBSHistoryServiceEvent *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__81;
  v18 = __Block_byref_object_dispose__82;
  v19 = 0;
  -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:](self, "_startingClearHistoryOperationForStartDate:endDate:", 0, v4);
  database = self->_database;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke;
  v11[3] = &unk_1E4B3B688;
  v11[4] = self;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  LOBYTE(database) = -[WBSSQLiteDatabase tryToPerformTransactionInBlock:](database, "tryToPerformTransactionInBlock:", v11);
  -[WBSHistoryServiceDatabase _finishedClearingHistory](self, "_finishedClearingHistory");
  if ((database & 1) != 0)
  {
    v7 = [WBSHistoryServiceEvent alloc];
    v8 = -[WBSHistoryServiceEvent initWithType:time:value:](v7, "initWithType:time:value:", CFSTR("clear"), v6, MEMORY[0x1E0C9AA70]);
    -[WBSHistoryServiceDatabase _dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:](self, "_dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", v8, 0, 1, 0);

    v9 = 0;
  }
  else
  {
    v9 = (id)v15[5];
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id obj;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  uint64_t (*v41)(uint64_t);
  _BYTE v42[32];
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  uint64_t (*v50)(uint64_t);
  _BYTE v51[32];
  uint64_t v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  v45 = objc_msgSend(*(id *)(a1 + 32), "_currentGeneration");
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x5812000000;
  v40 = __Block_byref_object_copy__163;
  v41 = __Block_byref_object_dispose__164;
  memset(v42, 0, sizeof(v42));
  v43 = 0;
  v44 = 1065353216;
  v36 = *(id *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)v2 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = MEMORY[0x1E0C809B0];
  obj = *(id *)(v5 + 40);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_167;
  v33[3] = &unk_1E4B3B638;
  v33[4] = &v37;
  v34 = (id)MEMORY[0x1A8599ED0](v33);
  LODWORD(v4) = SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * {__strong}&,void({block_pointer} {__strong})(long long)>(v4, (uint64_t)&obj, CFSTR("SELECT id FROM history_visits WHERE visit_time < ?"), &v36, &v34);
  objc_storeStrong((id *)(v5 + 40), obj);

  if ((_DWORD)v4)
  {
    createQueryWithList(CFSTR("SELECT history_items.id FROM history_items LEFT JOIN history_visits ON history_visits.history_item = history_items.id AND history_visits.id NOT IN ("), (uint64_t)(v38 + 6), CFSTR(") GROUP BY history_items.id HAVING COUNT(history_visits.history_item) = 0"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v47 = &v46;
    v48 = 0x5812000000;
    v49 = __Block_byref_object_copy__163;
    v50 = __Block_byref_object_dispose__164;
    memset(v51, 0, sizeof(v51));
    v52 = 0;
    v53 = 1065353216;
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v32 = *(id *)(v9 + 40);
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_2;
    v30[3] = &unk_1E4B3B638;
    v30[4] = &v46;
    v31 = (id)MEMORY[0x1A8599ED0](v30);
    LODWORD(v8) = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(v8, (uint64_t)&v32, v7, &v31);
    objc_storeStrong((id *)(v9 + 40), v32);

    if ((_DWORD)v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v47[9]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      createQueryWithList(CFSTR("SELECT id, url FROM history_items WHERE id IN ("), (uint64_t)(v47 + 6), CFSTR(")"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v6;
      v27[1] = 3221225472;
      v27[2] = __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_3;
      v27[3] = &unk_1E4B3B660;
      v13 = v10;
      v28 = v13;
      v29 = (id)MEMORY[0x1A8599ED0](v27);
      LODWORD(v11) = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long,NSString *)>(v11, 0, v12, &v29);

      if ((_DWORD)v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "_removeSpotlighDonationsForItemURLs:", v13);
      }
      else
      {
        v16 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_6();
      }

    }
    else
    {
      v15 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_7();
    }
    _Block_object_dispose(&v46, 8);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v51[8]);

  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_8();
  }
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v46 = v18;
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  v26 = v19;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,double,long &>(v17, 0, CFSTR("INSERT INTO history_tombstones (start_time, end_time, generation) VALUES (?,?,?)"), (double *)&v46, (double *)&v26, &v45) != 101)
  {
    v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_3();
    }
    goto LABEL_33;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 40), 0, CFSTR("DELETE FROM history_visits")) != 101)
  {
    v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_4();
    }
    goto LABEL_33;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 40), 0, CFSTR("DELETE FROM history_items")) != 101)
  {
    v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_3();
    }
    goto LABEL_33;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 40), 0, CFSTR("DELETE FROM history_items_to_tags")) != 101)
  {
    v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_2();
    }
    goto LABEL_33;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 40), 0, CFSTR("DELETE FROM history_tags")) != 101)
  {
    v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_1();
    }
LABEL_33:

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _clearAllHistoryInsertingTombstoneUpToDate:]_block_invoke");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    v20 = 0;
    goto LABEL_34;
  }
  v20 = 1;
LABEL_34:

  _Block_object_dispose(&v37, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v42[8]);

  return v20;
}

_QWORD *__72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_167(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

_QWORD *__72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

void __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (void)clearAllHistoryInsertingTombstoneUpToDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *queue;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__WBSHistoryServiceDatabase_clearAllHistoryInsertingTombstoneUpToDate_completionHandler___block_invoke;
    block[3] = &unk_1E4B2A278;
    block[4] = self;
    v13 = v7;
    v12 = v6;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v10);

  }
}

uint64_t __89__WBSHistoryServiceDatabase_clearAllHistoryInsertingTombstoneUpToDate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_clearAllHistoryInsertingTombstoneUpToDate:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return objc_msgSend(*(id *)(a1 + 32), "_checkpointWriteAheadLog");
}

- (id)_generateDisposedVisitsForPlan:(void *)a3
{
  void *v4;
  _QWORD *i;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *((_QWORD *)a3 + 23));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = (_QWORD *)*((_QWORD *)a3 + 22); i; i = (_QWORD *)*i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", i[2]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  return v4;
}

- (id)_generateUpdatedLastVisit:(const void *)a3
{
  void *v4;
  _QWORD *i;
  uint64_t v6;
  void *v7;
  void *v8;

  if (*((_QWORD *)a3 + 3))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = (_QWORD *)*((_QWORD *)a3 + 2); i; i = (_QWORD *)*i)
    {
      v6 = i[2];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", i[3]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v8);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_generateItemsDictionary:(const void *)a3
{
  id v5;
  WBSSQLiteDatabase *database;
  void *v7;
  id v8;
  void *v9;
  _QWORD *i;
  uint64_t v11;
  void *v12;
  void *v13;
  WBSHistoryServiceItem *v14;
  void *v15;
  NSObject *v17;
  id v18[5];

  v18[4] = *(id *)MEMORY[0x1E0C80C00];
  if (*((_QWORD *)a3 + 3))
  {
    v5 = objc_alloc(MEMORY[0x1E0D89CC8]);
    database = self->_database;
    v18[0] = 0;
    v7 = (void *)objc_msgSend(v5, "initWithDatabase:query:error:", database, CFSTR("SELECT * FROM history_items WHERE id = ?"), v18);
    v8 = v18[0];
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *((_QWORD *)a3 + 3));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = (_QWORD *)*((_QWORD *)a3 + 2); i; i = (_QWORD *)*i)
      {
        v11 = i[2];
        objc_msgSend(v7, "bindInt64:atParameterIndex:", v11, 1);
        objc_msgSend(v7, "fetch");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "nextObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = -[WBSHistoryServiceItem initWithSQLRow:]([WBSHistoryServiceItem alloc], "initWithSQLRow:", v13);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v15);

          objc_msgSend(v7, "reset");
        }

      }
      objc_msgSend(v7, "invalidate");
    }
    else
    {
      v17 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _generateItemsDictionary:].cold.1();
      }

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_generateVisitsDictionary:(const void *)a3
{
  id v5;
  WBSSQLiteDatabase *database;
  void *v7;
  id v8;
  void *v9;
  uint64_t *i;
  void *v11;
  void *v12;
  WBSHistoryServiceVisit *v13;
  void *v14;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _OWORD v20[2];
  int v21;
  id v22;
  __int128 v23;
  __int128 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)a3 + 3))
  {
    v5 = objc_alloc(MEMORY[0x1E0D89CC8]);
    database = self->_database;
    v22 = 0;
    v7 = (void *)objc_msgSend(v5, "initWithDatabase:query:error:", database, CFSTR("SELECT * FROM history_visits WHERE id = ?"), &v22);
    v8 = v22;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *((_QWORD *)a3 + 3));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 1065353216;
      memset(v20, 0, sizeof(v20));
      v21 = 1065353216;
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)&v23, (unint64_t)(float)*((unint64_t *)a3 + 3));
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v20, vcvtps_u32_f32((float)*((unint64_t *)a3 + 3) / 1.0));
      for (i = (uint64_t *)*((_QWORD *)a3 + 2); i; i = (uint64_t *)*i)
      {
        v19 = *((_OWORD *)i + 1);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v23, (unint64_t *)&v19 + 1, (_QWORD *)&v19 + 1);
      }
      while (*((_QWORD *)&v24 + 1))
      {
        *(_QWORD *)&v19 = *(_QWORD *)(v24 + 16);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::erase(&v23, (uint64_t *)v24);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v20, (unint64_t *)&v19, &v19);
        objc_msgSend(v7, "bindInt64:atParameterIndex:", (_QWORD)v19, 1);
        objc_msgSend(v7, "fetch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "nextObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = -[WBSHistoryServiceVisit initWithSQLRow:]([WBSHistoryServiceVisit alloc], "initWithSQLRow:", v12);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);

          v18 = 0;
          v18 = -[WBSHistoryServiceVisit redirectSource](v13, "redirectSource");
          if (v18
            && !std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v20, (unint64_t *)&v18))
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v23, (unint64_t *)&v18, &v18);
          }
          v17 = 0;
          v17 = -[WBSHistoryServiceVisit redirectDestination](v13, "redirectDestination");
          if (v17)
          {
            if (!std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::find<long long>(v20, (unint64_t *)&v17))std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v23, (unint64_t *)&v17, &v17);
          }
          objc_msgSend(v7, "reset");

        }
      }
      objc_msgSend(v7, "invalidate");
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v20);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v23);
    }
    else
    {
      v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _generateItemsDictionary:].cold.1();
      }

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 tombstoneMode:(unint64_t)a5
{
  id v8;
  id v9;
  WBSHistoryTagDatabaseController *tagController;
  BOOL v11;
  WBSSQLiteDatabase *database;
  id v13;
  id v14;
  char v15;
  WBSHistoryServiceEvent *v16;
  void *v17;
  void *v18;
  WBSHistoryServiceEvent *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  BOOL (*v24)(uint64_t);
  void *v25;
  WBSHistoryServiceDatabase *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t v31;
  id obj;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  __n128 (*v36)(uint64_t, uint64_t);
  uint64_t (*v37)(id *);
  uint64_t v38;
  _BYTE v39[32];
  int v40;
  _BYTE v41[32];
  int v42;
  _BYTE v43[32];
  int v44;
  _BYTE v45[32];
  int v46;
  _BYTE v47[32];
  int v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[2];
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:](self, "_startingClearHistoryOperationForStartDate:endDate:", v8, v9);
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__81;
  v56 = __Block_byref_object_dispose__82;
  v57 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x11012000000;
  v36 = __Block_byref_object_copy__192;
  v37 = __Block_byref_object_dispose__193;
  v38 = 768;
  memset(v39, 0, sizeof(v39));
  memset(v41, 0, sizeof(v41));
  v40 = 1065353216;
  v42 = 1065353216;
  memset(v43, 0, sizeof(v43));
  memset(v45, 0, sizeof(v45));
  v44 = 1065353216;
  v46 = 1065353216;
  memset(v47, 0, sizeof(v47));
  v48 = 1065353216;
  v50 = 0;
  v51 = 0;
  v49 = 0;
  tagController = self->_tagController;
  obj = 0;
  v11 = -[WBSHistoryTagDatabaseController clearTagsFromStartDate:endDate:error:](tagController, "clearTagsFromStartDate:endDate:error:", v8, v9, &obj);
  objc_storeStrong(&v57, obj);
  if (v11)
  {
    database = self->_database;
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __88__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode___block_invoke;
    v25 = &unk_1E4B3B6B0;
    v31 = a5;
    v26 = self;
    v13 = v8;
    v27 = v13;
    v14 = v9;
    v28 = v14;
    v29 = &v52;
    v30 = &v33;
    v15 = -[WBSSQLiteDatabase tryToPerformTransactionInBlock:](database, "tryToPerformTransactionInBlock:", &v22);
    -[WBSHistoryServiceDatabase _finishedClearingHistory](self, "_finishedClearingHistory", v22, v23, v24, v25, v26);
    if ((v15 & 1) != 0)
    {
      -[WBSHistoryServiceDatabase _notifyExecutionOfPlan:](self, "_notifyExecutionOfPlan:", v34 + 6);
      v16 = [WBSHistoryServiceEvent alloc];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = CFSTR("startDate");
      v58[1] = CFSTR("endDate");
      v59[0] = v13;
      v59[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[WBSHistoryServiceEvent initWithType:time:value:](v16, "initWithType:time:value:", CFSTR("clear"), v17, v18);

      -[WBSHistoryServiceDatabase _dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:](self, "_dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", v19, 0, 1, 0);
      v20 = 0;
    }
    else
    {
      v20 = (id)v53[5];
    }

  }
  else
  {
    -[WBSHistoryServiceDatabase _finishedClearingHistory](self, "_finishedClearingHistory");
    v20 = (id)v53[5];
  }
  _Block_object_dispose(&v33, 8);

  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v47);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v45);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v43);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v41);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v39);
  _Block_object_dispose(&v52, 8);

  return v20;
}

BOOL __88__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  _OWORD v23[2];
  int v24;
  _QWORD v25[5];
  id v26;
  id obj;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  uint64_t (*v34)(uint64_t);
  _BYTE v35[32];
  uint64_t v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 72);
  if (!v2
    || (v2 != 3 ? (v3 = objc_msgSend(*(id *)(a1 + 32), "_currentGeneration")) : (v3 = 0),
        *(_QWORD *)&v23[0] = v3,
        v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40),
        objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate"),
        v30 = v5,
        objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceReferenceDate"),
        v29 = v6,
        SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,double,long long const&>(v4, 0, CFSTR("INSERT INTO history_tombstones (start_time, end_time, generation) VALUES (?,?,?)"), (double *)&v30, (double *)&v29, v23) == 101))
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x5812000000;
    v33 = __Block_byref_object_copy__163;
    v34 = __Block_byref_object_dispose__164;
    memset(v35, 0, sizeof(v35));
    v36 = 0;
    v37 = 1065353216;
    v29 = *(id *)(a1 + 40);
    v28 = *(id *)(a1 + 48);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v8 + 40);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __88__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode___block_invoke_2;
    v25[3] = &unk_1E4B3B638;
    v25[4] = &v30;
    v26 = (id)MEMORY[0x1A8599ED0](v25);
    LOBYTE(v7) = SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * {__strong}&,NSDate * {__strong}&,void({block_pointer} {__strong})(long long)>(v7, (uint64_t)&obj, CFSTR("SELECT id FROM history_visits WHERE visit_time >= ? AND visit_time < ?"), &v29, &v28, &v26);
    objc_storeStrong((id *)(v8 + 40), obj);

    if ((v7 & 1) != 0)
    {
      if (!v31[9])
      {
        v13 = 1;
        goto LABEL_15;
      }
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48;
      memset(v23, 0, sizeof(v23));
      v24 = 1065353216;
      objc_msgSend(*(id *)(a1 + 32), "_preparePlan:itemsToDelete:visitsToDelete:afterDate:beforeDate:", v9, v23, v31 + 6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v23);
      if (!v10)
      {
        v22 = 0;
        *(_QWORD *)&v23[0] = 0;
        objc_msgSend(*(id *)(a1 + 32), "_executePlan:outDeletedItemCount:outDeletedVisitCount:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48, v23, &v22);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        v13 = v18 == 0;
        goto LABEL_15;
      }
    }
    v13 = 0;
LABEL_15:

    _Block_object_dispose(&v30, 8);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v35[8]);
    return v13;
  }
  v14 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorMessage");
    objc_claimAutoreleasedReturnValue();
    __88__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode___block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _clearHistoryVisitsAddedAfterDate:beforeDate:tombstoneMode:]_block_invoke");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  return 0;
}

_QWORD *__88__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (void)_notifyExecutionOfPlan:(void *)a3
{
  WBSHistoryServiceEvent *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  WBSHistoryServiceEvent *v13;
  WBSHistoryServiceEvent *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WBSHistoryServiceEvent *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*((id *)a3 + 25), "count"))
  {
    v5 = [WBSHistoryServiceEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = CFSTR("disposedURLs");
    v6 = *((id *)a3 + 25);
    v7 = (void *)objc_msgSend(v6, "copy");
    v27[0] = v7;
    v26[1] = CFSTR("disposedHighLevelDomains");
    v8 = *((id *)a3 + 26);
    v9 = (void *)objc_msgSend(v8, "copy");
    v27[1] = v9;
    v26[2] = CFSTR("disposedHostnames");
    v10 = *((id *)a3 + 27);
    v11 = (void *)objc_msgSend(v10, "copy");
    v27[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WBSHistoryServiceEvent initWithType:time:value:](v5, "initWithType:time:value:", CFSTR("maintenance"), v22, v12);

    -[WBSHistoryServiceDatabase _dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:](self, "_dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", v13, 0, 1, 0);
  }
  if (*((_QWORD *)a3 + 23) | *((_QWORD *)a3 + 13))
  {
    v14 = [WBSHistoryServiceEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = CFSTR("disposedVisits");
    -[WBSHistoryServiceDatabase _generateDisposedVisitsForPlan:](self, "_generateDisposedVisitsForPlan:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    v24[1] = CFSTR("updateLatestVisits");
    v16 = (char *)a3 + 120;
    -[WBSHistoryServiceDatabase _generateUpdatedLastVisit:](self, "_generateUpdatedLastVisit:", (char *)a3 + 120);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    v24[2] = CFSTR("updateItems");
    -[WBSHistoryServiceDatabase _generateItemsDictionary:](self, "_generateItemsDictionary:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v18;
    v24[3] = CFSTR("updateVisits");
    -[WBSHistoryServiceDatabase _generateVisitsDictionary:](self, "_generateVisitsDictionary:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[WBSHistoryServiceEvent initWithType:time:value:](v14, "initWithType:time:value:", CFSTR("maintenance"), v23, v20);

    -[WBSHistoryServiceDatabase _dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:](self, "_dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", v21, 0, 0, 0);
  }
}

- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 tombstoneMode:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  unint64_t v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10 && v11)
  {
    MEMORY[0x1A859A374]();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__WBSHistoryServiceDatabase_clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_completionHandler___block_invoke;
    block[3] = &unk_1E4B3B6D8;
    block[4] = self;
    v18 = v12;
    v16 = v10;
    v17 = v11;
    v19 = a5;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v12 + 2))(v12, v14);

  }
}

void __105__WBSHistoryServiceDatabase_clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_clearHistoryVisitsAddedAfterDate:beforeDate:tombstoneMode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  objc_msgSend(*(id *)(a1 + 32), "_checkpointWriteAheadLog");
  JUMPOUT(0x1A859A380);
}

- (id)_insertTombstonesForURLs:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6
{
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  WBSSQLiteDatabase *database;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  id v39;
  void *v40;
  id v41;
  id v42;
  _BOOL4 v43;
  id obj;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v41 = a4;
  v42 = a5;
  v43 = (a6 & 0xFFFFFFFFFFFFFFFELL) != 2
     && -[WBSHistoryServiceDatabase _shouldEmitLegacyTombstones](self, "_shouldEmitLegacyTombstones", v39);
  v10 = 0;
  v54 = 0;
  if (a6 != 3)
    v10 = -[WBSHistoryServiceDatabase _currentGeneration](self, "_currentGeneration");
  v54 = v10;
  objc_msgSend(v41, "timeIntervalSinceReferenceDate", v39);
  v53 = v11;
  objc_msgSend(v42, "timeIntervalSinceReferenceDate");
  v52 = v12;
  v13 = objc_alloc(MEMORY[0x1E0D89CC8]);
  database = self->_database;
  v51 = 0;
  v15 = (void *)objc_msgSend(v13, "initWithDatabase:query:error:", database, CFSTR("INSERT INTO history_tombstones (url, start_time, end_time, generation) VALUES (?, ?, ?, ?)"), &v51);
  v16 = v51;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v40;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v48;
LABEL_9:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v20);
        objc_msgSend(v21, "urlHash");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v21, "urlSalt");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23 == 0;

          if (!v24)
            break;
        }
        objc_msgSend(v21, "urlString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27 == 0;

        if (!v28)
        {
          if (v43)
          {
            objc_msgSend(v21, "urlString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, CFSTR("url"));

          }
          -[WBSHistoryCrypto salt](self->_crypto, "salt");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "urlString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          WBSHistorySHA512(v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, CFSTR("url_hash"));

          -[WBSHistoryCrypto salt](self->_crypto, "salt");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("url_salt"));
          goto LABEL_19;
        }
LABEL_21:
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v18)
            goto LABEL_9;
          goto LABEL_23;
        }
      }
      objc_msgSend(v21, "urlHash");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("url_hash"));

      objc_msgSend(v21, "urlSalt");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("url_salt"));
LABEL_19:

      -[WBSHistoryCrypto encryptDictionary:](self->_crypto, "encryptDictionary:", v17);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSData * {__strong}&,double const&,double const&,long const&>(v15, &v46, (double *)&v53, (double *)&v52, &v54);
      v45 = v16;
      v33 = objc_msgSend(v15, "execute:", &v45);
      v34 = v45;

      if ((v33 & 1) == 0)
      {
        v36 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v34, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:].cold.2();
        }

        objc_msgSend(v15, "invalidate");
        v16 = v34;

        v35 = v16;
        goto LABEL_27;
      }
      objc_msgSend(v15, "reset");

      v16 = v34;
      goto LABEL_21;
    }
LABEL_23:

    objc_msgSend(v15, "invalidate");
    v35 = 0;
LABEL_27:

  }
  else
  {
    v37 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:].cold.1();
    }

    v16 = v16;
    v35 = v16;
  }

  return v35;
}

- (id)_clearHistoryItems:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  char v15;
  id v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  id v41;
  void *v43;
  void *v44;
  id obj;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  uint64_t (*v65)(uint64_t);
  _BYTE v66[32];
  uint64_t v67;
  int v68;
  id v69;
  id v70;
  _OWORD v71[2];
  int v72;
  uint8_t buf[32];
  int v74;
  _BYTE v75[32];
  int v76;
  _OWORD v77[2];
  int v78;
  _BYTE v79[32];
  int v80;
  _OWORD v81[2];
  int v82;
  id v83;
  id v84;
  id v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v70 = a4;
  v69 = a5;
  v61 = 0;
  v62 = &v61;
  v63 = 0x5812000000;
  v64 = __Block_byref_object_copy__163;
  v65 = __Block_byref_object_dispose__164;
  memset(v66, 0, sizeof(v66));
  v67 = 0;
  v68 = 1065353216;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __83__WBSHistoryServiceDatabase__clearHistoryItems_afterDate_beforeDate_tombstoneMode___block_invoke;
  v59[3] = &unk_1E4B3B638;
  v59[4] = &v61;
  v60 = (id)MEMORY[0x1A8599ED0](v59);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("SELECT id FROM history_items WHERE url = ? LIMIT 1"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("SELECT id FROM history_items WHERE safari_sha512(url, ?) = ? LIMIT 1"));
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("SELECT id FROM history_visits WHERE history_item = ? AND visit_time > ? AND visit_time < ?"));
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v41;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v86, 16);
  v43 = v8;
  if (v9)
  {
    v10 = *(_QWORD *)v56;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v11);
        *(_QWORD *)&v71[0] = 0;
        objc_msgSend(v12, "urlString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (!v14)
        {
          v54 = 0;
          objc_msgSend(v12, "urlString");
          v53 = (id)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v71;
          v15 = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong},std::tuple<long long &>>(v46, (uint64_t)&v54, &v53, (void **)buf);
          v16 = v54;

          if ((v15 & 1) == 0)
          {
            v29 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v16, "safari_privacyPreservingDescription");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v30;
              _os_log_impl(&dword_1A3D90000, v29, OS_LOG_TYPE_INFO, "Unable to locate URL in database: %{public}@", buf, 0xCu);

            }
            v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v12, "urlString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "safari_privacyPreservingDescription");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138478083;
              *(_QWORD *)&buf[4] = v31;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v32;
              _os_log_debug_impl(&dword_1A3D90000, v20, OS_LOG_TYPE_DEBUG, "Unable to locate %{private}@ in database: %{public}@", buf, 0x16u);

            }
LABEL_24:

            goto LABEL_25;
          }
          goto LABEL_8;
        }
        objc_msgSend(v12, "urlSalt");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_25;
        objc_msgSend(v12, "urlHash");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23 == 0;

        if (!v24)
        {
          v52 = 0;
          objc_msgSend(v12, "urlSalt");
          v51 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "urlHash");
          v50 = (id)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v71;
          v25 = SafariShared::WBSSQLiteDatabaseEnumerate<NSData * {__strong},NSData * {__strong},std::tuple<long long &>>(v8, (uint64_t)&v52, &v51, &v50, (uint64_t *)buf);
          v16 = v52;

          if ((v25 & 1) == 0)
          {
            v26 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v16, "safari_privacyPreservingDescription");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v27;
              _os_log_impl(&dword_1A3D90000, v26, OS_LOG_TYPE_INFO, "Unable to locate URL in database: %{public}@", buf, 0xCu);

            }
            v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v16, "safari_privacyPreservingDescription");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v12;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v28;
              _os_log_debug_impl(&dword_1A3D90000, v20, OS_LOG_TYPE_DEBUG, "Unable to locate %@ in database: %{public}@", buf, 0x16u);

            }
            goto LABEL_24;
          }
LABEL_8:
          v17 = v16;
          v49 = v16;
          v18 = SafariShared::WBSSQLiteDatabaseEnumerate<long long &,NSDate * {__strong}&,NSDate * {__strong}&,void({block_pointer} {__strong}&)(long long)>(v44, (uint64_t)&v49, (sqlite3_int64 *)v71, (sqlite3_int64 *)&v70, (sqlite3_int64 *)&v69, (sqlite3_int64 *)&v60);
          v16 = v49;

          if ((v18 & 1) != 0)
            goto LABEL_25;
          v19 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v33 = *(_QWORD *)&v71[0];
            objc_msgSend(v16, "safari_privacyPreservingDescription");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v34;
            _os_log_error_impl(&dword_1A3D90000, v19, OS_LOG_TYPE_ERROR, "Unable to fetch visits for URL with item ID %lli in database: %{public}@", buf, 0x16u);

            v8 = v43;
          }

          v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = *(_QWORD *)&v71[0];
            objc_msgSend(v16, "safari_privacyPreservingDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478339;
            *(_QWORD *)&buf[4] = v12;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v21;
            *(_WORD *)&buf[22] = 2114;
            *(_QWORD *)&buf[24] = v22;
            _os_log_debug_impl(&dword_1A3D90000, v20, OS_LOG_TYPE_DEBUG, "Unable to fetch visits for %{private}@ (%lli) in database: %{public}@", buf, 0x20u);

            v8 = v43;
          }
          goto LABEL_24;
        }
        v16 = 0;
LABEL_25:

        ++v11;
      }
      while (v9 != v11);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v86, 16);
      v9 = v35;
    }
    while (v35);
  }

  objc_msgSend(v46, "invalidate");
  objc_msgSend(v8, "invalidate");
  objc_msgSend(v44, "invalidate");
  if (!a6
    || (-[WBSHistoryServiceDatabase _insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:](self, "_insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:", obj, v70, v69), (v36 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v62[9])
    {
      memset(buf, 0, sizeof(buf));
      memset(v75, 0, sizeof(v75));
      v74 = 1065353216;
      v76 = 1065353216;
      memset(v77, 0, sizeof(v77));
      memset(v79, 0, sizeof(v79));
      v78 = 1065353216;
      v80 = 1065353216;
      memset(v81, 0, sizeof(v81));
      v82 = 1065353216;
      v84 = 0;
      v83 = 0;
      v85 = 0;
      memset(v71, 0, sizeof(v71));
      v72 = 1065353216;
      -[WBSHistoryServiceDatabase _preparePlan:itemsToDelete:visitsToDelete:afterDate:beforeDate:](self, "_preparePlan:itemsToDelete:visitsToDelete:afterDate:beforeDate:", buf, v71, v62 + 6, v70, v69);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v71);
      if (v36)
      {
        v37 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v36, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceDatabase _clearHistoryItems:afterDate:beforeDate:tombstoneMode:].cold.2();
        }

      }
      else
      {
        v47 = 0;
        v48 = 0;
        -[WBSHistoryServiceDatabase _executePlan:outDeletedItemCount:outDeletedVisitCount:](self, "_executePlan:outDeletedItemCount:outDeletedVisitCount:", buf, &v48, &v47);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v38 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v36, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _clearHistoryItems:afterDate:beforeDate:tombstoneMode:].cold.1();
          }

        }
        else
        {
          -[WBSHistoryServiceDatabase _notifyExecutionOfPlan:](self, "_notifyExecutionOfPlan:", buf);
        }
      }

      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v81);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v79);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v77);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v75);
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
    }
    else
    {
      v36 = 0;
    }
  }

  _Block_object_dispose(&v61, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v66[8]);

  return v36;
}

_QWORD *__83__WBSHistoryServiceDatabase__clearHistoryItems_afterDate_beforeDate_tombstoneMode___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (void)clearHistoryItems:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(v12, "count"))
  {
    if (v13 && v14)
    {
      MEMORY[0x1A859A374]();
      queue = self->_queue;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __100__WBSHistoryServiceDatabase_clearHistoryItems_afterDate_beforeDate_tombstoneMode_completionHandler___block_invoke;
      v18[3] = &unk_1E4B39338;
      v18[4] = self;
      v19 = v12;
      v20 = v13;
      v21 = v14;
      v23 = a6;
      v22 = v15;
      dispatch_async(queue, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v15 + 2))(v15, v17);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

void __100__WBSHistoryServiceDatabase_clearHistoryItems_afterDate_beforeDate_tombstoneMode_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__81;
  v18[4] = __Block_byref_object_dispose__82;
  v19 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 40);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __100__WBSHistoryServiceDatabase_clearHistoryItems_afterDate_beforeDate_tombstoneMode_completionHandler___block_invoke_2;
  v11 = &unk_1E4B3B700;
  v16 = v18;
  v12 = v2;
  v13 = v3;
  v14 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 72);
  v15 = v5;
  v17 = v6;
  objc_msgSend(v4, "tryToPerformTransactionInBlock:", &v8);
  objc_msgSend(*(id *)(a1 + 32), "_checkpointWriteAheadLog", v8, v9, v10, v11, v12);
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  MEMORY[0x1A859A380](v7);

  _Block_object_dispose(v18, 8);
}

BOOL __100__WBSHistoryServiceDatabase_clearHistoryItems_afterDate_beforeDate_tombstoneMode_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_clearHistoryItems:afterDate:beforeDate:tombstoneMode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) == 0;
}

- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  MEMORY[0x1A859A374]();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__WBSHistoryServiceDatabase_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __83__WBSHistoryServiceDatabase_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v16 = 0;
  objc_msgSend(v2, "_dateForMetadataKey:error:", CFSTR("clear_history_start_date"), &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v15 = v5;
    objc_msgSend(v7, "_dateForMetadataKey:error:", CFSTR("clear_history_end_date"), &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;

    if (v8)
      v9 = 1;
    else
      v9 = v13 == 0;
    if (v9)
    {
      if (v8)
      {
        v10 = *(void **)(a1 + 32);
        v11 = *(_QWORD *)(a1 + 40);
        if (v3)
          objc_msgSend(v10, "_clearHistoryVisitsAddedAfterDate:beforeDate:tombstoneMode:", v3, v8, 1);
        else
          objc_msgSend(v10, "_clearAllHistoryInsertingTombstoneUpToDate:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

        MEMORY[0x1A859A380]();
      }
      else
      {
        v14 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __83__WBSHistoryServiceDatabase_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_cold_1();
        objc_msgSend(*(id *)(a1 + 32), "_finishedClearingHistory");
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v13 = v5;
  }

}

- (double)_oldestLatestVisit
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("SELECT MIN(visit_time) FROM history_visits WHERE id = safari_latest_visit_for (history_item) AND history_item IN (SELECT id FROM history_items)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleAtIndex:", 0);
  v5 = v4;

  return v5;
}

- (id)_expireOldVisits:(double)a3
{
  NSObject *v5;
  id v6;
  double v7;
  NSObject *v9;
  double v10;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a3;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Expiring old visits. Interval is %f", buf, 0xCu);
  }
  v6 = -[WBSHistoryServiceDatabase _ensureLatestVisitsAreComputed](self, "_ensureLatestVisitsAreComputed");
  -[WBSHistoryServiceDatabase _oldestLatestVisit](self, "_oldestLatestVisit");
  v10 = v7 - a3;
  if (v7 - a3 < 0.0
    || SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double &>(self->_database, 0, CFSTR("DELETE FROM history_visits WHERE visit_time < ?"), &v10) == 101)
  {
    return 0;
  }
  v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
    objc_claimAutoreleasedReturnValue();
    -[WBSHistoryServiceDatabase _expireOldVisits:].cold.1();
  }

  -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _expireOldVisits:]");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)expireOldVisits:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WBSHistoryServiceDatabase_expireOldVisits_completionHandler___block_invoke;
  block[3] = &unk_1E4B393B0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

void __63__WBSHistoryServiceDatabase_expireOldVisits_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_expireOldVisits:", *(double *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (id)_recomputeVisitScores:(void *)a3
{
  NSObject *v5;
  WBSSQLiteDatabase *database;
  char v7;
  id v8;
  WBSSQLiteDatabase *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Recomputing visit scores", buf, 2u);
  }
  database = self->_database;
  v24 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __51__WBSHistoryServiceDatabase__recomputeVisitScores___block_invoke;
  v22[3] = &__block_descriptor_40_e8_v16__0q8l;
  v22[4] = a3;
  v23 = (id)MEMORY[0x1A8599ED0](v22);
  v7 = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v24, CFSTR("SELECT id FROM history_visits WHERE history_item IN (SELECT id FROM history_items WHERE should_recompute_derived_visit_counts <> 0) AND score <> safari_visit_score(attributes, origin)"), &v23);
  v8 = v24;

  if ((v7 & 1) == 0)
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _recomputeVisitScores:].cold.3();
    }

    v17 = v8;
    goto LABEL_13;
  }
  if (*((_QWORD *)a3 + 3))
  {
    v9 = self->_database;
    v21 = v8;
    createQueryWithList(CFSTR("UPDATE history_visits SET score = safari_visit_score(attributes, origin) WHERE id IN ("), (uint64_t)a3, CFSTR(")"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v9, &v21, v10);
    v12 = v21;

    if (!v11 || v11 == 101)
    {
      v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = -[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount");
        *(_DWORD *)buf = 134217984;
        v26 = v14;
        _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Updated score of %zi visits", buf, 0xCu);
      }

      v15 = 0;
      v8 = v12;
      goto LABEL_17;
    }
    v20 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _recomputeVisitScores:].cold.2();
    }

    v17 = v12;
LABEL_13:
    v8 = v17;
    v15 = v17;
    goto LABEL_17;
  }
  v18 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[WBSHistoryServiceDatabase _recomputeVisitScores:].cold.1();
  v15 = 0;
LABEL_17:

  return v15;
}

_QWORD *__51__WBSHistoryServiceDatabase__recomputeVisitScores___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(a1 + 32), &v3, &v3);
}

- (id)_recomputeItemScores:(void *)a3
{
  NSObject *v5;
  WBSSQLiteDatabase *database;
  char v7;
  id v8;
  void *v9;
  WBSSQLiteDatabase *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id v25;
  double v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Recomputing item scores", buf, 2u);
  }
  database = self->_database;
  v29 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __50__WBSHistoryServiceDatabase__recomputeItemScores___block_invoke;
  v27[3] = &__block_descriptor_40_e8_v16__0q8l;
  v27[4] = a3;
  v28 = (id)MEMORY[0x1A8599ED0](v27);
  v7 = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v29, CFSTR("SELECT id FROM history_items WHERE should_recompute_derived_visit_counts <> 0"), &v28);
  v8 = v29;

  if ((v7 & 1) != 0)
  {
    if (*((_QWORD *)a3 + 3))
    {
      createQueryWithList(CFSTR("WITH view_history_visit_ranges_by_item(id, min, max) AS (SELECT history_item AS id, max(min(visit_time), max(visit_time) - ?) AS min, max(visit_time) AS max FROM history_visits WHERE history_visits.history_item IN ("), (uint64_t)a3, CFSTR(") GROUP BY history_visits.history_item), view_history_item_scores(id, visit_count_score, daily_visit_counts, weekly_visit_counts) AS (SELECT history_visits.history_item AS id,sum(score) AS visit_count_score,safari_compute_daily_visit_counts(view_history_visit_ranges_by_item.min, view_history_visit_ranges_by_item.max, visit_time, score) AS daily_visit_counts,safari_compute_weekly_visit_counts(view_history_visit_ranges_by_item.min, view_history_visit_ranges_by_item.max, visit_time, score) AS weekly_visit_counts FROM history_visits INNER JOIN view_history_visit_ranges_by_item ON view_history_visit_ranges_by_item.id = history_visits.history_item WHERE history_visits.visit_time >= view_history_visit_ranges_by_item.min GROUP BY history_visits.history_item) UPDATE history_items SET visit_count_score = (SELECT view_history_item_scores.visit_count_score FROM view_history_item_scores INNER JOIN history_items ON history_items.id = view_history_item_scores.id),daily_visit_counts = (SELECT view_history_item_scores.daily_visit_counts FROM view_history_item_scores INNER JOIN history_items ON history_items.id = view_history_item_scores.id),weekly_visit_counts = (SELECT view_history_item_scores.weekly_visit_counts FROM view_history_item_scores INNER JOIN history_items ON history_items.id = view_history_item_scores.id),should_recompute_derived_visit_counts = 0 WHERE history_items.id IN (SELECT view_history_item_scores.id FROM view_history_item_scores)"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 86400.0 * (double)0x31uLL;
      v10 = self->_database;
      v25 = v8;
      v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double const&>(v10, &v25, v9, &v26);
      v12 = v25;

      v8 = v12;
      if (v11 && v11 != 101)
      {
        v18 = v12;
      }
      else
      {
        if (!-[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount"))
        {
          createQueryWithList(CFSTR("SELECT COUNT(*) FROM history_visits WHERE history_visits.history_item IN ("), (uint64_t)a3, CFSTR(")"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "nextObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
            objc_msgSend(v15, "int64AtIndex:", 0);

          objc_msgSend(v14, "statement");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "invalidate");

          v21 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[WBSHistoryServiceDatabase _recomputeItemScores:].cold.2();

        }
        v22 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = -[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount");
          *(_DWORD *)buf = 134217984;
          v31 = v23;
          _os_log_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_INFO, "Updated score of %zi items", buf, 0xCu);
        }

        v18 = 0;
      }

    }
    else
    {
      v19 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[WBSHistoryServiceDatabase _recomputeItemScores:].cold.1();
      v18 = 0;
    }
  }
  else
  {
    v17 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _recomputeItemScores:].cold.3();
    }

    v8 = v8;
    v18 = v8;
  }

  return v18;
}

_QWORD *__50__WBSHistoryServiceDatabase__recomputeItemScores___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(a1 + 32), &v3, &v3);
}

- (void)recomputeItemScoresWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  MEMORY[0x1A859A374]();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__WBSHistoryServiceDatabase_recomputeItemScoresWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __70__WBSHistoryServiceDatabase_recomputeItemScoresWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  WBSSetInt64 *v5;
  _OWORD v7[2];
  int v8;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  memset(v7, 0, sizeof(v7));
  v8 = 1065353216;
  objc_msgSend(*(id *)(a1 + 32), "_recomputeItemScores:", v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v4 = (*(uint64_t (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v2);
  }
  else
  {
    v5 = -[WBSSetInt64 initWithMovableSet:]([WBSSetInt64 alloc], "initWithMovableSet:", v7);
    (*(void (**)(uint64_t, WBSSetInt64 *, _QWORD))(v3 + 16))(v3, v5, 0);

  }
  MEMORY[0x1A859A380](v4);

  return std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v7);
}

- (id)_findAllRelatedVisits:(const void *)a3 forPlan:(void *)a4 afterDate:(id)a5 beforeDate:(id)a6
{
  void *v10;
  uint64_t *v11;
  _QWORD *v12;
  WBSSQLiteDatabase *database;
  id v14;
  _QWORD *v15;
  void *v16;
  WBSSQLiteDatabase *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v22;
  _QWORD v23[6];
  id v24;
  id v25;
  _QWORD v26[11];
  id v27;
  id v28;
  unint64_t v29[2];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  uint64_t (*v34)(uint64_t);
  _BYTE v35[32];
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t (*v46)(uint64_t);
  _BYTE v47[32];
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  uint64_t (*v54)(uint64_t);
  uint64_t v55;
  _BYTE v56[40];
  id v57;
  id v58;

  v58 = a5;
  v57 = a6;
  v50 = 0;
  v51 = &v50;
  v52 = 0x5812000000;
  v53 = __Block_byref_object_copy__163;
  v54 = __Block_byref_object_dispose__164;
  v55 = 0;
  std::unordered_set<long long>::unordered_set((uint64_t)v56, (uint64_t)a3);
  v42 = 0;
  v43 = &v42;
  v44 = 0x5812000000;
  v45 = __Block_byref_object_copy__163;
  v46 = __Block_byref_object_dispose__164;
  memset(v47, 0, sizeof(v47));
  v48 = 0;
  v49 = 1065353216;
  do
  {
    if (!v51[9])
      goto LABEL_19;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x5812000000;
    v33 = __Block_byref_object_copy__163;
    v34 = __Block_byref_object_dispose__164;
    memset(v35, 0, sizeof(v35));
    v36 = 0;
    v37 = 1065353216;
    createQueryWithList(CFSTR("SELECT id, history_item, redirect_source, redirect_destination FROM history_visits WHERE id IN ("), (uint64_t)(v51 + 6), CFSTR(")"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)a4, vcvtps_u32_f32((float)(unint64_t)(v51[9] + *((_QWORD *)a4 + 3)) / *((float *)a4 + 8)));
    v11 = v51;
    v12 = (_QWORD *)v51[8];
    if (v12)
    {
      do
      {
        v29[0] = v12[2];
        v29[1] = 0;
        std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::pair<long long,int>>((uint64_t)a4, v29, (uint64_t)v29);
        v12 = (_QWORD *)*v12;
      }
      while (v12);
      v11 = v51;
    }
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(v11 + 6);
    database = self->_database;
    v28 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __80__WBSHistoryServiceDatabase__findAllRelatedVisits_forPlan_afterDate_beforeDate___block_invoke;
    v26[3] = &unk_1E4B3B748;
    v26[4] = self;
    v26[5] = &v42;
    v26[9] = a4;
    v26[10] = a4;
    v26[6] = &v30;
    v26[7] = &v50;
    v26[8] = &v38;
    v27 = (id)MEMORY[0x1A8599ED0](v26);
    LOBYTE(database) = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long,long long,long long,long long)>(database, (uint64_t)&v28, v10, &v27);
    v14 = v28;

    if ((database & 1) != 0)
    {
      if (v39[3])
      {
        LODWORD(v15) = 0;
        if (v31[9] && v58 && v57)
        {
          createQueryWithList(CFSTR("SELECT id FROM history_visits WHERE history_item IN ("), (uint64_t)(v31 + 6), CFSTR(") AND redirect_destination IS NULL AND visit_time > ? AND visit_time < ?"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = self->_database;
          v25 = v14;
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __80__WBSHistoryServiceDatabase__findAllRelatedVisits_forPlan_afterDate_beforeDate___block_invoke_2;
          v23[3] = &unk_1E4B3B770;
          v23[4] = &v50;
          v23[5] = a4;
          v24 = (id)MEMORY[0x1A8599ED0](v23);
          SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * {__strong}&,NSDate * {__strong}&,void({block_pointer} {__strong})(long long)>(v17, (uint64_t)&v25, v16, &v58, &v57, &v24);
          v18 = v25;

          v15 = (_QWORD *)v31[8];
          if (v15)
          {
            v19 = (uint64_t)(v43 + 6);
            do
            {
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(v19, v15 + 2, v15 + 2);
              v15 = (_QWORD *)*v15;
            }
            while (v15);
          }
          v10 = v16;
          v14 = v18;
        }
      }
      else
      {
        LODWORD(v15) = 3;
      }
    }
    else
    {
      v14 = v14;
      LODWORD(v15) = 1;
      v22 = v14;
    }

    _Block_object_dispose(&v30, 8);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v35[8]);
    _Block_object_dispose(&v38, 8);
  }
  while (!(_DWORD)v15);
  if ((_DWORD)v15 == 3)
  {
LABEL_19:
    v20 = 0;
    goto LABEL_21;
  }
  v20 = v22;
LABEL_21:
  _Block_object_dispose(&v42, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v47[8]);
  _Block_object_dispose(&v50, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v56);

  return v20;
}

_QWORD *__80__WBSHistoryServiceDatabase__findAllRelatedVisits_forPlan_afterDate_beforeDate___block_invoke(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  _QWORD *VisitID;
  uint64_t v9;
  uint64_t v10;
  _QWORD *result;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t *v16;

  v14 = a3;
  v15 = (_QWORD *)a2;
  v12 = a5;
  v13 = a4;
  if (!std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((_QWORD *)(a1[9] + 40), (unint64_t *)&v14))
  {
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(a1[9] + 80, (unint64_t *)&v14, &v14);
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(a1[9] + 160, (unint64_t *)&v15, &v15);
    if (!std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48), (unint64_t *)&v14))
    {
      VisitID = SafariShared::LatestVisitInformationMap::lastVisitID((SafariShared::LatestVisitInformationMap *)(a1[4] + 88), v14);
      if (VisitID == v15)
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(a1[6] + 8) + 48, (unint64_t *)&v14, &v14);
    }
  }
  v9 = v14;
  v10 = a1[10];
  v16 = (unint64_t *)&v15;
  result = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v10, (unint64_t *)&v15, (uint64_t)&std::piecewise_construct, &v16);
  result[3] = v9;
  if (a4)
  {
    result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((_QWORD *)a1[10], &v13);
    if (!result)
      result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(a1[7] + 8) + 48, &v13, &v13);
  }
  if (a5)
  {
    result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((_QWORD *)a1[10], &v12);
    if (!result)
      result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(a1[7] + 8) + 48, &v12, &v12);
  }
  ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  return result;
}

_QWORD *__80__WBSHistoryServiceDatabase__findAllRelatedVisits_forPlan_afterDate_beforeDate___block_invoke_2(uint64_t a1, unint64_t a2)
{
  _QWORD *result;
  unint64_t v4;

  v4 = a2;
  result = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>(*(_QWORD **)(a1 + 40), &v4);
  if (!result)
    return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v4, &v4);
  return result;
}

- (id)_findAllRelatedVisitsToItems:(const void *)a3 forPlan:(void *)a4
{
  WBSSQLiteDatabase *database;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t (*v19)(uint64_t);
  _OWORD v20[2];
  uint64_t v21;
  int v22;

  v15 = 0;
  v16 = &v15;
  v17 = 0x5812000000;
  v18 = __Block_byref_object_copy__163;
  v19 = __Block_byref_object_dispose__164;
  memset(v20, 0, sizeof(v20));
  v21 = 0;
  v22 = 1065353216;
  database = self->_database;
  v14 = 0;
  createQueryWithList(CFSTR("SELECT id FROM history_visits WHERE history_item IN ("), (uint64_t)a3, CFSTR(")"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__WBSHistoryServiceDatabase__findAllRelatedVisitsToItems_forPlan___block_invoke;
  v12[3] = &unk_1E4B3B638;
  v12[4] = &v15;
  v13 = (id)MEMORY[0x1A8599ED0](v12);
  LOBYTE(database) = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v14, v7, &v13);
  v8 = v14;

  if ((database & 1) != 0)
  {
    -[WBSHistoryServiceDatabase _findAllRelatedVisits:forPlan:afterDate:beforeDate:](self, "_findAllRelatedVisits:forPlan:afterDate:beforeDate:", v16 + 6, a4, 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v8;
  }
  v10 = v9;
  _Block_object_dispose(&v15, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v20 + 8);

  return v10;
}

_QWORD *__66__WBSHistoryServiceDatabase__findAllRelatedVisitsToItems_forPlan___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (id)_findObsoleteItemsForPlan:(void *)a3
{
  NSObject *v5;
  void *v6;
  WBSSQLiteDatabase *database;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v5 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Searching for obsolete items", buf, 2u);
  }
  if (!*((_QWORD *)a3 + 23))
    return 0;
  createQueryWithList(CFSTR("SELECT history_items.id FROM history_items LEFT JOIN history_visits ON history_visits.history_item = history_items.id AND history_visits.id NOT IN ("), (uint64_t)a3 + 160, CFSTR(") GROUP BY history_items.id HAVING COUNT(history_visits.history_item) = 0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v13 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__WBSHistoryServiceDatabase__findObsoleteItemsForPlan___block_invoke;
  v11[3] = &__block_descriptor_40_e8_v16__0q8l;
  v11[4] = a3;
  v12 = (id)MEMORY[0x1A8599ED0](v11);
  LOBYTE(database) = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v13, v6, &v12);
  v8 = v13;

  if ((database & 1) != 0)
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

_QWORD *__55__WBSHistoryServiceDatabase__findObsoleteItemsForPlan___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(a1 + 32) + 40, &v3, &v3);
}

- (id)_preparePlan:(void *)a3 itemsToDelete:(const void *)a4 visitsToDelete:(const void *)a5 afterDate:(id)a6 beforeDate:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  _QWORD *i;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_INFO, "Preparing plan", (uint8_t *)&v23, 2u);
  }
  for (i = (_QWORD *)*((_QWORD *)a4 + 2); i; i = (_QWORD *)*i)
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)a3 + 40, i + 2, i + 2);
  if (!*((_QWORD *)a5 + 3)
    || (-[WBSHistoryServiceDatabase _findAllRelatedVisits:forPlan:afterDate:beforeDate:](self, "_findAllRelatedVisits:forPlan:afterDate:beforeDate:", a5, a3, v12, v13), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!*((_QWORD *)a4 + 3)
      || (-[WBSHistoryServiceDatabase _findAllRelatedVisitsToItems:forPlan:](self, "_findAllRelatedVisitsToItems:forPlan:", a4, a3), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[WBSHistoryServiceDatabase _findObsoleteItemsForPlan:](self, "_findObsoleteItemsForPlan:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        SafariShared::DeletionPlan::sanitizeItemTouched((uint64_t *)a3);
        SafariShared::DeletionPlan::sanitizeVisitsToDelete(a3);
        v17 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = *((_QWORD *)a3 + 8);
          v19 = *((_QWORD *)a3 + 23);
          v23 = 134218240;
          v24 = v18;
          v25 = 2048;
          v26 = v19;
          _os_log_impl(&dword_1A3D90000, v17, OS_LOG_TYPE_INFO, "Plan will delete %zu items, %zu visits", (uint8_t *)&v23, 0x16u);
        }
        v20 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = *((_QWORD *)a3 + 13);
          v23 = 134217984;
          v24 = v21;
          _os_log_impl(&dword_1A3D90000, v20, OS_LOG_TYPE_INFO, "Plan will modify %zu items", (uint8_t *)&v23, 0xCu);
        }
        v16 = 0;
      }
    }
  }

  return v16;
}

- (unint64_t)_countOfItems
{
  WBSSQLiteDatabase *database;
  sqlite3_int64 *v4;
  unint64_t v5;

  database = self->_database;
  v4 = (sqlite3_int64 *)&v5;
  v5 = 0;
  SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<long long &>>(database, 0, CFSTR("SELECT count(*) FROM history_items"), &v4);
  return v5;
}

- (id)_deleteOldestItems:(unint64_t)a3 forPlan:(void *)a4
{
  char *v6;
  void *v7;
  void *v8;
  WBSSQLiteDatabase *database;
  char v10;
  id v11;
  uint64_t *v12;
  _QWORD *v13;
  id v14;
  void *v15;
  unint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t (*v25)(uint64_t);
  _OWORD v26[2];
  uint64_t v27;
  int v28;

  v6 = (char *)a4 + 40;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(") GROUP BY history_items.id ORDER BY MAX(visit_time) LIMIT %zu"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  createQueryWithList(CFSTR("SELECT history_items.id FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE history_items.id NOT IN ("), (uint64_t)v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x5812000000;
  v24 = __Block_byref_object_copy__163;
  v25 = __Block_byref_object_dispose__164;
  memset(v26, 0, sizeof(v26));
  v27 = 0;
  v28 = 1065353216;
  database = self->_database;
  v20 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__WBSHistoryServiceDatabase__deleteOldestItems_forPlan___block_invoke;
  v18[3] = &unk_1E4B3B638;
  v18[4] = &v21;
  v19 = (id)MEMORY[0x1A8599ED0](v18);
  v10 = SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v20, v8, &v19);
  v11 = v20;

  if ((v10 & 1) != 0)
  {
    v12 = v22;
    v13 = (_QWORD *)v22[8];
    if (v13)
    {
      do
      {
        v17 = v13[2];
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v6, &v17, &v17);
        v13 = (_QWORD *)*v13;
      }
      while (v13);
      v12 = v22;
    }
    -[WBSHistoryServiceDatabase _findAllRelatedVisitsToItems:forPlan:](self, "_findAllRelatedVisitsToItems:forPlan:", v12 + 6, a4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v11;
  }
  v15 = v14;
  _Block_object_dispose(&v21, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v26 + 8);

  return v15;
}

_QWORD *__56__WBSHistoryServiceDatabase__deleteOldestItems_forPlan___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (id)_preparePlan:(void *)a3 ageLimit:(double)a4 itemCountLimit:(unint64_t)a5
{
  WBSSQLiteDatabase *database;
  char v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t (*v28)(uint64_t);
  _OWORD v29[2];
  uint64_t v30;
  int v31;
  double v32;
  uint8_t buf[32];
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x5812000000;
  v27 = __Block_byref_object_copy__163;
  v28 = __Block_byref_object_dispose__164;
  memset(v29, 0, sizeof(v29));
  v30 = 0;
  v31 = 1065353216;
  database = self->_database;
  v23 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__WBSHistoryServiceDatabase__preparePlan_ageLimit_itemCountLimit___block_invoke;
  v21[3] = &unk_1E4B3B638;
  v21[4] = &v24;
  v22 = (id)MEMORY[0x1A8599ED0](v21, a2);
  v9 = SafariShared::WBSSQLiteDatabaseEnumerate<double &,void({block_pointer} {__strong})(long long)>(database, (uint64_t)&v23, CFSTR("SELECT id FROM history_visits WHERE visit_time < ?"), &v32, &v22);
  v10 = v23;

  if ((v9 & 1) == 0)
  {
    v14 = v10;
    goto LABEL_13;
  }
  memset(buf, 0, sizeof(buf));
  v34 = 1065353216;
  v11 = -[WBSHistoryServiceDatabase _preparePlan:itemsToDelete:visitsToDelete:afterDate:beforeDate:](self, "_preparePlan:itemsToDelete:visitsToDelete:afterDate:beforeDate:", a3, buf, v25 + 6, 0, 0);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
  v12 = -[WBSHistoryServiceDatabase _countOfItems](self, "_countOfItems");
  v13 = *((_QWORD *)a3 + 8);
  if (v12 == v13)
    goto LABEL_11;
  if (v12 - v13 <= a5)
  {
LABEL_7:
    v15 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *((_QWORD *)a3 + 8);
      v17 = *((_QWORD *)a3 + 23);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1A3D90000, v15, OS_LOG_TYPE_INFO, "Plan will delete %zu items, %zu visits", buf, 0x16u);
    }
    v18 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *((_QWORD *)a3 + 13);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_1A3D90000, v18, OS_LOG_TYPE_INFO, "Plan will modify %zu items", buf, 0xCu);
    }
LABEL_11:
    v14 = 0;
    goto LABEL_13;
  }
  -[WBSHistoryServiceDatabase _deleteOldestItems:forPlan:](self, "_deleteOldestItems:forPlan:", v12 - a5 - v13, a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[WBSHistoryServiceDatabase _findObsoleteItemsForPlan:](self, "_findObsoleteItemsForPlan:", a3);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      SafariShared::DeletionPlan::sanitizeItemTouched((uint64_t *)a3);
      SafariShared::DeletionPlan::sanitizeVisitsToDelete(a3);
      goto LABEL_7;
    }
  }
LABEL_13:
  _Block_object_dispose(&v24, 8);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v29 + 8);

  return v14;
}

_QWORD *__66__WBSHistoryServiceDatabase__preparePlan_ageLimit_itemCountLimit___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = a2;
  return std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (void)deletionPlanForItemsToDelete:(id)a3 visitsToDelete:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__WBSHistoryServiceDatabase_deletionPlanForItemsToDelete_visitsToDelete_completionHandler___block_invoke;
  v15[3] = &unk_1E4B39360;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __91__WBSHistoryServiceDatabase_deletionPlanForItemsToDelete_visitsToDelete_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  WBSSetInt64 *v4;
  WBSSetInt64 *v5;
  WBSSetInt64 *v6;
  _OWORD v8[2];
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;
  _OWORD v14[2];
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  id v18;
  id v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  memset(v8, 0, sizeof(v8));
  LODWORD(v9) = 1065353216;
  memset(v10, 0, sizeof(v10));
  LODWORD(v11) = 1065353216;
  memset(v12, 0, sizeof(v12));
  LODWORD(v13) = 1065353216;
  memset(v14, 0, sizeof(v14));
  LODWORD(v15) = 1065353216;
  memset(v16, 0, sizeof(v16));
  LODWORD(v17) = 1065353216;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_preparePlan:itemsToDelete:visitsToDelete:afterDate:beforeDate:", v8, objc_msgSend(*(id *)(a1 + 40), "set", 0, 0, 0, 0, v9, 0, 0, 0, 0, v11, 0, 0, 0,
      0,
      v13,
      0,
      0,
      0,
      0,
      v15,
      0,
      0,
      0,
      0,
      v17),
    objc_msgSend(*(id *)(a1 + 48), "set"),
    0,
    0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))(v3 + 16))(*(_QWORD *)(a1 + 56), 0, 0, 0, v2);
  }
  else
  {
    v4 = -[WBSSetInt64 initWithMovableSet:]([WBSSetInt64 alloc], "initWithMovableSet:", v10);
    v5 = -[WBSSetInt64 initWithMovableSet:]([WBSSetInt64 alloc], "initWithMovableSet:", v16);
    v6 = -[WBSSetInt64 initWithMovableSet:]([WBSSetInt64 alloc], "initWithMovableSet:", v12);
    (*(void (**)(uint64_t, WBSSetInt64 *, WBSSetInt64 *, WBSSetInt64 *, _QWORD))(v3 + 16))(v3, v4, v5, v6, 0);

  }
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v16);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v14);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v12);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v10);
  return std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v8);
}

- (void)deletionPlanForAgeLimit:(double)a3 itemCountLimit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  unint64_t v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__WBSHistoryServiceDatabase_deletionPlanForAgeLimit_itemCountLimit_completionHandler___block_invoke;
  v11[3] = &unk_1E4B3B798;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

uint64_t __86__WBSHistoryServiceDatabase_deletionPlanForAgeLimit_itemCountLimit_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  WBSSetInt64 *v4;
  WBSSetInt64 *v5;
  WBSSetInt64 *v6;
  _OWORD v8[2];
  int v9;
  _OWORD v10[2];
  int v11;
  _OWORD v12[2];
  int v13;
  _OWORD v14[2];
  int v15;
  _OWORD v16[2];
  int v17;
  id v18;
  id v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  memset(v8, 0, sizeof(v8));
  v9 = 1065353216;
  memset(v10, 0, sizeof(v10));
  v11 = 1065353216;
  memset(v12, 0, sizeof(v12));
  v13 = 1065353216;
  memset(v14, 0, sizeof(v14));
  v15 = 1065353216;
  memset(v16, 0, sizeof(v16));
  v17 = 1065353216;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_preparePlan:ageLimit:itemCountLimit:", v8, *(_QWORD *)(a1 + 56), *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))(v3 + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, v2);
  }
  else
  {
    v4 = -[WBSSetInt64 initWithMovableSet:]([WBSSetInt64 alloc], "initWithMovableSet:", v10);
    v5 = -[WBSSetInt64 initWithMovableSet:]([WBSSetInt64 alloc], "initWithMovableSet:", v16);
    v6 = -[WBSSetInt64 initWithMovableSet:]([WBSSetInt64 alloc], "initWithMovableSet:", v12);
    (*(void (**)(uint64_t, WBSSetInt64 *, WBSSetInt64 *, WBSSetInt64 *, _QWORD))(v3 + 16))(v3, v4, v5, v6, 0);

  }
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v16);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v14);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v12);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v10);
  return std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v8);
}

- (id)_collectDeletedURLsForPlan:(void *)a3
{
  char *v4;
  void *v5;
  WBSSQLiteDatabase *database;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  if (*((_QWORD *)a3 + 8))
  {
    v4 = (char *)a3 + 40;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    database = self->_database;
    createQueryWithList(CFSTR("SELECT id, url FROM history_items WHERE id IN ("), (uint64_t)v4, CFSTR(")"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__WBSHistoryServiceDatabase__collectDeletedURLsForPlan___block_invoke;
    v10[3] = &unk_1E4B3B660;
    v8 = v5;
    v11 = v8;
    v12 = (id)MEMORY[0x1A8599ED0](v10);
    SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(long long,NSString *)>(database, 0, v7, &v12);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __56__WBSHistoryServiceDatabase__collectDeletedURLsForPlan___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)_collectDeletedHighLevelDomainsForPlan:(void *)a3
{
  void *v6;
  void *v7;
  WBSSQLiteDatabase *database;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (!*((_QWORD *)a3 + 8))
    return MEMORY[0x1E0C9AA60];
  if (objc_msgSend(*((id *)a3 + 27), "count"))
  {
    -[WBSHistoryServiceDatabase _collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan:](self, "_collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan:", a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    createQueryWithList(CFSTR("WITH deleted_item_ids AS (SELECT id FROM history_items WHERE id IN ("), (uint64_t)a3 + 40, CFSTR(")), deleted_domains_with_counts AS (SELECT safari_high_level_domain(url) AS deleted_domain, COUNT(*) AS deleted_domain_count FROM history_items WHERE id IN (SELECT id FROM deleted_item_ids) GROUP BY deleted_domain) SELECT safari_high_level_domain(url) AS domain FROM history_items WHERE domain IN (SELECT deleted_domain FROM deleted_domains_with_counts) GROUP BY domain HAVING (COUNT(*) - (SELECT deleted_domain_count FROM deleted_domains_with_counts WHERE deleted_domain = safari_high_level_domain(url))) <= 0"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    database = self->_database;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsForPlan___block_invoke;
    v10[3] = &unk_1E4B2B6D0;
    v9 = v7;
    v11 = v9;
    v12 = (id)MEMORY[0x1A8599ED0](v10);
    SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(NSString *)>(database, 0, v6, &v12);

    return v9;
  }
}

uint64_t __68__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsForPlan___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan:(void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t i;
  WBSSQLiteDatabase *database;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  void (**v40)(_QWORD, _QWORD);
  _QWORD v41[5];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*((id *)a3 + 27), "safari_mapObjectsUsingBlock:", &__block_literal_global_241);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v7, "mutableCopy");

  v8 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke_2;
  v41[3] = &__block_descriptor_40_e27___NSString_16__0__NSArray_8l;
  v41[4] = a3;
  v30 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8599ED0](v41);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v31;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke_3;
  v36[3] = &unk_1E4B3B800;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v37 = v10;
  v11 = v27;
  v38 = v11;
  v40 = v30;
  v12 = v28;
  v39 = v12;
  v29 = v10;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v36);
  if (objc_msgSend(v10, "count"))
  {
    ((void (**)(_QWORD, id))v30)[2](v30, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

    v14 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v12, "addObject:", v14);

    v9 = v31;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v11, "count"); ++i)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    database = self->_database;
    objc_msgSend(v11, "objectAtIndexedSubscript:", i);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSQLiteDatabase fetchQuery:stringArguments:](database, "fetchQuery:stringArguments:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "stringAtIndex:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v24);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v21);
    }

    v9 = v31;
  }
  objc_msgSend(v9, "minusSet:", v15);
  objc_msgSend(v9, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "safari_highLevelDomainFromHost");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(CFSTR("?"), "safari_stringByRepeatingWithCount:joinedByString:", objc_msgSend(v3, "count"), CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT safari_high_level_domain(url) FROM history_items WHERE safari_high_level_domain(url) IN (%@) AND NOT id IN ("), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  createQueryWithList(v5, *(_QWORD *)(a1 + 32) + 40, CFSTR(")"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __88__WBSHistoryServiceDatabase__collectDeletedHighLevelDomainsFromDeletedHostnamesForPlan___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0x64)
  {
    v3 = *(void **)(a1 + 40);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    v5 = *(void **)(a1 + 48);
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }

}

- (id)_collectDeletedHostnamesForPlan:(void *)a3
{
  void *v4;
  void *v5;
  WBSSQLiteDatabase *database;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  if (!*((_QWORD *)a3 + 8))
    return MEMORY[0x1E0C9AA60];
  createQueryWithList(CFSTR("WITH deleted_item_ids AS (SELECT id FROM history_items WHERE id IN ("), (uint64_t)a3 + 40, CFSTR(")), deleted_hostnames_with_counts AS (SELECT safari_hostname(url) AS deleted_hostname, COUNT(*) AS deleted_hostname_count FROM history_items WHERE id IN (SELECT id FROM deleted_item_ids) GROUP BY deleted_hostname) SELECT safari_hostname(url) AS hostname FROM history_items WHERE hostname IN (SELECT deleted_hostname FROM deleted_hostnames_with_counts) GROUP BY hostname HAVING (COUNT(*) - (SELECT deleted_hostname_count FROM deleted_hostnames_with_counts WHERE deleted_hostname = safari_hostname(url))) <= 0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__WBSHistoryServiceDatabase__collectDeletedHostnamesForPlan___block_invoke;
  v9[3] = &unk_1E4B2B6D0;
  v7 = v5;
  v10 = v7;
  v11 = (id)MEMORY[0x1A8599ED0](v9);
  SafariShared::WBSSQLiteDatabaseEnumerate<void({block_pointer} {__strong})(NSString *)>(database, 0, v4, &v11);

  return v7;
}

uint64_t __61__WBSHistoryServiceDatabase__collectDeletedHostnamesForPlan___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_executePlan:(void *)a3 outDeletedItemCount:(unint64_t *)a4 outDeletedVisitCount:(unint64_t *)a5
{
  char *v9;
  void *v10;
  WBSSQLiteDatabase *database;
  int v12;
  id v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  WBSSQLiteDatabase *v24;
  void *v25;
  int v26;
  WBSHistoryServiceURLCompletion *urlCompletion;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  WBSSQLiteDatabase *v34;
  void *v35;
  int v36;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3 + 160;
  if (*((_QWORD *)a3 + 23))
  {
    createQueryWithList(CFSTR("WITH view_visit_count_adjustments AS(SELECT history_item AS id, COUNT(*) AS count, TOTAL(score) AS total_score FROM history_visits WHERE history_visits.id IN ("), (uint64_t)v9, CFSTR(") GROUP BY history_item) UPDATE history_items SET visit_count = MAX(1, visit_count - (SELECT view_visit_count_adjustments.count FROM view_visit_count_adjustments WHERE view_visit_count_adjustments.id = history_items.id)), visit_count_score = MAX(0, visit_count_score - (SELECT view_visit_count_adjustments.total_score FROM view_visit_count_adjustments WHERE view_visit_count_adjustments.id = history_items.id)), should_recompute_derived_visit_counts = 1 WHERE history_items.id IN (SELECT view_visit_count_adjustments.id FROM view_visit_count_adjustments)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    database = self->_database;
    v40 = 0;
    v12 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, &v40, v10);
    v13 = v40;
    if (v12 && v12 != 101)
    {

      return v13;
    }
    v14 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = -[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount");
      *(_DWORD *)buf = 67109120;
      LODWORD(v42) = v15;
      _os_log_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_INFO, "Updated %i visit scores", buf, 8u);
    }

  }
  if (*((_QWORD *)a3 + 8))
  {
    -[WBSHistoryServiceDatabase _collectDeletedURLsForPlan:](self, "_collectDeletedURLsForPlan:", a3);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)a3 + 25);
    *((_QWORD *)a3 + 25) = v16;

    -[WBSHistoryServiceDatabase _collectDeletedHostnamesForPlan:](self, "_collectDeletedHostnamesForPlan:", a3);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)a3 + 27);
    *((_QWORD *)a3 + 27) = v18;

    -[WBSHistoryServiceDatabase _collectDeletedHighLevelDomainsForPlan:](self, "_collectDeletedHighLevelDomainsForPlan:", a3);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)a3 + 26);
    *((_QWORD *)a3 + 26) = v20;

    v22 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = *((_QWORD *)a3 + 8);
      *(_DWORD *)buf = 134217984;
      v42 = v23;
      _os_log_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_INFO, "Deleting %zu items", buf, 0xCu);
    }
    v24 = self->_database;
    v39 = 0;
    createQueryWithList(CFSTR("DELETE FROM history_items WHERE id IN ("), (uint64_t)a3 + 40, CFSTR(")"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v24, &v39, v25);
    v13 = v39;

    if (v26 && v26 != 101)
      return v13;
    -[WBSHistoryServiceDatabase _removeSpotlighDonationsForItemURLs:](self, "_removeSpotlighDonationsForItemURLs:", *((_QWORD *)a3 + 25));
    if (a4)
      *a4 = -[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount");
    SafariShared::LatestVisitInformationMap::removeItems((uint64_t *)&self->_latestVisitMap, (uint64_t)a3 + 40);
    urlCompletion = self->_urlCompletion;
    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = *((id *)a3 + 25);
    objc_msgSend(v29, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSHistoryServiceURLCompletion removeURLStrings:](urlCompletion, "removeURLStrings:", v31);

  }
  if (*((_QWORD *)a3 + 23))
  {
    v32 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = *((_QWORD *)a3 + 23);
      *(_DWORD *)buf = 134217984;
      v42 = v33;
      _os_log_impl(&dword_1A3D90000, v32, OS_LOG_TYPE_INFO, "Deleting %zu visits", buf, 0xCu);
    }
    v34 = self->_database;
    v38 = 0;
    createQueryWithList(CFSTR("DELETE FROM history_visits WHERE id IN ("), (uint64_t)v9, CFSTR(")"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v34, &v38, v35);
    v13 = v38;

    if (!v36 || v36 == 101)
    {
      if (a5)
        *a5 = -[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount");

      goto LABEL_23;
    }
    return v13;
  }
LABEL_23:
  if (*((_QWORD *)a3 + 13))
  {
    -[WBSHistoryServiceDatabase _recomputeLatestVisitsForItems:error:](self, "_recomputeLatestVisitsForItems:error:", (char *)a3 + 80, 0);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__move_assign((uint64_t)a3 + 120, (uint64_t *)buf);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
  }
  return 0;
}

- (void)_removeSpotlighDonationsForItemURLs:(id)a3
{
  void *v4;
  NSString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if (!-[WBSHistoryServiceDatabase _isTesting](self, "_isTesting"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_databaseID;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v15;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          if (v10)
            v11 = v5 == 0;
          else
            v11 = 1;
          if (v11)
          {
            v12 = WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "URL or Profile ID were malformed when clearing spotlight donation for history items.", buf, 2u);
            }
          }
          else
          {
            +[WBSSiriIntelligenceDonor historyItemIdentifierForURL:profileIdentifier:](WBSSiriIntelligenceDonor, "historyItemIdentifierForURL:profileIdentifier:", v10, v5);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
    {
      +[WBSSiriIntelligenceDonor sharedInstance](WBSSiriIntelligenceDonor, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeCoreSpotlightDataWithIDs:completionHandler:", v4, 0);

    }
  }

}

- (void)performMaintenanceWithAgeLimit:(double)a3 itemCountLimit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  double v14;
  unint64_t v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v17 = a3;
    v18 = 2048;
    v19 = a4;
    _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "Starting maintenance. Age Limit is %f. Item Count Limit is %zu", buf, 0x16u);
  }
  MEMORY[0x1A859A374]();
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke;
  v12[3] = &unk_1E4B3B798;
  v12[4] = self;
  v13 = v8;
  v14 = a3;
  v15 = a4;
  v11 = v8;
  dispatch_async(queue, v12);

}

void __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke(uint64_t a1)
{
  WBSScopeTimeoutHandler *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  WBSHistoryServiceEvent *v12;
  NSObject *v13;
  uint64_t v14;
  unint64_t v15;
  WBSHistoryServiceEvent *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  WBSHistoryServiceEvent *v22;
  void *v23;
  _QWORD *i;
  void *v25;
  WBSHistoryServiceEvent *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  WBSHistoryServiceEvent *v31;
  WBSHistoryServiceEvent *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  _OWORD v44[2];
  int v45;
  _OWORD v46[2];
  int v47;
  _OWORD v48[2];
  int v49;
  _BYTE v50[32];
  int v51;
  __int128 v52;
  __int128 v53;
  int v54;
  id v55;
  id v56;
  id v57;
  const __CFString *v58;
  void *v59;
  _QWORD v60[4];
  _QWORD v61[4];
  _QWORD v62[3];
  _QWORD v63[3];
  _OWORD v64[2];
  int v65;
  _OWORD v66[2];
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v2 = -[WBSScopeTimeoutHandler initWithTimeout:autoBugCaptureDomain:detectedProcess:context:]([WBSScopeTimeoutHandler alloc], "initWithTimeout:autoBugCaptureDomain:detectedProcess:context:", CFSTR("SafariShared"), CFSTR("com.apple.Safari.History"), CFSTR("Maintenance"), 30.0);
  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  memset(v44, 0, sizeof(v44));
  v45 = 1065353216;
  memset(v46, 0, sizeof(v46));
  v47 = 1065353216;
  memset(v48, 0, sizeof(v48));
  memset(v50, 0, sizeof(v50));
  v49 = 1065353216;
  v51 = 1065353216;
  v52 = 0u;
  v53 = 0u;
  v54 = 1065353216;
  v55 = 0;
  v56 = 0;
  v57 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_expireOldVisits:", 86400.0 * (double)0x31uLL + 86400.0 * (double)0x31uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    memset(v66, 0, sizeof(v66));
    v67 = 1065353216;
    objc_msgSend(*(id *)(a1 + 32), "_recomputeVisitScores:", v66);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_4();
      }

      v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      MEMORY[0x1A859A380](v8);

      goto LABEL_30;
    }
    memset(v64, 0, sizeof(v64));
    v65 = 1065353216;
    objc_msgSend(*(id *)(a1 + 32), "_recomputeItemScores:", v64);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_3();
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_preparePlan:ageLimit:itemCountLimit:", v44, *(_QWORD *)(a1 + 56), *(double *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v42 = 0;
        v43 = 0;
        objc_msgSend(*(id *)(a1 + 32), "_executePlan:outDeletedItemCount:outDeletedVisitCount:", v44, &v43, &v42);
        v12 = (WBSHistoryServiceEvent *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            -[WBSHistoryServiceEvent safari_privacyPreservingDescription](v12, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _clearHistoryItems:afterDate:beforeDate:tombstoneMode:].cold.1();
          }

          v14 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          MEMORY[0x1A859A380](v14);
        }
        else
        {
          v15 = 0x1E0C99000uLL;
          if (objc_msgSend(v55, "count"))
          {
            v16 = [WBSHistoryServiceEvent alloc];
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v62[0] = CFSTR("disposedURLs");
            v38 = v55;
            v37 = (void *)objc_msgSend(v38, "copy");
            v63[0] = v37;
            v62[1] = CFSTR("disposedHighLevelDomains");
            v17 = v56;
            v18 = (void *)objc_msgSend(v17, "copy");
            v63[1] = v18;
            v62[2] = CFSTR("disposedHostnames");
            v19 = v57;
            v20 = (void *)objc_msgSend(v19, "copy");
            v63[2] = v20;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[WBSHistoryServiceEvent initWithType:time:value:](v16, "initWithType:time:value:", CFSTR("maintenance"), v40, v21);

            objc_msgSend(*(id *)(a1 + 32), "_dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", v22, 0, 1, 0);
            v15 = 0x1E0C99000;
          }
          if (*((_QWORD *)&v53 + 1))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            for (i = (_QWORD *)v53; i; i = (_QWORD *)*i)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", i[2]);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v25);

            }
            v26 = [WBSHistoryServiceEvent alloc];
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v60[0] = CFSTR("disposedVisits");
            v61[0] = objc_msgSend(v23, "copy");
            v60[1] = CFSTR("updateLatestVisits");
            v39 = (void *)v61[0];
            objc_msgSend(*(id *)(a1 + 32), "_generateUpdatedLastVisit:", v50);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v61[1] = v27;
            v60[2] = CFSTR("updateItems");
            objc_msgSend(*(id *)(a1 + 32), "_generateItemsDictionary:", v50);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v61[2] = v28;
            v60[3] = CFSTR("updateVisits");
            objc_msgSend(*(id *)(a1 + 32), "_generateVisitsDictionary:", v50);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v61[3] = v29;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 4);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[WBSHistoryServiceEvent initWithType:time:value:](v26, "initWithType:time:value:", CFSTR("maintenance"), v41, v30);

            objc_msgSend(*(id *)(a1 + 32), "_dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", v31, 0, 0, 0);
            v15 = 0x1E0C99000uLL;
          }
          v32 = [WBSHistoryServiceEvent alloc];
          objc_msgSend(*(id *)(v15 + 3432), "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = CFSTR("endDate");
          objc_msgSend(*(id *)(v15 + 3432), "dateWithTimeIntervalSinceReferenceDate:", *(double *)(a1 + 48));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[WBSHistoryServiceEvent initWithType:time:value:](v32, "initWithType:time:value:", CFSTR("clear"), v33, v35);

          objc_msgSend(*(id *)(a1 + 32), "_dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", v12, 0, 0, 0);
          v36 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          MEMORY[0x1A859A380](v36);
        }

        goto LABEL_29;
      }
      v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _clearHistoryItems:afterDate:beforeDate:tombstoneMode:].cold.2();
      }
    }

    v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    MEMORY[0x1A859A380](v11);

LABEL_29:
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v64);
LABEL_30:
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v66);
    goto LABEL_31;
  }
  v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_5();
  }

  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  MEMORY[0x1A859A380](v5);

LABEL_31:
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v52);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v50);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v48);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v46);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v44);

}

- (void)vacuumHistoryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  MEMORY[0x1A859A374]();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__WBSHistoryServiceDatabase_vacuumHistoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __64__WBSHistoryServiceDatabase_vacuumHistoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5 = 0;
  SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, &v5, CFSTR("VACUUM"));
  v3 = v5;
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  MEMORY[0x1A859A380](v4);

}

- (void)checkIfLocalVisitExistsForDatabaseIDs:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__WBSHistoryServiceDatabase_checkIfLocalVisitExistsForDatabaseIDs_withCompletion___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __82__WBSHistoryServiceDatabase_checkIfLocalVisitExistsForDatabaseIDs_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SELECT origin FROM history_visits WHERE history_item IN (%@) AND origin = ? LIMIT 1"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  SafariShared::WBSSQLiteDatabaseFetch<WBSHistoryVisitOrigin>(v2, v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, objc_msgSend(v8, "count") != 0);

}

uint64_t __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __123__WBSHistoryServiceDatabase_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WBSHistoryServiceDatabase_getItemCountBeforeDate_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __70__WBSHistoryServiceDatabase_getItemCountBeforeDate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  v5 = 0;
  v6 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = (id *)&v6;
  SafariShared::WBSSQLiteDatabaseEnumerate<NSDate * const {__strong}&,std::tuple<long long &>>(v2, (uint64_t)&v5, CFSTR("SELECT COUNT(history_items.id) FROM history_items INNER JOIN history_visits ON history_visits.history_item = history_items.id WHERE visit_time < ? AND history_visits.id = safari_latest_visit_for (history_item);"),
    (id *)(a1 + 40),
    &v4);
  v3 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 writeHandle:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  dispatch_group_t v15;
  dispatch_queue_t v16;
  WBSHistoryServiceURLCompletion *urlCompletion;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  WBSHistoryServiceURLCompletion *v21;
  void *v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  NSObject *v29;
  _QWORD *v30;
  _QWORD v31[6];
  void *v32[4];

  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (v12)
  {
    v23 = v12;
    v15 = dispatch_group_create();
    v16 = dispatch_queue_create("WBSHistoryServiceDatabase.encodeQueue", 0);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x4812000000;
    v31[3] = __Block_byref_object_copy__277;
    v31[4] = __Block_byref_object_dispose__278;
    v31[5] = &unk_1A3FCC9DF;
    SafariShared::HistoryObjectStreamWriter::HistoryObjectStreamWriter((SafariShared::HistoryObjectStreamWriter *)v32, objc_msgSend(v13, "fileDescriptor"));
    urlCompletion = self->_urlCompletion;
    v18 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke;
    v27[3] = &unk_1E4B3B828;
    v19 = v15;
    v28 = v19;
    v20 = v16;
    v29 = v20;
    v30 = v31;
    v21 = urlCompletion;
    v12 = v23;
    -[WBSHistoryServiceURLCompletion searchForUserTypedString:options:currentTime:enumerationGroup:enumerationBlock:](v21, "searchForUserTypedString:options:currentTime:enumerationGroup:enumerationBlock:", v23, a4, v19, v27, a5);
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke_3;
    block[3] = &unk_1E4B2A250;
    v25 = v13;
    v26 = v14;
    dispatch_group_notify(v19, v20, block);

    _Block_object_dispose(v31, 8);
    SafariShared::HistoryObjectStreamWriter::~HistoryObjectStreamWriter(v32);

  }
  else
  {
    objc_msgSend(v13, "closeFile");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v14 + 2))(v14, v22);

  }
}

void __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = a1[4];
  v5 = a1[5];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4B2BE20;
  v6 = a1[6];
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_group_async(v4, v5, v8);

}

BOOL __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "entries", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), (const _HistoryStreamedMatchEntry *)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5++), "streamData"));
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return SafariShared::HistoryObjectStreamWriter::write((SafariShared::HistoryObjectStreamWriter *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), (const _HistoryStreamedMatchData *)objc_msgSend(*(id *)(a1 + 32), "streamData"));
}

uint64_t __104__WBSHistoryServiceDatabase_searchForUserTypedString_options_currentTime_writeHandle_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "closeFile");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_fetchListenerNamesFromDatabase:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", CFSTR("SELECT listener_name FROM history_event_listeners"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__WBSHistoryServiceDatabase__fetchListenerNamesFromDatabase___block_invoke;
    v20[3] = &unk_1E4B2A2C8;
    v7 = v5;
    v21 = v7;
    objc_msgSend(v6, "setHandler:", v20);
    objc_msgSend(v7, "fetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "stringAtIndex:", 0, (_QWORD)v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v14);

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        }
        while (v11);
      }

    }
    else if (a3)
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _fetchListenerNamesFromDatabase:]");
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __61__WBSHistoryServiceDatabase__fetchListenerNamesFromDatabase___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (id)_markEventsAsReceivedByListener:(id)a3 eventIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WBSSQLiteDatabase *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD *v31;
  void *v32;
  WBSSQLiteDatabase *database;
  id v34;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  int v53;
  _QWORD v54[4];
  id v55;
  unint64_t v56[2];
  unint64_t v57;
  id v58;
  _BYTE v59[128];
  uint8_t buf[32];
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") && objc_msgSend(v5, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v42 = v6;
    objc_msgSend(v6, "commaSeparatedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT id, pending_listeners FROM history_events WHERE id IN (%@)"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v41 = (void *)v9;
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, v9);
    if (v43)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0D89D00]);
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __70__WBSHistoryServiceDatabase__markEventsAsReceivedByListener_eventIDs___block_invoke;
      v54[3] = &unk_1E4B2A2C8;
      v11 = v43;
      v55 = v11;
      v39 = v10;
      objc_msgSend(v10, "setHandler:", v54);
      objc_msgSend(v11, "fetch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v12;
      if (v12)
      {
        memset(buf, 0, sizeof(buf));
        v61 = 1065353216;
        v51 = 0u;
        v52 = 0u;
        v53 = 1065353216;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v48 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              v56[0] = 0;
              v56[0] = objc_msgSend(v17, "int64AtIndex:", 0);
              objc_msgSend(v17, "stringAtIndex:", 1);
              v18 = (id)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "length");
              v20 = (void *)MEMORY[0x1E0C99E60];
              if (v19 > 1)
              {
                objc_msgSend(v18, "substringWithRange:", 1, objc_msgSend(v18, "length") - 2);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(":"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setWithArray:", v23);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E60], "set");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
              }

              if ((objc_msgSend(v21, "containsObject:", v5) & 1) != 0)
              {
                v24 = (void *)objc_msgSend(v21, "mutableCopy");
                objc_msgSend(v24, "removeObject:", v5);
                if (objc_msgSend(v24, "count"))
                {
                  eventListenerSetToString(v24);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = v56[0];
                  v58 = v25;
                  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::pair<long long,WBSHistoryItem * {__strong}>>((uint64_t)&v51, &v57, (uint64_t *)&v57);

                }
                else
                {
                  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)buf, v56, v56);
                }

              }
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          }
          while (v14);
        }

        if (*(_QWORD *)&buf[24]
          && (v26 = self->_database,
              v46 = 0,
              createQueryWithList(CFSTR("DELETE FROM history_events WHERE id IN ("), (uint64_t)buf, CFSTR(")")),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v26, &v46, v27),
              v28 = v46,
              v27,
              v28))
        {
          v29 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v28, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:].cold.1();
          }

        }
        else if (*((_QWORD *)&v52 + 1) && (v31 = (_QWORD *)v52) != 0)
        {
          while (1)
          {
            v32 = (void *)v31[3];
            v57 = v31[2];
            v58 = v32;
            database = self->_database;
            v45 = 0;
            SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,long long const&>(database, &v45, CFSTR("UPDATE history_events SET pending_listeners = ? WHERE id = ?"), &v58, &v57);
            v34 = v45;
            if (v34)
              break;

            v31 = (_QWORD *)*v31;
            if (!v31)
              goto LABEL_33;
          }
          v28 = v34;
          v36 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v28, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:].cold.1();
          }

        }
        else
        {
LABEL_33:
          v28 = 0;
        }
        std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)&v51);
        std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)buf);
      }
      else
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:]");
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v30 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:]");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "safari_privacyPreservingDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v38;
        _os_log_error_impl(&dword_1A3D90000, v30, OS_LOG_TYPE_ERROR, "Failed to bless events %@: %{public}@", buf, 0x16u);

      }
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _markEventsAsReceivedByListener:eventIDs:]");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }

    v6 = v42;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

uint64_t __70__WBSHistoryServiceDatabase__markEventsAsReceivedByListener_eventIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)markEventsAsReceivedByListener:(id)a3 eventIDs:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *queue;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v8)
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__WBSHistoryServiceDatabase_markEventsAsReceivedByListener_eventIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E4B3B458;
    v17 = v10;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    dispatch_async(queue, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v13);

  }
}

void __87__WBSHistoryServiceDatabase_markEventsAsReceivedByListener_eventIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_markEventsAsReceivedByListener:eventIDs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (int64_t)_writeEventToDatabase:(id)a3 listeners:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  WBSHistoryCrypto *crypto;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  crypto = self->_crypto;
  objc_msgSend(v8, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryCrypto encryptDictionary:](crypto, "encryptDictionary:", v11);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", CFSTR("INSERT INTO history_events (event_type, event_time, pending_listeners, value) VALUES (?, ?, ?, ?)"), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0D89D00]);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __67__WBSHistoryServiceDatabase__writeEventToDatabase_listeners_error___block_invoke;
      v22[3] = &unk_1E4B2A2C8;
      v14 = v12;
      v23 = v14;
      objc_msgSend(v13, "setHandler:", v22);
      objc_msgSend(v8, "eventType");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "time");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v20 = v16;
      eventListenerSetToString(v9);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},double,NSString * {__strong},NSData * {__strong}&>(v14, &v21, (double *)&v20, &v19, &v24);

      if (objc_msgSend(v14, "execute") == 101)
      {
        v17 = -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID");
      }
      else
      {
        if (a5)
        {
          -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSHistoryServiceDatabase _writeEventToDatabase:listeners:error:]");
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = -1;
      }

    }
    else
    {
      v17 = -1;
    }

  }
  else
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSHistoryErrorDomain"), 2, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = -1;
  }

  return v17;
}

uint64_t __67__WBSHistoryServiceDatabase__writeEventToDatabase_listeners_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)_dispatchEvent:(id)a3 listenersToIgnore:(id)a4 persistForDelayedDispatching:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  NSMutableSet *v11;
  NSMutableSet *registeredListeners;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  id v32;
  NSObject *queue;
  _QWORD block[4];
  id v35;
  WBSHistoryServiceDatabase *v36;
  id v37;
  id v38;
  BOOL v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  id v43;
  NSObject *v44;
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
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v10 = a4;
  v31 = a6;
  if (!self->_registeredListeners)
  {
    -[WBSHistoryServiceDatabase _fetchListenerNamesFromDatabase:](self, "_fetchListenerNamesFromDatabase:", 0);
    v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    registeredListeners = self->_registeredListeners;
    self->_registeredListeners = v11;

  }
  MEMORY[0x1A859A374]();
  v30 = a5;
  v13 = (void *)-[NSMutableSet mutableCopy](self->_registeredListeners, "mutableCopy");
  v14 = dispatch_group_create();
  queue = dispatch_queue_create("WBSHistoryServiceDatabase.dispatchEvent", 0);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[NSMapTable keyEnumerator](self->_listeners, "keyEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v15);
        -[NSMapTable objectForKey:](self->_listeners, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsObject:", v19))
          objc_msgSend(v13, "removeObject:", v19);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v16);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[NSMapTable keyEnumerator](self->_delegates, "keyEnumerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v46 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        -[NSMapTable objectForKey:](self->_listeners, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](self->_delegates, "objectForKey:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26 && (objc_msgSend(v10, "containsObject:", v25) & 1) == 0)
        {
          dispatch_group_enter(v14);
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke;
          v40[3] = &unk_1E4B3B850;
          v41 = queue;
          v42 = v25;
          v43 = v13;
          v44 = v14;
          objc_msgSend(v26, "handleEvent:completionHandler:", v32, v40);

        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v21);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_3;
  block[3] = &unk_1E4B3B878;
  v39 = v30;
  v35 = v13;
  v36 = self;
  v37 = v32;
  v38 = v31;
  v27 = v32;
  v28 = v31;
  v29 = v13;
  dispatch_group_notify(v14, queue, block);

}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4B399F0;
  v7 = v3;
  v4 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "removeObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  if (!objc_msgSend(*(id *)(a1 + 32), "count") || !*(_BYTE *)(a1 + 64))
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);
    JUMPOUT(0x1A859A380);
  }
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v4 = *(NSObject **)(v2 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_4;
  v6[3] = &unk_1E4B39360;
  v6[4] = v2;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 56);
  dispatch_async(v4, v6);

}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8[5];

  v8[4] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v8[0] = 0;
  objc_msgSend(v2, "_writeEventToDatabase:listeners:error:", v3, v4, v8);
  v5 = v8[0];
  v6 = a1[7];
  if (v6)
  {
    v6 = (*(uint64_t (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, 1, v5);
  }
  else if (v5)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_4_cold_1();
    }

  }
  MEMORY[0x1A859A380](v6);

}

- (void)dispatchEvent:(id)a3 listenersToIgnore:(id)a4 persistForDelayedDispatching:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__WBSHistoryServiceDatabase_dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke;
    block[3] = &unk_1E4B3AD40;
    block[4] = self;
    v16 = v10;
    v17 = v11;
    v19 = a5;
    v18 = v12;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v14);

  }
}

uint64_t __108__WBSHistoryServiceDatabase_dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (id)_dateForMetadataKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v16[5];

  v16[4] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v16[0] = 0;
  -[WBSHistoryServiceDatabase _metadataForKey:error:](self, "_metadataForKey:error:", v6, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16[0];
  v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _dateForMetadataKey:error:].cold.1();
      }

      if (a4)
      {
        v11 = 0;
        *a4 = objc_retainAutorelease(v9);
        goto LABEL_13;
      }
    }
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WBSHistoryServiceDatabase _dateForMetadataKey:error:].cold.2((uint64_t)v6, v13, v14);
    -[WBSHistoryServiceDatabase _clearWBSHistorySQLiteStoreClearHistoryKeys](self, "_clearWBSHistorySQLiteStoreClearHistoryKeys");
    goto LABEL_12;
  }
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v11;
}

- (void)_startingClearHistoryOperationForStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  -[WBSHistoryServiceDatabase _setMetadataValue:forKey:](self, "_setMetadataValue:forKey:", v6, CFSTR("clear_history_start_date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:].cold.4();
    }

    -[WBSHistoryServiceDatabase _clearWBSHistorySQLiteStoreClearHistoryKeys](self, "_clearWBSHistorySQLiteStoreClearHistoryKeys");
  }
  else
  {
    -[WBSHistoryServiceDatabase _setMetadataValue:forKey:](self, "_setMetadataValue:forKey:", v7, CFSTR("clear_history_end_date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:].cold.3();
      }

      v8 = v10;
      -[WBSHistoryServiceDatabase _clearWBSHistorySQLiteStoreClearHistoryKeys](self, "_clearWBSHistorySQLiteStoreClearHistoryKeys");
    }
    else
    {
      if (self->_clearHistoryInProgressFileURL)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL URLByDeletingLastPathComponent](self->_clearHistoryInProgressFileURL, "URLByDeletingLastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "safari_ensureDirectoryExists:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[NSURL path](self->_clearHistoryInProgressFileURL, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v12, "createFileAtPath:contents:attributes:", v15, 0, 0);

          if ((v16 & 1) == 0)
          {
            v17 = WBS_LOG_CHANNEL_PREFIXHistory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:].cold.2();
          }
        }
        else
        {
          v18 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[WBSHistoryServiceDatabase _startingClearHistoryOperationForStartDate:endDate:].cold.1();
        }

      }
      v8 = 0;
    }
  }

}

- (void)_finishedClearingHistory
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to remove file at _clearHistoryInProgressFileURL: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_clearWBSHistorySQLiteStoreClearHistoryKeys
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to clear WBSHistorySQLiteStoreClearHistoryStartDateKey: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)visitIdentifiersMatchingExistingVisits:(id)a3 desiredVisitTimePrecision:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  NSObject *queue;
  id v12;
  id v13;
  __CFString *v14;
  _QWORD block[5];
  __CFString *v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM history_items INNER JOIN history_visits ON history_items.id = history_visits.history_item WHERE url = ? AND CAST((visit_time * %1$ld) AS INT) = CAST((? * %1$ld) AS INT)"), a4);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("SELECT COUNT(*) FROM history_items INNER JOIN history_visits ON history_items.id = history_visits.history_item WHERE url = ? AND visit_time = ?");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__WBSHistoryServiceDatabase_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke;
  block[3] = &unk_1E4B3B8A0;
  block[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v19 = a4;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(queue, block);

}

void __112__WBSHistoryServiceDatabase_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id obj;
  uint64_t *v19;
  uint8_t buf[8];
  id v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v28 = 0;
  objc_msgSend(v3, "statementForQuery:error:", v2, &v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v28;
  if (!v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 48);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (!v7)
    goto LABEL_22;
  v8 = *(_QWORD *)v25;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
      v22 = v5;
      v23 = 0;
      objc_msgSend(v10, "urlString");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "visitTime");
      *(_QWORD *)buf = v11;
      v19 = &v23;
      v12 = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * {__strong},double,std::tuple<long long &>>(v4, (uint64_t)&v22, &v21, (id *)buf, (id *)&v19);
      v13 = v22;

      v5 = v13;
      if ((v12 & 1) == 0)
      {
        v14 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          __112__WBSHistoryServiceDatabase_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke_cold_1();
        }

      }
      v15 = v23;
      if (*(_QWORD *)(a1 + 64))
      {
        v16 = v6;
        if (!v23)
          goto LABEL_20;
LABEL_19:
        objc_msgSend(v16, "addObject:", v10);
        goto LABEL_20;
      }
      v16 = v6;
      if (v23 >= 2)
      {
        v17 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A3D90000, v17, OS_LOG_TYPE_INFO, "Unexpected duplicate visit in database", buf, 2u);
        }
        v15 = v23;
      }
      if (v15)
        goto LABEL_19;
LABEL_20:
      ++v9;
    }
    while (v7 != v9);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  }
  while (v7);
LABEL_22:

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_24:

}

- (void)resetCloudHistoryDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  MEMORY[0x1A859A374]();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__WBSHistoryServiceDatabase_resetCloudHistoryDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __72__WBSHistoryServiceDatabase_resetCloudHistoryDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_currentGeneration");
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_setMetadataValue:forKey:", 0, CFSTR("server_change_token"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "_setMetadataValue:forKey:", v5, CFSTR("last_synced_generation"));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "_setMetadataValue:forKey:", v8, CFSTR("current_generation"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v10, "_pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:", v11, &v19);
  v12 = v19;

  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "_setMetadataValue:forKey:", 0, CFSTR("push_throttler_data"));
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "_setMetadataValue:forKey:", 0, CFSTR("fetch_throttler_data"));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "_setMetadataValue:forKey:", 0, CFSTR("sync_circle_size_retrieval_throttler_data"));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "_setMetadataValue:forKey:", &unk_1E4B87B80, CFSTR("cached_sync_circle_size"));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "_setMetadataValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("push_notifications_initialized"));
  v18 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  MEMORY[0x1A859A380](v18);

}

- (void)visitsAndTombstonesNeedingSyncWithVisitSyncWindow:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  MEMORY[0x1A859A374]();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke;
  block[3] = &unk_1E4B393B0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  WBSHistoryTombstone *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  sqlite3_int64 v38;
  _BYTE v39[128];
  int v40[4];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_ensureDatabaseIsSynced");
  v2 = objc_msgSend(*(id *)(a1 + 32), "_currentGeneration");
  v38 = objc_msgSend(*(id *)(a1 + 32), "_lastSyncedGeneration");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2 + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "_setMetadataValue:forKey:", v4, CFSTR("current_generation"));

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v37 = 0;
  objc_msgSend(v6, "statementForQuery:error:", CFSTR("WITH view_visits_queried(id) AS (SELECT id FROM history_visits WHERE generation > ?1 AND origin = ?2 AND visit_time > ?3 UNION SELECT redirect_source FROM history_visits WHERE generation > ?1 AND origin = ?2 AND visit_time > ?3 AND redirect_source IS NOT NULL UNION SELECT redirect_destination FROM history_visits WHERE generation > ?1 AND origin = ?2 AND visit_time > ?3 AND redirect_destination IS NOT NULL),view_visits_identifiers(id, url, visit_time) AS(SELECT history_visits.id, url, visit_time FROM view_visits_queried, history_visits, history_items WHERE  history_visits.id = view_visits_queried.id AND history_items.id = history_visits.history_item AND history_items.status_code < 400) SELECT vs.url, vs.visit_time, title, load_successful, http_non_get, rs.url, rs.visit_time, rd.url, rd.visit_time FROM history_visits INNER JOIN view_visits_identifiers vs ON history_visits.id = vs.id LEFT JOIN view_visits_identifiers rs ON history_visits.redirect_source = rs.id LEFT JOIN view_visits_identifiers rd ON history_visits.redirect_destination = rd.id"), &v37);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v37;
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v7;
    v40[0] = 0;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_305;
    v33[3] = &unk_1E4B3B8C8;
    v25 = v8;
    v34 = v25;
    v35 = (id)MEMORY[0x1A8599ED0](v33);
    v9 = SafariShared::WBSSQLiteDatabaseEnumerate<long long &,int,double const&,void({block_pointer} {__strong})(NSString *,double,NSString *,int,int,NSString *,double,NSString *,double)>(v27, (uint64_t)&v36, &v38, v40, a1 + 48, &v35);
    v10 = v36;

    if ((v9 & 1) != 0)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v32 = 0;
      objc_msgSend(v11, "statementForQuery:error:", CFSTR("SELECT * FROM history_tombstones WHERE generation > ?"), &v32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v32;

      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bindInt64:atParameterIndex:", v38, 1);
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v26, "fetch");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v29;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v29 != v15)
                objc_enumerationMutation(v13);
              v17 = -[WBSHistoryTombstone initWithSQLiteRow:crypto:]([WBSHistoryTombstone alloc], "initWithSQLiteRow:crypto:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
              if (v17)
                objc_msgSend(v12, "addObject:", v17);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
          }
          while (v14);
        }

        objc_msgSend(v26, "reset");
        v18 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        MEMORY[0x1A859A380](v18);

      }
      else
      {
        v23 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_2();
        }

        v24 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        MEMORY[0x1A859A380](v24);
      }

    }
    else
    {
      v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_3();
      }

      v22 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      MEMORY[0x1A859A380](v22);
      v7 = v10;
    }

  }
  else
  {
    v19 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_1();
    }

    v20 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    MEMORY[0x1A859A380](v20);
  }

}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_305(uint64_t a1, void *a2, void *a3, int a4, int a5, void *a6, void *a7, double a8, double a9, double a10)
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  WBSHistoryVisitIdentifier *v24;
  WBSHistoryVisitIdentifier *v25;
  NSObject *v26;
  WBSCloudHistoryVisit *v27;
  WBSHistoryVisitIdentifier *v28;
  WBSCloudHistoryVisit *v29;
  uint64_t v30;

  v19 = a2;
  v20 = a3;
  v21 = a6;
  v22 = a7;
  v23 = v22;
  if (v19)
  {
    v30 = a1;
    if (v21)
    {
      v24 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:]([WBSHistoryVisitIdentifier alloc], "initWithURLString:visitTime:", v21, a9);
      if (v23)
      {
LABEL_4:
        v25 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:]([WBSHistoryVisitIdentifier alloc], "initWithURLString:visitTime:", v23, a10);
LABEL_9:
        v27 = [WBSCloudHistoryVisit alloc];
        v28 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:]([WBSHistoryVisitIdentifier alloc], "initWithURLString:visitTime:", v19, a8);
        v29 = -[WBSCloudHistoryVisit initWithVisitIdentifier:title:loadSuccessful:httpNonGet:redirectSourceVisitIdentifier:redirectDestinationVisitIdentifier:](v27, "initWithVisitIdentifier:title:loadSuccessful:httpNonGet:redirectSourceVisitIdentifier:redirectDestinationVisitIdentifier:", v28, v20, a4 != 0, a5 != 0, v24, v25);

        if (v29)
          objc_msgSend(*(id *)(v30 + 32), "addObject:", v29);

        goto LABEL_12;
      }
    }
    else
    {
      v24 = 0;
      if (v22)
        goto LABEL_4;
    }
    v25 = 0;
    goto LABEL_9;
  }
  v26 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_305_cold_1();
LABEL_12:

}

- (void)updateDatabaseAfterSuccessfulSyncWithGeneration:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  MEMORY[0x1A859A374]();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WBSHistoryServiceDatabase_updateDatabaseAfterSuccessfulSyncWithGeneration_completionHandler___block_invoke;
  block[3] = &unk_1E4B393B0;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __95__WBSHistoryServiceDatabase_updateDatabaseAfterSuccessfulSyncWithGeneration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_lastSyncedGeneration");
  v3 = *(_QWORD *)(a1 + 48);
  if (v2 <= v3)
  {
    if (v2 != v3)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v8, "_setMetadataValue:forKey:", v9, CFSTR("last_synced_generation"));

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    JUMPOUT(0x1A859A380);
  }
  v4 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __95__WBSHistoryServiceDatabase_updateDatabaseAfterSuccessfulSyncWithGeneration_completionHandler___block_invoke_cold_1();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  return MEMORY[0x1A859A380]();
}

- (void)createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  int64_t v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__WBSHistoryServiceDatabase_createTagsForIdentifiers_withTitles_type_level_completionHandler___block_invoke;
  v19[3] = &unk_1E4B3B8F0;
  v19[4] = self;
  v20 = v12;
  v23 = a5;
  v24 = a6;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(queue, v19);

}

void __94__WBSHistoryServiceDatabase_createTagsForIdentifiers_withTitles_type_level_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 248);
  v4 = a1[6];
  v5 = a1[8];
  v6 = a1[9];
  v9 = 0;
  objc_msgSend(v3, "createTagsForIdentifiers:withTitles:type:level:error:", v2, v4, v5, v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  (*(void (**)(void))(a1[7] + 16))();

}

- (void)assignURLString:(id)a3 toTopicTagsWithIDs:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__WBSHistoryServiceDatabase_assignURLString_toTopicTagsWithIDs_completionHandler___block_invoke;
  v15[3] = &unk_1E4B39360;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __82__WBSHistoryServiceDatabase_assignURLString_toTopicTagsWithIDs_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 248);
  v4 = a1[6];
  v6 = 0;
  objc_msgSend(v3, "assignURLString:toTopicTagsWithIDs:error:", v2, v4, &v6);
  v5 = v6;
  (*(void (**)(void))(a1[7] + 16))();

}

- (void)setTitle:(id)a3 ofTagWithID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__WBSHistoryServiceDatabase_setTitle_ofTagWithID_completionHandler___block_invoke;
  v13[3] = &unk_1E4B392E8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __68__WBSHistoryServiceDatabase_setTitle_ofTagWithID_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 248);
  v4 = a1[7];
  v6 = 0;
  objc_msgSend(v3, "renameTagWithID:toTitle:error:", v4, v2, &v6);
  v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();

}

- (BOOL)_isTesting
{
  return -[NSString hasPrefix:](self->_databaseID, "hasPrefix:", CFSTR("test"))
      || -[NSString hasPrefix:](self->_databaseID, "hasPrefix:", CFSTR("_test"));
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (WBSHistoryServiceURLCompletion)urlCompletion
{
  return self->_urlCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCompletion, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong(&self->_pendingVisitsTimeout, 0);
  objc_storeStrong((id *)&self->_clearHistoryInProgressFileURL, 0);
  objc_storeStrong((id *)&self->_pendingVisits, 0);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&self->_visitForTemporaryID);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&self->_temporaryIDToItem);
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&self->_latestVisitMap);
  objc_storeStrong((id *)&self->_registeredListeners, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_databaseOptions, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_crypto, 0);
  objc_storeStrong((id *)&self->_fileOperationGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithID:(double)a1 url:options:fileOperationGroup:error:.cold.1(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"database_acquiring_crypto", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:(double)a1 .cold.1(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"database_migrate_schema", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:(double)a1 .cold.2(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"database_create_methods", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:(double)a1 .cold.3(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"database_setting_pragmas", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to enable write-ahead logging on history SQLite store at %{private}@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_prepareDatabase:(double)a1 .cold.5(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"database_checking_integrity", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed integrity check for History store at URL: %{private}@ with error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_prepareDatabase:(double)a1 .cold.7(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"database_opening", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_prepareDatabase:.cold.8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to open History store database at URL: %{private}@ with error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to fall back to in-memory database: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to reopen database %@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __53__WBSHistoryServiceDatabase_database_hadSevereError___block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "History database failed integrity check: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_recomputeLatestVisitsForItems:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Latest visit were not computed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_recomputeLatestVisitsForItems:error:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_4(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v4, v5, "Failed to recompute latest visits: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_4(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v4, v5, "Failed to run load redirection chain query: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.2()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to reenable foreign keys: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.3()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to commit: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.4()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to correct redirect_destination: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.5()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to correct redirect_source: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.6()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to delete visits associated with invalid items: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.9()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to begin transaction: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.10()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to disable foreign keys: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.11()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_23();
  v3 = v0;
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v1, (uint64_t)v1, "Inconsistencies found in the history_visits table: %zi invalid items, %zi invalid visits", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_fetchVisitsWithOptions:(uint8_t *)buf predicate:(_BYTE *)a2 writeDescriptor:(os_log_t)log .cold.12(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Encountered write error while fetching redirect chains", buf, 2u);
}

- (void)_fetchVisitsWithOptions:predicate:writeDescriptor:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Encountered write error while fetching items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_fetchVisitsWithOptions:(uint8_t *)buf predicate:(_BYTE *)a2 writeDescriptor:(os_log_t)log .cold.14(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1A3D90000, log, OS_LOG_TYPE_FAULT, "Invalid database content: NULL url in history_items", buf, 2u);
}

void __51__WBSHistoryServiceDatabase_fetchDomainExpansions___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_4(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v4, v5, "Failed to prepare query for domain expansion: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

void __85__WBSHistoryServiceDatabase_setLastSeenDate_forCloudClientVersion_completionHandler___block_invoke_cold_1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to insert or update version information in history_client_versions table: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)fetchMetadataForKeys:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Querying metadata keys: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setMetadataValue:forKey:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Invalid object type: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:error:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to prune old tombstones: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_pruneTombstonesOnDatabaseQueueWithEndDatePriorToDate:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Prune tombstones with end date prior to date: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to commit transaction: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:.cold.2()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to begin transaction: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __70__WBSHistoryServiceDatabase_replayAndAddTombstones_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to replay tombstone: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __50__WBSHistoryServiceDatabase__commitPendingUpdates__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to retrieve items ID for URLs: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_commitPendingItems:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_1(&dword_1A3D90000, v3, v4, "Failed to create update item statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_commitPendingItems:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_1(&dword_1A3D90000, v3, v4, "Failed to create insert item statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_commitPendingItems:.cold.3()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 138543362;
  *v3 = v2;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v5, (uint64_t)v3, "Failed to insert item: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_commitPendingVisits:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_1(&dword_1A3D90000, v3, v4, "Failed to create find visit statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_commitPendingVisits:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_1(&dword_1A3D90000, v3, v4, "Failed to create insert visit statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_commitPendingVisits:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_1(&dword_1A3D90000, v3, v4, "Failed to create update title visit statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_commitPendingVisits:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_1(&dword_1A3D90000, v3, v4, "Failed to create update attributes visit statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_commitPendingVisits:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_1(&dword_1A3D90000, v3, v4, "Failed to create update visit's source statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_commitPendingVisits:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_8_1(&dword_1A3D90000, v3, v4, "Failed to create update visit's destination statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __50__WBSHistoryServiceDatabase__commitPendingVisits___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to dispatch update event: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to update item %lli with updated visit counts: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __126__WBSHistoryServiceDatabase__updateItem_visitCountScore_dailyVisitCounts_weeklyVisitCounts_shouldRecomputeDerivedVisitCounts___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to update item %lli to scheduler a visit counts recomputation: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to delete all items from the history_tags table: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_2()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to delete all items from the history_items_to_tags table: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_3()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to delete all items from the history_items table: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_4()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to delete all visits from the history_visits table: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to retrieve urls for history items that should be deleted from Spotlight.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to retrieve obsolete items to be removed from Spotlight.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __72__WBSHistoryServiceDatabase__clearAllHistoryInsertingTombstoneUpToDate___block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to retrieve items from the history_visits table for all history that should be delted from Spotlight.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_generateItemsDictionary:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to create statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __88__WBSHistoryServiceDatabase__clearHistoryVisitsAddedAfterDate_beforeDate_tombstoneMode___block_invoke_cold_1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to insert tombstone: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to prepare insert tombstone statement: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_insertTombstonesForURLs:afterDate:beforeDate:tombstoneMode:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to insert tombstone: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_clearHistoryItems:afterDate:beforeDate:tombstoneMode:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to execute deletion plan: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_clearHistoryItems:afterDate:beforeDate:tombstoneMode:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to prepare deletion plan: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __83__WBSHistoryServiceDatabase_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "No history clearing operation to finish.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_expireOldVisits:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 136315650;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to delete all items from the history_items table: %s %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_recomputeVisitScores:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "No visit score was changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_recomputeVisitScores:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update visit score: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_recomputeVisitScores:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to determine which visit score should be recomputed: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_recomputeItemScores:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "No item score was changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_recomputeItemScores:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_23();
  v3 = v0;
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v1, (uint64_t)v1, "Failed to modify rows when recomputing item scores despite finding %lu modified items. %ld history visits reference a modified item", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_recomputeItemScores:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to determine which item score should be recomputed: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to recompute item scores: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to recompute visit scores: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __93__WBSHistoryServiceDatabase_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke_cold_5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to expire old visits: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_markEventsAsReceivedByListener:eventIDs:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to delete events: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __109__WBSHistoryServiceDatabase__dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke_4_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to save event to database: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_dateForMetadataKey:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to read metadata for %{public}@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_dateForMetadataKey:(uint64_t)a3 error:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "The value of %{public}@ was an unexpected type", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_startingClearHistoryOperationForStartDate:endDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to create enclosing folder for _clearHistoryInProgressFileURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_startingClearHistoryOperationForStartDate:endDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to create _clearHistoryInProgressFileURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_startingClearHistoryOperationForStartDate:endDate:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to set WBSHistorySQLiteStoreClearHistoryEndDateKey: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_startingClearHistoryOperationForStartDate:endDate:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to set WBSHistoryServiceEventClearStartDateKey: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __112__WBSHistoryServiceDatabase_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke_cold_1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  *v1 = 138543362;
  *v3 = v2;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v5, (uint64_t)v3, "Failed to find existing visit: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to prepare visits needing sync query: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to prepare tombstones needing sync query: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to execute visits needing sync query: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __97__WBSHistoryServiceDatabase_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke_305_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Visit's URL is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __95__WBSHistoryServiceDatabase_updateDatabaseAfterSuccessfulSyncWithGeneration_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Last synced generation is greater to generation argument", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
