@implementation SFActivityAdvertiser

+ (id)sharedAdvertiser
{
  if (sharedAdvertiser_onceToken != -1)
    dispatch_once(&sharedAdvertiser_onceToken, &__block_literal_global_54);
  return (id)sharedAdvertiser_manager;
}

void __40__SFActivityAdvertiser_sharedAdvertiser__block_invoke()
{
  SFActivityAdvertiser *v0;
  void *v1;

  if (SFDeviceSupportsContinuity())
    v0 = objc_alloc_init(SFActivityAdvertiser);
  else
    v0 = 0;
  v1 = (void *)sharedAdvertiser_manager;
  sharedAdvertiser_manager = (uint64_t)v0;

}

- (SFActivityAdvertiser)init
{
  SFActivityAdvertiser *v2;
  SFActivityAdvertiser *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFActivityAdvertiser;
  v2 = -[SFXPCClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)SFActivityAdvertiser;
    -[SFXPCClient _activate](&v5, sel__activate);
  }
  return v3;
}

- (void)fetchLoginIDWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFActivityAdvertiser/fetchLoginIDWithCompletionHandler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SFActivityAdvertiser_fetchLoginIDWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E48336E0;
  v6 = v4;
  v8 = v6;
  -[SFActivityAdvertiser _getRemoteObjectProxyOnQueue:](self, "_getRemoteObjectProxyOnQueue:", v7);

  os_activity_scope_leave(&state);
}

uint64_t __58__SFActivityAdvertiser_fetchLoginIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loginIDWithOptions:completionHandler:", 0, *(_QWORD *)(a1 + 32));
}

- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFActivityAdvertiser/fetchSFPeerDevicesWithCompletionHandler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SFActivityAdvertiser_fetchSFPeerDevicesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E48336E0;
  v6 = v4;
  v8 = v6;
  -[SFActivityAdvertiser _getRemoteObjectProxyOnQueue:](self, "_getRemoteObjectProxyOnQueue:", v7);

  os_activity_scope_leave(&state);
}

uint64_t __64__SFActivityAdvertiser_fetchSFPeerDevicesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pairedSFPeerDevicesWithOptions:completionHandler:", 0, *(_QWORD *)(a1 + 32));
}

- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFActivityAdvertiser/fetchPeerForUUID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__SFActivityAdvertiser_fetchPeerForUUID_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E4833708;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[SFActivityAdvertiser _getRemoteObjectProxyOnQueue:](self, "_getRemoteObjectProxyOnQueue:", v11);

  os_activity_scope_leave(&state);
}

uint64_t __63__SFActivityAdvertiser_fetchPeerForUUID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "peerForUUID:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFActivityAdvertiser/advertiseAdvertisementPayload", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke;
  v11[3] = &unk_1E4833730;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[SFActivityAdvertiser _getRemoteObjectProxyOnQueue:](self, "_getRemoteObjectProxyOnQueue:", v11);

  os_activity_scope_leave(&state);
}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  handoff_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_cold_1((uint64_t)a1);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_89;
  v7[3] = &unk_1E482E2F8;
  v5 = (void *)a1[5];
  v6 = a1[6];
  v7[4] = a1[4];
  v8 = v5;
  objc_msgSend(v3, "advertiseAdvertisementPayload:options:withErrorHandler:", v8, v6, v7);

}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  handoff_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_89_cold_2(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_89_cold_1(a1);
  }

}

- (void)activityPayloadForAdvertisementPayload:(id)a3 command:(id)a4 requestedByDevice:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  handoff_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SFAdvertisementDescriptionFromPayloadData(v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v16;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_1A2830000, v14, OS_LOG_TYPE_DEFAULT, "[%@] Received payload request from %@ for %@", buf, 0x20u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__SFActivityAdvertiser_activityPayloadForAdvertisementPayload_command_requestedByDevice_withCompletionHandler___block_invoke;
  block[3] = &unk_1E4833758;
  block[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __111__SFActivityAdvertiser_activityPayloadForAdvertisementPayload_command_requestedByDevice_withCompletionHandler___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "activityAdvertiser:activityPayloadForAdvertisementPayload:command:requestedByDevice:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v2 = CFSTR("YES");
  }
  else
  {
    v2 = CFSTR("NO");
  }
  handoff_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    SFAdvertisementDescriptionFromPayloadData(*(void **)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413058;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v2;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Received payload request from %@ for %@. Handled: %@", (uint8_t *)&v8, 0x2Au);

  }
}

- (void)didSendPayloadForActivityIdentifier:(id)a3 toDevice:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__SFActivityAdvertiser_didSendPayloadForActivityIdentifier_toDevice_error___block_invoke;
  v14[3] = &unk_1E482E7D8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __75__SFActivityAdvertiser_didSendPayloadForActivityIdentifier_toDevice_error___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "activityAdvertiser:didSendPayloadForActivityIdentifier:toDevice:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v2 = CFSTR("YES");
  }
  else
  {
    v2 = CFSTR("NO");
  }
  handoff_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413058;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v2;
    _os_log_debug_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEBUG, "[%@] Did send payload to %@ for activity identifier %@. Handled: %@", (uint8_t *)&v8, 0x2Au);

  }
}

- (void)pairedDevicesChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SFActivityAdvertiser_pairedDevicesChanged___block_invoke;
  v6[3] = &unk_1E482D3A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __45__SFActivityAdvertiser_pairedDevicesChanged___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "activityAdvertiser:pairedDevicesChangedNotification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.handoff.advertising");
}

- (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6CC540);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activityPayloadForAdvertisementPayload_command_requestedByDevice_withCompletionHandler_, 2, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didSendPayloadForActivityIdentifier_toDevice_error_, 1, 0);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_pairedDevicesChanged_, 0, 0);

  return v2;
}

- (id)remoteObjectInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBEC8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_pairedSFPeerDevicesWithOptions_completionHandler_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_advertiseAdvertisementPayload_options_withErrorHandler_, 1, 0);

  return v2;
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (SFActivityAdvertiserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFActivityAdvertiserDelegate *)a3;
}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_cold_1(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFAdvertisementDescriptionFromPayloadData(*(void **)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1A2830000, v5, v6, "%@ dispatching request to advertise %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_5_0();
}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_89_cold_1(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFAdvertisementDescriptionFromPayloadData(*(void **)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1A2830000, v5, v6, "%@ advertisement request for %@ succeeded", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_5_0();
}

void __62__SFActivityAdvertiser_advertiseAdvertisementPayload_options___block_invoke_89_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  void *v8;
  __int16 v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SFAdvertisementDescriptionFromPayloadData(*(void **)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v7;
  OUTLINED_FUNCTION_1_2();
  v12 = v9;
  v13 = a2;
  _os_log_error_impl(&dword_1A2830000, a3, OS_LOG_TYPE_ERROR, "%@ dispatching advertisement request for %@ failed (%@)", (uint8_t *)&v10, 0x20u);

}

@end
