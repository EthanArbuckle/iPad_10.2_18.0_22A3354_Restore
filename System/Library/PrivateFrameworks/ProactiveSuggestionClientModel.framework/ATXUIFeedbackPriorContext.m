@implementation ATXUIFeedbackPriorContext

uint64_t __34__ATXUIFeedbackPriorContext_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

uint64_t __34__ATXUIFeedbackPriorContext_proto__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

uint64_t __34__ATXUIFeedbackPriorContext_proto__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __73__ATXUIFeedbackPriorContext_pruneUnreferencedClientModelCachesIfPossible__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
  v11 = v3;
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "containsObject:");
  if (!v4)
  {
    if (v5)
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
LABEL_14:
      v6 = v11;
      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientModelId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "containsObject:", v8) & 1) != 0)
      {
        objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", v11);
        v9 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
        v10 = v11;
      }
      else
      {
        v9 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
        v10 = v8;
      }
      objc_msgSend(v9, "addObject:", v10);
    }

LABEL_13:
    goto LABEL_14;
  }
  v6 = v11;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", v11);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v11);
    }
    goto LABEL_13;
  }
LABEL_15:

}

- (ATXUIFeedbackPriorContext)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  ATXBlendingModelUICacheUpdate *v16;
  ATXBlendingModelUICacheUpdate *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  ATXClientModelCacheUpdate *v26;
  ATXClientModelCacheUpdate *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  ATXUIFeedbackPriorContext *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v62;
  ATXUIFeedbackPriorContext *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject cacheUpdateOrderings](v5, "cacheUpdateOrderings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v7);
      v9 = -[NSObject cacheUpdateOrderingsCount](v5, "cacheUpdateOrderingsCount");
      if (v9 == objc_msgSend(v8, "count"))
      {
        v64 = v8;
        v65 = v7;
        v10 = objc_opt_new();
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v66 = v5;
        -[NSObject blendingModelCacheUpdates](v5, "blendingModelCacheUpdates");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v72 != v14)
                objc_enumerationMutation(v11);
              v16 = -[ATXBlendingModelUICacheUpdate initWithProto:]([ATXBlendingModelUICacheUpdate alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
              v17 = v16;
              if (v16)
              {
                -[ATXBlendingModelUICacheUpdate uuid](v16, "uuid");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setObject:forKey:](v10, "setObject:forKey:", v17, v18);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
          }
          while (v13);
        }

        v5 = v66;
        v19 = -[NSObject blendingModelCacheUpdatesCount](v66, "blendingModelCacheUpdatesCount");
        if (v19 == -[NSObject count](v10, "count"))
        {
          v63 = self;
          v20 = objc_opt_new();
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          -[NSObject clientModelCacheUpdates](v66, "clientModelCacheUpdates");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v68;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v68 != v24)
                  objc_enumerationMutation(v21);
                v26 = -[ATXClientModelCacheUpdate initWithProto:]([ATXClientModelCacheUpdate alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
                v27 = v26;
                if (v26)
                {
                  -[ATXClientModelCacheUpdate uuid](v26, "uuid");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setObject:forKey:](v20, "setObject:forKey:", v27, v28);

                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
            }
            while (v23);
          }

          v5 = v66;
          v29 = -[NSObject clientModelCacheUpdatesCount](v66, "clientModelCacheUpdatesCount");
          v8 = v64;
          if (v29 == -[NSObject count](v20, "count"))
          {
            -[NSObject contextClassString](v66, "contextClassString");
            v30 = objc_claimAutoreleasedReturnValue();
            -[NSObject context](v66, "context");
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = (void *)v31;
            v33 = 0;
            if (v30 && v31)
            {
              -[ATXUIFeedbackPriorContext validContextClassNames](v63, "validContextClassNames");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "containsObject:", v30);

              if (v35)
                v33 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)&v30->isa)), "initWithProtoData:", v32);
              else
                v33 = 0;
            }
            v62 = v32;
            if (-[NSObject hasPinnedBlendingModelUICacheUpdateUUID](v66, "hasPinnedBlendingModelUICacheUpdateUUID"))
            {
              v58 = objc_alloc(MEMORY[0x1E0CB3A28]);
              -[NSObject pinnedBlendingModelUICacheUpdateUUID](v66, "pinnedBlendingModelUICacheUpdateUUID");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = (void *)objc_msgSend(v58, "initWithUUIDString:", v59);

            }
            else
            {
              v60 = 0;
            }
            v7 = v65;
            self = -[ATXUIFeedbackPriorContext initWithCacheUpdateOrdering:blendingModelCacheUpdates:clientModelCacheUpdates:context:pinnedBlendingModelUICacheUpdateUUID:](v63, "initWithCacheUpdateOrdering:blendingModelCacheUpdates:clientModelCacheUpdates:context:pinnedBlendingModelUICacheUpdateUUID:", v64, v10, v20, v33, v60);

            v36 = self;
            v5 = v66;
          }
          else
          {
            __atxlog_handle_blending_ecosystem();
            v30 = objc_claimAutoreleasedReturnValue();
            self = v63;
            v7 = v65;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              -[ATXUIFeedbackPriorContext initWithProto:].cold.1(v30, v51, v52, v53, v54, v55, v56, v57);
            v36 = 0;
          }

        }
        else
        {
          __atxlog_handle_blending_ecosystem();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            -[ATXUIFeedbackPriorContext initWithProto:].cold.2(v20, v44, v45, v46, v47, v48, v49, v50);
          v36 = 0;
          v7 = v65;
        }

      }
      else
      {
        __atxlog_handle_blending_ecosystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          -[ATXUIFeedbackPriorContext initWithProto:].cold.3(v10, v37, v38, v39, v40, v41, v42, v43);
        v36 = 0;
      }

    }
    else
    {
      __atxlog_handle_blending_ecosystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXUIFeedbackPriorContext initWithProto:].cold.4((uint64_t)self, v5);
      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)validContextClassNames
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1AF421DC4](self, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ATXPredictionContext"), CFSTR("ATXUIFeedbackTestPredictionContext"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (ATXUIFeedbackPriorContext)initWithCacheUpdateOrdering:(id)a3 blendingModelCacheUpdates:(id)a4 clientModelCacheUpdates:(id)a5 context:(id)a6 pinnedBlendingModelUICacheUpdateUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ATXUIFeedbackPriorContext *v17;
  uint64_t v18;
  NSMutableOrderedSet *cacheUpdateOrdering;
  uint64_t v20;
  NSMutableDictionary *blendingModelCacheUpdates;
  uint64_t v22;
  NSMutableDictionary *clientModelCacheUpdates;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXUIFeedbackPriorContext;
  v17 = -[ATXUIFeedbackPriorContext init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "mutableCopy");
    cacheUpdateOrdering = v17->_cacheUpdateOrdering;
    v17->_cacheUpdateOrdering = (NSMutableOrderedSet *)v18;

    v20 = objc_msgSend(v13, "mutableCopy");
    blendingModelCacheUpdates = v17->_blendingModelCacheUpdates;
    v17->_blendingModelCacheUpdates = (NSMutableDictionary *)v20;

    v22 = objc_msgSend(v14, "mutableCopy");
    clientModelCacheUpdates = v17->_clientModelCacheUpdates;
    v17->_clientModelCacheUpdates = (NSMutableDictionary *)v22;

    objc_storeStrong((id *)&v17->_context, a6);
    objc_storeStrong((id *)&v17->_pinnedBlendingModelUICacheUpdateUUID, a7);
  }

  return v17;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  NSUUID *pinnedBlendingModelUICacheUpdateUUID;
  void *v17;

  v3 = (void *)objc_opt_new();
  -[NSMutableOrderedSet array](self->_cacheUpdateOrdering, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v3, "setCacheUpdateOrderings:", v6);

  -[NSMutableDictionary allValues](self->_blendingModelCacheUpdates, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v3, "setBlendingModelCacheUpdates:", v9);

  -[NSMutableDictionary allValues](self->_clientModelCacheUpdates, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v3, "setClientModelCacheUpdates:", v12);

  -[ATXProactiveSuggestionFeedbackContextProtocol encodeAsProto](self->_context, "encodeAsProto");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContext:", v13);

  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContextClassString:", v15);

  pinnedBlendingModelUICacheUpdateUUID = self->_pinnedBlendingModelUICacheUpdateUUID;
  if (pinnedBlendingModelUICacheUpdateUUID)
  {
    -[NSUUID UUIDString](pinnedBlendingModelUICacheUpdateUUID, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPinnedBlendingModelUICacheUpdateUUID:", v17);

  }
  return v3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXUIFeedbackPriorContext proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXUIFeedbackPriorContext encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

id __43__ATXUIFeedbackPriorContext_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (ATXUIFeedbackPriorContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXUIFeedbackPriorContext *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_blending_ecosystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("protobufData"), v4, 1, CFSTR("com.apple.duetexpertd.ATXBiomeUIContext"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    self = -[ATXUIFeedbackPriorContext initWithProtoData:](self, "initWithProtoData:", v8);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ATXUIFeedbackPriorContext)initWithProtoData:(id)a3
{
  id v4;
  void *v5;
  ATXPBUIFeedbackPriorContext *v6;
  ATXUIFeedbackPriorContext *v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1AF421DC4]();
    v6 = -[ATXPBUIFeedbackPriorContext initWithData:]([ATXPBUIFeedbackPriorContext alloc], "initWithData:", v4);
    self = -[ATXUIFeedbackPriorContext initWithProto:](self, "initWithProto:", v6);

    objc_autoreleasePoolPop(v5);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (ATXUIFeedbackPriorContext)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXUIFeedbackPriorContext *v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = -[ATXUIFeedbackPriorContext initWithCacheUpdateOrdering:blendingModelCacheUpdates:clientModelCacheUpdates:context:pinnedBlendingModelUICacheUpdateUUID:](self, "initWithCacheUpdateOrdering:blendingModelCacheUpdates:clientModelCacheUpdates:context:pinnedBlendingModelUICacheUpdateUUID:", v3, v4, v5, 0, 0);

  return v6;
}

- (void)addClientModelCacheUpdate:(id)a3
{
  id v4;
  void *v5;
  NSMutableOrderedSet *cacheUpdateOrdering;
  void *v7;
  NSMutableDictionary *clientModelCacheUpdates;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    cacheUpdateOrdering = self->_cacheUpdateOrdering;
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet addObject:](cacheUpdateOrdering, "addObject:", v7);

    clientModelCacheUpdates = self->_clientModelCacheUpdates;
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](clientModelCacheUpdates, "setObject:forKey:", v4, v9);

    __atxlog_handle_feedback();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, "%@ - added client model cache update %@", (uint8_t *)&v14, 0x16u);

    }
    -[ATXUIFeedbackPriorContext pruneUnreferencedClientModelCachesIfPossible](self, "pruneUnreferencedClientModelCachesIfPossible");
  }
  else
  {
    __atxlog_handle_feedback();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXUIFeedbackPriorContext addClientModelCacheUpdate:].cold.1();

  }
}

- (void)pruneUnreferencedClientModelCachesIfPossible
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[9];
  _QWORD v9[5];
  id v10;
  _QWORD v11[3];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__4;
  v19[4] = __Block_byref_object_dispose__4;
  -[ATXUIFeedbackPriorContext _referencedClientModelCaches](self, "_referencedClientModelCaches");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = (id)objc_opt_new();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__4;
  v9[4] = __Block_byref_object_dispose__4;
  v10 = (id)objc_opt_new();
  -[NSMutableOrderedSet reversedOrderedSet](self->_cacheUpdateOrdering, "reversedOrderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__ATXUIFeedbackPriorContext_pruneUnreferencedClientModelCachesIfPossible__block_invoke;
  v8[3] = &unk_1E57CEC88;
  v8[4] = self;
  v8[5] = v11;
  v8[6] = v19;
  v8[7] = &v13;
  v8[8] = v9;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  -[NSMutableOrderedSet removeObjectsInArray:](self->_cacheUpdateOrdering, "removeObjectsInArray:", v14[5]);
  __atxlog_handle_feedback();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14[5];
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1AA841000, v4, OS_LOG_TYPE_DEFAULT, "%@ - _pruneUnreferencedClientModelCaches removed client caches with UUIDs: %@", buf, 0x16u);

  }
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v19, 8);
}

- (id)_referencedClientModelCaches
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_blendingModelCacheUpdates, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "clientModelCacheUpdateUUIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedBlendingModelUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdates, 0);
  objc_storeStrong((id *)&self->_blendingModelCacheUpdates, 0);
  objc_storeStrong((id *)&self->_cacheUpdateOrdering, 0);
}

- (void)addBlendingModelUICacheUpdate:(id)a3
{
  id v4;
  void *v5;
  NSMutableOrderedSet *cacheUpdateOrdering;
  void *v7;
  NSMutableDictionary *blendingModelCacheUpdates;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    cacheUpdateOrdering = self->_cacheUpdateOrdering;
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet addObject:](cacheUpdateOrdering, "addObject:", v7);

    blendingModelCacheUpdates = self->_blendingModelCacheUpdates;
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](blendingModelCacheUpdates, "setObject:forKey:", v4, v9);

    __atxlog_handle_feedback();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, "%@ - added blending ui cache update %@", (uint8_t *)&v14, 0x16u);

    }
    -[ATXUIFeedbackPriorContext pruneBlendingModelCachesOverMaxNum](self, "pruneBlendingModelCachesOverMaxNum");
  }
  else
  {
    __atxlog_handle_feedback();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXUIFeedbackPriorContext addBlendingModelUICacheUpdate:].cold.1();

  }
}

- (void)updatePinnedBlendingModelUICacheUpdateUUID:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pinnedBlendingModelUICacheUpdateUUID, a3);
    v5 = v6;
  }

}

- (id)blendingModelUICacheUpdateForUUID:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_blendingModelCacheUpdates, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clientModelCacheUpdatesForUICacheUpdateUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *context;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[ATXUIFeedbackPriorContext blendingModelUICacheUpdateForUUID:](self, "blendingModelUICacheUpdateForUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    if (v5)
    {
      context = (void *)MEMORY[0x1AF421DC4]();
      v20 = v5;
      objc_msgSend(v5, "clientModelCacheUpdateUUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[NSMutableDictionary allValues](self->_clientModelCacheUpdates, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v14, "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v8, "containsObject:", v15);

            if (v16)
              objc_msgSend(v6, "addObject:", v14);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v11);
      }

      objc_autoreleasePoolPop(context);
      v5 = v20;
    }
    v17 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (void)pruneContextStateOlderThanBlendingUUID:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    if ((-[NSMutableOrderedSet containsObject:](self->_cacheUpdateOrdering, "containsObject:", v4) & 1) != 0)
    {
      -[ATXUIFeedbackPriorContext _pruneBlendingModelCachesOlderThanUUID:](self, "_pruneBlendingModelCachesOlderThanUUID:", v4);
      -[ATXUIFeedbackPriorContext pruneUnreferencedClientModelCachesIfPossible](self, "pruneUnreferencedClientModelCachesIfPossible");
      -[ATXUIFeedbackPriorContext _validateCacheUpdateOrderingAndCacheDictMapping](self, "_validateCacheUpdateOrderingAndCacheDictMapping");
    }
    else
    {
      __atxlog_handle_feedback();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ATXUIFeedbackPriorContext pruneContextStateOlderThanBlendingUUID:].cold.1((uint64_t)self, (uint64_t)v4, v5);

    }
  }

}

- (void)pruneBlendingModelCachesOverMaxNum
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)-[NSMutableDictionary count](self->_blendingModelCacheUpdates, "count") < 3)
    return;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableOrderedSet reversedOrderedSet](self->_cacheUpdateOrdering, "reversedOrderedSet", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (!v4)
  {
LABEL_12:
    v11 = v3;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v16;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v16 != v7)
      objc_enumerationMutation(v3);
    v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
    -[NSMutableDictionary objectForKey:](self->_blendingModelCacheUpdates, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_10;
    if (v6)
      break;
    v6 = 1;
LABEL_10:
    if (v5 == ++v8)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v5)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  v11 = v9;

  if (!v11)
    return;
  -[ATXUIFeedbackPriorContext pruneContextStateOlderThanBlendingUUID:](self, "pruneContextStateOlderThanBlendingUUID:", v11);
  __atxlog_handle_feedback();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v14;
    v21 = 2048;
    v22 = 2;
    _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "%@ - reached more than %lu ui cache updates, pruned context state", buf, 0x16u);

  }
LABEL_17:

}

- (void)_pruneBlendingModelCachesOlderThanUUID:(id)a3
{
  id v4;
  NSMutableOrderedSet *cacheUpdateOrdering;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  ATXUIFeedbackPriorContext *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = (id)objc_opt_new();
  cacheUpdateOrdering = self->_cacheUpdateOrdering;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__ATXUIFeedbackPriorContext__pruneBlendingModelCachesOlderThanUUID___block_invoke;
  v11[3] = &unk_1E57CEC60;
  v6 = v4;
  v12 = v6;
  v13 = self;
  v14 = &v15;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](cacheUpdateOrdering, "enumerateObjectsUsingBlock:", v11);
  -[NSMutableOrderedSet removeObjectsInArray:](self->_cacheUpdateOrdering, "removeObjectsInArray:", v16[5]);
  __atxlog_handle_feedback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16[5];
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1AA841000, v7, OS_LOG_TYPE_DEFAULT, "%@ - _pruneBlendingModelCachesOlderThanUUID removed blending caches with UUIDs: %@", buf, 0x16u);

  }
  _Block_object_dispose(&v15, 8);

}

void __68__ATXUIFeedbackPriorContext__pruneBlendingModelCachesOlderThanUUID___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "isEqual:", a1[4]))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1[5] + 16), "objectForKey:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = *(void **)(a1[5] + 40);
      objc_msgSend(v6, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v8, "isEqual:", v9);

      if ((v8 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1[5] + 16), "removeObjectForKey:", v10);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v10);
      }
    }

  }
}

- (void)_validateCacheUpdateOrderingAndCacheDictMapping
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "%@ - pruned UUIDs without mappings: %@", buf, 0x16u);

}

void __76__ATXUIFeedbackPriorContext__validateCacheUpdateOrderingAndCacheDictMapping__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!(v3 | v4))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

- (BOOL)isEqual:(id)a3
{
  ATXUIFeedbackPriorContext *v4;
  ATXUIFeedbackPriorContext *v5;
  BOOL v6;

  v4 = (ATXUIFeedbackPriorContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUIFeedbackPriorContext isEqualToATXUIFeedbackPriorContext:](self, "isEqualToATXUIFeedbackPriorContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackPriorContext:(id)a3
{
  id *v4;
  NSMutableOrderedSet *cacheUpdateOrdering;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  char v9;
  NSMutableDictionary *blendingModelCacheUpdates;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  char v14;
  NSMutableDictionary *clientModelCacheUpdates;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  char v19;
  ATXProactiveSuggestionFeedbackContextProtocol *context;
  ATXProactiveSuggestionFeedbackContextProtocol *v21;
  ATXProactiveSuggestionFeedbackContextProtocol *v22;
  ATXProactiveSuggestionFeedbackContextProtocol *v23;
  char v24;
  char v25;
  NSUUID *v26;
  NSUUID *v27;

  v4 = (id *)a3;
  cacheUpdateOrdering = self->_cacheUpdateOrdering;
  v6 = (NSMutableOrderedSet *)v4[1];
  if (cacheUpdateOrdering == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = cacheUpdateOrdering;
    v9 = -[NSMutableOrderedSet isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_15;
  }
  blendingModelCacheUpdates = self->_blendingModelCacheUpdates;
  v11 = (NSMutableDictionary *)v4[2];
  if (blendingModelCacheUpdates == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = blendingModelCacheUpdates;
    v14 = -[NSMutableDictionary isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_15;
  }
  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  v16 = (NSMutableDictionary *)v4[3];
  if (clientModelCacheUpdates == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = clientModelCacheUpdates;
    v19 = -[NSMutableDictionary isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_15;
  }
  context = self->_context;
  v21 = (ATXProactiveSuggestionFeedbackContextProtocol *)v4[4];
  if (context == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = context;
    v24 = -[ATXProactiveSuggestionFeedbackContextProtocol isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
    {
LABEL_15:
      v25 = 0;
      goto LABEL_21;
    }
  }
  v26 = self->_pinnedBlendingModelUICacheUpdateUUID;
  v27 = v26;
  if (v26 == v4[5])
    v25 = 1;
  else
    v25 = -[NSUUID isEqual:](v26, "isEqual:");

LABEL_21:
  return v25;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSMutableOrderedSet hash](self->_cacheUpdateOrdering, "hash");
  v4 = -[NSMutableDictionary hash](self->_blendingModelCacheUpdates, "hash") - v3 + 32 * v3;
  v5 = -[NSMutableDictionary hash](self->_clientModelCacheUpdates, "hash") - v4 + 32 * v4;
  v6 = -[ATXProactiveSuggestionFeedbackContextProtocol hash](self->_context, "hash") - v5 + 32 * v5;
  return -[NSUUID hash](self->_pinnedBlendingModelUICacheUpdateUUID, "hash") - v6 + 32 * v6;
}

- (NSOrderedSet)cacheUpdateOrdering
{
  return &self->_cacheUpdateOrdering->super;
}

- (NSDictionary)blendingModelCacheUpdates
{
  return &self->_blendingModelCacheUpdates->super;
}

- (NSDictionary)clientModelCacheUpdates
{
  return &self->_clientModelCacheUpdates->super;
}

- (ATXProactiveSuggestionFeedbackContextProtocol)context
{
  return self->_context;
}

- (NSUUID)pinnedBlendingModelUICacheUpdateUUID
{
  return self->_pinnedBlendingModelUICacheUpdateUUID;
}

- (void)addClientModelCacheUpdate:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1AA841000, v2, v3, "%@ - cannot add client model cache update, missing UUID", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)addBlendingModelUICacheUpdate:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1AA841000, v2, v3, "%@ - cannot add blending ui cache update, missing UUID", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)pruneContextStateOlderThanBlendingUUID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 16), "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v7;
  v11 = 2112;
  v12 = a2;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_1AA841000, a3, OS_LOG_TYPE_ERROR, "%@ - attempting to prune blending ui cache updates for nonexisting uuid %@, current blending cache uuids: %@", (uint8_t *)&v9, 0x20u);

}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Could not deserialize all clientModelCacheUpdates from protobuf, returning nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Could not deserialize all blendingModelCacheUpdates from protobuf, returning nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Could not deserialize all cacheUpdateOrderings from protobuf, returning nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

@end
