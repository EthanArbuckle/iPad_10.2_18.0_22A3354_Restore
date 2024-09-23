@implementation CRE5MLExecutionContext

- (CRE5MLExecutionContext)initWithFunction:(id)a3
{
  id v5;
  CRE5MLExecutionContext *v6;
  CRE5MLExecutionContext *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *prewarmSemaphore;
  NSObject *v10;
  qos_class_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *contextQueue;
  CRE5MLExecutionContext *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRE5MLExecutionContext;
  v6 = -[CRE5MLExecutionContext init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_functionDescriptor, a3);
    v7->_executionLock._os_unfair_lock_opaque = 0;
    v8 = dispatch_semaphore_create(1);
    prewarmSemaphore = v7->_prewarmSemaphore;
    v7->_prewarmSemaphore = (OS_dispatch_semaphore *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(v10, v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.CoreRecognition.E5MLExecutionContextQueue", v12);
    contextQueue = v7->_contextQueue;
    v7->_contextQueue = (OS_dispatch_queue *)v13;

    v15 = v7;
  }

  return v7;
}

- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0DC6C28];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "function");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "newExecutionContextWithConfiguration:error:", v7, a4);
  return v9;
}

- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 preboundInputs:(id)a4 preboundOutputs:(id)a5 error:(id *)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v9 = (objc_class *)MEMORY[0x1E0DC6C28];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v9);
  objc_msgSend(v13, "setBoundInputObjects:", v11);

  objc_msgSend(v13, "setBoundOutputObjects:", v10);
  objc_msgSend(v13, "setPrewireInUseAllocations:", 1);
  objc_msgSend(v12, "function");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v14, "newExecutionContextWithConfiguration:error:", v13, a6);
  return v15;
}

- (id)sharedExecutionContextWithError:(id *)a3
{
  VisionCoreE5RTExecutionContext *executionContext;
  VisionCoreE5RTExecutionContext *v5;
  VisionCoreE5RTExecutionContext *v6;

  executionContext = self->_executionContext;
  if (!executionContext)
  {
    v5 = -[CRE5MLExecutionContext newE5RTExecutionContextForFunctionDescriptor:error:](self, "newE5RTExecutionContextForFunctionDescriptor:error:", self->_functionDescriptor, a3);
    v6 = self->_executionContext;
    self->_executionContext = v5;

    executionContext = self->_executionContext;
  }
  return executionContext;
}

- (id)predictionFromInputObjects:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_executionLock;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t v18[16];
  uint8_t buf[16];

  v6 = a3;
  p_executionLock = &self->_executionLock;
  os_unfair_lock_lock(&self->_executionLock);
  if (v6)
  {
    -[CRE5MLExecutionContext sharedExecutionContextWithError:](self, "sharedExecutionContextWithError:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (CRSignpostLog_onceToken != -1)
        dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
      v9 = (id)CRSignpostLog_signPostOSLog;
      v10 = os_signpost_id_generate(v9);

      if (CRSignpostLog_onceToken != -1)
        dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
      v11 = (id)CRSignpostLog_signPostOSLog;
      v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "OCRE5ContextExecutionTime", ", buf, 2u);
      }

      objc_msgSend(v8, "executeWithInputObjects:error:", v6, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (CRSignpostLog_onceToken != -1)
        dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
      v14 = (id)CRSignpostLog_signPostOSLog;
      v15 = v14;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v15, OS_SIGNPOST_INTERVAL_END, v10, "OCRE5ContextExecutionTime", ", v18, 2u);
      }

      os_unfair_lock_unlock(p_executionLock);
      if (v13)
        v16 = v13;

    }
    else
    {
      os_unfair_lock_unlock(p_executionLock);
      v13 = 0;
    }

  }
  else
  {
    os_unfair_lock_unlock(&self->_executionLock);
    v13 = 0;
  }

  return v13;
}

- (void)prebindInputs:(id)a3
{
  VisionCoreE5RTExecutionContext *preboundExecutionContext;
  id v6;

  objc_storeStrong((id *)&self->_preboundInputObjects, a3);
  v6 = a3;
  preboundExecutionContext = self->_preboundExecutionContext;
  self->_preboundExecutionContext = 0;

}

- (void)unbindInputs
{
  VisionCoreNamedObjects *preboundInputObjects;
  VisionCoreE5RTExecutionContext *preboundExecutionContext;

  preboundInputObjects = self->_preboundInputObjects;
  self->_preboundInputObjects = 0;

  preboundExecutionContext = self->_preboundExecutionContext;
  self->_preboundExecutionContext = 0;

}

- (BOOL)predictFromPreboundInputsWithError:(id *)a3
{
  os_unfair_lock_s *p_executionLock;
  VisionCoreNamedObjects *v6;
  VisionCoreNamedObjects *preboundOutputObjects;
  VisionCoreE5RTExecutionContext *v8;
  VisionCoreE5RTExecutionContext *preboundExecutionContext;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  p_executionLock = &self->_executionLock;
  os_unfair_lock_lock(&self->_executionLock);
  if (!self->_preboundOutputObjects)
  {
    v6 = +[CRE5MLUtilities newE5RTExecutionOutputsForFunctionDescriptor:error:](CRE5MLUtilities, "newE5RTExecutionOutputsForFunctionDescriptor:error:", self->_functionDescriptor, a3);
    preboundOutputObjects = self->_preboundOutputObjects;
    self->_preboundOutputObjects = v6;

  }
  if (!self->_preboundExecutionContext)
  {
    v8 = -[CRE5MLExecutionContext newE5RTExecutionContextForFunctionDescriptor:preboundInputs:preboundOutputs:error:](self, "newE5RTExecutionContextForFunctionDescriptor:preboundInputs:preboundOutputs:error:", self->_functionDescriptor, self->_preboundInputObjects, self->_preboundOutputObjects, a3);
    preboundExecutionContext = self->_preboundExecutionContext;
    self->_preboundExecutionContext = v8;

    if (!self->_preboundExecutionContext)
      goto LABEL_19;
  }
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v10 = (id)CRSignpostLog_signPostOSLog;
  v11 = os_signpost_id_generate(v10);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v12 = (id)CRSignpostLog_signPostOSLog;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "OCRE5ContextExecutionTime", ", buf, 2u);
  }

  -[VisionCoreE5RTExecutionContext executeAndReturnError:](self->_preboundExecutionContext, "executeAndReturnError:", a3);
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v14 = (id)CRSignpostLog_signPostOSLog;
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v15, OS_SIGNPOST_INTERVAL_END, v11, "OCRE5ContextExecutionTime", ", v17, 2u);
  }

  if (!a3 || !*a3)
  {
    os_unfair_lock_unlock(p_executionLock);
    return 1;
  }
  else
  {
LABEL_19:
    os_unfair_lock_unlock(p_executionLock);
    return 0;
  }
}

- (void)predictFromPreboundInputsAsync:(id)a3
{
  void (**v4)(id, _QWORD, id);
  id v5;
  VisionCoreE5RTInferenceFunctionDescriptor *functionDescriptor;
  VisionCoreNamedObjects *v7;
  VisionCoreNamedObjects *preboundOutputObjects;
  id v9;
  void *v10;
  VisionCoreE5RTInferenceFunctionDescriptor *v11;
  VisionCoreNamedObjects *preboundInputObjects;
  VisionCoreNamedObjects *v13;
  VisionCoreE5RTExecutionContext *v14;
  VisionCoreE5RTExecutionContext *preboundExecutionContext;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  VisionCoreE5RTExecutionContext *v20;
  _QWORD v21[5];
  void (**v22)(id, _QWORD, id);
  os_signpost_id_t v23;
  uint8_t buf[16];
  id v25;
  id v26;

  v4 = (void (**)(id, _QWORD, id))a3;
  os_unfair_lock_lock(&self->_executionLock);
  if (self->_preboundOutputObjects)
  {
    v5 = 0;
  }
  else
  {
    functionDescriptor = self->_functionDescriptor;
    v26 = 0;
    v7 = +[CRE5MLUtilities newE5RTExecutionOutputsForFunctionDescriptor:error:](CRE5MLUtilities, "newE5RTExecutionOutputsForFunctionDescriptor:error:", functionDescriptor, &v26);
    v5 = v26;
    preboundOutputObjects = self->_preboundOutputObjects;
    self->_preboundOutputObjects = v7;

  }
  if (self->_preboundExecutionContext)
  {
    v9 = v5;
  }
  else
  {
    v10 = (void *)objc_opt_class();
    v11 = self->_functionDescriptor;
    preboundInputObjects = self->_preboundInputObjects;
    v13 = self->_preboundOutputObjects;
    v25 = v5;
    v14 = (VisionCoreE5RTExecutionContext *)objc_msgSend(v10, "newE5RTExecutionContextForFunctionDescriptor:preboundInputs:preboundOutputs:error:", v11, preboundInputObjects, v13, &v25);
    v9 = v25;

    preboundExecutionContext = self->_preboundExecutionContext;
    self->_preboundExecutionContext = v14;

    if (!self->_preboundExecutionContext)
    {
      os_unfair_lock_unlock(&self->_executionLock);
      v4[2](v4, 0, v9);
      goto LABEL_15;
    }
  }
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v16 = (id)CRSignpostLog_signPostOSLog;
  v17 = os_signpost_id_generate(v16);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v18 = (id)CRSignpostLog_signPostOSLog;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "OCRE5ContextExecutionTime", ", buf, 2u);
  }

  v20 = self->_preboundExecutionContext;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__CRE5MLExecutionContext_predictFromPreboundInputsAsync___block_invoke;
  v21[3] = &unk_1E98DAFC8;
  v23 = v17;
  v21[4] = self;
  v22 = v4;
  -[VisionCoreE5RTExecutionContext executeWithCompletionHandler:](v20, "executeWithCompletionHandler:", v21);

LABEL_15:
}

void __57__CRE5MLExecutionContext_predictFromPreboundInputsAsync___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a2;
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v7 = (id)CRSignpostLog_signPostOSLog;
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "OCRE5ContextExecutionTime", ", v10, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
}

- (VisionCoreE5RTInferenceFunctionDescriptor)functionDescriptor
{
  return self->_functionDescriptor;
}

- (VisionCoreNamedObjects)preboundOutputObjects
{
  return self->_preboundOutputObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preboundExecutionContext, 0);
  objc_storeStrong((id *)&self->_preboundOutputObjects, 0);
  objc_storeStrong((id *)&self->_preboundInputObjects, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_contextQueue, 0);
  objc_storeStrong((id *)&self->_prewarmSemaphore, 0);
  objc_storeStrong((id *)&self->_prewarmedState, 0);
  objc_storeStrong((id *)&self->_functionDescriptor, 0);
}

@end
