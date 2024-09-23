@implementation PCCProxyingDevice

- (PCCProxyingDevice)initWithEndpoint:(id)a3
{
  id v5;
  PCCProxyingDevice *v6;
  PCCProxyingDevice *v7;
  uint64_t v8;
  NSMutableDictionary *reqById;
  uint64_t v10;
  NSMutableDictionary *reqByTracker;
  dispatch_queue_t v12;
  OS_dispatch_queue *request_queue;
  dispatch_queue_t v14;
  OS_dispatch_queue *sync_proxy_queue;
  uint64_t v16;
  NSMutableDictionary *sync_summary;
  uint64_t v18;
  NSMutableDictionary *tasking_summary;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PCCProxyingDevice;
  v6 = -[PCCProxyingDevice init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_requestTimeout = 1200.0;
    v8 = objc_opt_new();
    reqById = v7->_reqById;
    v7->_reqById = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    reqByTracker = v7->_reqByTracker;
    v7->_reqByTracker = (NSMutableDictionary *)v10;

    v12 = dispatch_queue_create("com.apple.ProxiedCrashCopier.request_queue", 0);
    request_queue = v7->_request_queue;
    v7->_request_queue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("com.apple.OSASyncProxy.conn_queue", 0);
    sync_proxy_queue = v7->_sync_proxy_queue;
    v7->_sync_proxy_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v7->_endpoint, a3);
    -[PCCEndpoint runWithDelegate:](v7->_endpoint, "runWithDelegate:", v7);
    v16 = objc_opt_new();
    sync_summary = v7->_sync_summary;
    v7->_sync_summary = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    tasking_summary = v7->_tasking_summary;
    v7->_tasking_summary = (NSMutableDictionary *)v18;

  }
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EFE31BC8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "_setQueue:", self->_sync_proxy_queue);
  objc_msgSend(v6, "resume");

  return 1;
}

- (void)listDevices:(id)a3
{
  PCCEndpoint *endpoint;
  id v5;
  id v6;

  endpoint = self->_endpoint;
  v5 = a3;
  -[PCCEndpoint deviceIds](endpoint, "deviceIds");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void)synchronize:(id)a3 withOptions:(id)a4 onComplete:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  double requestTimeout;
  void *v30;
  int v31;
  _BOOL4 v32;
  double v33;
  NSObject *request_queue;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD block[5];
  id v42;
  void (**v43)(id, void *, _QWORD);
  _QWORD v44[10];
  _QWORD v45[10];
  _QWORD v46[2];
  _QWORD v47[2];
  uint8_t buf[4];
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[PCCEndpoint synchronize:withOptions:](self->_endpoint, "synchronize:withOptions:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("remote"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = *(double *)&v9;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "requesting remote synchronization with options: %@", buf, 0xCu);
    }
    v46[0] = CFSTR("messageType");
    v46[1] = CFSTR("options");
    v47[0] = CFSTR("synchronize");
    v47[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", v8, v14, v10);
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    v44[0] = CFSTR("requesting");
    -[NSMutableDictionary allValues](self->_reqById, "allValues");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "valueForKey:", CFSTR("description"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v39;
    v44[1] = CFSTR("tracking");
    -[NSMutableDictionary allKeys](self->_reqByTracker, "allKeys");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v38;
    v44[2] = CFSTR("timeout");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_requestTimeout);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v37;
    v44[3] = CFSTR("timer");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_expiryTimer != 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v36;
    v44[4] = CFSTR("transaction");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_txn != 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v35;
    v44[5] = CFSTR("files");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->file_count);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45[5] = v17;
    v44[6] = CFSTR("msgs");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->msg_count);
    v18 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[6] = v19;
    v44[7] = CFSTR("connections");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->up_count);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45[7] = v20;
    v44[8] = CFSTR("requests");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->request_count);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[8] = v21;
    v44[9] = CFSTR("expirations");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->expire_count);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[9] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, v23, v18);

    v11 = v18;
    v24 = v40;
LABEL_7:

    goto LABEL_18;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("set-expire"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("set-expire"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "intValue");

    if (v27 <= 5)
      v28 = 5;
    else
      v28 = v27;
    if (v28 >= 0xE10)
      v28 = 3600;
    self->_requestTimeout = (double)v28;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      requestTimeout = self->_requestTimeout;
      *(_DWORD *)buf = 134217984;
      v49 = requestTimeout;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "requestTimeout set to %.0f secs", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requestTimeout set to %.0f secs"), *(_QWORD *)&self->_requestTimeout);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, v14, v11);
    goto LABEL_17;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("test-expire"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "BOOLValue");

  v32 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v32)
    {
      v33 = self->_requestTimeout / 60.0;
      *(_DWORD *)buf = 134217984;
      v49 = v33;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "starting bogus request; wait for expiration in %.1f mins",
        buf,
        0xCu);
    }
    -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", v8, &unk_1E9552578, 0);
    request_queue = self->_request_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PCCProxyingDevice_synchronize_withOptions_onComplete___block_invoke;
    block[3] = &unk_1E954CEF8;
    v43 = v10;
    block[4] = self;
    v42 = v11;
    dispatch_async(request_queue, block);

    v24 = v43;
    goto LABEL_7;
  }
  if (v32)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "local synchronization", buf, 2u);
  }
  ((void (**)(id, void *, void *))v10)[2](v10, CFSTR("local-Ok"), v11);
LABEL_18:

}

void __56__PCCProxyingDevice_synchronize_withOptions_onComplete___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 32), "allValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("description"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, a1[5]);

}

- (void)handleConnection:(BOOL)a3 from:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    ++self->up_count;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v7 = MEMORY[0x1E0C81028];
      v8 = "remote ProxiedDevice connected";
      v9 = (uint8_t *)&v11;
LABEL_6:
      _os_log_impl(&dword_1D3A90000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 0;
    v7 = MEMORY[0x1E0C81028];
    v8 = "remote ProxiedDevice disconnected";
    v9 = (uint8_t *)&v10;
    goto LABEL_6;
  }

}

- (void)handleMessage:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ++self->msg_count;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("messageType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("updateProxiedDeviceMetadata")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceMetadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "updateProxiedDeviceMetadata:\n%@", buf, 0xCu);
    }
    if (!v9)
      -[PCCProxyingDevice handleMessage:from:].cold.1();
    -[PCCProxyingDevice updateProxiedDeviceMetadata:from:](self, "updateProxiedDeviceMetadata:from:", v9, v7);
    -[PCCProxyingDevice finishRequestWithMessage:result:](self, "finishRequestWithMessage:result:", v6, v9);

  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("jobStatus")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("error_domain"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_12;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("error_code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (int)objc_msgSend(v12, "intValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("error_info"), *MEMORY[0x1E0CB2D50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v10, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = v16;
      v18 = v17;
    }
    else
    {
LABEL_12:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("content"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = 0;
    }
    -[PCCProxyingDevice finishRequestWithMessage:result:](self, "finishRequestWithMessage:result:", v6, v17);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown message %@", buf, 0xCu);
  }

}

- (void)summarizeLog:(id)a3 reason:(id)a4
{
  NSMutableDictionary *sync_summary;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v10 = a4;
  sync_summary = self->_sync_summary;
  v7 = (__CFString *)a3;
  -[NSMutableDictionary objectForKeyedSubscript:](sync_summary, "objectForKeyedSubscript:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sync_summary, "setObject:forKeyedSubscript:", v8, v10);
  }
  if (-[__CFString length](v7, "length"))
    v9 = v7;
  else
    v9 = CFSTR("unknown");
  objc_msgSend(v8, "_accumulateKey:value:", v9, 1);

}

- (BOOL)isFilenameReasonable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "stringByStandardizingPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  if (v6 != 1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "FAILED untrusted filename validation '%{public}@'", (uint8_t *)&v8, 0xCu);
  }

  return v6 == 1;
}

- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  _BOOL4 v59;
  id v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  _BOOL4 v67;
  id v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  int v73;
  NSDate *v74;
  NSDate *lastTouch;
  __CFString *v76;
  __CFString *v77;
  __CFString *v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  const __CFString *v88;
  const __CFString *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[3];
  _QWORD v103[3];
  uint64_t v104;
  const __CFString *v105;
  uint64_t v106;
  const __CFString *v107;
  uint64_t v108;
  const __CFString *v109;
  uint64_t v110;
  const __CFString *v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  id v117;
  _BYTE v118[128];
  _QWORD v119[4];
  _QWORD v120[4];
  uint64_t v121;
  _QWORD v122[4];

  v122[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v92 = a4;
  v9 = a5;
  ++self->file_count;
  v10 = objc_alloc(MEMORY[0x1E0D64EC8]);
  v94 = v8;
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithPath:forRouting:usingConfig:options:error:", v11, CFSTR("<sync>"), v12, &unk_1E95525A0, 0);

  objc_msgSend(v13, "closeFileStream");
  v93 = v13;
  objc_msgSend(v13, "bugType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v9;
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("211")))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "optInApple") & 1) != 0
    || (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("device_class")),
        (v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_7:
    goto LABEL_8;
  }
  v17 = (void *)v16;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("device_class"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intValue");

  v9 = v96;
  if (v19 != 7)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v104 = *MEMORY[0x1E0CB2D50];
    v105 = CFSTR("failed opt-out");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("ProxyCompanionLogTransferErrorDomain"), 6, v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", CFSTR("211"), CFSTR("failed-opt-out"));
    v95 = 0;
    goto LABEL_50;
  }
LABEL_8:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("proxied_dev"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("ProxiedDevice-"), "stringByAppendingString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PCCProxyingDevice isFilenameReasonable:](self, "isFilenameReasonable:", v24))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PCCProxyingDevice isFilenameReasonable:](self, "isFilenameReasonable:", v25))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("subdir"));
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0D64EE0];
      objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "pathSubmission");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        v30 = (const __CFString *)v26;
      else
        v30 = &stru_1E954D0B0;
      objc_msgSend(v24, "stringByAppendingPathComponent:", v30, v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = *MEMORY[0x1E0D65000];
      v122[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "ensureUsablePath:component:options:", v29, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v91 = v33;
      if (v33)
      {
        objc_msgSend(v33, "stringByAppendingPathComponent:", v25);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "pathSubmission");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v120[0] = v37;
        v120[1] = v24;
        v120[2] = CFSTR("Retired");
        v120[3] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 4);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "pathWithComponents:", v38);
        v39 = v25;
        v40 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v119[0] = v34;
        v95 = (void *)v34;
        v42 = (void *)v34;
        v43 = (void *)v40;
        v25 = v39;
        objc_msgSend(v42, "stringByAppendingPathExtension:", CFSTR("synced"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v119[1] = v44;
        v119[2] = v43;
        objc_msgSend(v43, "stringByAppendingPathExtension:", CFSTR("synced"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v119[3] = v45;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 4);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v47 = v46;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v98, v118, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v99;
LABEL_16:
          v51 = 0;
          while (1)
          {
            if (*(_QWORD *)v99 != v50)
              objc_enumerationMutation(v47);
            v52 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v51);
            if (objc_msgSend(v41, "fileExistsAtPath:", v52))
              break;
            if (v49 == ++v51)
            {
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v98, v118, 16);
              if (v49)
                goto LABEL_16;
              goto LABEL_33;
            }
          }
          objc_msgSend(v95, "pathExtension");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("ips"));

          v59 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
          if (v58)
          {
            if (v59)
            {
              *(_DWORD *)buf = 138543362;
              v113 = v52;
              _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Duplicate log detected at %{public}@", buf, 0xCu);
            }
            v60 = v52;

            -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", v25, CFSTR("failed-duplicate"));
            v22 = 0;
            v61 = CFSTR("<unknown>");
            v95 = v60;
            v9 = v96;
            goto LABEL_45;
          }
          if (v59)
          {
            *(_DWORD *)buf = 138543362;
            v113 = v52;
            _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "overwriting file at %{public}@", buf, 0xCu);
          }
          objc_msgSend(v41, "removeItemAtPath:error:", v52, 0);
        }
LABEL_33:

        objc_msgSend(v94, "path");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = 0;
        v66 = objc_msgSend(v41, "moveItemAtPath:toPath:error:", v65, v95, &v97);
        v22 = v97;

        v67 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
        if (v66)
        {
          if (v67)
          {
            *(_DWORD *)buf = 138543362;
            v113 = v95;
            _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "incoming log %{public}@", buf, 0xCu);
          }
          objc_msgSend(v93, "rename:", v95);
          v68 = v25;
          objc_msgSend(v68, "pathExtension");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "isEqualToString:", CFSTR("synced"));

          if (v70)
          {
            objc_msgSend(v68, "stringByDeletingPathExtension");
            v71 = objc_claimAutoreleasedReturnValue();

            v68 = (id)v71;
          }
          objc_msgSend(v68, "pathExtension");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(&unk_1E9552668, "containsObject:", v72);

          if (v73)
          {
            objc_msgSend(v93, "bugType");
            v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v9 = v96;
            -[PCCProxyingDevice receivedReport:from:metadata:](self, "receivedReport:from:metadata:", v93, v92, v96);
          }
          else
          {
            objc_msgSend(v68, "pathExtension");
            v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v9 = v96;
          }
          -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", v61, CFSTR("received"));

LABEL_45:
          v64 = v90;
        }
        else
        {
          v9 = v96;
          v64 = v90;
          if (v67)
          {
            *(_DWORD *)buf = 138543874;
            v113 = v94;
            v114 = 2114;
            v115 = v95;
            v116 = 2114;
            v117 = v22;
            _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "FAILED to activate %{public}@ -> %{public}@ : %{public}@", buf, 0x20u);
          }
          -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", v25, CFSTR("failed-move"));
          v61 = CFSTR("<unknown>");
        }

      }
      else
      {
        v62 = (void *)MEMORY[0x1E0CB35C8];
        v110 = *MEMORY[0x1E0CB2D50];
        v111 = CFSTR("failed untrusted path validation");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("ProxyCompanionLogTransferErrorDomain"), 6, v63);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", v25, CFSTR("failed-path"));
        v95 = 0;
        v9 = v96;
        v64 = v90;
      }

    }
    else
    {
      v55 = (void *)MEMORY[0x1E0CB35C8];
      v108 = *MEMORY[0x1E0CB2D50];
      v109 = CFSTR("failed untrusted filename validation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("ProxyCompanionLogTransferErrorDomain"), 6, v56);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", CFSTR("<untrusted>"), CFSTR("failed-filename"));
      v95 = 0;
    }

  }
  else
  {
    v53 = (void *)MEMORY[0x1E0CB35C8];
    v106 = *MEMORY[0x1E0CB2D50];
    v107 = CFSTR("failed untrusted proxy validation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("ProxyCompanionLogTransferErrorDomain"), 6, v54);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", CFSTR("<untrusted>"), CFSTR("failed-proxy-data"));
    v95 = 0;
  }

LABEL_50:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v74 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastTouch = self->_lastTouch;
  self->_lastTouch = v74;

  if (v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PCCProxyingDevice handleFile:from:metadata:].cold.2((uint64_t)v94, (uint64_t)v92, (uint64_t)v22);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("jobId"));
  v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("jobEvent"));
  v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("jobType"));
  v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("jobStatus"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v80 = 0;
  }
  if (objc_msgSend(v80, "BOOLValue"))
  {
    v81 = CFSTR("<unsolicited>");
    v102[0] = CFSTR("jobId");
    v102[1] = CFSTR("jobType");
    v82 = CFSTR("xfer-file");
    if (v76)
      v81 = v76;
    if (v78)
      v82 = v78;
    v103[0] = v81;
    v103[1] = v82;
    v102[2] = CFSTR("jobEvent");
    v83 = CFSTR("<legacy>");
    if (v77)
      v83 = v77;
    v103[2] = v83;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 3);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v95;
    if (v22)
      v86 = v22;
    else
      v86 = v95;
    -[PCCProxyingDevice finishRequestWithMessage:result:](self, "finishRequestWithMessage:result:", v84, v86);

    v87 = v96;
  }
  else
  {
    v85 = v95;
    v87 = v96;
    if (v76)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[PCCProxyingDevice handleFile:from:metadata:].cold.1((uint64_t)v79);
      if (v77)
        v88 = v77;
      else
        v88 = CFSTR("unsolicited");
      if (v78)
        v89 = v78;
      else
        v89 = CFSTR("xfer-group");
      -[PCCProxyingDevice addRequest:event:type:onComplete:](self, "addRequest:event:type:onComplete:", v76, v88, v89, 0);
    }
  }

}

- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *request_queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  request_queue = self->_request_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__PCCProxyingDevice_ack_result_error___block_invoke;
  v13[3] = &unk_1E954CE58;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(request_queue, v13);

}

void __38__PCCProxyingDevice_ack_result_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8250B74]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "type");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "jid");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412546;
        v7 = v4;
        v8 = 2112;
        v9 = v5;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "request %@ (%@) acknowledged", (uint8_t *)&v6, 0x16u);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishRequest:result:", v3, *(_QWORD *)(a1 + 48));
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

  objc_autoreleasePoolPop(v2);
}

- (void)updateProxiedDeviceMetadata:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  id v41;
  void *v42;
  PCCProxyingDevice *v43;
  id obj;
  uint64_t v45;
  void *v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[3];
  _QWORD v53[3];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;
  _QWORD v62[4];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("crashreporter_key"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v43 = self;
  if (-[PCCProxyingDevice isFilenameReasonable:](self, "isFilenameReasonable:", v8))
  {
    v9 = (void *)MEMORY[0x1E0D64EE0];
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathSubmission");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Bridge")))
      v12 = CFSTR("Bridge");
    else
      v12 = v8;
    objc_msgSend(CFSTR("ProxiedDevice-"), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = *MEMORY[0x1E0D65000];
    v62[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ensureUsablePath:component:options:", v11, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("deviceMetadata.proxy"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v16;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "writing: %@", buf, 0xCu);
      }
      v17 = (void *)objc_msgSend(v6, "mutableCopy");
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      objc_msgSend(v18, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("proxyingDeviceTimeAtLastUpdate"));

      if ((objc_msgSend(v17, "writeToFile:atomically:", v16, 1) & 1) == 0
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v16;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "FAILED to write metadata update: %@", buf, 0xCu);
      }
      if ((OSAIsRSDHost() & 1) == 0)
      {
        v38 = v17;
        v39 = v16;
        v40 = v8;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("currentTaskingIDByRouting"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allKeys");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        obj = v22;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v23)
        {
          v24 = v23;
          v45 = *(_QWORD *)v49;
          v41 = v6;
          v42 = v15;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v49 != v45)
                objc_enumerationMutation(obj);
              v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("currentTaskingIDByRouting"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKeyedSubscript:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("tasking"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "stringByAppendingPathExtension:", v26);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "stringByAppendingPathExtension:", CFSTR("proxy"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              v47 = 0;
              if (objc_msgSend(v46, "fileExistsAtPath:isDirectory:", v31, &v47))
                v32 = v47 == 0;
              else
                v32 = 0;
              if (v32)
              {
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v31);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("taskingID"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v34;
                if (v34 && (objc_msgSend(v34, "isEqualToString:", v28) & 1) == 0)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v55 = v26;
                    v56 = 2112;
                    v57 = v35;
                    v58 = 2112;
                    v59 = v28;
                    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "updated staged tasking %@ '%@ <- %@'", buf, 0x20u);
                  }
                  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("payload"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PCCProxyingDevice deliver:tasking:taskId:fromBlob:](v43, "deliver:tasking:taskId:fromBlob:", v7, v26, v35, v36);

                  v52[0] = CFSTR("action");
                  v52[1] = CFSTR("taskId");
                  v53[0] = CFSTR("delivered");
                  v53[1] = v35;
                  v52[2] = CFSTR("blob");
                  v53[2] = v31;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v43->_tasking_summary, "setObject:forKeyedSubscript:", v37, v26);

                  v6 = v41;
                  v15 = v42;
                }
                else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v55 = v26;
                  v56 = 2112;
                  v57 = v28;
                  _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no change staged tasking %@ '%@'", buf, 0x16u);
                }

              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v26;
                _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no staged tasking %@", buf, 0xCu);
              }

            }
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          }
          while (v24);
        }

        v16 = v39;
        v8 = v40;
        v17 = v38;
      }

    }
  }

}

- (void)deliver:(id)a3 tasking:(id)a4 taskId:(id)a5 fromBlob:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  v23[0] = CFSTR("messageType");
  v23[1] = CFSTR("forRouting");
  v23[2] = CFSTR("withTaskingId");
  v24[0] = CFSTR("acceptTasking");
  v14 = CFSTR("-1");
  if (v12)
    v14 = v12;
  v24[1] = v11;
  v24[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v12)
  {
    v17 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("-1"));
    if (v13)
    {
      if ((v17 & 1) == 0)
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("settings"));
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = CFSTR("acceptTasking");
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "posted %@-%@", (uint8_t *)&v19, 0x16u);
  }
  v18 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v10, v16, 0);

}

- (void)request:(id)a3 transferGroupWithOptions:(id)a4 onComplete:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("allFiles"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v18[0] = CFSTR("initiateLogTransfer");
  v17[0] = CFSTR("messageType");
  v17[1] = CFSTR("allFiles");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  v17[2] = CFSTR("jobEvent");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("event"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("event"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("<unknown>");
  }
  v18[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", v10, v16, v9);

  if (v14)
}

- (void)request:(id)a3 transferLog:(id)a4 withOptions:(id)a5 onComplete:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[3];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "transferLog options %@", buf, 0xCu);
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("event"), CFSTR("messageType"), CFSTR("logFile"), CFSTR("jobEvent"), CFSTR("initiateLogTransfer"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("event"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("<unknown>");
  }
  v18[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", v10, v16, v13);

  if (v14)
}

- (void)request:(id)a3 transferLog:(id)a4 onComplete:(id)a5
{
  -[PCCProxyingDevice request:transferLog:withOptions:onComplete:](self, "request:transferLog:withOptions:onComplete:", a3, a4, 0, a5);
}

- (void)request:(id)a3 logListWithOptions:(id)a4 onComplete:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("path"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v14[0] = CFSTR("messageType");
  v14[1] = CFSTR("path");
  v12 = &stru_1E954D0B0;
  if (v10)
    v12 = (const __CFString *)v10;
  v15[0] = CFSTR("initiateLogList");
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", v9, v13, v8);

}

- (void)request:(id)a3 logList:(id)a4
{
  -[PCCProxyingDevice request:logListWithOptions:onComplete:](self, "request:logListWithOptions:onComplete:", a3, 0, a4);
}

- (void)requestProxyMetadata:(id)a3 onComplete:(id)a4
{
  -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", a3, &unk_1E95525C8, a4);
}

- (void)startRequest:(id)a3 message:(id)a4 onComplete:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *request_queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  request_queue = self->_request_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__PCCProxyingDevice_startRequest_message_onComplete___block_invoke;
  v15[3] = &unk_1E954CF20;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(request_queue, v15);

}

void __53__PCCProxyingDevice_startRequest_message_onComplete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  PCCRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 92);
  v2 = (void *)MEMORY[0x1D8250B74]();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("jobId"));
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(a1 + 48);
  v17 = 0;
  objc_msgSend(v6, "send:message:error:", v7, v5, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (!v9)
  {
    v11 = -[PCCRequest initWithMessage:options:]([PCCRequest alloc], "initWithMessage:options:", v5, 0);
    v12 = *(void **)(a1 + 56);
    if (v12)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PCCRequest setCallback:](v11, "setCallback:", v13);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v11, v4);
    if (v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v11, v8);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[PCCRequest type](v11, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v14;
        v20 = 2112;
        v21 = v4;
        v15 = MEMORY[0x1E0C81028];
        v16 = "request %@ (%@) enroute";
LABEL_11:
        _os_log_impl(&dword_1D3A90000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[PCCRequest type](v11, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v4;
      v15 = MEMORY[0x1E0C81028];
      v16 = "request %@ (%@) sent";
      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 32), "startTimer");

    goto LABEL_13;
  }
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v9);
LABEL_13:

  objc_autoreleasePoolPop(v2);
}

- (void)addRequest:(id)a3 event:(id)a4 type:(id)a5 onComplete:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *request_queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  request_queue = self->_request_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PCCProxyingDevice_addRequest_event_type_onComplete___block_invoke;
  block[3] = &unk_1E954CF48;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(request_queue, block);

}

void __54__PCCProxyingDevice_addRequest_event_type_onComplete___block_invoke(uint64_t a1)
{
  void *v2;
  PCCRequest *v3;
  PCCRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8250B74]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (PCCRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [PCCRequest alloc];
    v9 = *(_OWORD *)(a1 + 40);
    v8[0] = CFSTR("jobId");
    v8[1] = CFSTR("jobEvent");
    v8[2] = CFSTR("jobType");
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, v8, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[PCCRequest initWithMessage:options:](v4, "initWithMessage:options:", v5, 0);

    v6 = *(void **)(a1 + 64);
    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PCCRequest setCallback:](v3, "setCallback:", v7);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "startTimer");
  }

  objc_autoreleasePoolPop(v2);
}

- (void)finishRequest:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *request_queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  PCCProxyingDevice *v14;

  v6 = a3;
  v7 = a4;
  request_queue = self->_request_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PCCProxyingDevice_finishRequest_result___block_invoke;
  block[3] = &unk_1E954CE30;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(request_queue, block);

}

void __42__PCCProxyingDevice_finishRequest_result___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8250B74]();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "type");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "jid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = *(const __CFString **)(a1 + 40);
    else
      v5 = CFSTR("Ok");
    *(_DWORD *)buf = 138412802;
    v23 = v3;
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "request %@ (%@) complete %@", buf, 0x20u);

  }
  v6 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = CFSTR("error");
  else
    v9 = CFSTR("success");
  objc_msgSend(v6, "diagnosticResultsEvent:type:result:", v7, v8, v9);

  v10 = *(void **)(*(_QWORD *)(a1 + 48) + 32);
  objc_msgSend(*(id *)(a1 + 32), "jid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v11);

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__PCCProxyingDevice_finishRequest_result___block_invoke_316;
    v19[3] = &unk_1E954CF70;
    v20 = *(id *)(a1 + 40);
    v21 = v12;
    dispatch_async(v13, v19);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "no handler installed?", buf, 2u);
  }
  v14 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v14 + 48) && !objc_msgSend(*(id *)(v14 + 32), "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no outstanding requests; releasing transaction",
        buf,
        2u);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 48) + 48));
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(void **)(v15 + 48);
    *(_QWORD *)(v15 + 48) = 0;

    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(void **)(v17 + 56);
    *(_QWORD *)(v17 + 56) = 0;

  }
  objc_autoreleasePoolPop(v2);
}

void __42__PCCProxyingDevice_finishRequest_result___block_invoke_316(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1D8250B74]();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(_QWORD *)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = 0;
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v4);
  objc_autoreleasePoolPop(v2);
}

- (void)finishRequestWithMessage:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *request_queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  PCCProxyingDevice *v14;

  v6 = a3;
  v7 = a4;
  request_queue = self->_request_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PCCProxyingDevice_finishRequestWithMessage_result___block_invoke;
  block[3] = &unk_1E954CE30;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(request_queue, block);

}

void __53__PCCProxyingDevice_finishRequestWithMessage_result___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8250B74]();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("jobId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("<unsolicited>")))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("jobType"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = *(const __CFString **)(a1 + 40);
        else
          v6 = CFSTR("Ok");
        v17 = 138412802;
        v18 = v4;
        v19 = 2112;
        v20 = v5;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "job %@ %@ completed %@", (uint8_t *)&v17, 0x20u);
      }
      v14 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("jobEvent"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = CFSTR("error");
      else
        v16 = CFSTR("success");
      objc_msgSend(v14, "diagnosticResultsEvent:type:result:", v15, v5, v16);

      goto LABEL_23;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v4;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unknown job id %@", (uint8_t *)&v17, 0xCu);
      }
      goto LABEL_23;
    }
LABEL_10:
    objc_msgSend(*(id *)(a1 + 48), "finishRequest:result:", v5, *(_QWORD *)(a1 + 40));
LABEL_23:

    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("messageType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("updateProxiedDeviceMetadata"));

  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "objectForKeyedSubscript:", CFSTR("<unsolicited>"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_23;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("messageType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("initiateLogList"));

  if ((v10 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("messageType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("synchronize"));

    if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unknown finishing message %@", (uint8_t *)&v17, 0xCu);
    }
  }
LABEL_24:

  objc_autoreleasePoolPop(v2);
}

- (void)diagnosticResultsEvent:(id)a3 type:(id)a4 result:(id)a5
{
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint8_t buf[16];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[4];
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("xfer-group")) & 1) != 0
    || (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("xfer-all")) & 1) != 0
    || -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("xfer-file")))
  {
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "appleInternal");

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v31;
      v35[0] = CFSTR("time");
      v35[1] = CFSTR("version");
      objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "buildVersion");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("<unknown>");
      if (v8)
        v17 = v8;
      else
        v17 = CFSTR("<unknown>");
      v36[1] = v14;
      v36[2] = v17;
      v35[2] = CFSTR("event");
      v35[3] = CFSTR("transfer");
      if (v9)
        v16 = v9;
      v33[0] = CFSTR("type");
      v33[1] = CFSTR("result");
      v34[0] = v16;
      v34[1] = v10;
      v30 = v10;
      v33[2] = CFSTR("summary");
      v34[2] = self->_sync_summary;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      if (-[NSMutableDictionary count](self->_tasking_summary, "count"))
        objc_msgSend(v20, "setObject:forKeyedSubscript:", self->_tasking_summary, CFSTR("taskings"));
      objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pathDiagnostics");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3940];
      OSANSDateFormat();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("transfer-%@"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingPathComponent:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByAppendingPathExtension:", CFSTR("results"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v20, "writeToFile:atomically:", v27, 1) & 1) != 0)
      {
        v10 = v30;
      }
      else
      {
        v10 = v30;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failed to write results file, saving as txt", buf, 2u);
        }
        objc_msgSend(v27, "stringByAppendingPathExtension:", CFSTR("txt"));
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "description");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "writeToFile:atomically:encoding:error:", v28, 1, 4, 0);

        v27 = (void *)v28;
      }

    }
    -[NSMutableDictionary removeAllObjects](self->_sync_summary, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_tasking_summary, "removeAllObjects");
  }

}

- (void)startTimer
{
  NSObject *request_queue;
  _QWORD block[5];

  request_queue = self->_request_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PCCProxyingDevice_startTimer__block_invoke;
  block[3] = &unk_1E954CED0;
  block[4] = self;
  dispatch_async(request_queue, block);
}

void __31__PCCProxyingDevice_startTimer__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  dispatch_source_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint8_t v20[8];
  _QWORD handler[5];

  v2 = (void *)MEMORY[0x1D8250B74]();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;

  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v6 + 48))
  {
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v6 + 24));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 48);
    *(_QWORD *)(v8 + 48) = v7;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 48);
    v12 = dispatch_walltime(0, (uint64_t)(*(double *)(v10 + 112) * 1000000000.0));
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 48);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __31__PCCProxyingDevice_startTimer__block_invoke_2;
    handler[3] = &unk_1E954CED0;
    handler[4] = v13;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 48));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        v15 = MEMORY[0x1E0C81028];
        v16 = "re-starting request timer and extending transaction";
LABEL_7:
        _os_log_impl(&dword_1D3A90000, v15, OS_LOG_TYPE_DEFAULT, v16, v20, 2u);
      }
    }
    else
    {
      v17 = os_transaction_create();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 56);
      *(_QWORD *)(v18 + 56) = v17;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        v15 = MEMORY[0x1E0C81028];
        v16 = "starting request timer and creating transaction";
        goto LABEL_7;
      }
    }
  }
  objc_autoreleasePoolPop(v2);
}

void __31__PCCProxyingDevice_startTimer__block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id obj;
  uint8_t buf[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  const __CFString *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "timeIntervalSinceNow");
  v3 = *(_QWORD *)(a1 + 32);
  if (fabs(v2) >= *(double *)(v3 + 112))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(v3 + 32), "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      v12 = *MEMORY[0x1E0CB2D50];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 96);
          v15 = *(void **)(a1 + 32);
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v31 = v12;
          v32 = CFSTR("expired due to lack of progress");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ProxyCompanionLogTransferErrorDomain"), 5, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "finishRequest:result:", v14, v18);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v19 = MEMORY[0x1E0C81028];
    v20 = "request expiration event; releasing transaction";
    goto LABEL_17;
  }
  v4 = objc_msgSend(*(id *)(v3 + 32), "count");
  v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v5)
    {
LABEL_18:
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(v21 + 56);
      *(_QWORD *)(v21 + 56) = 0;

      dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 48));
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(v23 + 48);
      *(_QWORD *)(v23 + 48) = 0;

      return;
    }
    *(_WORD *)buf = 0;
    v19 = MEMORY[0x1E0C81028];
    v20 = "request expiration event (with no outstanding requests!); releasing transaction";
LABEL_17:
    _os_log_impl(&dword_1D3A90000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    goto LABEL_18;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "re-starting request timer thereby extending transaction", buf, 2u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 48);
  v8 = dispatch_walltime(0, (uint64_t)(*(double *)(v6 + 112) * 1000000000.0));
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (double)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(double)a3
{
  self->_requestTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sync_proxy_queue, 0);
  objc_storeStrong((id *)&self->_tasking_summary, 0);
  objc_storeStrong((id *)&self->_sync_summary, 0);
  objc_storeStrong((id *)&self->_txn, 0);
  objc_storeStrong((id *)&self->_expiryTimer, 0);
  objc_storeStrong((id *)&self->_reqByTracker, 0);
  objc_storeStrong((id *)&self->_reqById, 0);
  objc_storeStrong((id *)&self->_request_queue, 0);
  objc_storeStrong((id *)&self->_lastTouch, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)handleMessage:from:.cold.1()
{
  __assert_rtn("-[PCCProxyingDevice handleMessage:from:]", "PCCProxyingDevice.m", 226, "deviceMetadata");
}

- (void)handleFile:(uint64_t)a1 from:metadata:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "file status update %@", (uint8_t *)&v1, 0xCu);
}

- (void)handleFile:(uint64_t)a1 from:(uint64_t)a2 metadata:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138543874;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  v7 = 2114;
  v8 = a3;
  _os_log_error_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error handling %{public}@ from proxying device (%{public}@): %{public}@", (uint8_t *)&v3, 0x20u);
}

@end
