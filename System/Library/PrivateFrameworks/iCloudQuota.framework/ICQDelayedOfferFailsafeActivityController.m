@implementation ICQDelayedOfferFailsafeActivityController

+ (void)_runWithDaemon:(id)a3 errorCallback:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[8];
  uint64_t v17;
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = (void (**)(id, void *))a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v7 = (void *)getINDaemonConnectionClass_softClass_2;
  v24 = getINDaemonConnectionClass_softClass_2;
  v8 = MEMORY[0x1E0C809B0];
  if (!getINDaemonConnectionClass_softClass_2)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getINDaemonConnectionClass_block_invoke_2;
    v19 = &unk_1E8B384E8;
    v20 = &v21;
    __getINDaemonConnectionClass_block_invoke_2((uint64_t)buf);
    v7 = (void *)v22[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v21, 8);
  v10 = objc_alloc_init(v9);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __74__ICQDelayedOfferFailsafeActivityController__runWithDaemon_errorCallback___block_invoke;
  v14[3] = &unk_1E8B39550;
  v15 = v6;
  v11 = v6;
  objc_msgSend(v10, "daemonWithErrorHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully fetched the IND XPC Daemon.", buf, 2u);
  }

  v5[2](v5, v12);
}

void __74__ICQDelayedOfferFailsafeActivityController__runWithDaemon_errorCallback___block_invoke(uint64_t a1, void *a2)
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
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__ICQDelayedOfferFailsafeActivityController__runWithDaemon_errorCallback___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)startActivityWithDelaySecs:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;
  uint8_t buf[4];
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = a3;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "[SUBD] Delayed offer failsafe will trigger in [%lld secs].", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke;
  v9[3] = &unk_1E8B3A178;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(a1, "_runWithDaemon:errorCallback:", v9, v8);

}

void __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke_2;
  v4[3] = &unk_1E8B3A150;
  v3 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(a2, "startDelayedOfferFailsafeActivityWithDelaySecs:completion:", v6, v4);

}

void __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke_2_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully installed failsafe activity with delaySecs=[%lld].", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)stopActivityWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "[SUBD] Clearing up the failsafe activity because subd just called us.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke;
  v7[3] = &unk_1E8B3A1A0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "_runWithDaemon:errorCallback:", v7, v6);

}

void __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke_2;
  v3[3] = &unk_1E8B39550;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "stopDelayedOfferFailsafeActivityWithCompletion:", v3);

}

void __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully stopped the failsafe activity.", v12, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__ICQDelayedOfferFailsafeActivityController__runWithDaemon_errorCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, a2, a3, "[SUBD] XPC Error while fetching daemon for failsafe activity. error=[%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

void __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_ERROR, "[SUBD] Failed to install failsafe activity with delaySecs=[%lld] with error=[%@]", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

void __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, a2, a3, "[SUBD] Failed to stop the failsafe activity with error=[%@].", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

@end
