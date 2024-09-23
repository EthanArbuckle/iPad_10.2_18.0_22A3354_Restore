@implementation PREResponsesClient

- (PREResponsesClient)init
{
  PREResponsesClient *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PREXPCClientHelpers *v14;
  PREXPCClientHelpers *clientHelpers;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PREResponsesClient;
  v2 = -[PREResponsesClient init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF8E0A60);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1C3BD39FC]();
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_preResponseItemsForMessage_maximumResponses_conversationTurns_context_time_language_recipientHandles_modelFilePath_modelConfigPath_espressoBinFilePath_vocabFilePath_registerDisplayed_includeCustomResponses_includeResponsesToRobots_completion_, 0, 1);

    v8 = (void *)MEMORY[0x1C3BD39FC]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_predictForMessage_conversationTurns_language_plistPath_espressoBinPath_vocabPath_heads_completion_, 0, 1);

    v14 = -[PREXPCClientHelpers initWithServiceName:whitelistedServerInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([PREXPCClientHelpers alloc], "initWithServiceName:whitelistedServerInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.proactive.experiments.responses"), v3, v2, &__block_literal_global_1853, &__block_literal_global_29);
    clientHelpers = v2->_clientHelpers;
    v2->_clientHelpers = v14;

  }
  return v2;
}

- (id)_remoteObjectProxy
{
  return -[PREXPCClientHelpers remoteObjectProxy](self->_clientHelpers, "remoteObjectProxy");
}

- (void)preResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationTurns:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 recipientHandles:(id)a9 modelFilePath:(id)a10 modelConfigPath:(id)a11 espressoBinFilePath:(id)a12 vocabFilePath:(id)a13 registerDisplayed:(BOOL)a14 includeCustomResponses:(BOOL)a15 includeResponsesToRobots:(BOOL)a16 completion:(id)a17
{
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[16];

  v36 = a17;
  v35 = a13;
  v34 = a12;
  v33 = a11;
  v32 = a10;
  v31 = a9;
  v29 = a8;
  v28 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a3;
  pre_responses_handle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C35DB000, v25, OS_LOG_TYPE_DEFAULT, "PREResponsesClient initiating call to suggestd - preResponseItemsForMessage", buf, 2u);
  }

  -[PREResponsesClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v27) = a16;
  LOWORD(v27) = __PAIR16__(a15, a14);
  objc_msgSend(v26, "preResponseItemsForMessage:maximumResponses:conversationTurns:context:time:language:recipientHandles:modelFilePath:modelConfigPath:espressoBinFilePath:vocabFilePath:registerDisplayed:includeCustomResponses:includeResponsesToRobots:completion:", v24, a4, v23, v22, v28, v29, v31, v32, v33, v34, v35, v27, v36);

}

- (void)predictForMessage:(id)a3 conversationTurns:(id)a4 language:(id)a5 plistPath:(id)a6 espressoBinPath:(id)a7 vocabPath:(id)a8 heads:(id)a9 completion:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[16];

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  pre_responses_handle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C35DB000, v25, OS_LOG_TYPE_DEFAULT, "PREResponsesClient initiating call to suggestd - predictForMessage", buf, 2u);
  }

  -[PREResponsesClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predictForMessage:conversationTurns:language:plistPath:espressoBinPath:vocabPath:heads:completion:", v24, v23, v22, v21, v20, v19, v18, v17);

}

- (void)registerResponse:(id)a3 position:(id)a4 isCanned:(BOOL)a5 isUsingQuickResponses:(BOOL)a6 locale:(id)a7 modelConfigPath:(id)a8 vocabPath:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[16];

  v11 = a6;
  v12 = a5;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a4;
  v20 = a3;
  pre_responses_handle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C35DB000, v21, OS_LOG_TYPE_DEFAULT, "PREResponsesClient initiating call to suggestd - registerResponse", buf, 2u);
  }

  -[PREResponsesClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerResponse:position:isCanned:isUsingQuickResponses:locale:modelConfigPath:vocabPath:", v20, v19, v12, v11, v18, v17, v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelpers, 0);
}

void __26__PREResponsesClient_init__block_invoke_28()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  pre_xpc_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.proactive.experiments.responses");
    _os_log_impl(&dword_1C35DB000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }

}

void __26__PREResponsesClient_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  pre_xpc_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.proactive.experiments.responses");
    _os_log_error_impl(&dword_1C35DB000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PREResponsesClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken8 != -1)
    dispatch_once(&sharedInstance__pasOnceToken8, block);
  return (id)sharedInstance__pasExprOnceResult_1859;
}

void __36__PREResponsesClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1859;
  sharedInstance__pasExprOnceResult_1859 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
