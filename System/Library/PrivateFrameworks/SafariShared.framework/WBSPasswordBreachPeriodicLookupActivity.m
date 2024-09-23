@implementation WBSPasswordBreachPeriodicLookupActivity

- (WBSPasswordBreachPeriodicLookupActivity)init
{
  WBSPasswordBreachPeriodicLookupActivity *v2;
  WBSPasswordBreachPeriodicLookupActivity *v3;
  WBSPasswordBreachPeriodicLookupActivity *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSPasswordBreachPeriodicLookupActivity;
  v2 = -[WBSPasswordBreachPeriodicLookupActivity init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WBSPasswordBreachPeriodicLookupActivity _registerActivity](v2, "_registerActivity");
    v4 = v3;
  }

  return v3;
}

- (void)_registerActivity
{
  NSObject *v3;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_INFO, "Lookup activity checking in.", buf, 2u);
  }
  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __60__WBSPasswordBreachPeriodicLookupActivity__registerActivity__block_invoke;
  handler[3] = &unk_1E4B3DCB0;
  handler[4] = self;
  xpc_activity_register("com.apple.Safari.PasswordBreachHelper.PeriodicLookupActivity", v4, handler);
}

void __60__WBSPasswordBreachPeriodicLookupActivity__registerActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    if (xpc_activity_should_defer(v3))
    {
      v4 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Lookup activity transitioned to state Run, but criteria are no longer satisfied. Defering.", v13, 2u);
      }
      if (!xpc_activity_set_state(v3, 3))
      {
        v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          __60__WBSPasswordBreachPeriodicLookupActivity__registerActivity__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_activityDidTransitionToRunState:", v3);
    }
  }

}

- (void)_activityDidTransitionToRunState:(id)a3
{
  _xpc_activity_s *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _xpc_activity_s *v16;
  _QWORD v17[4];
  _xpc_activity_s *v18;
  id v19;
  uint8_t buf[16];

  v4 = (_xpc_activity_s *)a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Lookup activity transitioned to state Run.", buf, 2u);
  }
  v6 = (void *)os_transaction_create();
  if (!xpc_activity_set_state(v4, 4))
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachPeriodicLookupActivity _activityDidTransitionToRunState:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__WBSPasswordBreachPeriodicLookupActivity__activityDidTransitionToRunState___block_invoke;
  v17[3] = &unk_1E4B2A118;
  v18 = v4;
  v19 = v6;
  v15 = v6;
  v16 = v4;
  -[WBSPasswordBreachPeriodicLookupActivity _runActivityWithCompletionHandler:](self, "_runActivityWithCompletionHandler:", v17);

}

void __76__WBSPasswordBreachPeriodicLookupActivity__activityDidTransitionToRunState___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    v1 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __76__WBSPasswordBreachPeriodicLookupActivity__activityDidTransitionToRunState___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
  v9 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "Lookup activity transitioned to state Done.", v10, 2u);
  }
}

- (void)_runActivityWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__WBSPasswordBreachPeriodicLookupActivity__runActivityWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E4B3DB00;
  v6 = v3;
  v4 = v3;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:](WBSPasswordBreachManager, "getSharedManagerWithCompletionHandler:", v5);

}

void __77__WBSPasswordBreachPeriodicLookupActivity__runActivityWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __77__WBSPasswordBreachPeriodicLookupActivity__runActivityWithCompletionHandler___block_invoke_2;
    v3[3] = &unk_1E4B3DA88;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(a2, "performNextSessionLookupIgnoringMinimumDelay:completionHandler:", 0, v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __77__WBSPasswordBreachPeriodicLookupActivity__runActivityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__WBSPasswordBreachPeriodicLookupActivity__registerActivity__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Lookup activity failed to transition to state Defer.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_activityDidTransitionToRunState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Lookup activity failed to transition to state Continue. Continuing, but activity may be interrupted.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __76__WBSPasswordBreachPeriodicLookupActivity__activityDidTransitionToRunState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Lookup activity failed to transition to state Done.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
