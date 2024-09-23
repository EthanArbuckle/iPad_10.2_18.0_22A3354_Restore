@implementation PPQuickTypeBroker

- (void)warmUpWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PPQuickTypeBroker _remoteObjectProxy](self, "_remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "warmUpWithCompletion:", v4);

}

- (id)_remoteObjectProxy
{
  return -[PPXPCClientHelper remoteObjectProxy](self->_clientHelper, "remoteObjectProxy");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PPQuickTypeBroker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken8 != -1)
    dispatch_once(&sharedInstance__pasOnceToken8, block);
  return (id)sharedInstance__pasExprOnceResult;
}

- (PPQuickTypeBroker)init
{
  PPQuickTypeBroker *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  PPXPCClientHelper *v16;
  PPXPCClientHelper *clientHelper;
  PPClientFeedbackHelper *v18;
  PPClientFeedbackHelper *clientFeedbackHelper;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PPQuickTypeBroker;
  v2 = -[PPQuickTypeBroker init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01B828);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x18D7805AC]();
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_quickTypeItemsWithQuery_limit_completion_, 0, 1);

    v8 = (void *)MEMORY[0x18D7805AC]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_quickTypeItemsWithLanguageModelingTokens_localeIdentifier_recipients_bundleIdentifier_limit_completion_, 0, 1);

    v12 = (void *)MEMORY[0x18D7805AC]();
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_recentQuickTypeItemsForRecipients_completion_, 0, 1);

    v16 = -[PPXPCClientHelper initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PPXPCClientHelper alloc], "initWithServiceName:allowedServerInterface:allowedClientInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.PersonalizationPortrait.QuickType"), v3, 0, 0, &__block_literal_global_176, &__block_literal_global_60);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v16;

    v18 = -[PPClientFeedbackHelper initWithParentObject:]([PPClientFeedbackHelper alloc], "initWithParentObject:", v2);
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v18;

  }
  return v2;
}

- (void)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[PPQuickTypeBroker _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quickTypeItemsWithQuery:limit:completion:", v9, a4, v8);

}

- (void)quickTypeItemsWithLanguageModelingTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6 limit:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t v26[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, _QWORD, void *))a8;
  if (!v14)
    goto LABEL_7;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_7;
  v20 = (void *)v19;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("photosharing"));

  if (v22)
  {
    pp_xpc_client_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_18BE3A000, v23, OS_LOG_TYPE_INFO, "ignoring quickTypeItemsWithLanguageModelingTokens call for photosharing", v26, 2u);
    }

    v24 = (void *)objc_opt_new();
    v18[2](v18, MEMORY[0x1E0C9AA60], v24);

  }
  else
  {
LABEL_7:
    -[PPQuickTypeBroker _remoteObjectProxy](self, "_remoteObjectProxy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "quickTypeItemsWithLanguageModelingTokens:localeIdentifier:recipients:bundleIdentifier:limit:completion:", v14, v15, v16, v17, a7, v18);

  }
}

- (void)recentQuickTypeItemsForRecipients:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PPQuickTypeBroker _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recentQuickTypeItemsForRecipients:completion:", v7, v6);

}

- (void)hibernateWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PPQuickTypeBroker _remoteObjectProxy](self, "_remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hibernateWithCompletion:", v4);

}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "isMapped"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPQuickTypeBroker.m"), 117, CFSTR("You cannot send mapped feedback on named entities. Please use PPFeedback to create the feedback for named entities."));

  }
  -[PPQuickTypeBroker clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPQuickTypeBroker.m"), 118, CFSTR("The clientIdentifier property must be set on the %@ in order to send feedback."), v17);

  }
  -[PPQuickTypeBroker clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientIdentifier:", v11);

  -[PPQuickTypeBroker _remoteObjectProxy](self, "_remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__PPQuickTypeBroker_registerFeedback_completion___block_invoke;
  v18[3] = &unk_1E226C218;
  v18[4] = self;
  v19 = v7;
  v13 = v7;
  objc_msgSend(v12, "registerFeedback:completion:", v8, v18);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  PPClientFeedbackHelper *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_clientFeedbackHelper;
  else
    v4 = 0;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __49__PPQuickTypeBroker_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  if (v5)
  {
    pp_xpc_client_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_ERROR, "Error from _remoteObjectProxy %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

void __35__PPQuickTypeBroker_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
