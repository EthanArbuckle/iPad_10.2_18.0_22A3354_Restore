@implementation RTCReportingAVCDeprecatedPeriodic

- (RTCReportingAVCDeprecatedPeriodic)initWithSession:(id)a3
{
  RTCReportingAVCDeprecatedPeriodic *v4;
  RTCReportingAVCDeprecatedPeriodic *v5;
  NSObject *v6;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RTCReportingAVCDeprecatedPeriodic;
  v4 = -[RTCReportingAVCDeprecatedPeriodic init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_session = (RTCReporting *)a3;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.RTCPeriodicTask", v6);
    v7 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v5->_periodicTaskQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.PeriodicReportingTask", v7);
    v5->_periodicServiceDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_timer)
    -[RTCReportingAVCDeprecatedPeriodic stopLogTimer](self, "stopLogTimer");

  dispatch_release((dispatch_object_t)self->_queue);
  dispatch_release((dispatch_object_t)self->_periodicTaskQueue);
  v3.receiver = self;
  v3.super_class = (Class)RTCReportingAVCDeprecatedPeriodic;
  -[RTCReportingAVCDeprecatedPeriodic dealloc](&v3, sel_dealloc);
}

- (void)_myPeriodicTask:(unsigned __int16)a3 type:(unsigned __int16)a4 intervalMultiplier:(int)a5 updateTimeout:(unint64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t i;
  void *v25;
  dispatch_time_t v26;
  NSObject *periodicTaskQueue;
  NSMutableDictionary *periodicServiceDict;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t j;
  void *v33;
  dispatch_time_t v34;
  NSObject *v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  dispatch_time_t v52;
  _BOOL8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BOOL8 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  dispatch_time_t v69;
  _BOOL8 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BOOL8 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _BOOL8 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _BOOL8 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int v103;
  id v104;
  NSObject *group;
  _QWORD v106[6];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  _QWORD block[8];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _QWORD v118[4];
  _QWORD v119[4];
  _BYTE v120[128];
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  uint64_t v130;

  v8 = a4;
  v9 = a3;
  v130 = *MEMORY[0x1E0C80C00];
  ++self->_counter;
  v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v11)
    -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.9(v11, v12, v13, v14, v15, v16, v17, v18);
  group = dispatch_group_create();
  v19 = dispatch_semaphore_create(4);
  if (self->_counter == a5)
  {
    v104 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v121 = 0;
    v122 = &v121;
    v123 = 0x6010000000;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0;
    v124 = "";
    v125 = 850045863;
    v20 = (void *)objc_msgSend((id)-[NSMutableDictionary allKeys](self->_periodicServiceDict, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global);
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v113, v120, 16);
    if (v21)
    {
      v103 = v8;
      v22 = *(_QWORD *)v114;
      v23 = 95000000000 * a6 / 0x64;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v114 != v22)
            objc_enumerationMutation(v20);
          v25 = (void *)-[NSMutableDictionary objectForKey:](self->_periodicServiceDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * i));
          if (objc_msgSend(v25, "report"))
          {
            v26 = dispatch_time(0, v23);
            if (dispatch_semaphore_wait(v19, v26))
            {
              v44 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
              v9 = v9;
              v8 = v103;
              if (v44)
                -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.5(v44, v45, v46, v47, v48, v49, v50, v51);
              goto LABEL_40;
            }
            periodicTaskQueue = self->_periodicTaskQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke_26;
            block[3] = &unk_1E2EB2A70;
            block[4] = v25;
            block[5] = v104;
            block[6] = v19;
            block[7] = &v121;
            dispatch_group_async(group, periodicTaskQueue, block);
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v113, v120, 16);
        if (v21)
          continue;
        break;
      }
      v9 = v9;
      v8 = v103;
    }
    else
    {
      v23 = 95000000000 * a6 / 0x64;
    }
    v69 = dispatch_time(0, v23);
    if (dispatch_group_wait(group, v69))
    {
      v70 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v70)
        -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.4(v70, v71, v72, v73, v74, v75, v76, v77);
    }
LABEL_40:
    pthread_mutex_lock((pthread_mutex_t *)(v122 + 4));
    v78 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v78)
      -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.3(v78, v79, v80, v81, v82, v83, v84, v85);
    v111 = 0;
    if (objc_msgSend(v104, "count"))
    {
      v86 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v86)
        -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.2(v86, v87, v88, v89, v90, v91, v92, v93);
      v119[0] = &unk_1E2EB5320;
      v118[0] = CFSTR("ParametersFlag");
      v118[1] = CFSTR("ParametersCategory");
      v119[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9);
      v118[2] = CFSTR("ParametersType");
      v94 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v8);
      v118[3] = CFSTR("ParametersPayload");
      v119[2] = v94;
      v119[3] = v104;
      -[RTCReporting sendMessageWithDictionary:error:](self->_session, "sendMessageWithDictionary:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 4), &v111);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v122 + 4));

    v95 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v95)
      -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.1(v95, v96, v97, v98, v99, v100, v101, v102);
    self->_counter = 0;
    _Block_object_dispose(&v121, 8);
  }
  else
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    periodicServiceDict = self->_periodicServiceDict;
    v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](periodicServiceDict, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v108;
      v31 = 95000000000 * a6 / 0x64;
      while (2)
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v108 != v30)
            objc_enumerationMutation(periodicServiceDict);
          v33 = (void *)-[NSMutableDictionary objectForKey:](self->_periodicServiceDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j));
          if (objc_msgSend(v33, "update"))
          {
            v34 = dispatch_time(0, v31);
            if (dispatch_semaphore_wait(v19, v34))
            {
              v36 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
              if (v36)
                -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.8(v36, v37, v38, v39, v40, v41, v42, v43);
              goto LABEL_34;
            }
            v35 = self->_periodicTaskQueue;
            v106[0] = MEMORY[0x1E0C809B0];
            v106[1] = 3221225472;
            v106[2] = __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke_31;
            v106[3] = &unk_1E2EB2A98;
            v106[4] = v33;
            v106[5] = v19;
            dispatch_group_async(group, v35, v106);
          }
        }
        v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](periodicServiceDict, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
        if (v29)
          continue;
        break;
      }
    }
    else
    {
      v31 = 95000000000 * a6 / 0x64;
    }
    v52 = dispatch_time(0, v31);
    if (dispatch_group_wait(group, v52))
    {
      v53 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v53)
        -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.7(v53, v54, v55, v56, v57, v58, v59, v60);
    }
LABEL_34:
    v61 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v61)
      -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.6(v61, v62, v63, v64, v65, v66, v67, v68);
  }
  dispatch_release(group);
  dispatch_release(v19);
}

uint64_t __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v7;

  v5 = objc_msgSend(a2, "integerValue");
  if (v5 > objc_msgSend(a3, "integerValue"))
    return 1;
  v7 = objc_msgSend(a2, "integerValue");
  if (v7 >= objc_msgSend(a3, "integerValue"))
    return 0;
  else
    return -1;
}

intptr_t __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke_26(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "block");
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v2);
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  if (v2)
  {
    v4 = *(void **)(a1 + 40);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v2);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v2, "objectForKeyedSubscript:", v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v4, "objectForKeyedSubscript:", v9))
            {
              objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v9), "addEntriesFromDictionary:", objc_msgSend(v2, "objectForKeyedSubscript:", v9));
              continue;
            }
          }
          else
          {
            objc_msgSend(v2, "objectForKeyedSubscript:", v9);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "objectForKeyedSubscript:", v9))
            {
              objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v9), "addObjectsFromArray:", objc_msgSend(v2, "objectForKeyedSubscript:", v9));
              continue;
            }
          }
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v2, "objectForKeyedSubscript:", v9), v9);
        }
        v6 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke_31(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "block");
  (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)startLogTimerWithInterval:(int)a3 reportingMultiplier:(int)a4 category:(unsigned __int16)a5 type:(unsigned __int16)a6
{
  NSObject *queue;
  _QWORD block[5];
  int v8;
  int v9;
  unsigned __int16 v10;
  unsigned __int16 v11;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke;
  block[3] = &unk_1E2EB2AE8;
  block[4] = self;
  v10 = a5;
  v11 = a6;
  v8 = a3;
  v9 = a4;
  dispatch_async(queue, block);
}

void __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  _QWORD handler[6];
  int v11;
  int v12;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v1 + 24));
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v3 + 40))
    {
      *(_DWORD *)(v3 + 8) = 0;
      v4 = 1000000000 * *(unsigned int *)(a1 + 40);
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      v6 = dispatch_walltime(0, 0);
      dispatch_source_set_timer(v5, v6, v4, 0x5F5E100uLL);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(NSObject **)(v7 + 40);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke_2;
      handler[3] = &unk_1E2EB2AC0;
      v9 = *(_DWORD *)(a1 + 48);
      v11 = *(_DWORD *)(a1 + 44);
      v12 = v9;
      handler[4] = v7;
      handler[5] = v4;
      dispatch_source_set_event_handler(v8, handler);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke_cold_1();
    }
  }
}

uint64_t __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_myPeriodicTask:type:intervalMultiplier:updateTimeout:", *(unsigned __int16 *)(a1 + 52), *(unsigned __int16 *)(a1 + 54), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)stopLogTimer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__RTCReportingAVCDeprecatedPeriodic_stopLogTimer__block_invoke;
  block[3] = &unk_1E2EB2B10;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__RTCReportingAVCDeprecatedPeriodic_stopLogTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v3)
    {
      *(_WORD *)v11 = 0;
      _os_log_debug_impl(&dword_1921BE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "stopLogTimer.", v11, 2u);
      v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    }
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
  else if (v3)
  {
    __49__RTCReportingAVCDeprecatedPeriodic_stopLogTimer__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (BOOL)registerPeriodicTaskForModule:(unsigned int)a3 needToUpdate:(BOOL)a4 needToReport:(BOOL)a5 serviceBlock:(id)a6
{
  NSObject *queue;
  _QWORD block[6];
  unsigned int v10;
  BOOL v11;
  BOOL v12;

  if (a6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__RTCReportingAVCDeprecatedPeriodic_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock___block_invoke;
    block[3] = &unk_1E2EB2B38;
    v11 = a4;
    v12 = a5;
    block[4] = self;
    block[5] = a6;
    v10 = a3;
    dispatch_async(queue, block);
  }
  return a6 != 0;
}

void __106__RTCReportingAVCDeprecatedPeriodic_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  _BYTE *v3;
  UpdateAndReportServices *v4;
  UpdateAndReportServices *v5;
  int *v6;
  unsigned int v7;

  v2 = (unsigned __int8 *)(a1 + 53);
  v3 = (_BYTE *)(a1 + 52);
  v4 = -[UpdateAndReportServices initWithServices:needToReport:service:]([UpdateAndReportServices alloc], "initWithServices:needToReport:service:", *(unsigned __int8 *)(a1 + 52), *(unsigned __int8 *)(a1 + 53), *(_QWORD *)(a1 + 40));
  if (v4)
  {
    v5 = v4;
    v7 = *(_DWORD *)(a1 + 48);
    v6 = (int *)(a1 + 48);
    objc_msgSend(*(id *)(*((_QWORD *)v6 - 2) + 16), "setObject:forKeyedSubscript:", v4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __106__RTCReportingAVCDeprecatedPeriodic_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock___block_invoke_cold_1(v6, v3, v2);

  }
}

- (BOOL)unregisterPeriodTaskForModule:(unsigned int)a3
{
  NSObject *queue;
  _QWORD v5[5];
  unsigned int v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke;
  v5[3] = &unk_1E2EB2B60;
  v5[4] = self;
  v6 = a3;
  dispatch_sync(queue, v5);
  return 1;
}

void __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = a1 + 40;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40))))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40)));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke_cold_1(v2, v10, v11, v12, v13, v14, v15, v16);
  }
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "_myPeriodicTask: Finished RT metrics collection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "_myPeriodicTask: Sent realtime event after collection all RT metrics", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "_myPeriodicTask: All RT metrics collected", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "_myPeriodicTask: Timeout during periodic tasks metrics collection. Not all stats will be reported", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "_myPeriodicTask: Timeout scheduling RT metrics report tasks", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "_myPeriodicTask: Finished RT updates for all registered modules.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "_myPeriodicTask: Timeout during RT metrics update", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "_myPeriodicTask: Timeout scheduling RT metrics update tasks", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "_myPeriodicTask: Started RT periodic task", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke_cold_1()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1921BE000, MEMORY[0x1E0C81028], v0, "startLogTimerWithInterval: %d, %d", v1);
  OUTLINED_FUNCTION_3();
}

void __49__RTCReportingAVCDeprecatedPeriodic_stopLogTimer__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "stopLogTimer: No timer is present.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __106__RTCReportingAVCDeprecatedPeriodic_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock___block_invoke_cold_1(int *a1, _BYTE *a2, unsigned __int8 *a3)
{
  int v3;
  const char *v4;
  int v5;
  const char *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = "";
  v5 = *a3;
  if (*a2)
    v6 = "";
  else
    v6 = " no";
  v7[0] = 67109634;
  if (!v5)
    v4 = " no";
  v7[1] = v3;
  v8 = 2080;
  v9 = v6;
  v10 = 2080;
  v11 = v4;
  OUTLINED_FUNCTION_7(&dword_1921BE000, MEMORY[0x1E0C81028], (uint64_t)a3, "registerPeriodicTaskForModule: %u,%s update,%s reporting", (uint8_t *)v7);
}

void __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "unregisterPeriodTaskForModule: %u doesn't exist", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1921BE000, MEMORY[0x1E0C81028], a3, "unregisterPeriodTaskForModule: %u removed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
