@implementation ATXHomeScreenCachedSuggestions

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *cachedSuggestionWidgetLayouts;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *cachedTopOfStackLayouts;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *cachedAppPredictionPanelLayouts;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *cachedSuggestedWidgetsLayouts;
  void *v24;
  void *v25;

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setUuidString:]((uint64_t)v3, v4);

  -[NSDictionary allKeys](self->_cachedSuggestionWidgetLayouts, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestionWidgetIds:]((uint64_t)v3, v6);

  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _protoLayoutsFromLayoutDictionary:orderedByKeys:](self, "_protoLayoutsFromLayoutDictionary:orderedByKeys:", cachedSuggestionWidgetLayouts, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestionWidgetLayouts:]((uint64_t)v3, v9);

  -[NSDictionary allKeys](self->_cachedTopOfStackLayouts, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[ATXPBHomeScreenCachedSuggestion setCachedTopOfStackLayoutKeys:]((uint64_t)v3, v11);

  cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts;
  -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutKeys]((uint64_t)v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _protoLayoutsFromLayoutDictionary:orderedByKeys:](self, "_protoLayoutsFromLayoutDictionary:orderedByKeys:", cachedTopOfStackLayouts, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setCachedTopOfStackLayouts:]((uint64_t)v3, v14);

  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_fallbackSuggestions);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setFallbackSuggestions:]((uint64_t)v3, v15);

  -[NSDictionary allKeys](self->_cachedAppPredictionPanelLayouts, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  -[ATXPBHomeScreenCachedSuggestion setCachedAppPredictionPanelIds:]((uint64_t)v3, v17);

  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _protoLayoutsFromLayoutDictionary:orderedByKeys:](self, "_protoLayoutsFromLayoutDictionary:orderedByKeys:", cachedAppPredictionPanelLayouts, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setCachedAppPredictionPanelLayouts:]((uint64_t)v3, v20);

  -[NSDictionary allKeys](self->_cachedSuggestedWidgetsLayouts, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestedWidgetLayoutListKeys:]((uint64_t)v3, v22);

  cachedSuggestedWidgetsLayouts = self->_cachedSuggestedWidgetsLayouts;
  -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListKeys]((uint64_t)v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _protoLayoutListsFromLayoutListDictionary:orderedByKeys:](self, "_protoLayoutListsFromLayoutListDictionary:orderedByKeys:", cachedSuggestedWidgetsLayouts, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestedWidgetLayoutLists:]((uint64_t)v3, v25);

  return v3;
}

- (id)_protoLayoutsFromLayoutDictionary:(id)a3 orderedByKeys:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__ATXHomeScreenCachedSuggestions__protoLayoutsFromLayoutDictionary_orderedByKeys___block_invoke;
  v14[3] = &unk_1E57CF4A0;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (ATXHomeScreenCachedSuggestions)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ATXHomeScreenCachedSuggestions *v18;
  ATXHomeScreenCachedSuggestions *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  if (!v4)
  {
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[ATXHomeScreenCachedSuggestions initWithProto:].cold.1((uint64_t)self, v20);

    goto LABEL_9;
  }
  v5 = v4;
  -[ATXPBHomeScreenCachedSuggestion fallbackSuggestions]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:](ATXProactiveSuggestion, "suggestionsFromProtoSuggestions:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = (void *)v7;
  v26 = v9;

  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[ATXPBHomeScreenCachedSuggestion uuidString]((uint64_t)v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v10, "initWithUUIDString:", v29);
  -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetLayouts]((uint64_t)v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _layoutDictionaryWithKeys:protoLayouts:](self, "_layoutDictionaryWithKeys:protoLayouts:", v28, v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelLayouts]((uint64_t)v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _layoutDictionaryWithKeys:protoLayouts:](self, "_layoutDictionaryWithKeys:protoLayouts:", v25, v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutKeys]((uint64_t)v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayouts]((uint64_t)v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _layoutDictionaryWithKeys:protoLayouts:](self, "_layoutDictionaryWithKeys:protoLayouts:", v22, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListKeys]((uint64_t)v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutLists]((uint64_t)v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXHomeScreenCachedSuggestions _layoutListDictionaryWithKeys:protoLayoutLists:](self, "_layoutListDictionaryWithKeys:protoLayoutLists:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ATXHomeScreenCachedSuggestions initWithUUID:suggestionWidgetLayouts:appPredictionPanelLayouts:topOfStackLayouts:suggestedWidgetLayouts:fallbackSuggestions:](self, "initWithUUID:suggestionWidgetLayouts:appPredictionPanelLayouts:topOfStackLayouts:suggestedWidgetLayouts:fallbackSuggestions:", v23, v11, v12, v14, v17, v26);

  self = v18;
  v19 = self;
LABEL_10:

  return v19;
}

- (id)_layoutDictionaryWithKeys:(id)a3 protoLayouts:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__ATXHomeScreenCachedSuggestions__layoutDictionaryWithKeys_protoLayouts___block_invoke;
  v14[3] = &unk_1E57CF4A0;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (ATXHomeScreenCachedSuggestions)initWithUUID:(id)a3 suggestionWidgetLayouts:(id)a4 appPredictionPanelLayouts:(id)a5 topOfStackLayouts:(id)a6 suggestedWidgetLayouts:(id)a7 fallbackSuggestions:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ATXHomeScreenCachedSuggestions *v20;
  uint64_t v21;
  NSUUID *uuid;
  uint64_t v23;
  NSDictionary *cachedSuggestionWidgetLayouts;
  uint64_t v25;
  NSDictionary *cachedAppPredictionPanelLayouts;
  uint64_t v27;
  NSDictionary *cachedTopOfStackLayouts;
  uint64_t v29;
  NSDictionary *cachedSuggestedWidgetsLayouts;
  uint64_t v31;
  NSArray *fallbackSuggestions;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)ATXHomeScreenCachedSuggestions;
  v20 = -[ATXHomeScreenCachedSuggestions init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v21;

    v23 = objc_msgSend(v15, "copy");
    cachedSuggestionWidgetLayouts = v20->_cachedSuggestionWidgetLayouts;
    v20->_cachedSuggestionWidgetLayouts = (NSDictionary *)v23;

    v25 = objc_msgSend(v16, "copy");
    cachedAppPredictionPanelLayouts = v20->_cachedAppPredictionPanelLayouts;
    v20->_cachedAppPredictionPanelLayouts = (NSDictionary *)v25;

    v27 = objc_msgSend(v17, "copy");
    cachedTopOfStackLayouts = v20->_cachedTopOfStackLayouts;
    v20->_cachedTopOfStackLayouts = (NSDictionary *)v27;

    v29 = objc_msgSend(v18, "copy");
    cachedSuggestedWidgetsLayouts = v20->_cachedSuggestedWidgetsLayouts;
    v20->_cachedSuggestedWidgetsLayouts = (NSDictionary *)v29;

    v31 = objc_msgSend(v19, "copy");
    fallbackSuggestions = v20->_fallbackSuggestions;
    v20->_fallbackSuggestions = (NSArray *)v31;

  }
  return v20;
}

- (id)_protoLayoutListsFromLayoutListDictionary:(id)a3 orderedByKeys:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__ATXHomeScreenCachedSuggestions__protoLayoutListsFromLayoutListDictionary_orderedByKeys___block_invoke;
  v14[3] = &unk_1E57CF4A0;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (id)_layoutListDictionaryWithKeys:(id)a3 protoLayoutLists:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__ATXHomeScreenCachedSuggestions__layoutListDictionaryWithKeys_protoLayoutLists___block_invoke;
  v14[3] = &unk_1E57CF4A0;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackSuggestions, 0);
  objc_storeStrong((id *)&self->_cachedSuggestedWidgetsLayouts, 0);
  objc_storeStrong((id *)&self->_cachedTopOfStackLayouts, 0);
  objc_storeStrong((id *)&self->_cachedAppPredictionPanelLayouts, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionWidgetLayouts, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (id)allSuggestionsInCachedSuggestions
{
  void *v3;
  NSDictionary *cachedSuggestionWidgetLayouts;
  uint64_t v5;
  id v6;
  NSDictionary *cachedAppPredictionPanelLayouts;
  id v8;
  NSDictionary *cachedTopOfStackLayouts;
  id v10;
  NSDictionary *cachedSuggestedWidgetsLayouts;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = (void *)objc_opt_new();
  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke;
  v24[3] = &unk_1E57CF400;
  v6 = v3;
  v25 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedSuggestionWidgetLayouts, "enumerateKeysAndObjectsUsingBlock:", v24);
  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_2;
  v22[3] = &unk_1E57CF400;
  v8 = v6;
  v23 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedAppPredictionPanelLayouts, "enumerateKeysAndObjectsUsingBlock:", v22);
  cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts;
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_3;
  v20[3] = &unk_1E57CF400;
  v10 = v8;
  v21 = v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedTopOfStackLayouts, "enumerateKeysAndObjectsUsingBlock:", v20);
  cachedSuggestedWidgetsLayouts = self->_cachedSuggestedWidgetsLayouts;
  v15 = v5;
  v16 = 3221225472;
  v17 = __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_4;
  v18 = &unk_1E57CF428;
  v19 = v10;
  v12 = v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedSuggestedWidgetsLayouts, "enumerateKeysAndObjectsUsingBlock:", &v15);
  objc_msgSend(v12, "addObjectsFromArray:", self->_fallbackSuggestions, v15, v16, v17, v18);
  v13 = (void *)objc_msgSend(v12, "copy");

  return v13;
}

void __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allSuggestionsInLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allSuggestionsInLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allSuggestionsInLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "allSuggestionsInLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks
{
  void *v3;
  NSDictionary *cachedSuggestionWidgetLayouts;
  uint64_t v5;
  id v6;
  NSDictionary *cachedAppPredictionPanelLayouts;
  id v8;
  NSDictionary *cachedTopOfStackLayouts;
  id v10;
  NSDictionary *cachedSuggestedWidgetsLayouts;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = (void *)objc_opt_new();
  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke;
  v24[3] = &unk_1E57CF400;
  v6 = v3;
  v25 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedSuggestionWidgetLayouts, "enumerateKeysAndObjectsUsingBlock:", v24);
  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_2;
  v22[3] = &unk_1E57CF400;
  v8 = v6;
  v23 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedAppPredictionPanelLayouts, "enumerateKeysAndObjectsUsingBlock:", v22);
  cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts;
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_3;
  v20[3] = &unk_1E57CF400;
  v10 = v8;
  v21 = v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedTopOfStackLayouts, "enumerateKeysAndObjectsUsingBlock:", v20);
  cachedSuggestedWidgetsLayouts = self->_cachedSuggestedWidgetsLayouts;
  v15 = v5;
  v16 = 3221225472;
  v17 = __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_4;
  v18 = &unk_1E57CF428;
  v19 = v10;
  v12 = v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedSuggestedWidgetsLayouts, "enumerateKeysAndObjectsUsingBlock:", &v15);
  v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18);

  return v13;
}

void __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CF9488]) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CF9490]) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CF9498]) & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "minSuggestionListInLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

  }
}

void __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CF9390]) & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "minSuggestionListInLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
}

void __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "minSuggestionListInLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "minSuggestionListInLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenCachedSuggestions *v4;
  ATXHomeScreenCachedSuggestions *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (ATXHomeScreenCachedSuggestions *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATXHomeScreenCachedSuggestions uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenCachedSuggestions uuid](v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)compactDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSDictionary *cachedSuggestionWidgetLayouts;
  uint64_t v6;
  id v7;
  NSDictionary *cachedAppPredictionPanelLayouts;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSArray *fallbackSuggestions;
  id v24;
  void *v25;
  id v26;
  id obj;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\n=== HomeScreenCachedSuggestions (ID: %@) ===\n"), v4);

  objc_msgSend(v3, "appendString:", CFSTR("\n1). Layouts For Suggestion Widgets\n"));
  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  v6 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __45__ATXHomeScreenCachedSuggestions_description__block_invoke;
  v41[3] = &unk_1E57CF400;
  v7 = v3;
  v42 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedSuggestionWidgetLayouts, "enumerateKeysAndObjectsUsingBlock:", v41);
  objc_msgSend(v7, "appendString:", CFSTR("\n2). Layouts for App Prediction Panels\n"));
  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  v39[0] = v6;
  v39[1] = 3221225472;
  v39[2] = __45__ATXHomeScreenCachedSuggestions_description__block_invoke_2;
  v39[3] = &unk_1E57CF400;
  v9 = v7;
  v40 = v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedAppPredictionPanelLayouts, "enumerateKeysAndObjectsUsingBlock:", v39);
  objc_msgSend(v9, "appendString:", CFSTR("\n3). Stack Suggestions\n"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NSDictionary allKeys](self->_cachedTopOfStackLayouts, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "appendFormat:", CFSTR("\nStack ID: %@\n"), v14);
        objc_msgSend(v9, "appendString:", CFSTR("\n Top of Stack \n"));
        -[NSDictionary objectForKeyedSubscript:](self->_cachedTopOfStackLayouts, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v16);

        objc_msgSend(v9, "appendString:", CFSTR("\n Suggested Widgets \n"));
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        -[NSDictionary objectForKeyedSubscript:](self->_cachedSuggestedWidgetsLayouts, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v32 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "description");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "appendString:", v22);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
          }
          while (v19);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v11);
  }

  objc_msgSend(v9, "appendString:", CFSTR("\n4). Fallback Suggestions\n"));
  fallbackSuggestions = self->_fallbackSuggestions;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __45__ATXHomeScreenCachedSuggestions_description__block_invoke_3;
  v29[3] = &unk_1E57CF450;
  v24 = v9;
  v30 = v24;
  -[NSArray enumerateObjectsUsingBlock:](fallbackSuggestions, "enumerateObjectsUsingBlock:", v29);
  v25 = v30;
  v26 = v24;

  return (NSString *)v26;
}

void __45__ATXHomeScreenCachedSuggestions_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "appendFormat:", CFSTR("\nWidget ID: %@\n"), a2);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "description");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendString:", v8);
}

void __45__ATXHomeScreenCachedSuggestions_description__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "appendFormat:", CFSTR("\nApp Prediction Panel ID: %@\n"), a2);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "description");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendString:", v8);
}

void __45__ATXHomeScreenCachedSuggestions_description__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

}

- (id)descriptionWithoutPreviews
{
  void *v3;
  void *v4;
  NSDictionary *cachedSuggestionWidgetLayouts;
  uint64_t v6;
  id v7;
  NSDictionary *cachedAppPredictionPanelLayouts;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSArray *fallbackSuggestions;
  id v24;
  void *v25;
  id v26;
  id obj;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\n=== HomeScreenCachedSuggestions (ID: %@) ===\n"), v4);

  objc_msgSend(v3, "appendString:", CFSTR("\n1). Layouts For Suggestion Widgets\n"));
  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  v6 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke;
  v41[3] = &unk_1E57CF400;
  v7 = v3;
  v42 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedSuggestionWidgetLayouts, "enumerateKeysAndObjectsUsingBlock:", v41);
  objc_msgSend(v7, "appendString:", CFSTR("\n2). Layouts For App Prediction Panels\n"));
  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  v39[0] = v6;
  v39[1] = 3221225472;
  v39[2] = __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke_2;
  v39[3] = &unk_1E57CF400;
  v9 = v7;
  v40 = v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cachedAppPredictionPanelLayouts, "enumerateKeysAndObjectsUsingBlock:", v39);
  objc_msgSend(v9, "appendString:", CFSTR("\n3). Stack Suggestions\n"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NSDictionary allKeys](self->_cachedTopOfStackLayouts, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "appendFormat:", CFSTR("\nStack ID: %@\n"), v14);
        objc_msgSend(v9, "appendString:", CFSTR("\n Top of Stack \n"));
        -[NSDictionary objectForKeyedSubscript:](self->_cachedTopOfStackLayouts, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v16);

        objc_msgSend(v9, "appendString:", CFSTR("\n Suggested Widgets \n"));
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        -[NSDictionary objectForKeyedSubscript:](self->_cachedSuggestedWidgetsLayouts, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v32 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "description");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "appendString:", v22);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
          }
          while (v19);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v11);
  }

  objc_msgSend(v9, "appendString:", CFSTR("\n4). Fallback Suggestions\n"));
  fallbackSuggestions = self->_fallbackSuggestions;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke_3;
  v29[3] = &unk_1E57CF450;
  v24 = v9;
  v30 = v24;
  -[NSArray enumerateObjectsUsingBlock:](fallbackSuggestions, "enumerateObjectsUsingBlock:", v29);
  v25 = v30;
  v26 = v24;

  return v26;
}

void __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CF9488]) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CF9490]) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CF9498]) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\nWidget ID: %@\n"), v8);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v7);

  }
}

void __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CF9390]) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\nApp Prediction Panel ID: %@\n"), v8);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v7);

  }
}

void __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXHomeScreenCachedSuggestions encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXHomeScreenCachedSuggestions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXHomeScreenCachedSuggestions *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXHomeScreenCachedSuggestions initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (ATXHomeScreenCachedSuggestions)initWithProtoData:(id)a3
{
  id v4;
  ATXPBHomeScreenCachedSuggestion *v5;
  ATXHomeScreenCachedSuggestions *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBHomeScreenCachedSuggestion initWithData:]([ATXPBHomeScreenCachedSuggestion alloc], "initWithData:", v4);

    self = -[ATXHomeScreenCachedSuggestions initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXHomeScreenCachedSuggestions proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)protoForBiome
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *cachedSuggestionWidgetLayouts;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *cachedTopOfStackLayouts;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *cachedSuggestedWidgetsLayouts;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSDictionary *cachedAppPredictionPanelLayouts;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, void *, uint64_t);
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setUuidString:]((uint64_t)v3, v4);

  -[NSDictionary allKeys](self->_cachedSuggestionWidgetLayouts, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestionWidgetIds:]((uint64_t)v3, v6);

  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _protoLayoutsFromLayoutDictionary:orderedByKeys:](self, "_protoLayoutsFromLayoutDictionary:orderedByKeys:", cachedSuggestionWidgetLayouts, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestionWidgetLayouts:]((uint64_t)v3, v9);

  v10 = (void *)objc_opt_new();
  -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __47__ATXHomeScreenCachedSuggestions_protoForBiome__block_invoke;
  v43[3] = &unk_1E57CF478;
  v44 = v10;
  v13 = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v43);

  -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectsAtIndexes:", v13);

  -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetLayouts]((uint64_t)v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectsAtIndexes:", v13);

  -[NSDictionary allKeys](self->_cachedTopOfStackLayouts, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  -[ATXPBHomeScreenCachedSuggestion setCachedTopOfStackLayoutKeys:]((uint64_t)v3, v17);

  cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts;
  -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutKeys]((uint64_t)v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _protoLayoutsFromLayoutDictionary:orderedByKeys:](self, "_protoLayoutsFromLayoutDictionary:orderedByKeys:", cachedTopOfStackLayouts, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setCachedTopOfStackLayouts:]((uint64_t)v3, v20);

  -[NSDictionary allKeys](self->_cachedSuggestedWidgetsLayouts, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestedWidgetLayoutListKeys:]((uint64_t)v3, v22);

  cachedSuggestedWidgetsLayouts = self->_cachedSuggestedWidgetsLayouts;
  -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListKeys]((uint64_t)v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _protoLayoutListsFromLayoutListDictionary:orderedByKeys:](self, "_protoLayoutListsFromLayoutListDictionary:orderedByKeys:", cachedSuggestedWidgetsLayouts, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestedWidgetLayoutLists:]((uint64_t)v3, v25);

  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_fallbackSuggestions);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setFallbackSuggestions:]((uint64_t)v3, v26);

  v27 = (void *)objc_opt_new();
  -[NSDictionary allKeys](self->_cachedAppPredictionPanelLayouts, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "mutableCopy");
  -[ATXPBHomeScreenCachedSuggestion setCachedAppPredictionPanelIds:]((uint64_t)v3, v29);

  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenCachedSuggestions _protoLayoutsFromLayoutDictionary:orderedByKeys:](self, "_protoLayoutsFromLayoutDictionary:orderedByKeys:", cachedAppPredictionPanelLayouts, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenCachedSuggestion setCachedAppPredictionPanelLayouts:]((uint64_t)v3, v32);

  -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v12;
  v39 = 3221225472;
  v40 = __47__ATXHomeScreenCachedSuggestions_protoForBiome__block_invoke_2;
  v41 = &unk_1E57CF478;
  v42 = v27;
  v34 = v27;
  objc_msgSend(v33, "enumerateObjectsUsingBlock:", &v38);

  -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeObjectsAtIndexes:", v34, v38, v39, v40, v41);

  -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelLayouts]((uint64_t)v3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeObjectsAtIndexes:", v34);

  return v3;
}

void __47__ATXHomeScreenCachedSuggestions_protoForBiome__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF9488]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF9490]) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF9498]))
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

uint64_t __47__ATXHomeScreenCachedSuggestions_protoForBiome__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CF9390]);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  return result;
}

void __73__ATXHomeScreenCachedSuggestions__layoutDictionaryWithKeys_protoLayouts___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  ATXSuggestionLayout *v6;
  void *v7;
  ATXSuggestionLayout *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a2;
  v6 = [ATXSuggestionLayout alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXSuggestionLayout initWithProto:](v6, "initWithProto:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v5);
  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __73__ATXHomeScreenCachedSuggestions__layoutDictionaryWithKeys_protoLayouts___block_invoke_cold_1(v9, v10, v11);

  }
}

void __82__ATXHomeScreenCachedSuggestions__protoLayoutsFromLayoutDictionary_orderedByKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __82__ATXHomeScreenCachedSuggestions__protoLayoutsFromLayoutDictionary_orderedByKeys___block_invoke_cold_1(v5, v6, v7);

  }
}

void __81__ATXHomeScreenCachedSuggestions__layoutListDictionaryWithKeys_protoLayoutLists___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ATXSuggestionLayout *v11;
  NSObject *v12;
  id v14;
  uint8_t v15;
  _BYTE v16[15];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[ATXPBSuggestionLayoutList layoutsCount]((uint64_t)v4));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ATXPBSuggestionLayoutList layouts]((uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = -[ATXSuggestionLayout initWithProto:]([ATXSuggestionLayout alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10));
        if (v11)
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        else
        {
          __atxlog_handle_default();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            __81__ATXHomeScreenCachedSuggestions__layoutListDictionaryWithKeys_protoLayoutLists___block_invoke_cold_1(&v15, v16, v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v14);
}

void __90__ATXHomeScreenCachedSuggestions__protoLayoutListsFromLayoutListDictionary_orderedByKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t v12;
  _BYTE v13[15];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[ATXPBSuggestionLayoutList addLayout:]((uint64_t)v4, v10);
        }
        else
        {
          __atxlog_handle_default();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            __90__ATXHomeScreenCachedSuggestions__protoLayoutListsFromLayoutListDictionary_orderedByKeys___block_invoke_cold_1(&v12, v13, v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

- (id)_jsonRawDataForWidgetLayoutMapping:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = *MEMORY[0x1E0CF9490];
  v19[0] = *MEMORY[0x1E0CF9488];
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CF9390];
  v19[2] = *MEMORY[0x1E0CF9498];
  v19[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithArray:", v8);

  v10 = (void *)objc_opt_new();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__ATXHomeScreenCachedSuggestions__jsonRawDataForWidgetLayoutMapping___block_invoke;
  v16[3] = &unk_1E57CF4C8;
  v17 = v9;
  v11 = v10;
  v18 = v11;
  v12 = v9;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

void __69__ATXHomeScreenCachedSuggestions__jsonRawDataForWidgetLayoutMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(v5, "jsonRawData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (id)_jsonRawDataForLayoutListMapping:(id)a3
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
  v7[2] = __67__ATXHomeScreenCachedSuggestions__jsonRawDataForLayoutListMapping___block_invoke;
  v7[3] = &unk_1E57CF428;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __67__ATXHomeScreenCachedSuggestions__jsonRawDataForLayoutListMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_14);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __67__ATXHomeScreenCachedSuggestions__jsonRawDataForLayoutListMapping___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRawData");
}

- (id)jsonRawData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("uuid");
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("cachedSuggestionWidgetLayouts");
  -[ATXHomeScreenCachedSuggestions _jsonRawDataForWidgetLayoutMapping:](self, "_jsonRawDataForWidgetLayoutMapping:", self->_cachedSuggestionWidgetLayouts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("cachedAppPredictionPanelLayouts");
  -[ATXHomeScreenCachedSuggestions _jsonRawDataForWidgetLayoutMapping:](self, "_jsonRawDataForWidgetLayoutMapping:", self->_cachedAppPredictionPanelLayouts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("cachedTopOfStackLayouts");
  -[ATXHomeScreenCachedSuggestions _jsonRawDataForWidgetLayoutMapping:](self, "_jsonRawDataForWidgetLayoutMapping:", self->_cachedTopOfStackLayouts);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = CFSTR("cachedSuggestedWidgetsLayouts");
  -[ATXHomeScreenCachedSuggestions _jsonRawDataForLayoutListMapping:](self, "_jsonRawDataForLayoutListMapping:", self->_cachedSuggestedWidgetsLayouts);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  v11[5] = CFSTR("fallbackSuggestions");
  -[NSArray _pas_mappedArrayWithTransform:](self->_fallbackSuggestions, "_pas_mappedArrayWithTransform:", &__block_literal_global_57);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __45__ATXHomeScreenCachedSuggestions_jsonRawData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRawData");
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSDictionary)cachedSuggestionWidgetLayouts
{
  return self->_cachedSuggestionWidgetLayouts;
}

- (NSDictionary)cachedAppPredictionPanelLayouts
{
  return self->_cachedAppPredictionPanelLayouts;
}

- (NSDictionary)cachedTopOfStackLayouts
{
  return self->_cachedTopOfStackLayouts;
}

- (NSDictionary)cachedSuggestedWidgetsLayouts
{
  return self->_cachedSuggestedWidgetsLayouts;
}

- (NSArray)fallbackSuggestions
{
  return self->_fallbackSuggestions;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "ATXHomeScreenCachedSuggestions: Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);

}

void __73__ATXHomeScreenCachedSuggestions__layoutDictionaryWithKeys_protoLayouts___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, a1, a3, "ATXHomeScreenCachedSuggestions: Unable to construct class ATXSuggestionLayout from ProtoBuf object", v3);
}

void __82__ATXHomeScreenCachedSuggestions__protoLayoutsFromLayoutDictionary_orderedByKeys___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, a1, a3, "ATXHomeScreenCachedSuggestions: Unable to construct ProtoBuf object from ATXSuggestionLayout", v3);
}

void __81__ATXHomeScreenCachedSuggestions__layoutListDictionaryWithKeys_protoLayoutLists___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, a3, (uint64_t)a3, "ATXHomeScreenCachedSuggestions: Unable to construct class ATXSuggestionLayout from ProtoBuf object", a1);
}

void __90__ATXHomeScreenCachedSuggestions__protoLayoutListsFromLayoutListDictionary_orderedByKeys___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, a3, (uint64_t)a3, "ATXHomeScreenCachedSuggestions: Unable to construct ProtoBuf object from ATXSuggestionLayout", a1);
}

@end
