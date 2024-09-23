@implementation SignpostSupportObjectExtractor

- (NSUUID)currentBootUUID
{
  return self->_currentBootUUID;
}

- (unint64_t)processedEventCount
{
  return self->_processedEventCount;
}

- (void)setProcessedEventCount:(unint64_t)a3
{
  self->_processedEventCount = a3;
}

- (BOOL)_shouldStopProcessing
{
  return self->__shouldStopProcessing;
}

- (void)dealloc
{
  objc_super v3;

  -[SignpostSupportObjectExtractor _processingCompleted:](self, "_processingCompleted:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SignpostSupportObjectExtractor;
  -[SignpostSupportObjectExtractor dealloc](&v3, sel_dealloc);
}

- (void)_processingCompleted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  int v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  NSObject *v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SignpostSupportObjectExtractor syncSem](self, "syncSem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  -[SignpostSupportObjectExtractor processingCompletionBlock](self, "processingCompletionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doneProcessing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SignpostSupportObjectExtractor _hasNonObjectFilters](self, "_hasNonObjectFilters"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            if (-[SignpostSupportObjectExtractor _eventPassesFilters:](self, "_eventPassesFilters:", v15))
              objc_msgSend(v9, "addObject:", v15);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v12);
      }

    }
    else
    {
      v9 = v8;
    }
    -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v18 = v9;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
            -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter", (_QWORD)v29);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "passesObject:", v23);

            if (v25)
              objc_msgSend(v17, "addObject:", v23);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v20);
      }

    }
    else
    {
      v17 = v9;
    }
    -[SignpostSupportObjectExtractor processingCompletionBlock](self, "processingCompletionBlock", (_QWORD)v29);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v26)[2](v26, v4, v17);

    -[SignpostSupportObjectExtractor setProcessingCompletionBlock:](self, "setProcessingCompletionBlock:", 0);
  }
  -[SignpostSupportObjectExtractor stopProcessing](self, "stopProcessing");
  -[SignpostSupportObjectExtractor completionSemaphore](self, "completionSemaphore");
  v27 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v27);

  -[SignpostSupportObjectExtractor setNotificationProcessingQueue:](self, "setNotificationProcessingQueue:", 0);
  -[SignpostSupportObjectExtractor syncSem](self, "syncSem");
  v28 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v28);

}

- (OS_dispatch_semaphore)syncSem
{
  return self->_syncSem;
}

- (OS_dispatch_semaphore)completionSemaphore
{
  return self->_completionSemaphore;
}

- (void)stopProcessing
{
  void *v3;
  void (**v4)(void);

  -[SignpostSupportObjectExtractor set_shouldStopProcessing:](self, "set_shouldStopProcessing:", 1);
  -[SignpostSupportObjectExtractor _stopProcessingBlock](self, "_stopProcessingBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SignpostSupportObjectExtractor _stopProcessingBlock](self, "_stopProcessingBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (id)_stopProcessingBlock
{
  return self->__stopProcessingBlock;
}

- (void)set_shouldStopProcessing:(BOOL)a3
{
  self->__shouldStopProcessing = a3;
}

- (void)setNotificationProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationProcessingQueue, a3);
}

- (id)processingCompletionBlock
{
  return self->_processingCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__intervalEndHandler, 0);
  objc_storeStrong(&self->__stopProcessingBlock, 0);
  objc_storeStrong((id *)&self->__liveStream, 0);
  objc_storeStrong((id *)&self->_notificationProcessingQueue, 0);
  objc_storeStrong((id *)&self->_currentBootUUID, 0);
  objc_storeStrong((id *)&self->_syncSem, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong(&self->_timedOutBeginEventProcessingBlock, 0);
  objc_storeStrong((id *)&self->_intervalBuilder, 0);
  objc_storeStrong((id *)&self->_animationFirstFrameGraceTimeController, 0);
  objc_storeStrong(&self->_processingCompletionBlock, 0);
  objc_storeStrong(&self->_deviceRebootProcessingBlock, 0);
  objc_storeStrong(&self->_logMessageProcessingBlock, 0);
  objc_storeStrong(&self->_animationIntervalCompletionProcessingBlock, 0);
  objc_storeStrong(&self->_intervalCompletionProcessingBlock, 0);
  objc_storeStrong(&self->_emitEventProcessingBlock, 0);
  objc_storeStrong(&self->_unmatchedEndEventProcessingBlock, 0);
  objc_storeStrong(&self->_repeatedBeginEventProcessingBlock, 0);
  objc_storeStrong(&self->_endEventProcessingBlock, 0);
  objc_storeStrong(&self->_beginEventProcessingBlock, 0);
  objc_storeStrong((id *)&self->_objectFilter, 0);
  objc_storeStrong((id *)&self->_uniquePidFilter, 0);
  objc_storeStrong((id *)&self->_pidFilter, 0);
  objc_storeStrong((id *)&self->_processNameFilter, 0);
  objc_storeStrong((id *)&self->_subsystemCategoryFilter, 0);
}

- (SignpostSupportObjectExtractor)init
{
  SignpostSupportObjectExtractor *v2;
  SignpostIntervalBuilder *v3;
  SignpostIntervalBuilder *intervalBuilder;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *completionSemaphore;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *syncSem;
  SignpostSupportAnimationGraceTimeController *v9;
  SignpostSupportAnimationGraceTimeController *animationFirstFrameGraceTimeController;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SignpostSupportObjectExtractor;
  v2 = -[SignpostSupportObjectExtractor init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SignpostIntervalBuilder);
    intervalBuilder = v2->_intervalBuilder;
    v2->_intervalBuilder = v3;

    v5 = dispatch_semaphore_create(0);
    completionSemaphore = v2->_completionSemaphore;
    v2->_completionSemaphore = (OS_dispatch_semaphore *)v5;

    v7 = dispatch_semaphore_create(1);
    syncSem = v2->_syncSem;
    v2->_syncSem = (OS_dispatch_semaphore *)v7;

    v9 = objc_alloc_init(SignpostSupportAnimationGraceTimeController);
    animationFirstFrameGraceTimeController = v2->_animationFirstFrameGraceTimeController;
    v2->_animationFirstFrameGraceTimeController = v9;

    v2->_shouldComposeMetadataString = 1;
  }
  return v2;
}

- (BOOL)_processSignpostEvent:(id)a3 shouldReport:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    if (-[SignpostSupportObjectExtractor disableGeneratorProcessing](self, "disableGeneratorProcessing")
      || !objc_msgSend(v6, "isGenerator"))
    {
      if (!-[SignpostSupportObjectExtractor _processInternalSignpostEvent:shouldReport:](self, "_processInternalSignpostEvent:shouldReport:", v6, v4))
      {
LABEL_16:
        v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      +[SignpostEvent _generatedEventArrayForEvent:](SignpostEvent, "_generatedEventArrayForEvent:", v6);
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            if (!-[SignpostSupportObjectExtractor _processInternalSignpostEvent:shouldReport:](self, "_processInternalSignpostEvent:shouldReport:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v4, (_QWORD)v14))
            {

              goto LABEL_16;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
  }
  v12 = 1;
LABEL_17:

  return v12;
}

- (BOOL)disableGeneratorProcessing
{
  return self->_disableGeneratorProcessing;
}

- (BOOL)_processInternalSignpostEvent:(id)a3 shouldReport:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t (**v19)(_QWORD, _QWORD);
  int v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t (**v24)(_QWORD, _QWORD);
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t (**v30)(_QWORD, _QWORD);
  int v31;
  BOOL v32;

  v4 = a4;
  v6 = a3;
  if (!-[SignpostSupportObjectExtractor shouldComposeMetadataString](self, "shouldComposeMetadataString"))
    objc_msgSend(v6, "setMetadata:", 0);
  if ((objc_msgSend(v6, "_resolvedEventType") & 4) != 0)
  {
    -[SignpostSupportObjectExtractor emitEventProcessingBlock](self, "emitEventProcessingBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_42;
    -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "passesObject:", v6);

      if (!v11)
        goto LABEL_37;
    }
    if (!v4
      || (-[SignpostSupportObjectExtractor emitEventProcessingBlock](self, "emitEventProcessingBlock"),
          v12 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
          v13 = ((uint64_t (**)(_QWORD, id))v12)[2](v12, v6),
          v12,
          v13))
    {
LABEL_42:
      if (-[SignpostSupportObjectExtractor _isTrackingIntervals](self, "_isTrackingIntervals"))
      {
        -[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "processEmittedEvent:", v6);

      }
      goto LABEL_37;
    }
    goto LABEL_39;
  }
  if ((objc_msgSend(v6, "_resolvedEventType") & 1) == 0)
  {
    v7 = v4;
    goto LABEL_27;
  }
  -[SignpostSupportObjectExtractor beginEventProcessingBlock](self, "beginEventProcessingBlock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v7 = v4;
    goto LABEL_23;
  }
  -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_23;
    }
LABEL_20:
    -[SignpostSupportObjectExtractor beginEventProcessingBlock](self, "beginEventProcessingBlock");
    v19 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v20 = ((uint64_t (**)(_QWORD, id))v19)[2](v19, v6);

    if (!v20)
      goto LABEL_39;
    v7 = 1;
    goto LABEL_23;
  }
  -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "passesObject:", v6);

  v7 = 0;
  if (v18 && v4)
    goto LABEL_20;
LABEL_23:
  if (-[SignpostSupportObjectExtractor _isTrackingIntervals](self, "_isTrackingIntervals"))
  {
    -[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "processBeginEvent:", v6);

    if ((v22 & 1) == 0)
    {
      -[SignpostSupportObjectExtractor repeatedBeginEventProcessingBlock](self, "repeatedBeginEventProcessingBlock");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[SignpostSupportObjectExtractor repeatedBeginEventProcessingBlock](self, "repeatedBeginEventProcessingBlock");
        v24 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v25 = ((uint64_t (**)(_QWORD, id))v24)[2](v24, v6);

        if (!v25)
          goto LABEL_39;
      }
    }
  }
LABEL_27:
  if ((objc_msgSend(v6, "_resolvedEventType") & 2) != 0)
  {
    -[SignpostSupportObjectExtractor endEventProcessingBlock](self, "endEventProcessingBlock");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "passesObject:", v6);

        if ((v7 & v29 & 1) == 0)
        {
          v7 = 0;
          goto LABEL_35;
        }
      }
      else if (!(_DWORD)v7)
      {
        goto LABEL_35;
      }
      -[SignpostSupportObjectExtractor endEventProcessingBlock](self, "endEventProcessingBlock");
      v30 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v31 = ((uint64_t (**)(_QWORD, id))v30)[2](v30, v6);

      if (!v31)
        goto LABEL_39;
      v7 = 1;
    }
LABEL_35:
    if (!-[SignpostSupportObjectExtractor _isTrackingIntervals](self, "_isTrackingIntervals")
      || -[SignpostSupportObjectExtractor _generateIntervalFromEnd:shouldReport:](self, "_generateIntervalFromEnd:shouldReport:", v6, v7))
    {
      goto LABEL_37;
    }
LABEL_39:
    v32 = 0;
    goto LABEL_38;
  }
LABEL_37:
  v32 = 1;
LABEL_38:

  return v32;
}

- (BOOL)shouldComposeMetadataString
{
  return self->_shouldComposeMetadataString;
}

- (BOOL)_hasSignpostProcessingBlock
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SignpostSupportObjectExtractor beginEventProcessingBlock](self, "beginEventProcessingBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SignpostSupportObjectExtractor endEventProcessingBlock](self, "endEventProcessingBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[SignpostSupportObjectExtractor unmatchedEndEventProcessingBlock](self, "unmatchedEndEventProcessingBlock");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        -[SignpostSupportObjectExtractor repeatedBeginEventProcessingBlock](self, "repeatedBeginEventProcessingBlock");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v4 = 1;
        }
        else
        {
          -[SignpostSupportObjectExtractor emitEventProcessingBlock](self, "emitEventProcessingBlock");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v4 = 1;
          }
          else
          {
            -[SignpostSupportObjectExtractor intervalCompletionProcessingBlock](self, "intervalCompletionProcessingBlock");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v4 = 1;
            }
            else
            {
              -[SignpostSupportObjectExtractor animationIntervalCompletionProcessingBlock](self, "animationIntervalCompletionProcessingBlock");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v4 = v10 != 0;

            }
          }

        }
      }

    }
  }

  return v4;
}

- (id)endEventProcessingBlock
{
  return self->_endEventProcessingBlock;
}

- (id)beginEventProcessingBlock
{
  return self->_beginEventProcessingBlock;
}

- (id)emitEventProcessingBlock
{
  return self->_emitEventProcessingBlock;
}

- (BOOL)_isTrackingIntervals
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[SignpostSupportObjectExtractor unmatchedEndEventProcessingBlock](self, "unmatchedEndEventProcessingBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SignpostSupportObjectExtractor repeatedBeginEventProcessingBlock](self, "repeatedBeginEventProcessingBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[SignpostSupportObjectExtractor intervalCompletionProcessingBlock](self, "intervalCompletionProcessingBlock");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        -[SignpostSupportObjectExtractor animationIntervalCompletionProcessingBlock](self, "animationIntervalCompletionProcessingBlock");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v7 != 0;

      }
    }

  }
  return v4;
}

- (id)intervalCompletionProcessingBlock
{
  return self->_intervalCompletionProcessingBlock;
}

- (id)unmatchedEndEventProcessingBlock
{
  return self->_unmatchedEndEventProcessingBlock;
}

- (id)repeatedBeginEventProcessingBlock
{
  return self->_repeatedBeginEventProcessingBlock;
}

- (BOOL)_shouldBuildEventWithPid:(int)a3 uniquePid:(unint64_t)a4 processName:(id)a5 subsystem:(id)a6 category:(id)a7 shouldReport:(BOOL *)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  int v19;
  void *v20;
  int v21;
  void *v22;

  v12 = *(_QWORD *)&a3;
  v14 = a6;
  v15 = a7;
  *a8 = 1;
  v16 = a5;
  -[SignpostSupportObjectExtractor animationIntervalCompletionProcessingBlock](self, "animationIntervalCompletionProcessingBlock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[SignpostSupportObjectExtractor _eventPassesWithPid:uniquePid:processName:subsystem:category:](self, "_eventPassesWithPid:uniquePid:processName:subsystem:category:", v12, a4, v16, v14, v15);
  if (v17)
    LOBYTE(v19) = 1;
  else
    LOBYTE(v19) = v18;
  if (v17 && !v18)
  {
    if (-[SignpostSupportObjectExtractor skipAnimationStateTrackingOptimization](self, "skipAnimationStateTrackingOptimization")|| (-[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v21 = objc_msgSend(v20, "hasOutstandingAnimations"), v20, v21))
    {
      -[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v22, "isMetadataSubsystem:category:", v14, v15);

      if (v19)
      {
        *a8 = 0;
        LOBYTE(v19) = 1;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (SignpostIntervalBuilder)intervalBuilder
{
  return self->_intervalBuilder;
}

- (id)animationIntervalCompletionProcessingBlock
{
  return self->_animationIntervalCompletionProcessingBlock;
}

- (BOOL)_eventPassesWithPid:(int)a3 uniquePid:(unint64_t)a4 processName:(id)a5 subsystem:(id)a6 category:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;

  v10 = *(_QWORD *)&a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[SignpostSupportObjectExtractor subsystemCategoryFilter](self, "subsystemCategoryFilter");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[SignpostSupportObjectExtractor subsystemCategoryFilter](self, "subsystemCategoryFilter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "passesSubsystem:category:", v13, v14);

    if (!v18)
      goto LABEL_9;
  }
  -[SignpostSupportObjectExtractor pidFilter](self, "pidFilter");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[SignpostSupportObjectExtractor pidFilter](self, "pidFilter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "passesPIDNumber:", v22);

    if (!v23)
      goto LABEL_9;
  }
  -[SignpostSupportObjectExtractor uniquePidFilter](self, "uniquePidFilter");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_7;
  v25 = (void *)v24;
  -[SignpostSupportObjectExtractor uniquePidFilter](self, "uniquePidFilter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "passesUniquePIDNumber:", v27);

  if (!v28)
  {
LABEL_9:
    v32 = 0;
  }
  else
  {
LABEL_7:
    -[SignpostSupportObjectExtractor processNameFilter](self, "processNameFilter");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      -[SignpostSupportObjectExtractor processNameFilter](self, "processNameFilter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "passesProcessName:", v12);

    }
    else
    {
      v32 = 1;
    }
  }

  return v32;
}

- (SignpostSupportSubsystemCategoryFilter)subsystemCategoryFilter
{
  return self->_subsystemCategoryFilter;
}

- (BOOL)skipAnimationStateTrackingOptimization
{
  return self->_skipAnimationStateTrackingOptimization;
}

- (BOOL)_generateIntervalFromEnd:(id)a3 shouldReport:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t (*v16)(void);
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  id v21;
  char v22;
  void *v23;
  char v25;

  v4 = a4;
  v6 = a3;
  v25 = 0;
  -[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObjectExtractor animationFirstFrameGraceTimeController](self, "animationFirstFrameGraceTimeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processEndEvent:firstFrameGraceTimeController:isAnimation:", v6, v8, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_19;
  if (!v9)
  {
    -[SignpostSupportObjectExtractor unmatchedEndEventProcessingBlock](self, "unmatchedEndEventProcessingBlock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[SignpostSupportObjectExtractor unmatchedEndEventProcessingBlock](self, "unmatchedEndEventProcessingBlock");
      v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v16 = (uint64_t (*)(void))v15[2];
LABEL_17:
      v22 = v16();
      goto LABEL_18;
    }
LABEL_19:
    v22 = 1;
    goto LABEL_20;
  }
  -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SignpostSupportObjectExtractor objectFilter](self, "objectFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "passesObject:", v9);

    if (!v12)
      goto LABEL_19;
  }
  -[SignpostSupportObjectExtractor intervalCompletionProcessingBlock](self, "intervalCompletionProcessingBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    -[SignpostSupportObjectExtractor animationIntervalCompletionProcessingBlock](self, "animationIntervalCompletionProcessingBlock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_12;
  }
  -[SignpostSupportObjectExtractor _intervalEndHandler](self, "_intervalEndHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SignpostSupportObjectExtractor _intervalEndHandler](self, "_intervalEndHandler");
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v19)[2](v19, v9);

  }
LABEL_12:
  if (!v25
    || (-[SignpostSupportObjectExtractor animationIntervalCompletionProcessingBlock](self, "animationIntervalCompletionProcessingBlock"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, !v20))
  {
    -[SignpostSupportObjectExtractor intervalCompletionProcessingBlock](self, "intervalCompletionProcessingBlock");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[SignpostSupportObjectExtractor intervalCompletionProcessingBlock](self, "intervalCompletionProcessingBlock");
      v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v16 = (uint64_t (*)(void))v15[2];
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  v21 = v9;
  -[SignpostSupportObjectExtractor animationIntervalCompletionProcessingBlock](self, "animationIntervalCompletionProcessingBlock");
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v22 = ((uint64_t (*)(_QWORD *, id))v15[2])(v15, v21);

LABEL_18:
LABEL_20:

  return v22;
}

- (SignpostSupportAnimationGraceTimeController)animationFirstFrameGraceTimeController
{
  return self->_animationFirstFrameGraceTimeController;
}

- (SignpostSupportUniquePIDFilter)uniquePidFilter
{
  return self->_uniquePidFilter;
}

- (SignpostSupportExactProcessNameFilter)processNameFilter
{
  return self->_processNameFilter;
}

- (SignpostSupportPIDFilter)pidFilter
{
  return self->_pidFilter;
}

- (SignpostSupportObjectFilter)objectFilter
{
  return self->_objectFilter;
}

- (id)_intervalEndHandler
{
  return self->__intervalEndHandler;
}

- (id)_loggingSupportStreamPredicateFromFiltersWithForLiveStreaming:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];

  v3 = a3;
  v28[2] = *MEMORY[0x1E0C80C00];
  if (!-[SignpostSupportObjectExtractor _hasProcessingBlock](self, "_hasProcessingBlock"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObjectExtractor pidFilter](self, "pidFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SignpostSupportObjectExtractor pidFilter](self, "pidFilter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateEquivalent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  -[SignpostSupportObjectExtractor uniquePidFilter](self, "uniquePidFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SignpostSupportObjectExtractor uniquePidFilter](self, "uniquePidFilter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateEquivalent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  -[SignpostSupportObjectExtractor processNameFilter](self, "processNameFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SignpostSupportObjectExtractor processNameFilter](self, "processNameFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateEquivalent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  -[SignpostSupportObjectExtractor subsystemCategoryFilter](self, "subsystemCategoryFilter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SignpostSupportObjectExtractor subsystemCategoryFilter](self, "subsystemCategoryFilter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v3)
      objc_msgSend(v16, "liveStreamingPredicate");
    else
      objc_msgSend(v16, "predicateEquivalent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  if (objc_msgSend(v5, "count"))
  {
    -[SignpostSupportObjectExtractor subsystemCategoryFilter](self, "subsystemCategoryFilter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20 || v3)
      goto LABEL_22;
    -[SignpostSupportObjectExtractor subsystemCategoryFilter](self, "subsystemCategoryFilter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SignpostIntervalBuilder _filterPassesRequiredSCForFramerate:includeMetal:](SignpostIntervalBuilder, "_filterPassesRequiredSCForFramerate:includeMetal:", v21, -[SignpostSupportObjectExtractor includeMetalAnalysis](self, "includeMetalAnalysis")))
    {

LABEL_22:
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    -[SignpostSupportObjectExtractor animationIntervalCompletionProcessingBlock](self, "animationIntervalCompletionProcessingBlock");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SignpostIntervalBuilder _framerateCalculationAllowlist:](SignpostIntervalBuilder, "_framerateCalculationAllowlist:", -[SignpostSupportObjectExtractor includeMetalAnalysis](self, "includeMetalAnalysis"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "predicateEquivalent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    v28[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
LABEL_23:

  return v22;
}

- (BOOL)includeMetalAnalysis
{
  return self->_includeMetalAnalysis;
}

- (BOOL)_hasProcessingBlock
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[SignpostSupportObjectExtractor _hasSignpostProcessingBlock](self, "_hasSignpostProcessingBlock"))
    return 1;
  -[SignpostSupportObjectExtractor logMessageProcessingBlock](self, "logMessageProcessingBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    -[SignpostSupportObjectExtractor deviceRebootProcessingBlock](self, "deviceRebootProcessingBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = 1;
    }
    else
    {
      -[SignpostSupportObjectExtractor processingCompletionBlock](self, "processingCompletionBlock");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v3 = 1;
      }
      else
      {
        -[SignpostSupportObjectExtractor timedOutBeginEventProcessingBlock](self, "timedOutBeginEventProcessingBlock");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7 != 0;

      }
    }

  }
  return v3;
}

- (void)setSubsystemCategoryFilter:(id)a3
{
  objc_storeStrong((id *)&self->_subsystemCategoryFilter, a3);
}

- (id)logMessageProcessingBlock
{
  return self->_logMessageProcessingBlock;
}

- (void)set_stopProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setIntervalCompletionProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setAnimationIntervalCompletionProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setCurrentBootUUID:(id)a3
{
  objc_storeStrong((id *)&self->_currentBootUUID, a3);
}

- (BOOL)processSerializedObjectsFromData:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  _QWORD v13[7];
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  -[SignpostSupportObjectExtractor _processingStarting](self, "_processingStarting");
  if (!-[SignpostSupportObjectExtractor _hasProcessingBlock](self, "_hasProcessingBlock"))
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("No processing blocks specified");
      v9 = 8;
      goto LABEL_7;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_15;
  }
  if (!-[SignpostSupportObjectExtractor _shouldStopProcessing](self, "_shouldStopProcessing"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy_;
    v14[4] = __Block_byref_object_dispose_;
    v15 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__SignpostSupportObjectExtractor_Deserialization__processSerializedObjectsFromData_errorOut___block_invoke;
    v13[3] = &unk_1E4600F00;
    v13[4] = self;
    v13[5] = &v16;
    v13[6] = v14;
    v10 = SignpostSupportDeserializationEnumerateObjectArrayFromData((uint64_t)v6, a4, (uint64_t)v13);
    if (v10)
    {
      if (*((_BYTE *)v17 + 24))
      {
LABEL_14:
        _Block_object_dispose(v14, 8);

        _Block_object_dispose(&v16, 8);
        goto LABEL_15;
      }
      v11 = 0;
    }
    else
    {
      v11 = *a4;
    }
    -[SignpostSupportObjectExtractor _processingCompleted:](self, "_processingCompleted:", v11);
    goto LABEL_14;
  }
  if (!a4)
    goto LABEL_8;
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = CFSTR("Processing requested after processing already completed.");
  v9 = 3;
LABEL_7:
  objc_msgSend(v7, "errorWithCode:description:", v9, v8);
  v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v10;
}

void __93__SignpostSupportObjectExtractor_Deserialization__processSerializedObjectsFromData_errorOut___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t (**v16)(void);
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unsigned __int8 v28;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "subsystemCategoryFilter");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_4;
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "subsystemCategoryFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subsystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "passesSubsystem:category:", v9, v10);

    if (v11)
    {
LABEL_4:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_processSignpostSupportLogMessage:", v5);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        *a3 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v5;
      objc_msgSend(*(id *)(a1 + 32), "intervalBuilder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "timestampIndicatesDeviceReboot:", objc_msgSend(v12, "timeRecordedMachContinuousTime"));

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "deviceRebootProcessingBlock");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "deviceRebootProcessingBlock");
          v16 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v16[2]();

          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
            *a3 = 1;
        }
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        v28 = 0;
        if (objc_msgSend(*(id *)(a1 + 32), "_shouldProcessEvent:shouldReport:", v12, &v28))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_processSignpostEvent:shouldReport:", v12, v28);
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
            *a3 = 1;
        }
      }

    }
    else
    {
      _signpost_debug_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __93__SignpostSupportObjectExtractor_Deserialization__processSerializedObjectsFromData_errorOut___block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);

      *a3 = 1;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Unexpected serialized class instance found"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
  }

}

- (void)finishProcessingSerializedData
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (-[SignpostSupportObjectExtractor _shouldStopProcessing](self, "_shouldStopProcessing"))
  {
    _signpost_debug_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[SignpostSupportObjectExtractor(Deserialization) finishProcessingSerializedData].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    -[SignpostSupportObjectExtractor _processingCompleted:](self, "_processingCompleted:", 0);
  }
}

- (BOOL)processSerializedObjectsFromSignpostFile:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SignpostSupportObjectExtractor _processingStarting](self, "_processingStarting");
  if (-[SignpostSupportObjectExtractor _hasProcessingBlock](self, "_hasProcessingBlock"))
  {
    v41 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v6, 1, &v41);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v41;
    v9 = v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 0;
    if (v10)
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, &v40);
      v16 = v40;
      v17 = v16;
      if (!v15 || v16)
      {
        v11 = 0;
        if (a4)
          *a4 = (id)objc_msgSend(v16, "copy");
      }
      else
      {
        objc_msgSend(v15, "decodeObjectOfClasses:forKey:", v14, *MEMORY[0x1E0CB2CD0]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v31 = v15;
          v32 = v14;
          v33 = v9;
          v34 = v7;
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v30 = v18;
          v20 = v18;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
          if (v21)
          {
            v22 = v21;
            v23 = 0;
            v24 = *(_QWORD *)v37;
            while (2)
            {
              v25 = 0;
              v26 = v23;
              do
              {
                if (*(_QWORD *)v37 != v24)
                  objc_enumerationMutation(v20);
                v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v25);
                v35 = v26;
                v28 = -[SignpostSupportObjectExtractor processSerializedObjectsFromData:errorOut:](self, "processSerializedObjectsFromData:errorOut:", v27, &v35);
                v23 = v35;

                if (!v28)
                {
                  if (a4)
                    *a4 = (id)objc_msgSend(v23, "copy");

                  v11 = 0;
                  goto LABEL_34;
                }
                ++v25;
                v26 = v23;
              }
              while (v22 != v25);
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
              if (v22)
                continue;
              break;
            }
          }
          else
          {
            v23 = 0;
          }

          -[SignpostSupportObjectExtractor finishProcessingSerializedData](self, "finishProcessingSerializedData");
          v11 = 1;
LABEL_34:
          v9 = v33;
          v7 = v34;
          v15 = v31;
          v17 = 0;
          v19 = v30;

          v14 = v32;
        }
        else
        {
          v11 = 0;
          if (a4)
            *a4 = (id)objc_msgSend(0, "copy");
        }

      }
    }
    else
    {
      v11 = 0;
      if (a4)
        *a4 = (id)objc_msgSend(v8, "copy");
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 8, CFSTR("No processing blocks specified"));
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_hasNonObjectFilters
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[SignpostSupportObjectExtractor subsystemCategoryFilter](self, "subsystemCategoryFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SignpostSupportObjectExtractor pidFilter](self, "pidFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[SignpostSupportObjectExtractor uniquePidFilter](self, "uniquePidFilter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        -[SignpostSupportObjectExtractor processNameFilter](self, "processNameFilter");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v7 != 0;

      }
    }

  }
  return v4;
}

- (BOOL)_eventPassesFilters:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "processID");
  v6 = objc_msgSend(v4, "processUniqueID");
  objc_msgSend(v4, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[SignpostSupportObjectExtractor _eventPassesWithPid:uniquePid:processName:subsystem:category:](self, "_eventPassesWithPid:uniquePid:processName:subsystem:category:", v5, v6, v7, v8, v9);
  return (char)self;
}

- (BOOL)_shouldProcessEvent:(id)a3 shouldReport:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v6 = a3;
  *a4 = 1;
  -[SignpostSupportObjectExtractor animationIntervalCompletionProcessingBlock](self, "animationIntervalCompletionProcessingBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SignpostSupportObjectExtractor subsystemCategoryFilter](self, "subsystemCategoryFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && !-[SignpostSupportObjectExtractor _eventPassesFilters:](self, "_eventPassesFilters:", v6))
    {
      -[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "signpostIsAnimationMetadata:", v6);

      if (!v10)
      {
        v11 = 0;
        goto LABEL_9;
      }
      *a4 = 0;
    }
    v11 = 1;
  }
  else
  {
    v11 = -[SignpostSupportObjectExtractor _eventPassesFilters:](self, "_eventPassesFilters:", v6);
  }
LABEL_9:

  return v11;
}

- (BOOL)_processSignpostSupportLogMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  char v10;

  v4 = a3;
  -[SignpostSupportObjectExtractor logMessageProcessingBlock](self, "logMessageProcessingBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && ((-[SignpostSupportObjectExtractor objectFilter](self, "objectFilter"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v6,
         !v6)
     || (-[SignpostSupportObjectExtractor objectFilter](self, "objectFilter"),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         v8 = objc_msgSend(v7, "passesObject:", v4),
         v7,
         v8)))
  {
    -[SignpostSupportObjectExtractor logMessageProcessingBlock](self, "logMessageProcessingBlock");
    v9 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = ((uint64_t (**)(_QWORD, id))v9)[2](v9, v4);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)buildSkyLightAnimationCompositeIntervalTimelines
{
  void *v2;
  char v3;

  -[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "buildSkyLightAnimationCompositeIntervalTimelines");

  return v3;
}

- (void)setBuildSkyLightAnimationCompositeIntervalTimelines:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBuildSkyLightAnimationCompositeIntervalTimelines:", v3);

}

- (void)_processingStarting
{
  -[SignpostSupportObjectExtractor setCachedTimebaseRatio:](self, "setCachedTimebaseRatio:", 0.0);
}

- (void)setProcessNameFilter:(id)a3
{
  objc_storeStrong((id *)&self->_processNameFilter, a3);
}

- (void)setPidFilter:(id)a3
{
  objc_storeStrong((id *)&self->_pidFilter, a3);
}

- (void)setUniquePidFilter:(id)a3
{
  objc_storeStrong((id *)&self->_uniquePidFilter, a3);
}

- (void)setObjectFilter:(id)a3
{
  objc_storeStrong((id *)&self->_objectFilter, a3);
}

- (void)setShouldComposeMetadataString:(BOOL)a3
{
  self->_shouldComposeMetadataString = a3;
}

- (void)setIncludeMetalAnalysis:(BOOL)a3
{
  self->_includeMetalAnalysis = a3;
}

- (void)setBeginEventProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setEndEventProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setRepeatedBeginEventProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setUnmatchedEndEventProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setEmitEventProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setLogMessageProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)deviceRebootProcessingBlock
{
  return self->_deviceRebootProcessingBlock;
}

- (void)setDeviceRebootProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setProcessingCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)timedOutBeginEventProcessingBlock
{
  return self->_timedOutBeginEventProcessingBlock;
}

- (void)setTimedOutBeginEventProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)_notificationTimeout
{
  return self->__notificationTimeout;
}

- (void)set_notificationTimeout:(unint64_t)a3
{
  self->__notificationTimeout = a3;
}

- (OS_dispatch_queue)notificationProcessingQueue
{
  return self->_notificationProcessingQueue;
}

- (OSLogEventLiveStream)_liveStream
{
  return self->__liveStream;
}

- (void)set_liveStream:(id)a3
{
  objc_storeStrong((id *)&self->__liveStream, a3);
}

- (void)set_intervalEndHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setSkipAnimationStateTrackingOptimization:(BOOL)a3
{
  self->_skipAnimationStateTrackingOptimization = a3;
}

- (void)setDisableGeneratorProcessing:(BOOL)a3
{
  self->_disableGeneratorProcessing = a3;
}

- (double)cachedTimebaseRatio
{
  return self->_cachedTimebaseRatio;
}

- (void)setCachedTimebaseRatio:(double)a3
{
  self->_cachedTimebaseRatio = a3;
}

void __93__SignpostSupportObjectExtractor_Deserialization__processSerializedObjectsFromData_errorOut___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A1A28000, a1, a3, "Unexpected serialized class instance", a5, a6, a7, a8, 0);
}

@end
