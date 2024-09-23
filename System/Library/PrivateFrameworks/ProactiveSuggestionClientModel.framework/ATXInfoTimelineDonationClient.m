@implementation ATXInfoTimelineDonationClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_0, &__block_literal_global_8);
  return (id)sharedInstance__pasExprOnceResult_0;
}

void __47__ATXInfoTimelineDonationClient_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1AF421DC4]();
  v1 = -[ATXInfoTimelineDonationClient _init]([ATXInfoTimelineDonationClient alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_init
{
  ATXInfoTimelineDonationClient *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _PASXPCClientHelper *xpcClientHelper;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXInfoTimelineDonationClient;
  v2 = -[ATXInfoTimelineDonationClient init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D81640]);
    ATXInfoSuggestionXPCInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_timeline();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.proactive.infoSuggestion.xpc"), v4, 0, 0, &__block_literal_global_2_0, &__block_literal_global_4_0, v5);
    xpcClientHelper = v2->_xpcClientHelper;
    v2->_xpcClientHelper = (_PASXPCClientHelper *)v6;

  }
  return v2;
}

void __38__ATXInfoTimelineDonationClient__init__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_timeline();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AA841000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineDonationClient: xpc connection interrupted.", v1, 2u);
  }

}

void __38__ATXInfoTimelineDonationClient__init__block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_timeline();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AA841000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineDonationClient: xpc connection invalidated.", v1, 2u);
  }

}

- (void)timelineDidReloadForWidget:(id)a3 parentApp:(id)a4 withEntries:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  _PASXPCClientHelper *xpcClientHelper;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a6;
  xpcClientHelper = self->_xpcClientHelper;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __93__ATXInfoTimelineDonationClient_timelineDidReloadForWidget_parentApp_withEntries_completion___block_invoke;
  v21 = &unk_1E57CF030;
  v22 = v10;
  v23 = v11;
  v13 = v11;
  v14 = v10;
  v15 = a5;
  v16 = a4;
  -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](xpcClientHelper, "remoteObjectProxyWithErrorHandler:", &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timelineDidReloadForWidget:parentApp:withEntries:completion:", v14, v16, v15, v13, v18, v19, v20, v21);

}

void __93__ATXInfoTimelineDonationClient_timelineDidReloadForWidget_parentApp_withEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __93__ATXInfoTimelineDonationClient_timelineDidReloadForWidget_parentApp_withEntries_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClientHelper, 0);
}

void __93__ATXInfoTimelineDonationClient_timelineDidReloadForWidget_parentApp_withEntries_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "ATXInfoTimelineDonationClient: Error reloading timeline for widget %@ - %@", (uint8_t *)&v4, 0x16u);
}

@end
