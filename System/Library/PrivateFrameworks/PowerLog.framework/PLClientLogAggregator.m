@implementation PLClientLogAggregator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  return (id)sharedInstance_sharedInstance;
}

void __39__PLClientLogAggregator_sharedInstance__block_invoke()
{
  PLClientLogAggregator *v0;
  void *v1;

  v0 = objc_alloc_init(PLClientLogAggregator);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (PLClientLogAggregator)init
{
  PLClientLogAggregator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *aggregatesCache;
  os_log_t v5;
  OS_os_log *logHandle;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *executionQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLClientLogAggregator;
  v2 = -[PLClientLogAggregator init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    aggregatesCache = v2->_aggregatesCache;
    v2->_aggregatesCache = v3;

    *(_WORD *)&v2->_numAggregates = 0;
    v5 = os_log_create("com.apple.powerlog.clientLogAggregator", ");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v5;

    if (!v2->_logHandle)
      objc_storeStrong((id *)&v2->_logHandle, MEMORY[0x1E0C81028]);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("PLClientLogAggregator", v7);
    executionQueue = v2->_executionQueue;
    v2->_executionQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (void)_scheduleFlushTimer
{
  void *v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD handler[5];

  -[PLClientLogAggregator flushTimer](self, "flushTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PLClientLogAggregator executionQueue](self, "executionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    -[PLClientLogAggregator setFlushTimer:](self, "setFlushTimer:", v5);

    -[PLClientLogAggregator flushTimer](self, "flushTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_walltime(0, 900000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x14F46B0400uLL);

    -[PLClientLogAggregator flushTimer](self, "flushTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __44__PLClientLogAggregator__scheduleFlushTimer__block_invoke;
    handler[3] = &unk_1E4165E90;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    -[PLClientLogAggregator flushTimer](self, "flushTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v9);

  }
}

uint64_t __44__PLClientLogAggregator__scheduleFlushTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushToPowerLog");
}

- (BOOL)aggregateForClientID_async:(signed __int16)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  signed __int16 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[PLClientLogAggregator executionQueue](self, "executionQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__PLClientLogAggregator_aggregateForClientID_async_eventName_eventDictionary_configuration___block_invoke;
  v18[3] = &unk_1E4166290;
  v21 = v12;
  v22 = &v24;
  v23 = a3;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v18);

  LOBYTE(self) = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return (char)self;
}

void __92__PLClientLogAggregator_aggregateForClientID_async_eventName_eventDictionary_configuration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)(a1 + 72));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v5 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v2, "_aggregateForClientID:eventName:eventDictionary:configuration:", v6, v3, v4, v5);

}

- (BOOL)_aggregateForClientID:(id)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v34;
  void *v35;
  void *v36;
  PLClientLogAggregator *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *context;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v43 = a5;
  v12 = a6;
  v13 = v12;
  v14 = 0;
  v40 = v10;
  if (v10 && v11 && v43 && v12)
  {
    -[PLClientLogAggregator logHandle](self, "logHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v51 = v10;
      v52 = 2112;
      v53 = v11;
      v54 = 2112;
      v55 = v43;
      v56 = 2112;
      v57 = v13;
      _os_log_debug_impl(&dword_19EA99000, v15, OS_LOG_TYPE_DEBUG, "Received (clientID:%@, eventName:%@, eventDictionary:%@) for aggregation with configuration:%@", buf, 0x2Au);
    }

    if (-[PLClientLogAggregator _isEventInputValid:configuration:](self, "_isEventInputValid:configuration:", v43, v13))
    {
      objc_msgSend(v13, "allKeysForObject:", &unk_1E416C4F0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectsForKeys:notFoundMarker:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v16;
        v21 = objc_msgSend(v18, "indexOfObject:", v19);

        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {

          v39 = 0;
          v14 = 0;
LABEL_31:

          goto LABEL_32;
        }
        v34 = v20;
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v18, v20);

      }
      else
      {
        v34 = v16;
        v39 = &unk_1E416CA28;
      }
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v36 = v13;
      v22 = v13;
      v42 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v42)
      {
        v41 = *(_QWORD *)v46;
        v37 = self;
        v38 = v22;
        while (2)
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v46 != v41)
              objc_enumerationMutation(v22);
            v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            context = (void *)MEMORY[0x1A1AECD98]();
            objc_msgSend(v22, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "unsignedIntValue"))
            {
              v26 = objc_msgSend(v25, "unsignedIntValue") - 1;
              if (v26 > 3)
              {

                objc_autoreleasePoolPop(context);
                v14 = 0;
                v20 = v34;
                v13 = v36;
                goto LABEL_31;
              }
              v27 = (uint64_t)*(&off_1E4166350 + (int)v26);
              objc_msgSend(v43, "objectForKeyedSubscript:", v24);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                -[PLClientLogAggregator _eventAggregate:eventName:aggregateKey:valueLabel:](self, "_eventAggregate:eventName:aggregateKey:valueLabel:", v40, v11, v39, v24);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "objectForKeyedSubscript:", v24);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *, void *))(v27 + 16))(v27, v29, v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                v22 = v38;
                self = v37;
                -[PLClientLogAggregator _setEventAggregate:eventName:aggregateKey:valueLabel:value:](v37, "_setEventAggregate:eventName:aggregateKey:valueLabel:value:", v40, v11, v39, v24, v31);

              }
            }

            objc_autoreleasePoolPop(context);
          }
          v42 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v42)
            continue;
          break;
        }
      }

      -[PLClientLogAggregator setNumAggregations:](self, "setNumAggregations:", (-[PLClientLogAggregator numAggregations](self, "numAggregations") + 1));
      if (-[PLClientLogAggregator numAggregations](self, "numAggregations") == 1)
        -[PLClientLogAggregator _scheduleFlushTimer](self, "_scheduleFlushTimer");
      v32 = -[PLClientLogAggregator numAggregations](self, "numAggregations", v34);
      v20 = v35;
      if (v32 >= 0x14)
        -[PLClientLogAggregator _flushToPowerLog](self, "_flushToPowerLog");
      v14 = 1;
      v13 = v36;
      goto LABEL_31;
    }
    v14 = 0;
  }
LABEL_32:

  return v14;
}

- (BOOL)_isEventInputValid:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v21;
  unsigned int v22;
  const __CFString *v23;
  PLClientLogAggregator *v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const __CFString *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {
    -[PLClientLogAggregator logHandle](self, "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PLClientLogAggregator _isEventInputValid:configuration:].cold.5(v6, v7, v9);
    goto LABEL_31;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v6;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v10)
  {
    v11 = v10;
    v24 = self;
    v25 = 0;
    v12 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[PLClientLogAggregator logHandle](v24, "logHandle");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            -[PLClientLogAggregator _isEventInputValid:configuration:].cold.4(v14, v19);

          goto LABEL_31;
        }
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (unint64_t)objc_msgSend(v15, "unsignedIntegerValue") >= 5)
        {
          -[PLClientLogAggregator logHandle](v24, "logHandle");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[PLClientLogAggregator _isEventInputValid:configuration:].cold.2();

          goto LABEL_31;
        }
        -[NSObject objectForKey:](v9, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "unsignedIntegerValue"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[PLClientLogAggregator logHandle](v24, "logHandle");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v22 = objc_msgSend(v15, "unsignedIntegerValue");
              if (v22 > 4)
                v23 = CFSTR("(null)");
              else
                v23 = off_1E4166370[v22];
              *(_DWORD *)buf = 138412802;
              v31 = v14;
              v32 = 2112;
              v33 = v16;
              v34 = 2112;
              v35 = v23;
              _os_log_debug_impl(&dword_19EA99000, v21, OS_LOG_TYPE_DEBUG, "Invalid event data -- value for %@: %@ (according to configuration, %@ expects NSNumber)", buf, 0x20u);
            }
LABEL_38:

            goto LABEL_31;
          }
          v25 = 1;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              -[PLClientLogAggregator logHandle](v24, "logHandle");
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                -[PLClientLogAggregator _isEventInputValid:configuration:].cold.3();
              goto LABEL_38;
            }
          }
        }

      }
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v11)
        continue;
      break;
    }

    self = v24;
    if ((v25 & 1) != 0)
    {
      v17 = 1;
      goto LABEL_32;
    }
  }
  else
  {

  }
  -[PLClientLogAggregator logHandle](self, "logHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLClientLogAggregator _isEventInputValid:configuration:].cold.1(v9);
LABEL_31:

  v17 = 0;
LABEL_32:

  return v17;
}

- (void)_flushToPowerLog
{
  int v7;

  v7 = objc_msgSend(a2, "numAggregations");
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_debug_impl(&dword_19EA99000, a4, OS_LOG_TYPE_DEBUG, "# of aggregations before flush: %d", a1, 8u);
}

- (void)cleanCache
{
  void *v3;

  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PLClientLogAggregator setNumAggregates:](self, "setNumAggregates:", 0);
  -[PLClientLogAggregator setNumAggregations:](self, "setNumAggregations:", 0);
}

- (id)_eventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKeyedSubscript:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_setEventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6 value:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_opt_new();
    -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v12);

  }
  v64 = v15;
  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v24 = (void *)objc_opt_new();
    -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v24, v13);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSince1970");
  v29 = v28;

  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", v14);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    v34 = (void *)objc_opt_new();
    -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", v13);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v34, v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", v12);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v13);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", v14);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v38, CFSTR("__firstTimestamp"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLClientLogAggregator numAggregates](self, "numAggregates"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", v12);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", v13);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKeyedSubscript:", v14);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v43, CFSTR("__number"));

    -[PLClientLogAggregator setNumAggregates:](self, "setNumAggregates:", (-[PLClientLogAggregator numAggregates](self, "numAggregates") + 1));
  }
  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKeyedSubscript:", v12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "objectForKeyedSubscript:", v13);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKeyedSubscript:", v14);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v16, v64);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectForKeyedSubscript:", v12);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKeyedSubscript:", v13);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", v14);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v52, CFSTR("__lastTimestamp"));

  -[PLClientLogAggregator logHandle](self, "logHandle");
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectForKeyedSubscript:", v12);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", v13);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectForKeyedSubscript:", v14);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("__number"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v66 = v63;
    v67 = 2112;
    v68 = v64;
    _os_log_debug_impl(&dword_19EA99000, v57, OS_LOG_TYPE_DEBUG, "-- Updated aggregated event #%@ (key: %@)", buf, 0x16u);

  }
  return 1;
}

- (NSMutableDictionary)aggregatesCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)numAggregates
{
  return self->_numAggregates;
}

- (void)setNumAggregates:(unsigned __int8)a3
{
  self->_numAggregates = a3;
}

- (unsigned)numAggregations
{
  return self->_numAggregations;
}

- (void)setNumAggregations:(unsigned __int8)a3
{
  self->_numAggregations = a3;
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)executionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExecutionQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_source)flushTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFlushTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_aggregatesCache, 0);
}

- (void)_isEventInputValid:(os_log_t)log configuration:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19EA99000, log, OS_LOG_TYPE_DEBUG, "Invalid configuration -- expected at least one numeric AggregateType key", v1, 2u);
}

- (void)_isEventInputValid:configuration:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_19EA99000, v0, (uint64_t)v0, "Invalid configuration -- value for %@: %@ (expected AggregateType)", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_isEventInputValid:configuration:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_19EA99000, v0, (uint64_t)v0, "Invalid event data -- GROUP_BY on %@: %@ (expected NSString or NSNumber)", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_isEventInputValid:(uint64_t)a1 configuration:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19EA99000, a2, OS_LOG_TYPE_DEBUG, "Invalid event data -- %@ key (expected NSString)", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_isEventInputValid:(NSObject *)a3 configuration:.cold.5(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 134218240;
  v7 = objc_msgSend(a1, "count");
  v8 = 2048;
  v9 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_6(&dword_19EA99000, a3, v5, "Invalid configuration -- event data (%lu) and configuration (%lu) should have the same number of keys", (uint8_t *)&v6);
}

@end
