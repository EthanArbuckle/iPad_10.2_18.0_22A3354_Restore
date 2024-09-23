@implementation SWCGetServerInterface

void ___SWCGetServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[3];
  _QWORD v37[2];
  _QWORD v38[3];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[5];
  _QWORD v44[8];

  v44[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9A8CE0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED1B6260;
  qword_1ED1B6260 = v0;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  v44[2] = objc_opt_class();
  v44[3] = objc_opt_class();
  v44[4] = objc_opt_class();
  v44[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v43[0] = objc_opt_class();
  v43[1] = objc_opt_class();
  v43[2] = objc_opt_class();
  v43[3] = objc_opt_class();
  v43[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_waitForSiteApprovalWithServiceSpecifier_completionHandler_, 0, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_waitForSiteApprovalWithServiceSpecifier_completionHandler_, 0, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_waitForSiteApprovalWithServiceSpecifier_completionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_, 0, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_, 1, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_, 3, 0);
  v6 = (void *)qword_1ED1B6260;
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_, 0, 1);

  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_addServiceWithServiceSpecifier_completionHandler_, 0, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_addServiceWithServiceSpecifier_completionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeServiceWithServiceSpecifier_completionHandler_, 0, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeServiceWithServiceSpecifier_completionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_setDetails_forServiceWithServiceSpecifier_completionHandler_, 0, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setDetails_forServiceWithServiceSpecifier_completionHandler_, 1, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setDetails_forServiceWithServiceSpecifier_completionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setUserApprovalState_forServiceWithServiceSpecifier_completionHandler_, 1, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setUserApprovalState_forServiceWithServiceSpecifier_completionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_addAllAppsWithCompletionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x1E0C81318], sel_showWithVerbosity_isTTY_fileDescriptor_completionHandler_, 2, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_resetWithCompletionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getServiceSettingsWithServiceSpecifier_completionHandler_, 0, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getServiceSettingsWithServiceSpecifier_completionHandler_, 0, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getServiceSettingsWithServiceSpecifier_completionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_commitServiceSettings_completionHandler_, 0, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_commitServiceSettings_completionHandler_, 0, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_commitServiceSettings_completionHandler_, 1, 1);
  v10 = (void *)qword_1ED1B6260;
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_removeSettingsForKeys_serviceType_completionHandler_, 0, 0);

  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeSettingsForKeys_serviceType_completionHandler_, 1, 1);
  v14 = (void *)qword_1ED1B6260;
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithArray:", v16);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_removeSettingsForKeys_serviceSpecifier_completionHandler_, 0, 0);

  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeSettingsForKeys_serviceSpecifier_completionHandler_, 1, 0);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_removeSettingsForKeys_serviceSpecifier_completionHandler_, 1, 1);
  v18 = (void *)qword_1ED1B6260;
  v19 = objc_alloc(MEMORY[0x1E0C99E60]);
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_getTrackingDomains_sources_completionHandler_, 0, 0);

  v22 = (void *)qword_1ED1B6260;
  v23 = objc_alloc(MEMORY[0x1E0C99E60]);
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithArray:", v24);
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_getTrackingDomains_sources_completionHandler_, 0, 1);

  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDeveloperModeEnabledWithCompletionHandler_, 0, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDeveloperModeEnabledWithCompletionHandler_, 1, 1);
  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setDeveloperModeEnabled_completionHandler_, 1, 1);
  v26 = (void *)qword_1ED1B6260;
  v27 = objc_alloc(MEMORY[0x1E0C99E60]);
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithArray:", v28);
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler_, 0, 0);

  v30 = (void *)qword_1ED1B6260;
  v31 = objc_alloc(MEMORY[0x1E0C99E60]);
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithArray:", v32);
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler_, 1, 0);

  objc_msgSend((id)qword_1ED1B6260, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler_, 1, 1);
}

@end
