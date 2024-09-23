@implementation NSXPCConnection

void __74__NSXPCConnection_TUCallServicesAdditions__callServicesServerXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E72E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)callServicesServerXPCInterface_xpcInterface;
  callServicesServerXPCInterface_xpcInterface = v0;

  v2 = (void *)callServicesServerXPCInterface_xpcInterface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_fetchCurrentCallUpdates_, 0, 1);

  v6 = (void *)callServicesServerXPCInterface_xpcInterface;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_requestInitialState_, 0, 1);

  v10 = (void *)callServicesServerXPCInterface_xpcInterface;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_dialWithRequest_reply_, 1, 1);

  v14 = (void *)callServicesServerXPCInterface_xpcInterface;
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_pullCallFromClientUsingHandoffActivityUserInfo_reply_, 1, 1);

  v18 = (void *)callServicesServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_pullPersistedChannel_, 1, 1);

  v20 = (void *)callServicesServerXPCInterface_xpcInterface;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_localRoutesByUniqueIdentifier_, 0, 1);

  v25 = (void *)callServicesServerXPCInterface_xpcInterface;
  v26 = (void *)MEMORY[0x1E0C99E60];
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_pairedHostDeviceRoutesByUniqueIdentifier_, 0, 1);

  v30 = (void *)callServicesServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_setSharingScreen_attributes_forCallWithUniqueProxyIdentifier_, 1, 0);

  v32 = (void *)callServicesServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_setScreenShareAttributesForCallWithUniqueProxyIdentifier_attributes_, 1, 0);

  v34 = (void *)callServicesServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_registerAnonymousXPCEndpoint_, 0, 0);

  v36 = (void *)callServicesServerXPCInterface_xpcInterface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_fetchAnonymousXPCEndpoint_, 0, 1);

  v38 = (void *)callServicesServerXPCInterface_xpcInterface;
  v39 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_setEmergencyMediaItems_forCallWithUniqueProxyIdentifier_, 0, 0);

  v42 = (void *)callServicesServerXPCInterface_xpcInterface;
  v43 = (void *)MEMORY[0x1E0C99E60];
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  objc_msgSend(v43, "setWithObjects:", v44, v45, objc_opt_class(), 0);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_performRecordingRequest_completion_, 0, 1);

}

void __74__NSXPCConnection_TUCallServicesAdditions__callServicesClientXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3C24A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)callServicesClientXPCInterface_xpcInterface;
  callServicesClientXPCInterface_xpcInterface = v0;

  v2 = (void *)callServicesClientXPCInterface_xpcInterface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_handleCurrentCallsChanged_callDisconnected_, 0, 0);

  v6 = (void *)callServicesClientXPCInterface_xpcInterface;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_handleNotificationName_forCallWithUniqueProxyIdentifier_userInfo_, 2, 0);

  v15 = (void *)callServicesClientXPCInterface_xpcInterface;
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_handleLocalRoutesByUniqueIdentifierUpdated_, 0, 0);

  v20 = (void *)callServicesClientXPCInterface_xpcInterface;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_handlePairedHostDeviceRoutesByUniqueIdentifierUpdated_, 0, 0);

}

@end
