@implementation ICQStoragePlanRecommendation

- (ICQStoragePlanRecommendation)initWithAccount:(id)a3
{
  id v5;
  ICQStoragePlanRecommendation *v6;
  ICQStoragePlanRecommendation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQStoragePlanRecommendation;
  v6 = -[ICQStoragePlanRecommendation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

+ (id)_requestQueue
{
  if (_requestQueue_onceToken != -1)
    dispatch_once(&_requestQueue_onceToken, &__block_literal_global_3);
  return (id)_requestQueue_requestQueue;
}

void __45__ICQStoragePlanRecommendation__requestQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("quota.plan.recommendation.request", v2);
  v1 = (void *)_requestQueue_requestQueue;
  _requestQueue_requestQueue = (uint64_t)v0;

}

- (void)calculateExtraQuotaNeededToSyncIsAccountFull:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_requestQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke;
  block[3] = &unk_1E8B387A8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  os_signpost_id_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  os_signpost_id_t v28;
  uint64_t v29;
  uint8_t buf[8];
  uint64_t v31;
  Class (*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  +[ICQStoragePlanRecommendationCache sharedInstance](ICQStoragePlanRecommendationCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extraQuotaNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Returning cached storage recommendation data.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Cache does not exist or expired. Reaching out to daemon to calculate and return estimated total quota usage after turning on all apps.", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = _ICQSignpostCreateWithObject(v6, v7);
    v10 = v9;

    _ICQSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "TotalQuotaUsageAfterTurnOnSync", " enableTelemetry=YES ", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_cold_1(v8, v13);

    v35 = 0;
    v36 = &v35;
    v37 = 0x2050000000;
    v14 = (void *)getINDaemonConnectionClass_softClass;
    v38 = getINDaemonConnectionClass_softClass;
    v15 = MEMORY[0x1E0C809B0];
    if (!getINDaemonConnectionClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __getINDaemonConnectionClass_block_invoke;
      v33 = &unk_1E8B384E8;
      v34 = &v35;
      __getINDaemonConnectionClass_block_invoke((uint64_t)buf);
      v14 = (void *)v36[3];
    }
    v16 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v35, 8);
    v17 = objc_alloc_init(v16);
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3;
    v26[3] = &unk_1E8B38758;
    v28 = v8;
    v29 = v10;
    v27 = *(id *)(a1 + 40);
    objc_msgSend(v17, "synchronousDaemonWithErrorHandler:", v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "aa_altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(unsigned __int8 *)(a1 + 48);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_5;
    v22[3] = &unk_1E8B38780;
    v24 = v8;
    v25 = v10;
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v18, "calculateExtraQuotaNeededToSyncForAccountWithID:isAccountFull:completion:", v20, v21, v22);

  }
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_2(v4);

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "TotalQuotaUsageAfterTurnOnSync", ", v9, 2u);
  }

  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[ICQStoragePlanRecommendation calculateExtraQuotaNeededToSyncIsAccountFull:completion:]_block_invoke";
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "%s request completed.", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_5_cold_2((uint64_t)v6, v8);
LABEL_10:

    goto LABEL_11;
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
    v8 = objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = (const char *)v8;
      _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Caching storage recommendation result with expiry: %@", (uint8_t *)&v15, 0xCu);
    }

    +[ICQStoragePlanRecommendationCache sharedInstance](ICQStoragePlanRecommendationCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExtraQuotaNeeded:expiry:", v5, v8);

    goto LABEL_10;
  }
LABEL_11:
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = a1[5];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v12, OS_SIGNPOST_INTERVAL_END, v13, "TotalQuotaUsageAfterTurnOnSync", ", (uint8_t *)&v15, 2u);
  }

  _ICQSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_cold_1(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_DEBUG, "SIGNPOST BEGIN [id: %hu]: TotalQuotaUsageAfterTurnOnSync  enableTelemetry=YES ", (uint8_t *)v2, 8u);
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) TotalQuotaUsageAfterTurnOnSync ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_ERROR, "XPC Error while fetching total quota usage.", v1, 2u);
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_5_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch total quota usage with error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

@end
