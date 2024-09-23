@implementation ATXModeScreenShareFeaturizer

- (id)provideFeatures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
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
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Sharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D200, &unk_1E943D200, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ATXModeScreenShareFeaturizer_provideFeatures__block_invoke_5;
  v10[3] = &unk_1E942DB38;
  v10[4] = &v11;
  v7 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_2, v10);
  -[ATXModeScreenShareFeaturizer _provideFeaturesWithScreenShareEvent:](self, "_provideFeaturesWithScreenShareEvent:", v12[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __47__ATXModeScreenShareFeaturizer_provideFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__ATXModeScreenShareFeaturizer_provideFeatures__block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeScreenShareFeaturizer: done fetching last screen share event", v6, 2u);
  }

}

void __47__ATXModeScreenShareFeaturizer_provideFeatures__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "eventBody");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_provideFeaturesWithScreenShareEvent:(id)a3
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  ATXModeFeatureSet *v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "isStart");
  if ((_DWORD)v4)
    v5 = objc_msgSend(v3, "type") == 2;
  else
    v5 = 0;
  v6 = objc_alloc_init(ATXModeFeatureSet);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v6, "setValue:forBinaryFeatureOfType:", v4, 17);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v6, "setValue:forBinaryFeatureOfType:", v5, 20);
  __atxlog_handle_modes();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v4;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeScreenShareFeaturizer: updating screen share feature: isScreenSharing: %d, isAirPlayMirroring: %d", (uint8_t *)v9, 0xEu);
  }

  return v6;
}

- (void)_processNewScreenShareEvent:(id)a3
{
  ATXModeFeaturizerDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  -[ATXModeScreenShareFeaturizer _provideFeaturesWithScreenShareEvent:](self, "_provideFeaturesWithScreenShareEvent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "featurizer:didUpdateFeatures:", self, v6);
}

- (void)beginListening
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  BMBiomeScheduler *v7;
  BMBiomeScheduler *scheduler;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BPSSink *v14;
  BPSSink *sink;
  _QWORD v16[4];
  id v17;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  if (!self->_queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeScreenShare.queue", v3);
    queue = self->_queue;
    self->_queue = v4;

  }
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeScreenShareFeaturizer: registering for real time events", buf, 2u);
  }

  v7 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("FocusModes.ScreenShare"), self->_queue);
  scheduler = self->_scheduler;
  self->_scheduler = v7;

  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Sharing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "atx_DSLPublisher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subscribeOn:", self->_scheduler);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__ATXModeScreenShareFeaturizer_beginListening__block_invoke_12;
  v16[3] = &unk_1E942DC08;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v13, "sinkWithCompletion:receiveInput:", &__block_literal_global_11, v16);
  v14 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  sink = self->_sink;
  self->_sink = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __46__ATXModeScreenShareFeaturizer_beginListening__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__ATXModeScreenShareFeaturizer_beginListening__block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeScreenShareFeaturizer: done listening to screen share events", v6, 2u);
  }

}

void __46__ATXModeScreenShareFeaturizer_beginListening__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "isStart"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1D2C00000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeScreenShareFeaturizer: received new screen share event, isStart: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_processNewScreenShareEvent:", v10);

  }
}

- (void)stopListening
{
  BPSSink *sink;
  BMBiomeScheduler *scheduler;

  -[BPSSink cancel](self->_sink, "cancel");
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;

}

- (ATXModeFeaturizerDelegate)delegate
{
  return (ATXModeFeaturizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __47__ATXModeScreenShareFeaturizer_provideFeatures__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "ATXModeScreenShareFeaturizer: error fetching last screen share event: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __46__ATXModeScreenShareFeaturizer_beginListening__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "ATXModeScreenShareFeaturizer: error listening to screen share events: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
