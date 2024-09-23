@implementation VGHRTFSession

- (VGHRTFSession)initWithConfig:(id)a3 error:(id *)a4
{
  id v7;
  VGHRTFSession *v8;
  id *p_config;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  VGHRTFSession *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  __CFString *v24;
  VGHRTFCaptureProcessor *v25;
  VGHRTFCaptureProcessor *captureProcessor;
  VGHRTFPostProcessor *v27;
  VGHRTFPostProcessor *postProcessor;
  dispatch_queue_t v29;
  OS_dispatch_queue *processQueue;
  dispatch_group_t v31;
  OS_dispatch_group *processGroup;
  dispatch_queue_t v33;
  OS_dispatch_queue *timerQueue;
  __CFString *v35;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VGHRTFSession;
  v8 = -[VGHRTFSession init](&v38, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "overwriteWithDefaults");
    p_config = (id *)&v8->_config;
    objc_storeStrong((id *)&v8->_config, a3);
    __VGLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(*p_config, "writeDebugData");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v40 = v12;
      _os_log_impl(&dword_249CAD000, v10, OS_LOG_TYPE_DEBUG, " Write HRTF debug data: %@ ", buf, 0xCu);
    }

    if (objc_msgSend(*p_config, "writeDebugData"))
    {
      objc_msgSend(*p_config, "debugDataRootPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v14 = (void *)objc_opt_new();
        objc_msgSend(v14, "setDateFormat:", CFSTR("yyyyMMdd_HHmmss_SSS"));
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(CFSTR("/private/var/mobile/Library/Caches/VisageTestApp/HRTF/"), "stringByAppendingPathComponent:", v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "fileExistsAtPath:", v13);

      if (v18)
      {
        NSLog(CFSTR("Path %@ already exist. Please remove this folder before running."), v13);

LABEL_23:
        v19 = 0;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v37);
      v21 = v37;

      if (v21)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create debug path %@."), v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        vg::hrtf::setError(a4, v22);

        goto LABEL_23;
      }
      objc_msgSend(*p_config, "setDebugDataRootPath:", v13);
      __VGLogSharedInstance();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*p_config, "debugDataRootPath");
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v24;
        _os_log_impl(&dword_249CAD000, v23, OS_LOG_TYPE_DEBUG, " Using path for dumping HRTF debug data: %@ ", buf, 0xCu);

      }
    }
    v25 = -[VGHRTFCaptureProcessor initWithConfig:error:]([VGHRTFCaptureProcessor alloc], "initWithConfig:error:", *p_config, a4);
    captureProcessor = v8->_captureProcessor;
    v8->_captureProcessor = v25;

    if (v8->_captureProcessor)
    {
      v27 = -[VGHRTFPostProcessor initWithConfig:error:]([VGHRTFPostProcessor alloc], "initWithConfig:error:", *p_config, a4);
      postProcessor = v8->_postProcessor;
      v8->_postProcessor = v27;

      if (v8->_postProcessor)
      {
        v29 = dispatch_queue_create("com.apple.visage.hrtf.processor", 0);
        processQueue = v8->_processQueue;
        v8->_processQueue = (OS_dispatch_queue *)v29;

        v31 = dispatch_group_create();
        processGroup = v8->_processGroup;
        v8->_processGroup = (OS_dispatch_group *)v31;

        v33 = dispatch_queue_create("com.apple.visage.hrtf.timer", 0);
        timerQueue = v8->_timerQueue;
        v8->_timerQueue = (OS_dispatch_queue *)v33;

        atomic_store(0, (unsigned __int8 *)&v8->_processing);
        atomic_store(0, (unsigned __int8 *)&v8->_captureFinished);
        v19 = v8;
        goto LABEL_24;
      }
      v35 = CFSTR("Failed to initialize post processor.");
    }
    else
    {
      v35 = CFSTR("Failed to initialize capture processor.");
    }
    vg::hrtf::setError(a4, v35);
    goto LABEL_23;
  }
  vg::hrtf::setError(a4, CFSTR("Failed to initialize VGHRTFSession."));
  v19 = 0;
LABEL_24:

  return v19;
}

- (BOOL)_asyncProcessCaptureData:(id)a3 faceData:(id)a4 userData:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  unsigned __int8 v17;
  NSObject *v18;
  VGHRTFCaptureProcessor *captureProcessor;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint8_t v29[8];
  _QWORD handler[4];
  id v31;
  VGHRTFSession *v32;
  uint8_t *v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v9 = a3;
  v10 = a4;
  v11 = atomic_load((unsigned __int8 *)&self->_captureFinished);
  if ((v11 & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    v12 = -[VGHRTFUpdateData initEmpty]([VGHRTFUpdateData alloc], "initEmpty");
    objc_msgSend(v12, "setStep:", 0);
    -[VGHRTFCaptureProcessor processCaptureData:faceData:error:](self->_captureProcessor, "processCaptureData:faceData:error:", v9, v10, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "state");
    if (v14 >= 2)
    {
      if (v14 == 2)
      {
        objc_msgSend(v12, "setStep:", _os_feature_enabled_impl() ^ 1);
        atomic_store(1u, (unsigned __int8 *)&self->_captureFinished);
      }
    }
    else
    {
      objc_msgSend(v12, "setStep:", v14);
    }
    objc_msgSend(v12, "setCaptureUpdateData:", v13);
    -[VGHRTFSessionConfig delegate](self->_config, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateWithData:error:", v12, a6);

    v17 = atomic_load((unsigned __int8 *)&self->_captureFinished);
    if ((v17 & 1) == 0)
      goto LABEL_19;
    __VGLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_249CAD000, v18, OS_LOG_TYPE_DEBUG, " Capture finished, starting post-processing... ", buf, 2u);
    }

    captureProcessor = self->_captureProcessor;
    self->_captureProcessor = 0;

    v20 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, (dispatch_queue_t)self->_timerQueue);
    *(_QWORD *)buf = 0;
    v35 = buf;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy_;
    v38 = __Block_byref_object_dispose_;
    v39 = 0;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __66__VGHRTFSession__asyncProcessCaptureData_faceData_userData_error___block_invoke;
    handler[3] = &unk_251B22C48;
    v21 = v13;
    v31 = v21;
    v32 = self;
    v33 = buf;
    dispatch_source_set_event_handler(v20, handler);
    if (a6)
      *a6 = objc_retainAutorelease(*((id *)v35 + 5));
    dispatch_source_set_timer(v20, 0, 0x3B9ACA00uLL, 0);
    dispatch_resume(v20);
    -[VGHRTFPostProcessor processCaptureUpdateData:error:](self->_postProcessor, "processCaptureUpdateData:error:", v21, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v20);
    dispatch_source_cancel(v20);
    dispatch_resume(v20);
    if (v22)
    {
      v23 = -[VGHRTFUpdateData initEmpty]([VGHRTFUpdateData alloc], "initEmpty");
      objc_msgSend(v23, "setCaptureUpdateData:", v21);
      objc_msgSend(v23, "setStep:", 3);
      objc_msgSend(v23, "setPostProcessUpdateData:", v22);
      -[VGHRTFSessionConfig delegate](self->_config, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "updateWithData:error:", v23, a6);

      __VGLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_249CAD000, v25, OS_LOG_TYPE_DEBUG, " Successfully completed post-processing ", v29, 2u);
      }
    }
    else
    {
      __VGLogSharedInstance();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_249CAD000, v26, OS_LOG_TYPE_ERROR, " Post-processing failed! ", v29, 2u);
      }

      vg::hrtf::setError(a6, CFSTR("Failed to run post-processing."));
      v23 = -[VGHRTFUpdateData initEmpty]([VGHRTFUpdateData alloc], "initEmpty");
      objc_msgSend(v23, "setCaptureUpdateData:", v21);
      objc_msgSend(v23, "setStep:", 3);
      v25 = -[VGHRTFPostProcessUpdateData initEmpty]([VGHRTFPostProcessUpdateData alloc], "initEmpty");
      -[NSObject setState:](v25, "setState:", 1);
      -[NSObject setResult:](v25, "setResult:", 0);
      objc_msgSend(v23, "setPostProcessUpdateData:", v25);
      -[VGHRTFSessionConfig delegate](self->_config, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "updateWithData:error:", v23, a6);

    }
    _Block_object_dispose(buf, 8);

    if (!v22)
      v15 = 0;
    else
LABEL_19:
      v15 = 1;

  }
  return v15;
}

void __66__VGHRTFSession__asyncProcessCaptureData_faceData_userData_error___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id obj;

  v2 = -[VGHRTFUpdateData initEmpty]([VGHRTFUpdateData alloc], "initEmpty");
  objc_msgSend(v2, "setCaptureUpdateData:", a1[4]);
  objc_msgSend(v2, "setStep:", 2);
  v3 = -[VGHRTFPostProcessUpdateData initEmpty]([VGHRTFPostProcessUpdateData alloc], "initEmpty");
  objc_msgSend(v3, "setState:", 0);
  objc_msgSend(v3, "setResult:", 0);
  objc_msgSend(v2, "setPostProcessUpdateData:", v3);
  objc_msgSend(*(id *)(a1[5] + 8), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v4, "updateWithData:error:", v2, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);

}

- (BOOL)processCaptureData:(id)a3 faceData:(id)a4 userData:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  atomic<BOOL> *p_processing;
  unsigned __int8 v14;
  NSObject *processGroup;
  NSObject *processQueue;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  p_processing = &self->_processing;
  do
    v14 = __ldaxr((unsigned __int8 *)p_processing);
  while (__stlxr(1u, (unsigned __int8 *)p_processing));
  if ((v14 & 1) != 0)
  {
    vg::hrtf::setError(a6, CFSTR("Dropped this frame while still processing a previous frame."));
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    processQueue = self->_processQueue;
    processGroup = self->_processGroup;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__VGHRTFSession_processCaptureData_faceData_userData_error___block_invoke;
    block[3] = &unk_251B22C70;
    block[4] = self;
    v19 = v10;
    v20 = v11;
    v21 = v12;
    v22 = &v23;
    dispatch_group_async(processGroup, processQueue, block);
    if (a6)
      *a6 = objc_retainAutorelease((id)v24[5]);

    _Block_object_dispose(&v23, 8);
  }

  return (v14 & 1) == 0;
}

void __60__VGHRTFSession_processCaptureData_faceData_userData_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "_asyncProcessCaptureData:faceData:userData:error:", v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  atomic_store(0, (unsigned __int8 *)(a1[4] + 56));
}

- (BOOL)waitWithError:(id *)a3
{
  intptr_t v4;

  v4 = dispatch_group_wait((dispatch_group_t)self->_processGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (v4)
    vg::hrtf::setError(a3, CFSTR("HRTF session sync failed."));
  return v4 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_processGroup, 0);
  objc_storeStrong((id *)&self->_processQueue, 0);
  objc_storeStrong((id *)&self->_postProcessor, 0);
  objc_storeStrong((id *)&self->_captureProcessor, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 28) = 0;
  return self;
}

@end
