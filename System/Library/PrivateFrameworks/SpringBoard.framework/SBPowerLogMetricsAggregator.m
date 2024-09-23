@implementation SBPowerLogMetricsAggregator

- (SBPowerLogMetricsAggregator)init
{
  SBPowerLogMetricsAggregator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *backgroundPowerLogQueue;
  uint64_t v5;
  NSCalendar *gregorian;
  uint64_t v7;
  NSMutableDictionary *eventsWithDuration;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBPowerLogMetricsAggregator;
  v2 = -[SBPowerLogMetricsAggregator init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("SBPowerLogMetricsAggregatorQueue", 0);
    backgroundPowerLogQueue = v2->_backgroundPowerLogQueue;
    v2->_backgroundPowerLogQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v5 = objc_claimAutoreleasedReturnValue();
    gregorian = v2->_gregorian;
    v2->_gregorian = (NSCalendar *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    eventsWithDuration = v2->_eventsWithDuration;
    v2->_eventsWithDuration = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void)emitEventOfType:(unint64_t)a3
{
  NSObject *backgroundPowerLogQueue;
  _QWORD block[5];

  backgroundPowerLogQueue = self->_backgroundPowerLogQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(backgroundPowerLogQueue, block);
}

void __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke(uint64_t a1)
{
  NSObject *v1;

  if (*(_QWORD *)(a1 + 32) > 1uLL)
  {
    SBLogAnalytics();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_1();
  }
  else
  {
    PLLogRegisteredEvent();
    SBLogAnalytics();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_2();
  }

}

- (void)emitEventOfType:(unint64_t)a3 withDuration:(double)a4
{
  NSObject *backgroundPowerLogQueue;
  _QWORD block[7];

  backgroundPowerLogQueue = self->_backgroundPowerLogQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SBPowerLogMetricsAggregator_emitEventOfType_withDuration___block_invoke;
  block[3] = &unk_1E8E9DF00;
  *(double *)&block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(backgroundPowerLogQueue, block);
}

void __60__SBPowerLogMetricsAggregator_emitEventOfType_withDuration___block_invoke(uint64_t a1)
{
  float v2;
  double v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;

  if (*(_QWORD *)(a1 + 48) == 2)
  {
    v2 = *(double *)(a1 + 40) * 10.0;
    v3 = roundf(v2) / 10.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", CFSTR("IconDragging"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v4, CFSTR("IconDragging"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v4, "addObject:", v5);

    objc_msgSend(*(id *)(a1 + 32), "_startTimerIfNecessary");
    SBLogAnalytics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __60__SBPowerLogMetricsAggregator_emitEventOfType_withDuration___block_invoke_cold_1();

  }
  else
  {
    SBLogAnalytics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_1();
  }

}

- (void)flushEventsDueToIminentPowerdown
{
  NSObject *backgroundPowerLogQueue;
  _QWORD block[5];

  backgroundPowerLogQueue = self->_backgroundPowerLogQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SBPowerLogMetricsAggregator_flushEventsDueToIminentPowerdown__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_sync(backgroundPowerLogQueue, block);
}

uint64_t __63__SBPowerLogMetricsAggregator_flushEventsDueToIminentPowerdown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushEvents");
}

- (void)_startTimerIfNecessary
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "Scheduling SBPowerLogMetricEvent flush to PowerLog in %f seconds.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __53__SBPowerLogMetricsAggregator__startTimerIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushEvents");
}

- (void)_flushEvents
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "Flushed SBPowerLogMetricEvent to PowerLog.", a5, a6, a7, a8, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorian, 0);
  objc_storeStrong((id *)&self->_eventsWithDuration, 0);
  objc_storeStrong((id *)&self->_backgroundPowerLogQueue, 0);
}

void __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Attempting to emit SBPowerLogMetricEvent for unknown type %lu.", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2_0();
}

void __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "Sending SBPowerLogMetricEvent type %lu to powerlog.", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2_0();
}

void __60__SBPowerLogMetricsAggregator_emitEventOfType_withDuration___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E0C80C00]);
  v3 = 134218240;
  v4 = v0;
  v5 = 2048;
  v6 = v1;
  _os_log_debug_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEBUG, "Emitting SBPowerLogMetricEvent type %lu with duration: %f.", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

@end
