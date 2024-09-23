@implementation ATXModeDrivingFeaturizer

- (id)provideFeatures
{
  return -[ATXModeDrivingFeaturizer _provideFeaturesWithLastDNDWDEvent:](self, "_provideFeaturesWithLastDNDWDEvent:", 0);
}

- (id)_provideFeaturesWithLastDNDWDEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  ATXModeFeatureSet *v10;
  uint8_t v12[16];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[ATXModeDrivingFeaturizer _fetchMostRecentDNDWDEvent](self, "_fetchMostRecentDNDWDEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "starting");

    if ((v9 & 1) != 0)
      goto LABEL_3;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "starting"))
    goto LABEL_7;
LABEL_3:
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeDrivingFeaturizer: Driving mode activated by Do Not Disturb While Driving", v12, 2u);
  }

  v7 = 1;
LABEL_8:
  v10 = objc_alloc_init(ATXModeFeatureSet);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v10, "setValue:forBinaryFeatureOfType:", v7, 4);

  return v10;
}

- (void)_processNewDNDWDEvent:(id)a3
{
  ATXModeFeaturizerDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  -[ATXModeDrivingFeaturizer _provideFeaturesWithLastDNDWDEvent:](self, "_provideFeaturesWithLastDNDWDEvent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "featurizer:didUpdateFeatures:", self, v6);
}

- (id)_fetchMostRecentDNDWDEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  v15 = 0;
  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UserFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DoNotDisturbWhileDriving");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D3C8, &unk_1E943D3C8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke_5;
  v9[3] = &unk_1E942DB38;
  v9[4] = &v10;
  v6 = (id)objc_msgSend(v5, "sinkWithCompletion:receiveInput:", &__block_literal_global_16, v9);
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke(uint64_t a1, void *a2)
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
      __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeDrivingFeaturizer: done fetching last DNDWD launch event", v6, 2u);
  }

}

void __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke_5(uint64_t a1, void *a2)
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

- (void)_beginListeningForDNDWDEvents
{
  BMBiomeScheduler *v3;
  BMBiomeScheduler *DNDWDScheduler;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BPSSink *v10;
  BPSSink *DNDWDSink;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("FocusModes.DNDWD"), self->_queue);
  DNDWDScheduler = self->_DNDWDScheduler;
  self->_DNDWDScheduler = v3;

  objc_initWeak(&location, self);
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UserFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DoNotDisturbWhileDriving");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "atx_DSLPublisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", self->_DNDWDScheduler);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke_11;
  v12[3] = &unk_1E942DC08;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_10, v12);
  v10 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  DNDWDSink = self->_DNDWDSink;
  self->_DNDWDSink = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke(uint64_t a1, void *a2)
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
      __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeDrivingFeaturizer: done listening to DNDWD events", v6, 2u);
  }

}

void __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeDrivingFeaturizer: received new DNDWD event", v8, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_processNewDNDWDEvent:", v7);

  }
}

- (void)beginListening
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;

  if (!self->_queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeDriving.queue", v3);
    queue = self->_queue;
    self->_queue = v4;

  }
  -[ATXModeDrivingFeaturizer _beginListeningForDNDWDEvents](self, "_beginListeningForDNDWDEvents");
}

- (void)stopListening
{
  BPSSink *DNDWDSink;
  BMBiomeScheduler *DNDWDScheduler;

  -[BPSSink cancel](self->_DNDWDSink, "cancel");
  DNDWDSink = self->_DNDWDSink;
  self->_DNDWDSink = 0;

  DNDWDScheduler = self->_DNDWDScheduler;
  self->_DNDWDScheduler = 0;

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
  objc_storeStrong((id *)&self->_DNDWDScheduler, 0);
  objc_storeStrong((id *)&self->_DNDWDSink, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "ATXModeDrivingFeaturizer: error fetching last DNDWD event: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "ATXModeDrivingFeaturizer: error listening to DNDWD events: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
