@implementation ATXProactiveSuggestionClientModel

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 requestDelegate:(id)a4 blendingLayerServer:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ATXProactiveSuggestionClientModel *v12;
  uint64_t v13;
  NSString *clientModelId;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl(&dword_1AA841000, v11, OS_LOG_TYPE_DEFAULT, "Creating a ProactiveSuggestionClientModel object for clientModelId: %{public}@", buf, 0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)ATXProactiveSuggestionClientModel;
  v12 = -[ATXProactiveSuggestionClientModel init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    clientModelId = v12->_clientModelId;
    v12->_clientModelId = (NSString *)v13;

    objc_storeStrong((id *)&v12->_requestDelegate, a4);
    objc_storeStrong((id *)&v12->_blendingLayerServer, a5);
  }

  return v12;
}

- (void)updateSuggestions:(id)a3 feedbackMetadata:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSString *clientModelId;
  NSObject *v13;
  NSString *v14;
  NSObject *v15;
  NSString *v16;
  int v17;
  NSString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    clientModelId = self->_clientModelId;
    v17 = 138543618;
    v18 = clientModelId;
    v19 = 2048;
    v20 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1AA841000, v11, OS_LOG_TYPE_DEFAULT, "Blending: (%{public}@) Updating suggestions. Client Model produced %lu new suggestions.", (uint8_t *)&v17, 0x16u);
  }

  __atxlog_handle_blending();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_clientModelId;
    v17 = 138543362;
    v18 = v14;
    _os_log_impl(&dword_1AA841000, v13, OS_LOG_TYPE_DEFAULT, "Blending: (%{public}@) Transmiting...", (uint8_t *)&v17, 0xCu);
  }

  -[ATXProactiveSuggestionClientModel transmitSuggestionsToReceiver:feedbackMetadata:completionHandler:](self, "transmitSuggestionsToReceiver:feedbackMetadata:completionHandler:", v8, v10, v9);
  __atxlog_handle_blending();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_clientModelId;
    v17 = 138543362;
    v18 = v16;
    _os_log_impl(&dword_1AA841000, v15, OS_LOG_TYPE_DEFAULT, "Blending: (%{public}@) Done transmitting.", (uint8_t *)&v17, 0xCu);
  }

}

- (void)transmitSuggestionsToReceiver:(id)a3 feedbackMetadata:(id)a4 completionHandler:(id)a5
{
  id v8;
  ATXProactiveSuggestionClientModelXPCInterface *blendingLayerServer;
  NSString *clientModelId;
  id v11;
  _QWORD v12[5];
  id v13;

  v8 = a5;
  blendingLayerServer = self->_blendingLayerServer;
  clientModelId = self->_clientModelId;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__ATXProactiveSuggestionClientModel_transmitSuggestionsToReceiver_feedbackMetadata_completionHandler___block_invoke;
  v12[3] = &unk_1E57CF258;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  -[ATXProactiveSuggestionClientModelXPCInterface clientModelUpdatedSuggestions:feedbackMetadata:clientModelId:completion:](blendingLayerServer, "clientModelUpdatedSuggestions:feedbackMetadata:clientModelId:completion:", a3, a4, clientModelId, v12);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXProactiveSuggestionClientModel;
  -[ATXProactiveSuggestionClientModel dealloc](&v3, sel_dealloc);
}

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 blendingLayerServer:(id)a4
{
  return -[ATXProactiveSuggestionClientModel initWithClientModelId:requestDelegate:blendingLayerServer:](self, "initWithClientModelId:requestDelegate:blendingLayerServer:", a3, 0, a4);
}

void __102__ATXProactiveSuggestionClientModel_transmitSuggestionsToReceiver_feedbackMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);

  v3 = a2;
  if (v3)
  {
    __atxlog_handle_blending();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __102__ATXProactiveSuggestionClientModel_transmitSuggestionsToReceiver_feedbackMetadata_completionHandler___block_invoke_cold_1();

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v5();

}

- (void)updateSuggestions:(id)a3 feedbackMetadata:(id)a4
{
  -[ATXProactiveSuggestionClientModel updateSuggestions:feedbackMetadata:completionHandler:](self, "updateSuggestions:feedbackMetadata:completionHandler:", a3, a4, &__block_literal_global_15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionReceiver, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_blendingLayerServer, 0);
  objc_storeStrong((id *)&self->_requestDelegate, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

- (void)updateSuggestions:(id)a3
{
  -[ATXProactiveSuggestionClientModel updateSuggestions:feedbackMetadata:completionHandler:](self, "updateSuggestions:feedbackMetadata:completionHandler:", a3, 0, &__block_literal_global_14_0);
}

+ (id)clientModelIdFromClientModelType:(int64_t)a3
{
  id result;
  NSObject *v4;
  NSObject *v5;

  result = CFSTR("atx_anchor_model");
  switch(a3)
  {
    case 0:
      __atxlog_handle_blending();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:].cold.2();

      result = CFSTR("unknown");
      break;
    case 2:
      result = CFSTR("atx_anchor_model_action_conversion");
      break;
    case 3:
      result = CFSTR("atx_heuristics");
      break;
    case 4:
      result = CFSTR("atx_heuristics_action_conversion");
      break;
    case 5:
      result = CFSTR("atx_action_relevance_model");
      break;
    case 6:
      result = CFSTR("atx_action_predictions_spotlight");
      break;
    case 7:
      result = CFSTR("atx_action_predictions_homescreen");
      break;
    case 8:
      result = CFSTR("atx_action_predictions_homescreen_action_conversion");
      break;
    case 9:
      result = CFSTR("atx_action_predictions_lockscreen");
      break;
    case 10:
      result = CFSTR("atx_action_fallbacks_homescreen");
      break;
    case 11:
      result = CFSTR("atx_recent_shortcuts_homescreen");
      break;
    case 12:
      result = CFSTR("atx_recent_shortcuts_homescreen_action_conversion");
      break;
    case 13:
      result = CFSTR("atx_app_clip_predictions");
      break;
    case 14:
      result = CFSTR("atx_app_relevance_model");
      break;
    case 15:
      result = CFSTR("atx_app_predictions_spotlight");
      break;
    case 16:
      result = CFSTR("atx_app_predictions_homescreen");
      break;
    case 17:
      result = CFSTR("atx_app_predictions_app_library");
      break;
    case 18:
      result = CFSTR("atx_glanceable_information");
      break;
    case 19:
      result = CFSTR("atx_timeline_donation");
      break;
    case 20:
      result = CFSTR("atx_relevant_shortcut");
      break;
    case 21:
      result = CFSTR("atx_first_party_offers");
      break;
    case 22:
      result = CFSTR("tps_tips");
      break;
    case 23:
      result = CFSTR("atx_hero_app_predictions");
      break;
    case 24:
      result = CFSTR("atx_magical_moments");
      break;
    case 25:
      result = CFSTR("atx_debug_high_priority");
      break;
    case 26:
      result = CFSTR("atx_debug_medium_priority");
      break;
    case 27:
      result = CFSTR("atx_debug_low_priority");
      break;
    case 28:
      result = CFSTR("ck_universal_recents");
      break;
    case 29:
      result = CFSTR("cd_calendar_interaction_suggestions");
      break;
    case 30:
      result = CFSTR("ps_unstructured_calendar_interaction_suggestions");
      break;
    case 31:
      result = CFSTR("ps_unstructured_reminder_interaction_suggestions");
      break;
    case 32:
      result = CFSTR("ps_facetime_interaction_model");
      break;
    case 33:
      result = CFSTR("ps_facetime_fallback_interaction_model");
      break;
    case 34:
      result = CFSTR("ps_share_sheet_interaction_model");
      break;
    case 35:
      result = CFSTR("ps_phone_call_interaction_heuristics");
      break;
    case 36:
      result = CFSTR("ps_expanse_session_interaction_heuristics");
      break;
    case 37:
      result = CFSTR("ps_hyper_recent_interaction_heuristics");
      break;
    case 38:
      result = CFSTR("ps_photos_asset_present_interaction_heuristics");
      break;
    case 39:
      result = CFSTR("ps_photos_asset_or_memory_present_interaction_heuristics");
      break;
    case 40:
      result = CFSTR("ps_rule_mining_interaction_model");
      break;
    case 41:
      result = CFSTR("ps_knn_interaction_model");
      break;
    case 42:
      result = CFSTR("ps_share_sheet_fallback_interaction_model");
      break;
    case 43:
      result = CFSTR("atx_contextual_actions");
      break;
    case 44:
      result = CFSTR("atx_context_heuristics");
      break;
    case 45:
      result = CFSTR("atx_hero_spotlight_poi");
      break;
    case 46:
      result = CFSTR("atx_spotlight_recents");
      break;
    case 47:
      result = CFSTR("atx_hourglass");
      break;
    case 48:
      result = CFSTR("atx_action_predictions_settings");
      break;
    case 49:
      __atxlog_handle_blending();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:].cold.1();

      result = CFSTR("atx_max");
      break;
    default:
      return result;
  }
  return result;
}

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 notificationId:(id)a4
{
  return -[ATXProactiveSuggestionClientModel initWithClientModelId:requestDelegate:](self, "initWithClientModelId:requestDelegate:", a3, 0);
}

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 requestDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestionClientModel *v10;

  v6 = a3;
  v7 = a4;
  -[ATXProactiveSuggestionClientModel setupRemoteClientXPCConnection](self, "setupRemoteClientXPCConnection");
  -[ATXProactiveSuggestionClientModel remoteAsyncBlendingLayerServer](self, "remoteAsyncBlendingLayerServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    -[ATXProactiveSuggestionClientModel setupXPCListenerWithClientModelId:](self, "setupXPCListenerWithClientModelId:", v9);

  }
  v10 = -[ATXProactiveSuggestionClientModel initWithClientModelId:requestDelegate:blendingLayerServer:](self, "initWithClientModelId:requestDelegate:blendingLayerServer:", v6, v7, v8);

  return v10;
}

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 notificationId:(id)a4 blendingLayerServer:(id)a5
{
  return -[ATXProactiveSuggestionClientModel initWithClientModelId:requestDelegate:blendingLayerServer:](self, "initWithClientModelId:requestDelegate:blendingLayerServer:", a3, 0, a5);
}

- (void)setupRemoteClientXPCConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  void *v6;
  NSXPCConnection *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.ProactiveSuggestionClientModel.xpc"), 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  ATXCreateProactiveSuggestionClientModelXPCInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v5);

  v6 = (void *)-[NSString copy](self->_clientModelId, "copy");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__ATXProactiveSuggestionClientModel_setupRemoteClientXPCConnection__block_invoke;
  v10[3] = &unk_1E57CF230;
  v11 = v6;
  v7 = self->_xpcConnection;
  v8 = v6;
  -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v10);
  -[NSXPCConnection interruptionHandler](self->_xpcConnection, "interruptionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v9);

  -[NSXPCConnection resume](self->_xpcConnection, "resume");
}

void __67__ATXProactiveSuggestionClientModel_setupRemoteClientXPCConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __atxlog_handle_blending();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __67__ATXProactiveSuggestionClientModel_setupRemoteClientXPCConnection__block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (void)setupXPCListenerWithClientModelId:(id)a3
{
  objc_class *v4;
  id v5;
  NSXPCListener *v6;
  NSXPCListener *xpcListener;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("com.apple.proactive.SuggestionRequest.%@"), v5);

  v6 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v8);
  xpcListener = self->_xpcListener;
  self->_xpcListener = v6;

  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");

}

- (id)remoteAsyncBlendingLayerServer
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
}

void __67__ATXProactiveSuggestionClientModel_remoteAsyncBlendingLayerServer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__ATXProactiveSuggestionClientModel_remoteAsyncBlendingLayerServer__block_invoke_cold_1();

}

- (id)blendingLayerServer
{
  return self->_blendingLayerServer;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)updateSuggestions:(id)a3 completionHandler:(id)a4
{
  -[ATXProactiveSuggestionClientModel updateSuggestions:feedbackMetadata:completionHandler:](self, "updateSuggestions:feedbackMetadata:completionHandler:", a3, 0, a4);
}

- (void)retrieveCurrentSuggestionsWithReply:(id)a3
{
  id v4;
  ATXProactiveSuggestionClientModelXPCInterface *blendingLayerServer;
  NSString *clientModelId;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  blendingLayerServer = self->_blendingLayerServer;
  clientModelId = self->_clientModelId;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__ATXProactiveSuggestionClientModel_retrieveCurrentSuggestionsWithReply___block_invoke;
  v8[3] = &unk_1E57CF2C0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[ATXProactiveSuggestionClientModelXPCInterface retrieveSuggestionsForClientModelId:reply:](blendingLayerServer, "retrieveSuggestionsForClientModelId:reply:", clientModelId, v8);

}

void __73__ATXProactiveSuggestionClientModel_retrieveCurrentSuggestionsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__ATXProactiveSuggestionClientModel_retrieveCurrentSuggestionsWithReply___block_invoke_cold_1(a1, (uint64_t)v6, v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)clientModelIdsFromClientModelTypesArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:](ATXProactiveSuggestionClientModel, "clientModelIdFromClientModelType:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "integerValue", (_QWORD)v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (int64_t)clientModelTypeFromClientModelId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (clientModelTypeFromClientModelId__onceToken != -1)
    dispatch_once(&clientModelTypeFromClientModelId__onceToken, &__block_literal_global_119);
  objc_msgSend((id)clientModelTypeFromClientModelId__clientModelMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 0;

  return v6;
}

void __70__ATXProactiveSuggestionClientModel_clientModelTypeFromClientModelId___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_opt_new();
  v1 = (void *)clientModelTypeFromClientModelId__clientModelMap;
  clientModelTypeFromClientModelId__clientModelMap = v0;

  for (i = 1; i != 49; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)clientModelTypeFromClientModelId__clientModelMap;
    +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:](ATXProactiveSuggestionClientModel, "clientModelIdFromClientModelType:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  }
}

+ (BOOL)clientModelTypeIsEligibleForShortcutConversion:(int64_t)a3
{
  BOOL result;
  NSObject *v4;

  result = 1;
  switch(a3)
  {
    case 0:
      __atxlog_handle_blending();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:].cold.2();
      goto LABEL_7;
    case 2:
    case 4:
    case 6:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
      goto LABEL_2;
    case 49:
      __atxlog_handle_blending();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:].cold.1();
LABEL_7:

LABEL_2:
      result = 0;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)clientModelTypeIsShortcutConversion:(int64_t)a3
{
  __int128 v3;

  *((_QWORD *)&v3 + 1) = a3;
  *(_QWORD *)&v3 = a3 - 2;
  return ((unint64_t)(v3 >> 1) < 6) & (0x2Bu >> (v3 >> 1));
}

+ (int64_t)actionConversionTypeForClientModelType:(int64_t)a3
{
  int64_t v3;
  NSObject *v4;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) < 0xB && ((0x455u >> v3) & 1) != 0)
    return qword_1AA8B17A0[v3];
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    +[ATXProactiveSuggestionClientModel actionConversionTypeForClientModelType:].cold.1();

  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  NSString *clientModelId;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  int v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  __atxlog_handle_blending();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    clientModelId = self->_clientModelId;
    v13 = 138543362;
    v14 = clientModelId;
    _os_log_impl(&dword_1AA841000, v6, OS_LOG_TYPE_DEFAULT, "Client Model %{public}@ is accepting an XPC connection", (uint8_t *)&v13, 0xCu);
  }

  if (self->_requestDelegate)
  {
    objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.proactive.ProactiveSuggestionClientModel.xpc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
    {
      ATXProactiveSuggestionRealTimeProviderXPCInterface();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setExportedInterface:", v9);

      objc_msgSend(v5, "setExportedObject:", self);
      objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_124);
      objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_126);
      objc_msgSend(v5, "resume");
      v10 = 1;
    }
    else
    {
      __atxlog_handle_blending();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ATXProactiveSuggestionClientModel listener:shouldAcceptNewConnection:].cold.1();

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;

  __atxlog_handle_blending();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_cold_1();

}

void __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_125()
{
  NSObject *v0;

  __atxlog_handle_blending();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_125_cold_1();

}

- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (!-[NSString isEqualToString:](self->_clientModelId, "isEqualToString:", v8))
  {
    -[ATXProactiveSuggestionClientModel clientModelMismatchErrorResponseForRequest:clientModelId:](self, "clientModelMismatchErrorResponseForRequest:clientModelId:", v12, v8);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v10;
    v9[2](v9, v10);

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[ATXProactiveSuggestionClientModel emptyResponseForRequest:](self, "emptyResponseForRequest:", v12);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[ATXProactiveSuggestionRealTimeProviderDelegateProtocol suggestionsForInteractionSuggestionRequest:clientModelId:reply:](self->_requestDelegate, "suggestionsForInteractionSuggestionRequest:clientModelId:reply:", v12, v8, v9);
LABEL_7:

}

- (void)suggestionsForContextualActionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (!-[NSString isEqualToString:](self->_clientModelId, "isEqualToString:", v8))
  {
    -[ATXProactiveSuggestionClientModel clientModelMismatchErrorResponseForRequest:clientModelId:](self, "clientModelMismatchErrorResponseForRequest:clientModelId:", v12, v8);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v10;
    v9[2](v9, v10);

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[ATXProactiveSuggestionClientModel emptyResponseForRequest:](self, "emptyResponseForRequest:", v12);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[ATXProactiveSuggestionRealTimeProviderDelegateProtocol suggestionsForContextualActionSuggestionRequest:clientModelId:reply:](self->_requestDelegate, "suggestionsForContextualActionSuggestionRequest:clientModelId:reply:", v12, v8, v9);
LABEL_7:

}

- (void)suggestionsForIntentSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (!-[NSString isEqualToString:](self->_clientModelId, "isEqualToString:", v8))
  {
    -[ATXProactiveSuggestionClientModel clientModelMismatchErrorResponseForRequest:clientModelId:](self, "clientModelMismatchErrorResponseForRequest:clientModelId:", v12, v8);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v10;
    v9[2](v9, v10);

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[ATXProactiveSuggestionClientModel emptyResponseForRequest:](self, "emptyResponseForRequest:", v12);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[ATXProactiveSuggestionRealTimeProviderDelegateProtocol suggestionsForIntentSuggestionRequest:clientModelId:reply:](self->_requestDelegate, "suggestionsForIntentSuggestionRequest:clientModelId:reply:", v12, v8, v9);
LABEL_7:

}

- (void)pingWithCompletion:(id)a3
{
  void (*v3)(void);
  _QWORD *v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void (*)(void))v4[2];
  }
  else
  {
    objc_opt_respondsToSelector();
    v3 = (void (*)(void))v4[2];
  }
  v3();

}

- (id)emptyResponseForRequest:(id)a3
{
  id v3;
  ATXSuggestionRequestResponse *v4;

  v3 = a3;
  v4 = -[ATXSuggestionRequestResponse initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:]([ATXSuggestionRequestResponse alloc], "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", 0, 0, v3, 1, 0);

  return v4;
}

- (id)clientModelMismatchErrorResponseForRequest:(id)a3 clientModelId:(id)a4
{
  void *v5;
  NSString *clientModelId;
  id v7;
  void *v8;
  ATXSuggestionRequestResponse *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXSuggestionRequestResponse *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  clientModelId = self->_clientModelId;
  v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Wrong delegate for request. Expected %@ but found %@."), a4, clientModelId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [ATXSuggestionRequestResponse alloc];
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB2D50];
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v12, 5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXSuggestionRequestResponse initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:](v9, "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", 0, 0, v7, 3, v14);

  return v15;
}

- (ATXProactiveSuggestionClientModelXPCInterface)suggestionReceiver
{
  return self->_suggestionReceiver;
}

+ (void)refreshBlendingLayer
{
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.clientModelRefreshBlendingLayer"), "UTF8String"));
}

+ (void)refreshBlendingLayerWithReason:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AA841000, v4, OS_LOG_TYPE_DEFAULT, "Sending refresh blending notification with reason: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("duetexpertd"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.apple.duetexpertd.clientModelRefreshBlendingLayer"), 0);

  }
  else
  {
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.clientModelRefreshBlendingLayer"), "UTF8String"));
  }

}

void __67__ATXProactiveSuggestionClientModel_setupRemoteClientXPCConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, a2, a3, "Blending: Connection to Proactive Suggestion Client Model server interrupted for clientModelId: %{public}@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __67__ATXProactiveSuggestionClientModel_remoteAsyncBlendingLayerServer__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Blending: Error while communicating with Suggestion Receiver. Error: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __102__ATXProactiveSuggestionClientModel_transmitSuggestionsToReceiver_feedbackMetadata_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Blending: Error while sending the updated cache file to the Suggestion Receiver. Error: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __73__ATXProactiveSuggestionClientModel_retrieveCurrentSuggestionsWithReply___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_5(&dword_1AA841000, a2, a3, "Blending: Error retrieving suggestions for %{public}@: %{public}@.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2_0();
}

+ (void)clientModelIdFromClientModelType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "Tried to access client model id for max type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)clientModelIdFromClientModelType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "Tried to access client model id for unknown client model type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)actionConversionTypeForClientModelType:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1AA841000, v0, OS_LOG_TYPE_FAULT, "Tried to get action conversion type for unsupported client model type: %ld", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1AA841000, v0, v1, "Blending: Rejecting connection %@ without entitlement %@");
  OUTLINED_FUNCTION_2_0();
}

void __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, v0, v1, "Blending: Unexpected interruption on Proactive Suggestion Client Model XPC interface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_125_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, v0, v1, "Blending: Connection invalidated on Proactive Suggestion Client Model XPC interface. Client went away.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
