@implementation PCCProxiedDevice

- (PCCProxiedDevice)initWithEndpoint:(id)a3
{
  id v5;
  PCCProxiedDevice *v6;
  PCCProxiedDevice *v7;
  uint64_t v8;
  NSMutableDictionary *jobByTracker;
  dispatch_queue_t v10;
  OS_dispatch_queue *job_queue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PCCProxiedDevice;
  v6 = -[PCCProxiedDevice init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_jobTimeout = 1200.0;
    v8 = objc_opt_new();
    jobByTracker = v7->_jobByTracker;
    v7->_jobByTracker = (NSMutableDictionary *)v8;

    v10 = dispatch_queue_create("com.apple.ProxiedCrashCopier.job_queue", 0);
    job_queue = v7->_job_queue;
    v7->_job_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v7->_endpoint, a3);
    -[PCCEndpoint runWithDelegate:](v7->_endpoint, "runWithDelegate:", v7);
  }

  return v7;
}

- (void)handleConnection:(BOOL)a3 from:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    ++self->up_count;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "remote ProxyingDevice connected, initiating group xfer", buf, 2u);
    }
    -[PCCProxiedDevice initiate:transferGroupWithOptions:job:](self, "initiate:transferGroupWithOptions:job:", v6, &unk_1E9552550, 0);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "remote ProxyingDevice disconnected", v7, 2u);
  }

}

- (void)handleMessage:(id)a3 from:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  int v53;
  int v54;
  void *v55;
  void *v56;
  double jobTimeout;
  id v58;
  void *v59;
  int v60;
  NSObject *job_queue;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __CFString *v73;
  void *v74;
  id v75;
  _QWORD block[5];
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[4];
  _QWORD v88[4];
  _QWORD v89[9];
  _QWORD v90[9];
  _QWORD v91[4];
  _QWORD v92[4];
  _QWORD v93[4];
  _QWORD v94[4];
  _BYTE v95[128];
  uint64_t v96;
  void *v97;
  uint8_t buf[4];
  const __CFString *v99;
  __int16 v100;
  __CFString *v101;
  __int16 v102;
  const __CFString *v103;
  __int16 v104;
  id v105;
  __int16 v106;
  void *v107;
  _QWORD v108[3];
  _QWORD v109[6];

  v109[3] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  ++self->msg_count;
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("messageType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("initiateMetadataUpdate")))
  {
    v9 = v6;
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("jobId"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v109[0] = CFSTR("updateProxiedDeviceMetadata");
    v108[0] = CFSTR("messageType");
    v108[1] = CFSTR("deviceMetadata");
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadata");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v108[2] = CFSTR("jobId");
    v14 = CFSTR("<unknown-job>");
    if (v10)
      v14 = v10;
    v109[1] = v12;
    v109[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v99 = CFSTR("initiateMetadataUpdate");
      v100 = 2112;
      v101 = v10;
      v102 = 2112;
      v103 = CFSTR("updateProxiedDeviceMetadata");
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "received request %@ (%@); posting %@",
        buf,
        0x20u);
    }
    v16 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v7, v15, 0);

    v6 = v9;
    goto LABEL_24;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("acceptTasking")))
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("forRouting"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("withTaskingId"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("settings"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v99 = CFSTR("acceptTasking");
      v100 = 2112;
      v101 = v17;
      v102 = 2112;
      v103 = v18;
      v104 = 2112;
      v105 = (id)objc_opt_class();
      v106 = 2048;
      v107 = v19;
      v20 = v105;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "received request %@-%@ '%@' payload %@ %p", buf, 0x34u);

    }
    -[PCCProxiedDevice acceptTaskingPayload:forRouting:withId:](self, "acceptTaskingPayload:forRouting:withId:", v19, v17, v18);

LABEL_23:
    goto LABEL_24;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("initiateLogTransfer")))
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("jobId"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v99 = CFSTR("initiateLogTransfer");
      v100 = 2112;
      v101 = v17;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "received request %@ (%@)", buf, 0x16u);
    }
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("logFile"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[PCCProxiedDevice initiate:transferLog:withOptions:job:](self, "initiate:transferLog:withOptions:job:", v7, v18, v6, v17);
    else
      -[PCCProxiedDevice initiate:transferGroupWithOptions:job:](self, "initiate:transferGroupWithOptions:job:", v7, v6, v17);
    goto LABEL_23;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("initiateLogList")))
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("jobId"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_opt_new();
    v73 = v6;
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("path"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v7;
    v71 = v23;
    if (objc_msgSend(v23, "length"))
    {
      v96 = *MEMORY[0x1E0D64FF0];
      v97 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    v38 = (void *)MEMORY[0x1E0D64EC8];
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __39__PCCProxiedDevice_handleMessage_from___block_invoke;
    v83[3] = &unk_1E954CE08;
    v39 = v22;
    v84 = v39;
    v70 = (void *)v24;
    objc_msgSend(v38, "iterateLogsWithOptions:usingBlock:", v24, v83);
    v40 = (void *)v21;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)objc_msgSend(v39, "count");
      *(_DWORD *)buf = 138413058;
      v99 = CFSTR("initiateLogList");
      v100 = 2112;
      v101 = (__CFString *)v21;
      v102 = 2112;
      v103 = CFSTR("jobStatus");
      v104 = 2048;
      v105 = v41;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "received request %@ (%@); posting %@ %lu logs",
        buf,
        0x2Au);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v39, "count"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v43 = v39;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v80 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "path");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v48);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
      }
      while (v45);
    }

    v93[0] = CFSTR("messageType");
    v93[1] = CFSTR("jobType");
    v94[0] = CFSTR("jobStatus");
    v94[1] = CFSTR("initiateLogList");
    v93[2] = CFSTR("jobId");
    v93[3] = CFSTR("content");
    v94[2] = v40;
    v94[3] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v75;
    v50 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v75, v49, 0);

    v6 = v73;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("synchronize")))
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("jobId"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("options"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("status"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    v72 = v25;
    if (v27)
    {
      v91[0] = CFSTR("messageType");
      v91[1] = CFSTR("jobType");
      v92[0] = CFSTR("jobStatus");
      v92[1] = CFSTR("synchronize");
      v92[2] = v25;
      v91[2] = CFSTR("jobId");
      v91[3] = CFSTR("content");
      v89[0] = CFSTR("tracking");
      -[NSMutableDictionary allValues](self->_jobByTracker, "allValues");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "valueForKey:", CFSTR("description"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = v68;
      v89[1] = CFSTR("timeout");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_jobTimeout);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v90[1] = v67;
      v89[2] = CFSTR("timer");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_expiryTimer != 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v90[2] = v66;
      v89[3] = CFSTR("transaction");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_txn != 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v90[3] = v65;
      v89[4] = CFSTR("files");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->file_count);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v90[4] = v64;
      v89[5] = CFSTR("msgs");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->msg_count);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v90[5] = v28;
      v89[6] = CFSTR("connections");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->up_count);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v90[6] = v29;
      v89[7] = CFSTR("jobs");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->job_count);
      v30 = v6;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v90[7] = v31;
      v89[8] = CFSTR("expirations");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->expire_count);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v90[8] = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 9);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v92[3] = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v30;
      v35 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v7, v34, 0);

      v37 = v72;
      v36 = v74;
    }
    else
    {
      objc_msgSend(v74, "objectForKey:", CFSTR("set-expire"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("set-expire"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "intValue");

        if (v53 <= 5)
          v54 = 5;
        else
          v54 = v53;
        if (v54 >= 0xE10)
          v54 = 3600;
        self->_jobTimeout = (double)v54;
        v87[0] = CFSTR("messageType");
        v87[1] = CFSTR("jobType");
        v88[0] = CFSTR("jobStatus");
        v88[1] = CFSTR("synchronize");
        v37 = v25;
        v88[2] = v25;
        v87[2] = CFSTR("jobId");
        v87[3] = CFSTR("content");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("jobTimeout set to %.0f secs"), (double)v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v88[3] = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 4);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          jobTimeout = self->_jobTimeout;
          *(_DWORD *)buf = 134217984;
          v99 = *(const __CFString **)&jobTimeout;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "jobTimeout set to %.0f secs", buf, 0xCu);
        }
        v58 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v7, v56, 0);

        v36 = v74;
      }
      else
      {
        v36 = v74;
        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("test-expire"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "BOOLValue");

        if (v60)
        {
          job_queue = self->_job_queue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __39__PCCProxiedDevice_handleMessage_from___block_invoke_82;
          block[3] = &unk_1E954CE30;
          block[4] = self;
          v37 = v25;
          v77 = v25;
          v78 = v7;
          dispatch_async(job_queue, block);

        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "remote synchronization", buf, 2u);
          }
          v85[0] = CFSTR("messageType");
          v85[1] = CFSTR("jobType");
          v86[0] = CFSTR("jobStatus");
          v86[1] = CFSTR("synchronize");
          v85[2] = CFSTR("jobId");
          v85[3] = CFSTR("content");
          v37 = v25;
          v86[2] = v25;
          v86[3] = CFSTR("remote-Ok");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 4);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v7, v62, 0);

        }
      }
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v99 = v6;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown message %@", buf, 0xCu);
  }
LABEL_24:

}

uint64_t __39__PCCProxiedDevice_handleMessage_from___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __39__PCCProxiedDevice_handleMessage_from___block_invoke_82(uint64_t a1)
{
  double v2;
  PCCJob *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  uint8_t buf[4];
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(double *)(*(_QWORD *)(a1 + 32) + 80) / 60.0;
    *(_DWORD *)buf = 134217984;
    v11 = v2;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "starting bogus job; wait for expiration in %.1f mins",
      buf,
      0xCu);
  }
  v3 = -[PCCJob initWithID:forTarget:options:]([PCCJob alloc], "initWithID:forTarget:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v3, CFSTR("<bogus-tracker>"));
  objc_msgSend(*(id *)(a1 + 32), "startTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues", CFSTR("messageType"), CFSTR("jobType"), CFSTR("jobId"), CFSTR("content"), CFSTR("jobStatus"), CFSTR("synchronize"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "send:message:error:", *(_QWORD *)(a1 + 48), v6, 0);
}

- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PCCProxiedDevice handleFile:from:metadata:].cold.1();
}

- (void)sendDeviceMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  const __CFString *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11[0] = CFSTR("messageType");
  v11[1] = CFSTR("deviceMetadata");
  v12[0] = CFSTR("updateProxiedDeviceMetadata");
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = CFSTR("updateProxiedDeviceMetadata");
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "posted %@ (unsolicited)", (uint8_t *)&v9, 0xCu);
  }
  v8 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v4, v7, 0);

}

- (void)acceptTaskingPayload:(id)a3 forRouting:(id)a4 withId:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (OSAIsRSDDevice())
    goto LABEL_2;
  if ((objc_msgSend(CFSTR("-1"), "isEqualToString:", v9) & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ca1")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_2:
      v10 = v7;
      v7 = v10;
LABEL_5:
      v11 = (id)objc_msgSend(MEMORY[0x1E0D64EE8], "applyTasking:taskId:fromBlob:", v8, v9, v10);
      goto LABEL_6;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unknown payload format for ca1 routing", buf, 2u);
    }
LABEL_4:
    v10 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18[0] = CFSTR("PayloadContent");
    v18[1] = CFSTR("PayloadType");
    v19[0] = v7;
    v19[1] = CFSTR("Configuration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v12;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v15);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v15;
  v10 = v14;
  if (v13)
  {

    v10 = (id)v13;
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Serialization of settings to plist failed: %@", buf, 0xCu);
  }
LABEL_6:

}

- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *job_queue;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    job_queue = self->_job_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__PCCProxiedDevice_ack_result_error___block_invoke;
    v11[3] = &unk_1E954CE58;
    v11[4] = self;
    v12 = v8;
    v14 = a4;
    v13 = v9;
    dispatch_async(job_queue, v11);

  }
}

void __37__PCCProxiedDevice_ack_result_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1D8250B74]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "registerResult:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "doWork:", v3);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)initiate:(id)a3 transferGroupWithOptions:(id)a4 job:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *job_queue;
  id v13;
  __CFString *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  PCCProxiedDevice *v18;
  __CFString *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = CFSTR("<unsolicited>");
  if (a5)
    v10 = (__CFString *)a5;
  v11 = v10;
  job_queue = self->_job_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PCCProxiedDevice_initiate_transferGroupWithOptions_job___block_invoke;
  v16[3] = &unk_1E954CE80;
  v17 = v9;
  v18 = self;
  v19 = v11;
  v20 = v8;
  v13 = v8;
  v14 = v11;
  v15 = v9;
  dispatch_async(job_queue, v16);

}

void __58__PCCProxiedDevice_initiate_transferGroupWithOptions_job___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  PCCGroupJob *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8250B74]();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("allFiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("event"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("event"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("jobEvent"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("jobEvent"));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = CFSTR("<unknown>");
      }

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "jid");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "declining job %{public}@; group transfer already in progress (%{public}@)",
        buf,
        0x16u);

    }
    v17 = *(void **)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 56);
    if (v4)
      v20 = CFSTR("xfer-all");
    else
      v20 = CFSTR("xfer-group");
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("group transfer already in progress");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (PCCGroupJob *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("ProxyGizmoLogTransferErrorDomain"), 5, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "finish:target:event:type:result:", v18, v19, v7, v20, v22);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("standard");
      v9 = *(_QWORD *)(a1 + 48);
      if (v4)
        v8 = CFSTR("all");
      *(_DWORD *)buf = 138543618;
      v26 = v9;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "starting job %{public}@, transfer group '%@'", buf, 0x16u);
    }
    ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 68);
    v7 = (__CFString *)*(id *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 76))
    {
      v10 = *(void **)(a1 + 32);
      if (v10)
        v11 = (__CFString *)objc_msgSend(v10, "mutableCopy");
      else
        v11 = (__CFString *)objc_opt_new();
      v13 = v11;
      -[__CFString setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("<preserve>"));

      v7 = v13;
    }
    v14 = -[PCCGroupJob initWithID:forTarget:options:]([PCCGroupJob alloc], "initWithID:forTarget:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7);
    if (objc_msgSend(*(id *)(a1 + 40), "doWork:", v14))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), v14);
      objc_msgSend(*(id *)(a1 + 40), "startTimer");
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)initiate:(id)a3 transferLog:(id)a4 withOptions:(id)a5 job:(id)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *job_queue;
  id v16;
  id v17;
  __CFString *v18;
  id v19;
  _QWORD block[5];
  id v21;
  __CFString *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = CFSTR("<unsolicited>");
  if (a6)
    v13 = (__CFString *)a6;
  v14 = v13;
  job_queue = self->_job_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PCCProxiedDevice_initiate_transferLog_withOptions_job___block_invoke;
  block[3] = &unk_1E954CEA8;
  block[4] = self;
  v21 = v12;
  v22 = v14;
  v23 = v10;
  v24 = v11;
  v16 = v11;
  v17 = v10;
  v18 = v14;
  v19 = v12;
  dispatch_async(job_queue, block);

}

void __57__PCCProxiedDevice_initiate_transferLog_withOptions_job___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PCCJob *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8250B74]();
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 68);
  v3 = *(id *)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 76))
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
      v5 = (void *)objc_msgSend(v4, "mutableCopy");
    else
      v5 = (void *)objc_opt_new();
    v6 = v5;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("<preserve>"));

    v3 = v6;
  }
  v7 = -[PCCJob initWithID:forTarget:options:forFile:]([PCCJob alloc], "initWithID:forTarget:options:forFile:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3, *(_QWORD *)(a1 + 64));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 48);
    -[PCCJob type](v7, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 64);
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "starting job %{public}@, %{public}@ '%{public}@'", (uint8_t *)&v11, 0x20u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "doWork:", v7))
    objc_msgSend(*(id *)(a1 + 32), "startTimer");

  objc_autoreleasePoolPop(v2);
}

- (BOOL)doWork:(id)a3
{
  PCCGroupJob *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PCCEndpoint *endpoint;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  PCCGroupJob *v17;
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
  void *v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = (PCCGroupJob *)a3;
  -[PCCJob nextFilepath](v4, "nextFilepath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    ++self->file_count;
    -[PCCJob options](v4, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allFiles"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "BOOLValue"))
      v8 = 1200;
    else
      v8 = 0;
    -[PCCEndpoint setFileTimeout:](self->_endpoint, "setFileTimeout:", v8);

    endpoint = self->_endpoint;
    -[PCCJob target](v4, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E98];
    -[PCCJob nextFilepath](v4, "nextFilepath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCJob metadata](v4, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    -[PCCEndpoint send:file:metadata:error:](endpoint, "send:file:metadata:error:", v10, v13, v14, &v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v31;

    if (v15)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_jobByTracker, "setObject:forKeyedSubscript:", v4, v15);
      v17 = v4;
    }
    else
    {
      if (!v16)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB2D50];
        v37[0] = CFSTR("no send tracking id");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ProxyGizmoLogTransferErrorDomain"), 4, v24);
        v16 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[PCCJob jid](v4, "jid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v25;
        v34 = 2112;
        v35 = v16;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "aborting job %@; file send failure: %@",
          buf,
          0x16u);

      }
      -[PCCJob jid](v4, "jid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCCJob target](v4, "target");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCCJob event](v4, "event");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCCGroupJob type](v4, "type");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCCProxiedDevice finish:target:event:type:result:](self, "finish:target:event:type:result:", v26, v27, v28, v29, v16);

      if (self->_groupXferJob == v4)
      {
        self->_groupXferJob = 0;

      }
      v17 = 0;
    }

  }
  else
  {
    -[PCCJob jid](v4, "jid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCJob target](v4, "target");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCJob event](v4, "event");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCGroupJob type](v4, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCGroupJob result](v4, "result");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCProxiedDevice finish:target:event:type:result:](self, "finish:target:event:type:result:", v18, v19, v20, v21, v22);

    if (self->_groupXferJob == v4)
    {
      self->_groupXferJob = 0;

    }
    v17 = 0;
  }
  return v17 != 0;
}

- (void)finish:(id)a3 target:(id)a4 event:(id)a5 type:(id)a6 result:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char isKindOfClass;
  const __CFString *v25;
  OS_dispatch_source *expiryTimer;
  _BOOL4 v27;
  OS_dispatch_source *v28;
  OS_os_transaction *txn;
  int v30;
  id v31;
  __int16 v32;
  const __CFString *v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (__CFString *)a7;
  if (v16)
  {
    v34[0] = CFSTR("messageType");
    v34[1] = CFSTR("jobId");
    v35[0] = CFSTR("jobStatus");
    v35[1] = v12;
    v34[2] = CFSTR("jobEvent");
    v34[3] = CFSTR("jobType");
    v35[2] = v14;
    v35[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v16;
      -[__CFString domain](v19, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("error_domain"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[__CFString code](v19, "code"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("error_code"));

      -[__CFString userInfo](v19, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("error_info"));
    }
    else
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("content"));
    }
    v23 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v13, v18, 0);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v25 = CFSTR("Ok");
    if ((isKindOfClass & 1) != 0)
      v25 = v16;
    v30 = 138412546;
    v31 = v12;
    v32 = 2112;
    v33 = v25;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "completed job %@: %@", (uint8_t *)&v30, 0x16u);
  }
  if (!-[NSMutableDictionary count](self->_jobByTracker, "count"))
  {
    expiryTimer = self->_expiryTimer;
    v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (expiryTimer)
    {
      if (v27)
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no outstanding jobs; releasing transaction",
          (uint8_t *)&v30,
          2u);
      }
      dispatch_source_cancel((dispatch_source_t)self->_expiryTimer);
      v28 = self->_expiryTimer;
      self->_expiryTimer = 0;

      txn = self->_txn;
      self->_txn = 0;

    }
    else if (v27)
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no outstanding jobs (and no transactions were in play)", (uint8_t *)&v30, 2u);
    }
  }

}

- (void)startTimer
{
  NSObject *job_queue;
  _QWORD block[5];

  job_queue = self->_job_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PCCProxiedDevice_startTimer__block_invoke;
  block[3] = &unk_1E954CED0;
  block[4] = self;
  dispatch_async(job_queue, block);
}

void __30__PCCProxiedDevice_startTimer__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  dispatch_source_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[8];
  _QWORD handler[5];

  v2 = (void *)MEMORY[0x1D8250B74]();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 40))
  {
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v3 + 16));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 40);
    v9 = dispatch_walltime(0, (uint64_t)(*(double *)(v7 + 80) * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 40);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __30__PCCProxiedDevice_startTimer__block_invoke_2;
    handler[3] = &unk_1E954CED0;
    handler[4] = v10;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        v12 = MEMORY[0x1E0C81028];
        v13 = "re-starting job timer and extending transaction";
LABEL_7:
        _os_log_impl(&dword_1D3A90000, v12, OS_LOG_TYPE_DEFAULT, v13, v17, 2u);
      }
    }
    else
    {
      v14 = os_transaction_create();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 48);
      *(_QWORD *)(v15 + 48) = v14;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        v12 = MEMORY[0x1E0C81028];
        v13 = "starting job timer and creating transaction";
        goto LABEL_7;
      }
    }
  }
  objc_autoreleasePoolPop(v2);
}

void __30__PCCProxiedDevice_startTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id obj;
  void *v30;
  uint8_t buf[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  const __CFString *v37;
  _BYTE v38[128];
  uint64_t v39;

  v1 = a1;
  v39 = *MEMORY[0x1E0C80C00];
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v28 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(*(_QWORD *)(v1 + 32) + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    v26 = v1;
    v27 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastTouch");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceNow");
        v12 = fabs(v11);
        v13 = *(double *)(*(_QWORD *)(v1 + 32) + 80);

        if (v12 > v13)
        {
          ++*(_DWORD *)(*(_QWORD *)(v1 + 32) + 72);
          objc_msgSend(v28, "addObject:", v8);
          v30 = *(void **)(v1 + 32);
          objc_msgSend(v9, "jid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "target");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "event");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "type");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v6;
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v36 = v27;
          v37 = CFSTR("job expired due to lack of progress");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v20 = v5;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ProxyGizmoLogTransferErrorDomain"), 5, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "finish:target:event:type:result:", v14, v15, v16, v17, v22);

          v6 = v18;
          v1 = v26;

          v5 = v20;
          v23 = *(_QWORD *)(v26 + 32);
          if (v9 == *(void **)(v23 + 24))
          {
            *(_QWORD *)(v23 + 24) = 0;

          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "removeObjectsForKeys:", v28);
  if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(v1 + 32), "startTimer");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "job expiration event; releasing transaction",
        buf,
        2u);
    }
    v24 = *(_QWORD *)(v1 + 32);
    v25 = *(void **)(v24 + 48);
    *(_QWORD *)(v24 + 48) = 0;

  }
}

- (double)jobTimeout
{
  return self->_jobTimeout;
}

- (void)setJobTimeout:(double)a3
{
  self->_jobTimeout = a3;
}

- (BOOL)preserveFiles
{
  return self->_preserveFiles;
}

- (void)setPreserveFiles:(BOOL)a3
{
  self->_preserveFiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txn, 0);
  objc_storeStrong((id *)&self->_expiryTimer, 0);
  objc_storeStrong((id *)&self->_jobByTracker, 0);
  objc_storeStrong((id *)&self->_groupXferJob, 0);
  objc_storeStrong((id *)&self->_job_queue, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)handleFile:from:metadata:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PCCProxiedDevice unexpectedly asked to handle a file. This is a no-op", v0, 2u);
}

@end
