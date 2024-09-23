@implementation PLBackgroundJobStatusCenter

- (PLBackgroundJobStatusCenter)init
{
  PLBackgroundJobStatusCenter *v2;
  NSMutableArray *v3;
  NSMutableArray *registrationEventsQueue;
  NSMutableArray *v5;
  NSMutableArray *runningEventsQueue;
  NSMutableSet *v7;
  NSMutableSet *workersResponsibleForRegistration;
  NSMutableSet *v9;
  NSMutableSet *criteriaShortCodesOfRegisteredActivities;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *isolationQueue;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PLBackgroundJobStatusCenter;
  v2 = -[PLBackgroundJobStatusCenter init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registrationEventsQueue = v2->_registrationEventsQueue;
    v2->_registrationEventsQueue = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    runningEventsQueue = v2->_runningEventsQueue;
    v2->_runningEventsQueue = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    workersResponsibleForRegistration = v2->_workersResponsibleForRegistration;
    v2->_workersResponsibleForRegistration = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    criteriaShortCodesOfRegisteredActivities = v2->_criteriaShortCodesOfRegisteredActivities;
    v2->_criteriaShortCodesOfRegisteredActivities = v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.photos.backgroundjobstatuscenter.isolationqueue", v12);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v13;

  }
  return v2;
}

- (void)_addRegistrationEventToQueue:(id)a3
{
  NSObject *isolationQueue;
  id v5;

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  -[NSMutableArray addObject:](self->_registrationEventsQueue, "addObject:", v5);

  if ((unint64_t)-[NSMutableArray count](self->_registrationEventsQueue, "count") >= 0x15)
    -[NSMutableArray removeObjectAtIndex:](self->_registrationEventsQueue, "removeObjectAtIndex:", 0);
}

- (void)_addRunningEventToQueue:(id)a3
{
  NSObject *isolationQueue;
  id v5;

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  -[NSMutableArray addObject:](self->_runningEventsQueue, "addObject:", v5);

  if ((unint64_t)-[NSMutableArray count](self->_runningEventsQueue, "count") >= 0x15)
    -[NSMutableArray removeObjectAtIndex:](self->_runningEventsQueue, "removeObjectAtIndex:", 0);
}

- (void)_recordRegistrationEventToState:(unint64_t)a3
{
  PLBackgroundJobStatusRegistrationEvent *v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v4 = objc_alloc_init(PLBackgroundJobStatusRegistrationEvent);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusEvent setEventTimestamp:](v4, "setEventTimestamp:", v5);

  -[PLBackgroundJobStatusRegistrationEvent setRegisteredActivity:](v4, "setRegisteredActivity:", 1);
  -[NSMutableSet allObjects](self->_workersResponsibleForRegistration, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusRegistrationEvent setWorkersResponsible:](v4, "setWorkersResponsible:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_criteriaShortCodesOfRegisteredActivities;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@ "), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_msgSend(v7, "copy");
  -[PLBackgroundJobStatusRegistrationEvent setRegisteredPriorities:](v4, "setRegisteredPriorities:", v13);

  -[PLBackgroundJobStatusCenter _addRegistrationEventToQueue:](self, "_addRegistrationEventToQueue:", v4);
  -[NSMutableSet removeAllObjects](self->_workersResponsibleForRegistration, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_criteriaShortCodesOfRegisteredActivities, "removeAllObjects");

}

- (void)_recordNonRegistrationEvent
{
  void *v3;
  PLBackgroundJobStatusRegistrationEvent *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v4 = objc_alloc_init(PLBackgroundJobStatusRegistrationEvent);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusEvent setEventTimestamp:](v4, "setEventTimestamp:", v3);

  -[PLBackgroundJobStatusRegistrationEvent setRegisteredActivity:](v4, "setRegisteredActivity:", 0);
  -[PLBackgroundJobStatusCenter _addRegistrationEventToQueue:](self, "_addRegistrationEventToQueue:", v4);
  -[NSMutableSet removeAllObjects](self->_workersResponsibleForRegistration, "removeAllObjects");

}

- (void)recordWorkerHasPendingJobs:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PLBackgroundJobStatusCenter_recordWorkerHasPendingJobs___block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, v7);

}

- (void)recordActivityRegisteredWithCriteria:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PLBackgroundJobStatusCenter_recordActivityRegisteredWithCriteria___block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, v7);

}

- (void)recordStartingWorker:(id)a3 withJobCount:(unint64_t)a4
{
  id v6;
  NSObject *isolationQueue;
  id v8;
  _QWORD block[4];
  id v10;
  PLBackgroundJobStatusCenter *v11;
  unint64_t v12;

  v6 = a3;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PLBackgroundJobStatusCenter_recordStartingWorker_withJobCount___block_invoke;
  block[3] = &unk_1E3677C40;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_async(isolationQueue, block);

}

- (void)recordStoppingWorker:(id)a3 withRemainingJobCount:(unint64_t)a4
{
  id v6;
  NSObject *isolationQueue;
  id v8;
  _QWORD block[4];
  id v10;
  PLBackgroundJobStatusCenter *v11;
  unint64_t v12;

  v6 = a3;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PLBackgroundJobStatusCenter_recordStoppingWorker_withRemainingJobCount___block_invoke;
  block[3] = &unk_1E3677C40;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_async(isolationQueue, block);

}

- (void)recordFinishingWorker:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PLBackgroundJobStatusCenter *v9;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PLBackgroundJobStatusCenter_recordFinishingWorker___block_invoke;
  v7[3] = &unk_1E3677C18;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(isolationQueue, v7);

}

- (NSDictionary)statusDumpDictionary
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__100794;
  v10 = __Block_byref_object_dispose__100795;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PLBackgroundJobStatusCenter_statusDumpDictionary__block_invoke;
  v5[3] = &unk_1E3677C68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)backgroundJobServiceDidChangeStateFrom:(unint64_t)a3 to:(unint64_t)a4
{
  NSObject *isolationQueue;
  _QWORD block[7];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PLBackgroundJobStatusCenter_backgroundJobServiceDidChangeStateFrom_to___block_invoke;
  block[3] = &unk_1E3677C90;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(isolationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_criteriaShortCodesOfRegisteredActivities, 0);
  objc_storeStrong((id *)&self->_workersResponsibleForRegistration, 0);
  objc_storeStrong((id *)&self->_runningEventsQueue, 0);
  objc_storeStrong((id *)&self->_registrationEventsQueue, 0);
}

uint64_t __73__PLBackgroundJobStatusCenter_backgroundJobServiceDidChangeStateFrom_to___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  if (*(_QWORD *)(result + 40) == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "removeAllObjects");
    result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "removeAllObjects");
  }
  if (*(_QWORD *)(v1 + 48) == 2)
  {
    v2 = *(_QWORD *)(v1 + 40);
    if (v2 == 3)
    {
      return objc_msgSend(*(id *)(v1 + 32), "_recordNonRegistrationEvent");
    }
    else if (v2 == 4)
    {
      return objc_msgSend(*(id *)(v1 + 32), "_recordRegistrationEventToState:", 4);
    }
  }
  return result;
}

void __51__PLBackgroundJobStatusCenter_statusDumpDictionary__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v7), "statusDump");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v5);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "statusDump");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v12);
  }

  v27[0] = CFSTR("RegistrationEvents");
  v27[1] = CFSTR("RunningEvents");
  v28[0] = v2;
  v28[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

}

void __53__PLBackgroundJobStatusCenter_recordFinishingWorker___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  PLBackgroundJobStatusFinishWorkerEvent *v4;

  v4 = objc_alloc_init(PLBackgroundJobStatusFinishWorkerEvent);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusEvent setEventTimestamp:](v4, "setEventTimestamp:", v2);

  objc_msgSend(*(id *)(a1 + 32), "workerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusFinishWorkerEvent setWorker:](v4, "setWorker:", v3);

  objc_msgSend(*(id *)(a1 + 40), "_addRunningEventToQueue:", v4);
}

void __74__PLBackgroundJobStatusCenter_recordStoppingWorker_withRemainingJobCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  PLBackgroundJobStatusStopWorkerEvent *v4;

  v4 = objc_alloc_init(PLBackgroundJobStatusStopWorkerEvent);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusEvent setEventTimestamp:](v4, "setEventTimestamp:", v2);

  objc_msgSend(*(id *)(a1 + 32), "workerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusStopWorkerEvent setWorker:](v4, "setWorker:", v3);

  -[PLBackgroundJobStatusStopWorkerEvent setPendingJobsCount:](v4, "setPendingJobsCount:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_addRunningEventToQueue:", v4);

}

void __65__PLBackgroundJobStatusCenter_recordStartingWorker_withJobCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  PLBackgroundJobStatusStartWorkerEvent *v4;

  v4 = objc_alloc_init(PLBackgroundJobStatusStartWorkerEvent);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusEvent setEventTimestamp:](v4, "setEventTimestamp:", v2);

  objc_msgSend(*(id *)(a1 + 32), "workerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobStatusStartWorkerEvent setWorker:](v4, "setWorker:", v3);

  -[PLBackgroundJobStatusStartWorkerEvent setJobsCount:](v4, "setJobsCount:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_addRunningEventToQueue:", v4);

}

void __68__PLBackgroundJobStatusCenter_recordActivityRegisteredWithCriteria___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "shortCode");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __58__PLBackgroundJobStatusCenter_recordWorkerHasPendingJobs___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "workerName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

@end
