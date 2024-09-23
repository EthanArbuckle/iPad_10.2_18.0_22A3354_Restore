@implementation ATXInfoSuggestionFeedbackClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_0);
  return (id)sharedInstance__pasExprOnceResult;
}

void __49__ATXInfoSuggestionFeedbackClient_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1AF421DC4]();
  v1 = -[ATXInfoSuggestionFeedbackClient _init]([ATXInfoSuggestionFeedbackClient alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_init
{
  ATXInfoSuggestionFeedbackClient *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _PASXPCClientHelper *xpcClientHelper;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXInfoSuggestionFeedbackClient;
  v2 = -[ATXInfoSuggestionFeedbackClient init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D81640]);
    ATXInfoSuggestionXPCInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_gi();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.proactive.infoSuggestion.xpc"), v4, 0, 0, &__block_literal_global_2, &__block_literal_global_4, v5);
    xpcClientHelper = v2->_xpcClientHelper;
    v2->_xpcClientHelper = (_PASXPCClientHelper *)v6;

  }
  return v2;
}

void __40__ATXInfoSuggestionFeedbackClient__init__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_gi();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AA841000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionFeedbackClient: xpc connection interrupted.", v1, 2u);
  }

}

void __40__ATXInfoSuggestionFeedbackClient__init__block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_gi();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AA841000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionFeedbackClient: xpc connection invalidated.", v1, 2u);
  }

}

- (void)suggestionDismissed:(id)a3 isDismissalLongTerm:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  _PASXPCClientHelper *xpcClientHelper;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v8 = a5;
  xpcClientHelper = self->_xpcClientHelper;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__ATXInfoSuggestionFeedbackClient_suggestionDismissed_isDismissalLongTerm_completion___block_invoke;
  v13[3] = &unk_1E57CE778;
  v14 = v8;
  v10 = v8;
  v11 = a3;
  -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](xpcClientHelper, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userDidDismissSuggestion:isDismissalLongTerm:completion:", v11, v5, v10);

}

void __86__ATXInfoSuggestionFeedbackClient_suggestionDismissed_isDismissalLongTerm_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __86__ATXInfoSuggestionFeedbackClient_suggestionDismissed_isDismissalLongTerm_completion___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stackDidRotateProactivelyForInfoSuggestion:(id)a3 isStalenessRotation:(BOOL)a4
{
  _BOOL8 v4;
  _PASXPCClientHelper *xpcClientHelper;
  id v6;
  id v7;

  v4 = a4;
  xpcClientHelper = self->_xpcClientHelper;
  v6 = a3;
  -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](xpcClientHelper, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackDidRotateProactivelyForInfoSuggestion:isStalenessRotation:", v6, v4);

}

void __98__ATXInfoSuggestionFeedbackClient_stackDidRotateProactivelyForInfoSuggestion_isStalenessRotation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __98__ATXInfoSuggestionFeedbackClient_stackDidRotateProactivelyForInfoSuggestion_isStalenessRotation___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClientHelper, 0);
}

void __86__ATXInfoSuggestionFeedbackClient_suggestionDismissed_isDismissalLongTerm_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, a2, a3, "ATXInfoSuggestionFeedbackClient: Error recording suggestion dismissed - %@", a5, a6, a7, a8, 2u);
}

void __98__ATXInfoSuggestionFeedbackClient_stackDidRotateProactivelyForInfoSuggestion_isStalenessRotation___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, a2, a3, "ATXInfoSuggestionFeedbackClient: Error getting remote object proxy to record stack rotation - %@", a5, a6, a7, a8, 2u);
}

@end
