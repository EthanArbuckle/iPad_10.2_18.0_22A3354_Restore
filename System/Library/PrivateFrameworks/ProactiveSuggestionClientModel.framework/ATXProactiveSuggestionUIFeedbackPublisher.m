@implementation ATXProactiveSuggestionUIFeedbackPublisher

uint64_t __86__ATXProactiveSuggestionUIFeedbackPublisher__filteredCacheUpdateClientModelPublisher___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "clientModelId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(id **)(a1 + 32);
      if (!v6[6])
      {
LABEL_6:
        objc_msgSend(v6, "clientModelsToConsider");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "containsObject:", v5);

LABEL_9:
        goto LABEL_10;
      }
      if (objc_msgSend(v6[6], "containsObject:", v5))
      {
        v6 = *(id **)(a1 + 32);
        goto LABEL_6;
      }
    }
    v8 = 0;
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)clientModelsToConsider
{
  return (id)-[ATXUniversalBlendingLayerHyperParametersProtocol clientModelsToConsiderForConsumerSubType:](self->_hyperParameters, "clientModelsToConsiderForConsumerSubType:", self->_validUICacheConsumerSubType);
}

id __92__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackSessionPublisherWithCorrelateHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v29 = objc_alloc(MEMORY[0x1E0CF94F0]);
    objc_msgSend(v5, "second");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithFirst:second:", 0, v30);

    goto LABEL_34;
  }
  objc_msgSend(v5, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v6, "timestamp");
  v41 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  objc_msgSend(v7, "sessionProcessingOptionsForSessionType:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = a1;
  objc_msgSend(v7, "sessionIdentifierForSessionType:uiCacheConsumerSubType:", 0, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v32 = objc_alloc(MEMORY[0x1E0CF94F0]);
    objc_msgSend(v5, "second");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v32, "initWithFirst:second:", 0, v33);

    goto LABEL_33;
  }
  v38 = v6;
  v39 = v5;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = v10;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (!v12)
  {
    v43 = 0;
    goto LABEL_32;
  }
  v13 = v12;
  v43 = 0;
  v14 = *(_QWORD *)v46;
  v16 = v41;
  v15 = a1;
  v40 = v7;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v46 != v14)
        objc_enumerationMutation(obj);
      v18 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "unsignedIntegerValue", v37, v38);
      switch(v18)
      {
        case 2:
          objc_msgSend(v8, "returnAndRemoveUIFeedbackSessionWithSessionIdentifier:endDate:", v11, v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v25;
          if (v25)
          {
            v26 = v25;

            v43 = v26;
          }
          goto LABEL_25;
        case 1:
          objc_msgSend(v8, "uiFeedbackSessionWithSessionIdentifier:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "blendingUICacheUpdateUUIDForUICacheConsumerSubType:", *(unsigned __int8 *)(*(_QWORD *)(v15 + 32) + 8));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v19, "blendingUICacheUpdateUUID");
            v21 = objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              v22 = (void *)v21;
              objc_msgSend(v19, "blendingUICacheUpdateUUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v20, "isEqual:", v23);

              if ((v24 & 1) != 0)
              {
                v7 = v40;
                v16 = v41;
              }
              else
              {
                objc_msgSend(v8, "returnAndRemoveUIFeedbackSessionWithSessionIdentifier:endDate:", v11, v41);
                v27 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v8, "trackNewUIFeedbackSessionWithSessionIdentifier:startDate:", v11, v41);
                objc_msgSend(v8, "uiFeedbackSessionWithSessionIdentifier:", v11);
                v28 = objc_claimAutoreleasedReturnValue();

                v43 = (void *)v27;
                v19 = (void *)v28;
                v16 = v41;
                v7 = v40;
              }
            }
            v15 = v42;
          }
          if (v19)
            objc_msgSend(v7, "updateUIFeedbackSession:uiCacheConsumerSubType:", v19, *(unsigned __int8 *)(*(_QWORD *)(v15 + 32) + 8));
          if (v20)
            objc_msgSend(*(id *)(v15 + 40), "updateMostRecentlySeenBlendingUICacheUpdateUUID:", v20);

LABEL_25:
          continue;
        case 0:
          objc_msgSend(v8, "trackNewUIFeedbackSessionWithSessionIdentifier:startDate:", v11, v16);
          break;
      }
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  }
  while (v13);
LABEL_32:

  v34 = objc_alloc(MEMORY[0x1E0CF94F0]);
  v5 = v39;
  objc_msgSend(v39, "second");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v34, "initWithFirst:second:", v43, v35);

  v10 = v37;
  v6 = v38;
LABEL_33:

LABEL_34:
  return v31;
}

uint64_t __81__ATXProactiveSuggestionUIFeedbackPublisher_mergedBlendingClientContextPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)uiFeedbackPublisher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  +[ATXUIFeedbackBiomeCorrelateHandler uiFeedbackCorrelateHandler](ATXUIFeedbackBiomeCorrelateHandler, "uiFeedbackCorrelateHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackPublisher mergedBlendingClientContextPublisher](self, "mergedBlendingClientContextPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackPublisher uiFeedbackSessionPublisherWithCorrelateHandler:](self, "uiFeedbackSessionPublisherWithCorrelateHandler:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackPublisher__block_invoke;
  v9[3] = &unk_1E57CF328;
  v9[4] = self;
  objc_msgSend(v4, "correlateWithCurrent:comparator:correlateHandler:", v5, v9, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flatMapWithTransform:", &__block_literal_global_13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)uiFeedbackSessionPublisherWithCorrelateHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BMBookmarkablePublisher *uiPublisher;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *, void *);
  void *v17;
  ATXProactiveSuggestionUIFeedbackPublisher *v18;
  id v19;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CF94F0]);
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(v5, "initWithFirst:second:", 0, v6);

  uiPublisher = self->_uiPublisher;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __92__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackSessionPublisherWithCorrelateHandler___block_invoke;
  v17 = &unk_1E57CF370;
  v18 = self;
  v19 = v4;
  v9 = v4;
  -[BMBookmarkablePublisher scanWithInitial:nextPartialResult:](uiPublisher, "scanWithInitial:nextPartialResult:", v7, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filterWithIsIncluded:", &__block_literal_global_14_1, v14, v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapWithTransform:", &__block_literal_global_16_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)mergedBlendingClientContextPublisher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ATXProactiveSuggestionUIFeedbackPublisher _filteredCacheUpdateClientModelPublisher:](self, "_filteredCacheUpdateClientModelPublisher:", self->_clientModelPublisher);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackPublisher _filteredBlendingCacheUpdatePublisher:](self, "_filteredBlendingCacheUpdatePublisher:", self->_blendingModelPublisher);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObject:", v4);
  if (self->_contextPublisher)
    objc_msgSend(v5, "addObject:");
  objc_msgSend(v3, "orderedMergeWithOthers:comparator:", v5, &__block_literal_global_7_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ATXProactiveSuggestionUIFeedbackPublisher)initWithClientModelPublisher:(id)a3 blendingModelPublisher:(id)a4 uiPublisher:(id)a5 contextPublisher:(id)a6 validUICacheConsumerSubType:(unsigned __int8)a7 validClientModelIds:(id)a8 hyperParameters:(id)a9
{
  id v15;
  id v16;
  id v17;
  ATXProactiveSuggestionUIFeedbackPublisher *v18;
  ATXProactiveSuggestionUIFeedbackPublisher *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)ATXProactiveSuggestionUIFeedbackPublisher;
  v18 = -[ATXProactiveSuggestionUIFeedbackPublisher init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientModelPublisher, a3);
    objc_storeStrong((id *)&v19->_blendingModelPublisher, a4);
    objc_storeStrong((id *)&v19->_uiPublisher, a5);
    objc_storeStrong((id *)&v19->_contextPublisher, a6);
    v19->_validUICacheConsumerSubType = a7;
    objc_storeStrong((id *)&v19->_validClientModelIds, a8);
    objc_storeStrong((id *)&v19->_hyperParameters, a9);
  }

  return v19;
}

- (id)_filteredCacheUpdateClientModelPublisher:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__ATXProactiveSuggestionUIFeedbackPublisher__filteredCacheUpdateClientModelPublisher___block_invoke;
  v4[3] = &unk_1E57CF3D8;
  v4[4] = self;
  objc_msgSend(a3, "filterWithIsIncluded:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_filteredBlendingCacheUpdatePublisher:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__ATXProactiveSuggestionUIFeedbackPublisher__filteredBlendingCacheUpdatePublisher___block_invoke;
  v4[3] = &unk_1E57CF3D8;
  v4[4] = self;
  objc_msgSend(a3, "filterWithIsIncluded:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __92__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackSessionPublisherWithCorrelateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "first");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isValidSession");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_validClientModelIds, 0);
  objc_storeStrong((id *)&self->_contextPublisher, 0);
  objc_storeStrong((id *)&self->_uiPublisher, 0);
  objc_storeStrong((id *)&self->_blendingModelPublisher, 0);
  objc_storeStrong((id *)&self->_clientModelPublisher, 0);
}

uint64_t __64__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackPublisher__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_timestampFromEvent:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_timestampFromEvent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

uint64_t __64__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackPublisher__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bpsPublisher");
}

uint64_t __92__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackSessionPublisherWithCorrelateHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "first");
}

BOOL __83__ATXProactiveSuggestionUIFeedbackPublisher__filteredBlendingCacheUpdatePublisher___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "consumerSubType") == *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);

  return v4;
}

- (id)_timestampFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "timestamp");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = v4;
      objc_msgSend(v8, "sessionEndDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      objc_msgSend(v7, "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      __atxlog_handle_blending_ecosystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXProactiveSuggestionUIFeedbackPublisher _timestampFromEvent:].cold.1((uint64_t)self, (uint64_t)v4, v10);

      v6 = &unk_1E57EC3C8;
    }
  }

  return v6;
}

- (BMBookmarkablePublisher)clientModelPublisher
{
  return self->_clientModelPublisher;
}

- (void)setClientModelPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelPublisher, a3);
}

- (BMBookmarkablePublisher)blendingModelPublisher
{
  return self->_blendingModelPublisher;
}

- (void)setBlendingModelPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_blendingModelPublisher, a3);
}

- (BMBookmarkablePublisher)uiPublisher
{
  return self->_uiPublisher;
}

- (void)setUiPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_uiPublisher, a3);
}

- (BMBookmarkablePublisher)contextPublisher
{
  return self->_contextPublisher;
}

- (void)setContextPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_contextPublisher, a3);
}

- (unsigned)validUICacheConsumerSubType
{
  return self->_validUICacheConsumerSubType;
}

- (void)setValidUICacheConsumerSubType:(unsigned __int8)a3
{
  self->_validUICacheConsumerSubType = a3;
}

- (NSSet)validClientModelIds
{
  return self->_validClientModelIds;
}

- (void)setValidClientModelIds:(id)a3
{
  objc_storeStrong((id *)&self->_validClientModelIds, a3);
}

- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters
{
  return self->_hyperParameters;
}

- (void)setHyperParameters:(id)a3
{
  objc_storeStrong((id *)&self->_hyperParameters, a3);
}

- (void)_timestampFromEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1AA841000, a3, OS_LOG_TYPE_ERROR, "%@ - _timestampFromEvent invoked with unknown object: %@", (uint8_t *)&v7, 0x16u);

}

@end
