@implementation SiriAnalyticsSensitiveConditionsObservers

- (SiriAnalyticsSensitiveConditionsObservers)initWithQueue:(id)a3
{
  id v5;
  SiriAnalyticsSensitiveConditionsObservers *v6;
  SiriAnalyticsSensitiveConditionsObservers *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriAnalyticsSensitiveConditionsObservers;
  v6 = -[SiriAnalyticsSensitiveConditionsObservers init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)addSensitiveConditionsObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SiriAnalyticsSensitiveConditionsObservers *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__SiriAnalyticsSensitiveConditionsObservers_addSensitiveConditionsObserver___block_invoke;
  v7[3] = &unk_1E4357A90;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)pollAllObserversWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke;
  v7[3] = &unk_1E4357C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = SiriAnalyticsLogContextSensitiveConditions;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextSensitiveConditions, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 136315394;
    v24 = "-[SiriAnalyticsSensitiveConditionsObservers pollAllObserversWithCompletion:]_block_invoke";
    v25 = 2112;
    v26 = v13;
    _os_log_debug_impl(&dword_1A025F000, v2, OS_LOG_TYPE_DEBUG, "%s observers: %@", buf, 0x16u);
  }
  v3 = dispatch_group_create();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v10)
        {
          dispatch_group_enter(v3);
          v16[0] = v6;
          v16[1] = 3221225472;
          v16[2] = __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke_1;
          v16[3] = &unk_1E4357B10;
          v17 = v3;
          objc_msgSend(v10, "pollConditionStateWithCompletion:", v16);

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke_2;
  v14[3] = &unk_1E4357C20;
  v15 = v11;
  dispatch_group_notify(v3, v12, v14);

}

void __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke_1(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76__SiriAnalyticsSensitiveConditionsObservers_addSensitiveConditionsObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = SiriAnalyticsLogContextSensitiveConditions;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextSensitiveConditions, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "-[SiriAnalyticsSensitiveConditionsObservers addSensitiveConditionsObserver:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1A025F000, v2, OS_LOG_TYPE_INFO, "%s Registering sensitive conditions observer: %@", (uint8_t *)&v9, 0x16u);
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  }
  return objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
}

@end
