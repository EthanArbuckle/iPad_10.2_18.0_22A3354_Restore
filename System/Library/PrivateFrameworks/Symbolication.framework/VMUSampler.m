@implementation VMUSampler

- (unint64_t)recordSampleTo:(id)a3 timestamp:(unint64_t)a4 thread:(unsigned int)a5 recordFramePointers:(BOOL)a6 clearMemoryCache:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  mach_msg_type_number_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  _DWORD *v22;
  unint64_t i;
  thread_inspect_t v24;
  unint64_t v25;
  mach_msg_type_number_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  const void *v31;
  kern_return_t v32;
  kern_return_t v33;
  int pid;
  void *v35;
  _QWORD *v36;
  int v37;
  integer_t v38;
  uint64_t v40;
  VMUBacktrace *v41;
  double v42;
  int v43;
  _QWORD *v44;
  unint64_t v45;
  unsigned int v46;
  ipc_space_t *v47;
  const void *v48;
  uint64_t v49;
  _BOOL4 v50;
  unsigned int maxPreviousThreadCount;
  unsigned int v52;
  unsigned int *previousThreadList;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL4 v62;
  char v63;
  void *v64;
  void *v65;
  _BOOL4 v67;
  mach_msg_type_number_t v68;
  integer_t thread_info_out[4];
  __int128 v70;
  uint64_t v71;
  mach_msg_type_number_t act_listCnt;
  thread_act_array_t act_list;
  unsigned int v74;
  mach_msg_type_number_t thread_info_outCnt[2];
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  kern_return_t v81;
  uint64_t v82;

  v7 = a7;
  v67 = a6;
  v82 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v74 = a5;
  act_list = 0;
  act_listCnt = 0;
  v71 = 0;
  *(_OWORD *)thread_info_out = 0u;
  v70 = 0u;
  if (!self->_samplingContext)
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v12)
      -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_26;
  }
  if (a5)
  {
    act_list = &v74;
    v11 = 1;
    act_listCnt = 1;
  }
  else
  {
    if (task_threads(self->_task, &act_list, &act_listCnt))
      v20 = 1;
    else
      v20 = act_list == 0;
    if (v20)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:].cold.2();
      goto LABEL_26;
    }
    v11 = act_listCnt;
  }
  v21 = self->_previousThreadCount != v11;
  if (self->_recordThreadStates)
  {
    v22 = malloc_type_calloc(v11, 4uLL, 0x100004052888210uLL);
    if (act_listCnt)
    {
      for (i = 0; i < act_listCnt; ++i)
      {
        v24 = act_list[i];
        thread_info_outCnt[0] = 10;
        if (!thread_info(v24, 3u, thread_info_out, thread_info_outCnt))
          v22[i] = DWORD2(v70);
      }
    }
  }
  else
  {
    v22 = 0;
  }
  if (task_suspend2(self->_task, &self->_suspensionToken))
  {
    if (v22)
      free(v22);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:].cold.4();
LABEL_26:
    v25 = 0;
    goto LABEL_27;
  }
  v27 = act_listCnt;
  if (self->_dispatchThreadSoftLimit - 1 < act_listCnt || self->_dispatchThreadHardLimit - 1 < act_listCnt)
  {
    -[VMUSampler _checkDispatchThreadLimits](self, "_checkDispatchThreadLimits");
    v27 = act_listCnt;
  }
  v64 = v10;
  v62 = v7;
  v63 = v21;
  if (act_list && v27)
  {
    self->_mainThread = *act_list;
LABEL_35:
    v28 = 0;
    v65 = 0;
    v29 = g_environment_flags;
    v30 = MEMORY[0x1E0C81028];
    while (1)
    {
      v31 = (const void *)act_list[v28];
      if (v22 && !v22[v28])
        goto LABEL_65;
      v68 = 10;
      v32 = thread_info((thread_inspect_t)v31, 3u, thread_info_out, &v68);
      if (v32)
      {
        v33 = v32;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          pid = self->_pid;
          thread_info_outCnt[0] = 67109888;
          thread_info_outCnt[1] = pid;
          v76 = 1024;
          v77 = v28;
          v78 = 1024;
          v79 = (int)v31;
          v80 = 1024;
          v81 = v33;
          _os_log_error_impl(&dword_1A4D79000, v30, OS_LOG_TYPE_ERROR, "[VMUSampler recordSampleTo:...] thread_info failed for pid %u thread index %u thread %u, err %d", (uint8_t *)thread_info_outCnt, 0x1Au);
        }
        goto LABEL_64;
      }
      v35 = NSMapGet(self->_lastThreadBacktraceMap, v31);
      v36 = v35;
      if (!v35)
        break;
      v37 = thread_info_out[1];
      v38 = *((_DWORD *)v35 + 1);
      if (thread_info_out[1] < v38)
        v37 = thread_info_out[1] + 1000000;
      if (v37 != v38 || thread_info_out[0] - *(_DWORD *)v35 != thread_info_out[1] < v38)
        break;
      v41 = (VMUBacktrace *)*((id *)v35 + 1);
      ++self->_numberOfCopiedBacktraces;
      if (v41)
        goto LABEL_55;
LABEL_63:

LABEL_64:
      v27 = act_listCnt;
LABEL_65:
      if (++v28 >= (unint64_t)v27)
        goto LABEL_66;
    }
    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v40 = objc_claimAutoreleasedReturnValue();

      v65 = (void *)v40;
    }
    v41 = -[VMUBacktrace initWithSamplingContext:thread:recordFramePointers:]([VMUBacktrace alloc], "initWithSamplingContext:thread:recordFramePointers:", self->_samplingContext, v31, v67);
    if (v29)
    {
      objc_msgSend(v65, "timeIntervalSinceNow");
      self->_timeSpentSampling = self->_timeSpentSampling - v42;
    }
    if (!v41)
      goto LABEL_63;
LABEL_55:
    -[VMUBacktrace setTimestamp:](v41, "setTimestamp:", a4);
    v41->_callstack.context.pid = self->_pid;
    if (v22)
      v43 = v22[v28];
    else
      v43 = 0;
    v41->_callstack.context.run_state = v43;
    if (!v36)
    {
      v44 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
      if (!v44)
      {
LABEL_62:
        objc_msgSend(v64, "addObject:", v41);
        goto LABEL_63;
      }
      v36 = v44;
      NSMapInsert(self->_lastThreadBacktraceMap, v31, v44);
      v63 = 1;
    }
    *v36 = *(_QWORD *)thread_info_out;
    v36[1] = v41;
    goto LABEL_62;
  }
  self->_mainThread = 0;
  if (v27)
    goto LABEL_35;
  v65 = 0;
LABEL_66:
  if ((v63 & 1) != 0)
  {
    if (self->_previousThreadCount)
    {
      v45 = 0;
      v46 = 0;
      v47 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      do
      {
        v48 = (const void *)self->_previousThreadList[v45];
        if (act_listCnt <= v46)
        {
LABEL_73:
          mach_port_deallocate(*v47, self->_previousThreadList[v45]);
          NSMapRemove(self->_lastThreadBacktraceMap, v48);
        }
        else
        {
          v49 = 0;
          while (act_list[v46 + v49] != (_DWORD)v48)
          {
            if (act_listCnt - v46 == (_DWORD)++v49)
              goto LABEL_73;
          }
          if (!(_DWORD)v49)
            ++v46;
          if (!a5)
            mach_port_deallocate(*v47, self->_previousThreadList[v45]);
        }
        ++v45;
      }
      while (v45 < self->_previousThreadCount);
      v27 = act_listCnt;
    }
    maxPreviousThreadCount = self->_maxPreviousThreadCount;
    if (maxPreviousThreadCount >= v27)
    {
      previousThreadList = self->_previousThreadList;
    }
    else
    {
      v52 = 2 * maxPreviousThreadCount;
      if (v52 > v27)
        v27 = v52;
      self->_maxPreviousThreadCount = v27;
      previousThreadList = (unsigned int *)malloc_type_realloc(self->_previousThreadList, 4 * v27, 0x100004052888210uLL);
      self->_previousThreadList = previousThreadList;
      v27 = act_listCnt;
    }
    v10 = v64;
    v50 = v62;
    memcpy(previousThreadList, act_list, 4 * v27);
    v27 = act_listCnt;
    self->_previousThreadCount = act_listCnt;
    if (!v27)
      goto LABEL_89;
  }
  else
  {
    v10 = v64;
    v50 = v62;
    if (!v27)
      goto LABEL_89;
  }
  mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)act_list, 4 * v27);
  act_listCnt = 0;
LABEL_89:
  if (v22)
    free(v22);
  if (v50 && self->_samplingContext)
    sampling_context_clear_cache();
  task_resume2(self->_suspensionToken);
  self->_stacksFixed = 0;
  if (!objc_msgSend(v10, "count"))
  {
    v54 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v54)
      -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:].cold.3(v54, v55, v56, v57, v58, v59, v60, v61);
  }
  v25 = objc_msgSend(v10, "count");

LABEL_27:
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueueSerialNumToNameMap, 0);
  objc_storeStrong((id *)&self->_threadPortToNameMap, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_lastThreadBacktraceMap, 0);
  objc_storeStrong((id *)&self->_processDescription, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

- (id)threadNameForThread:(unsigned int)a3
{
  return -[VMUSampler threadNameForThread:returnedThreadId:returnedDispatchQueueSerialNum:](self, "threadNameForThread:returnedThreadId:returnedDispatchQueueSerialNum:", *(_QWORD *)&a3, 0, 0);
}

- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3
{
  return -[VMUSampler dispatchQueueNameForSerialNumber:returnedConcurrentFlag:returnedThreadId:](self, "dispatchQueueNameForSerialNumber:returnedConcurrentFlag:returnedThreadId:", a3, 0, 0);
}

+ (void)initialize
{
  g_environment_flags = 0;
  g_environment_flags = getenv("SYMBOLICATION_SHOW_BACKTRACE_TIMINGS") != 0;
}

- (id)threadNameForThread:(unsigned int)a3 returnedThreadId:(unint64_t *)a4 returnedDispatchQueueSerialNum:(unint64_t *)a5
{
  void *samplingContext;

  samplingContext = self->_samplingContext;
  if (samplingContext)
  {
    samplingContext = (void *)thread_name_for_thread_port();
    if (samplingContext)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", samplingContext);
      samplingContext = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return samplingContext;
}

- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3 returnedConcurrentFlag:(BOOL *)a4 returnedThreadId:(unint64_t *)a5
{
  uint64_t v6;
  void *v7;

  if (self->_samplingContext)
  {
    if (a3)
    {
      v6 = dispatch_queue_name_for_serial_number();
      if (!a4)
        goto LABEL_5;
    }
    else
    {
      v6 = 0;
      if (!a4)
      {
LABEL_5:
        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
        return v7;
      }
    }
    *a4 = 0;
    goto LABEL_5;
  }
  if (a4)
    *a4 = 0;
  v7 = 0;
  if (a5)
    *a5 = 0;
  return v7;
}

- (void)_fixupStacks:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_stacksFixed && self->_samplingContext)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "fixupStackWithSamplingContext:symbolicator:", self->_samplingContext, self->_symbolicator._opaque_1, self->_symbolicator._opaque_2);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    self->_stacksFixed = 1;
  }

}

- (BOOL)stop
{
  if (self->_sampling)
  {
    self->_sampling = 0;
    -[NSConditionLock lockWhenCondition:](self->_stateLock, "lockWhenCondition:", 0);
    -[NSConditionLock unlock](self->_stateLock, "unlock");
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(self->_delegate, "samplingDidStop:", self);
    }
  }
  return 1;
}

- (id)sampleAllThreadsOnce
{
  return -[VMUSampler sampleAllThreadsOnceWithFramePointers:](self, "sampleAllThreadsOnceWithFramePointers:", 0);
}

- (id)sampleAllThreadsOnceWithFramePointers:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VMUSampler initializeSamplingContextWithOptions:](self, "initializeSamplingContextWithOptions:", 0);
  if (self->_samplingContext)
  {
    if (-[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:](self, "recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:", v5, mach_absolute_time(), 0, v3, 0))
    {
      -[VMUSampler _fixupStacks:](self, "_fixupStacks:", v5);
    }
    else
    {

      v5 = 0;
    }
    v5 = v5;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)initializeSamplingContextWithOptions:(int)a3
{
  void *v5;
  unint64_t options;
  unsigned int v7;
  sampling_context_t *sampling_context_for_task_pid_symbolicator;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;

  if (self->_samplingContext)
  {
    if (self->_samplingContextOptions == a3)
      return;
    destroy_sampling_context();
    self->_samplingContext = 0;
    self->_samplingContextOptions = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  options = self->_options;
  if ((options & 0x200) != 0)
    v7 = (options >> 3) & 0x20 | (options >> 2) & 0x10 | (options >> 4) & 0x40 | a3 | 0x10;
  else
    v7 = (options >> 3) & 0x20 | (options >> 2) & 0x10 | (options >> 4) & 0x40 | a3;
  sampling_context_for_task_pid_symbolicator = (sampling_context_t *)create_sampling_context_for_task_pid_symbolicator();
  self->_samplingContext = sampling_context_for_task_pid_symbolicator;
  self->_samplingContextOptions = v7;
  if (!sampling_context_for_task_pid_symbolicator)
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v9)
      -[VMUSampler initializeSamplingContextWithOptions:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  if (g_environment_flags == 1)
  {
    objc_msgSend(v5, "timeIntervalSinceNow");
    NSLog(CFSTR("Time to initialize sampling context:  %0.2f"), -v17);
  }

}

- (VMUSampler)initWithPID:(int)a3 task:(unsigned int)a4 processName:(id)a5 is64Bit:(BOOL)a6 options:(unint64_t)a7
{
  id v11;
  VMUSampler *v12;
  VMUSampler *v13;
  VMUSampler *v14;
  VMUProcInfo *v15;
  uint64_t v16;
  void *processName;
  void *v18;
  uint64_t v19;
  NSString *v20;
  VMUProcessDescription *v21;
  VMUProcessDescription *processDescription;
  VMUProcessDescription *v23;
  VMUProcessDescription *v24;
  uint64_t v25;
  NSMapTable *lastThreadBacktraceMap;
  unint64_t v27;
  uint64_t v28;
  NSConditionLock *stateLock;
  NSMutableArray *v30;
  NSMutableArray *samples;
  unint64_t v32;
  unint64_t v33;
  mach_timebase_info info;
  objc_super v36;

  v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)VMUSampler;
  v12 = -[VMUSampler init](&v36, sel_init);
  v13 = v12;
  if (!v12)
  {
LABEL_27:
    v14 = v13;
    goto LABEL_28;
  }
  v14 = 0;
  if (a3 && a4)
  {
    v12->_pid = a3;
    v12->_task = a4;
    v12->_options = a7 | ((a7 & 0x40) >> 1);
    v15 = -[VMUProcInfo initWithPid:]([VMUProcInfo alloc], "initWithPid:", v12->_pid);
    if (-[VMUProcInfo shouldAnalyzeWithCorpse](v15, "shouldAnalyzeWithCorpse"))
    {
      v13->_options |= 0x200uLL;
      if ((a7 & 0x20) != 0)
      {
LABEL_6:
        if ((a7 & 0x10) == 0)
        {
LABEL_16:
          objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 259);
          v25 = objc_claimAutoreleasedReturnValue();
          lastThreadBacktraceMap = v13->_lastThreadBacktraceMap;
          v13->_lastThreadBacktraceMap = (NSMapTable *)v25;

          v13->_numberOfCopiedBacktraces = 0;
          if ((a7 & 0x40) != 0)
          {
            v13->_symbolicator._opaque_1 = 0;
            v13->_symbolicator._opaque_2 = 0;
          }
          else if ((a7 & 0x20) != 0)
          {
            if (initWithPID_task_processName_is64Bit_options__once_token != -1)
              dispatch_once(&initWithPID_task_processName_is64Bit_options__once_token, &__block_literal_global_8);
            v13->_symbolicator = (_CSTypeRef)initWithPID_task_processName_is64Bit_options__symbolicatorForThisToolTask;
            CSRetain();
            CSSymbolicatorGetSymbolWithMangledNameFromSymbolOwnerWithNameAtTime();
          }
          else
          {
            if ((a7 & 1) != 0)
              CSSymbolicatorGetFlagsForNListOnlyData();
            v13->_symbolicator._opaque_1 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
            v13->_symbolicator._opaque_2 = v27;
          }
          v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
          stateLock = v13->_stateLock;
          v13->_stateLock = (NSConditionLock *)v28;

          v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          samples = v13->_samples;
          v13->_samples = v30;

          info = 0;
          mach_timebase_info(&info);
          LODWORD(v33) = info.denom;
          LODWORD(v32) = info.numer;
          v13->_tbRate = 1000000000.0 / (double)v32 * (double)v33;
          v13->_interval = 0.01;

          goto LABEL_27;
        }
LABEL_13:
        v21 = -[VMUProcessDescription initWithTask:getBinariesList:]([VMUProcessDescription alloc], "initWithTask:getBinariesList:", v13->_task, 1);
        processDescription = v13->_processDescription;
        v13->_processDescription = v21;

        v23 = v13->_processDescription;
        if (v23 && !-[VMUProcessDescription pid](v23, "pid"))
        {
          v24 = v13->_processDescription;
          v13->_processDescription = 0;

        }
        goto LABEL_16;
      }
    }
    else if ((a7 & 0x20) != 0)
    {
      goto LABEL_6;
    }
    if (v11)
    {
      v16 = objc_msgSend(v11, "copy");
      processName = v13->_processName;
      v13->_processName = (NSString *)v16;
    }
    else
    {
      -[VMUProcInfo userAppName](v15, "userAppName");
      processName = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(processName, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      v20 = v13->_processName;
      v13->_processName = (NSString *)v19;

    }
    if ((a7 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_13;
  }
LABEL_28:

  return v14;
}

- (void)dealloc
{
  unsigned int *previousThreadList;
  unint64_t v4;
  ipc_space_t *v5;
  mach_port_name_t task;
  objc_super v7;

  -[VMUSampler stop](self, "stop");
  previousThreadList = self->_previousThreadList;
  if (previousThreadList)
  {
    if (self->_previousThreadCount)
    {
      v4 = 0;
      v5 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      do
        mach_port_deallocate(*v5, self->_previousThreadList[v4++]);
      while (v4 < self->_previousThreadCount);
      previousThreadList = self->_previousThreadList;
    }
    free(previousThreadList);
  }
  CSRelease();
  self->_symbolicator._opaque_1 = 0;
  self->_symbolicator._opaque_2 = 0;
  task = self->_task;
  if (task + 1 >= 2 && self->_needTaskPortDealloc)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], task);
  if (self->_samplingContext)
  {
    destroy_sampling_context();
    self->_samplingContext = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)VMUSampler;
  -[VMUSampler dealloc](&v7, sel_dealloc);
}

uint64_t __59__VMUSampler_initWithPID_task_processName_is64Bit_options___block_invoke()
{
  uint64_t result;
  uint64_t v1;

  CSSymbolicatorGetFlagsForNListOnlyData();
  result = CSSymbolicatorCreateWithTaskFlagsAndNotification();
  *(_QWORD *)&initWithPID_task_processName_is64Bit_options__symbolicatorForThisToolTask = result;
  *((_QWORD *)&initWithPID_task_processName_is64Bit_options__symbolicatorForThisToolTask + 1) = v1;
  return result;
}

- (VMUSampler)initWithPID:(int)a3 orTask:(unsigned int)a4 options:(unint64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VMUSampler *v17;
  int x;

  x = a3;
  if (a4 - 1 > 0xFFFFFFFD)
  {
    v8 = *(_QWORD *)&a3;
    if (!a3)
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v9)
        -[VMUSampler initWithPID:orTask:options:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
      goto LABEL_12;
    }
    if (task_read_for_pid())
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VMUSampler initWithPID:orTask:options:].cold.3();
      goto LABEL_12;
    }
    self->_needTaskPortDealloc = 1;
    v7 = a4;
LABEL_14:
    self = -[VMUSampler initWithPID:task:processName:is64Bit:options:](self, "initWithPID:task:processName:is64Bit:options:", v8, v7, 0, 0, a5);
    v17 = self;
    goto LABEL_15;
  }
  v7 = *(_QWORD *)&a4;
  if (!pid_for_task(a4, &x))
  {
    v8 = x;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[VMUSampler initWithPID:orTask:options:].cold.1();
LABEL_12:
  v17 = 0;
LABEL_15:

  return v17;
}

- (VMUSampler)initWithPID:(int)a3
{
  return -[VMUSampler initWithPID:orTask:options:](self, "initWithPID:orTask:options:", *(_QWORD *)&a3, 0, 0);
}

- (VMUSampler)initWithTask:(unsigned int)a3
{
  return -[VMUSampler initWithPID:orTask:options:](self, "initWithPID:orTask:options:", 0, *(_QWORD *)&a3, 0);
}

- (VMUSampler)initWithPID:(int)a3 options:(unint64_t)a4
{
  return -[VMUSampler initWithPID:orTask:options:](self, "initWithPID:orTask:options:", *(_QWORD *)&a3, 0, a4);
}

- (VMUSampler)initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  return -[VMUSampler initWithPID:orTask:options:](self, "initWithPID:orTask:options:", 0, *(_QWORD *)&a3, a4);
}

- (void)_checkDispatchThreadLimits
{
  char v3;
  uint64_t v4;
  uint64_t v5;

  v4 = 0;
  v5 = 0;
  if (proc_pidinfo(self->_pid, 12, 0, &v4, 16) >= 16)
  {
    v3 = BYTE4(v5);
    if ((v5 & 0x100000000) != 0)
      ++self->_dispatchThreadSoftLimitCount;
    if ((v3 & 2) != 0)
      ++self->_dispatchThreadHardLimitCount;
  }
}

- (void)_runSamplingThread
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1A4D79000, MEMORY[0x1E0C81028], v0, "failed to set priority to %u for sampling thread: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (id)sampleAllThreadsOfPID:(int)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPID:", *(_QWORD *)&a3);
  objc_msgSend(v3, "sampleAllThreadsOnce");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sampleAllThreadsOfTask:(unsigned int)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTask:", *(_QWORD *)&a3);
  objc_msgSend(v3, "sampleAllThreadsOnce");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sampleAllThreadsOfTask:(unsigned int)a3 symbolicate:(BOOL)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTask:options:", *(_QWORD *)&a3, !a4);
  objc_msgSend(v4, "sampleAllThreadsOnce");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sampleThread:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  VMUBacktrace *v6;
  sampling_context_t *samplingContext;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  if ((self->_options & 0x40) != 0)
    v5 = 25;
  else
    v5 = 9;
  -[VMUSampler initializeSamplingContextWithOptions:](self, "initializeSamplingContextWithOptions:", v5);
  if (self->_samplingContext)
  {
    thread_suspend(v3);
    v6 = -[VMUBacktrace initWithSamplingContext:thread:recordFramePointers:]([VMUBacktrace alloc], "initWithSamplingContext:thread:recordFramePointers:", self->_samplingContext, v3, 0);
    thread_resume(v3);
    samplingContext = self->_samplingContext;
    v8 = -[VMUSampler symbolicator](self, "symbolicator");
    -[VMUBacktrace fixupStackWithSamplingContext:symbolicator:](v6, "fixupStackWithSamplingContext:symbolicator:", samplingContext, v8, v9);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)start
{
  _BOOL4 v2;

  if (self->_sampling)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v2 = -[NSConditionLock tryLockWhenCondition:](self->_stateLock, "tryLockWhenCondition:", 0);
    if (v2)
    {
      self->_sampling = 1;
      -[NSConditionLock unlockWithCondition:](self->_stateLock, "unlockWithCondition:", 1);
      -[NSMutableArray removeAllObjects](self->_samples, "removeAllObjects");
      self->_numberOfSamples = 0;
      if (self->_interval > 0.0)
        objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel__runSamplingThread, self, 0);
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(self->_delegate, "samplingDidStart:", self);
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (BOOL)waitUntilDone
{
  if (self->_sampling)
  {
    -[NSConditionLock lockWhenCondition:](self->_stateLock, "lockWhenCondition:", 0);
    -[NSConditionLock unlock](self->_stateLock, "unlock");
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(self->_delegate, "samplingDidStop:", self);
    }
  }
  return 1;
}

- (void)setSamplingInterval:(double)a3
{
  if (a3 > 0.0)
    self->_interval = a3;
}

- (double)samplingInterval
{
  return self->_interval;
}

- (void)setTimeLimit:(double)a3
{
  if (a3 >= 0.0)
    self->_timeLimit = a3;
}

- (double)timeLimit
{
  return self->_timeLimit;
}

- (void)setSampleLimit:(unsigned int)a3
{
  self->_sampleLimit = a3;
}

- (unsigned)sampleLimit
{
  return self->_sampleLimit;
}

- (void)setRecordThreadStates:(BOOL)a3
{
  self->_recordThreadStates = a3;
}

- (_CSTypeRef)symbolicator
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  _CSTypeRef result;

  opaque_2 = self->_symbolicator._opaque_2;
  opaque_1 = self->_symbolicator._opaque_1;
  result._opaque_2 = opaque_2;
  result._opaque_1 = opaque_1;
  return result;
}

- (int)pid
{
  return self->_pid;
}

- (id)samples
{
  -[VMUSampler stop](self, "stop");
  return self->_samples;
}

- (unsigned)sampleCount
{
  return self->_numberOfSamples;
}

- (void)flushData
{
  if (!self->_sampling)
  {
    -[NSMutableArray removeAllObjects](self->_samples, "removeAllObjects");
    self->_numberOfSamples = 0;
    NSResetMapTable(self->_lastThreadBacktraceMap);
    self->_previousThreadCount = 0;
  }
}

- (unsigned)mainThread
{
  return self->_mainThread;
}

- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *threadPortToNameMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *dispatchQueueSerialNumToNameMap;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  unint64_t *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  const char *v31;
  NSMutableDictionary *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;

  v6 = a3;
  if (!self->_threadPortToNameMap)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    threadPortToNameMap = self->_threadPortToNameMap;
    self->_threadPortToNameMap = v7;

    v9 = (NSMutableDictionary *)objc_opt_new();
    dispatchQueueSerialNumToNameMap = self->_dispatchQueueSerialNumToNameMap;
    self->_dispatchQueueSerialNumToNameMap = v9;

  }
  v11 = objc_msgSend(v6, "thread");
  v12 = -[VMUSampler mainThread](self, "mainThread");
  v38 = 0;
  v39 = 0;
  -[VMUSampler threadNameForThread:returnedThreadId:returnedDispatchQueueSerialNum:](self, "threadNameForThread:returnedThreadId:returnedDispatchQueueSerialNum:", v11, &v39, &v38);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  v15 = objc_msgSend(v6, "dispatchQueueSerialNumber");
  v16 = v15;
  if ((_DWORD)v11 == v12)
  {
    if (!v15 || v38 != v15)
      goto LABEL_13;
  }
  else if (!v15)
  {
LABEL_13:
    v22 = self->_threadPortToNameMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v23 = a4;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v24);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    a4 = v23;
    if (!v19)
    {
      if (v39)
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Thread_%qu"), v39);
      else
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Thread_%x"), v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v14)
      {
        objc_msgSend(v25, "appendFormat:", CFSTR(": %@"), v13);
      }
      else if ((_DWORD)v11 == v12)
      {
        objc_msgSend(v25, "appendFormat:", CFSTR(": %@"), kVMUMainThreadName[0]);
        if (!v38 && (self->_options & 4) == 0)
          objc_msgSend(v26, "appendString:", CFSTR("   DispatchQueue_<multiple>"));
      }
      v27 = self->_threadPortToNameMap;
      v28 = (void *)MEMORY[0x1E0CB37E8];
      v19 = v26;
      objc_msgSend(v28, "numberWithUnsignedInt:", v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v19, v29);

    }
    v16 = v11;
    goto LABEL_25;
  }
  if ((self->_options & 4) != 0)
    goto LABEL_13;
  v17 = self->_dispatchQueueSerialNumToNameMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v37 = 0;
    v36 = 0;
    -[VMUSampler dispatchQueueNameForSerialNumber:returnedConcurrentFlag:returnedThreadId:](self, "dispatchQueueNameForSerialNumber:returnedConcurrentFlag:returnedThreadId:", v16, &v37, &v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 || v37)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Thread_%qu"), v39);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Thread_<multiple>"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v21;
    if (v37)
      v31 = "concurrent";
    else
      v31 = "serial";
    objc_msgSend(v21, "appendFormat:", CFSTR("   DispatchQueue_%qu: %@  (%s)"), v16, v20, v31);
    if (v36 || !v37)
    {
      v32 = self->_dispatchQueueSerialNumToNameMap;
      v33 = (void *)MEMORY[0x1E0CB37E8];
      v34 = v19;
      objc_msgSend(v33, "numberWithUnsignedLongLong:", v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v34, v35);

    }
    if (a4)
      goto LABEL_26;
    goto LABEL_27;
  }
LABEL_25:
  if (a4)
LABEL_26:
    *a4 = v16;
LABEL_27:

  return v19;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong(&self->_delegate, a3);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)preloadSymbols
{
  CSSymbolicatorForceFullSymbolExtraction();
}

- (void)sampleForDuration:(unsigned int)a3 interval:(unsigned int)a4
{
  -[VMUSampler setSamplingInterval:](self, "setSamplingInterval:", (double)a4 / 1000000.0);
  -[VMUSampler setTimeLimit:](self, "setTimeLimit:", (double)a3);
  -[VMUSampler start](self, "start");
  -[VMUSampler waitUntilDone](self, "waitUntilDone");
}

- (id)stopSamplingAndReturnCallNode
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1A85A9758](self, a2);
  -[VMUSampler stop](self, "stop");
  -[VMUSampler _fixupStacks:](self, "_fixupStacks:", self->_samples);
  +[VMUCallTreeNode rootForSamples:symbolicator:sampler:options:](VMUCallTreeNode, "rootForSamples:symbolicator:sampler:options:", self->_samples, self->_symbolicator._opaque_1, self->_symbolicator._opaque_2, self, ((self->_options >> 2) & 0x21 | self->_options & 2) ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)outputString
{
  void *v3;
  double v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1A85A9758](self, a2);
  if (!self->_processName)
  {
    self->_processName = (NSString *)CFSTR("unknown-process");

  }
  v4 = self->_interval * 1000.0;
  if ((int)v4 <= 1)
    v5 = CFSTR("Analysis of sampling %@ (pid %d) every %d millisecond\n");
  else
    v5 = CFSTR("Analysis of sampling %@ (pid %d) every %d milliseconds\n");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, self->_processName, self->_pid, (int)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dispatchThreadSoftLimitCount || self->_dispatchThreadHardLimitCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_dispatchThreadSoftLimitCount)
      objc_msgSend(v7, "appendFormat:", CFSTR("Dispatch Thread %@ Limit: %u reached in %u of %u samples -- too many dispatch threads blocked in synchronous operations\n"), CFSTR("Soft"), self->_dispatchThreadSoftLimit, self->_dispatchThreadSoftLimitCount, self->_numberOfSamples);
    if (self->_dispatchThreadHardLimitCount)
      objc_msgSend(v8, "appendFormat:", CFSTR("Dispatch Thread %@ Limit: %u reached in %u of %u samples -- too many dispatch threads blocked in synchronous operations\n"), CFSTR("Hard"), self->_dispatchThreadHardLimit, self->_dispatchThreadHardLimitCount, self->_numberOfSamples);
    objc_msgSend(v8, "appendString:", CFSTR("\n"));
  }
  else
  {
    v8 = 0;
  }
  -[VMUProcessDescription description](self->_processDescription, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUProcessDescription binaryImagesDescription](self->_processDescription, "binaryImagesDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUSampler stopSamplingAndReturnCallNode](self, "stopSamplingAndReturnCallNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fullOutputWithThreshold:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v6);
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v13, "appendString:", v9);
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v13, "appendString:", v8);
  objc_msgSend(v13, "appendString:", v12);
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v13, "appendFormat:", CFSTR("\n%@"), v10);

  objc_autoreleasePoolPop(v3);
  return v13;
}

- (void)writeOutput:(id)a3 append:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  const char *v9;
  unint64_t options;
  const char *v11;
  char *v12;
  const char *v13;
  FILE *v14;
  _BOOL4 v15;
  size_t v16;
  uint64_t v17;
  NSString *processName;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  unint64_t v26;
  void *v27;
  char __str[1024];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1A85A9758]();
  -[VMUSampler outputString](self, "outputString");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  options = self->_options;
  if (v6)
  {
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v12 = (char *)v11;
    if (v4)
      v13 = "ae";
    else
      v13 = "we";
    v14 = fopen(v11, v13);
    v15 = 1;
    if (v14)
      goto LABEL_6;
  }
  else
  {
    processName = self->_processName;
    v26 = self->_options;
    v27 = v7;
    if (!processName)
    {
      self->_processName = (NSString *)CFSTR("unknown-process");

      processName = self->_processName;
    }
    -[NSString stringByReplacingOccurrencesOfString:withString:](processName, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v20, "setDateFormat:", CFSTR("yyyy-MM-dd_HHmmss"));
    -[VMUProcessDescription date](self->_processDescription, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "stringFromDate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/%@_%@_XXXX.sample.txt"), v19, v22);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    snprintf(__str, 0x400uLL, "%s", (const char *)objc_msgSend(v23, "UTF8String"));
    v24 = mkstemps(__str, 11);
    v15 = v24 >= 0;
    if (v24 < 0)
    {
      fwrite("Unable to create secure temp file\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      v12 = 0;
      v14 = 0;
    }
    else
    {
      v14 = fdopen(v24, "we");
      v12 = __str;
    }

    options = v26;
    v7 = v27;
    if (v14)
    {
LABEL_6:
      v16 = strlen(v9);
      if (!fwrite(v9, v16, 1uLL, v14))
      {
        -[VMUSampler writeOutput:append:].cold.1(v12);
        v15 = 0;
      }
      fclose(v14);
      if (geteuid())
      {
        if (v15)
          goto LABEL_10;
      }
      else
      {
        chmod(v12, 0x1A4u);
        if (v15)
        {
LABEL_10:
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "Sample analysis of process %d written to file %s\n", self->_pid, v12);
          LOBYTE(v17) = 0;
          if (v6)
            goto LABEL_22;
          goto LABEL_20;
        }
      }
      v17 = (options >> 3) & 1;
      if (v6)
        goto LABEL_22;
      goto LABEL_20;
    }
  }
  perror("fopen");
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "Unable to open/create sample file %s\n", v12);
  v17 = (options >> 3) & 1;
  if (v6)
    goto LABEL_22;
LABEL_20:
  if ((v17 & 1) == 0)
  {
    putchar(10);
    printf("%s", v9);
    putchar(10);
  }
LABEL_22:
  objc_autoreleasePoolPop(v7);

}

- (void)initWithPID:orTask:options:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A4D79000, MEMORY[0x1E0C81028], v0, "[VMUSampler initWithPID:orTask:options:] failed to get pid for task %u  err %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initWithPID:(uint64_t)a3 orTask:(uint64_t)a4 options:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "[VMUSampler initWithPID:orTask:options:] pid and task are both NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)initWithPID:orTask:options:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A4D79000, MEMORY[0x1E0C81028], v0, "[VMUSampler initWithPID:orTask:options:] failed to get task for pid %u  err %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initializeSamplingContextWithOptions:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "Failed to initialize sampling context in VMUSampler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)recordSampleTo:(uint64_t)a3 timestamp:(uint64_t)a4 thread:(uint64_t)a5 recordFramePointers:(uint64_t)a6 clearMemoryCache:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "[VMUSampler recordSampleTo:...] called with nil sampling context", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1A4D79000, MEMORY[0x1E0C81028], v0, "[VMUSampler recordSampleTo:...] task_threads failed for pid %u, err %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)recordSampleTo:(uint64_t)a3 timestamp:(uint64_t)a4 thread:(uint64_t)a5 recordFramePointers:(uint64_t)a6 clearMemoryCache:(uint64_t)a7 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "[VMUSampler recordSampleTo:...] didn't record samples for any threads", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1A4D79000, MEMORY[0x1E0C81028], v0, "[VMUSampler recordSampleTo:...] task_suspend2 failed for pid %u, err %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)writeOutput:(const char *)a1 append:.cold.1(const char *a1)
{
  perror("fwrite");
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "Unable to write sample file %s\n", a1);
  OUTLINED_FUNCTION_3();
}

@end
