@implementation ATXBlendingModelUICacheUpdate

uint64_t __81__ATXBlendingModelUICacheUpdate_setClientModelCacheUpdateUUIDsDictionaryOnProto___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v6 = a3;
  if (a4)
  {
    v7 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1AF421DC4]();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, v6, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    objc_autoreleasePoolPop(v8);
    v7 = 0;
    if (!v10)
      v7 = v9;

  }
  return v7;
}

- (ATXBlendingModelUICacheUpdate)initWithProtoData:(id)a3
{
  id v4;
  ATXPBBlendingModelUICacheUpdate *v5;
  ATXBlendingModelUICacheUpdate *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBBlendingModelUICacheUpdate initWithData:]([ATXPBBlendingModelUICacheUpdate alloc], "initWithData:", v4);

    self = -[ATXBlendingModelUICacheUpdate initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __80__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsDictionaryFromProto___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[ATXPBBlendingModelUICacheUpdate clientModelCacheUpdateUUIDStrings](*(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithUUIDString:", v8);

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v5);
  }
  else
  {
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __80__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsDictionaryFromProto___block_invoke_cold_1();

  }
}

- (id)encodeAsProtoForBiome
{
  void *v2;
  void *v3;

  -[ATXBlendingModelUICacheUpdate protoForBiome](self, "protoForBiome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXBlendingModelUICacheUpdate)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ATXBlendingModelUICacheUpdate *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  ATXSuggestionLayout *v37;
  void *v38;
  void *v39;
  ATXHomeScreenCachedSuggestions *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  ATXSpotlightSuggestionLayout *v44;
  void *v45;
  uint64_t v46;
  int v47;
  void *v48;
  double v49;
  void *v50;
  void *v52;
  char v53;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_blending();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXBlendingModelUICacheUpdate initWithProto:].cold.4();
      v11 = 0;
      goto LABEL_35;
    }
    v5 = v4;
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[ATXPBBlendingModelUICacheUpdate uuidString]((uint64_t)v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

    -[ATXPBBlendingModelUICacheUpdate consumerSubTypeString]((uint64_t)v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    v10 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v9, &v53);
    v11 = 0;
    if (!v53 || (v12 = v10, !(_DWORD)v10) || (_DWORD)v10 == 48)
    {
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    -[ATXBlendingModelUICacheUpdate clientModelCacheUpdateUUIDsDictionaryFromProto:](self, "clientModelCacheUpdateUUIDsDictionaryFromProto:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXPBBlendingModelUICacheUpdate hasSuggestionLayout]((_BOOL8)v5)
      && -[ATXPBBlendingModelUICacheUpdate hasHomeScreenCachedSuggestion]((_BOOL8)v5))
    {
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[ATXBlendingModelUICacheUpdate initWithProto:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else if (-[ATXPBBlendingModelUICacheUpdate hasSuggestionLayout]((_BOOL8)v5)
           && -[ATXPBBlendingModelUICacheUpdate hasSpotlightSuggestionLayout]((_BOOL8)v5))
    {
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[ATXBlendingModelUICacheUpdate initWithProto:].cold.2(v14, v22, v23, v24, v25, v26, v27, v28);
    }
    else
    {
      if (!-[ATXPBBlendingModelUICacheUpdate hasHomeScreenCachedSuggestion]((_BOOL8)v5)
        || !-[ATXPBBlendingModelUICacheUpdate hasSpotlightSuggestionLayout]((_BOOL8)v5))
      {
        v52 = v13;
        -[ATXPBBlendingModelUICacheUpdate suggestionLayout]((uint64_t)v5);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v37 = [ATXSuggestionLayout alloc];
          -[ATXPBBlendingModelUICacheUpdate suggestionLayout]((uint64_t)v5);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[ATXSuggestionLayout initWithProto:](v37, "initWithProto:", v38);

        }
        else
        {
          v14 = 0;
        }

        -[ATXPBBlendingModelUICacheUpdate homeScreenCachedSuggestion]((uint64_t)v5);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          v40 = [ATXHomeScreenCachedSuggestions alloc];
          -[ATXPBBlendingModelUICacheUpdate homeScreenCachedSuggestion]((uint64_t)v5);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[ATXHomeScreenCachedSuggestions initWithProto:](v40, "initWithProto:", v41);

          v14 = v42;
        }

        -[ATXPBBlendingModelUICacheUpdate spotlightSuggestionLayout]((uint64_t)v5);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v44 = [ATXSpotlightSuggestionLayout alloc];
          -[ATXPBBlendingModelUICacheUpdate spotlightSuggestionLayout]((uint64_t)v5);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[ATXSpotlightSuggestionLayout initWithProto:](v44, "initWithProto:", v45);

          v14 = v46;
        }
        v13 = v52;

        v47 = -[ATXPBBlendingModelUICacheUpdate hasCacheCreationDate]((uint64_t)v5);
        v48 = (void *)MEMORY[0x1E0C99D68];
        v49 = 0.0;
        if (v47)
          v49 = -[ATXPBBlendingModelUICacheUpdate cacheCreationDate]((uint64_t)v5);
        objc_msgSend(v48, "dateWithTimeIntervalSince1970:", v49, v52);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[ATXBlendingModelUICacheUpdate initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:](self, "initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:", v14, v12, v13, v8, v50);

        v11 = self;
        goto LABEL_33;
      }
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[ATXBlendingModelUICacheUpdate initWithProto:].cold.3(v14, v29, v30, v31, v32, v33, v34, v35);
    }
    v11 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v11 = 0;
LABEL_36:

  return v11;
}

- (id)clientModelCacheUpdateUUIDsDictionaryFromProto:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  -[ATXPBBlendingModelUICacheUpdate clientModelIds]((uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __80__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsDictionaryFromProto___block_invoke;
  v13 = &unk_1E57CF4A0;
  v14 = v3;
  v15 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);
  return v8;
}

- (ATXBlendingModelUICacheUpdate)initWithUICache:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdateUUIDs:(id)a5 uuid:(id)a6 cacheCreationDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXBlendingModelUICacheUpdate *v17;
  ATXBlendingModelUICacheUpdate *v18;
  NSUUID *v19;
  NSUUID *uuid;
  double v21;
  objc_super v23;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXBlendingModelUICacheUpdate;
  v17 = -[ATXBlendingModelUICacheUpdate init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uiCache, a3);
    v18->_consumerSubType = a4;
    objc_storeStrong((id *)&v18->_clientModelCacheUpdateUUIDs, a5);
    if (v15)
      v19 = (NSUUID *)v15;
    else
      v19 = (NSUUID *)objc_opt_new();
    uuid = v18->_uuid;
    v18->_uuid = v19;

    objc_msgSend(v16, "timeIntervalSince1970");
    v18->_absoluteCacheCreationDate = v21;
  }

  return v18;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)protoForBiome
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBlendingModelUICacheUpdate setUuidString:]((uint64_t)v3, v4);

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBlendingModelUICacheUpdate setConsumerSubTypeString:]((uint64_t)v3, v5);

  -[ATXPBBlendingModelUICacheUpdate setCacheCreationDate:]((uint64_t)v3, self->_absoluteCacheCreationDate);
  -[ATXBlendingModelUICacheUpdate setClientModelCacheUpdateUUIDsDictionaryOnProto:](self, "setClientModelCacheUpdateUUIDsDictionaryOnProto:", v3);
  -[ATXBlendingModelUICacheUpdate setUICacheObjectOnProtoForBiome:](self, "setUICacheObjectOnProtoForBiome:", v3);
  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBlendingModelUICacheUpdate setUuidString:]((uint64_t)v3, v4);

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBlendingModelUICacheUpdate setConsumerSubTypeString:]((uint64_t)v3, v5);

  -[ATXPBBlendingModelUICacheUpdate setCacheCreationDate:]((uint64_t)v3, self->_absoluteCacheCreationDate);
  -[ATXBlendingModelUICacheUpdate setClientModelCacheUpdateUUIDsDictionaryOnProto:](self, "setClientModelCacheUpdateUUIDsDictionaryOnProto:", v3);
  -[ATXBlendingModelUICacheUpdate setUICacheObjectOnProto:](self, "setUICacheObjectOnProto:", v3);
  return v3;
}

- (void)setClientModelCacheUpdateUUIDsDictionaryOnProto:(id)a3
{
  NSDictionary *clientModelCacheUpdateUUIDs;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  clientModelCacheUpdateUUIDs = self->_clientModelCacheUpdateUUIDs;
  v5 = a3;
  -[NSDictionary allKeys](clientModelCacheUpdateUUIDs, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[ATXPBBlendingModelUICacheUpdate setClientModelIds:]((uint64_t)v5, v7);

  -[NSDictionary allValues](self->_clientModelCacheUpdateUUIDs, "allValues");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  -[ATXPBBlendingModelUICacheUpdate setClientModelCacheUpdateUUIDStrings:]((uint64_t)v5, v9);

}

- (void)setUICacheObjectOnProto:(id)a3
{
  id v4;
  ATXUICacheProtocol **p_uiCache;
  ATXUICacheProtocol *uiCache;
  void *v7;
  NSObject *v8;

  v4 = a3;
  uiCache = self->_uiCache;
  p_uiCache = &self->_uiCache;
  if (uiCache)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ATXUICacheProtocol proto](*p_uiCache, "proto");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBBlendingModelUICacheUpdate setHomeScreenCachedSuggestion:]((uint64_t)v4, v7);
LABEL_8:

      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ATXUICacheProtocol proto](*p_uiCache, "proto");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBBlendingModelUICacheUpdate setSuggestionLayout:]((uint64_t)v4, v7);
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ATXUICacheProtocol proto](*p_uiCache, "proto");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBBlendingModelUICacheUpdate setSpotlightSuggestionLayout:]((uint64_t)v4, v7);
      goto LABEL_8;
    }
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXBlendingModelUICacheUpdate setUICacheObjectOnProto:].cold.1();

  }
LABEL_9:

}

- (void)setUICacheObjectOnProtoForBiome:(id)a3
{
  id v4;
  ATXUICacheProtocol **p_uiCache;
  ATXUICacheProtocol *uiCache;
  void *v7;
  NSObject *v8;

  v4 = a3;
  uiCache = self->_uiCache;
  p_uiCache = &self->_uiCache;
  if (uiCache)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ATXUICacheProtocol protoForBiome](*p_uiCache, "protoForBiome");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBBlendingModelUICacheUpdate setHomeScreenCachedSuggestion:]((uint64_t)v4, v7);
LABEL_8:

      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ATXUICacheProtocol proto](*p_uiCache, "proto");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBBlendingModelUICacheUpdate setSuggestionLayout:]((uint64_t)v4, v7);
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ATXUICacheProtocol proto](*p_uiCache, "proto");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBBlendingModelUICacheUpdate setSpotlightSuggestionLayout:]((uint64_t)v4, v7);
      goto LABEL_8;
    }
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXBlendingModelUICacheUpdate setUICacheObjectOnProto:].cold.1();

  }
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdateUUIDs, 0);
  objc_storeStrong((id *)&self->_uiCache, 0);
}

- (NSDictionary)clientModelCacheUpdateUUIDs
{
  return self->_clientModelCacheUpdateUUIDs;
}

- (id)clientModelCacheUpdateUUIDsFromCacheUpdates:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsFromCacheUpdates___block_invoke;
  v7[3] = &unk_1E57CFAD0;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __77__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsFromCacheUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (ATXBlendingModelUICacheUpdate)initWithHomeScreenCachedSuggestions:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ATXBlendingModelUICacheUpdate *v12;

  v6 = a4;
  v8 = a3;
  -[ATXBlendingModelUICacheUpdate clientModelCacheUpdateUUIDsFromCacheUpdates:](self, "clientModelCacheUpdateUUIDsFromCacheUpdates:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = -[ATXBlendingModelUICacheUpdate initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:](self, "initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:", v8, v6, v9, v10, v11);

  return v12;
}

- (ATXBlendingModelUICacheUpdate)initWithSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ATXBlendingModelUICacheUpdate *v12;

  v6 = a4;
  v8 = a3;
  -[ATXBlendingModelUICacheUpdate clientModelCacheUpdateUUIDsFromCacheUpdates:](self, "clientModelCacheUpdateUUIDsFromCacheUpdates:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = -[ATXBlendingModelUICacheUpdate initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:](self, "initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:", v8, v6, v9, v10, v11);

  return v12;
}

- (ATXBlendingModelUICacheUpdate)initWithSpotlightSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ATXBlendingModelUICacheUpdate *v12;

  v6 = a4;
  v8 = a3;
  -[ATXBlendingModelUICacheUpdate clientModelCacheUpdateUUIDsFromCacheUpdates:](self, "clientModelCacheUpdateUUIDsFromCacheUpdates:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = -[ATXBlendingModelUICacheUpdate initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:](self, "initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:", v8, v6, v9, v10, v11);

  return v12;
}

- (ATXBlendingModelUICacheUpdate)initWithUICache:(id)a3 consumerSubType:(unsigned __int8)a4 clientModelCacheUpdates:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ATXBlendingModelUICacheUpdate *v12;

  v6 = a4;
  v8 = a3;
  -[ATXBlendingModelUICacheUpdate clientModelCacheUpdateUUIDsFromCacheUpdates:](self, "clientModelCacheUpdateUUIDsFromCacheUpdates:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = -[ATXBlendingModelUICacheUpdate initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:](self, "initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:", v8, v6, v9, v10, v11);

  return v12;
}

- (NSDate)cacheCreationDate
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_absoluteCacheCreationDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForint:(int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXBlendingModelUICacheUpdate encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXBlendingModelUICacheUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXBlendingModelUICacheUpdate *v6;
  ATXBlendingModelUICacheUpdate *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[ATXBlendingModelUICacheUpdate initWithProtoData:](self, "initWithProtoData:", v5);
  else
    v6 = -[ATXBlendingModelUICacheUpdate _initWithCoder:](self, "_initWithCoder:", v4);
  v7 = v6;

  return v7;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  ATXBlendingModelUICacheUpdate *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF421DC4]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("codingKeyForUICache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ATXBlendingModelUICacheUpdate checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v10, CFSTR("codingKeyForUICache"), v4, CFSTR("com.apple.proactive.BlendingModelUICacheUpdate"), -1)|| (v11 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("codingKeyForFeedbackMetadata")), -[ATXBlendingModelUICacheUpdate checkAndReportDecodingFailureIfNeededForint:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForint:key:coder:errorDomain:errorCode:", v11, CFSTR("codingKeyForFeedbackMetadata"), v4, CFSTR("com.apple.proactive.BlendingModelUICacheUpdate"), -1)))
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x1AF421DC4]();
    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("codingKeyForClientModelCacheUpdateUUIDs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ATXBlendingModelUICacheUpdate checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v18, CFSTR("codingKeyForClientModelCacheUpdateUUIDs"), v4, CFSTR("com.apple.proactive.BlendingModelUICacheUpdate"), -1))
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForUUID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ATXBlendingModelUICacheUpdate checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v19, CFSTR("codingKeyForUUID"), v4, CFSTR("com.apple.proactive.BlendingModelUICacheUpdate"), -1))
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[ATXBlendingModelUICacheUpdate initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:](self, "initWithUICache:consumerSubType:clientModelCacheUpdateUUIDs:uuid:cacheCreationDate:", v10, v11, v18, v19, v20);

        v12 = self;
      }

    }
  }

  return v12;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXBlendingModelUICacheUpdate proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXBlendingModelUICacheUpdate *v4;
  ATXBlendingModelUICacheUpdate *v5;
  BOOL v6;

  v4 = (ATXBlendingModelUICacheUpdate *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXBlendingModelUICacheUpdate isEqualToATXBlendingModelUICacheUpdate:](self, "isEqualToATXBlendingModelUICacheUpdate:", v5);

  return v6;
}

- (BOOL)isEqualToATXBlendingModelUICacheUpdate:(id)a3
{
  id *v4;
  ATXUICacheProtocol *uiCache;
  ATXUICacheProtocol *v6;
  ATXUICacheProtocol *v7;
  ATXUICacheProtocol *v8;
  char v9;
  NSDictionary *clientModelCacheUpdateUUIDs;
  NSDictionary *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  char v14;
  NSUUID *uuid;
  NSUUID *v16;
  NSUUID *v17;
  NSUUID *v18;
  char v19;
  BOOL v20;

  v4 = (id *)a3;
  uiCache = self->_uiCache;
  v6 = (ATXUICacheProtocol *)v4[3];
  if (uiCache == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = uiCache;
    v9 = -[ATXUICacheProtocol isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_12;
  }
  if (self->_consumerSubType == *((unsigned __int8 *)v4 + 16))
  {
    clientModelCacheUpdateUUIDs = self->_clientModelCacheUpdateUUIDs;
    v11 = (NSDictionary *)v4[4];
    if (clientModelCacheUpdateUUIDs == v11)
    {

    }
    else
    {
      v12 = v11;
      v13 = clientModelCacheUpdateUUIDs;
      v14 = -[NSDictionary isEqual:](v13, "isEqual:", v12);

      if ((v14 & 1) == 0)
        goto LABEL_12;
    }
    uuid = self->_uuid;
    v16 = (NSUUID *)v4[5];
    if (uuid == v16)
    {

    }
    else
    {
      v17 = v16;
      v18 = uuid;
      v19 = -[NSUUID isEqual:](v18, "isEqual:", v17);

      if ((v19 & 1) == 0)
        goto LABEL_12;
    }
    v20 = self->_absoluteCacheCreationDate == *((double *)v4 + 1);
    goto LABEL_13;
  }
LABEL_12:
  v20 = 0;
LABEL_13:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[ATXUICacheProtocol hash](self->_uiCache, "hash");
  v4 = self->_consumerSubType - v3 + 32 * v3;
  v5 = -[NSDictionary hash](self->_clientModelCacheUpdateUUIDs, "hash") - v4 + 32 * v4;
  v6 = -[NSUUID hash](self->_uuid, "hash");
  return (unint64_t)self->_absoluteCacheCreationDate - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
}

- (unsigned)dataVersion
{
  return 1;
}

- (id)jsonRawData
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  _QWORD v22[4];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_clientModelCacheUpdateUUIDs;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_clientModelCacheUpdateUUIDs, "objectForKeyedSubscript:", v9, (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ATXUICacheProtocol performSelector:](self->_uiCache, "performSelector:", sel_jsonRawData);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA70];
  }
  v21[0] = CFSTR("uuid");
  -[NSUUID UUIDString](self->_uuid, "UUIDString", (_QWORD)v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v21[1] = CFSTR("consumerSubType");
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  v22[2] = v3;
  v21[2] = CFSTR("clientModelCacheUUIDs");
  v21[3] = CFSTR("uiCache");
  v22[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXBlendingModelUICacheUpdate jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXUICacheProtocol)uiCache
{
  return self->_uiCache;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Encountered an unexpected error while initializing ATXBlendingModelUICacheUpdate from proto. Serialized proto data had both a SuggestionLayout and a HomeScreenCachedSuggestion.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Encountered an unexpected error while initializing ATXBlendingModelUICacheUpdate from proto. Serialized proto data had both a SuggestionLayout and a SpotlightSuggestionLayout.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Encountered an unexpected error while initializing ATXBlendingModelUICacheUpdate from proto. Serialized proto data had both a HomeScreenCachedSuggestion and a SpotlightSuggestionLayout.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.4()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_9(&dword_1AA841000, v2, v3, "Unable to construct class %@ from ProtoBuf object", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __80__ATXBlendingModelUICacheUpdate_clientModelCacheUpdateUUIDsDictionaryFromProto___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1AA841000, v0, OS_LOG_TYPE_FAULT, "Unable to rebuild clientModelCacheUpdateUUIDs dictionary from protobuf data because value of dictionary was nil. Client Model Id %@", v1, 0xCu);
}

- (void)setUICacheObjectOnProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_9(&dword_1AA841000, v2, v3, "Attempted to encode ATXBlendingModelUICacheUpdate's UICache to protobuf, but it was of unexpected type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
