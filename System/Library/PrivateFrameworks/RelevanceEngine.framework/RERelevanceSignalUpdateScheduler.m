@implementation RERelevanceSignalUpdateScheduler

- (id)_init
{
  _QWORD *v2;
  dispatch_queue_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RERelevanceSignalUpdateScheduler;
  v2 = -[RESingleton _init](&v10, sel__init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.RelevanceEngine.SignalUpdateScheduler", 0);
    v4 = (void *)v2[2];
    v2[2] = v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[1];
    v2[1] = v5;

    *((_BYTE *)v2 + 40) = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    RESignificantTimeChangeNotification();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__updateBlocks, v8, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RERelevanceSignalUpdateScheduler;
  -[RERelevanceSignalUpdateScheduler dealloc](&v4, sel_dealloc);
}

- (void)scheduleEventWithIdentifier:(id)a3 updateFrequency:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *queue;
  _QWORD v12[5];
  id v13;
  id v14;
  double v15;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __91__RERelevanceSignalUpdateScheduler_scheduleEventWithIdentifier_updateFrequency_completion___block_invoke;
    v12[3] = &unk_24CF8C768;
    v12[4] = self;
    v13 = v8;
    v15 = a4;
    v14 = v10;
    dispatch_async(queue, v12);

  }
}

void __91__RERelevanceSignalUpdateScheduler_scheduleEventWithIdentifier_updateFrequency_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Event with name %@ already specified"), v3, v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_opt_new();
  v13 = v9;
  v10 = *(double *)(a1 + 56);
  if (v10 < 0.0)
    v10 = -v10;
  objc_msgSend(v9, "setInterval:", v10);
  objc_msgSend(v13, "setCompletion:", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingTimeInterval:", -0.1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLastFireDate:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_rescheduleTimer");

}

- (void)unscheduleEventWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__RERelevanceSignalUpdateScheduler_unscheduleEventWithIdentifier___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __66__RERelevanceSignalUpdateScheduler_unscheduleEventWithIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_rescheduleTimer");
}

- (void)_rescheduleTimer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[6];
  _QWORD v21[3];
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    objc_msgSend(*(id *)(v1 + 24), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v22 = 0;
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v6 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke_2;
      v20[3] = &unk_24CF8C790;
      v20[4] = v21;
      v20[5] = &v23;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v20);
      v7 = v24[3];
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 32);
        *(_QWORD *)(v10 + 32) = v9;

        v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      }
      objc_msgSend(v8, "dateByAddingTimeInterval:", (double)v7 / 1000.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, *(id *)(a1 + 32));
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke_3;
      v17[3] = &unk_24CF8ABD0;
      objc_copyWeak(&v18, &location);
      +[REUpNextTimer timerWithFireDate:queue:block:](REUpNextTimer, "timerWithFireDate:queue:block:", v12, v13, v17);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 24);
      *(_QWORD *)(v15 + 24) = v14;

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

      _Block_object_dispose(v21, 8);
      _Block_object_dispose(&v23, 8);
    }
  }
}

uint64_t __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  uint64_t result;
  double v6;
  unint64_t v7;
  unint64_t v8;
  double v9;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    result = objc_msgSend(a3, "interval");
    v7 = (unint64_t)(v6 * 1000.0);
    if (v7)
    {
      do
      {
        v8 = v7;
        v7 = v4 % v7;
        v4 = v8;
      }
      while (v7);
    }
    else
    {
      v8 = v4;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
  }
  else
  {
    result = objc_msgSend(a3, "interval");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)(v9 * 1000.0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

void __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updateBlocks");

}

- (void)_updateBlocks
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__RERelevanceSignalUpdateScheduler__updateBlocks__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__RERelevanceSignalUpdateScheduler__updateBlocks__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateBlocks");
}

- (void)_queue_updateBlocks
{
  NSDate *v3;
  NSMutableDictionary *updateBlocks;
  uint64_t v5;
  NSDate *lastFireDate;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](v3, "timeIntervalSinceReferenceDate");
  updateBlocks = self->_updateBlocks;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__RERelevanceSignalUpdateScheduler__queue_updateBlocks__block_invoke;
  v7[3] = &__block_descriptor_40_e51_v32__0__NSString_8___RESignalScheduledUpdate_16_B24l;
  v7[4] = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](updateBlocks, "enumerateKeysAndObjectsUsingBlock:", v7);
  lastFireDate = self->_lastFireDate;
  self->_lastFireDate = v3;

  -[RERelevanceSignalUpdateScheduler _rescheduleTimer](self, "_rescheduleTimer");
}

void __55__RERelevanceSignalUpdateScheduler__queue_updateBlocks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void (**v11)(void);
  id v12;

  v12 = a3;
  objc_msgSend(v12, "interval");
  v5 = v4;
  objc_msgSend(v12, "lastFireDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = *(double *)(a1 + 32);
  if (v8 - v7 > v5)
  {
    do
    {
      v9 = v7;
      v7 = v5 + v7;
    }
    while (v7 < v8);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastFireDate:", v10);

    objc_msgSend(v12, "completion");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11[2]();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFireDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
}

@end
