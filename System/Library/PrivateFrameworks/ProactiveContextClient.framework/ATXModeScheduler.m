@implementation ATXModeScheduler

- (ATXModeScheduler)initWithQueue:(id)a3 operationBlock:(id)a4 andLeeway:(double)a5
{
  id v9;
  id v10;
  ATXModeScheduler *v11;
  ATXModeScheduler *v12;
  uint64_t v13;
  id block;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXModeScheduler;
  v11 = -[ATXModeScheduler init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    v13 = MEMORY[0x1D8244A3C](v10);
    block = v12->_block;
    v12->_block = (id)v13;

    v12->_leewaySeconds = a5;
  }

  return v12;
}

- (id)runAfterDelaySecondsIfNotYetScheduled:(double)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OS_dispatch_source *v12;
  OS_dispatch_source *timer;
  NSObject *v14;
  NSDate *v15;
  NSDate *scheduledDate;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id location;

  if (self->_timer)
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ATXModeScheduler runAfterDelaySecondsIfNotYetScheduled:].cold.2((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v12;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, objc_msgSend(MEMORY[0x1E0D81598], "dispatchTimeWithSecondsFromNow:", a3), 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_leewaySeconds * 1000000000.0));
    objc_initWeak(&location, self);
    v14 = self->_timer;
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __58__ATXModeScheduler_runAfterDelaySecondsIfNotYetScheduled___block_invoke;
    v29 = &unk_1E942DA58;
    objc_copyWeak(&v30, &location);
    dispatch_source_set_event_handler(v14, &v26);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3, v26, v27, v28, v29);
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    scheduledDate = self->_scheduledDate;
    self->_scheduledDate = v15;

    __atxlog_handle_modes();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ATXModeScheduler runAfterDelaySecondsIfNotYetScheduled:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return self->_scheduledDate;
}

void __58__ATXModeScheduler_runAfterDelaySecondsIfNotYetScheduled___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[3] + 16))();
    objc_msgSend(v2, "cancelPendingOperation");
    WeakRetained = v2;
  }

}

- (void)cancelPendingOperation
{
  NSObject *timer;
  OS_dispatch_source *v4;
  NSDate *scheduledDate;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

    scheduledDate = self->_scheduledDate;
    self->_scheduledDate = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)runAfterDelaySecondsIfNotYetScheduled:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D2C00000, a1, a3, "%s: schedule an operation with %.2lf seconds delay", a5, a6, a7, a8, 2u);
}

- (void)runAfterDelaySecondsIfNotYetScheduled:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D2C00000, a2, a3, "%s: an operation has already been scheduled at %@. Skip this request.", a5, a6, a7, a8, 2u);
}

@end
