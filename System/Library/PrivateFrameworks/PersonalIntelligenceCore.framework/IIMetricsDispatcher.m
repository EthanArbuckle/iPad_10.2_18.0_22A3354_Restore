@implementation IIMetricsDispatcher

- (IIMetricsDispatcher)init
{
  IIMetricsDispatcher *v2;
  uint64_t v3;
  IISMetricStore *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IIMetricsDispatcher;
  v2 = -[IIMetricsDispatcher init](&v6, sel_init);
  if (v2)
  {
    +[IISMetricStore sharedInstance](IISMetricStore, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (IISMetricStore *)v3;

  }
  return v2;
}

- (void)registerEnrichmentProvider:(id)a3
{
  -[IISMetricStore registerEnrichmentProvider:](self->_store, "registerEnrichmentProvider:", a3);
}

- (void)registerMessagesListener:(id)a3
{
  -[IISMetricStore registerMessageListener:](self->_store, "registerMessageListener:", a3);
}

- (void)logMessage:(id)a3 messageName:(id)a4
{
  id v4;

  v4 = -[IISMetricStore saveMessage:backend:messageIdentifier:](self->_store, "saveMessage:backend:messageIdentifier:", a3, 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  return (id)sharedInstance__pasExprOnceResult;
}

+ (void)registerXPCActivity
{
  xpc_object_t v4;
  NSObject *v5;
  uint8_t v6[16];
  _QWORD handler[6];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.proactive.PersonalIntelligence");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E0C80798], 1uLL);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__IIMetricsDispatcher_registerXPCActivity__block_invoke;
  handler[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a2;
  handler[5] = a1;
  xpc_activity_register("com.apple.proactive.PersonalIntelligence.PersonalIntelligenceMetrics", v4, handler);
  ii_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C3B51000, v5, OS_LOG_TYPE_INFO, "IIMetricsDispatcher: registered task PersonalIntelligenceCoreMetrics", v6, 2u);
  }

}

void __42__IIMetricsDispatcher_registerXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  uint8_t v14[16];
  _QWORD aBlock[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v3 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__IIMetricsDispatcher_registerXPCActivity__block_invoke_2;
  aBlock[3] = &unk_1E7E5D778;
  v17 = &v18;
  v4 = v3;
  v16 = v4;
  v5 = _Block_copy(aBlock);
  +[IISMetricStore sharedInstance](IISMetricStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldSendMessages");

  if ((v7 & 1) == 0)
  {
    ii_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      goto LABEL_15;
    }
    *(_WORD *)v14 = 0;
    v12 = "IIMetricsDispatcher: not sending messages as today is not scheduled to send.";
LABEL_13:
    _os_log_impl(&dword_1C3B51000, v11, OS_LOG_TYPE_DEFAULT, v12, v14, 2u);
    goto LABEL_14;
  }
  +[IISMetricStore sharedInstance](IISMetricStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sendMessagesWithShouldContinue:", v5);

  if ((v9 & 1) == 0)
  {
    ii_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1C3B51000, v10, OS_LOG_TYPE_DEFAULT, "IIMetricsDispatcher: was unable to complete sending of logs.", v14, 2u);
    }

  }
  if (*((_BYTE *)v19 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("IIMetricsDispatcher.m"), 96, CFSTR("Unexpected failure of deferral"));

    }
    ii_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)v14 = 0;
    v12 = "IIMetricsDispatcher: deferring sending of logs";
    goto LABEL_13;
  }
LABEL_15:

  _Block_object_dispose(&v18, 8);
}

uint64_t __42__IIMetricsDispatcher_registerXPCActivity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __37__IIMetricsDispatcher_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD74CC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
