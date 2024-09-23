@implementation PPSocialHighlightServerDelegate

BOOL __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  _BOOL8 v16;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setClientProcessName:", a3);
  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x1E0CA5898];
  if (v5)
  {
    objc_msgSend(v5, "auditToken");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  objc_msgSend(v7, "bundleRecordForAuditToken:error:", &v18, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "applicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.interstellar.data-access"), v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "addObject:", v11);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "addObjectsFromArray:", v11);
  }
  if (*(_BYTE *)(a1 + 40))
  {
    v12 = CFSTR("com.apple.private.sociallayer.highlights");
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.private.sociallayer.highlights"));
    v13 = 0;
  }
  else if (*(_BYTE *)(a1 + 41))
  {
    v13 = 0;
    v12 = CFSTR("com.apple.developer.shared-with-you");
  }
  else
  {
    v13 = *(_BYTE *)(a1 + 42) == 0;
    if (*(_BYTE *)(a1 + 42))
      v12 = CFSTR("com.apple.developer.shared-with-you.collaboration");
    else
      v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setApplicationIdentifiers:", v6);
  pp_xpc_server_log_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v15;
    _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_INFO, "PPSocialHighlightServer: validateConnection applicationIdentifiers: %@", buf, 0xCu);

  }
  v16 = !v13
     && +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:connection:serviceName:](PPXPCServerHelper, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:", v12, v5, CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlight"));

  return v16;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  _BOOL4 v6;
  BOOL v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  BOOL v24;
  BOOL v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[4];
  id v35;
  BOOL v36;
  BOOL v37;
  BOOL v38;

  v27 = a3;
  v5 = a4;
  v6 = +[PPXPCServerHelper hasTrueBooleanEntitlement:connection:](PPXPCServerHelper, "hasTrueBooleanEntitlement:connection:", CFSTR("com.apple.private.sociallayer.highlights"), v5);
  v26 = +[PPXPCServerHelper hasTrueBooleanEntitlement:connection:](PPXPCServerHelper, "hasTrueBooleanEntitlement:connection:", CFSTR("com.apple.developer.shared-with-you"), v5);
  v7 = +[PPXPCServerHelper hasTrueBooleanEntitlement:connection:](PPXPCServerHelper, "hasTrueBooleanEntitlement:connection:", CFSTR("com.apple.developer.shared-with-you.collaboration"), v5);
  v8 = &protocolRef_PPSocialHighlightInternalServerProtocol;
  if (!v6)
    v8 = &protocolRef_PPSocialHighlightServerProtocol;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", *v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1C3BD6630]();
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_rankedHighlightsWithLimit_client_variant_queryId_, 0, 0);

  v14 = (void *)MEMORY[0x1C3BD6630]();
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v16 = objc_opt_class();
  v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_rankedHighlightsForSyncedItems_client_variant_queryId_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF919218);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_1E7E14C08;
  v21 = v19;
  v35 = v21;
  v36 = v6;
  v37 = v26;
  v38 = v7;
  v22 = _Block_copy(aBlock);
  v32[0] = v20;
  v32[1] = 3221225472;
  v32[2] = __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_120;
  v32[3] = &unk_1E7E1D488;
  v33 = v21;
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v30[3] = &unk_1E7E1F4F0;
  v31 = v33;
  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3;
  v28[3] = &unk_1E7E1F4F0;
  v29 = v31;
  v23 = v31;
  v24 = +[PPXPCServerHelper shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:](PPXPCServerHelper, "shouldAcceptConnection:serviceName:allowedServerInterface:allowedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:", v5, CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlight"), v9, v18, v23, v22, v32, v30, v28);

  return v24;
}

- (PPSocialHighlightServerDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPSocialHighlightServerDelegate;
  return -[PPSocialHighlightServerDelegate init](&v3, sel_init);
}

uint64_t __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_120(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", a2);
}

uint64_t __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unblockPendingQueries");
}

uint64_t __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unblockPendingQueries");
}

@end
