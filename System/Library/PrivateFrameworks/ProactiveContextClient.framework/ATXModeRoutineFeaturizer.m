@implementation ATXModeRoutineFeaturizer

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
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Semantic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D368, &unk_1E943D368, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke_5;
  v10[3] = &unk_1E942DB38;
  v10[4] = &v11;
  v7 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_11, v10);
  -[ATXModeRoutineFeaturizer _provideFeaturesWithLocationEvent:](self, "_provideFeaturesWithLocationEvent:", v12[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke(uint64_t a1, void *a2)
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
      __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: done fetching last location event", v6, 2u);
  }

}

void __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke_5(uint64_t a1, void *a2)
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

- (id)_provideFeaturesWithLocationEvent:(id)a3
{
  id v3;
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  ATXModeFeatureSet *v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "starting"))
    v4 = objc_msgSend(v3, "userSpecificPlaceType") == 1;
  else
    v4 = 0;
  if (objc_msgSend(v3, "starting"))
    v5 = objc_msgSend(v3, "userSpecificPlaceType") == 2;
  else
    v5 = 0;
  if (objc_msgSend(v3, "starting"))
    v6 = objc_msgSend(v3, "userSpecificPlaceType") == 4;
  else
    v6 = 0;
  if (objc_msgSend(v3, "starting"))
    v7 = objc_msgSend(v3, "userSpecificPlaceType") == 3;
  else
    v7 = 0;
  v8 = objc_alloc_init(ATXModeFeatureSet);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v8, "setValue:forBinaryFeatureOfType:", v4, 1);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v8, "setValue:forBinaryFeatureOfType:", v5, 2);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v8, "setValue:forBinaryFeatureOfType:", v6, 22);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v8, "setValue:forBinaryFeatureOfType:", v7, 23);
  __atxlog_handle_modes();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109888;
    v11[1] = v4;
    v12 = 1024;
    v13 = v5;
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    _os_log_impl(&dword_1D2C00000, v9, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: updating features. isAtHome: %d isAtWork: %d isAtGym: %d isAtSchool: %d", (uint8_t *)v11, 0x1Au);
  }

  return v8;
}

- (void)_processNewLocationEvent:(id)a3
{
  ATXModeFeaturizerDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  -[ATXModeRoutineFeaturizer _provideFeaturesWithLocationEvent:](self, "_provideFeaturesWithLocationEvent:", v5);
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
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeSemanticLocation.queue", v3);
    queue = self->_queue;
    self->_queue = v4;

  }
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: registering for real time events", buf, 2u);
  }

  v7 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("FocusModes.Routine"), self->_queue);
  scheduler = self->_scheduler;
  self->_scheduler = v7;

  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Semantic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "atx_DSLPublisher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subscribeOn:", self->_scheduler);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__ATXModeRoutineFeaturizer_beginListening__block_invoke_12;
  v16[3] = &unk_1E942DC08;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v13, "sinkWithCompletion:receiveInput:", &__block_literal_global_11_2, v16);
  v14 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  sink = self->_sink;
  self->_sink = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __42__ATXModeRoutineFeaturizer_beginListening__block_invoke(uint64_t a1, void *a2)
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
      __42__ATXModeRoutineFeaturizer_beginListening__block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: done listening to location events", v6, 2u);
  }

}

void __42__ATXModeRoutineFeaturizer_beginListening__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134283777;
    v7 = (int)objc_msgSend(v3, "userSpecificPlaceType");
    v8 = 1024;
    v9 = objc_msgSend(v3, "starting");
    _os_log_impl(&dword_1D2C00000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: received new location event for semantic location: %{private}lu, is starting: %d", (uint8_t *)&v6, 0x12u);
  }

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_processNewLocationEvent:", v3);

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

void __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "ATXModeRoutineFeaturizer: error fetching last location event: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __42__ATXModeRoutineFeaturizer_beginListening__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "ATXModeRoutineFeaturizer: error listening to location events: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
