@implementation SBAlwaysOnTelemetryEmitter

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithBacklightEnvironmentSessionProvider_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBAlwaysOnTelemetryEmitter.m"), 69, CFSTR("%s is unavailable; use %@ instead"),
    "+[SBAlwaysOnTelemetryEmitter new]",
    v5);

  return 0;
}

- (SBAlwaysOnTelemetryEmitter)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithBacklightEnvironmentSessionProvider_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlwaysOnTelemetryEmitter.m"), 73, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBAlwaysOnTelemetryEmitter init]",
    v5);

  return 0;
}

- (SBAlwaysOnTelemetryEmitter)initWithBacklightEnvironmentSessionProvider:(id)a3
{
  id v5;
  SBAlwaysOnTelemetryEmitter *v6;
  SBAlwaysOnTelemetryEmitter *v7;
  SBAlwaysOnDefaults *v8;
  SBAlwaysOnDefaults *alwaysOnDefaults;
  SBAlwaysOnDefaults *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  BSDefaultObserver *alwaysOnDefaultsObserverToken;
  void *v17;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *metricsQueue;
  uint64_t v20;
  OS_dispatch_queue *powerlogSendQueue;
  uint64_t v22;
  OS_dispatch_queue *biomeWriterQueue;
  SBAlwaysOnTelemetryMetrics *v24;
  SBAlwaysOnTelemetryMetrics *mq_metrics;
  void *v26;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBAlwaysOnTelemetryEmitter;
  v6 = -[SBAlwaysOnTelemetryEmitter init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backlightEnvironmentSessionProvider, a3);
    -[SBBacklightEnvironmentSessionProvider addObserver:](v7->_backlightEnvironmentSessionProvider, "addObserver:", v7);
    v8 = (SBAlwaysOnDefaults *)objc_alloc_init(MEMORY[0x1E0DA9D40]);
    alwaysOnDefaults = v7->_alwaysOnDefaults;
    v7->_alwaysOnDefaults = v8;

    objc_initWeak(&location, v7);
    v10 = v7->_alwaysOnDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showWallpaperInAlwaysOn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showNotificationsInAlwaysOn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C80D38];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74__SBAlwaysOnTelemetryEmitter_initWithBacklightEnvironmentSessionProvider___block_invoke;
    v28[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v29, &location);
    -[SBAlwaysOnDefaults observeDefaults:onQueue:withBlock:](v10, "observeDefaults:onQueue:withBlock:", v13, MEMORY[0x1E0C80D38], v28);
    v15 = objc_claimAutoreleasedReturnValue();
    alwaysOnDefaultsObserverToken = v7->_alwaysOnDefaultsObserverToken;
    v7->_alwaysOnDefaultsObserverToken = (BSDefaultObserver *)v15;

    objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:", v7);
    objc_storeStrong((id *)&v7->_backlight, v17);
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    metricsQueue = v7->_metricsQueue;
    v7->_metricsQueue = (OS_dispatch_queue *)SerialWithQoS;

    v20 = BSDispatchQueueCreateSerialWithQoS();
    powerlogSendQueue = v7->_powerlogSendQueue;
    v7->_powerlogSendQueue = (OS_dispatch_queue *)v20;

    v22 = BSDispatchQueueCreateSerialWithQoS();
    biomeWriterQueue = v7->_biomeWriterQueue;
    v7->_biomeWriterQueue = (OS_dispatch_queue *)v22;

    v24 = objc_alloc_init(SBAlwaysOnTelemetryMetrics);
    mq_metrics = v7->_mq_metrics;
    v7->_mq_metrics = v24;

    -[SBAlwaysOnTelemetryMetrics setBacklightState:](v7->_mq_metrics, "setBacklightState:", -[SBAlwaysOnTelemetryEmitter _resolveTelemetryBacklightState:]((uint64_t)v7, v7->_backlight));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v7, sel__significantTimeChange_, CFSTR("SBSignificantTimeChangedNotification"), 0);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __74__SBAlwaysOnTelemetryEmitter_initWithBacklightEnvironmentSessionProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBAlwaysOnTelemetryEmitter _noteAlwaysOnEnabledReasonsMayHaveChanged]((uint64_t)WeakRetained);

}

- (uint64_t)_noteAlwaysOnEnabledReasonsMayHaveChanged
{
  if (result)
    return BSDispatchMain();
  return result;
}

- (uint64_t)_resolveTelemetryBacklightState
{
  if (result)
    return -[SBAlwaysOnTelemetryEmitter _resolveTelemetryBacklightState:](result, *(void **)(result + 32));
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[BSDefaultObserver invalidate](self->_alwaysOnDefaultsObserverToken, "invalidate");
  objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend((id)SBApp, "blshService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localAssertionService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)SBAlwaysOnTelemetryEmitter;
  -[SBAlwaysOnTelemetryEmitter dealloc](&v7, sel_dealloc);
}

- (void)completeIntializationAfterBLSStartup
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D00FF0], "sharedTelemetrySource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTelemetryDelegate:", self);
  objc_msgSend((id)SBApp, "blshService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localAssertionService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObserver:", self);
}

- (void)backlightTelemetrySource:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  if (a4 != 1)
    -[SBAlwaysOnTelemetryEmitter _logTelemetryForBacklightStateUpdateFromTelemetrySource:event:]((uint64_t)self, a3, a5);
}

- (void)_logTelemetryForBacklightStateUpdateFromTelemetrySource:(void *)a3 event:
{
  uint64_t v5;
  id v6;

  if (a1)
  {
    v6 = a3;
    v5 = -[SBAlwaysOnTelemetryEmitter _resolveTelemetryBacklightState:](a1, a2);
    -[SBAlwaysOnTelemetryEmitter _logTelemetryForBacklightStateUpdate:event:](a1, v5, v6);

  }
}

- (void)backlightTelemetrySource:(id)a3 didCompleteUpdateToFlipbookState:(int64_t)a4 forEvent:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (a4 && a4 != 3)
    -[SBAlwaysOnTelemetryEmitter _logTelemetryForBacklightStateUpdateFromTelemetrySource:event:]((uint64_t)self, v9, v8);

}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  if (self)
    -[SBAlwaysOnTelemetryEmitter _emitEventsForAlwaysOnEnabled:ifPayloadChanged:]((uint64_t)self, a4);
}

- (void)_emitEventsForAlwaysOnEnabled:(uint64_t)a1
{
  if (a1)
    -[SBAlwaysOnTelemetryEmitter _emitEventsForAlwaysOnEnabled:ifPayloadChanged:](a1, a2);
}

- (void)logTelemetryForInvalidation:(id)a3
{
  id v4;
  NSObject *metricsQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  SBAlwaysOnTelemetryEmitter *v10;

  v4 = a3;
  metricsQueue = self->_metricsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SBAlwaysOnTelemetryEmitter_logTelemetryForInvalidation___block_invoke;
  block[3] = &unk_1E8E9E820;
  v6 = v4;
  v9 = v6;
  v10 = self;
  dispatch_async(metricsQueue, block);
  v7 = v6;
  AnalyticsSendEventLazy();

}

void __58__SBAlwaysOnTelemetryEmitter_logTelemetryForInvalidation___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "wasReset");
  -[SBAlwaysOnTelemetryEmitter _mq_metrics](*(id **)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "invalidatedFramesHistogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v4, "accumulateDiscardHistogram:", v3);
  else
    objc_msgSend(v4, "accumulateInvalidationHistogram:", v3);

}

- (id)_mq_metrics
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    BSDispatchQueueAssert();
    -[SBAlwaysOnTelemetryEmitter _mq_triggerDeferredLogging](v1);
    a1 = (id *)v1[6];
  }
  return a1;
}

id __58__SBAlwaysOnTelemetryEmitter_logTelemetryForInvalidation___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "invalidatedFramesHistogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlwaysOnTelemetryEmitter _analyticsPayloadForHistogram:](v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("reason"));

  objc_msgSend(*(id *)(a1 + 40), "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("source"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didClearDateSpecifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("didClearDateSpecifiers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "wasReset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("wasReset"));

  return v5;
}

- (id)_analyticsPayloadForHistogram:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[10];
  _QWORD v21[12];

  v21[10] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v20[0] = CFSTR("histogram_totalCount");
    v2 = (void *)MEMORY[0x1E0CB37E8];
    v3 = a2;
    objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "totalCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v19;
    v20[1] = CFSTR("histogram_countLessThan1Min");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "countLessThan1Min"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v4;
    v20[2] = CFSTR("histogram_count1to2Min");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "count1to2Min"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v5;
    v20[3] = CFSTR("histogram_count2to3Min");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "count2to3Min"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v6;
    v20[4] = CFSTR("histogram_count3to4Min");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "count3to4Min"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v7;
    v20[5] = CFSTR("histogram_count4to5Min");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "count4to5Min"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[5] = v8;
    v20[6] = CFSTR("histogram_count5to6Min");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "count5to6Min"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[6] = v9;
    v20[7] = CFSTR("histogram_countMoreThan6Min");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "countMoreThan6Min"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[7] = v10;
    v20[8] = CFSTR("histogram_intervalUntilFirstFrame");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "intervalUntilFirstFrame");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[8] = v12;
    v20[9] = CFSTR("histogram_presentationDuration");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "presentationDuration");
    v15 = v14;

    objc_msgSend(v13, "numberWithDouble:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[9] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (void)logTelemetryForRenderSession:(id)a3
{
  id v4;
  NSObject *metricsQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  metricsQueue = self->_metricsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SBAlwaysOnTelemetryEmitter_logTelemetryForRenderSession___block_invoke;
  block[3] = &unk_1E8E9E820;
  block[4] = self;
  v6 = v4;
  v9 = v6;
  dispatch_async(metricsQueue, block);
  v7 = v6;
  AnalyticsSendEventLazy();

}

void __59__SBAlwaysOnTelemetryEmitter_logTelemetryForRenderSession___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  -[SBAlwaysOnTelemetryEmitter _mq_metrics](*(id **)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionFramesHistogram");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accumulateRenderHistogram:", v2);

}

id __59__SBAlwaysOnTelemetryEmitter_logTelemetryForRenderSession___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionFramesHistogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlwaysOnTelemetryEmitter _analyticsPayloadForHistogram:](v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "environmentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("firstEnvironmentIdentifier"));

  objc_msgSend(*(id *)(a1 + 40), "reasonEnded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("reasonEnded"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "environmentIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("environmentCount"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "totalPreparationDuration");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("totalPreparationDuration"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "accumulatedLayoutDuration");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("accumulatedLayoutDuration"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "accumulatedRenderDuration");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("accumulatedRenderDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didFailToRender"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("didFailToRender"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "timedOutEnvironmentCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("timedOutEnvironmentCount"));

  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "totalPreparationDuration");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("totalPreparationDuration"));

  return v5;
}

- (void)logTelemetryForRequestDates:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __58__SBAlwaysOnTelemetryEmitter_logTelemetryForRequestDates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v18;
  _QWORD v19[8];
  _QWORD v20[9];

  v20[8] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("firstEnvironmentIdentifier");
  objc_msgSend(*(id *)(a1 + 32), "environmentIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v2;
  v19[1] = CFSTR("environmentCount");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "environmentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  v19[2] = CFSTR("shortestInterval");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "shortestInterval");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  v19[3] = CFSTR("averageInterval");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "averageInterval");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v9;
  v19[4] = CFSTR("longestInterval");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "longestInterval");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v11;
  v19[5] = CFSTR("completionDuration");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "completionDuration");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v13;
  v19[6] = CFSTR("didReset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "didReset"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v14;
  v19[7] = CFSTR("timedOutCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "timedOutCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)backlightEnvironmentSessionsProvider:(id)a3 didUpdatePresentation:(id)a4 withBundleIdentifiers:(id)a5
{
  id v6;
  NSObject *metricsQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  metricsQueue = self->_metricsQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __111__SBAlwaysOnTelemetryEmitter_backlightEnvironmentSessionsProvider_didUpdatePresentation_withBundleIdentifiers___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(metricsQueue, v9);

}

void __111__SBAlwaysOnTelemetryEmitter_backlightEnvironmentSessionsProvider_didUpdatePresentation_withBundleIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  -[SBAlwaysOnTelemetryEmitter _mq_metrics](*(id **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accumulatePresentationSources:", *(_QWORD *)(a1 + 40));

}

- (void)_significantTimeChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBSignificantTimeChangeWasMidnight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    -[SBAlwaysOnTelemetryEmitter _emitEventsForAlwaysOnEnabled:ifPayloadChanged:]((uint64_t)self, -[BLSBacklight isAlwaysOnEnabled](self->_backlight, "isAlwaysOnEnabled"));
}

- (void)_mq_triggerDeferredLogging
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (a1)
  {
    BSDispatchQueueAssert();
    if (!a1[7])
    {
      objc_initWeak(&location, a1);
      v2 = (void *)MEMORY[0x1E0C99E88];
      v3 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __56__SBAlwaysOnTelemetryEmitter__mq_triggerDeferredLogging__block_invoke;
      v10[3] = &unk_1E8E9FA90;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v2, "timerWithTimeInterval:repeats:block:", 0, v10, 1200.0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = a1[7];
      a1[7] = (id)v4;

      v6 = a1[7];
      block[0] = v3;
      block[1] = 3221225472;
      block[2] = __56__SBAlwaysOnTelemetryEmitter__mq_triggerDeferredLogging__block_invoke_2;
      block[3] = &unk_1E8E9DED8;
      v9 = v6;
      v7 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __56__SBAlwaysOnTelemetryEmitter__mq_triggerDeferredLogging__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBAlwaysOnTelemetryEmitter _performDeferredLogging]((uint64_t)WeakRetained);

}

- (void)_performDeferredLogging
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SBAlwaysOnTelemetryEmitter__performDeferredLogging__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __56__SBAlwaysOnTelemetryEmitter__mq_triggerDeferredLogging__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addTimer:forMode:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C99860]);

}

- (uint64_t)_resolveTelemetryBacklightState:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "backlightState");
    v6 = objc_msgSend(v4, "flipbookState");
    if (v5 == 1)
    {
      if ((unint64_t)(v6 - 1) > 4)
        a1 = 4;
      else
        a1 = qword_1D0E89788[v6 - 1];
    }
    else
    {
      v7 = v6 == 3;
      if (v5 == 3)
        v7 = 6;
      if (v5 == 2)
        a1 = 5;
      else
        a1 = v7;
    }
  }

  return a1;
}

- (void)_logTelemetryForBacklightStateUpdate:(void *)a3 event:
{
  NSObject *v5;
  id v6;
  _QWORD v7[6];

  if (a1)
  {
    v5 = *(NSObject **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__SBAlwaysOnTelemetryEmitter__logTelemetryForBacklightStateUpdate_event___block_invoke;
    v7[3] = &unk_1E8E9DE88;
    v7[4] = a1;
    v7[5] = a2;
    v6 = a3;
    dispatch_async(v5, v7);
    -[SBAlwaysOnTelemetryEmitter _emitPowerLogEventForBacklightStateTransitionWithEvent:telemetryBacklightState:](a1, v6, a2);
    -[SBAlwaysOnTelemetryEmitter _emitAnalyticsEventForBacklightStateTransitionWithEvent:](a1, v6);

  }
}

void __73__SBAlwaysOnTelemetryEmitter__logTelemetryForBacklightStateUpdate_event___block_invoke(uint64_t a1)
{
  id v2;

  -[SBAlwaysOnTelemetryEmitter _mq_metrics](*(id **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBacklightState:", *(_QWORD *)(a1 + 40));

}

- (void)_emitPowerLogEventForBacklightStateTransitionWithEvent:(uint64_t)a3 telemetryBacklightState:
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v5 = a2;
  if (a1)
  {
    v7[1] = 3221225472;
    v7[2] = __109__SBAlwaysOnTelemetryEmitter__emitPowerLogEventForBacklightStateTransitionWithEvent_telemetryBacklightState___block_invoke;
    v7[3] = &unk_1E8EA7B38;
    v9 = a3;
    v6 = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v5;
    -[SBAlwaysOnTelemetryEmitter _logPowerlogEvent:payload:](a1, CFSTR("BacklightStateChange"), (uint64_t)v7);

    v5 = v6;
  }

}

- (void)_emitAnalyticsEventForBacklightStateTransitionWithEvent:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  if (a1)
  {
    objc_msgSend(a2, "changeRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sourceEventMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    v5 = v3;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;

    if (v7)
    {
      v8 = v7;
      AnalyticsSendEventLazy();

    }
  }
}

- (void)_logPowerlogEvent:(uint64_t)a3 payload:
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    (*(void (**)(uint64_t))(a3 + 16))(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogBacklight();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Reporting to powerlog. eventName: %{public}@; payload: %{public}@",
        buf,
        0x16u);
    }

    v8 = *(NSObject **)(a1 + 64);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__SBAlwaysOnTelemetryEmitter__logPowerlogEvent_payload___block_invoke;
    v10[3] = &unk_1E8E9E820;
    v11 = v5;
    v12 = v6;
    v9 = v6;
    dispatch_async(v8, v10);

  }
}

uint64_t __56__SBAlwaysOnTelemetryEmitter__logPowerlogEvent_payload___block_invoke()
{
  uint64_t result;

  result = PLShouldLogRegisteredEvent();
  if ((_DWORD)result)
    return PLLogRegisteredEvent();
  return result;
}

- (void)_logPowerlogEvent:(void *)a3 metrics:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__SBAlwaysOnTelemetryEmitter__logPowerlogEvent_metrics___block_invoke;
    v8[3] = &unk_1E8EAB6B0;
    v9 = v5;
    v10 = v7;
    -[SBAlwaysOnTelemetryEmitter _logPowerlogEvent:payload:](a1, v10, (uint64_t)v8);

  }
}

uint64_t __56__SBAlwaysOnTelemetryEmitter__logPowerlogEvent_metrics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataForPowerlogEvent:", *(_QWORD *)(a1 + 40));
}

- (void)_logAnalyticsEvent:(void *)a3 metrics:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = v6;
    v9 = v5;
    AnalyticsSendEventLazy();

  }
}

uint64_t __57__SBAlwaysOnTelemetryEmitter__logAnalyticsEvent_metrics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataForAnalyticsEvent:", *(_QWORD *)(a1 + 40));
}

void __53__SBAlwaysOnTelemetryEmitter__performDeferredLogging__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  SBAlwaysOnTelemetryMetrics *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  SBLogBacklight();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Deferred analytics timer fired", v12, 2u);
  }

  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = objc_alloc_init(SBAlwaysOnTelemetryMetrics);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setBacklightState:", -[SBAlwaysOnTelemetryEmitter _resolveTelemetryBacklightState:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 32)));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  objc_msgSend(*(id *)(v7 + 8), "currentPresentationBundleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accumulatePresentationSources:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "invalidate");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = 0;

  -[SBAlwaysOnTelemetryEmitter _logPowerlogEvent:metrics:](*(_QWORD *)(a1 + 32), CFSTR("FlipbookStatistics"), v3);
  -[SBAlwaysOnTelemetryEmitter _logAnalyticsEvent:metrics:](*(_QWORD *)(a1 + 32), CFSTR("com.apple.springboard.alwayson.flipbookstatistics"), v3);

}

id __109__SBAlwaysOnTelemetryEmitter__emitPowerLogEventForBacklightStateTransitionWithEvent_telemetryBacklightState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("state");
  NSStringFromSBAlwaysOnTelemetryBacklightState(*(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("explanation");
  v19[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "changeRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "explanation");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8EC7EC0;
  if (v4)
    v6 = (const __CFString *)v4;
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "changeRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceEventMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = v10;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "type");
    NSStringFromBLSAlwaysOnSuppressionType();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("suppressionChangeType"));

    objc_msgSend(v14, "reason");
    NSStringFromBLSAlwaysOnSuppressionReason();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("suppressionReasons"));

  }
  return v8;
}

id __86__SBAlwaysOnTelemetryEmitter__emitAnalyticsEventForBacklightStateTransitionWithEvent___block_invoke(uint64_t a1)
{
  void *v2;
  int8x8_t v3;
  id v4;
  _QWORD *v5;
  uint8x8_t v6;
  int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  char v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int8x8_t)objc_msgSend(*(id *)(a1 + 32), "reason");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = __86__SBAlwaysOnTelemetryEmitter__emitAnalyticsEventForBacklightStateTransitionWithEvent___block_invoke_2;
  v14 = &unk_1E8E9EB40;
  v4 = v2;
  v15 = v4;
  v5 = v12;
  if (v3)
  {
    v16 = 0;
    v6 = (uint8x8_t)vcnt_s8(v3);
    v6.i16[0] = vaddlv_u8(v6);
    v7 = v6.i32[0];
    if (v6.i32[0])
    {
      v8 = 0;
      do
      {
        if (((1 << v8) & *(_QWORD *)&v3) != 0)
        {
          v13((uint64_t)v5);
          if (v16)
            break;
          --v7;
        }
        if (v8 > 0x3E)
          break;
        ++v8;
      }
      while (v7 > 0);
    }
  }

  v17[0] = CFSTR("suppressionChangeType");
  objc_msgSend(*(id *)(a1 + 32), "type");
  NSStringFromBLSAlwaysOnSuppressionType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("suppressionReasons");
  v18[0] = v9;
  v18[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __86__SBAlwaysOnTelemetryEmitter__emitAnalyticsEventForBacklightStateTransitionWithEvent___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  NSStringFromBLSAlwaysOnSuppressionReason();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

- (id)_payloadForAlwaysOnEnabled:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v24[0] = CFSTR("alwaysOnResolvedEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  v24[1] = CFSTR("alwaysOnEnabledSetting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 16), "enableAlwaysOn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v4;
  v24[2] = CFSTR("showWallpaperInAlwaysOnSetting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 16), "showWallpaperInAlwaysOn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v5;
  v24[3] = CFSTR("showNotificationsInAlwaysOnSetting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 16), "showNotificationsInAlwaysOn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  objc_msgSend(WeakRetained, "activePolicies", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "analyticsPolicyValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "analyticsPolicyName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  return v8;
}

void __71__SBAlwaysOnTelemetryEmitter__noteAlwaysOnEnabledReasonsMayHaveChanged__block_invoke(uint64_t a1)
{
  -[SBAlwaysOnTelemetryEmitter _emitEventsForAlwaysOnEnabled:ifPayloadChanged:](*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isAlwaysOnEnabled"));
}

- (void)_emitEventsForAlwaysOnEnabled:(uint64_t)a1 ifPayloadChanged:(char)a2
{
  if (a1)
  {
    BSDispatchMain();
    -[SBAlwaysOnTelemetryEmitter _emitBiomeEventsForAlwaysOnEnabled:](a1, a2);
  }
}

void __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[SBAlwaysOnTelemetryEmitter _payloadForAlwaysOnEnabled:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(a1 + 41))
    goto LABEL_5;
  v4 = *(void **)(v3 + 88);
  if (!v4)
    goto LABEL_5;
  if ((objc_msgSend(v4, "isEqualToDictionary:", v2) & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
LABEL_5:
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke_2;
    v11[3] = &unk_1E8EA2060;
    v6 = v2;
    v12 = v6;
    -[SBAlwaysOnTelemetryEmitter _logPowerlogEvent:payload:](v3, CFSTR("AlwaysOnEnableState"), (uint64_t)v11);
    v10 = v6;
    AnalyticsSendEventLazy();
    v7 = objc_msgSend(v10, "copy", v5, 3221225472, __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke_3, &unk_1E8EA2060);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 88);
    *(_QWORD *)(v8 + 88) = v7;

  }
}

id __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_emitBiomeEventsForAlwaysOnEnabled:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 72);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __65__SBAlwaysOnTelemetryEmitter__emitBiomeEventsForAlwaysOnEnabled___block_invoke;
    v3[3] = &unk_1E8E9F508;
    v3[4] = a1;
    v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __65__SBAlwaysOnTelemetryEmitter__emitBiomeEventsForAlwaysOnEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enableAlwaysOn"))
    v2 = 1;
  else
    v2 = 2;
  if (*(_BYTE *)(a1 + 40))
    v3 = 1;
  else
    v3 = 2;
  v4 = objc_alloc(MEMORY[0x1E0D01FF8]);
  obj = (id)objc_msgSend(v4, "initWithUserSetState:resolvedState:blockingPolicies:", v2, v3, MEMORY[0x1E0C9AA60]);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (!v5 || (objc_msgSend(v5, "isEqual:", obj) & 1) == 0)
  {
    BiomeLibrary();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "Device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "Display");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "AlwaysOn");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendEvent:", obj);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), obj);
  }

}

- (SBAlwaysOnPolicyCoordinator)alwaysOnPolicyCoordinator
{
  return (SBAlwaysOnPolicyCoordinator *)objc_loadWeakRetained((id *)&self->_alwaysOnPolicyCoordinator);
}

- (void)setAlwaysOnPolicyCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_alwaysOnPolicyCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alwaysOnPolicyCoordinator);
  objc_storeStrong((id *)&self->_lastAlwaysOnEnabledPayload, 0);
  objc_storeStrong((id *)&self->_lastBiomeEvent, 0);
  objc_storeStrong((id *)&self->_biomeWriterQueue, 0);
  objc_storeStrong((id *)&self->_powerlogSendQueue, 0);
  objc_storeStrong((id *)&self->_mq_deferredLoggingTimer, 0);
  objc_storeStrong((id *)&self->_mq_metrics, 0);
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_backlight, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaultsObserverToken, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaults, 0);
  objc_storeStrong((id *)&self->_backlightEnvironmentSessionProvider, 0);
}

@end
