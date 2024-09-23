@implementation BRCStateUpdateCoalescer

- (BRCStateUpdateCoalescer)initWithCallbackQueue:(id)a3 timerMinDelay:(double)a4 timerMaxDelay:(double)a5 stableStateMinThreshold:(double)a6
{
  id v11;
  BRCStateUpdateCoalescer *v12;
  BRCStateUpdateCoalescer *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCStateUpdateCoalescer;
  v12 = -[BRCStateUpdateCoalescer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_callbackQueue, a3);
    v13->_timerDelay = a4;
    v13->_timerMinDelay = a4;
    v13->_timerMaxDelay = a5;
    v13->_stableStateMinThreshold = a6;
  }

  return v13;
}

- (void)reset
{
  NSDate *lastCompletedTimer;

  -[BRCStateUpdateCoalescer _cancelAndReleaseUpdateTimerIfExists](self, "_cancelAndReleaseUpdateTimerIfExists");
  self->_timerDelay = self->_timerMinDelay;
  lastCompletedTimer = self->_lastCompletedTimer;
  self->_lastCompletedTimer = 0;

}

- (BOOL)_cancelAndReleaseUpdateTimerIfExists
{
  OS_dispatch_source *coalesceUpdateTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  coalesceUpdateTimer = self->_coalesceUpdateTimer;
  if (coalesceUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_coalesceUpdateTimer);
    v4 = self->_coalesceUpdateTimer;
    self->_coalesceUpdateTimer = 0;

  }
  return coalesceUpdateTimer != 0;
}

- (void)_setupCoalesceUpdateTimerWithUtilityHandlerBlock:(id)a3
{
  id v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *coalesceUpdateTimer;
  int64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  id v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  dispatch_block_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  OS_dispatch_source *v28;
  id v29;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  -[BRCStateUpdateCoalescer _cancelAndReleaseUpdateTimerIfExists](self, "_cancelAndReleaseUpdateTimerIfExists");
  if (self->_coalesceUpdateTimer)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCStateUpdateCoalescer _setupCoalesceUpdateTimerWithUtilityHandlerBlock:].cold.1((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);

  }
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_callbackQueue);
  coalesceUpdateTimer = self->_coalesceUpdateTimer;
  self->_coalesceUpdateTimer = v5;

  v7 = (unint64_t)(self->_timerDelay * 1000000000.0);
  v8 = self->_coalesceUpdateTimer;
  v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, v7 / 10);
  v10 = self->_coalesceUpdateTimer;
  v11 = self->_coalesceUpdateTimer;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __76__BRCStateUpdateCoalescer__setupCoalesceUpdateTimerWithUtilityHandlerBlock___block_invoke;
  v27[3] = &unk_24FE40A80;
  v27[4] = self;
  v12 = v10;
  v28 = v12;
  v13 = v4;
  v29 = v13;
  v14 = v11;
  v15 = v27;
  v16 = v15;
  v17 = v15;
  if (*MEMORY[0x24BE17840])
  {
    ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v17);
  dispatch_source_set_event_handler(v14, v18);

  dispatch_resume((dispatch_object_t)self->_coalesceUpdateTimer);
}

intptr_t __76__BRCStateUpdateCoalescer__setupCoalesceUpdateTimerWithUtilityHandlerBlock___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  intptr_t result;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 8));
  v2 = a1[5];
  result = dispatch_source_testcancel(v2);
  if (!result)
  {
    if (v2 != *(NSObject **)(a1[4] + 16))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        __76__BRCStateUpdateCoalescer__setupCoalesceUpdateTimerWithUtilityHandlerBlock___block_invoke_cold_1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

    dispatch_source_cancel(*(dispatch_source_t *)(a1[4] + 16));
    v7 = a1[4];
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = 0;

    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  return result;
}

- (void)updateStateWithCoalescing:(id)a3 oldState:(BOOL)a4 newState:(BOOL)a5
{
  _BOOL4 v6;
  void (**v8)(_QWORD);
  _BOOL4 v9;
  void *v10;
  double v11;
  double v12;
  double stableStateMinThreshold;
  double timerMaxDelay;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a4;
  v8 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (a5)
  {
    if (v6)
    {
      if (self->_coalesceUpdateTimer)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[BRCStateUpdateCoalescer updateStateWithCoalescing:oldState:newState:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

      }
      v8[2](v8);
    }
    else
    {
      -[BRCStateUpdateCoalescer _setupCoalesceUpdateTimerWithUtilityHandlerBlock:](self, "_setupCoalesceUpdateTimerWithUtilityHandlerBlock:", v8);
    }
    goto LABEL_14;
  }
  v9 = -[BRCStateUpdateCoalescer _cancelAndReleaseUpdateTimerIfExists](self, "_cancelAndReleaseUpdateTimerIfExists");
  v8[2](v8);
  if (!v6)
    goto LABEL_9;
  if (!self->_lastCompletedTimer
    || (objc_msgSend(MEMORY[0x24BDBCE60], "now"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "timeIntervalSinceDate:", self->_lastCompletedTimer),
        v12 = v11,
        stableStateMinThreshold = self->_stableStateMinThreshold,
        v10,
        v12 >= stableStateMinThreshold))
  {
    self->_timerDelay = self->_timerMinDelay;
LABEL_9:
    if (!v9)
      goto LABEL_14;
  }
  timerMaxDelay = self->_timerDelay + self->_timerDelay;
  if (timerMaxDelay >= self->_timerMaxDelay)
    timerMaxDelay = self->_timerMaxDelay;
  self->_timerDelay = timerMaxDelay;
LABEL_14:

}

- (double)timerDelay
{
  return self->_timerDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCompletedTimer, 0);
  objc_storeStrong((id *)&self->_coalesceUpdateTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)_setupCoalesceUpdateTimerWithUtilityHandlerBlock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: !_coalesceUpdateTimer%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __76__BRCStateUpdateCoalescer__setupCoalesceUpdateTimerWithUtilityHandlerBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: coalesceUpdateTimer == self->_coalesceUpdateTimer Expecting same address%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)updateStateWithCoalescing:(uint64_t)a3 oldState:(uint64_t)a4 newState:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: !_coalesceUpdateTimer _coalesceUpdateTimer should exist only when moving from NO -> YES%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

@end
