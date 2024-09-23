@implementation SVXTapToRadarManager

- (id)_initWithRadarFiler:(id)a3
{
  id v5;
  SVXTapToRadarManager *v6;
  SVXTapToRadarManager *v7;
  NSString *recognitionText;
  dispatch_queue_t v9;
  OS_dispatch_queue *ttrQueue;
  uint64_t v11;
  NSUserDefaults *ttrHistory;
  NSUUID *requestID;
  uint64_t v14;
  NSSet *errorsToSkipFirstTime;
  SVXRadarDraftFactory *v16;
  SVXRadarDraftFactory *radarDraftFactory;
  SVXRadarRateLimiter *v18;
  SVXRadarRateLimiter *radarRateLimiter;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SVXTapToRadarManager;
  v6 = -[SVXTapToRadarManager init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    recognitionText = v6->_recognitionText;
    v6->_recognitionText = (NSString *)&stru_24D24F378;

    v9 = dispatch_queue_create("SVXTTRManagerQueue", 0);
    ttrQueue = v7->_ttrQueue;
    v7->_ttrQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.sirivox.ttr"));
    ttrHistory = v7->_ttrHistory;
    v7->_ttrHistory = (NSUserDefaults *)v11;

    requestID = v7->_requestID;
    v7->_requestID = 0;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D26EA28);
    v14 = objc_claimAutoreleasedReturnValue();
    errorsToSkipFirstTime = v7->_errorsToSkipFirstTime;
    v7->_errorsToSkipFirstTime = (NSSet *)v14;

    v16 = objc_alloc_init(SVXRadarDraftFactory);
    radarDraftFactory = v7->_radarDraftFactory;
    v7->_radarDraftFactory = v16;

    v18 = objc_alloc_init(SVXRadarRateLimiter);
    radarRateLimiter = v7->_radarRateLimiter;
    v7->_radarRateLimiter = v18;

    objc_storeStrong((id *)&v7->_radarFiler, a3);
  }

  return v7;
}

- (id)getRMVIssueDialogIdentifiers
{
  return &unk_24D26E9C8;
}

- (id)getDomainFatalIssueDialogIdentifiers
{
  return &unk_24D26E9E0;
}

- (id)getWebSearchIssueDialogIdentifiers
{
  return &unk_24D26E9F8;
}

- (id)getEarlyCutoffUtterances
{
  return &unk_24D26EA10;
}

- (void)createProblem:(id)a3 extraContent:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *ttrQueue;
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
  ttrQueue = self->_ttrQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__SVXTapToRadarManager_createProblem_extraContent_completionHandler___block_invoke;
  v15[3] = &unk_24D24F068;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(ttrQueue, v15);

}

- (BOOL)_hasFileTTRWithRequestID:(id)a3
{
  id v4;
  NSUUID *requestID;
  NSObject *v6;
  BOOL v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  requestID = self->_requestID;
  if (requestID && -[NSUUID isEqual:](requestID, "isEqual:", v4))
  {
    v6 = *MEMORY[0x24BE08FB0];
    v7 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[SVXTapToRadarManager _hasFileTTRWithRequestID:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s A radar was prompted for request %@ before", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (BOOL)_skipFirstTimeTTR:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject **v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AFBuildVersion();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults arrayForKey:](self->_ttrHistory, "arrayForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "containsObject:", v4))
    {
      v8 = (NSObject **)MEMORY[0x24BE08FB0];
      v9 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        *(_DWORD *)buf = 136315906;
        v18 = "-[SVXTapToRadarManager _skipFirstTimeTTR:]";
        v19 = 2112;
        v20 = v4;
        v21 = 2112;
        v22 = v5;
        v23 = 2048;
        v24 = objc_msgSend(v7, "count");
        _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s Issue %@ for %@ has been invoked before. Total error count = %ld", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("ttrFiled_"), v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "containsObject:", v11))
      {
        v12 = *v8;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "-[SVXTapToRadarManager _skipFirstTimeTTR:]";
          _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s The first TTR was filed before.", buf, 0xCu);
        }
      }
      else if (!objc_msgSend(&unk_24D26EA40, "containsObject:", v4))
      {
        v15 = 0;
        goto LABEL_16;
      }
      v15 = -[SVXRadarRateLimiter isRateLimited](self->_radarRateLimiter, "isRateLimited");
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
    v13 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[SVXTapToRadarManager _skipFirstTimeTTR:]";
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s First error of build %@ occurred, clean old TTR history", buf, 0x16u);
    }
    -[NSUserDefaults removePersistentDomainForName:](self->_ttrHistory, "removePersistentDomainForName:", CFSTR("com.apple.siri.sirivox.ttr"));
  }
  v14 = *MEMORY[0x24BE08FB0];
  v15 = 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[SVXTapToRadarManager _skipFirstTimeTTR:]";
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s New issue %@ for %@ occurred. Skip radar as this is the first time", buf, 0x20u);
  }
LABEL_17:

  return v15;
}

- (BOOL)_hasFileTTRWithIssue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AFBuildVersion();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults arrayForKey:](self->_ttrHistory, "arrayForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "containsObject:", v4))
    {
      v8 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        v13 = 136315906;
        v14 = "-[SVXTapToRadarManager _hasFileTTRWithIssue:]";
        v15 = 2112;
        v16 = v4;
        v17 = 2112;
        v18 = v5;
        v19 = 2048;
        v20 = objc_msgSend(v7, "count");
        _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Issue %@ for %@ has been prompted before. Total error count = %ld", (uint8_t *)&v13, 0x2Au);

      }
    }
  }
  else
  {
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v13 = 136315394;
      v14 = "-[SVXTapToRadarManager _hasFileTTRWithIssue:]";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s First error of build %@ occurred, clean old TTR history", (uint8_t *)&v13, 0x16u);
    }
    -[NSUserDefaults removePersistentDomainForName:](self->_ttrHistory, "removePersistentDomainForName:", CFSTR("com.apple.siri.sirivox.ttr"));
  }
  v11 = -[SVXRadarRateLimiter isRateLimited](self->_radarRateLimiter, "isRateLimited");

  return v11;
}

- (void)_updateTTRHistory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSUserDefaults *ttrHistory;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    AFBuildVersion();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults arrayForKey:](self->_ttrHistory, "arrayForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      ttrHistory = self->_ttrHistory;
      v16 = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](ttrHistory, "setObject:forKey:", v12, v5);

      v13 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[SVXTapToRadarManager _updateTTRHistory:]";
        v19 = 2112;
        v20 = v5;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s First entry created for build %@, with error %@", buf, 0x20u);
      }
      goto LABEL_13;
    }
    if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
    {
      v8 = (void *)*MEMORY[0x24BE08FB0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
LABEL_13:

        goto LABEL_14;
      }
      v9 = v8;
      *(_DWORD *)buf = 136315906;
      v18 = "-[SVXTapToRadarManager _updateTTRHistory:]";
      v19 = 2112;
      v20 = v4;
      v21 = 2112;
      v22 = v5;
      v23 = 2048;
      v24 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Error %@ already exist for %@. Total errors %lu", buf, 0x2Au);
    }
    else
    {
      objc_msgSend(v7, "arrayByAddingObject:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](self->_ttrHistory, "setObject:forKey:", v9, v5);
      v14 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        *(_DWORD *)buf = 136316162;
        v18 = "-[SVXTapToRadarManager _updateTTRHistory:]";
        v19 = 2112;
        v20 = v4;
        v21 = 2112;
        v22 = v5;
        v23 = 2048;
        v24 = objc_msgSend(v7, "count");
        v25 = 2048;
        v26 = -[NSObject count](v9, "count");
        _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s Add new error %@. Total errors for build %@ changed from %lu -> %lu", buf, 0x34u);

      }
    }

    goto LABEL_13;
  }
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[SVXTapToRadarManager _updateTTRHistory:]";
    _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, "%s No errorCode provided.", buf, 0xCu);
  }
LABEL_14:

}

- (NSString)getRecognitionText
{
  return self->_recognitionText;
}

- (void)setRecognitionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionText, 0);
  objc_storeStrong((id *)&self->_radarRateLimiter, 0);
  objc_storeStrong((id *)&self->_radarDraftFactory, 0);
  objc_storeStrong((id *)&self->_radarFiler, 0);
  objc_storeStrong((id *)&self->_errorsToSkipFirstTime, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_ttrHistory, 0);
  objc_storeStrong((id *)&self->_ttrQueue, 0);
}

void __69__SVXTapToRadarManager_createProblem_extraContent_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "_hasFileTTRWithRequestID:", v3);

  if ((_DWORD)v2)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
      v5 = "%s Return without prompting radar";
LABEL_11:
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, v5, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = objc_msgSend(v9, "_skipFirstTimeTTR:", v10);

    if (v11)
    {
      v12 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_updateTTRHistory:", v13);

      v14 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "requestID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_updateRequestID:", v15);

      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
        v5 = "%s Met the conditions for _skipFirstTimeTTR - Return without prompting radar";
        goto LABEL_11;
      }
LABEL_12:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      return;
    }
  }
  else
  {
    v16 = objc_msgSend(v9, "_hasFileTTRWithIssue:", v10);

    if (v16)
    {
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
        v5 = "%s Return without prompting radar";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "createWithRequiredContent:extraContent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "displayReason");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __69__SVXTapToRadarManager_createProblem_extraContent_completionHandler___block_invoke_82;
  v23[3] = &unk_24D24DF48;
  v20 = *(id *)(a1 + 56);
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(a1 + 40);
  v25 = v20;
  v23[4] = v21;
  v24 = v22;
  objc_msgSend(v18, "fileRadar:processName:displayReason:completion:", v17, CFSTR("Siri"), v19, v23);

}

void __69__SVXTapToRadarManager_createProblem_extraContent_completionHandler___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (*v5)(void);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v16 = v4;
      objc_msgSend(v3, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
      v20 = 2112;
      v21 = v17;
      _os_log_error_impl(&dword_214934000, v16, OS_LOG_TYPE_ERROR, "%s Failed creating a radar - error: %@", buf, 0x16u);

    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateTTRHistory:", v7);

    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateRequestID:", v9);

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

    if ((_DWORD)v10)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 40), "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@"), CFSTR("ttrFiled_"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_updateTTRHistory:", v14);
    }
    v15 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
      _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s Radar Created", buf, 0xCu);
    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v5();

}

+ (id)sharedInstance
{
  SVXRadarFiler *v3;
  void *v4;

  v3 = objc_alloc_init(SVXRadarFiler);
  objc_msgSend(a1, "sharedInstanceWithRadarFiler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedInstanceWithRadarFiler:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SVXTapToRadarManager_sharedInstanceWithRadarFiler___block_invoke;
  block[3] = &unk_24D24EFF0;
  v11 = v3;
  v4 = sharedInstanceWithRadarFiler__onceToken;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&sharedInstanceWithRadarFiler__onceToken, block);
    v7 = v11;
  }
  v8 = (id)sharedInstanceWithRadarFiler__privateInstance;

  return v8;
}

void __53__SVXTapToRadarManager_sharedInstanceWithRadarFiler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)sharedInstanceWithRadarFiler__privateInstance;
  sharedInstanceWithRadarFiler__privateInstance = 0;

  if ((objc_msgSend(*(id *)(a1 + 32), "supportsRadarFiling") & 1) != 0)
  {
    v3 = -[SVXTapToRadarManager _initWithRadarFiler:]([SVXTapToRadarManager alloc], "_initWithRadarFiler:", *(_QWORD *)(a1 + 32));
    v4 = (void *)sharedInstanceWithRadarFiler__privateInstance;
    sharedInstanceWithRadarFiler__privateInstance = (uint64_t)v3;

  }
  else
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "+[SVXTapToRadarManager sharedInstanceWithRadarFiler:]_block_invoke";
      v8 = 2080;
      v9 = "+[SVXTapToRadarManager sharedInstanceWithRadarFiler:]_block_invoke";
      _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s %s: TapToRadarService class is not available", (uint8_t *)&v6, 0x16u);
    }
  }
}

@end
