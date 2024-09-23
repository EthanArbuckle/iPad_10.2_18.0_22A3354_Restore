@implementation WFRemoteQuarantinePolicyEvaluator

- (WFRemoteQuarantinePolicyEvaluator)init
{
  WFRemoteQuarantinePolicyEvaluator *v2;
  dispatch_semaphore_t v3;
  id v4;
  uint64_t v5;
  NSThread *javaScriptEvaluationThread;
  WFRemoteQuarantinePolicyEvaluator *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id from;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WFRemoteQuarantinePolicyEvaluator;
  v2 = -[WFRemoteQuarantinePolicyEvaluator init](&v17, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    objc_initWeak(&location, v3);
    objc_initWeak(&from, v2);
    v4 = objc_alloc(MEMORY[0x1E0CB3978]);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __41__WFRemoteQuarantinePolicyEvaluator_init__block_invoke;
    v12 = &unk_1E7AED458;
    objc_copyWeak(&v13, &from);
    objc_copyWeak(&v14, &location);
    v5 = objc_msgSend(v4, "initWithBlock:", &v9);
    javaScriptEvaluationThread = v2->_javaScriptEvaluationThread;
    v2->_javaScriptEvaluationThread = (NSThread *)v5;

    -[NSThread setName:](v2->_javaScriptEvaluationThread, "setName:", CFSTR("WFRemoteQuarantinePolicyEvaluator JavaScript Evaluator Thread"), v9, v10, v11, v12);
    -[NSThread start](v2->_javaScriptEvaluationThread, "start");
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    v7 = v2;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRunLoopPerformBlock(self->_javaScriptEvaluationThreadRunLoop, (CFTypeRef)*MEMORY[0x1E0C9B280], &__block_literal_global_115);
  v3.receiver = self;
  v3.super_class = (Class)WFRemoteQuarantinePolicyEvaluator;
  -[WFRemoteQuarantinePolicyEvaluator dealloc](&v3, sel_dealloc);
}

- (JSVirtualMachine)javaScriptVirtualMachine
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSTimer *v8;
  NSTimer *javaScriptVirtualMachineDestructionTimer;
  JSVirtualMachine *javaScriptVirtualMachine;
  JSVirtualMachine *v11;
  JSVirtualMachine *v12;
  JSVirtualMachine *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteQuarantinePolicyEvaluator javaScriptEvaluationThread](self, "javaScriptEvaluationThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteQuarantinePolicyEvaluator.m"), 101, CFSTR("This metod should only be run on javaScriptEvaluationThread"));

  }
  -[NSTimer invalidate](self->_javaScriptVirtualMachineDestructionTimer, "invalidate");
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0C99E88];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__WFRemoteQuarantinePolicyEvaluator_javaScriptVirtualMachine__block_invoke;
  v16[3] = &unk_1E7AED4A0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v16, 300.0);
  v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  javaScriptVirtualMachineDestructionTimer = self->_javaScriptVirtualMachineDestructionTimer;
  self->_javaScriptVirtualMachineDestructionTimer = v8;

  javaScriptVirtualMachine = self->_javaScriptVirtualMachine;
  if (!javaScriptVirtualMachine)
  {
    v11 = (JSVirtualMachine *)objc_opt_new();
    v12 = self->_javaScriptVirtualMachine;
    self->_javaScriptVirtualMachine = v11;

    javaScriptVirtualMachine = self->_javaScriptVirtualMachine;
  }
  v13 = javaScriptVirtualMachine;
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v13;
}

- (void)evaluatePolicyForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFRunLoop *v9;
  const void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  WFRemoteQuarantinePolicyEvaluator *v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)voucher_copy();
  v9 = -[WFRemoteQuarantinePolicyEvaluator javaScriptEvaluationThreadRunLoop](self, "javaScriptEvaluationThreadRunLoop");
  v10 = (const void *)*MEMORY[0x1E0C9B280];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __73__WFRemoteQuarantinePolicyEvaluator_evaluatePolicyForRequest_completion___block_invoke;
  v17 = &unk_1E7AF8F70;
  v18 = self;
  v19 = v6;
  v20 = v8;
  v21 = v7;
  v11 = v7;
  v12 = v8;
  v13 = v6;
  CFRunLoopPerformBlock(v9, v10, &v14);
  CFRunLoopWakeUp(-[WFRemoteQuarantinePolicyEvaluator javaScriptEvaluationThreadRunLoop](self, "javaScriptEvaluationThreadRunLoop", v14, v15, v16, v17, v18));

}

- (id)remoteQuarantineHashForWorkflowReference:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint8_t v17[8];
  uint64_t v18;
  uint8_t buf[16];

  v3 = a3;
  getWFWorkflowExecutionLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  getWFWorkflowExecutionLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RemoteQuarantineEvaluationHashCalculation", ", buf, 2u);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D3E558]);
  +[WFRemoteQuarantinePolicyManager sharedManager](WFRemoteQuarantinePolicyManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "combineInteger:", objc_msgSend(v9, "policyVersion"));

  v11 = objc_msgSend(v3, "syncHash");
  v12 = (id)objc_msgSend(v8, "combineInteger:", v11);
  v18 = objc_msgSend(v8, "finalize");
  getWFWorkflowExecutionLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v14, OS_SIGNPOST_INTERVAL_END, v5, "RemoteQuarantineEvaluationHashCalculation", ", v17, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v18, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_evaluatePolicyForRequest:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  id v43;
  id location;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD aBlock[4];
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _QWORD v60[2];
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteQuarantinePolicyEvaluator javaScriptEvaluationThread](self, "javaScriptEvaluationThread");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteQuarantinePolicyEvaluator.m"), 151, CFSTR("This metod should only be run on javaScriptEvaluationThread"));

  }
  -[WFRemoteQuarantinePolicyEvaluator javaScriptVirtualMachine](self, "javaScriptVirtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBE0F0]), "initWithVirtualMachine:", v11);
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v13 = MEMORY[0x1E0C809B0];
  v59 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke;
  aBlock[3] = &unk_1E7AED4C8;
  v55 = &v56;
  v14 = v7;
  v54 = v14;
  v51[0] = v13;
  v51[1] = 3221225472;
  v51[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_2;
  v51[3] = &unk_1E7AED4F0;
  v15 = _Block_copy(aBlock);
  v52 = v15;
  objc_msgSend(v12, "setExceptionHandler:", v51);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &__block_literal_global_133, CFSTR("WFLocalizedString"));
  +[WFRemoteQuarantinePolicyManager sharedManager](WFRemoteQuarantinePolicyManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "policyString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (id)objc_msgSend(v12, "evaluateScript:", v17);
    if (!*((_BYTE *)v57 + 24))
    {
      v45 = 0;
      v46 = &v45;
      v47 = 0x3032000000;
      v48 = __Block_byref_object_copy__11015;
      v49 = __Block_byref_object_dispose__11016;
      v50 = 0;
      objc_initWeak(&location, self);
      v38[0] = v13;
      v38[1] = 3221225472;
      v38[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_134;
      v38[3] = &unk_1E7AED558;
      objc_copyWeak(&v43, &location);
      v41 = &v45;
      v42 = &v56;
      v19 = v15;
      v40 = v19;
      v20 = v34;
      v39 = v20;
      v21 = _Block_copy(v38);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("completionHandler"));

      objc_msgSend(v20, "policyFunctionName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v22);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("completionHandler"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      objc_msgSend(v20, "javaScriptCoreRepresentationWithError:", &v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v37;
      if (v23)
      {
        v25 = (void *)MEMORY[0x1E0C99E88];
        v35[0] = v13;
        v35[1] = 3221225472;
        v35[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_144;
        v35[3] = &unk_1E7AED580;
        v36 = v19;
        objc_msgSend(v25, "scheduledTimerWithTimeInterval:repeats:block:", 0, v35, 3.0);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v46[5];
        v46[5] = v26;

        v60[0] = v23;
        v60[1] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id)objc_msgSend(v33, "callWithArguments:", v28);

      }
      else
      {
        getWFRemoteQuarantineLogObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v62 = "-[WFRemoteQuarantinePolicyEvaluator _evaluatePolicyForRequest:completion:]";
          v63 = 2112;
          v64 = v24;
          _os_log_impl(&dword_1C15B3000, v30, OS_LOG_TYPE_ERROR, "%s Failed to generate JSC representation: %@", buf, 0x16u);
        }

        (*((void (**)(id, uint64_t, _QWORD))v19 + 2))(v19, 1, 0);
      }

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v45, 8);

    }
  }
  else
  {
    (*((void (**)(void *, uint64_t, _QWORD))v15 + 2))(v15, 1, 0);
  }

  _Block_object_dispose(&v56, 8);
}

- (void)setJavaScriptVirtualMachine:(id)a3
{
  objc_storeStrong((id *)&self->_javaScriptVirtualMachine, a3);
}

- (WFRemoteQuarantinePolicyEvaluatorDelegate)delegate
{
  return (WFRemoteQuarantinePolicyEvaluatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSThread)javaScriptEvaluationThread
{
  return self->_javaScriptEvaluationThread;
}

- (__CFRunLoop)javaScriptEvaluationThreadRunLoop
{
  return self->_javaScriptEvaluationThreadRunLoop;
}

- (NSTimer)javaScriptVirtualMachineDestructionTimer
{
  return self->_javaScriptVirtualMachineDestructionTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javaScriptVirtualMachineDestructionTimer, 0);
  objc_storeStrong((id *)&self->_javaScriptEvaluationThread, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_javaScriptVirtualMachine, 0);
}

uint64_t __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v34 = 0;
    +[MTLJSONAdapter modelOfClass:fromJSONDictionary:error:](MTLJSONAdapter, "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v3, &v34);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v34;
    if (v5 && objc_msgSend(v5, "policy"))
    {
      if (objc_msgSend(v5, "policy") == 2)
      {
        objc_msgSend(v5, "errorTitle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = v7;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "defaultLocalizedPromptTitle");
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        v10 = v9;

        objc_msgSend(v5, "errorMessage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "defaultLocalizedPromptMessage");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;

        if (objc_msgSend(v10, "length") || objc_msgSend(v14, "length"))
        {
          v15 = objc_alloc_init(MEMORY[0x1E0D13DE0]);
          v29 = v10;
          objc_msgSend(v15, "setTitle:", v10);
          objc_msgSend(v15, "setMessage:", v14);
          v16 = MEMORY[0x1E0C809B0];
          v17 = (void *)MEMORY[0x1E0D13DE8];
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_2_139;
          v32[3] = &unk_1E7AF8F48;
          v33 = *(id *)(a1 + 40);
          objc_msgSend(v17, "cancelButtonWithHandler:", v32);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addButton:", v18);

          v19 = (void *)MEMORY[0x1E0D13DE8];
          v30[0] = v16;
          v30[1] = 3221225472;
          v30[2] = __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_3_141;
          v30[3] = &unk_1E7AF8F48;
          v31 = *(id *)(a1 + 40);
          objc_msgSend(v19, "okButtonWithHandler:", v30);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addButton:", v20);

          objc_msgSend(WeakRetained, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "userInterfaceToPresentAlertForEvaluator:", WeakRetained);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v22, "presentAlert:", v15);
          else
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

          goto LABEL_26;
        }

      }
      objc_msgSend(v5, "errorTitle");
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorMessage");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!(v23 | v24))
      {
        objc_msgSend(*(id *)(a1 + 32), "defaultLocalizedDeniedErrorTitle");
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "defaultLocalizedDeniedErrorMessage");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v25 = (void *)v24;
      v26 = (void *)objc_opt_new();
      v27 = v26;
      if (v23)
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CB2D68]);
      if (v25)
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CB2D50]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFRemoteQuarantineErrorDomain"), 0, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      goto LABEL_26;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_26:

  }
}

uint64_t __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_2_139(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_3_141(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __74__WFRemoteQuarantinePolicyEvaluator__evaluatePolicyForRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[WFRemoteQuarantinePolicyManager sharedManager](WFRemoteQuarantinePolicyManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __73__WFRemoteQuarantinePolicyEvaluator_evaluatePolicyForRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1C3BB3598]();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__WFRemoteQuarantinePolicyEvaluator_evaluatePolicyForRequest_completion___block_invoke_2;
  v5[3] = &unk_1E7AF8548;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_evaluatePolicyForRequest:completion:", v4, v5);

  objc_autoreleasePoolPop(v2);
}

void __73__WFRemoteQuarantinePolicyEvaluator_evaluatePolicyForRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = *(id *)(a1 + 32);
  v6 = a3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __61__WFRemoteQuarantinePolicyEvaluator_javaScriptVirtualMachine__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setJavaScriptVirtualMachine:", 0);

}

void __44__WFRemoteQuarantinePolicyEvaluator_dealloc__block_invoke()
{
  __CFRunLoop *Current;

  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

void __41__WFRemoteQuarantinePolicyEvaluator_init__block_invoke(uint64_t a1)
{
  __CFRunLoop *Current;
  _QWORD *WeakRetained;
  NSObject *v4;
  __CFRunLoopSource *v5;
  const __CFString *v6;
  CFRunLoopSourceContext v7;

  Current = CFRunLoopGetCurrent();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  WeakRetained[4] = Current;
  dispatch_semaphore_signal(v4);

  memset(&v7, 0, sizeof(v7));
  v5 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v7);
  v6 = (const __CFString *)*MEMORY[0x1E0C9B280];
  CFRunLoopAddSource(Current, v5, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  CFRunLoopRun();
  CFRunLoopRemoveSource(Current, v5, v6);
  CFRelease(v5);
}

+ (WFRemoteQuarantinePolicyEvaluator)sharedEvaluator
{
  if (sharedEvaluator_onceToken != -1)
    dispatch_once(&sharedEvaluator_onceToken, &__block_literal_global_111);
  return (WFRemoteQuarantinePolicyEvaluator *)(id)sharedEvaluator_evaluator;
}

void __52__WFRemoteQuarantinePolicyEvaluator_sharedEvaluator__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedEvaluator_evaluator;
  sharedEvaluator_evaluator = v0;

}

@end
