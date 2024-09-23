@implementation VSOccasionalTimesObserver

- (VSOccasionalTimesObserver)initWithTimebase:(OpaqueCMTimebase *)a3 times:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  dispatch_source_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD block[4];
  id v29;
  _QWORD handler[4];
  id v31;
  id location;
  objc_super v33;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)VSOccasionalTimesObserver;
  v13 = -[VSOccasionalTimesObserver init](&v33, sel_init);
  if (v13)
  {
    *((_QWORD *)v13 + 9) = CFRetain(a3);
    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_1347);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v13 + 4);
    *((_QWORD *)v13 + 4) = v14;

    if (v11)
    {
      v16 = v11;
      v17 = (void *)*((_QWORD *)v13 + 1);
      *((_QWORD *)v13 + 1) = v16;
    }
    else
    {
      v18 = MEMORY[0x24BDAC9B8];
      v19 = MEMORY[0x24BDAC9B8];
      v17 = (void *)*((_QWORD *)v13 + 1);
      *((_QWORD *)v13 + 1) = v18;
    }

    v20 = objc_msgSend(v12, "copy");
    v21 = (void *)*((_QWORD *)v13 + 8);
    *((_QWORD *)v13 + 8) = v20;

    v22 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v13 + 1));
    v23 = (void *)*((_QWORD *)v13 + 2);
    *((_QWORD *)v13 + 2) = v22;

    objc_initWeak(&location, v13);
    v24 = *((_QWORD *)v13 + 2);
    v25 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke_2;
    handler[3] = &unk_24DD8E648;
    objc_copyWeak(&v31, &location);
    dispatch_source_set_event_handler(v24, handler);
    dispatch_resume(*((dispatch_object_t *)v13 + 2));
    CMTimebaseAddTimerDispatchSource(*((CMTimebaseRef *)v13 + 9), *((dispatch_source_t *)v13 + 2));
    v26 = *((_QWORD *)v13 + 1);
    block[0] = v25;
    block[1] = 3221225472;
    block[2] = __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke_3;
    block[3] = &unk_24DD8EBB0;
    v29 = v13;
    dispatch_async(v26, block);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return (VSOccasionalTimesObserver *)v13;
}

- (void)dealloc
{
  OS_dispatch_queue *timerQueue;
  OpaqueCMTimebase *timebase;
  objc_super v5;

  timerQueue = self->_timerQueue;
  self->_timerQueue = 0;

  timebase = self->_timebase;
  if (timebase)
  {
    CFRelease(timebase);
    self->_timebase = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VSOccasionalTimesObserver;
  -[VSOccasionalTimesObserver dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  NSObject *timerQueue;
  _QWORD block[5];

  timerQueue = self->_timerQueue;
  if (timerQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__VSOccasionalTimesObserver_invalidate__block_invoke;
    block[3] = &unk_24DD8EBB0;
    block[4] = self;
    dispatch_async(timerQueue, block);
  }
  else
  {
    -[VSOccasionalTimesObserver _reallyInvalidate](self, "_reallyInvalidate");
  }
}

- (void)_reallyInvalidate
{
  OpaqueCMTimebase *timebase;
  NSObject *timerSource;
  OS_dispatch_source *v5;
  CMTime v6;

  if (!self->_invalid)
  {
    self->_invalid = 1;
    timebase = self->_timebase;
    if (timebase)
    {
      timerSource = self->_timerSource;
      if (!timerSource
        || (v6 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40],
            CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &v6, 0),
            CMTimebaseRemoveTimerDispatchSource(self->_timebase, (dispatch_source_t)self->_timerSource),
            (timebase = self->_timebase) != 0))
      {
        CFRelease(timebase);
        self->_timebase = 0;
      }
    }
    v5 = self->_timerSource;
    self->_timerSource = 0;

  }
}

- (void)_resetNextFireTime
{
  BOOL v3;
  CMTime *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  CMTimeEpoch epoch;
  OpaqueCMTimebase *timebase;
  NSObject *timerSource;
  CMTime v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMTime time2;
  CMTime time1;
  CMTime v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->_timerSource && self->_timebase)
  {
    memset(&v22, 0, sizeof(v22));
    CMTimebaseGetTimeClampedAboveAnchorTime();
    v3 = (unsigned __int128)0 >> 96 == 1 && v22.epoch == 0;
    v4 = (CMTime *)MEMORY[0x24BDC0D88];
    if (!v3 || (time1 = v22, time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88], CMTimeCompare(&time1, &time2) < 0))
      v22 = *v4;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_times;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          memset(&time1, 0, sizeof(time1));
          if (v10)
            objc_msgSend(v10, "CMTimeValue");
          time2 = time1;
          v15 = v22;
          if (CMTimeCompare(&time2, &v15) >= 1)
          {
            v11 = *(_OWORD *)&time1.value;
            *(_OWORD *)&self->_nextFireTime.value = *(_OWORD *)&time1.value;
            epoch = time1.epoch;
            self->_nextFireTime.epoch = time1.epoch;
            timebase = self->_timebase;
            timerSource = self->_timerSource;
            *(_OWORD *)&time2.value = v11;
            time2.epoch = epoch;
            CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &time2, 0);
            goto LABEL_22;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_22:

  }
}

- (OpaqueCMTimebase)timebase
{
  return self->_timebase;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_times, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
}

uint64_t __39__VSOccasionalTimesObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyInvalidate");
}

void __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke_2(uint64_t a1)
{
  char *WeakRetained;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, __int128 *, uint64_t);
  __int128 v7;
  uint64_t v8;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[24])
    {
      v5 = *((_QWORD *)WeakRetained + 7);
      v4 = *((_QWORD *)WeakRetained + 8);
      v6 = *(void (**)(uint64_t, __int128 *, uint64_t))(v4 + 16);
      v7 = *(_OWORD *)(v3 + 40);
      v8 = v5;
      v6(v4, &v7, v2);
    }
    if (*((_QWORD *)v3 + 9))
      objc_msgSend(v3, "_resetNextFireTime");
  }

}

uint64_t __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetNextFireTime");
}

uint64_t __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  CMTime v9;
  CMTime time1;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5)
      goto LABEL_3;
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  objc_msgSend(v4, "CMTimeValue");
  if (!v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "CMTimeValue");
LABEL_6:
  v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

@end
