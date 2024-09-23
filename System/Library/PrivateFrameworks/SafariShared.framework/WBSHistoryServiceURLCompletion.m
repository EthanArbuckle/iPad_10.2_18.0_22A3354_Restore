@implementation WBSHistoryServiceURLCompletion

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  return self;
}

- (id)warmUpWithDatabase:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__24;
  v16 = __Block_byref_object_dispose__24;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSHistoryServiceURLCompletion_warmUpWithDatabase___block_invoke;
  block[3] = &unk_1E4B384C0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_barrier_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (WBSHistoryServiceURLCompletion)init
{
  WBSHistoryServiceURLCompletion *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  WBSHistoryServiceURLCompletion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSHistoryServiceURLCompletion;
  v2 = -[WBSHistoryServiceURLCompletion init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("WBSHistoryServiceURLCompletion", MEMORY[0x1E0C80D50]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  dispatch_group_t v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  _QWORD block[5];
  dispatch_group_t v34;
  id v35;
  id v36;
  dispatch_queue_t v37;
  id v38;
  void ***v39;
  _QWORD *v40;
  unint64_t v41;
  unint64_t v42;
  double v43;
  unint64_t v44;
  void **v45[3];
  int v46;
  _QWORD v47[6];
  _QWORD v48[4];

  v16 = a5;
  v17 = a6;
  v18 = a9;
  if (a3)
  {
    v19 = 0;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x4812000000;
    v47[3] = __Block_byref_object_copy__44;
    v47[4] = __Block_byref_object_dispose__45;
    v45[0] = 0;
    v45[1] = (void **)v45;
    v46 = 0x800000;
    v47[5] = &unk_1A3FCC9DF;
    memset(v48, 0, 24);
    v45[2] = (void **)0x2020000000;
    if ((a7 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = v18;
    v20 = v16;
    if ((a7 & 1) != 0
      && -[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpressionOnce != -1)
    {
      dispatch_once(&-[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpressionOnce, &__block_literal_global_65);
    }
    v21 = dispatch_group_create();
    v22 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryServiceURLCompletion.computeFrequentlyVisitedSites", 0);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_2;
    block[3] = &unk_1E4B3C450;
    v41 = a4;
    block[4] = self;
    v34 = v21;
    v35 = v17;
    v43 = a8;
    v36 = v20;
    v37 = v22;
    v38 = v19;
    v39 = v45;
    v42 = a7;
    v40 = v47;
    v44 = a3;
    v24 = v19;
    v25 = v22;
    v26 = v21;
    v27 = queue;
    v16 = v20;
    dispatch_group_async(v26, v27, block);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_5;
    v30[3] = &unk_1E4B3B4F8;
    v18 = v29;
    v31 = v29;
    v32 = v47;
    dispatch_group_notify(v26, v25, v30);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(v47, 8);
    v45[0] = (void **)v48;
    std::vector<WBSHistoryServiceURLCompletionMatchEntry * {__strong}>::__destroy_vector::operator()[abi:sn180100](v45);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v18 + 2))(v18, 0, v28);

  }
}

void __53__WBSHistoryServiceURLCompletion_warmUpWithDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_warmUpWithDatabase:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_warmUpWithDatabase:(id)a3
{
  void *v3;
  sqlite3_stmt *v4;
  int v5;
  const unsigned __int8 *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  const void *v13;
  int v14;
  BOOL v15;
  BOOL v16;
  const unsigned __int8 *v17;
  int v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  __int128 *v24;
  char i;
  NSObject *v26;
  void *v27;
  void *v28;
  void **v29;
  void *v30;
  uint64_t v31;
  void *v32;
  sqlite3_stmt *v33;
  int v34;
  void *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  unint64_t value;
  NSObject *v47;
  uint64_t v48;
  unint64_t v49;
  NSObject *v50;
  NSObject *v51;
  char *v53;
  void *v54;
  SafariShared::URLCompletionEntryMap *p_map;
  id v57;
  const void *v58;
  uint64_t v59;
  const void *v60;
  sqlite3_int64 v61;
  WBSMemoryPressureMonitor *v62;
  _QWORD v63[5];
  id v64;
  uint64_t *v65;
  sqlite3_int64 v66;
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  uint64_t (*v72)(uint64_t);
  _OWORD v73[2];
  uint64_t v74;
  int v75;
  __int128 v76;
  __int128 v77;
  int v78;
  __int128 v79;
  __int128 v80;
  int v81;
  void *__p[2];
  char v83;
  _BYTE buf[24];
  _QWORD v85[6];
  BOOL v86;
  BOOL v87;
  const unsigned __int8 *v88;
  void *v89;
  double v90;
  BOOL v91;
  char v92;
  _QWORD v93[22];

  v93[19] = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", v57, CFSTR("SELECT history_items.id, history_items.url, history_visits.title, redirect_destination, load_successful, visit_time, visit_count_score, status_code, daily_visit_counts, weekly_visit_counts, autocomplete_triggers, origin FROM history_items INNER JOIN history_visits ON history_visits.id = safari_latest_visit_for (history_items.id)"));
  if (v3)
  {
    v54 = v3;
    v4 = (sqlite3_stmt *)objc_msgSend(v3, "handle");
    v79 = 0u;
    v80 = 0u;
    v81 = 1065353216;
    v76 = 0u;
    v77 = 0u;
    v78 = 1065353216;
    v68 = 0;
    v69 = &v68;
    v70 = 0x5812000000;
    v71 = __Block_byref_object_copy__23;
    v72 = __Block_byref_object_dispose__24;
    v53 = (char *)v73 + 8;
    memset(v73, 0, sizeof(v73));
    v74 = 0;
    v75 = 1065353216;
    v62 = objc_alloc_init(WBSMemoryPressureMonitor);
    p_map = (SafariShared::URLCompletionEntryMap *)&self->_map;
    while (1)
    {
      if (-[WBSMemoryPressureMonitor pressured](v62, "pressured", v53))
        goto LABEL_16;
      v5 = sqlite3_step(v4);
      if (v5 != 100)
        break;
      __p[0] = 0;
      __p[0] = (void *)sqlite3_column_int64(v4, 0);
      v6 = sqlite3_column_text(v4, 1);
      v7 = sqlite3_column_bytes(v4, 1);
      if (v6)
      {
        v8 = v7;
        if (strncmp((const char *)v6, "data:", 5uLL))
        {
          v61 = sqlite3_column_int64(v4, 6);
          v60 = sqlite3_column_blob(v4, 8);
          v9 = sqlite3_column_bytes(v4, 8);
          v10 = v9;
          if ((v9 & 3) != 0)
            v10 = 0;
          v59 = v10;
          v58 = sqlite3_column_blob(v4, 9);
          v11 = sqlite3_column_bytes(v4, 9);
          if ((v11 & 3) != 0)
            v12 = 0;
          else
            v12 = v11;
          v13 = sqlite3_column_blob(v4, 10);
          v14 = sqlite3_column_bytes(v4, 10);
          v15 = sqlite3_column_int(v4, 4) != 0;
          v16 = sqlite3_column_int64(v4, 11) == 0;
          v17 = sqlite3_column_text(v4, 2);
          v18 = sqlite3_column_bytes(v4, 2);
          v19 = sqlite3_column_double(v4, 5);
          sqlite3_column_int64(v4, 7);
          v20 = WBSStatusCodeGroupFromStatusCode();
          *(_QWORD *)buf = v6;
          *(_QWORD *)&buf[8] = v8;
          *(_QWORD *)&buf[16] = v61;
          v85[0] = v60;
          v85[1] = v59;
          v85[2] = v58;
          v85[3] = v12;
          v85[4] = v13;
          v85[5] = v14;
          v86 = v15;
          v87 = v16;
          v88 = v17;
          v89 = (void *)v18;
          v90 = v19;
          v91 = v20 == 4;
          SafariShared::URLCompletionEntryBuilder::validateVisitedCountsIfNeeded((SafariShared::URLCompletionEntryBuilder *)buf);
          SafariShared::URLCompletionEntryMap::insert(p_map, (SafariShared::URLCompletionEntryBuilder *)buf, 1);
          v67 = (id)objc_claimAutoreleasedReturnValue();
          std::__hash_table<std::__hash_value_type<long long,NSString * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,NSString * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,NSString * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,NSString * {__strong}>>>::__emplace_unique_key_args<long long,long long &,NSString * {__strong}&>((uint64_t)(v69 + 6), (unint64_t *)__p, __p, &v67);
          v66 = 0;
          v66 = sqlite3_column_int64(v4, 3);
          if (v66)
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v79, (unint64_t *)&v66, &v66);
            std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_multi<long long &,long long &>(&v76, (unint64_t *)&v66, __p);
          }

        }
      }
    }
    if (v5 == 101)
    {
LABEL_16:
      objc_msgSend(v54, "invalidate");
      v21 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:].cold.6(v21);
      if (-[WBSMemoryPressureMonitor pressured](v62, "pressured"))
      {
        *(_QWORD *)buf = -1;
        __p[0] = buf;
        SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<long long &>>(v57, 0, CFSTR("SELECT count(*) FROM history_items"), (sqlite3_int64 **)__p);
        v22 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:].cold.5((uint64_t *)p_map, (uint64_t *)buf, v22);
      }
      if (*((_QWORD *)&v77 + 1))
      {
        v23 = objc_alloc(MEMORY[0x1E0D89CC8]);
        std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:sn180100]((uint64_t)buf);
        std::__put_character_sequence[abi:sn180100]<char,std::char_traits<char>>(&buf[16], (uint64_t)"SELECT id, history_item FROM history_visits WHERE id IN (", 57);
        v24 = &v80;
        for (i = 1; ; i = 0)
        {
          v24 = *(__int128 **)v24;
          if (!v24)
            break;
          if ((i & 1) == 0)
          {
            LOBYTE(__p[0]) = 44;
            std::__put_character_sequence[abi:sn180100]<char,std::char_traits<char>>(&buf[16], (uint64_t)__p, 1);
          }
          std::ostream::operator<<();
        }
        std::__put_character_sequence[abi:sn180100]<char,std::char_traits<char>>(&buf[16], (uint64_t)")", 1);
        v28 = (void *)MEMORY[0x1E0CB3940];
        std::stringbuf::str[abi:sn180100]<std::allocator<char>>((uint64_t)v85, __p);
        if (v83 >= 0)
          v29 = __p;
        else
          v29 = (void **)__p[0];
        objc_msgSend(v28, "stringWithUTF8String:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v83 < 0)
          operator delete(__p[0]);
        *(_QWORD *)buf = *MEMORY[0x1E0DE4F50];
        v31 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
        *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
        *(_QWORD *)&buf[16] = v31;
        v85[0] = MEMORY[0x1E0DE4FB8] + 16;
        if (v92 < 0)
          operator delete(v89);
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x1A859987C](v93);
        v32 = (void *)objc_msgSend(v23, "initWithDatabase:query:", v57, v30);

        if (!v32)
        {
          v50 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v57, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]");
            objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:].cold.2();
          }

          objc_msgSend(v57, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_66;
        }
        v33 = (sqlite3_stmt *)objc_msgSend(v32, "handle");
        while (1)
        {
          v34 = sqlite3_step(v33);
          v35 = v32;
          if (v34 != 100)
            break;
          __p[0] = 0;
          __p[0] = (void *)sqlite3_column_int64(v33, 0);
          v67 = 0;
          v67 = (id)sqlite3_column_int64(v33, 1);
          v36 = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__equal_range_multi<long long>(&v76, (unint64_t *)__p);
          v38 = v37;
          *(_QWORD *)buf = &v67;
          v39 = (id)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)(v69 + 6), (unint64_t *)&v67, (uint64_t)&std::piecewise_construct, (_QWORD **)buf)[3];
          v40 = v39;
          if (v39)
          {
            v63[0] = MEMORY[0x1E0C809B0];
            v63[1] = 3221225472;
            v63[2] = __54__WBSHistoryServiceURLCompletion__warmUpWithDatabase___block_invoke;
            v63[3] = &unk_1E4B3C318;
            v65 = &v68;
            v63[4] = self;
            v64 = v39;
            v41 = std::for_each[abi:sn180100]<std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<long long,long long>,void *> *>>,void({block_pointer} {__strong})(std::pair<long long,long long> const&)>(v36, v38, v63);

          }
        }
        if (v34 == 101)
        {
          objc_msgSend(v32, "invalidate");
          v43 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:].cold.4((uint64_t *)&v77 + 1, v43);
            v35 = v32;
          }
          v44 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            v45 = *(_QWORD *)p_map;
            if (*(_QWORD *)p_map)
              v45 = *(unsigned int *)(v45 - 12);
            value = self->_map._extras.__table_.__p2_.__value_;
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v45;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = value;
            _os_log_impl(&dword_1A3D90000, v44, OS_LOG_TYPE_INFO, "Ready (%zi) (%zi)", buf, 0x16u);
          }
          v27 = 0;

LABEL_66:
          _Block_object_dispose(&v68, 8);
          std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)v53);
          std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v76);
          std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)&v79);
          goto LABEL_67;
        }
        v51 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v57, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]");
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:].cold.3();
        }

        objc_msgSend(v57, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v32;
      }
      else
      {
        v47 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = *(_QWORD *)p_map;
          if (*(_QWORD *)p_map)
            v48 = *(unsigned int *)(v48 - 12);
          v49 = self->_map._extras.__table_.__p2_.__value_;
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v49;
          _os_log_impl(&dword_1A3D90000, v47, OS_LOG_TYPE_INFO, "Ready (%zi) (%zi)", buf, 0x16u);
        }
        v27 = 0;
      }
    }
    else
    {
      v42 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v57, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]");
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:].cold.3();
      }

      objc_msgSend(v57, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_66;
  }
  v26 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v57, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]");
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    -[WBSHistoryServiceURLCompletion _warmUpWithDatabase:].cold.1();
  }

  objc_msgSend(v57, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion _warmUpWithDatabase:]");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_67:

  return v27;
}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;

  v2 = *(_QWORD *)(a1 + 96);
  if (!v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (v3)
      v4 = *(unsigned int *)(v3 - 12);
    else
      v4 = 0;
    *(float *)&v5 = (float)(unint64_t)WBSTopSitesMinimumVisitCountThreshold(v4);
    LODWORD(v2) = +[WBSHistoryVisit scoreForWeightedVisitCount:](WBSHistoryVisit, "scoreForWeightedVisitCount:", v5);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = *(void **)(v7 + 8);
  if (threadCountToEnumerateConcurrently(void)::onceToken != -1)
    dispatch_once(&threadCountToEnumerateConcurrently(void)::onceToken, &__block_literal_global_95);
  v9 = threadCountToEnumerateConcurrently(void)::threadCount;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_3;
  v16[3] = &unk_1E4B3C428;
  v27 = v2;
  v17 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v24 = *(_QWORD *)(a1 + 104);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v18 = v10;
  v19 = v11;
  v25 = *(_QWORD *)(a1 + 112);
  v20 = v12;
  v21 = *(id *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 72);
  v13 = (id)v15;
  v22 = v15;
  v14 = *(_QWORD *)(a1 + 120);
  v23 = *(_QWORD *)(a1 + 88);
  v26 = v14;
  SafariShared::URLCompletionEntryMap::enumerateConcurrently(v7 + 16, v6, v8, v9, v16);

}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __54__WBSHistoryServiceURLCompletion__warmUpWithDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSString *v4;
  _QWORD *v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48;
  v5 = (_QWORD *)(a2 + 8);
  v4 = (NSString *)(id)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v3, (unint64_t *)(a2 + 8), (uint64_t)&std::piecewise_construct, &v5)[3];
  if (v4)
  {
    std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::__emplace_multi<NSString * const {__strong}&,NSString * {__strong}&>((_QWORD *)(*(_QWORD *)(a1 + 32) + 64), (id *)(a1 + 40), (id *)&v4);
    SafariShared::URLCompletionEntryMap::setNextItemInRedirectChainOfItem((SafariShared::URLCompletionEntryMap *)(*(_QWORD *)(a1 + 32) + 16), v4, *(NSString **)(a1 + 40));

  }
}

- (void)updateItemWithLatestVisit:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  sqlite3_stmt *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  const void *v19;
  int v20;
  char v21;
  BOOL v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *queue;
  char *v27;
  id *v28;
  uint64_t v29;
  const void *v30;
  uint64_t v31;
  const void *v32;
  sqlite3_int64 v33;
  int v34;
  const void *v35;
  char *__s;
  _QWORD block[7];
  _QWORD v38[6];
  char *v39;
  _QWORD v40[6];
  id *v41;
  uint8_t buf[8];
  uint64_t v43;
  sqlite3_int64 v44;
  const void *v45;
  uint64_t v46;
  const void *v47;
  uint64_t v48;
  const void *v49;
  uint64_t v50;
  char v51;
  BOOL v52;
  char *v53;
  size_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", v7, CFSTR("SELECT url, visit_count_score, daily_visit_counts, weekly_visit_counts, autocomplete_triggers, status_code FROM history_items WHERE id = ?"));
  if (!v8)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:]");
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:].cold.1();
    }
    goto LABEL_9;
  }
  v9 = objc_msgSend(v6, "itemID");
  objc_msgSend(v8, "bindInt64:atParameterIndex:", v9, 1);
  v10 = (sqlite3_stmt *)objc_msgSend(v8, "handle");
  v11 = sqlite3_step(v10);
  if (v11 != 100)
  {
    if (v11 == 101)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:].cold.3(buf, objc_msgSend(v6, "databaseID"), v9, v12);

      goto LABEL_24;
    }
    v13 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "lastErrorWithMethodName:", "-[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:]");
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceURLCompletion updateItemWithLatestVisit:database:].cold.2();
    }
LABEL_9:

    goto LABEL_24;
  }
  objc_msgSend(v6, "title");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  __s = (char *)objc_msgSend(v14, "UTF8String");

  v35 = sqlite3_column_blob(v10, 0);
  v34 = sqlite3_column_bytes(v10, 0);
  v33 = sqlite3_column_int64(v10, 1);
  v32 = sqlite3_column_blob(v10, 2);
  v15 = sqlite3_column_bytes(v10, 2);
  v16 = v15;
  if ((v15 & 3) != 0)
    v16 = 0;
  v31 = v16;
  v30 = sqlite3_column_blob(v10, 3);
  v17 = sqlite3_column_bytes(v10, 3);
  v18 = v17;
  if ((v17 & 3) != 0)
    v18 = 0;
  v29 = v18;
  v19 = sqlite3_column_blob(v10, 4);
  v20 = sqlite3_column_bytes(v10, 4);
  v21 = objc_msgSend(v6, "loadSuccessful");
  v22 = objc_msgSend(v6, "origin") == 0;
  if (__s)
    v23 = strlen(__s);
  else
    v23 = 0;
  objc_msgSend(v6, "visitTime");
  v25 = v24;
  sqlite3_column_int64(v10, 5);
  *(_QWORD *)buf = v35;
  v43 = v34;
  v44 = v33;
  v45 = v32;
  v46 = v31;
  v47 = v30;
  v48 = v29;
  v49 = v19;
  v50 = v20;
  v51 = v21;
  v52 = v22;
  v53 = __s;
  v54 = v23;
  v55 = v25;
  v56 = WBSStatusCodeGroupFromStatusCode() == 4;
  SafariShared::URLCompletionEntryBuilder::validateVisitedCountsIfNeeded((SafariShared::URLCompletionEntryBuilder *)buf);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3812000000;
  v40[3] = __Block_byref_object_copy__34;
  v40[4] = __Block_byref_object_dispose__35;
  v40[5] = 0;
  SafariShared::URLCompletionEntryBuilder::buildEntry((SafariShared::URLCompletionEntryBuilder *)buf, (CFTypeRef **)&v41);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3812000000;
  v38[3] = __Block_byref_object_copy__36;
  v38[4] = __Block_byref_object_dispose__37;
  v38[5] = 0;
  SafariShared::URLCompletionEntryBuilder::buildExtras((SafariShared::URLCompletionEntryBuilder *)buf, &v39);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WBSHistoryServiceURLCompletion_updateItemWithLatestVisit_database___block_invoke;
  block[3] = &unk_1E4B3C340;
  block[4] = self;
  block[5] = v40;
  block[6] = v38;
  dispatch_barrier_async(queue, block);
  _Block_object_dispose(v38, 8);
  v27 = v39;
  v39 = 0;
  if (v27)
    MEMORY[0x1A85998AC](v27, 0x10C402CAF9ECALL);
  _Block_object_dispose(v40, 8);
  v28 = v41;
  v41 = 0;
  if (v28)
    std::default_delete<SafariShared::URLCompletionEntry>::operator()[abi:sn180100]((uint64_t)&v41, v28);
LABEL_24:

}

void __69__WBSHistoryServiceURLCompletion_updateItemWithLatestVisit_database___block_invoke(_QWORD *a1)
{
  SafariShared::URLCompletionEntryMap::insert((uint64_t *)(a1[4] + 16), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48), (uint64_t **)(*(_QWORD *)(a1[6] + 8) + 48));
}

- (void)updateURLString:(id)a3 autocompleteTriggerData:(id)a4
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
  block[2] = __74__WBSHistoryServiceURLCompletion_updateURLString_autocompleteTriggerData___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(queue, block);

}

void __74__WBSHistoryServiceURLCompletion_updateURLString_autocompleteTriggerData___block_invoke(uint64_t a1)
{
  SafariShared::URLCompletionEntryMap::updateAutocompleteTriggers((SafariShared::URLCompletionEntryMap *)(*(_QWORD *)(a1 + 32) + 16), *(NSString **)(a1 + 40), *(NSData **)(a1 + 48));
}

- (void)noteRedirectFromURLString:(id)a3 toURLString:(id)a4
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
  block[2] = __72__WBSHistoryServiceURLCompletion_noteRedirectFromURLString_toURLString___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_barrier_async(queue, block);

}

void __72__WBSHistoryServiceURLCompletion_noteRedirectFromURLString_toURLString___block_invoke(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::__emplace_multi<NSString * const {__strong}&,NSString * {__strong}&>((_QWORD *)(*(_QWORD *)(a1 + 32) + 64), (id *)(a1 + 40), (id *)(a1 + 48));
  SafariShared::URLCompletionEntryMap::setNextItemInRedirectChainOfItem((SafariShared::URLCompletionEntryMap *)(*(_QWORD *)(a1 + 32) + 16), *(NSString **)(a1 + 48), *(NSString **)(a1 + 40));
}

- (BOOL)queryVisitCounts:(id)a3 outVisitCountScore:(int64_t *)a4 outDailyVisitCounts:(id *)a5 outWeeklyVisitCounts:(id *)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  int64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v10 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__24;
  v30 = __Block_byref_object_dispose__24;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__24;
  v24 = __Block_byref_object_dispose__24;
  v25 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__WBSHistoryServiceURLCompletion_queryVisitCounts_outVisitCountScore_outDailyVisitCounts_outWeeklyVisitCounts___block_invoke;
  v14[3] = &unk_1E4B3C368;
  v14[4] = self;
  v15 = v10;
  v16 = &v32;
  v17 = &v26;
  v18 = &v20;
  v19 = a4;
  v12 = v10;
  dispatch_sync(queue, v14);
  *a5 = objc_retainAutorelease((id)v27[5]);
  *a6 = objc_retainAutorelease((id)v21[5]);
  LOBYTE(a6) = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return (char)a6;
}

void __111__WBSHistoryServiceURLCompletion_queryVisitCounts_outVisitCountScore_outDailyVisitCounts_outWeeklyVisitCounts___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t *v3;
  _QWORD *v4;
  BOOL v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v2 = (void *)a1[5];
  v3 = (uint64_t *)(a1[4] + 16);
  v4 = (_QWORD *)a1[9];
  v13 = 0;
  v14 = 0;
  v5 = SafariShared::URLCompletionEntryMap::queryVisitCounts(v3, v2, v4, &v14, &v13);
  v6 = v14;
  v7 = v13;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;
  v12 = v6;

  v10 = *(_QWORD *)(a1[8] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

}

- (void)recordVisit:(id)a3 sourceVisit:(id)a4 title:(id)a5 loadSuccessful:(BOOL)a6 origin:(int64_t)a7 increaseVisitCount:(BOOL)a8 score:(int)a9 statusCode:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  NSObject *queue;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  int64_t v27;
  int64_t v28;
  int v29;
  BOOL v30;
  BOOL v31;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__WBSHistoryServiceURLCompletion_recordVisit_sourceVisit_title_loadSuccessful_origin_increaseVisitCount_score_statusCode___block_invoke;
  block[3] = &unk_1E4B3C390;
  block[4] = self;
  v24 = v16;
  v30 = a6;
  v27 = a10;
  v28 = a7;
  v31 = a8;
  v29 = a9;
  v25 = v18;
  v26 = v17;
  v20 = v17;
  v21 = v18;
  v22 = v16;
  dispatch_barrier_async(queue, block);

}

void __122__WBSHistoryServiceURLCompletion_recordVisit_sourceVisit_title_loadSuccessful_origin_increaseVisitCount_score_statusCode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  NSString *v10;
  id v11;
  void *v12;

  v2 = WBSStatusCodeGroupFromStatusCode();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "urlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "visitTime");
  SafariShared::URLCompletionEntryMap::recordVisit((uint64_t *)(v3 + 16), v4, v5, *(unsigned __int8 *)(a1 + 84), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 85), *(_DWORD *)(a1 + 80), v2 == 4, v6);

  if (*(_QWORD *)(a1 + 56))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "urlString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "urlString");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::__emplace_multi<NSString * {__strong},NSString * {__strong}>((_QWORD *)(v7 + 64), (const void **)&v12, (uint64_t *)&v11);

    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "urlString");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "urlString");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    SafariShared::URLCompletionEntryMap::setNextItemInRedirectChainOfItem((SafariShared::URLCompletionEntryMap *)(v8 + 16), v9, v10);

  }
}

- (void)updateVisit:(id)a3 title:(id)a4 databaseID:(id)a5
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
  v15[2] = __63__WBSHistoryServiceURLCompletion_updateVisit_title_databaseID___block_invoke;
  v15[3] = &unk_1E4B399F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_barrier_async(queue, v15);

}

void __63__WBSHistoryServiceURLCompletion_updateVisit_title_databaseID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSString *v3;
  double v4;
  NSString *v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "urlString");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "visitTime");
  SafariShared::URLCompletionEntryMap::updateItemTitle((SafariShared::URLCompletionEntryMap *)(v2 + 16), v5, v4, *(NSString **)(a1 + 48), v3);

}

- (void)updateVisit:(id)a3 oldScore:(int)a4 newScore:(int)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int v18;
  int v19;

  v10 = a3;
  v11 = a6;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__WBSHistoryServiceURLCompletion_updateVisit_oldScore_newScore_completionHandler___block_invoke;
  v15[3] = &unk_1E4B392E8;
  v15[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_barrier_async(queue, v15);

}

void __82__WBSHistoryServiceURLCompletion_updateVisit_oldScore_newScore_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSString *v3;
  double v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  BOOL v9;

  v9 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "urlString");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "visitTime");
  SafariShared::URLCompletionEntryMap::updateItemScore((SafariShared::URLCompletionEntryMap *)(v2 + 16), v3, v4, *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60), &v9);

  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__WBSHistoryServiceURLCompletion_updateVisit_oldScore_newScore_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4B39220;
  v7 = *(id *)(a1 + 48);
  v8 = v9;
  dispatch_async(v5, v6);

}

uint64_t __82__WBSHistoryServiceURLCompletion_updateVisit_oldScore_newScore_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)removeURLStrings:(id)a3
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
  v7[2] = __51__WBSHistoryServiceURLCompletion_removeURLStrings___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(queue, v7);

}

void __51__WBSHistoryServiceURLCompletion_removeURLStrings___block_invoke(uint64_t a1)
{
  SafariShared::URLCompletionEntryMap::remove((uint64_t *)(*(_QWORD *)(a1 + 32) + 16), *(void **)(a1 + 40));
}

- (double)lastVisitTimeForURLString:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSHistoryServiceURLCompletion_lastVisitTimeForURLString___block_invoke;
  block[3] = &unk_1E4B384C0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__WBSHistoryServiceURLCompletion_lastVisitTimeForURLString___block_invoke(uint64_t a1)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = SafariShared::URLCompletionEntryMap::lastVisitTime((SafariShared::URLCompletionEntryMap *)(*(_QWORD *)(a1 + 32) + 16), *(NSString **)(a1 + 40));
}

- (id)_endOfRedirectChain:(id)a3
{
  NSString *v4;
  URLCompletionEntryMap *p_map;
  uint64_t v6;
  NSString *v7;

  v4 = (NSString *)a3;
  p_map = &self->_map;
  v6 = 16;
  while (1)
  {
    SafariShared::URLCompletionEntryMap::nextItemInRedirectChainOfItem((SafariShared::URLCompletionEntryMap *)p_map, v4);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      break;

    v4 = v7;
    if (!--v6)
      return v7;
  }
  v7 = v4;
  return v7;
}

- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 enumerationGroup:(id)a6 enumerationBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  dispatch_queue_t v15;
  void *v16;
  OS_dispatch_queue *queue;
  int v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  WBSHistoryServiceURLCompletion *v23;
  id v24;
  _QWORD *v25;
  unint64_t v26;
  double v27;
  _QWORD v28[11];
  int v29;

  v12 = a3;
  v13 = a7;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x6012000000;
  v28[3] = __Block_byref_object_copy__38;
  v28[4] = __Block_byref_object_dispose__39;
  v28[5] = 256;
  memset(&v28[6], 0, 40);
  v29 = 1065353216;
  v14 = a6;
  v15 = dispatch_queue_create("WBSHistoryServiceURLCompletion.redundancyPreventer", 0);
  v16 = (void *)v28[6];
  v28[6] = v15;

  queue = self->_queue;
  if (threadCountToEnumerateConcurrently(void)::onceToken != -1)
    dispatch_once(&threadCountToEnumerateConcurrently(void)::onceToken, &__block_literal_global_95);
  v18 = threadCountToEnumerateConcurrently(void)::threadCount;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __113__WBSHistoryServiceURLCompletion_searchForUserTypedString_options_currentTime_enumerationGroup_enumerationBlock___block_invoke;
  v21[3] = &unk_1E4B3C3B8;
  v25 = v28;
  v26 = a4;
  v22 = v12;
  v23 = self;
  v27 = a5;
  v24 = v13;
  v19 = v13;
  v20 = v12;
  SafariShared::URLCompletionEntryMap::enumerateConcurrently((uint64_t)&self->_map, v14, queue, v18, v21);

  _Block_object_dispose(v28, 8);
  std::__hash_table<NSString * {__strong},std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::allocator<NSString * {__strong}>>::~__hash_table((uint64_t)&v28[7]);

}

void __113__WBSHistoryServiceURLCompletion_searchForUserTypedString_options_currentTime_enumerationGroup_enumerationBlock___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSString *v4;
  NSString *v5;
  WBSURLCompletionUserTypedString *v6;
  __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  WBSHistoryServiceURLCompletionMatchData *v13;
  void *v14;
  uint64_t **v15;
  uint64_t **v16;
  uint64_t **v17;
  CFTypeRef v18;
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = *(NSString **)(a2 + 24);
  v5 = (NSString *)a1[4];
  v6 = (WBSURLCompletionUserTypedString *)a1[8];
  v7 = (__CFString *)*(id *)(a2 + 16);
  LOBYTE(v4) = SafariShared::BookmarkAndHistoryCompletionMatch::hasMatchWithOptions(v7, v4, v5, v6);

  if ((v4 & 1) != 0)
  {
    v8 = (void *)a1[5];
    v9 = *(id *)a2;
    objc_msgSend(v8, "_endOfRedirectChain:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;

    v11 = *(_QWORD *)(a1[7] + 8);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    v12 = *(NSObject **)(v11 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN12SafariShared32URLCompletionRedundancyPreventer22shouldProcessURLStringEP8NSString_block_invoke;
    block[3] = &unk_1E4B3C498;
    block[5] = v11 + 48;
    block[6] = v10;
    block[4] = &v20;
    dispatch_sync(v12, block);
    LODWORD(v9) = *((unsigned __int8 *)v21 + 24);
    _Block_object_dispose(&v20, 8);
    if ((_DWORD)v9)
    {
      v13 = -[WBSHistoryServiceURLCompletionMatchData initWithLastVisitWasFailure:visitWasFromThisDevice:visitWasClientError:]([WBSHistoryServiceURLCompletionMatchData alloc], "initWithLastVisitWasFailure:visitWasFromThisDevice:visitWasClientError:", *(_QWORD *)(a2 + 48) >= 0, (*(_QWORD *)(a2 + 48) >> 59) & 1, (*(_QWORD *)(a2 + 48) >> 58) & 1);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SafariShared::URLCompletionEntryMap::addURLCompletionMatchEntryToArray((uint64_t *)(a1[5] + 16), v13, v14, v10);
      v15 = std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::__equal_range_multi<NSString * {__strong}>((_QWORD *)(a1[5] + 64), &v18);
      v17 = v16;
      while (v15 != v17)
      {
        SafariShared::URLCompletionEntryMap::addURLCompletionMatchEntryToArray((uint64_t *)(a1[5] + 16), v13, v14, v15[3]);
        v15 = (uint64_t **)*v15;
      }
      if (objc_msgSend(v14, "count"))
      {
        -[WBSHistoryServiceURLCompletionMatchData setEntries:](v13, "setEntries:", v14);
        (*(void (**)(void))(a1[6] + 16))();
      }

      v10 = (void *)v18;
    }

  }
}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(log(in|out|on)|sign(in|out|on)|authenticat)"), 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpression;
  -[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpression = v0;

}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  WBSHistoryServiceURLCompletionMatchEntry *v11;
  id v12;
  uint64_t v13;
  id v14;
  double v15;
  WBSHistoryServiceURLCompletionMatchEntry *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  WBSHistoryServiceURLCompletionMatchEntry *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  WBSHistoryServiceURLCompletionMatchEntry *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  int v34;

  if (!*(_QWORD *)(a2 + 32))
  {
    v34 = *(_DWORD *)(a2 + 48);
    if (*(_DWORD *)(a1 + 120) <= v34)
    {
      v4 = *(id *)a2;
      objc_msgSend(v4, "safari_canonicalURLStringForFrequentlyVisitedSites");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(_QWORD *)(a2 + 48) & 0x8000000000000000) != 0
        || (v6 = *(void **)(a1 + 32)) != 0 && (objc_msgSend(v6, "containsObject:", v5) & 1) != 0)
      {
        v7 = *(void **)(a1 + 40);
        if ((!v7 || (objc_msgSend(v7, "containsObject:", v5) & 1) == 0)
          && ((objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", CFSTR("http:")) & 1) != 0
           || objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", CFSTR("https:")))
          && ((*(_BYTE *)(a1 + 96) & 1) == 0
           || objc_msgSend((id)-[WBSHistoryServiceURLCompletion computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:]::filterExpression, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) == 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "host");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            SafariShared::URLCompletionEntryMap::visitedMoreThanOnceStatistics((SafariShared::URLCompletionEntryMap *)(*(_QWORD *)(a1 + 48) + 16), (NSString *)v4);
            v10 = WBSTopSitesScore();
            if (v10 > 0.0)
            {
              v11 = [WBSHistoryServiceURLCompletionMatchEntry alloc];
              v12 = *(id *)a2;
              v13 = *(_QWORD *)(a2 + 24);
              v14 = v12;
              *(float *)&v15 = v10;
              v16 = -[WBSHistoryServiceURLCompletionMatchEntry initWithURLString:title:topSitesScore:visitCountScore:](v11, "initWithURLString:title:topSitesScore:visitCountScore:", v14, v13, v34, v15);

              v25[0] = MEMORY[0x1E0C809B0];
              v25[2] = __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_4;
              v25[3] = &unk_1E4B3C400;
              v17 = *(_QWORD *)(a1 + 96);
              v18 = *(void **)(a1 + 72);
              v29 = *(_QWORD *)(a1 + 80);
              v31 = v17;
              v19 = *(NSObject **)(a1 + 56);
              v20 = *(NSObject **)(a1 + 64);
              v25[1] = 3221225472;
              v33 = v10;
              v26 = v18;
              v21 = v9;
              v22 = *(_QWORD *)(a1 + 88);
              v27 = v21;
              v28 = v16;
              v23 = *(_QWORD *)(a1 + 112);
              v30 = v22;
              v32 = v23;
              v24 = v16;
              dispatch_group_async(v19, v20, v25);

            }
          }

        }
      }

    }
  }
}

void __145__WBSHistoryServiceURLCompletion_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  float v3;
  float v4;
  uint64_t v5;
  void **v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void **v19;
  void *v20;
  id v21;
  float v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  id v29;
  id v30;

  if (*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) <= *(float *)(a1 + 88))
  {
    if ((*(_BYTE *)(a1 + 72) & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        v3 = *(float *)(a1 + 88);
        v29 = v2;
        objc_msgSend(v2, "topSitesScore");
        if (v3 < v4)
        {

          return;
        }
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v7 = *(void ***)(v5 + 48);
        v6 = *(void ***)(v5 + 56);
        v2 = v29;
        if (v7 != v6)
        {
          while (*v7 != v29)
          {
            if (++v7 == v6)
            {
              v7 = *(void ***)(v5 + 56);
              break;
            }
          }
        }
        if (v7 != v6)
        {
          std::__unwrap_and_dispatch[abi:sn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,WBSHistoryServiceURLCompletionMatchEntry * {__strong}*,WBSHistoryServiceURLCompletionMatchEntry * {__strong}*,WBSHistoryServiceURLCompletionMatchEntry * {__strong}*,0>(v7 + 1, v6, v7);
          v9 = v8;
          for (i = *(_QWORD *)(v5 + 56); i != v9; i -= 8)
          {
            v11 = *(void **)(i - 8);

          }
          *(_QWORD *)(v5 + 56) = v9;
          v2 = v29;
        }
      }

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(uint64_t **)(v12 + 48);
    v13 = *(uint64_t **)(v12 + 56);
    if (*(_QWORD *)(a1 + 80) <= (unint64_t)(v13 - v14))
    {
      if (v14 == v13)
        goto LABEL_32;
      objc_msgSend((id)*(v13 - 1), "topSitesScore");
      if (v15 > *(float *)(a1 + 88))
        return;
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v17 = *(_QWORD *)(v16 + 56);
      if (*(_QWORD *)(v16 + 48) == v17)
        goto LABEL_32;

      *(_QWORD *)(v16 + 56) = v17 - 8;
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v14 = *(uint64_t **)(v12 + 48);
      v13 = *(uint64_t **)(v12 + 56);
    }
    if (v13 != v14)
    {
      v18 = v13 - v14;
      do
      {
        v19 = (void **)&v14[v18 >> 1];
        v20 = *v19;
        v30 = *(id *)(a1 + 48);
        v21 = v20;
        objc_msgSend(v30, "topSitesScore");
        v23 = v22;
        objc_msgSend(v21, "topSitesScore");
        v25 = v24;

        if (v23 > v25)
        {
          v18 >>= 1;
        }
        else
        {
          v14 = (uint64_t *)(v19 + 1);
          v18 += ~(v18 >> 1);
        }
      }
      while (v18);
      v13 = v14;
    }
    std::vector<WBSHistoryServiceURLCompletionMatchEntry * {__strong}>::insert((_QWORD *)(v12 + 48), v13, (id *)(a1 + 48));
    v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48);
    v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56);
    if (*(_QWORD *)(a1 + 80) <= (unint64_t)((v26 - v27) >> 3))
    {
      if (v27 != v26)
      {
        objc_msgSend(*(id *)(v26 - 8), "topSitesScore");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v28;
        return;
      }
LABEL_32:
      __break(1u);
    }
  }
}

- (void).cxx_destruct
{
  void *v3;
  id *m_table;

  std::__hash_table<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},NSString * {__strong}>>>::~__hash_table((uint64_t)&self->_redirectSources);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},std::unique_ptr<SafariShared::URLCompletionEntryExtras>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::unique_ptr<SafariShared::URLCompletionEntryExtras>>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::unique_ptr<SafariShared::URLCompletionEntryExtras>>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::unique_ptr<SafariShared::URLCompletionEntryExtras>>>>::~__hash_table((uint64_t)&self->_map._extras);
  m_table = (id *)self->_map._map.var0.m_table;
  if (m_table)
    WTF::HashTable<SafariShared::URLCompletionEntryKey,SafariShared::URLCompletionEntry,SafariShared::URLCompletionEntryKeyExtractor,SafariShared::URLCompletionEntryHash,SafariShared::URLCompletionEntryValueTraits,SafariShared::URLCompletionEntryKeyTraits>::deallocateTable(m_table, v3);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_warmUpWithDatabase:.cold.1()
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
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v4, v5, "Failed to fetch URLs and Page's title from database: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_warmUpWithDatabase:.cold.2()
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
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v4, v5, "Failed to resolve indirections from database: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_warmUpWithDatabase:.cold.3()
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
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v4, v5, "Failed to Warm Up: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_warmUpWithDatabase:(uint64_t *)a1 .cold.4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_DEBUG, "Resolved indirections (%zi)", (uint8_t *)&v3, 0xCu);
}

- (void)_warmUpWithDatabase:(os_log_t)log .cold.5(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  if (*a1)
    v3 = *(unsigned int *)(v3 - 12);
  v4 = *a2;
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  _os_log_fault_impl(&dword_1A3D90000, log, OS_LOG_TYPE_FAULT, "The warmup procedure was interrupted by a memory pressure warning; Loaded %zi, Total database is %zi",
    (uint8_t *)&v5,
    0x16u);
}

- (void)_warmUpWithDatabase:(os_log_t)log .cold.6(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Loaded URLs and titles", v1, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)updateItemWithLatestVisit:database:.cold.1()
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
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v4, v5, "Failed to initialize statement to fetch item corresponding to visit: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateItemWithLatestVisit:database:.cold.2()
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
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v4, v5, "Failed to fetch item corresponding to visit: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateItemWithLatestVisit:(uint64_t)a3 database:(os_log_t)log .cold.3(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Could not find item corresponding to visit %lld (with item ID %lld)", buf, 0x16u);
}

@end
