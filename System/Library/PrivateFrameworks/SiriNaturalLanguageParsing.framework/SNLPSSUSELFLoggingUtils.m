@implementation SNLPSSUSELFLoggingUtils

+ (void)logUserRequestStarted:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0D99EB0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setExists:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SNLPSSUSELFLoggingUtils_logUserRequestStarted___block_invoke;
  v8[3] = &unk_1E7BED7C8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "emitEventUserRequest:userRequestContextBuilder:", v5, v8);

}

+ (void)logUserRequestEnded:(id)a3 triggeredCacheEntryInfos:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0D99E98];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setTriggeredCacheEntryInfos:", v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__SNLPSSUSELFLoggingUtils_logUserRequestEnded_triggeredCacheEntryInfos___block_invoke;
  v11[3] = &unk_1E7BED7C8;
  v12 = v9;
  v10 = v9;
  objc_msgSend(a1, "emitEventUserRequest:userRequestContextBuilder:", v8, v11);

}

+ (void)logUserRequestFailed:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0D99EA0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SNLPSSUSELFLoggingUtils_logUserRequestFailed___block_invoke;
  v8[3] = &unk_1E7BED7C8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "emitEventUserRequest:userRequestContextBuilder:", v5, v8);

}

+ (id)logBackgroundUpdateStarted:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D99E80]);
  objc_msgSend(v5, "setBackgroundUpdateType:", v3);
  objc_msgSend(a1, "generateRandomUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SNLPSSUSELFLoggingUtils_logBackgroundUpdateStarted___block_invoke;
  v9[3] = &unk_1E7BED7F0;
  v10 = v5;
  v7 = v5;
  objc_msgSend(a1, "emitEventBackgroundUpdate:backgroundUpdateContextBuilder:", v6, v9);

  return v6;
}

+ (void)logBackgroundUpdateEnded:(id)a3 locale:(id)a4 appInfos:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = (objc_class *)MEMORY[0x1E0D99E70];
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setAppInfos:", v8);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__SNLPSSUSELFLoggingUtils_logBackgroundUpdateEnded_locale_appInfos___block_invoke;
  v12[3] = &unk_1E7BED7F0;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "emitEventBackgroundUpdate:backgroundUpdateContextBuilder:", v9, v12);

}

+ (void)logBackgroundUpdateFailed:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0D99E78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SNLPSSUSELFLoggingUtils_logBackgroundUpdateFailed___block_invoke;
  v8[3] = &unk_1E7BED7F0;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "emitEventBackgroundUpdate:backgroundUpdateContextBuilder:", v5, v8);

}

+ (id)generateRandomUUID
{
  void *v2;
  id v3;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUUIDBytes:", &v5);
  v3 = objc_alloc_init(MEMORY[0x1E0D9F9A0]);
  objc_msgSend(v3, "setNamespaceA:", 0);
  objc_msgSend(v3, "setLowInt:", v5);
  objc_msgSend(v3, "setHighInt:", v6);

  return v3;
}

+ (id)buildMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithResultCandidateId:(id)a5
{
  int v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0D9FAC8], "createNLXClientEventMetadataWithNlId:andWithTrpId:andWithResultCandidateId:andWithRequester:", a3, a4, a5, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)buildMetadataFromRequestId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D9FAC8], "extractRequestLinkData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultCandidateId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildMetadataWithNlId:andWithTrpId:andWithResultCandidateId:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)emitEvent:(id)a3
{
  objc_class *v3;
  void (**v4)(id, id);
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0D99E28];
  v4 = (void (**)(id, id))a3;
  v6 = objc_alloc_init(v3);
  v4[2](v4, v6);

  objc_msgSend(MEMORY[0x1E0D978A0], "sharedStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitMessage:", v6);

}

+ (void)emitEventUserRequest:(id)a3 userRequestContextBuilder:(id)a4
{
  objc_class *v6;
  void (**v7)(id, id);
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = (objc_class *)MEMORY[0x1E0D99E90];
  v7 = (void (**)(id, id))a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(a1, "buildMetadataFromRequestId:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SNLPSSUSELFLoggingUtils_emitEventUserRequest_userRequestContextBuilder___block_invoke;
  v13[3] = &unk_1E7BED818;
  v14 = v10;
  v15 = v9;
  v11 = v9;
  v12 = v10;
  objc_msgSend(a1, "emitEvent:", v13);

}

+ (void)emitEventBackgroundUpdate:(id)a3 backgroundUpdateContextBuilder:(id)a4
{
  objc_class *v6;
  void (**v7)(id, id);
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = (objc_class *)MEMORY[0x1E0D99E68];
  v7 = (void (**)(id, id))a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(a1, "buildMetadataWithNlId:andWithTrpId:andWithResultCandidateId:", v8, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__SNLPSSUSELFLoggingUtils_emitEventBackgroundUpdate_backgroundUpdateContextBuilder___block_invoke;
  v13[3] = &unk_1E7BED818;
  v14 = v10;
  v15 = v9;
  v11 = v9;
  v12 = v10;
  objc_msgSend(a1, "emitEvent:", v13);

}

void __84__SNLPSSUSELFLoggingUtils_emitEventBackgroundUpdate_backgroundUpdateContextBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setEventMetadata:", v3);
  objc_msgSend(v4, "setSsuBackgroundRequestContext:", *(_QWORD *)(a1 + 40));

}

void __74__SNLPSSUSELFLoggingUtils_emitEventUserRequest_userRequestContextBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setEventMetadata:", v3);
  objc_msgSend(v4, "setSsuUserRequestContext:", *(_QWORD *)(a1 + 40));

}

uint64_t __53__SNLPSSUSELFLoggingUtils_logBackgroundUpdateFailed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailed:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__SNLPSSUSELFLoggingUtils_logBackgroundUpdateEnded_locale_appInfos___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnded:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__SNLPSSUSELFLoggingUtils_logBackgroundUpdateStarted___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStartedOrChanged:", *(_QWORD *)(a1 + 32));
}

uint64_t __48__SNLPSSUSELFLoggingUtils_logUserRequestFailed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailed:", *(_QWORD *)(a1 + 32));
}

uint64_t __72__SNLPSSUSELFLoggingUtils_logUserRequestEnded_triggeredCacheEntryInfos___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnded:", *(_QWORD *)(a1 + 32));
}

uint64_t __49__SNLPSSUSELFLoggingUtils_logUserRequestStarted___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStartedOrChanged:", *(_QWORD *)(a1 + 32));
}

@end
