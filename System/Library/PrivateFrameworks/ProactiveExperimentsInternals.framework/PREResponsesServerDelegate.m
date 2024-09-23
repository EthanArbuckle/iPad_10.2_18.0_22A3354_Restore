@implementation PREResponsesServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v29 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558CB9F8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x2276ADFCC]();
  v8 = objc_alloc(MEMORY[0x24BDBCF20]);
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_preResponseItemsForMessage_maximumResponses_conversationTurns_context_time_language_recipientHandles_modelFilePath_modelConfigPath_espressoBinFilePath_vocabFilePath_registerDisplayed_includeCustomResponses_includeResponsesToRobots_completion_, 2, 0);

  v11 = (void *)MEMORY[0x2276ADFCC]();
  v12 = objc_alloc(MEMORY[0x24BDBCF20]);
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_preResponseItemsForMessage_maximumResponses_conversationTurns_context_time_language_recipientHandles_modelFilePath_modelConfigPath_espressoBinFilePath_vocabFilePath_registerDisplayed_includeCustomResponses_includeResponsesToRobots_completion_, 6, 0);

  v15 = (void *)MEMORY[0x2276ADFCC]();
  v16 = objc_alloc(MEMORY[0x24BDBCF20]);
  v17 = objc_opt_class();
  v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_predictForMessage_conversationTurns_language_plistPath_espressoBinPath_vocabPath_heads_completion_, 1, 0);

  v19 = (void *)MEMORY[0x2276ADFCC]();
  v20 = objc_alloc(MEMORY[0x24BDBCF20]);
  v21 = objc_opt_class();
  v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v19);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_predictForMessage_conversationTurns_language_plistPath_espressoBinPath_vocabPath_heads_completion_, 6, 0);

  v23 = (void *)objc_opt_new();
  v24 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __65__PREResponsesServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v32[3] = &unk_24EF87240;
  v25 = v23;
  v33 = v25;
  v26 = (void *)MEMORY[0x2276AE11C](v32);
  v30[0] = v24;
  v30[1] = 3221225472;
  v30[2] = __65__PREResponsesServerDelegate_listener_shouldAcceptNewConnection___block_invoke_27;
  v30[3] = &unk_24EF87268;
  v31 = v25;
  v27 = v25;
  LOBYTE(v22) = +[PREXPCServerHelper shouldAcceptConnection:serviceName:whitelistedServerInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](PREXPCServerHelper, "shouldAcceptConnection:serviceName:whitelistedServerInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v5, CFSTR("com.apple.proactive.experiments.responses"), v6, v27, v26, v30, &__block_literal_global, &__block_literal_global_30);

  return (char)v22;
}

BOOL __65__PREResponsesServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v16;
  int *v17;
  char *v18;
  int v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setClientProcessName:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A5B0]), "initWithProcessIdentifier:", objc_msgSend(v5, "processIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "setBundleIdResolver:", v7);

  v8 = +[PREXPCServerHelper hasTrueBooleanEntitlement:connection:](PREXPCServerHelper, "hasTrueBooleanEntitlement:connection:", CFSTR("com.apple.proactive.experiments.responses"), v5);
  if (!v8)
  {
    v9 = objc_msgSend(v6, "length");
    pre_sv_xpc_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v11)
      {
        v19 = 138412546;
        *(_QWORD *)v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(_QWORD *)&v20[10] = CFSTR("com.apple.proactive.experiments.responses");
        v12 = "Rejecting connection from %@ to %@ due to missing entitlement";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_227234000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v19, v14);
      }
    }
    else if (v11)
    {
      v16 = objc_msgSend(v5, "processIdentifier");
      v17 = __error();
      v18 = strerror(*v17);
      v19 = 67109634;
      *(_DWORD *)v20 = v16;
      *(_WORD *)&v20[4] = 2112;
      *(_QWORD *)&v20[6] = CFSTR("com.apple.proactive.experiments.responses");
      *(_WORD *)&v20[14] = 2080;
      *(_QWORD *)&v20[16] = v18;
      v12 = "Rejecting connection from %d to %@ due to failed entitlement check (error: %s)";
      v13 = v10;
      v14 = 28;
      goto LABEL_9;
    }

  }
  return v8;
}

uint64_t __65__PREResponsesServerDelegate_listener_shouldAcceptNewConnection___block_invoke_27(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", a2);
}

@end
