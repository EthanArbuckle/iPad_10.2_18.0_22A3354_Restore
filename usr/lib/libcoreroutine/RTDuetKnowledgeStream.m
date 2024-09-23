@implementation RTDuetKnowledgeStream

- (RTDuetKnowledgeStream)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStreamType_knowledgeStore_);
}

- (RTDuetKnowledgeStream)initWithDuetKnowledgeStore:(id)a3 streamType:(int64_t)a4
{
  return -[RTDuetKnowledgeStream initWithStreamType:knowledgeStore:](self, "initWithStreamType:knowledgeStore:", a4, a3);
}

- (RTDuetKnowledgeStream)initWithStreamType:(int64_t)a3 knowledgeStore:(id)a4
{
  id v7;
  void *v8;
  RTDuetKnowledgeStream *v9;
  RTDuetKnowledgeStream *v10;
  RTDuetKnowledgeStream *v11;
  NSObject *v12;
  const char *v13;
  objc_super v15;
  uint8_t buf[16];

  v7 = a4;
  v8 = v7;
  if ((unint64_t)a3 >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v11 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: RT_DUET_KNOWLEDGE_STREAM_STREAM_TYPE_VALID(streamType)";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: knowledgeStore";
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTDuetKnowledgeStream;
  v9 = -[RTDuetKnowledgeStream init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_streamType = a3;
    objc_storeStrong((id *)&v9->_knowledgeStore, a4);
  }
  self = v10;
  v11 = self;
LABEL_10:

  return v11;
}

- (void)dealloc
{
  _DKEventStream *eventStream;
  objc_super v4;

  eventStream = self->_eventStream;
  self->_eventStream = 0;

  -[RTDuetKnowledgeStore reset](self->_knowledgeStore, "reset");
  v4.receiver = self;
  v4.super_class = (Class)RTDuetKnowledgeStream;
  -[RTDuetKnowledgeStream dealloc](&v4, sel_dealloc);
}

- (void)purge
{
  _DKEventStream *eventStream;
  RTDuetKnowledgeStream *obj;

  obj = self;
  objc_sync_enter(obj);
  eventStream = obj->_eventStream;
  obj->_eventStream = 0;

  -[RTDuetKnowledgeStore reset](obj->_knowledgeStore, "reset");
  objc_sync_exit(obj);

}

- (void)enumerateEventsWithinDateInterval:(id)a3 usingBlock:(id)a4
{
  id v6;
  RTDuetKnowledgeStream *v7;
  _DKEventStream *eventStream;
  _DKEventStream *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  _DKEventStream *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  dispatch_time_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  char v42;
  id v43;
  NSObject *v44;
  char v45;
  unint64_t v46;
  id v47;
  NSObject *v48;
  NSObject *v50;
  id v51;
  objc_class *v52;
  void *v53;
  int64_t streamType;
  uint64_t v56;
  uint64_t v57;
  dispatch_semaphore_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void (**v62)(id, _QWORD, id, char *);
  void *context;
  id *obj;
  void *v65;
  void *v66;
  _QWORD v67[4];
  NSObject *v68;
  id *v69;
  uint64_t *v70;
  _BYTE *v71;
  uint64_t *v72;
  uint64_t v73;
  id *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  char v85;
  _BYTE v86[24];
  id *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  uint8_t buf[16];
  void *v93;
  void *v94;
  uint64_t v95;
  const __CFString *v96;
  uint64_t v97;
  const __CFString *v98;
  _QWORD v99[4];

  v99[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v61 = v6;
  v62 = (void (**)(id, _QWORD, id, char *))a4;
  if (v62)
  {
    v85 = 0;
    if (v6)
    {
      v7 = self;
      objc_sync_enter(v7);
      eventStream = v7->_eventStream;
      obj = (id *)&v7->super.isa;
      if (eventStream)
      {
        v9 = eventStream;
LABEL_12:
        v59 = v9;
        v58 = dispatch_semaphore_create(0);
        v16 = 0;
        v60 = 0;
        v79 = 0;
        v80 = &v79;
        v81 = 0x3032000000;
        v82 = __Block_byref_object_copy__93;
        v83 = __Block_byref_object_dispose__93;
        v84 = 0;
        v73 = 0;
        v74 = (id *)&v73;
        v75 = 0x3032000000;
        v76 = __Block_byref_object_copy__93;
        v77 = __Block_byref_object_dispose__93;
        v78 = 0;
        v56 = *MEMORY[0x1E0D18598];
        v57 = *MEMORY[0x1E0CB2D50];
        while (1)
        {
          context = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0D15AD0];
          objc_msgSend(v61, "startDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "endDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "predicateForEventsWithStartInDateRangeFrom:to:", v18, v19);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = (void *)MEMORY[0x1E0D15A08];
          v94 = v59;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v66;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v65, v21, v60, 1000, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          *(_QWORD *)v86 = 0;
          *(_QWORD *)&v86[8] = v86;
          *(_QWORD *)&v86[16] = 0x2020000000;
          v87 = 0;
          v24 = obj[3];
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __70__RTDuetKnowledgeStream_enumerateEventsWithinDateInterval_usingBlock___block_invoke;
          v67[3] = &unk_1E92A0860;
          v70 = &v73;
          v25 = v58;
          v71 = v86;
          v72 = &v79;
          v68 = v25;
          v69 = obj;
          objc_msgSend(v24, "executeQuery:completion:", v23, v67);
          v26 = v25;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v26, v28))
            goto LABEL_18;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "timeIntervalSinceDate:", v27);
          v31 = v30;
          v32 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_74);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "filteredArrayUsingPredicate:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "submitToCoreAnalytics:type:duration:", v36, 1, v31);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v38 = (void *)MEMORY[0x1E0CB35C8];
          v99[0] = v57;
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v99, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "errorWithDomain:code:userInfo:", v56, 15, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            v41 = objc_retainAutorelease(v40);

            v42 = 0;
          }
          else
          {
LABEL_18:
            v42 = 1;
            v41 = v16;
          }

          v43 = v41;
          if ((v42 & 1) == 0)
            objc_storeStrong(v74 + 5, v41);
          v62[2](v62, v80[5], v74[5], &v85);
          objc_msgSend(obj[3], "resume");
          if (v85)
            break;
          if (v74[5])
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v47 = v74[5];
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v47;
              _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "received error while enumerating duet events, %@, breaking out.", buf, 0xCu);
            }
            goto LABEL_27;
          }
          v46 = *(_QWORD *)(*(_QWORD *)&v86[8] + 24);
          if (v46 < 0x3E8)
          {
            v45 = 0;
            goto LABEL_29;
          }
          v60 += v46;
          v44 = v80[5];
          v80[5] = 0;
          v45 = 1;
LABEL_28:

LABEL_29:
          _Block_object_dispose(v86, 8);

          objc_autoreleasePoolPop(context);
          v16 = v43;
          if ((v45 & 1) == 0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              v51 = (id)objc_claimAutoreleasedReturnValue();
              v52 = (objc_class *)objc_opt_class();
              NSStringFromClass(v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v86 = 138413314;
              *(_QWORD *)&v86[4] = v51;
              *(_WORD *)&v86[12] = 2112;
              *(_QWORD *)&v86[14] = v53;
              *(_WORD *)&v86[22] = 2112;
              v87 = obj;
              v88 = 2048;
              v89 = v60;
              v90 = 2112;
              v91 = v61;
              _os_log_debug_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_DEBUG, "%@, %@, %@, events, %lu, date interval, %@", v86, 0x34u);

            }
            _Block_object_dispose(&v73, 8);

            _Block_object_dispose(&v79, 8);
            goto LABEL_37;
          }
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_DEBUG, "client set stop bit while enumerating duet events, breaking out.", buf, 2u);
        }
LABEL_27:
        v45 = 0;
        goto LABEL_28;
      }
      objc_msgSend((id)objc_opt_class(), "duetKnowledgeStreamTypeToDuetEventStream:", v7->_streamType);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v7->_eventStream;
      v7->_eventStream = (_DKEventStream *)v14;

      v9 = v7->_eventStream;
      if (v9)
        goto LABEL_12;
      v95 = *MEMORY[0x1E0CB2D50];
      v96 = CFSTR("Invalid duet stream type.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTDuetKnowledgeStoreErrorDomain"), 1);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        streamType = v7->_streamType;
        *(_DWORD *)v86 = 134217984;
        *(_QWORD *)&v86[4] = streamType;
        _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "Invalid duet stream type, %ld", v86, 0xCu);
      }

      v62[2](v62, 0, v43, &v85);
LABEL_37:

      v11 = obj;
      objc_sync_exit(obj);
    }
    else
    {
      v97 = *MEMORY[0x1E0CB2D50];
      v98 = CFSTR("Non-nil date interval required.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTDuetKnowledgeStoreErrorDomain"), 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v86 = 0;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Non-nil date interval required", v86, 2u);
      }

      v62[2](v62, 0, v12, &v85);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v86 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block", v86, 2u);
    }

  }
}

void __70__RTDuetKnowledgeStream_enumerateEventsWithinDateInterval_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v27 = *MEMORY[0x1E0CB2D50];
      v28[0] = CFSTR("Object type containing fetched duet results was not an NSArray.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTDuetKnowledgeStoreErrorDomain"), 2, v7);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

    }
    else
    {
      v7 = v5;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v7, "count");
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = v8;

        }
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v11 = v7;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
              v17 = (void *)MEMORY[0x1D8231EA8](v12);
              objc_msgSend(*(id *)(a1 + 40), "_convertDuetEvent:", v16, (_QWORD)v22);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v18);

              objc_autoreleasePoolPop(v17);
              ++v15;
            }
            while (v13 != v15);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            v13 = v12;
          }
          while (v12);
        }

      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  }
}

- (id)_convertDuetEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t streamType;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  unint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  streamType = self->_streamType;
  if (streamType < 2)
    goto LABEL_4;
  if (streamType != 2)
  {
    if (streamType != 3)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = 134218498;
        v20 = streamType;
        v21 = 2080;
        v22 = "-[RTDuetKnowledgeStream _convertDuetEvent:]";
        v23 = 1024;
        v24 = 222;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Unhandled stream type, %lu (in %s:%d)", (uint8_t *)&v19, 0x1Cu);
      }

      goto LABEL_11;
    }
LABEL_4:
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (!v8)
      goto LABEL_11;
    goto LABEL_7;
  }
  objc_msgSend(v4, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(MEMORY[0x1E0D15A90], "stationary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if (v10 != v12)
  {
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v13 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v5, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithStartDate:endDate:", v14, v15);

LABEL_12:
  return v16;
}

+ (id)duetKnowledgeStreamTypeToDuetEventStream:(int64_t)a3
{
  void *v3;
  NSObject *v4;
  id result;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0D15AF8], "deviceIsPluggedInStream");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      objc_msgSend(MEMORY[0x1E0D15AF8], "keybagIsLockedStream");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x1E0D15AF8], "motionStream");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x1E0D15AF8], "wifiConnectionStream");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      result = v3;
      break;
    default:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315394;
        v7 = "+[RTDuetKnowledgeStream duetKnowledgeStreamTypeToDuetEventStream:]";
        v8 = 1024;
        v9 = 247;
        _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Returning nil _DKEventStream for RTDuetKnowledgeStreamStreamType. (in %s:%d)", (uint8_t *)&v6, 0x12u);
      }

      result = 0;
      break;
  }
  return result;
}

+ (id)streamTypeToString:(int64_t)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 4)
    return off_1E92A08A0[a3];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "+[RTDuetKnowledgeStream streamTypeToString:]";
    v7 = 1024;
    v8 = 273;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Returning nil for RTDuetKnowledgeStreamStreamType. (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "streamTypeToString:", self->_streamType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventStream name](self->_eventStream, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("stream, %@, name, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (_DKEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_eventStream, a3);
}

- (RTDuetKnowledgeStore)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
}

@end
