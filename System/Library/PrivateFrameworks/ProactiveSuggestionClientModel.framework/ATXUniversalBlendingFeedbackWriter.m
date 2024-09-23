@implementation ATXUniversalBlendingFeedbackWriter

void __103__ATXUniversalBlendingFeedbackWriter_sendEventToBiomeIfNeededForClientModelCacheUpdate_previousUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  ATXLightweightClientModelCacheUpdate *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "suggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {

LABEL_4:
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "clientModelId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1AA841000, v5, OS_LOG_TYPE_DEFAULT, "Adding event to client model Biome stream for: %{public}@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendEvent:", *(_QWORD *)(a1 + 40));

    v8 = -[ATXLightweightClientModelCacheUpdate initWithClientModelCacheUpdate:]([ATXLightweightClientModelCacheUpdate alloc], "initWithClientModelCacheUpdate:", *(_QWORD *)(a1 + 40));
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[ATXLightweightClientModelCacheUpdate clientModelId](v8, "clientModelId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1AA841000, v9, OS_LOG_TYPE_DEFAULT, "Adding event to lightweight client model Biome stream for: %{public}@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:", v8);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "suggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    goto LABEL_4;
  __atxlog_handle_blending();
  v8 = (ATXLightweightClientModelCacheUpdate *)objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT))
    goto LABEL_10;
  objc_msgSend(*(id *)(a1 + 40), "clientModelId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138543362;
  v13 = v11;
  _os_log_impl(&dword_1AA841000, &v8->super, OS_LOG_TYPE_DEFAULT, "Not adding event for client model to Biome stream (%{public}@) because our previous suggestion was empty and so is our new one.", (uint8_t *)&v12, 0xCu);
LABEL_9:

LABEL_10:
}

- (void)sendEventToBiomeIfNeededForClientModelCacheUpdate:(id)a3 previousUpdate:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  ATXUniversalBlendingFeedbackWriter *v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__ATXUniversalBlendingFeedbackWriter_sendEventToBiomeIfNeededForClientModelCacheUpdate_previousUpdate___block_invoke;
  block[3] = &unk_1E57CEAF0;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(internalQueue, block);

}

- (ATXUniversalBlendingFeedbackWriter)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXUniversalBlendingFeedbackWriter *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXUniversalBlendingFeedbackWriter initWithClientModelStream:lightWeightClientModelStream:blendingModelStream:uiStream:](self, "initWithClientModelStream:lightWeightClientModelStream:blendingModelStream:uiStream:", v3, v4, v5, v6);

  return v7;
}

- (ATXUniversalBlendingFeedbackWriter)initWithClientModelStream:(id)a3 lightWeightClientModelStream:(id)a4 blendingModelStream:(id)a5 uiStream:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXUniversalBlendingFeedbackWriter *v15;
  ATXUniversalBlendingFeedbackWriter *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *internalQueue;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ATXUniversalBlendingFeedbackWriter;
  v15 = -[ATXUniversalBlendingFeedbackWriter init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientModelStream, a3);
    objc_storeStrong((id *)&v16->_lightWeightClientModelStream, a4);
    objc_storeStrong((id *)&v16->_blendingModelStream, a5);
    objc_storeStrong((id *)&v16->_uiStream, a6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("ATXUniversalBlendingFeedbackWriter.internalQueue", v17);
    internalQueue = v16->_internalQueue;
    v16->_internalQueue = (OS_dispatch_queue *)v18;

  }
  return v16;
}

- (void)donateBlendingModelUICacheUpdate:(id)a3 uiConsumer:(unsigned __int8)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__ATXUniversalBlendingFeedbackWriter_donateBlendingModelUICacheUpdate_uiConsumer___block_invoke;
  block[3] = &unk_1E57CF850;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(internalQueue, block);

}

uint64_t __82__ATXUniversalBlendingFeedbackWriter_donateBlendingModelUICacheUpdate_uiConsumer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "donateBlendingModelUICacheUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)donateUIInteractionEvent:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;
  ATXUniversalBlendingFeedbackWriter *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ATXUniversalBlendingFeedbackWriter_donateUIInteractionEvent___block_invoke;
  block[3] = &unk_1E57CF850;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __63__ATXUniversalBlendingFeedbackWriter_donateUIInteractionEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_blending();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(*(id *)(a1 + 32), "consumerSubTypeForUIStream"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1AA841000, v2, OS_LOG_TYPE_DEFAULT, "Feedback Writer: Recording UI interaction event for consumerSubType %@. Event: %@", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "donateGenericUIEvent:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_uiStream, 0);
  objc_storeStrong((id *)&self->_blendingModelStream, 0);
  objc_storeStrong((id *)&self->_lightWeightClientModelStream, 0);
  objc_storeStrong((id *)&self->_clientModelStream, 0);
}

@end
