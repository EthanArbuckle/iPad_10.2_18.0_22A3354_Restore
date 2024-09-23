@implementation SiriAnalyticsTimePeriodBuffer

- (SiriAnalyticsTimePeriodBuffer)initWithInterval:(double)a3 queue:(id)a4
{
  id v7;
  SiriAnalyticsTimePeriodBuffer *v8;
  SiriAnalyticsTimePeriodBuffer *v9;
  NSMutableSet *v10;
  NSMutableSet *bufferedMessages;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriAnalyticsTimePeriodBuffer;
  v8 = -[SiriAnalyticsTimePeriodBuffer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    v9->_bufferInterval = a3;
    v9->_leeway = 1.0;
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    bufferedMessages = v9->_bufferedMessages;
    v9->_bufferedMessages = v10;

  }
  return v9;
}

- (void)_startProducing
{
  OS_dispatch_source *v3;
  OS_dispatch_source *bufferTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_bufferTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    bufferTimer = self->_bufferTimer;
    self->_bufferTimer = v3;

    v5 = self->_bufferTimer;
    v6 = dispatch_time(0, (uint64_t)(self->_bufferInterval * 1000000000.0));
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_leeway * 1000000000.0));
    objc_initWeak(&location, self);
    v7 = self->_bufferTimer;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__SiriAnalyticsTimePeriodBuffer__startProducing__block_invoke;
    v8[3] = &unk_1E4357B38;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_bufferTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopProducing
{
  NSObject *bufferTimer;
  OS_dispatch_source *v4;

  bufferTimer = self->_bufferTimer;
  if (bufferTimer)
  {
    dispatch_source_cancel(bufferTimer);
    v4 = self->_bufferTimer;
    self->_bufferTimer = 0;

  }
}

- (void)_timerElapsed
{
  NSMutableSet *v3;
  NSMutableSet *v4;
  NSMutableSet *bufferedMessages;
  void *v6;
  void (**onMessagesProduced)(id, void *);
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SiriAnalyticsTimePeriodBuffer _stopProducing](self, "_stopProducing");
  v3 = self->_bufferedMessages;
  v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  bufferedMessages = self->_bufferedMessages;
  self->_bufferedMessages = v4;

  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v6 = (void *)SiriAnalyticsLogContextStreaming;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_DEBUG))
  {
    v9 = v6;
    v10 = 136315394;
    v11 = "-[SiriAnalyticsTimePeriodBuffer _timerElapsed]";
    v12 = 2048;
    v13 = -[NSMutableSet count](v3, "count");
    _os_log_debug_impl(&dword_1A025F000, v9, OS_LOG_TYPE_DEBUG, "%s Producing %lu messages from buffer", (uint8_t *)&v10, 0x16u);

  }
  if (-[NSMutableSet count](v3, "count"))
  {
    onMessagesProduced = (void (**)(id, void *))self->_onMessagesProduced;
    if (onMessagesProduced)
    {
      -[NSMutableSet allObjects](v3, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      onMessagesProduced[2](onMessagesProduced, v8);

    }
  }

}

- (void)enqueueMessages:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *bufferedMessages;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v5 = (void *)SiriAnalyticsLogContextStreaming;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_DEBUG))
  {
    v8 = v5;
    v9 = 136315394;
    v10 = "-[SiriAnalyticsTimePeriodBuffer enqueueMessages:]";
    v11 = 2048;
    v12 = objc_msgSend(v4, "count");
    _os_log_debug_impl(&dword_1A025F000, v8, OS_LOG_TYPE_DEBUG, "%s Enqueueing %lu messages", (uint8_t *)&v9, 0x16u);

  }
  bufferedMessages = self->_bufferedMessages;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](bufferedMessages, "unionSet:", v7);

  -[SiriAnalyticsTimePeriodBuffer _startProducing](self, "_startProducing");
}

- (void)onMessagesProduced:(id)a3
{
  void *v4;
  id onMessagesProduced;

  v4 = (void *)objc_msgSend(a3, "copy");
  onMessagesProduced = self->_onMessagesProduced;
  self->_onMessagesProduced = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onMessagesProduced, 0);
  objc_storeStrong((id *)&self->_bufferedMessages, 0);
  objc_storeStrong((id *)&self->_bufferTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__SiriAnalyticsTimePeriodBuffer__startProducing__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)MEMORY[0x1A1AF76A4]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerElapsed");

  objc_autoreleasePoolPop(v2);
}

@end
