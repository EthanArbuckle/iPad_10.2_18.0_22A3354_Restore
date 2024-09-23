@implementation SearchUIBiomeStreamSubscriber

- (id)notificationName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SearchUIBiomeStreamSubscriber streamIdentifier](self, "streamIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("searchui_biomeObserver_%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)queueLabel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SearchUIBiomeStreamSubscriber streamIdentifier](self, "streamIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.SearchUI.SearchUIBiomeObserver.%@.queue"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)schedulerIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SearchUIBiomeStreamSubscriber streamIdentifier](self, "streamIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.SearchUI.SearchUIBiomeObserver.%@.scheduler"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SearchUIBiomeStreamSubscriber)initWithStreamIdentifier:(id)a3
{
  id v5;
  SearchUIBiomeStreamSubscriber *v6;
  SearchUIBiomeStreamSubscriber *v7;
  NSNotificationCenter *v8;
  NSNotificationCenter *center;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  BMStreamBase *stream;
  NSObject *v20;
  SearchUIBiomeStreamSubscriber *v21;
  id v23;

  v5 = a3;
  v6 = -[SearchUIBiomeStreamSubscriber init](self, "init");
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  objc_storeStrong((id *)&v6->_streamIdentifier, a3);
  v8 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x1E0CB37D0]);
  center = v7->_center;
  v7->_center = v8;

  v7->_observerCount = 0;
  -[SearchUIBiomeStreamSubscriber queueLabel](v7, "queueLabel");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create(v11, v12);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v13;

  BiomeLibrary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIBiomeStreamSubscriber streamIdentifier](v7, "streamIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v15, "streamWithIdentifier:error:", v16, &v23);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v23;
  stream = v7->_stream;
  v7->_stream = (BMStreamBase *)v17;

  if (!v18)
  {
    -[SearchUIBiomeStreamSubscriber setupSink](v7, "setupSink");
LABEL_7:
    v21 = v7;
    goto LABEL_8;
  }
  SearchUIBiomeLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[SearchUIBiomeStreamSubscriber initWithStreamIdentifier:].cold.1((uint64_t)v18, v20);

  v21 = 0;
LABEL_8:

  return v21;
}

- (void)getLatestEventWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SearchUIBiomeStreamSubscriber queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SearchUIBiomeStreamSubscriber_getLatestEventWithCompletion___block_invoke;
  v7[3] = &unk_1EA1F7DA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__SearchUIBiomeStreamSubscriber_getLatestEventWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "latestEvent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)latestEvent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  -[SearchUIBiomeStreamSubscriber stream](self, "stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "last");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke;
  v10[3] = &unk_1EA1F7ED0;
  v10[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke_10;
  v9[3] = &unk_1EA1F7EF8;
  v9[4] = self;
  v9[5] = &v11;
  v6 = (id)objc_msgSend(v5, "sinkWithCompletion:receiveInput:", v10, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SearchUIBiomeLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke_cold_1(a1, v3);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "streamIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1DAD39000, v6, OS_LOG_TYPE_DEFAULT, "Fetching last event from BiomeStream (%@) finished without error.", (uint8_t *)&v8, 0xCu);

  }
}

void __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SearchUIBiomeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "streamIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1DAD39000, v4, OS_LOG_TYPE_DEFAULT, "Received last event from BiomeStream (%@).", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v3, "eventBody");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (BOOL)isFinished
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SearchUIBiomeStreamSubscriber biomeSink](self, "biomeSink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state") == 2;

  return v4;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  id v5;
  objc_super v6;
  _QWORD block[4];
  id v8;

  -[SearchUIBiomeStreamSubscriber biomeSink](self, "biomeSink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIBiomeStreamSubscriber queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SearchUIBiomeStreamSubscriber_dealloc__block_invoke;
  block[3] = &unk_1EA1F62F0;
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)SearchUIBiomeStreamSubscriber;
  -[SearchUIBiomeStreamSubscriber dealloc](&v6, sel_dealloc);
}

uint64_t __40__SearchUIBiomeStreamSubscriber_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)addObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[SearchUIBiomeStreamSubscriber center](self, "center");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIBiomeStreamSubscriber notificationName](self, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", v6, a4, v7, self);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIBiomeStreamSubscriber center](self, "center");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)setupSink
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = objc_alloc(MEMORY[0x1E0D025E0]);
  -[SearchUIBiomeStreamSubscriber schedulerIdentifier](self, "schedulerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIBiomeStreamSubscriber queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithIdentifier:targetQueue:waking:", v4, v5, 0);

  objc_initWeak(&location, self);
  -[SearchUIBiomeStreamSubscriber stream](self, "stream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "DSLPublisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke;
  v14[3] = &unk_1EA1F7F20;
  objc_copyWeak(&v15, &location);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke_13;
  v12[3] = &unk_1EA1F7F48;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "sinkWithCompletion:receiveInput:", v14, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIBiomeStreamSubscriber setBiomeSink:](self, "setBiomeSink:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SearchUIBiomeLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke_cold_1(WeakRetained, v3);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "streamIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1DAD39000, v7, OS_LOG_TYPE_DEFAULT, "Subscription to BiomeStream (%@) closed without error.", (uint8_t *)&v9, 0xCu);

  }
}

void __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke_13(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  SearchUIBiomeLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "streamIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1DAD39000, v5, OS_LOG_TYPE_DEFAULT, "Received event from BiomeStream (%@)", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(v3, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "updateWithEvent:", v7);
}

- (void)updateWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUIBiomeStreamSubscriber center](self, "center");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIBiomeStreamSubscriber notificationName](self, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("event");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, self, v7);
}

- (NSString)streamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)finished
{
  return self->_finished;
}

- (BMStreamBase)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (BPSSink)biomeSink
{
  return self->_biomeSink;
}

- (void)setBiomeSink:(id)a3
{
  objc_storeStrong((id *)&self->_biomeSink, a3);
}

- (NSNotificationCenter)center
{
  return self->_center;
}

- (void)setCenter:(id)a3
{
  objc_storeStrong((id *)&self->_center, a3);
}

- (unint64_t)observerCount
{
  return self->_observerCount;
}

- (void)setObserverCount:(unint64_t)a3
{
  self->_observerCount = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_biomeSink, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

- (void)initWithStreamIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Unable to subscribe to BiomeStream due to error: %@", (uint8_t *)&v2, 0xCu);
}

void __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(*(id *)(a1 + 32), "streamIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1DAD39000, v5, v6, "Fetching last event from BiomeStream (%@) failed with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

void __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke_cold_1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "streamIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1DAD39000, v5, v6, "Subscription to BiomeStream (%@) failed with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

@end
