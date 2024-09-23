@implementation PPEventCache

- (PPEventCache)initWithEventStorage:(id)a3
{
  id v6;
  PPEventCache *v7;
  PPEventCache *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _PASLock *data;
  uint64_t v18;
  PPCalendarInternPool *calendarInternPool;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  dispatch_source_t v24;
  OS_dispatch_source *memoryPressureSource;
  NSObject *v26;
  void *v28;
  _QWORD handler[4];
  PPEventCache *v30;
  id v31;
  id location;
  objc_super v33;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEventCache.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventStorage"));

  }
  v33.receiver = self;
  v33.super_class = (Class)PPEventCache;
  v7 = -[PPEventCache init](&v33, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_storage, a3);
    v9 = (_QWORD *)objc_opt_new();
    v10 = objc_opt_new();
    v11 = (void *)v9[1];
    v9[1] = v10;

    v12 = objc_opt_new();
    v13 = (void *)v9[2];
    v9[2] = v12;

    v9[3] = 3600;
    v14 = objc_opt_new();
    v15 = (void *)v9[4];
    v9[4] = v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v9);
    data = v8->_data;
    v8->_data = (_PASLock *)v16;

    v18 = objc_opt_new();
    calendarInternPool = v8->_calendarInternPool;
    v8->_calendarInternPool = (PPCalendarInternPool *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.proactive.PPEventCache", v21);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v22;

    v24 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, (dispatch_queue_t)v8->_queue);
    memoryPressureSource = v8->_memoryPressureSource;
    v8->_memoryPressureSource = (OS_dispatch_source *)v24;

    location = 0;
    objc_initWeak(&location, v8);
    v26 = v8->_memoryPressureSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __37__PPEventCache_initWithEventStorage___block_invoke;
    handler[3] = &unk_1E7E1F660;
    objc_copyWeak(&v31, &location);
    v30 = v8;
    dispatch_source_set_event_handler(v26, handler);
    dispatch_resume((dispatch_object_t)v8->_memoryPressureSource);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  return v8;
}

- (void)setExtraSecondsToBackfill:(unint64_t)a3
{
  _PASLock *data;
  _QWORD v4[5];

  data = self->_data;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__PPEventCache_setExtraSecondsToBackfill___block_invoke;
  v4[3] = &__block_descriptor_40_e33_v16__0__PPEventCacheGuardedData_8l;
  v4[4] = a3;
  -[_PASLock runWithLockAcquired:](data, "runWithLockAcquired:", v4);
}

- (id)objectForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  _PASLock *data;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  PPEventCache *v18;
  id v19;
  NSUInteger v20;
  NSUInteger v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  length = a3.length;
  location = a3.location;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  data = self->_data;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __31__PPEventCache_objectForRange___block_invoke;
  v17 = &unk_1E7E17AF0;
  v20 = location;
  v21 = length;
  v18 = self;
  v8 = v6;
  v19 = v8;
  -[_PASLock runWithLockAcquired:](data, "runWithLockAcquired:", &v14);
  pp_events_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v8, "count", v14, v15, v16, v17, v18);
    *(_DWORD *)buf = 134217984;
    v23 = v10;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPEventCache: cache returning %tu events", buf, 0xCu);
  }

  v11 = v19;
  v12 = v8;

  return v12;
}

- (id)refreshCacheWithChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  PPEventStorage *storage;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  PPEventStorage *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  BOOL v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  _PASLock *data;
  id v38;
  _PASLock *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  PPEventStorage *v46;
  void *v47;
  id v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  _PASLock *v53;
  void *v54;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  id v60;
  id obj;
  void *v62;
  PPEventCache *v63;
  _QWORD v64[4];
  id v65;
  PPEventCache *v66;
  _QWORD v67[6];
  id v68;
  uint64_t *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint8_t v86[128];
  _BYTE buf[24];
  void *v88;
  __int128 v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63 = self;
  -[PPCalendarInternPool clearPool](self->_calendarInternPool, "clearPool");
  v5 = (void *)objc_opt_new();
  v59 = (void *)objc_opt_new();
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_49_5983);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_53_5985);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_54);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v7, "initWithObjects:forKeys:", v8, v9);

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v82;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v82 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1C3BD6630]();
        objc_opt_class();
        if (v13)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v13, "ownerID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            __40__PPEventCache_refreshCacheWithChanges___block_invoke(v15, v5);

            goto LABEL_10;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = v13;
            if (objc_msgSend(v16, "changeType") == 2
              || (storage = v63->_storage,
                  objc_msgSend(v16, "calendarID"),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  LODWORD(storage) = -[PPEventStorage shouldIgnoreEventsOnCalendarWithObjectID:](storage, "shouldIgnoreEventsOnCalendarWithObjectID:", v18), v18, !(_DWORD)storage))
            {
              v27 = objc_msgSend(v16, "changeType");
              if (v27 != 2)
              {
                if (v27 != 1)
                {
                  if (v27)
                    goto LABEL_36;
                  objc_msgSend(v16, "originalItemID");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = v28 == 0;

                  if (!v29)
                  {
                    objc_msgSend(v16, "originalItemID");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    __40__PPEventCache_refreshCacheWithChanges___block_invoke(v30, v5);

                  }
                }
                objc_msgSend(v16, "changedObjectID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                __40__PPEventCache_refreshCacheWithChanges___block_invoke(v20, v5);
                goto LABEL_35;
              }
              objc_msgSend(v16, "changedObjectID");
              v31 = objc_claimAutoreleasedReturnValue();
              __40__PPEventCache_refreshCacheWithChanges___block_invoke((void *)v31, v59);

              objc_msgSend(v16, "originalItemID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v31) = v32 == 0;

              if ((v31 & 1) == 0)
              {
                objc_msgSend(v16, "originalItemID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                __40__PPEventCache_refreshCacheWithChanges___block_invoke(v20, v5);
                goto LABEL_35;
              }
            }
            else
            {
              pp_events_log_handle();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v16;
                _os_log_debug_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEBUG, "PPEventChange: filtered out subscribed calendar event change %@", buf, 0xCu);
              }

              objc_msgSend(v16, "changedObjectID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              __40__PPEventCache_refreshCacheWithChanges___block_invoke(v20, v59);
LABEL_35:

            }
LABEL_36:

            goto LABEL_10;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v21 = v13;
            if (objc_msgSend(v21, "changeType") == 2)
              goto LABEL_31;
            v22 = v63->_storage;
            objc_msgSend(v21, "ownerID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v22) = -[PPEventStorage shouldIgnoreEventsOnCalendarWithObjectID:](v22, "shouldIgnoreEventsOnCalendarWithObjectID:", v24);

            if (!(_DWORD)v22)
            {
LABEL_31:
              objc_msgSend(v21, "ownerID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              __40__PPEventCache_refreshCacheWithChanges___block_invoke(v26, v5);
            }
            else
            {
              pp_events_log_handle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v21;
                _os_log_debug_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEBUG, "PPEventChange: filtered out subscribed calendar event participant change %@", buf, 0xCu);
              }

              objc_msgSend(v21, "changedObjectID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              __40__PPEventCache_refreshCacheWithChanges___block_invoke(v26, v59);
            }

          }
        }
        else
        {
          objc_opt_class();
          objc_opt_class();
          objc_opt_class();
          objc_opt_class();
        }
LABEL_10:
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
      v10 = v33;
    }
    while (v33);
  }

  v34 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v59, "setByAddingObjectsFromSet:", v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v34);
  v36 = v35;
  if (v63)
  {
    data = v63->_data;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __36__PPEventCache__deleteCachedEvents___block_invoke;
    v88 = &unk_1E7E17BE0;
    v38 = v36;
    *(_QWORD *)&v89 = v36;
    -[_PASLock runWithLockAcquired:](data, "runWithLockAcquired:", buf);

    v36 = v38;
  }
  v56 = v36;

  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__5968;
  v79 = __Block_byref_object_dispose__5969;
  v80 = 0;
  v39 = v63->_data;
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __40__PPEventCache_refreshCacheWithChanges___block_invoke_60;
  v74[3] = &unk_1E7E17BB8;
  v74[4] = &v75;
  -[_PASLock runWithLockAcquired:](v39, "runWithLockAcquired:", v74);
  v62 = (void *)objc_opt_new();
  v40 = objc_msgSend(v5, "count");
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v60 = v5;
  v41 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v71;
    do
    {
      v43 = 0;
      v58 = v40 - v41;
      do
      {
        if (*(_QWORD *)v71 != v42)
          objc_enumerationMutation(v60);
        v44 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v43);
        v45 = (void *)MEMORY[0x1C3BD6630]();
        v46 = v63->_storage;
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __40__PPEventCache_refreshCacheWithChanges___block_invoke_2_63;
        v67[3] = &unk_1E7E1BAE0;
        v67[4] = v63;
        v67[5] = v44;
        v69 = &v75;
        v68 = v62;
        -[PPEventStorage runBlockWithPurgerDisabled:](v46, "runBlockWithPurgerDisabled:", v67);
        if (!(v40 % 0xA))
          -[PPEventStorage attemptToPurgeImmediately](v63->_storage, "attemptToPurgeImmediately");

        objc_autoreleasePoolPop(v45);
        ++v43;
        --v40;
      }
      while (v41 != v43);
      v41 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
      v40 = v58;
    }
    while (v41);
  }

  v47 = (void *)objc_opt_new();
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __40__PPEventCache_refreshCacheWithChanges___block_invoke_4_66;
  v64[3] = &unk_1E7E1F5F8;
  v48 = v47;
  v65 = v48;
  v66 = v63;
  objc_msgSend(v62, "_pas_mappedArrayWithTransform:", v64);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  pp_events_log_handle();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = v76[5];
    *(_DWORD *)buf = 138413059;
    *(_QWORD *)&buf[4] = v51;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v56;
    *(_WORD *)&buf[22] = 2117;
    v88 = v49;
    LOWORD(v89) = 2112;
    *(_QWORD *)((char *)&v89 + 2) = obj;
    _os_log_impl(&dword_1C392E000, v50, OS_LOG_TYPE_DEFAULT, "PPEventCache: dateInterval for cache: %@, affected object IDs: %@, resulting PPEvents: %{sensitive}@, changes %@", buf, 0x2Au);
  }

  v52 = v49;
  if (objc_msgSend(v52, "count"))
  {
    v53 = v63->_data;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __37__PPEventCache__refreshCachedEvents___block_invoke;
    v88 = &unk_1E7E17A20;
    *(_QWORD *)&v89 = v52;
    *((_QWORD *)&v89 + 1) = v63;
    -[_PASLock runWithLockAcquired:](v53, "runWithLockAcquired:", buf);

  }
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v52, v56);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v75, 8);
  return v54;
}

- (void)removeAllObjects
{
  NSObject *v3;
  uint8_t v4[16];

  pp_events_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "PPEventCache: removing all objects from event cache", v4, 2u);
  }

  -[PPCalendarInternPool clearPool](self->_calendarInternPool, "clearPool");
  -[_PASLock runWithLockAcquired:](self->_data, "runWithLockAcquired:", &__block_literal_global_68_5981);
}

- (void)evictAllEventsNotInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  _PASLock *data;
  uint64_t v8;
  id v9;
  id v10;
  _PASLock *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  NSUInteger v18;
  NSUInteger v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  length = a3.length;
  location = a3.location;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  data = self->_data;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__PPEventCache_evictAllEventsNotInRange___block_invoke;
  v16[3] = &unk_1E7E17C50;
  v18 = location;
  v19 = length;
  v17 = v6;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](data, "runWithLockAcquired:", v16);
  v10 = v9;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v11 = self->_data;
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __42__PPEventCache_evictAllEventsNotInRanges___block_invoke;
  v20[3] = &unk_1E7E17CA0;
  v15 = v10;
  v21 = v15;
  v22 = &v28;
  v23 = &v24;
  -[_PASLock runWithLockAcquired:](v11, "runWithLockAcquired:", v20);
  pp_events_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = v29[3];
    v14 = v25[3];
    *(_DWORD *)buf = 134218240;
    v33 = v13;
    v34 = 2048;
    v35 = v14;
    _os_log_debug_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEBUG, "PPEventCache: evictions happened: %tu to %tu events", buf, 0x16u);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

- (void)setEventHighlight:(id)a3
{
  id v4;
  void *v5;
  PPEventFeatureScore *v6;
  void *v7;
  double v8;
  PPEventFeatureScore *v9;
  _PASLock *data;
  PPEventFeatureScore *v11;
  NSObject *v12;
  __int16 v13[8];
  _QWORD v14[4];
  id v15;
  PPEventFeatureScore *v16;

  v4 = a3;
  objc_msgSend(v4, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [PPEventFeatureScore alloc];
    objc_msgSend(v4, "features");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "score");
    v9 = -[PPEventFeatureScore initWithFeatureValues:weightedScore:prominentFeature:](v6, "initWithFeatureValues:weightedScore:prominentFeature:", v7, objc_msgSend(v4, "prominentFeature"), v8);

    data = self->_data;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __34__PPEventCache_setEventHighlight___block_invoke;
    v14[3] = &unk_1E7E17A20;
    v15 = v5;
    v16 = v9;
    v11 = v9;
    -[_PASLock runWithLockAcquired:](data, "runWithLockAcquired:", v14);

  }
  else
  {
    pp_events_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 0;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPEventCache: trying to set cache for event with nil eventIdentifier", (uint8_t *)v13, 2u);
    }

  }
}

- (id)cachedEventHighlightForEvent:(id)a3 rankingOptions:(int)a4 trialWrapper:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _PASLock *data;
  void *v13;
  double v14;
  double v15;
  PPEventScorer *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void *v27;
  id v28;
  uint8_t *v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "eventIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_msgSend(v8, "title"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    *(_QWORD *)buf = 0;
    v31 = buf;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__5968;
    v34 = __Block_byref_object_dispose__5969;
    v35 = 0;
    data = self->_data;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __73__PPEventCache_cachedEventHighlightForEvent_rankingOptions_trialWrapper___block_invoke;
    v27 = &unk_1E7E17CC8;
    v29 = buf;
    v28 = v10;
    -[_PASLock runWithLockAcquired:](data, "runWithLockAcquired:", &v24);
    v13 = (void *)*((_QWORD *)v31 + 5);
    if (v13)
    {
      objc_msgSend(v13, "weightedScore", v24, v25, v26, v27);
      v15 = v14;
      v16 = -[PPEventScorer initWithTrialWrapper:]([PPEventScorer alloc], "initWithTrialWrapper:", v9);
      v17 = -[PPEventScorer scoreIsExtraordinary:rankingOptions:](v16, "scoreIsExtraordinary:rankingOptions:", v6, v15);

      v18 = (void *)MEMORY[0x1E0D70B38];
      v19 = objc_msgSend(*((id *)v31 + 5), "prominentFeature");
      objc_msgSend(*((id *)v31 + 5), "featureValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "eventHighlightWithEvent:score:prominentFeature:features:isExtraordinary:", v8, v19, v20, v17, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    pp_events_log_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, "PPEventCache: trying to retrieve cache with nil eventIdentifier or nil title.", buf, 2u);
    }

    v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_calendarInternPool, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __73__PPEventCache_cachedEventHighlightForEvent_rankingOptions_trialWrapper___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __34__PPEventCache_setEventHighlight___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __41__PPEventCache_evictAllEventsNotInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v3 = *(void **)(a2 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PPEventCache_evictAllEventsNotInRange___block_invoke_2;
  v4[3] = &unk_1E7E17C28;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateRangesInRange:options:usingBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, v4);

}

void __42__PPEventCache_evictAllEventsNotInRanges___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id *v6;
  _QWORD v7[4];
  id *v8;
  id v9;

  v6 = a2;
  if ((objc_msgSend(v6[2], "isEqualToIndexSet:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_storeStrong(v6 + 2, *(id *)(a1 + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6[1], "count");
    v3 = (void *)objc_opt_new();
    v4 = v6[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__PPEventCache_evictAllEventsNotInRanges___block_invoke_2;
    v7[3] = &unk_1E7E17C78;
    v8 = v6;
    v9 = v3;
    v5 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
    objc_msgSend(v6[1], "removeObjectsAtIndexes:", v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6[1], "count");

  }
}

void __42__PPEventCache_evictAllEventsNotInRanges___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v13 = v5;
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  if ((objc_msgSend(v6, "containsIndex:", (unint64_t)v8) & 1) != 0)
  {
LABEL_5:

    v12 = v13;
    goto LABEL_6;
  }
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v13, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  LOBYTE(v9) = objc_msgSend(v9, "containsIndex:", (unint64_t)v11);

  v12 = v13;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    objc_msgSend(v13, "eventIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v7);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __41__PPEventCache_evictAllEventsNotInRange___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", a2, a3);
}

uint64_t __32__PPEventCache_removeAllObjects__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v2;
  _QWORD *v3;
  void *v4;

  v2 = (void *)a2[1];
  v3 = a2;
  objc_msgSend(v2, "removeAllObjects");
  objc_msgSend((id)v3[2], "removeAllIndexes");
  v4 = (void *)v3[4];

  return objc_msgSend(v4, "removeAllObjects");
}

void __40__PPEventCache_refreshCacheWithChanges___block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if (objc_msgSend(v4, "entityType") == 2)
    objc_msgSend(v3, "addObject:", v4);

}

void __40__PPEventCache_refreshCacheWithChanges___block_invoke_60(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id *v8;

  v8 = a2;
  if (objc_msgSend(v8[2], "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v8[2], "firstIndex"));
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v8[2], "lastIndex"));
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v3, v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __40__PPEventCache_refreshCacheWithChanges___block_invoke_2_63(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 8);
  v8[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[6];
  v5 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PPEventCache_refreshCacheWithChanges___block_invoke_3_65;
  v6[3] = &unk_1E7E1F5D0;
  v7 = v4;
  objc_msgSend(v2, "enumerateEventsFromEKObjectIDs:expandingRecurrencesInRange:usingBlock:", v3, v5, v6);

}

uint64_t __40__PPEventCache_refreshCacheWithChanges___block_invoke_4_66(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

void __37__PPEventCache__refreshCachedEvents___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_events_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(v3[1], "count");
    v12 = 134217984;
    v13 = v9;
    _os_log_debug_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEBUG, "PPEventCache: cached event count before refresh: %tu", (uint8_t *)&v12, 0xCu);
  }

  pp_events_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v12 = 138739971;
    v13 = v10;
    _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "PPEventCache: refreshing events: %{sensitive}@", (uint8_t *)&v12, 0xCu);
  }

  mergeDeduping(v3[1], *(void **)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v3[1];
  v3[1] = (id)v6;

  pp_events_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = objc_msgSend(v3[1], "count");
    v12 = 134217984;
    v13 = v11;
    _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "PPEventCache: cached event count after refresh: %tu", (uint8_t *)&v12, 0xCu);
  }

  -[PPEventCache _scheduleCacheBackingFileUpdate](*(unsigned __int8 **)(a1 + 40));
}

- (void)_scheduleCacheBackingFileUpdate
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[8];

  if (a1)
  {
    v2 = a1 + 32;
    do
      v3 = __ldaxr(v2);
    while (__stlxr(1u, v2));
    pp_events_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((v3 & 1) != 0)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "PPEventCache: cache backing plist file update already scheduled", buf, 2u);
      }

    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPEventCache: scheduling cache backing plist file update", buf, 2u);
      }

      v6 = (void *)os_transaction_create();
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, a1);
      v7 = objc_msgSend(MEMORY[0x1E0D81598], "dispatchTimeWithSecondsFromNow:", 0.5);
      v8 = *((_QWORD *)a1 + 5);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47__PPEventCache__scheduleCacheBackingFileUpdate__block_invoke;
      v10[3] = &unk_1E7E1F660;
      objc_copyWeak(&v12, (id *)buf);
      v11 = v6;
      v9 = v6;
      dispatch_after(v7, v8, v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __47__PPEventCache__scheduleCacheBackingFileUpdate__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;
  _QWORD v5[4];
  _QWORD *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[2];
    v5[1] = 3221225472;
    v5[2] = __47__PPEventCache__scheduleCacheBackingFileUpdate__block_invoke_2;
    v5[3] = &unk_1E7E17A20;
    v4 = WeakRetained;
    v5[0] = MEMORY[0x1E0C809B0];
    v6 = WeakRetained;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v3, "runWithLockAcquired:", v5);

    WeakRetained = v4;
  }

}

id __47__PPEventCache__scheduleCacheBackingFileUpdate__block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32));
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    objc_msgSend(*(id *)(v1 + 16), "runWithLockAcquired:", &__block_literal_global_6004);
  return (id)objc_opt_self();
}

void __50__PPEventCache__updateCacheBackingFileImmediately__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  id *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id *v14;
  uint8_t buf[16];

  v2 = a2;
  objc_msgSend(v2[1], "_pas_mappedArrayWithTransform:", &__block_literal_global_37);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2[5], "isEqual:", v3))
  {
    pp_events_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "PPEventCache: cache backing plist file already up to date";
LABEL_6:
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D815D0], "lazyPlistArrayWithPlistArray:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v2[5];
    v2[5] = (id)v6;

    pp_events_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "PPEventCache: wrote new cache backing plist file";
      goto LABEL_6;
    }
  }

  v8 = v2[5];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__PPEventCache__updateCacheBackingFileImmediately__block_invoke_39;
  v13[3] = &unk_1E7E17AC8;
  v14 = v2;
  v9 = v2;
  objc_msgSend(v8, "_pas_mappedArrayWithIndexedTransform:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mutableCopy");
  v12 = v2[1];
  v2[1] = (id)v11;

}

id __50__PPEventCache__updateCacheBackingFileImmediately__block_invoke_39(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc(MEMORY[0x1E0D70B30]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 40);
  objc_msgSend(*(id *)(v6 + 8), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithIndex:inBackingPlists:calendar:", a3, v7, v9);

  return v10;
}

uint64_t __50__PPEventCache__updateCacheBackingFileImmediately__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "plist");
}

void __40__PPEventCache_refreshCacheWithChanges___block_invoke_3_65(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D70B30], "deferredAllocationEventFromEKEvent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __36__PPEventCache__deleteCachedEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;

  v8 = a2;
  v3 = objc_msgSend(v8[1], "count");
  if (v3)
  {
    v4 = v3 - 1;
    do
    {
      objc_msgSend(v8[1], "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

      if ((_DWORD)v6)
        objc_msgSend(v8[1], "removeObjectAtIndex:", v4);

      --v4;
    }
    while (v4 != -1);
  }

}

uint64_t __40__PPEventCache_refreshCacheWithChanges___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changedObjectID");
}

uint64_t __40__PPEventCache_refreshCacheWithChanges___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "calendarID");
}

BOOL __40__PPEventCache_refreshCacheWithChanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "calendarID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __31__PPEventCache_objectForRange___block_invoke(uint64_t a1, void *a2)
{
  void **v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  void **v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  uint8_t v77[128];
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  uint64_t v93;
  NSRange v94;

  v93 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v63 = a1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "removeIndexes:", v3[2]);
  v5 = objc_msgSend(v4, "firstIndex");
  v59 = v4;
  v6 = objc_msgSend(v4, "lastIndex");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    pp_events_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v3[3];
      *(_DWORD *)buf = 134218496;
      v79 = v5;
      v80 = 2048;
      v81 = v8;
      v82 = 2048;
      v83 = v10;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPEventCache: backfilling from %tu to %tu + %tu", buf, 0x20u);
    }

    v58 = v3;
    v11 = (uint64_t)v3[3] + v8 - v5 + 1;
    v12 = (void *)MEMORY[0x1C3BD6630]();
    v13 = (void *)objc_opt_new();
    v14 = MEMORY[0x1E0C809B0];
    v15 = *(void **)(*(_QWORD *)(v63 + 32) + 8);
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __31__PPEventCache_objectForRange___block_invoke_42;
    v75[3] = &unk_1E7E1F5D0;
    v76 = v13;
    v16 = v13;
    v56 = v11;
    v57 = v5;
    objc_msgSend(v15, "enumerateEventsInRange:usingBlock:", v5, v11, v75);
    v17 = (void *)objc_opt_new();
    v72[0] = v14;
    v72[1] = 3221225472;
    v72[2] = __31__PPEventCache_objectForRange___block_invoke_2;
    v72[3] = &unk_1E7E1F5F8;
    v18 = *(_QWORD *)(v63 + 32);
    v73 = v17;
    v74 = v18;
    v19 = v17;
    objc_msgSend(v16, "_pas_mappedArrayWithTransform:", v72);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v12);
    if (objc_msgSend(v20, "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(v63 + 32) + 8), "attemptToPurgeImmediately");
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v69;
      v60 = *(_QWORD *)v69;
      v61 = v21;
      do
      {
        v25 = 0;
        v62 = v23;
        do
        {
          if (*(_QWORD *)v69 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v25);
          pp_default_log_handle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v26, "objectID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "title");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "calendar");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "title");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "startDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "endDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (int)objc_msgSend(v26, "availability");
            objc_msgSend(v26, "attendees");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544899;
            v79 = (uint64_t)v28;
            v80 = 2117;
            v81 = (uint64_t)v29;
            v82 = 2117;
            v83 = v31;
            v84 = 2113;
            v85 = v32;
            v86 = 2113;
            v87 = v33;
            v88 = 2048;
            v89 = v34;
            v90 = 2117;
            v91 = v35;
            _os_log_impl(&dword_1C392E000, v27, OS_LOG_TYPE_DEFAULT, "PPEventCache: backfilled event: o:%{public}@ t:'%{sensitive}@' c:'%{sensitive}@' s:%{private}@ e:%{private}@ b:%ld a:%{sensitive}@", buf, 0x48u);

            v24 = v60;
            v23 = v62;

            v21 = v61;
          }

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
      }
      while (v23);
    }

    pp_events_log_handle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(v21, "count");
      *(_DWORD *)buf = 134217984;
      v79 = v37;
      _os_log_impl(&dword_1C392E000, v36, OS_LOG_TYPE_DEFAULT, "PPEventCache: backfilling %tu events", buf, 0xCu);
    }

    v3 = v58;
    objc_msgSend(v58[2], "addIndexesInRange:", v57, v56);
    if (objc_msgSend(v21, "count"))
    {
      mergeDeduping(v58[1], v21);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v58[1];
      v58[1] = (void *)v38;

      -[PPEventCache _scheduleCacheBackingFileUpdate](*(unsigned __int8 **)(v63 + 32));
    }
    pp_events_log_handle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_msgSend(v58[1], "count");
      *(_DWORD *)buf = 134217984;
      v79 = v41;
      _os_log_impl(&dword_1C392E000, v40, OS_LOG_TYPE_DEFAULT, "PPEventCache: cached event count after backfill: %tu", buf, 0xCu);
    }

  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v42 = v3[1];
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v65 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v47, "startDate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "timeIntervalSinceReferenceDate");
        v50 = v49;

        objc_msgSend(v47, "endDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "startDate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "timeIntervalSinceDate:", v52);
        v54 = v53;

        if (v50 < 0.0 || v54 < 0.0)
        {
          pp_events_log_handle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C392E000, v55, OS_LOG_TYPE_ERROR, "PPEventCache: Candidate event range is invalid", buf, 2u);
          }

        }
        else
        {
          v94.location = (unint64_t)v50;
          v94.length = (unint64_t)v54;
          if (NSIntersectionRange(*(NSRange *)(v63 + 48), v94).length)
            objc_msgSend(*(id *)(v63 + 40), "addObject:", v47);
        }
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    }
    while (v44);
  }

}

void __31__PPEventCache_objectForRange___block_invoke_42(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D70B30], "deferredAllocationEventFromEKEvent:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  v6 = _Block_copy(v5);

  objc_msgSend(v3, "addObject:", v6);
}

uint64_t __31__PPEventCache_objectForRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

uint64_t __42__PPEventCache_setExtraSecondsToBackfill___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(result + 32);
  return result;
}

void __37__PPEventCache_initWithEventStorage___block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  dispatch_source_t *v9;
  __int16 v10;
  uint8_t v11[2];
  uint8_t buf[16];

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_16;
  v9 = WeakRetained;
  WeakRetained[7] = (dispatch_source_t)dispatch_source_get_data(WeakRetained[6]);
  WeakRetained = v9;
  v3 = *(_QWORD **)(a1 + 32);
  if (!v3)
    goto LABEL_16;
  v4 = v3[7];
  switch(v4)
  {
    case 4:
      pp_events_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v10 = 0;
        v7 = "PPEventCache: memory pressure critical";
        v8 = (uint8_t *)&v10;
LABEL_13:
        _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, v7, v8, 2u);
      }
LABEL_14:
      v6 = 0;
LABEL_15:

      objc_msgSend(v3, "setExtraSecondsToBackfill:", v6);
      WeakRetained = v9;
      break;
    case 2:
      pp_events_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v7 = "PPEventCache: memory pressure warning";
        v8 = v11;
        goto LABEL_13;
      }
      goto LABEL_14;
    case 1:
      pp_events_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPEventCache: memory pressure normal", buf, 2u);
      }
      v6 = 3600;
      goto LABEL_15;
  }
LABEL_16:

}

@end
