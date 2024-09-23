@implementation TRILighthouseBitacoraHandler

+ (BOOL)donateTrialIdentifiers:(id)a3 eventType:(unsigned __int8)a4 succeeded:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  int v8;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v7 = a5;
  v8 = a4;
  v11 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v12 = (void *)_MergedGlobals_33;
  v32 = _MergedGlobals_33;
  if (!_MergedGlobals_33)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getLBFTrialEventClass_block_invoke;
    v27 = &unk_1E9330128;
    v28 = &v29;
    __getLBFTrialEventClass_block_invoke((uint64_t)&v24);
    v12 = (void *)v30[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v29, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRILighthouseBitacoraHandler.m"), 32, CFSTR("Unable to load soft-linked LBFTrialEvent class"));

  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v14 = (void *)qword_1EFC741F8;
  v32 = qword_1EFC741F8;
  if (!qword_1EFC741F8)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getLBFEventManagerClass_block_invoke;
    v27 = &unk_1E9330128;
    v28 = &v29;
    __getLBFEventManagerClass_block_invoke((uint64_t)&v24);
    v14 = (void *)v30[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v29, 8);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRILighthouseBitacoraHandler.m"), 34, CFSTR("Unable to load soft-linked LBFEventManager class"));

  }
  switch(v8)
  {
    case 2:
      v16 = objc_msgSend([v13 alloc], "initWithDeactivation:", v7);
      goto LABEL_15;
    case 1:
      v16 = objc_msgSend([v13 alloc], "initWithActivation:", v7);
      goto LABEL_15;
    case 0:
      v16 = objc_msgSend([v13 alloc], "initWithAllocation:", v7);
LABEL_15:
      v17 = (void *)v16;
      goto LABEL_19;
  }
  TRILogCategory_Server();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v24) = 0;
    _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Received unknown event in bitacora handler.", (uint8_t *)&v24, 2u);
  }

  v17 = 0;
LABEL_19:
  objc_msgSend(v15, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "addTrialdEvent:identifiers:error:", v17, v11, a6);

  return v20;
}

+ (BOOL)emitBMLTEventWithBMLTId:(id)a3 deploymentId:(int)a4 eventType:(unsigned __int8)a5 succeeded:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v11;
  char v12;
  objc_class *LBFTrialIdentifiersClass;
  void *v14;
  id v15;
  NSObject *v16;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = 0;
  if (v11 && (_DWORD)v8)
  {
    LBFTrialIdentifiersClass = (objc_class *)getLBFTrialIdentifiersClass();
    if (!LBFTrialIdentifiersClass)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRILighthouseBitacoraHandler.m"), 65, CFSTR("Unable to load soft-linked LBFTrialIdentifiers class"));

    }
    v14 = (void *)objc_msgSend([LBFTrialIdentifiersClass alloc], "initWithBMLTTaskID:deploymentID:", v11, v8);
    v19 = 0;
    v12 = objc_msgSend(a1, "donateTrialIdentifiers:eventType:succeeded:error:", v14, v7, v6, &v19);
    v15 = v19;
    if (v15)
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478339;
        v21 = v15;
        v22 = 2114;
        v23 = v11;
        v24 = 1024;
        v25 = v8;
        _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Bitacora error :%{private}@ for BMLT id: %{public}@ deployment:%d", buf, 0x1Cu);
      }

    }
  }

  return v12;
}

+ (BOOL)emitShadowEvaluationEventWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5 eventType:(unsigned __int8)a6 succeeded:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v10;
  id v13;
  __CFString *v14;
  char v15;
  objc_class *LBFTrialIdentifiersClass;
  id v17;
  const __CFString *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v7 = a7;
  v8 = a6;
  v10 = *(_QWORD *)&a4;
  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (__CFString *)a5;
  v15 = 0;
  if (v13 && (_DWORD)v10)
  {
    LBFTrialIdentifiersClass = (objc_class *)getLBFTrialIdentifiersClass();
    if (!LBFTrialIdentifiersClass)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRILighthouseBitacoraHandler.m"), 91, CFSTR("Unable to load soft-linked LBFTrialIdentifiers class"));

    }
    v17 = [LBFTrialIdentifiersClass alloc];
    if (v14)
      v18 = v14;
    else
      v18 = &stru_1E9336E60;
    v19 = (void *)objc_msgSend(v17, "initWithExperimentID:deploymentID:treatmentID:", v13, v10, v18);
    v24 = 0;
    v15 = objc_msgSend(a1, "donateTrialIdentifiers:eventType:succeeded:error:", v19, v8, v7, &v24);
    v20 = v24;
    if (v20)
    {
      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478595;
        v26 = v20;
        v27 = 2114;
        v28 = v13;
        v29 = 1024;
        v30 = v10;
        v31 = 2114;
        v32 = v14;
        _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Bitacora error :%{private}@ for shadow evaluation with experimentId: %{public}@ deployment:%d treatment:%{public}@", buf, 0x26u);
      }

    }
  }

  return v15;
}

@end
