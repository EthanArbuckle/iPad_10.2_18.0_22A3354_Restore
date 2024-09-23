@implementation VLTraceRecorder

+ (NSURL)defaultDirectory
{
  if (_MergedGlobals_2 != -1)
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_2);
  return (NSURL *)(id)qword_253E9A230;
}

void __35__VLTraceRecorder_defaultDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/Caches/VisualLocalization/Traces"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_253E9A230;
  qword_253E9A230 = v0;

}

- (VLTraceRecorder)initWithDirectory:(id)a3
{
  id v4;
  VLTraceRecorder *v5;
  uint64_t v6;
  NSURL *destinationDirectory;
  uint64_t v8;
  OS_dispatch_queue *queue;
  VLTraceRecorder *v10;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VLTraceRecorder;
  v5 = -[VLTraceRecorder init](&v13, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "isFileURL") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Trace directory must be a file URL"), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v12);
    }
    v6 = objc_msgSend(v4, "copy");
    destinationDirectory = v5->_destinationDirectory;
    v5->_destinationDirectory = (NSURL *)v6;

    geo_dispatch_queue_create_with_qos();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v5->_began.lock._os_unfair_lock_opaque = 0;
    v5->_began.didRun = 0;
    v5->_finished.lock._os_unfair_lock_opaque = 0;
    v5->_finished.didRun = 0;
    v10 = v5;
  }

  return v5;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__VLTraceRecorder_start__block_invoke;
  block[3] = &unk_24CA9BA28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __24__VLTraceRecorder_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginTraceIfNecessary");
}

- (void)finish
{
  GEOOnce();
}

void __25__VLTraceRecorder_finish__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__VLTraceRecorder_finish__block_invoke_2;
  block[3] = &unk_24CA9BA28;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __25__VLTraceRecorder_finish__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishOnIsolationQueue");
}

- (void)_beginTraceIfNecessary
{
  GEOOnce();
}

void __41__VLTraceRecorder__beginTraceIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  char v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  NSObject *v63;
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD15D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:timeZone:formatOptions:", v3, v4, 371);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("com.apple.VisualLocalization"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v68 = 0;
  LODWORD(v9) = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v68);
  v15 = v68;

  if (!(_DWORD)v9)
  {
    if (qword_253E9A240 == -1)
    {
      v63 = qword_253E9A238;
      if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = 0;

        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_253E9A240, &__block_literal_global_57);
      v63 = qword_253E9A238;
      if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
    }
    *(_DWORD *)buf = 138543362;
    v70 = v15;
    _os_log_impl(&dword_210B26000, v63, OS_LOG_TYPE_ERROR, "Failed to create trace directory: %{public}@", buf, 0xCu);
    goto LABEL_10;
  }
  if (qword_253E9A240 == -1)
  {
    v61 = qword_253E9A238;
    if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
    goto LABEL_5;
  }
  dispatch_once(&qword_253E9A240, &__block_literal_global_57);
  v61 = qword_253E9A238;
  if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138543362;
    v70 = v16;
    _os_log_impl(&dword_210B26000, v61, OS_LOG_TYPE_DEBUG, "Created temporary trace directory: %{public}@", buf, 0xCu);
  }
LABEL_11:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "URLByAppendingPathComponent:", CFSTR("images"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 48);
  *(_QWORD *)(v20 + 48) = v19;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  v67 = v15;
  v24 = objc_msgSend(v22, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v23, 1, 0, &v67);
  v25 = v67;

  if ((v24 & 1) != 0)
    goto LABEL_16;
  if (qword_253E9A240 != -1)
  {
    dispatch_once(&qword_253E9A240, &__block_literal_global_57);
    v26 = qword_253E9A238;
    if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    goto LABEL_14;
  }
  v26 = qword_253E9A238;
  if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
  {
LABEL_14:
    *(_DWORD *)buf = 138543362;
    v70 = v25;
    _os_log_impl(&dword_210B26000, v26, OS_LOG_TYPE_ERROR, "Failed to create images directory: %{public}@", buf, 0xCu);
  }
LABEL_15:
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = 0;

  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 48);
  *(_QWORD *)(v29 + 48) = 0;

LABEL_16:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "URLByAppendingPathComponent:", CFSTR("parameters"));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(void **)(v32 + 56);
  *(_QWORD *)(v32 + 56) = v31;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v66 = v25;
  v36 = objc_msgSend(v34, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v35, 1, 0, &v66);
  v37 = v66;

  if ((v36 & 1) != 0)
    goto LABEL_21;
  if (qword_253E9A240 != -1)
  {
    dispatch_once(&qword_253E9A240, &__block_literal_global_57);
    v38 = qword_253E9A238;
    if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    goto LABEL_19;
  }
  v38 = qword_253E9A238;
  if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
  {
LABEL_19:
    *(_DWORD *)buf = 138543362;
    v70 = v37;
    _os_log_impl(&dword_210B26000, v38, OS_LOG_TYPE_ERROR, "Failed to create parameters directory: %{public}@", buf, 0xCu);
  }
LABEL_20:
  v39 = *(_QWORD *)(a1 + 32);
  v40 = *(void **)(v39 + 40);
  *(_QWORD *)(v39 + 40) = 0;

  v41 = *(_QWORD *)(a1 + 32);
  v42 = *(void **)(v41 + 48);
  *(_QWORD *)(v41 + 48) = 0;

  v43 = *(_QWORD *)(a1 + 32);
  v44 = *(void **)(v43 + 56);
  *(_QWORD *)(v43 + 56) = 0;

LABEL_21:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "URLByAppendingPathComponent:", CFSTR("results"));
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = *(_QWORD *)(a1 + 32);
  v47 = *(void **)(v46 + 64);
  *(_QWORD *)(v46 + 64) = v45;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  v65 = v37;
  v50 = objc_msgSend(v48, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v49, 1, 0, &v65);
  v51 = v65;

  if ((v50 & 1) == 0)
  {
    if (qword_253E9A240 == -1)
    {
      v52 = qword_253E9A238;
      if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        v53 = *(_QWORD *)(a1 + 32);
        v54 = *(void **)(v53 + 40);
        *(_QWORD *)(v53 + 40) = 0;

        v55 = *(_QWORD *)(a1 + 32);
        v56 = *(void **)(v55 + 48);
        *(_QWORD *)(v55 + 48) = 0;

        v57 = *(_QWORD *)(a1 + 32);
        v58 = *(void **)(v57 + 56);
        *(_QWORD *)(v57 + 56) = 0;

        v59 = *(_QWORD *)(a1 + 32);
        v60 = *(void **)(v59 + 64);
        *(_QWORD *)(v59 + 64) = 0;

        goto LABEL_26;
      }
    }
    else
    {
      dispatch_once(&qword_253E9A240, &__block_literal_global_57);
      v52 = qword_253E9A238;
      if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
    }
    *(_DWORD *)buf = 138543362;
    v70 = v51;
    _os_log_impl(&dword_210B26000, v52, OS_LOG_TYPE_ERROR, "Failed to create results directory: %{public}@", buf, 0xCu);
    goto LABEL_25;
  }
LABEL_26:

}

- (void)recordAttempt:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__VLTraceRecorder_recordAttempt___block_invoke;
  v7[3] = &unk_24CA9BA50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __33__VLTraceRecorder_recordAttempt___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recordAttemptOnIsolationQueue:", *(_QWORD *)(a1 + 40));
}

- (void)_recordAttemptOnIsolationQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[VLTraceRecorder _beginTraceIfNecessary](self, "_beginTraceIfNecessary");
  if (self->_baseDirectory)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "pngData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_8;
    -[NSURL URLByAppendingPathComponent:](self->_imagesDirectory, "URLByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("png"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0;
    v10 = objc_msgSend(v7, "writeToURL:options:error:", v9, 0, &v39);
    v11 = v39;
    if ((v10 & 1) == 0)
    {
      if (qword_253E9A240 != -1)
      {
        dispatch_once(&qword_253E9A240, &__block_literal_global_57);
        v12 = qword_253E9A238;
        if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        goto LABEL_6;
      }
      v12 = qword_253E9A238;
      if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
      {
LABEL_6:
        *(_DWORD *)buf = 138543362;
        v41 = v11;
        _os_log_impl(&dword_210B26000, v12, OS_LOG_TYPE_ERROR, "Failed to write image: %{public}@", buf, 0xCu);
      }
    }
LABEL_7:

LABEL_8:
    objc_msgSend(v4, "inputParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v15 = 0x24BDD1000uLL;
    if (!v14)
      goto LABEL_19;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("uuid"));
    v38 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v14, 0, &v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v38;
    if (!v16)
    {
      if (qword_253E9A240 == -1)
      {
        v23 = qword_253E9A238;
        if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
      }
      else
      {
        dispatch_once(&qword_253E9A240, &__block_literal_global_57);
        v23 = qword_253E9A238;
        if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
      }
      *(_DWORD *)buf = 138543362;
      v41 = v17;
      _os_log_impl(&dword_210B26000, v23, OS_LOG_TYPE_ERROR, "Failed to JSON-encode input parameters: %{public}@", buf, 0xCu);
      goto LABEL_18;
    }
    -[NSURL URLByAppendingPathComponent:](self->_parametersDirectory, "URLByAppendingPathComponent:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathExtension:", CFSTR("json"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    v20 = objc_msgSend(v16, "writeToURL:options:error:", v19, 0, &v37);
    v21 = v37;
    if ((v20 & 1) == 0)
    {
      if (qword_253E9A240 != -1)
      {
        dispatch_once(&qword_253E9A240, &__block_literal_global_57);
        v22 = qword_253E9A238;
        if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        goto LABEL_13;
      }
      v22 = qword_253E9A238;
      if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        *(_DWORD *)buf = 138543362;
        v41 = v21;
        _os_log_impl(&dword_210B26000, v22, OS_LOG_TYPE_ERROR, "Failed to write input parameters: %{public}@", buf, 0xCu);
      }
    }
LABEL_14:

    v15 = 0x24BDD1000;
LABEL_18:

LABEL_19:
    objc_msgSend(v4, "results");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    if (!v25)
    {
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v6, CFSTR("uuid"));
    v26 = *(void **)(v15 + 1544);
    v36 = 0;
    objc_msgSend(v26, "dataWithJSONObject:options:error:", v25, 0, &v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v36;
    if (!v27)
    {
      if (qword_253E9A240 == -1)
      {
        v34 = qword_253E9A238;
        if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
      }
      else
      {
        dispatch_once(&qword_253E9A240, &__block_literal_global_57);
        v34 = qword_253E9A238;
        if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
      }
      *(_DWORD *)buf = 138543362;
      v41 = v28;
      _os_log_impl(&dword_210B26000, v34, OS_LOG_TYPE_ERROR, "Failed to JSON-encode results: %{public}@", buf, 0xCu);
      goto LABEL_29;
    }
    -[NSURL URLByAppendingPathComponent:](self->_resultsDirectory, "URLByAppendingPathComponent:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "URLByAppendingPathExtension:", CFSTR("json"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    v31 = objc_msgSend(v27, "writeToURL:options:error:", v30, 0, &v35);
    v32 = v35;
    if ((v31 & 1) == 0)
    {
      if (qword_253E9A240 != -1)
      {
        dispatch_once(&qword_253E9A240, &__block_literal_global_57);
        v33 = qword_253E9A238;
        if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        goto LABEL_24;
      }
      v33 = qword_253E9A238;
      if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        *(_DWORD *)buf = 138543362;
        v41 = v32;
        _os_log_impl(&dword_210B26000, v33, OS_LOG_TYPE_ERROR, "Failed to write results: %{public}@", buf, 0xCu);
      }
    }
LABEL_25:

LABEL_29:
    goto LABEL_30;
  }
LABEL_31:

}

- (void)_finishOnIsolationQueue
{
  VLTraceRecorder *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSURL *destinationDirectory;
  int v8;
  id v9;
  NSURL *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  void *v26;
  VLTraceRecorder *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  BOOL v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  NSURL *baseDirectory;
  char v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  id obj;
  uint64_t v45;
  id v46;
  id v47;
  unsigned __int8 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v2 = self;
  v57 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](v2->_destinationDirectory, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    destinationDirectory = v2->_destinationDirectory;
    v53 = 0;
    v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", destinationDirectory, 1, 0, &v53);
    v9 = v53;

    if (!v8)
    {
      if (qword_253E9A240 == -1)
      {
        v42 = qword_253E9A238;
        if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
          goto LABEL_32;
      }
      else
      {
        dispatch_once(&qword_253E9A240, &__block_literal_global_57);
        v42 = qword_253E9A238;
        if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
          goto LABEL_32;
      }
      *(_DWORD *)buf = 138543362;
      v56 = v9;
      _os_log_impl(&dword_210B26000, v42, OS_LOG_TYPE_ERROR, "Failed to create trace directory: %{public}@", buf, 0xCu);
      goto LABEL_32;
    }

  }
  v10 = v2->_destinationDirectory;
  v11 = (void *)MEMORY[0x24BDD17C8];
  -[NSURL lastPathComponent](v2->_baseDirectory, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("VisualLocalization.%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](v10, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathExtension:", CFSTR("tar.gz"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_253E9A240 == -1)
  {
    v16 = qword_253E9A238;
    if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    goto LABEL_6;
  }
  dispatch_once(&qword_253E9A240, &__block_literal_global_57);
  v16 = qword_253E9A238;
  if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    *(_DWORD *)buf = 138543362;
    v56 = v15;
    _os_log_impl(&dword_210B26000, v16, OS_LOG_TYPE_INFO, "Writing trace archive to %{public}@", buf, 0xCu);
  }
LABEL_7:
  archive_write_new();
  archive_write_set_format_v7tar();
  archive_write_add_filter_gzip();
  v43 = v15;
  objc_msgSend(v15, "path");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "UTF8String");
  archive_write_open_filename();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](v2->_baseDirectory, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "subpathsAtPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v20;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v21)
  {
    v22 = v21;
    v45 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v50 != v45)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x212BCF144]();
        v27 = v2;
        -[NSURL URLByAppendingPathComponent:](v2->_baseDirectory, "URLByAppendingPathComponent:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "path");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "fileExistsAtPath:isDirectory:", v30, &v48);
        v32 = v48;

        if (v31)
          v33 = v32 == 0;
        else
          v33 = 0;
        if (v33)
        {
          v47 = 0;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v28, 0, &v47);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v47;
          if (v34)
          {
            archive_entry_new();
            objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
            archive_entry_set_pathname();
            objc_msgSend(v34, "length");
            archive_entry_set_size();
            archive_entry_set_filetype();
            archive_entry_set_perm();
            archive_write_header();
            archive_entry_free();
            v24 = objc_retainAutorelease(v34);
            objc_msgSend(v24, "bytes");
            objc_msgSend(v24, "length");
            archive_write_data();
          }
          else if (qword_253E9A240 == -1)
          {
            v36 = qword_253E9A238;
            if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
              goto LABEL_24;
          }
          else
          {
            dispatch_once(&qword_253E9A240, &__block_literal_global_57);
            v36 = qword_253E9A238;
            if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
            {
LABEL_24:
              *(_DWORD *)buf = 138543362;
              v56 = v35;
              _os_log_impl(&dword_210B26000, v36, OS_LOG_TYPE_ERROR, "Failed to read data during archiving: %{public}@", buf, 0xCu);
            }
          }

        }
        objc_autoreleasePoolPop(v26);
        v2 = v27;
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v22);
  }

  archive_write_close();
  archive_write_free();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  baseDirectory = v2->_baseDirectory;
  v46 = 0;
  v39 = objc_msgSend(v37, "removeItemAtURL:error:", baseDirectory, &v46);
  v40 = v46;

  v9 = v43;
  if ((v39 & 1) != 0)
    goto LABEL_31;
  if (qword_253E9A240 != -1)
  {
    dispatch_once(&qword_253E9A240, &__block_literal_global_57);
    v41 = qword_253E9A238;
    if (!os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    goto LABEL_30;
  }
  v41 = qword_253E9A238;
  if (os_log_type_enabled((os_log_t)qword_253E9A238, OS_LOG_TYPE_ERROR))
  {
LABEL_30:
    *(_DWORD *)buf = 138543362;
    v56 = v40;
    _os_log_impl(&dword_210B26000, v41, OS_LOG_TYPE_ERROR, "Error removing temporary directory: %{public}@", buf, 0xCu);
  }
LABEL_31:

LABEL_32:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsDirectory, 0);
  objc_storeStrong((id *)&self->_parametersDirectory, 0);
  objc_storeStrong((id *)&self->_imagesDirectory, 0);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
}

@end
