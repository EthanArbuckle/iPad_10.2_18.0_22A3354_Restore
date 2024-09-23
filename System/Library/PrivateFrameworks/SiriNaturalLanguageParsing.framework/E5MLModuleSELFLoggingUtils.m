@implementation E5MLModuleSELFLoggingUtils

+ (id)logMilCompilationStartedWithMetadata:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0D99E10];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setModel:", 1);
  objc_msgSend(a1, "_generateRandomUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__E5MLModuleSELFLoggingUtils_logMilCompilationStartedWithMetadata___block_invoke;
  v13[3] = &unk_1E7BED780;
  v14 = v6;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  objc_msgSend(a1, "emitEventMilAssetAcquisitionWithMetadata:milAssetAcquisitionContextBuilder:", v5, v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

+ (void)logMilCompilationEndedWithMetadata:(id)a3 contextId:(id)a4 acquisitionType:(int)a5
{
  uint64_t v5;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0D99E00];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setAcquisitionType:", v5);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__E5MLModuleSELFLoggingUtils_logMilCompilationEndedWithMetadata_contextId_acquisitionType___block_invoke;
  v14[3] = &unk_1E7BED780;
  v15 = v11;
  v16 = v8;
  v12 = v8;
  v13 = v11;
  objc_msgSend(a1, "emitEventMilAssetAcquisitionWithMetadata:milAssetAcquisitionContextBuilder:", v10, v14);

}

+ (void)logMilCompilationFailedWithMetadata:(id)a3 contextId:(id)a4 acquisitionType:(int)a5 errorCode:(int)a6 errorMessage:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v12 = a4;
  v13 = (objc_class *)MEMORY[0x1E0D99E08];
  v14 = a7;
  v15 = a3;
  v16 = objc_alloc_init(v13);
  objc_msgSend(v16, "setAcquisitionType:", v9);
  objc_msgSend(v16, "setErrorCode:", v8);
  objc_msgSend(v16, "setErrorMessage:", v14);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __115__E5MLModuleSELFLoggingUtils_logMilCompilationFailedWithMetadata_contextId_acquisitionType_errorCode_errorMessage___block_invoke;
  v19[3] = &unk_1E7BED780;
  v20 = v16;
  v21 = v12;
  v17 = v12;
  v18 = v16;
  objc_msgSend(a1, "emitEventMilAssetAcquisitionWithMetadata:milAssetAcquisitionContextBuilder:", v15, v19);

}

+ (id)logMilCompilationStarted
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D99E10]);
  objc_msgSend(v3, "setModel:", 1);
  objc_msgSend(a1, "_generateRandomUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__E5MLModuleSELFLoggingUtils_logMilCompilationStarted__block_invoke;
  v10[3] = &unk_1E7BED780;
  v11 = v3;
  v5 = v4;
  v12 = v5;
  v6 = v3;
  objc_msgSend(a1, "emitEventMilAssetAcquisition:milAssetAcquisitionContextBuilder:", v5, v10);
  v7 = v12;
  v8 = v5;

  return v8;
}

+ (void)logMilCompilationEnded:(id)a3 acquisitionType:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D99E00]);
  objc_msgSend(v7, "setAcquisitionType:", v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__E5MLModuleSELFLoggingUtils_logMilCompilationEnded_acquisitionType___block_invoke;
  v10[3] = &unk_1E7BED780;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "emitEventMilAssetAcquisition:milAssetAcquisitionContextBuilder:", v8, v10);

}

+ (void)logMilCompilationFailed:(id)a3 acquisitionType:(int)a4 errorCode:(int)a5 errorMessage:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (objc_class *)MEMORY[0x1E0D99E08];
  v12 = a6;
  v13 = objc_alloc_init(v11);
  objc_msgSend(v13, "setAcquisitionType:", v8);
  objc_msgSend(v13, "setErrorCode:", v7);
  objc_msgSend(v13, "setErrorMessage:", v12);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__E5MLModuleSELFLoggingUtils_logMilCompilationFailed_acquisitionType_errorCode_errorMessage___block_invoke;
  v16[3] = &unk_1E7BED780;
  v17 = v13;
  v18 = v10;
  v14 = v10;
  v15 = v13;
  objc_msgSend(a1, "emitEventMilAssetAcquisition:milAssetAcquisitionContextBuilder:", v14, v16);

}

+ (id)_generateRandomUUID
{
  void *v2;
  void *v3;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUUIDBytes:", &v5);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v2);

  return v3;
}

+ (id)_buildMetadataWithNlId:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D99E30];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setNlId:", v4);

  return v5;
}

+ (id)_buildMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithResultCandidateId:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;

  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0D99E30];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setNlId:", v10);

  if (v7)
    objc_msgSend(v11, "setTrpId:", v7);
  if (v8)
    objc_msgSend(v11, "setResultCandidateId:", v8);
  objc_msgSend(v11, "setComponentInvocationSource:", 0);

  return v11;
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

+ (void)emitEventMilAssetAcquisition:(id)a3 milAssetAcquisitionContextBuilder:(id)a4
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

  v6 = (objc_class *)MEMORY[0x1E0D99DF8];
  v7 = (void (**)(id, id))a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(a1, "_buildMetadataWithNlId:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__E5MLModuleSELFLoggingUtils_emitEventMilAssetAcquisition_milAssetAcquisitionContextBuilder___block_invoke;
  v13[3] = &unk_1E7BED818;
  v14 = v10;
  v15 = v9;
  v11 = v9;
  v12 = v10;
  objc_msgSend(a1, "emitEvent:", v13);

}

+ (void)emitEventMilAssetAcquisitionWithMetadata:(id)a3 milAssetAcquisitionContextBuilder:(id)a4
{
  id v6;
  objc_class *v7;
  void (**v8)(id, id);
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D99DF8];
  v8 = (void (**)(id, id))a4;
  v9 = objc_alloc_init(v7);
  v8[2](v8, v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__E5MLModuleSELFLoggingUtils_emitEventMilAssetAcquisitionWithMetadata_milAssetAcquisitionContextBuilder___block_invoke;
  v12[3] = &unk_1E7BED818;
  v13 = v6;
  v14 = v9;
  v10 = v9;
  v11 = v6;
  objc_msgSend(a1, "emitEvent:", v12);

}

void __105__E5MLModuleSELFLoggingUtils_emitEventMilAssetAcquisitionWithMetadata_milAssetAcquisitionContextBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setEventMetadata:", v3);
  objc_msgSend(v4, "setMilAssetAcquisitionContext:", *(_QWORD *)(a1 + 40));

}

void __93__E5MLModuleSELFLoggingUtils_emitEventMilAssetAcquisition_milAssetAcquisitionContextBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setEventMetadata:", v3);
  objc_msgSend(v4, "setMilAssetAcquisitionContext:", *(_QWORD *)(a1 + 40));

}

void __93__E5MLModuleSELFLoggingUtils_logMilCompilationFailed_acquisitionType_errorCode_errorMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setFailed:", v3);
  objc_msgSend(v4, "setContextId:", *(_QWORD *)(a1 + 40));

}

void __69__E5MLModuleSELFLoggingUtils_logMilCompilationEnded_acquisitionType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setEnded:", v3);
  objc_msgSend(v4, "setContextId:", *(_QWORD *)(a1 + 40));

}

void __54__E5MLModuleSELFLoggingUtils_logMilCompilationStarted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setStartedOrChanged:", v3);
  objc_msgSend(v4, "setContextId:", *(_QWORD *)(a1 + 40));

}

void __115__E5MLModuleSELFLoggingUtils_logMilCompilationFailedWithMetadata_contextId_acquisitionType_errorCode_errorMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setFailed:", v3);
  objc_msgSend(v4, "setContextId:", *(_QWORD *)(a1 + 40));

}

void __91__E5MLModuleSELFLoggingUtils_logMilCompilationEndedWithMetadata_contextId_acquisitionType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setEnded:", v3);
  objc_msgSend(v4, "setContextId:", *(_QWORD *)(a1 + 40));

}

void __67__E5MLModuleSELFLoggingUtils_logMilCompilationStartedWithMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setStartedOrChanged:", v3);
  objc_msgSend(v4, "setContextId:", *(_QWORD *)(a1 + 40));

}

@end
