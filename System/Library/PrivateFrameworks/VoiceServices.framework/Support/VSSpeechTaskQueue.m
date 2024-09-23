@implementation VSSpeechTaskQueue

- (VSSpeechTaskQueue)init
{
  VSSpeechTaskQueue *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *speakingQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *v8;
  uint64_t v9;
  NSMutableArray *speakTasks;
  uint64_t v11;
  NSMutableArray *eagerTasks;
  sched_param v14;
  objc_super v15;
  pthread_attr_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)VSSpeechTaskQueue;
  v2 = -[VSSpeechTaskQueue init](&v15, sel_init);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x24BEC0E18], "isHomePod"))
    {
      memset(&v16, 0, sizeof(v16));
      pthread_attr_init(&v16);
      v14 = 0;
      pthread_attr_getschedparam(&v16, &v14);
      v14.sched_priority = 46;
      pthread_attr_setschedpolicy(&v16, 2);
      pthread_attr_setschedparam(&v16, &v14);
      pthread_attr_setinheritsched(&v16, 2);
      v3 = dispatch_pthread_root_queue_create();
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_queue_create_with_target_V2("com.apple.voiced.speakingQueue", v4, v3);
      speakingQueue = v2->_speakingQueue;
      v2->_speakingQueue = (OS_dispatch_queue *)v5;

    }
    else
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v7 = dispatch_queue_create("com.apple.voiced.speakingQueue", v3);
      v8 = v2->_speakingQueue;
      v2->_speakingQueue = (OS_dispatch_queue *)v7;

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    speakTasks = v2->_speakTasks;
    v2->_speakTasks = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    eagerTasks = v2->_eagerTasks;
    v2->_eagerTasks = (NSMutableArray *)v11;

    pthread_mutexattr_init(&v2->_threadMutexAttr);
    pthread_mutexattr_settype(&v2->_threadMutexAttr, 2);
    pthread_mutex_init(&v2->_threadMutex, &v2->_threadMutexAttr);
  }
  return v2;
}

- (void)addTask:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  pthread_mutex_lock(&self->_threadMutex);
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_25510DB08)
    && (objc_msgSend(v5, "isSpeaking") & 1) != 0)
  {
    v4 = 16;
  }
  else
  {
    v4 = 8;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "addObject:", v5);
  -[VSSpeechTaskQueue spinNextTask](self, "spinNextTask");
  pthread_mutex_unlock(&self->_threadMutex);

}

- (void)spinNextTask
{
  NSObject *v3;
  id v4;
  VSSpeechTaskProtocol *currentTask;
  VSSpeechTaskProtocol **p_currentTask;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  VSSpeechRequest *v22;
  VSSpeechRequest *v23;
  void *v24;
  NSObject *speakingQueue;
  void *v26;
  VSSpeechTaskProtocol *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  VSSpeechRequest *lastSynthesisRequest;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  VSSpeechTaskProtocol *v51;
  void *v52;
  void *v53;
  int v54;
  unint64_t v55;
  void *v56;
  NSMutableArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  dispatch_block_t v62;
  NSObject *v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  _QWORD v76[4];
  void *v77;
  VSSpeechTaskQueue *v78;
  _QWORD block[4];
  id v80;
  VSSpeechTaskQueue *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEBUG, "Start spinNextTask", buf, 2u);
  }

  if (-[NSMutableArray count](self->_speakTasks, "count"))
  {
    -[NSMutableArray firstObject](self->_speakTasks, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    p_currentTask = &self->_currentTask;
    currentTask = self->_currentTask;
    if (currentTask)
    {
      if (!-[VSSpeechTaskProtocol conformsToProtocol:](currentTask, "conformsToProtocol:", &unk_25510DB08)|| !-[VSSpeechTaskProtocol isSpeaking](*p_currentTask, "isSpeaking"))
      {
        v27 = *p_currentTask;
        if (-[VSSpeechTaskProtocol conformsToProtocol:](v27, "conformsToProtocol:", &unk_25510DB90)
          && -[VSSpeechTaskProtocol readyForEagerTask](v27, "readyForEagerTask")
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (-[VSSpeechTaskProtocol request](v27, "request"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v4, "request"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v30 = objc_msgSend(v28, "isSimilarTo:", v29),
              v29,
              v28,
              (v30 & 1) != 0))
        {
          -[VSSpeechTaskProtocol setSpeakTask:](v27, "setSpeakTask:", v4);
          -[NSMutableArray removeObjectAtIndex:](self->_speakTasks, "removeObjectAtIndex:", 0);
          if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v4, "instrumentMetrics");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "requestCreatedTimestamp");
            -[VSSpeechTaskProtocol instrumentMetrics](v27, "instrumentMetrics");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v32 - objc_msgSend(v33, "requestCreatedTimestamp");
            objc_msgSend(v4, "instrumentMetrics");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setEagerRequestCreatedTimestampDiffs:", v34);

            objc_msgSend(v4, "instrumentMetrics");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "eagerRequestCreatedTimestampDiffs");
            -[VSSpeechTaskProtocol instrumentMetrics](v27, "instrumentMetrics");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setEagerRequestCreatedTimestampDiffs:", v37);

          }
          VSGetLogDefault();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "instrumentMetrics");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "requestCreatedTimestamp");
            -[VSSpeechTaskProtocol instrumentMetrics](v27, "instrumentMetrics");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "requestCreatedTimestamp");
            *(_DWORD *)buf = 134218240;
            v87 = v41;
            v88 = 2048;
            v89 = v43;
            _os_log_impl(&dword_21AA84000, v39, OS_LOG_TYPE_INFO, "Speak task %llu is attached to eager task %llu", buf, 0x16u);

          }
          lastSynthesisRequest = self->_lastSynthesisRequest;
          self->_lastSynthesisRequest = 0;

        }
        else
        {
          VSGetLogDefault();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "instrumentMetrics");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "requestCreatedTimestamp");
            -[VSSpeechTaskProtocol instrumentMetrics](v27, "instrumentMetrics");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "requestCreatedTimestamp");
            *(_DWORD *)buf = 134218240;
            v87 = v47;
            v88 = 2048;
            v89 = v49;
            _os_log_impl(&dword_21AA84000, v45, OS_LOG_TYPE_INFO, "%llu interrupt task %llu", buf, 0x16u);

          }
          -[VSSpeechTaskProtocol cancel](v27, "cancel");
        }

        goto LABEL_50;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(v4, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if ((isKindOfClass & 1) != 0)
      {
        v10 = objc_msgSend(v8, "enqueue");

        if (v10)
        {
          VSGetLogDefault();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "instrumentMetrics");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "requestCreatedTimestamp");
            -[VSSpeechTaskProtocol instrumentMetrics](*p_currentTask, "instrumentMetrics");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "requestCreatedTimestamp");
            *(_DWORD *)buf = 134218240;
            v87 = v13;
            v88 = 2048;
            v89 = v15;
            v16 = "PresynthesisTask %llu requested to wait another speaking task %llu";
            v17 = v11;
            v18 = OS_LOG_TYPE_INFO;
LABEL_57:
            _os_log_impl(&dword_21AA84000, v17, v18, v16, buf, 0x16u);

            goto LABEL_58;
          }
          goto LABEL_58;
        }
      }
      else
      {
        v64 = objc_msgSend(v8, "shouldWaitCurrentSpeaking");

        if ((v64 & 1) == 0)
        {
          VSGetLogDefault();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "instrumentMetrics");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "requestCreatedTimestamp");
            -[VSSpeechTaskProtocol instrumentMetrics](*p_currentTask, "instrumentMetrics");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "requestCreatedTimestamp");
            *(_DWORD *)buf = 134218240;
            v87 = v69;
            v88 = 2048;
            v89 = v71;
            _os_log_impl(&dword_21AA84000, v67, OS_LOG_TYPE_DEFAULT, "New speak task %llu interrupts speaking task %llu", buf, 0x16u);

          }
          -[VSSpeechTaskProtocol cancel](*p_currentTask, "cancel");
          goto LABEL_50;
        }
      }
      VSGetLogDefault();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "instrumentMetrics");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v12, "requestCreatedTimestamp");
        -[VSSpeechTaskProtocol instrumentMetrics](*p_currentTask, "instrumentMetrics");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v14, "requestCreatedTimestamp");
        *(_DWORD *)buf = 134218240;
        v87 = v65;
        v88 = 2048;
        v89 = v66;
        v16 = "New speak task %llu waits for speaking task %llu";
        v17 = v11;
        v18 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_57;
      }
LABEL_58:

      goto LABEL_50;
    }
    VSGetLogDefault();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "instrumentMetrics");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "requestCreatedTimestamp");
      *(_DWORD *)buf = 134217984;
      v87 = v73;
      _os_log_debug_impl(&dword_21AA84000, v50, OS_LOG_TYPE_DEBUG, "Dispatch speaking task %llu", buf, 0xCu);

    }
    -[NSMutableArray removeObjectAtIndex:](self->_speakTasks, "removeObjectAtIndex:", 0);
    objc_storeStrong((id *)&self->_currentTask, v4);
    if (!-[VSSpeechTaskProtocol isMemberOfClass:](self->_currentTask, "isMemberOfClass:", objc_opt_class()))goto LABEL_41;
    v51 = *p_currentTask;
    objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v52, "disableCache") & 1) == 0)
    {
      -[VSSpeechTaskProtocol request](v51, "request");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "isSimilarTo:", self->_lastSynthesisRequest);

      if (!v54)
      {
LABEL_40:

LABEL_41:
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v57 = self->_eagerTasks;
        v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v83;
          do
          {
            for (i = 0; i != v59; ++i)
            {
              if (*(_QWORD *)v83 != v60)
                objc_enumerationMutation(v57);
              objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "cancel");
            }
            v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
          }
          while (v59);
        }

        -[NSMutableArray removeAllObjects](self->_eagerTasks, "removeAllObjects");
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __33__VSSpeechTaskQueue_spinNextTask__block_invoke;
        block[3] = &unk_24DD8EDB0;
        v4 = v4;
        v80 = v4;
        v81 = self;
        v62 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
        dispatch_async((dispatch_queue_t)self->_speakingQueue, v62);

        v26 = v80;
LABEL_49:

LABEL_50:
        goto LABEL_51;
      }
      -[VSSpeechTaskProtocol instrumentMetrics](v51, "instrumentMetrics");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v52, "requestCreatedTimestamp") - self->_lastSynthesisRequestCreatedTimeStamp;
      -[VSSpeechTaskProtocol instrumentMetrics](v51, "instrumentMetrics");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setEagerRequestCreatedTimestampDiffs:", v55);

    }
    goto LABEL_40;
  }
  if (-[NSMutableArray count](self->_eagerTasks, "count") && !self->_currentTask)
  {
    -[NSMutableArray firstObject](self->_eagerTasks, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_eagerTasks, "removeObjectAtIndex:", 0);
    VSGetLogDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v19, "instrumentMetrics");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "requestCreatedTimestamp");
      *(_DWORD *)buf = 134217984;
      v87 = v75;
      _os_log_debug_impl(&dword_21AA84000, v20, OS_LOG_TYPE_DEBUG, "Dispatch synthesis task %llu", buf, 0xCu);

    }
    objc_storeStrong((id *)&self->_currentTask, v19);
    if (objc_msgSend(v19, "conformsToProtocol:", &unk_25510DB90))
    {
      v21 = v19;
      objc_msgSend(v21, "request");
      v22 = (VSSpeechRequest *)objc_claimAutoreleasedReturnValue();
      v23 = self->_lastSynthesisRequest;
      self->_lastSynthesisRequest = v22;

      objc_msgSend(v21, "instrumentMetrics");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      self->_lastSynthesisRequestCreatedTimeStamp = objc_msgSend(v24, "requestCreatedTimestamp");
    }
    speakingQueue = self->_speakingQueue;
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __33__VSSpeechTaskQueue_spinNextTask__block_invoke_83;
    v76[3] = &unk_24DD8EDB0;
    v77 = v19;
    v78 = self;
    v4 = v19;
    dispatch_async(speakingQueue, v76);
    v26 = v77;
    goto LABEL_49;
  }
LABEL_51:
  VSGetLogDefault();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_21AA84000, v63, OS_LOG_TYPE_DEBUG, "Finish spinNextTask", buf, 2u);
  }

}

- (VSSpeechTaskProtocol)currentTask
{
  return self->_currentTask;
}

- (unint64_t)createdTimestampWithTask:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3
    && objc_msgSend(v3, "conformsToProtocol:", &unk_25510DB08)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "requestCreatedTimestamp");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)taskWithCreatedTimeStamp:(unint64_t)a3
{
  _opaque_pthread_mutex_t *p_threadMutex;
  void *v6;
  unint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  p_threadMutex = &self->_threadMutex;
  pthread_mutex_lock(&self->_threadMutex);
  -[VSSpeechTaskQueue currentTask](self, "currentTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VSSpeechTaskQueue createdTimestampWithTask:](self, "createdTimestampWithTask:", v6);

  if (v7 == a3)
  {
    pthread_mutex_unlock(p_threadMutex);
    -[VSSpeechTaskQueue currentTask](self, "currentTask");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[VSSpeechTaskQueue speakTasks](self, "speakTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
      if (-[VSSpeechTaskQueue createdTimestampWithTask:](self, "createdTimestampWithTask:", v14) == a3)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v11)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[VSSpeechTaskQueue eagerTasks](self, "eagerTasks", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (!v15)
    {
LABEL_19:

      pthread_mutex_unlock(p_threadMutex);
      return 0;
    }
    v16 = v15;
    v17 = *(_QWORD *)v21;
LABEL_13:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v17)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
      if (-[VSSpeechTaskQueue createdTimestampWithTask:](self, "createdTimestampWithTask:", v14) == a3)
        break;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v16)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
  }
  pthread_mutex_unlock(p_threadMutex);
  v19 = v14;

  return v19;
}

- (id)tasksWithDelegate:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_threadMutex;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_threadMutex = &self->_threadMutex;
  pthread_mutex_lock(&self->_threadMutex);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechTaskQueue currentTask](self, "currentTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    -[VSSpeechTaskQueue currentTask](self, "currentTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[VSSpeechTaskQueue speakTasks](self, "speakTasks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v15, "delegate");
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v4)
          objc_msgSend(v6, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[VSSpeechTaskQueue eagerTasks](self, "eagerTasks", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(v22, "delegate");
        v23 = (id)objc_claimAutoreleasedReturnValue();

        if (v23 == v4)
          objc_msgSend(v6, "addObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

  pthread_mutex_unlock(p_threadMutex);
  return v6;
}

- (void)cancelTask:(id)a3
{
  _opaque_pthread_mutex_t *p_threadMutex;
  id v4;

  p_threadMutex = &self->_threadMutex;
  v4 = a3;
  pthread_mutex_lock(p_threadMutex);
  objc_msgSend(v4, "cancel");

  pthread_mutex_unlock(p_threadMutex);
}

- (void)suspendCurrentTask
{
  _opaque_pthread_mutex_t *p_threadMutex;

  p_threadMutex = &self->_threadMutex;
  pthread_mutex_lock(&self->_threadMutex);
  -[VSSpeechTaskProtocol suspend](self->_currentTask, "suspend");
  pthread_mutex_unlock(p_threadMutex);
}

- (void)resumeCurrentTask
{
  _opaque_pthread_mutex_t *p_threadMutex;

  p_threadMutex = &self->_threadMutex;
  pthread_mutex_lock(&self->_threadMutex);
  -[VSSpeechTaskProtocol resume](self->_currentTask, "resume");
  pthread_mutex_unlock(p_threadMutex);
}

- (NSMutableArray)eagerTasks
{
  return self->_eagerTasks;
}

- (void)setEagerTasks:(id)a3
{
  objc_storeStrong((id *)&self->_eagerTasks, a3);
}

- (NSMutableArray)speakTasks
{
  return self->_speakTasks;
}

- (void)setSpeakTasks:(id)a3
{
  objc_storeStrong((id *)&self->_speakTasks, a3);
}

- (void)setCurrentTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentTask, a3);
}

- (_opaque_pthread_mutex_t)threadMutex
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].__opaque[16];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)self[1].__opaque;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[1].__opaque[48];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[32];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setThreadMutex:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_threadMutex.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_threadMutex.__opaque[24] = v5;
  *(_OWORD *)&self->_threadMutex.__opaque[8] = v4;
  *(_OWORD *)&self->_threadMutex.__sig = v3;
}

- (_opaque_pthread_mutexattr_t)threadMutexAttr
{
  uint64_t v2;
  uint64_t sig;
  _opaque_pthread_mutexattr_t result;

  v2 = *(_QWORD *)self->_threadMutexAttr.__opaque;
  sig = self->_threadMutexAttr.__sig;
  *(_QWORD *)result.__opaque = v2;
  result.__sig = sig;
  return result;
}

- (void)setThreadMutexAttr:(_opaque_pthread_mutexattr_t)a3
{
  self->_threadMutexAttr = a3;
}

- (OS_dispatch_queue)speakingQueue
{
  return self->_speakingQueue;
}

- (void)setSpeakingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_speakingQueue, a3);
}

- (VSSpeechRequest)lastSynthesisRequest
{
  return self->_lastSynthesisRequest;
}

- (void)setLastSynthesisRequest:(id)a3
{
  objc_storeStrong((id *)&self->_lastSynthesisRequest, a3);
}

- (unint64_t)lastSynthesisRequestCreatedTimeStamp
{
  return self->_lastSynthesisRequestCreatedTimeStamp;
}

- (void)setLastSynthesisRequestCreatedTimeStamp:(unint64_t)a3
{
  self->_lastSynthesisRequestCreatedTimeStamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSynthesisRequest, 0);
  objc_storeStrong((id *)&self->_speakingQueue, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_speakTasks, 0);
  objc_storeStrong((id *)&self->_eagerTasks, 0);
}

uint64_t __33__VSSpeechTaskQueue_spinNextTask__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 134217984;
    v6 = objc_msgSend(v3, "requestCreatedTimestamp");
    _os_log_impl(&dword_21AA84000, v2, OS_LOG_TYPE_INFO, "Starting task %llu", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "start");
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 72));
  objc_msgSend(*(id *)(a1 + 40), "setCurrentTask:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setLastSynthesisRequest:", 0);
  objc_msgSend(*(id *)(a1 + 40), "spinNextTask");
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 72));
}

uint64_t __33__VSSpeechTaskQueue_spinNextTask__block_invoke_83(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 134217984;
    v6 = objc_msgSend(v4, "requestCreatedTimestamp");
    _os_log_debug_impl(&dword_21AA84000, v2, OS_LOG_TYPE_DEBUG, "Starting task %llu", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "start");
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 72));
  objc_msgSend(*(id *)(a1 + 40), "setCurrentTask:", 0);
  objc_msgSend(*(id *)(a1 + 40), "spinNextTask");
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 72));
}

+ (id)mainDeviceQueue
{
  if (mainDeviceQueue_onceToken != -1)
    dispatch_once(&mainDeviceQueue_onceToken, &__block_literal_global_3576);
  return (id)mainDeviceQueue___sharedQueue;
}

+ (id)parallelQueueWithIdentifier:(id)a3
{
  id v3;
  VSSpeechTaskQueue *v4;

  v3 = a3;
  if (parallelQueueWithIdentifier__onceToken != -1)
    dispatch_once(&parallelQueueWithIdentifier__onceToken, &__block_literal_global_1);
  objc_msgSend((id)VSSpeechTaskQueue_queueLock, "lock");
  objc_msgSend((id)VSSpeechTaskQueue_queueMap, "objectForKeyedSubscript:", v3);
  v4 = (VSSpeechTaskQueue *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(VSSpeechTaskQueue);
    objc_msgSend((id)VSSpeechTaskQueue_queueMap, "setObject:forKeyedSubscript:", v4, v3);
  }
  objc_msgSend((id)VSSpeechTaskQueue_queueLock, "unlock");

  return v4;
}

+ (void)cancelTasksWithDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "mainDeviceQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tasksWithDelegate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(a1, "mainDeviceQueue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cancelTask:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v9);
  }

  if (VSSpeechTaskQueue_queueLock)
  {
    v26 = v7;
    objc_msgSend((id)VSSpeechTaskQueue_queueLock, "lock");
    objc_msgSend((id)VSSpeechTaskQueue_queueMap, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)VSSpeechTaskQueue_queueLock, "unlock");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v20, "tasksWithDelegate:", v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v28;
            do
            {
              for (k = 0; k != v23; ++k)
              {
                if (*(_QWORD *)v28 != v24)
                  objc_enumerationMutation(v21);
                objc_msgSend(v20, "cancelTask:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k));
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
            }
            while (v23);
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v17);
    }

    v7 = v26;
  }

}

void __49__VSSpeechTaskQueue_parallelQueueWithIdentifier___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)VSSpeechTaskQueue_queueMap;
  VSSpeechTaskQueue_queueMap = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v3 = (void *)VSSpeechTaskQueue_queueLock;
  VSSpeechTaskQueue_queueLock = (uint64_t)v2;

}

void __36__VSSpeechTaskQueue_mainDeviceQueue__block_invoke()
{
  VSSpeechTaskQueue *v0;
  void *v1;

  v0 = objc_alloc_init(VSSpeechTaskQueue);
  v1 = (void *)mainDeviceQueue___sharedQueue;
  mainDeviceQueue___sharedQueue = (uint64_t)v0;

}

@end
