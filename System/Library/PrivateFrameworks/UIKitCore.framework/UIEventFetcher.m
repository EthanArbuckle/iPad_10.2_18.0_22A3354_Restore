@implementation UIEventFetcher

- (void)drainEvents:(uint64_t)a1
{
  id v3;
  void (**v4)(id, _QWORD);
  id v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    v4 = (void (**)(id, _QWORD))v3;
    os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
    v4[2](v4, *(_QWORD *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);

    v3 = v5;
  }

}

- (void)setEventFetcherSink:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 256), a2);
    if (_UIUpdateCycleEnabled())
      objc_msgSend(*(id *)(a1 + 256), "eventFetcherDidReceiveEvents:", a1);
    if ((_UIUpdateCycleEnabled() & 1) == 0)
      -[UIEventFetcher signalEventsAvailableWithReason:filteredEventCount:](a1, 1);
  }

}

uint64_t __22__UIEventFetcher_init__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((_UIUpdateCycleEnabled() & 1) == 0)
    *(double *)(*(_QWORD *)(a1 + 32) + 136) = (double)(unint64_t)IOHIDEventGetTimeStamp();
  return objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
}

- (uint64_t)_receiveHIDEventInternal:(uint64_t)result
{
  uint64_t v3;
  int Type;
  void *v5;
  char v6;
  char v7;
  _QWORD *v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  char v22;
  char v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[4];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[3];
  int v36;

  if (result)
  {
    v3 = result;
    _UIEventProfileCollectionSubmitEvent(a2);
    Type = IOHIDEventGetType();
    IOHIDEventGetEventFlags();
    if (Type == 11 && _UIEventHIDGetChildStylusEvent(a2))
      IOHIDEventGetFloatValue();
    BKSHIDEventGetDigitizerAttributes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "options");

    IOHIDEventGetSenderID();
    IOHIDEventGetTimeStamp();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
    if (_UIUpdateCycleEnabled())
    {
      kdebug_trace();
      os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
      (*(void (**)(void))(*(_QWORD *)(v3 + 24) + 16))();
      os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
      objc_msgSend(*(id *)(v3 + 256), "eventFetcherDidReceiveEvents:", v3);
      kdebug_trace();
    }
    result = _UIUpdateCycleEnabled();
    if ((result & 1) == 0)
    {
      kdebug_trace();
      os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
      if (*(_QWORD *)(v3 + 80))
        ++*(_QWORD *)(v3 + 88);
      os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x2020000000;
      v36 = 0;
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0;
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 1;
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x2020000000;
      v26[3] = 0;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      v25 = 0;
      v6 = *(_BYTE *)(v3 + 168);
      v7 = objc_msgSend(*(id *)(v3 + 80), "isPaused");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v13 = __30__UIEventFetcher_filterEvent___block_invoke;
      v14 = &unk_1E16DF948;
      v22 = v7;
      v23 = v6;
      v20 = v26;
      v21 = a2;
      v15 = v3;
      v16 = v35;
      v17 = &v31;
      v18 = &v27;
      v19 = v24;
      v8 = v12;
      os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
      v13((uint64_t)v8);

      os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
      kdebug_trace();
      if (*((_BYTE *)v32 + 24))
      {
        if (*(_QWORD *)(v3 + 80))
        {
          v9 = CACurrentMediaTime();
          v10 = *(double *)(v3 + 192);
          if (v10 != 0.0)
          {
            v11 = v10 - *(double *)(v3 + 184);
            if (v10 < v9 + v11 * 0.3)
            {
              *(double *)(v3 + 184) = v10;
              *(double *)(v3 + 192) = v10 + v11;
            }
          }
        }
        -[UIEventFetcher signalEventsAvailableWithReason:filteredEventCount:](v3, v28[3]);
      }
      _Block_object_dispose(v24, 8);
      _Block_object_dispose(v26, 8);
      _Block_object_dispose(&v27, 8);
      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(v35, 8);
      return kdebug_trace();
    }
  }
  return result;
}

void __34__UIEventFetcher_setupForRunLoop___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;

  if (IOHIDEventGetType() != 35
    || (_UIFocusBehaviorForScene(0),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "supportsGameControllers"),
        v2,
        v3))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)threadMain
{
  void *v3;
  id v4;
  CADisplayLink *v5;
  CADisplayLink *displayLink;
  double v7;
  CADisplayLink *v8;
  double v9;
  void *v10;

  v3 = (void *)MEMORY[0x186DC9484](self, a2);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    kdebug_trace();
    self->_cfRunLoop = (__CFRunLoop *)objc_msgSend(v4, "getCFRunLoop");
    -[NSMutableArray addObject:](self->_eventFilters, "addObject:", &__block_literal_global_464);
    -[UIEventFetcher _setupFilterChain]((uint64_t)self);
    if ((_UIUpdateCycleEnabled() & 1) == 0)
    {
      if (qword_1ECD7A3D8 != -1)
        dispatch_once(&qword_1ECD7A3D8, &__block_literal_global_98_1);
      if (byte_1ECD7A3A9)
      {
        objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_displayLinkDidFire_);
        v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
        displayLink = self->_displayLink;
        self->_displayLink = v5;

        -[CADisplayLink maximumRefreshRate](self->_displayLink, "maximumRefreshRate");
        if ((uint64_t)llround(1.0 / v7) >= 61)
        {
          v8 = self->_displayLink;
          -[CADisplayLink maximumRefreshRate](v8, "maximumRefreshRate");
          if (v9 != 0.0)
            -[CADisplayLink setPreferredFramesPerSecond:](v8, "setPreferredFramesPerSecond:", llround(1.0 / v9));
        }
        -[CADisplayLink addToRunLoop:forMode:](self->_displayLink, "addToRunLoop:forMode:", v4, *MEMORY[0x1E0C99860]);
      }
    }
    BKSHIDEventRegisterEventCallbackOnRunLoop();
    _UIEventProfileCollectionInit();
    kdebug_trace();
  }

  objc_autoreleasePoolPop(v3);
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "runUntilDate:", v10);

  }
}

- (void)_setupFilterChain
{
  void *v2;
  void *v3;
  _UIHIDTransformer *v4;
  uint64_t v5;
  void (**v6)(void *, void *);
  void *v7;
  _UIHIDTransformer *v8;
  void (**v9)(void *, void *);
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _UIHIDTransformer *v21;
  void (**v22)(void *, void *);
  void *v23;
  _UIHIDTransformer *v24;
  _UIHIDTransformer *v25;
  _UIHIDTransformer *v26;
  _UIHIDTransformer *v27;
  void (**v28)(void *, void *);
  void *v29;
  uint64_t v30;
  void *v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *hidContextByContextId;
  void (**v34)(_QWORD, _QWORD);
  uint64_t v35;
  void (**v36)(_QWORD, _QWORD);
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t aBlock;
  uint64_t v43;
  id (*v44)(uint64_t, void *);
  void *v45;
  _UIHIDTransformer *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
    v3 = _Block_copy(*(const void **)(a1 + 32));
    if ((*(_BYTE *)(__UILogCategoryGetNode("HIDEventFiltered", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16) & 1) != 0)
    {
      _logFilter((uint64_t)"HIDEventFiltered", CFSTR("HID Event sent to App"));
      v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v34)[2](v34, v3);
      v35 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v35;
    }
    v4 = (_UIHIDTransformer *)(id)a1;
    v5 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = ___hoverEventMemoryFilter_block_invoke;
    v45 = &unk_1E16DFA10;
    v46 = v4;
    v6 = (void (**)(void *, void *))_Block_copy(&aBlock);

    v6[2](v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v4;
    aBlock = v5;
    v43 = 3221225472;
    v44 = ___dragEventExtractionFilter_block_invoke;
    v45 = &unk_1E16DFA10;
    v46 = v8;
    v9 = (void (**)(void *, void *))_Block_copy(&aBlock);

    v9[2](v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    ___grapeFingerOneStrokeMisinterpretationWorkaround_block_invoke(v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    ___dwellEventDiscardFilterGenerator_block_invoke(v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v15 = v2;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      do
      {
        v19 = 0;
        v20 = v14;
        do
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v15);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v19) + 16))(*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v19));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          ++v19;
          v20 = v14;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v17);
    }

    v21 = v8;
    aBlock = v5;
    v43 = 3221225472;
    v44 = ___wakeOnTouchSynchronizationFilter_block_invoke;
    v45 = &unk_1E16DFA10;
    v46 = v21;
    v22 = (void (**)(void *, void *))_Block_copy(&aBlock);

    v22[2](v22, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v21;
    v25 = [_UIHIDTransformer alloc];
    v26 = -[_UIHIDTransformer initWithRunLoop:](v25, "initWithRunLoop:", v24->_hidEvents, (_QWORD)v38);
    aBlock = v5;
    v43 = 3221225472;
    v44 = ___iosMacEventExtractionFilter_block_invoke;
    v45 = &unk_1E16DFA10;
    v46 = v26;
    v27 = v26;
    v28 = (void (**)(void *, void *))_Block_copy(&aBlock);

    v28[2](v28, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    ___pencilRangeAndTouchingSeparationFilter_block_invoke(v30, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(_BYTE *)(__UILogCategoryGetNode("HIDEventIncoming", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16) & 1) != 0)
    {
      _logFilter((uint64_t)"HIDEventIncoming", CFSTR("HID Event incoming"));
      v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v36)[2](v36, v31);
      v37 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v37;
    }
    v32 = (NSMutableDictionary *)_Block_copy(v31);
    hidContextByContextId = v24->_hidContextByContextId;
    v24->_hidContextByContextId = v32;

  }
}

id __34__UIEventFetcher_setupForRunLoop___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v2 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__UIEventFetcher_setupForRunLoop___block_invoke_2;
  aBlock[3] = &unk_1E16DF8D8;
  v7 = v2;
  v3 = v2;
  v4 = _Block_copy(aBlock);

  return v4;
}

- (UIEventFetcher)init
{
  UIEventFetcher *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *latestMoveDragEventsBySessionID;
  NSMutableArray *v6;
  NSMutableArray *incomingHIDEventsFiltered;
  NSMutableArray *v8;
  NSMutableArray *eventFilters;
  NSMutableArray *v10;
  UIEventFetcher *v11;
  NSMutableArray *v12;
  void *v13;
  id addToFilteredEventsBlock;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  UIEventFetcher *v22;
  NSMutableArray *v23;
  objc_super v24;

  kdebug_trace();
  v24.receiver = self;
  v24.super_class = (Class)UIEventFetcher;
  v3 = -[UIEventFetcher init](&v24, sel_init);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    latestMoveDragEventsBySessionID = v3->_latestMoveDragEventsBySessionID;
    v3->_latestMoveDragEventsBySessionID = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    incomingHIDEventsFiltered = v3->_incomingHIDEventsFiltered;
    v3->_incomingHIDEventsFiltered = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    eventFilters = v3->_eventFilters;
    v3->_eventFilters = v8;

    v10 = v3->_incomingHIDEventsFiltered;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __22__UIEventFetcher_init__block_invoke;
    v21 = &unk_1E16DF890;
    v11 = v3;
    v22 = v11;
    v23 = v10;
    v12 = v10;
    v13 = _Block_copy(&v18);
    addToFilteredEventsBlock = v11->_addToFilteredEventsBlock;
    v11->_addToFilteredEventsBlock = v13;

    v15 = objc_alloc(MEMORY[0x1E0CB3978]);
    v16 = (void *)objc_msgSend(v15, "initWithTarget:selector:object:", v11, sel_threadMain, 0, v18, v19, v20, v21);
    objc_msgSend(v16, "setQualityOfService:", 33);
    objc_msgSend(v16, "setName:", CFSTR("com.apple.uikit.eventfetch-thread"));
    objc_msgSend(v16, "start");

  }
  kdebug_trace();
  return v3;
}

- (void)_requestFilterChainUpdate
{
  __CFRunLoop *v2;
  const void *v3;
  _QWORD block[5];

  if (a1)
  {
    v2 = *(__CFRunLoop **)(a1 + 16);
    v3 = (const void *)*MEMORY[0x1E0C9B270];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__UIEventFetcher__requestFilterChainUpdate__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = a1;
    CFRunLoopPerformBlock(v2, v3, block);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 16));
  }
}

void __43__UIEventFetcher__requestFilterChainUpdate__block_invoke(uint64_t a1)
{
  -[UIEventFetcher _setupFilterChain](*(_QWORD *)(a1 + 32));
}

- (void)resendDragMoveEventsOnTimer:(__CFRunLoopTimer *)a3 withInterval:(double)a4
{
  NSMutableDictionary *latestMoveDragEventsBySessionID;
  NSMutableDictionary *v8;
  double v9;
  double Current;
  double v11;
  NSMutableDictionary *v12;
  _QWORD v13[5];

  if (self)
    latestMoveDragEventsBySessionID = self->_latestMoveDragEventsBySessionID;
  else
    latestMoveDragEventsBySessionID = 0;
  v12 = latestMoveDragEventsBySessionID;
  if (-[NSMutableDictionary count](v12, "count"))
  {
    v8 = v12;
    os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__UIEventFetcher_resendDragMoveEventsOnTimer_withInterval___block_invoke_2;
    v13[3] = &unk_1E16DF900;
    v13[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v13);
    os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
    v9 = CFRunLoopTimerGetNextFireDate(a3) + a4;
    Current = CFAbsoluteTimeGetCurrent();
    if (v9 >= Current)
      v11 = v9;
    else
      v11 = Current + a4;
    CFRunLoopTimerSetNextFireDate(a3, v11);

  }
}

uint64_t __59__UIEventFetcher_resendDragMoveEventsOnTimer_withInterval___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

- (void)displayLinkDidFire:(id)a3
{
  double v4;
  double v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  CFTimeInterval v10;
  unint64_t v11;
  NSObject *v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  BOOL v20;
  int displayLinkIdleTicks;
  char v22;
  char v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  id v30;
  _QWORD v31[2];
  uint64_t (*v32)(uint64_t);
  void *v33;
  UIEventFetcher *v34;
  id v35;
  uint8_t *v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  int v40;
  _QWORD v41[2];
  uint64_t (*v42)(uint64_t);
  void *v43;
  UIEventFetcher *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  uint64_t (*v51)(uint64_t);
  void *v52;
  NSMutableDictionary *v53;
  UIEventFetcher *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  kdebug_trace();
  self->_countOfEventsReceivedInPreviousFrame = self->_countOfEventsReceivedSinceLastDisplayLinkCallback;
  v4 = CACurrentMediaTime();
  -[CADisplayLink timestamp](self->_displayLink, "timestamp");
  self->_estimatedDisplayLinkDrift = v4 - v5;
  v6 = self->_latestMoveDragEventsBySessionID;
  v7 = -[NSMutableDictionary count](v6, "count");
  v8 = MEMORY[0x1E0C809B0];
  v29 = v7;
  if (v7)
  {
    v9 = self->_latestMoveDragEventTimestamp >= self->_latestMoveDragEventResendTimestamp
       ? self->_latestMoveDragEventTimestamp
       : self->_latestMoveDragEventResendTimestamp;
    v10 = CACurrentMediaTime();
    if (v10 - v9 > 0.0291666667)
    {
      if (v10 - self->_latestMoveDragEventTimestamp > 30.0)
      {
        v11 = displayLinkDidFire____s_category;
        if (!displayLinkDidFire____s_category)
        {
          v11 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v11, (unint64_t *)&displayLinkDidFire____s_category);
        }
        v12 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Trying to resend a drag event but haven't received a real one in over a minute. Please file a radar against PEP UIKit Touch Events", buf, 2u);
        }
      }
      v50[0] = v8;
      v50[1] = 3221225472;
      v51 = __37__UIEventFetcher_displayLinkDidFire___block_invoke;
      v52 = &unk_1E16B1B50;
      v53 = v6;
      v54 = self;
      os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
      v51((uint64_t)v50);
      os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
      self->_latestMoveDragEventResendTimestamp = v10;

    }
  }
  if (-[NSMutableSet count](self->_contextIDsNeedingHoverEventResend, "count"))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v13 = self->_contextIDsNeedingHoverEventResend;
    v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v47 != v15)
            objc_enumerationMutation(v13);
          v17 = -[UIEventFetcher _latestHoverEventForContextID:]((uint64_t)self, objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "unsignedIntegerValue"));
          if (v17)
          {
            v41[0] = v8;
            v41[1] = 3221225472;
            v42 = __37__UIEventFetcher_displayLinkDidFire___block_invoke_3;
            v43 = &unk_1E16B1888;
            v44 = self;
            v45 = v17;
            os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
            v42((uint64_t)v41);
            os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
          }
        }
        v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v14);
    }

    -[NSMutableSet removeAllObjects](self->_contextIDsNeedingHoverEventResend, "removeAllObjects");
  }
  *(_QWORD *)buf = 0;
  v38 = buf;
  v39 = 0x2020000000;
  v40 = 0;
  v31[0] = v8;
  v31[1] = 3221225472;
  v32 = __37__UIEventFetcher_displayLinkDidFire___block_invoke_4;
  v33 = &unk_1E16BDBB0;
  v34 = self;
  v18 = v30;
  v35 = v18;
  v36 = buf;
  v19 = v31;
  os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
  v32((uint64_t)v19);

  os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
  if (self->_countOfEventsReceivedSinceLastDisplayLinkCallback)
  {
    if (self->_needsSignalOnDisplayLink)
    {
      kdebug_trace();
      if (*((int *)v38 + 6) >= 1)
        goto LABEL_28;
    }
  }
  else
  {
    kdebug_trace();
    if (*((int *)v38 + 6) >= 1)
    {
LABEL_28:
      -[UIEventFetcher signalEventsAvailableWithReason:filteredEventCount:]((uint64_t)self, 2);
      v20 = 1;
      goto LABEL_36;
    }
    displayLinkIdleTicks = self->_displayLinkIdleTicks;
    self->_displayLinkIdleTicks = displayLinkIdleTicks + 1;
    if (displayLinkIdleTicks >= -1)
    {
      v22 = objc_msgSend(v18, "isPaused");
      v23 = v29 ? 1 : v22;
      if ((v23 & 1) == 0)
      {
        objc_msgSend(v18, "setPaused:", 1);
        self->_commitTimeForTouchEvents = 0.0;
        kdebug_trace();
      }
    }
  }
  v20 = 0;
LABEL_36:
  objc_msgSend(v18, "timestamp");
  v25 = v24;
  objc_msgSend(v18, "targetTimestamp");
  v27 = v26;
  objc_msgSend(v18, "timestamp");
  if (self->_lastImportantEventTimestamp < v25 + (v27 - v28) * -0.3)
  {
    self->_didSignalOneMoveEventSinceLastDisplayLinkCallback = v20;
    self->_countOfEventsReceivedSinceLastDisplayLinkCallback = 0;
  }
  self->_needsSignalOnDisplayLink = 0;
  kdebug_trace();

  _Block_object_dispose(buf, 8);
}

uint64_t __37__UIEventFetcher_displayLinkDidFire___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__UIEventFetcher_displayLinkDidFire___block_invoke_2;
  v3[3] = &unk_1E16DF900;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __37__UIEventFetcher_displayLinkDidFire___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

- (uint64_t)_latestHoverEventForContextID:(uint64_t)result
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v2 = *(void **)(result + 240);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "objectForKey:", v3);

    return v4;
  }
  return result;
}

uint64_t __37__UIEventFetcher_displayLinkDidFire___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

uint64_t __37__UIEventFetcher_displayLinkDidFire___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    *(_QWORD *)(v3 + 184) = v2;
  objc_msgSend(*(id *)(a1 + 40), "targetTimestamp");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = v4;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)signalEventsAvailableWithReason:(uint64_t)result filteredEventCount:(uint64_t)a2
{
  uint64_t v2;
  uint64_t v3;
  CFTimeInterval v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    *(_DWORD *)(result + 72) = 0;
    if ((unint64_t)(a2 - 1) > 6)
      v3 = 0;
    else
      v3 = qword_186682D88[a2 - 1];
    *(_QWORD *)(result + 152) = v3;
    *(_QWORD *)(result + 160) = a2;
    v4 = CACurrentMediaTime();
    v5 = *(_QWORD *)(v2 + 136);
    *(CFTimeInterval *)(v2 + 120) = v4;
    *(_QWORD *)(v2 + 128) = v5;
    kdebug_trace();
    return objc_msgSend(*(id *)(v2 + 256), "eventFetcherDidReceiveEvents:", v2);
  }
  return result;
}

void __40__UIEventFetcher__logSynchronizedEvent___block_invoke()
{
  unint64_t TimeStamp;
  double v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int IntegerValue;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  TimeStamp = IOHIDEventGetTimeStamp();
  v1 = _UIMediaTimeForMachTime(TimeStamp);
  BKSHIDEventGetDigitizerAttributes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEventHIDPathAttributesForChild(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "hitTestLocationX");
    v6 = v5;
    objc_msgSend(v4, "hitTestLocationY");
  }
  else
  {
    IOHIDEventGetFloatValue();
    v6 = v8;
    IOHIDEventGetFloatValue();
  }
  v9 = v7;

  IntegerValue = IOHIDEventGetIntegerValue();
  v11 = IOHIDEventGetIntegerValue();
  v12 = _UIInternalPreference_HIDEventsDeliverImmediatly_block_invoke___s_category;
  if (!_UIInternalPreference_HIDEventsDeliverImmediatly_block_invoke___s_category)
  {
    v12 = __UILogCategoryGetNode("HIDEventSynchronization", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v12, (unint64_t *)&_UIInternalPreference_HIDEventsDeliverImmediatly_block_invoke___s_category);
  }
  if ((*(_BYTE *)v12 & 1) != 0)
  {
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67110144;
      v14[1] = v11 != 0;
      v15 = 1024;
      v16 = (IntegerValue >> 7) & 1;
      v17 = 2048;
      v18 = v6;
      v19 = 2048;
      v20 = v9;
      v21 = 2048;
      v22 = v1;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "[UIEventFetcher] Synchronized event (t: %u, c: %u). Position: [%f:%f]. Timestamp: %f", (uint8_t *)v14, 0x2Cu);
    }
  }
}

- (void)_receiveHIDEvent:(__IOHIDEvent *)a3
{
  __CFRunLoop *cfRunLoop;
  const void *v6;
  _QWORD v7[6];

  CFRetain(a3);
  cfRunLoop = self->_cfRunLoop;
  v6 = (const void *)*MEMORY[0x1E0C9B270];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__UIEventFetcher__receiveHIDEvent___block_invoke;
  v7[3] = &unk_1E16B1888;
  v7[4] = self;
  v7[5] = a3;
  CFRunLoopPerformBlock(cfRunLoop, v6, v7);
  CFRunLoopWakeUp(self->_cfRunLoop);
}

void __35__UIEventFetcher__receiveHIDEvent___block_invoke(uint64_t a1)
{
  -[UIEventFetcher _receiveHIDEventInternal:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_resendHoverEventForContextID:(uint64_t)a1
{
  __CFRunLoop *v3;
  const void *v4;
  _QWORD v5[5];
  int v6;

  if (a1)
  {
    v3 = *(__CFRunLoop **)(a1 + 16);
    v4 = (const void *)*MEMORY[0x1E0C9B270];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__UIEventFetcher__resendHoverEventForContextID___block_invoke;
    v5[3] = &unk_1E16BFE10;
    v5[4] = a1;
    v6 = a2;
    CFRunLoopPerformBlock(v3, v4, v5);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 16));
  }
}

uint64_t __48__UIEventFetcher__resendHoverEventForContextID___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = *(unsigned int *)(result + 40);
    if ((_UIUpdateCycleEnabled() & 1) == 0)
    {
      v3 = *(void **)(v1 + 232);
      if (!v3)
      {
        v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v5 = *(void **)(v1 + 232);
        *(_QWORD *)(v1 + 232) = v4;

        v3 = *(void **)(v1 + 232);
      }
      v6 = objc_msgSend(v3, "count");
      v7 = *(void **)(v1 + 232);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      if (objc_msgSend(*(id *)(v1 + 80), "isPaused") && objc_msgSend(*(id *)(v1 + 232), "count") > v6)
        objc_msgSend(*(id *)(v1 + 80), "setPaused:", 0);
    }
    result = _UIUpdateCycleEnabled();
    if ((_DWORD)result)
    {
      result = -[UIEventFetcher _latestHoverEventForContextID:](v1, v2);
      if (result)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
        (*(void (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
        os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
        return objc_msgSend(*(id *)(v1 + 256), "eventFetcherDidReceiveEvents:", v1);
      }
    }
  }
  return result;
}

- (void)drainEventsIntoEnvironment:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[6];

  v3 = a2;
  if (a1)
  {
    v6[1] = 3221225472;
    v6[2] = __45__UIEventFetcher_drainEventsIntoEnvironment___block_invoke;
    v6[3] = &unk_1E16B1B50;
    v6[4] = a1;
    v5 = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v4 = v3;
    v6[5] = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);
    __45__UIEventFetcher_drainEventsIntoEnvironment___block_invoke((uint64_t)v6);
    os_unfair_lock_unlock((os_unfair_lock_t)&__UIEventFetcherEventArrayAccessLock);

    v3 = v5;
  }

}

void __45__UIEventFetcher_drainEventsIntoEnvironment___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  unint64_t TimeStamp;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 160);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v4 = *(id *)(v2 + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (!v5)
  {
LABEL_9:

    if (v3 == 4)
      goto LABEL_26;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (!v11)
      goto LABEL_24;
    v12 = v11;
    v13 = *(_QWORD *)v33;
LABEL_12:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v13)
        objc_enumerationMutation(v10);
      v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14);
      v16 = __deviceEventDrainPolicy(v15);
      switch(v16)
      {
        case 0:
LABEL_21:
          objc_msgSend(*(id *)(a1 + 40), "_enqueueHIDEvent:", v15, (_QWORD)v32);
          objc_msgSend(v9, "addObject:", v15);
          goto LABEL_22;
        case 1:
          TimeStamp = IOHIDEventGetTimeStamp();
          v18 = _UIMediaTimeForMachTime(TimeStamp);
          v19 = *(double *)(*(_QWORD *)(a1 + 32) + 120);
          break;
        case 2:
          v17 = IOHIDEventGetTimeStamp();
          v18 = _UIMediaTimeForMachTime(v17);
          v19 = *(double *)(*(_QWORD *)(a1 + 32) + 128);
          break;
        default:
          goto LABEL_22;
      }
      if (v18 < v19)
        goto LABEL_21;
LABEL_22:
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        if (!v12)
        {
LABEL_24:

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectsInArray:", v9);
          goto LABEL_34;
        }
        goto LABEL_12;
      }
    }
  }
  v6 = v5;
  v7 = *(_QWORD *)v41;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v41 != v7)
      objc_enumerationMutation(v4);
    if ((_UIEventHIDEventWantsImmediateDelivery() & 1) != 0)
      break;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (!v6)
        goto LABEL_9;
      goto LABEL_3;
    }
  }

LABEL_26:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(a1 + 40), "_enqueueHIDEvent:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v23);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
LABEL_34:
  v26 = *(_QWORD *)(a1 + 32);
  v27 = 0;
  v28 = 0;
  if (v26)
    v28 = *(_QWORD *)(v26 + 176);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = v28;
  v29 = *(_QWORD *)(a1 + 32);
  if (v29)
    v27 = *(_QWORD *)(v29 + 184);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = v27;
  v30 = *(_QWORD *)(a1 + 32);
  if (v30)
    v31 = *(_QWORD *)(v30 + 192);
  else
    v31 = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) = v31;
}

void __30__UIEventFetcher_filterEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  BOOL v9;
  char v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int Type;
  int v19;
  void *v20;
  _BOOL4 v21;
  uint64_t IntegerValue;
  BOOL v23;
  int v24;
  BOOL v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  _BOOL4 v44;
  double v45;
  BOOL v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  NSObject *v52;
  const char *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint32_t v56;
  uint64_t v57;
  CFTimeInterval v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t i;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  int v86;
  unint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isPaused"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setPaused:", 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      *(_QWORD *)(v3 + 184) = 0;
      v4 = *(_QWORD *)(a1 + 32);
      if (v4)
      {
        *(_QWORD *)(v4 + 192) = 0;
        v5 = *(_QWORD *)(a1 + 32);
        if (v5)
          *(_BYTE *)(v5 + 168) = 0;
      }
    }
    kdebug_trace();
  }
  kdebug_trace();
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 104) || !*(_BYTE *)(a1 + 88) || !*(_BYTE *)(a1 + 89) || !v2)
    goto LABEL_8;
  kdebug_trace();
  if (!os_variant_has_internal_diagnostics())
  {
    v51 = qword_1ECD7A3B8;
    if (!qword_1ECD7A3B8)
    {
      v51 = __UILogCategoryGetNode("EventFetcher", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v51, (unint64_t *)&qword_1ECD7A3B8);
    }
    v52 = *(id *)(v51 + 8);
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    *(_WORD *)buf = 0;
    v53 = "Event filtering started with undelivered, filtered events";
    v54 = v52;
    v55 = OS_LOG_TYPE_DEFAULT;
    v56 = 2;
    goto LABEL_109;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v99 = "-[UIEventFetcher filterEvent:]_block_invoke";
      v100 = 2048;
      v101 = v2;
      _os_log_fault_impl(&dword_185066000, v52, OS_LOG_TYPE_FAULT, "%s: Event filtering started with undelivered, filtered events: %lu", buf, 0x16u);
    }
    goto LABEL_110;
  }
  v87 = qword_1ECD7A3B0;
  if (!qword_1ECD7A3B0)
  {
    v87 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v87, (unint64_t *)&qword_1ECD7A3B0);
  }
  v52 = *(id *)(v87 + 8);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v99 = "-[UIEventFetcher filterEvent:]_block_invoke";
    v100 = 2048;
    v101 = v2;
    v53 = "%s: Event filtering started with undelivered, filtered events: %lu";
    v54 = v52;
    v55 = OS_LOG_TYPE_ERROR;
    v56 = 22;
LABEL_109:
    _os_log_impl(&dword_185066000, v54, v55, v53, buf, v56);
  }
LABEL_110:

  v6 = *(_QWORD *)(a1 + 32);
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(v6 + 24) + 16))();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  v7 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if ((int)v7 < 1)
    goto LABEL_165;
  if (qword_1ECD7A3E8 != -1)
    dispatch_once(&qword_1ECD7A3E8, &__block_literal_global_125_1);
  if (_MergedGlobals_899 < v7)
    goto LABEL_22;
  if (qword_1ECD7A3D8 != -1)
    dispatch_once(&qword_1ECD7A3D8, &__block_literal_global_98_1);
  if (byte_1ECD7A3A9)
  {
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v8 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1
      || (v86 = _UIInternalPreference_HIDEventsDeliverImmediatly,
          _UIInternalPreferencesRevisionVar == _UIInternalPreference_HIDEventsDeliverImmediatly))
    {
      v9 = 0;
    }
    else
    {
      do
      {
        v9 = v8 < v86;
        if (v8 < v86)
          break;
        _UIInternalPreferenceSync(v8, &_UIInternalPreference_HIDEventsDeliverImmediatly, (uint64_t)CFSTR("HIDEventsDeliverImmediatly"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v86 = _UIInternalPreference_HIDEventsDeliverImmediatly;
      }
      while (v8 != _UIInternalPreference_HIDEventsDeliverImmediatly);
    }
    v10 = byte_1ECD76884 && v9;
  }
  else
  {
LABEL_22:
    v10 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 1;
  v11 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (qword_1ECD7A3E8 != -1)
    dispatch_once(&qword_1ECD7A3E8, &__block_literal_global_125_1);
  if (_MergedGlobals_899 < v11)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    goto LABEL_165;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
  if (!v13)
    goto LABEL_120;
  v14 = v13;
  v15 = *(_QWORD *)v93;
  while (2)
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v93 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v16);
      Type = IOHIDEventGetType();
      v19 = IOHIDEventGetType();
      switch(v19)
      {
        case 3:
          v23 = _UIEventHIDPressTypeForKeyboardHIDEvent() == -1;
LABEL_43:
          v21 = !v23;
          break;
        case 29:
          IntegerValue = IOHIDEventGetIntegerValue();
          v23 = IntegerValue == 3 || IntegerValue == 0;
          goto LABEL_43;
        case 17:
          _UIEventHIDUIScreenForHIDEvent(v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "_userInterfaceIdiom") == 3;

          break;
        default:
          v21 = 0;
          break;
      }
      if (Type == 6)
        v24 = _UIEventHIDIsScrollEvent(v17) ^ 1;
      else
        v24 = 0;
      if (((v21 | v24) & 1) != 0 || (Type <= 0x11 ? (v25 = ((1 << Type) & 0x208C0) == 0) : (v25 = 1), v25))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 5;
        goto LABEL_120;
      }
      if (_UIEventHIDEventWantsImmediateDelivery())
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 4;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 1;
        *(CFTimeInterval *)(*(_QWORD *)(a1 + 32) + 112) = CACurrentMediaTime();
        goto LABEL_120;
      }
      v26 = *(_QWORD *)(a1 + 32);
      if (v26)
        v27 = *(_BYTE *)(v26 + 168) != 0;
      else
        v27 = 0;
      v28 = *(_QWORD *)(v26 + 152);
      if ((_UIEventHIDEventWantsImmediateDelivery() & 1) != 0)
        goto LABEL_67;
      if (qword_1ECD7A400 != -1)
        dispatch_once(&qword_1ECD7A400, &__block_literal_global_153_1);
      if (byte_1ECD7A3AE && ((v28 | 2) == 2 || v27))
      {
        v29 = *(_QWORD *)(a1 + 32);
        if (v29)
          *(_BYTE *)(v29 + 168) = 1;
      }
      else
      {
LABEL_67:
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 104)
          || CACurrentMediaTime() - *(double *)(*(_QWORD *)(a1 + 32) + 120) < 0.00075)
        {
          if (_UIEventHIDGetChildStylusEvent(v17))
            goto LABEL_117;
          if (qword_1ECD7A3F0 != -1)
            dispatch_once(&qword_1ECD7A3F0, &__block_literal_global_130);
          if (!byte_1ECD7A3AC)
            goto LABEL_117;
          v30 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
          if (!v30)
            goto LABEL_117;
          objc_msgSend(v30, "timestamp");
          v32 = v31;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "targetTimestamp");
          v34 = v33;
          v35 = v33 - CACurrentMediaTime();
          if (v35 <= 0.0)
            goto LABEL_117;
          v36 = *(_QWORD *)(a1 + 32);
          v37 = *(double *)(v36 + 144);
          v38 = *(unsigned __int8 *)(a1 + 89);
          v39 = *(_QWORD *)(v36 + 152);
          v40 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          if (qword_1ECD7A3F8 != -1)
            dispatch_once(&qword_1ECD7A3F8, &__block_literal_global_132_0);
          if (byte_1ECD7A3AD)
          {
            qword_1ECD75E28 = 0x3FE6666666666666;
            qword_1ECD75E30 = 0x3FE6666666666666;
            v41 = 0.7;
          }
          else
          {
            v41 = *(double *)&qword_1ECD75E30;
          }
          v42 = CACurrentMediaTime();
          switch(v39)
          {
            case 2:
              v41 = 0.7;
              break;
            case 1:
              v41 = *(double *)&qword_1ECD75E28;
              break;
            case 0:
              v41 = *(double *)&qword_1ECD75E30;
              break;
          }
          v43 = v34 - v32;
          v44 = v38 == 0;
          *(double *)(v40 + 24) = v41;
          v45 = v34 - v42;
          if (v45 < v43 * v41)
            v44 = 1;
          v46 = v37 > 0.0;
          if (v37 / v43 <= 0.1)
            v46 = 0;
          if (v44)
            v47 = v45 < v43 * v41;
          else
            v47 = v46;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v47;
          kdebug_trace();
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          {
            if (v35 < v43 * 0.85 && v35 > v43 * 0.7)
            {
              v57 = *(_QWORD *)(a1 + 32);
              if (v57)
                *(_QWORD *)(v57 + 176) = 0;
            }
LABEL_117:
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            v58 = CACurrentMediaTime();
            v59 = 6;
            if (v58 - *(double *)(*(_QWORD *)(a1 + 32) + 120) < 0.00075)
              v59 = 7;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v59;
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 1;
            goto LABEL_120;
          }
          v48 = *(_QWORD *)(a1 + 32);
          if (v48)
          {
            *(_BYTE *)(v48 + 168) = 1;
            v49 = *(_QWORD *)(a1 + 32);
            if (v49)
              *(double *)(v49 + 176) = v43 * 0.25;
          }
        }
      }
      ++v16;
    }
    while (v14 != v16);
    v50 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
    v14 = v50;
    if (v50)
      continue;
    break;
  }
LABEL_120:

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 5)
  {
    if (qword_1ECD7A400 != -1)
      dispatch_once(&qword_1ECD7A400, &__block_literal_global_153_1);
    if (byte_1ECD7A3AE)
    {
      v60 = *(_QWORD *)(a1 + 32);
      if (v60)
        *(_BYTE *)(v60 + 168) = 1;
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (qword_1ECD7A3F0 != -1)
      dispatch_once(&qword_1ECD7A3F0, &__block_literal_global_130);
    if (byte_1ECD7A3AC)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lastObject");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = _UIEventHIDGetChildStylusEvent((uint64_t)v61);
      v63 = *(_QWORD *)(a1 + 32);
      if (v62)
        goto LABEL_132;
      if (objc_msgSend(*(id *)(v63 + 8), "count") == 1)
      {
LABEL_152:
        v74 = *(_QWORD *)(a1 + 32);
        if (v74)
          *(_BYTE *)(v74 + 168) = 1;
      }
      else
      {
        v77 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
        v63 = *(_QWORD *)(a1 + 32);
        if (v77 >= 2 && *(_QWORD *)(v63 + 152) == 2)
        {
          if (__deviceEventDrainPolicy((uint64_t)v61))
            goto LABEL_152;
          v63 = *(_QWORD *)(a1 + 32);
        }
LABEL_132:
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v64 = *(id *)(v63 + 8);
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
        if (v65)
        {
          v66 = 0;
          v67 = 0;
          v68 = *(_QWORD *)v89;
          do
          {
            for (i = 0; i != v65; ++i)
            {
              if (*(_QWORD *)v89 != v68)
                objc_enumerationMutation(v64);
              v70 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
              BKSHIDEventGetBaseAttributes();
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v72) = objc_msgSend(v71, "contextID", (_QWORD)v88);

              if (_UIEventHIDGetChildStylusEvent(v70))
              {
                if (v67)
                {
                  v72 = v72;
                  if ((objc_msgSend(v67, "containsIndex:", v72) & 1) != 0)
                  {
                    LOBYTE(v65) = 1;
                    goto LABEL_155;
                  }
                }
                else
                {
                  v67 = (void *)objc_opt_new();
                  v72 = v72;
                }
                v73 = v67;
              }
              else
              {
                if (v66)
                {
                  v72 = v72;
                  if (objc_msgSend(v66, "containsIndex:", v72))
                  {

                    goto LABEL_163;
                  }
                }
                else
                {
                  v66 = (void *)objc_opt_new();
                  v72 = v72;
                }
                v73 = v66;
              }
              objc_msgSend(v73, "addIndex:", v72);
            }
            v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
          }
          while (v65);
        }
        else
        {
          v67 = 0;
          v66 = 0;
        }
LABEL_155:

        v75 = objc_msgSend(v67, "count");
        if ((v65 & 1) == 0 && v75)
        {
LABEL_163:
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
        }
        else
        {
          v76 = *(_QWORD *)(a1 + 32);
          if (v76)
            *(_BYTE *)(v76 + 168) = 1;
        }

      }
    }
  }
LABEL_165:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (qword_1ECD7A408 != -1)
      dispatch_once(&qword_1ECD7A408, &__block_literal_global_161_2);
    if (byte_1ECD7A3AF)
    {
      v78 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v78 + 80))
      {
        objc_msgSend(*(id *)(v78 + 8), "lastObject");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v79)
        {
          if (IOHIDEventGetType() == 11)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "timestamp");
            v81 = v80;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "targetTimestamp");
            v83 = v82 - v81;
            v84 = v82 - CACurrentMediaTime();
            if (v84 < 0.0)
              v84 = -v84;
            if (v84 < v83 * 0.15)
            {
              v85 = *(_QWORD *)(a1 + 32);
              if (v85)
                *(_BYTE *)(v85 + 168) = 1;
            }
          }
        }
      }
    }
  }
}

- (void)_setHIDEventObserver:(void *)a3 onQueue:
{
  id v5;
  id v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(const void **)(a1 + 48);
    if (v7)
    {
      v8 = *(void **)(a1 + 64);
      v9 = _Block_copy(v7);
      objc_msgSend(v8, "removeObject:", v9);

    }
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke;
    v17 = &unk_1E16DF998;
    v18 = v6;
    v19 = v5;
    v10 = _Block_copy(&v14);
    v11 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v10;

    v12 = *(void **)(a1 + 64);
    v13 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v12, "addObject:", v13, v14, v15, v16, v17);

    -[UIEventFetcher _requestFilterChainUpdate](a1);
  }

}

id __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke_2;
  aBlock[3] = &unk_1E16DF970;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

void __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t Copy;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  Copy = IOHIDEventCreateCopy();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke_3;
  v8[3] = &unk_1E16B2560;
  v5 = *(NSObject **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = Copy;
  dispatch_async(v5, v8);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2, v6, v7);

}

void __47__UIEventFetcher__setHIDEventObserver_onQueue___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_removeHIDEventObserver
{
  const void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v2 = *(const void **)(a1 + 48);
    if (v2)
    {
      v3 = *(void **)(a1 + 64);
      v4 = _Block_copy(v2);
      objc_msgSend(v3, "removeObject:", v4);

      -[UIEventFetcher _requestFilterChainUpdate](a1);
      v5 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
  }
}

- (void)_setHIDGameControllerEventObserver:(void *)a3 onQueue:
{
  id v5;
  id v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(const void **)(a1 + 40);
    if (v7)
    {
      v8 = *(void **)(a1 + 64);
      v9 = _Block_copy(v7);
      objc_msgSend(v8, "removeObject:", v9);

    }
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke;
    v17 = &unk_1E16DF998;
    v18 = v6;
    v19 = v5;
    v10 = _Block_copy(&v14);
    v11 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v10;

    v12 = *(void **)(a1 + 64);
    v13 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v12, "addObject:", v13, v14, v15, v16, v17);

    -[UIEventFetcher _requestFilterChainUpdate](a1);
  }

}

id __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke_2;
  aBlock[3] = &unk_1E16DF970;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke_2(uint64_t a1, const void *a2)
{
  int Type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64x2_t v10;
  BOOL v11;
  uint64_t IntegerValue;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  char v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  const void *v25;

  Type = IOHIDEventGetType();
  if (Type > 5)
  {
    if (Type != 6 && Type != 35 && (Type != 11 || !_UIEventHIDGetDescendantPointerEvent((uint64_t)a2)))
      return (*(uint64_t (**)(_QWORD, const void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2, v5, v6);
LABEL_42:
    CFRetain(a2);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke_3;
    v23[3] = &unk_1E16B2560;
    v21 = *(NSObject **)(a1 + 32);
    v24 = *(id *)(a1 + 40);
    v25 = a2;
    dispatch_async(v21, v23);

    return (*(uint64_t (**)(_QWORD, const void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2, v5, v6);
  }
  if (Type == 1)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v13 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 65280 && v13 == 59)
      goto LABEL_42;
  }
  else if (Type == 3)
  {
    v7 = IOHIDEventGetIntegerValue();
    v8 = IOHIDEventGetIntegerValue();
    v9 = v8;
    if (v7 == 12
      && (v10 = vdupq_n_s64(v8),
          vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v10, (int64x2_t)xmmword_186682AD0), (int32x4_t)vceqq_s64(v10, (int64x2_t)xmmword_186682AE0)))) & 1 | (v8 == 178)))
    {
      v11 = 1;
    }
    else
    {
      v14 = v7 != 12 || v8 - 65 >= 5;
      v11 = !v14;
    }
    if (IOHIDEventGetType() == 3)
    {
      v15 = IOHIDEventGetIntegerValue();
      switch(v15)
      {
        case 7:
          goto LABEL_42;
        case 255:
          goto LABEL_42;
        case 12:
          v16 = IOHIDEventGetIntegerValue();
          if (v16 == 184 || v16 == 430 || v16 == 669)
            goto LABEL_42;
          break;
      }
    }
    v17 = v7 == 12 && v9 == 547;
    v18 = v17;
    v19 = v7 == 1 && v9 == 134;
    v20 = v19 || v11;
    if ((v20 & 1) != 0 || v18)
      goto LABEL_42;
  }
  return (*(uint64_t (**)(_QWORD, const void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2, v5, v6);
}

void __61__UIEventFetcher__setHIDGameControllerEventObserver_onQueue___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_removeHIDGameControllerEventObserver
{
  const void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v2 = *(const void **)(a1 + 40);
    if (v2)
    {
      v3 = *(void **)(a1 + 64);
      v4 = _Block_copy(v2);
      objc_msgSend(v3, "removeObject:", v4);

      -[UIEventFetcher _requestFilterChainUpdate](a1);
      v5 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

    }
  }
}

- (void)setSynchronizer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 248), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventFetcherSink, 0);
  objc_storeStrong((id *)&self->_synchronizer, 0);
  objc_storeStrong((id *)&self->_latestHoverEventsByContextID, 0);
  objc_storeStrong((id *)&self->_contextIDsNeedingHoverEventResend, 0);
  objc_storeStrong((id *)&self->_latestMoveDragEventsBySessionID, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_eventFilters, 0);
  objc_storeStrong(&self->_watchSystemAppFilter, 0);
  objc_storeStrong(&self->_passiveObservationFilterGenerator, 0);
  objc_storeStrong(&self->_gameControllerEventFilterGenerator, 0);
  objc_storeStrong(&self->_addToFilteredEventsBlock, 0);
  objc_storeStrong(&self->_receiveBlock, 0);
  objc_storeStrong((id *)&self->_incomingHIDEventsFiltered, 0);
}

@end
