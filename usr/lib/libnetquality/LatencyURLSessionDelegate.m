@implementation LatencyURLSessionDelegate

- (LatencyURLSessionDelegate)initWithConfiguration:(id)a3 testName:(id)a4 queue:(id)a5 testEndpoint:(id)a6 resultsObject:(id)a7 resultsDelegate:(id)a8 tcpKey:(id)a9 tlsKey:(id)a10 reqrespKey:(id)a11 selfKey:(id)a12
{
  id v18;
  id v19;
  id v20;
  LatencyURLSessionDelegate *v21;
  LatencyURLSessionDelegate *v22;
  NSMutableArray *v23;
  NSMutableArray *sessions;
  NSMutableArray *v25;
  NSMutableArray *tasks;
  NSMutableArray *v27;
  NSMutableArray *metrics;
  NSMutableArray *v29;
  NSMutableArray *workingMetrics;
  id obj;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v41 = a3;
  v40 = a4;
  obj = a5;
  v39 = a5;
  v38 = a6;
  v33 = a7;
  v37 = a7;
  v36 = a8;
  v35 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v42.receiver = self;
  v42.super_class = (Class)LatencyURLSessionDelegate;
  v21 = -[LatencyURLSessionDelegate init](&v42, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_config, a3);
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sessions = v22->_sessions;
    v22->_sessions = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    tasks = v22->_tasks;
    v22->_tasks = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    metrics = v22->_metrics;
    v22->_metrics = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    workingMetrics = v22->_workingMetrics;
    v22->_workingMetrics = v29;

    objc_storeStrong((id *)&v22->_queue, obj);
    objc_storeStrong((id *)&v22->_testEndpoint, a6);
    objc_storeStrong((id *)&v22->_results, v33);
    objc_storeStrong((id *)&v22->_execution, a8);
    objc_storeStrong((id *)&v22->_tcpKey, a9);
    objc_storeStrong((id *)&v22->_tlsKey, a10);
    objc_storeStrong((id *)&v22->_reqrespKey, a11);
    objc_storeStrong((id *)&v22->_selfKey, a12);
    objc_storeStrong((id *)&v22->_testName, a4);
    v22->_parallel = 8;
    v22->_exitCriteriaCounter = 0;
  }

  return v22;
}

- (void)executeTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[LatencyURLSessionDelegate executeTaskWithRequest:completionHandler:]", "LatencyURLSessionDelegate.m", 96, "0");
}

- (void)waitForSaturation:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[LatencyURLSessionDelegate waitForSaturation:]", "LatencyURLSessionDelegate.m", 102, "0");
}

- (BOOL)metExitCriteria
{
  return self->_exitCriteriaCounter > 3;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**cancelCompletionHandler)(id, id);

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_error, a4);
    netqual_log_init();
    v8 = (void *)os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      -[LatencyURLSessionDelegate URLSession:didBecomeInvalidWithError:].cold.1((uint64_t)v7, (uint64_t)self, v8);
  }
  -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v6);
  if (!-[NSMutableArray count](self->_sessions, "count"))
  {
    cancelCompletionHandler = (void (**)(id, id))self->_cancelCompletionHandler;
    if (cancelCompletionHandler)
      cancelCompletionHandler[2](cancelCompletionHandler, v7);
  }

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  if (-[NetworkQualityConfiguration validateCertificate](self->_config, "validateCertificate"))
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1818];
    objc_msgSend(v11, "protectionSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "credentialForTrust:", objc_msgSend(v9, "serverTrust"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v10);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = (void (**)(id, uint64_t, _QWORD))a6;
  if (-[NetworkQualityConfiguration validateCertificate](self->_config, "validateCertificate"))
  {
    v8[2](v8, 1, 0);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1818];
    objc_msgSend(v12, "protectionSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "credentialForTrust:", objc_msgSend(v10, "serverTrust"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v11);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  id v14;
  void *v15;
  NSError *v16;
  NSError *error;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = (void (**)(id, _QWORD))a7;
  netqual_log_init();
  v13 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    -[LatencyURLSessionDelegate URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:].cold.1(v13, v11, v10);
  v14 = objc_alloc(MEMORY[0x24BDD1540]);
  v18 = *MEMORY[0x24BDD0FC8];
  v19[0] = CFSTR("Unexpected redirect on latency measuring connection");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSError *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1003, v15);
  error = self->_error;
  self->_error = v16;

  v12[2](v12, 0);
  if (!self->_canceled)
    (*((void (**)(void))self->_completionHandler + 2))();

}

- (int)didFinishCollectingMetrics:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSError *v17;
  NSError *error;
  void *v19;
  uint64_t v20;
  int v21;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSError *v29;
  NSError *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  NSError *v43;
  NSError *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  int v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _QWORD v69[3];
  _QWORD v70[3];
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NetworkQualityExecutionsResult mutableURLSessionMetrics](self->_results, "mutableURLSessionMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", self->_testName);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v6, "transactionMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NetworkQualityExecutionsResult mutableURLSessionMetrics](self->_results, "mutableURLSessionMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v9, self->_testName);

    -[NetworkQualityResult interfaceName](self->_results, "interfaceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v11, "_interfaceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NetworkQualityResult setInterfaceName:](self->_results, "setInterfaceName:", v14);

      -[NetworkQualityResult setIsCellular:](self->_results, "setIsCellular:", objc_msgSend(v11, "isCellular"));
    }

  }
  if ((unint64_t)objc_msgSend(v9, "count") >= 0xB)
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
  objc_msgSend(v9, "addObject:", v6);
  if (objc_msgSend(v6, "redirectCount"))
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      -[LatencyURLSessionDelegate didFinishCollectingMetrics:task:].cold.2();
    v15 = objc_alloc(MEMORY[0x24BDD1540]);
    v71 = *MEMORY[0x24BDD0FC8];
    v72[0] = CFSTR("Unexpected redirect when collecting metrics");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (NSError *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1002, v16);
    error = self->_error;
    self->_error = v17;

    if (self->_canceled)
      goto LABEL_14;
    goto LABEL_11;
  }
  objc_msgSend(v6, "transactionMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    if (self->_canceled)
      goto LABEL_14;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v6, "transactionMetrics");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
    if (v32)
    {
      v33 = v32;
      v49 = v7;
      v34 = 0;
      v35 = *(_QWORD *)v51;
      while (2)
      {
        v36 = 0;
        v48 = v34 + v33;
        do
        {
          if (*(_QWORD *)v51 != v35)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v36), "response");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "statusCode");

          if (v38 == 200)
          {

            v21 = v34 + v36;
            goto LABEL_31;
          }
          ++v36;
        }
        while (v33 != v36);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
        v34 = v48;
        if (v33)
          continue;
        break;
      }
      v7 = v49;
    }
    else
    {
      v38 = 0;
    }

    netqual_log_init();
    v39 = (void *)os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    {
      v45 = v39;
      objc_msgSend(v6, "transactionMetrics");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      v57 = "-[LatencyURLSessionDelegate didFinishCollectingMetrics:task:]";
      v58 = 1024;
      v59 = 250;
      v60 = 2048;
      v61 = v38;
      v62 = 2112;
      v63 = v7;
      v64 = 2112;
      v65 = v6;
      v66 = 2112;
      v67 = v47;
      _os_log_error_impl(&dword_20E622000, v45, OS_LOG_TYPE_ERROR, "%s:%u - This should not happen - response status code is %ld on task %@ metrics %@ tMet %@", buf, 0x3Au);

    }
    v40 = objc_alloc(MEMORY[0x24BDD1540]);
    v54[0] = *MEMORY[0x24BDD0FC8];
    v54[1] = CFSTR("statusCode");
    v55[0] = CFSTR("Incorrect response status code on latency measuring connection");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v41;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (NSError *)objc_msgSend(v40, "initWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1003, v42);
    v44 = self->_error;
    self->_error = v43;

LABEL_11:
    (*((void (**)(void))self->_completionHandler + 2))();
LABEL_14:
    v21 = -1;
    goto LABEL_15;
  }
  netqual_log_init();
  v23 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    -[LatencyURLSessionDelegate didFinishCollectingMetrics:task:].cold.1((uint64_t)self, (uint64_t)v7, v23);
  v49 = v7;
  v24 = objc_alloc(MEMORY[0x24BDD1540]);
  v25 = *MEMORY[0x24BDD0FC8];
  v70[0] = CFSTR("Unexpected number of transactionMetrics");
  v69[0] = v25;
  v69[1] = CFSTR("count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v26;
  v69[2] = CFSTR("canceled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_canceled);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (NSError *)objc_msgSend(v24, "initWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1002, v28);
  v30 = self->_error;
  self->_error = v29;

  if (!self->_canceled)
    (*((void (**)(void))self->_completionHandler + 2))();
  v21 = -1;
LABEL_31:
  v7 = v49;
LABEL_15:

  return v21;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)LatencyURLSessionDelegate;
  -[LatencyURLSessionDelegate dealloc](&v2, sel_dealloc);
}

- (void)shareProgress
{
  -[NetworkQualityExecutions shareProgress](self->_execution, "shareProgress");
}

- (void)cancelWithCompletionHandler:(id)a3
{
  void *v4;
  id cancelCompletionHandler;
  id completionHandler;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  self->_canceled = 1;
  v4 = (void *)MEMORY[0x212BC1F98](a3, a2);
  cancelCompletionHandler = self->_cancelCompletionHandler;
  self->_cancelCompletionHandler = v4;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  if (-[NSMutableArray count](self->_sessions, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_sessions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "invalidateAndCancel");
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else if (self->_cancelCompletionHandler)
  {
    -[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__LatencyURLSessionDelegate_cancelWithCompletionHandler___block_invoke;
    block[3] = &unk_24C9764D0;
    block[4] = self;
    dispatch_async(v12, block);

  }
}

uint64_t __57__LatencyURLSessionDelegate_cancelWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 16))();
}

- (void)cancel
{
  -[LatencyURLSessionDelegate cancelWithCompletionHandler:](self, "cancelWithCompletionHandler:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_selfKey, 0);
  objc_storeStrong((id *)&self->_reqrespKey, 0);
  objc_storeStrong((id *)&self->_tlsKey, 0);
  objc_storeStrong((id *)&self->_tcpKey, 0);
  objc_storeStrong((id *)&self->_execution, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_cancelCompletionHandler, 0);
  objc_storeStrong(&self->_saturationHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testEndpoint, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_workingMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)URLSession:(void *)a3 didBecomeInvalidWithError:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _WORD v8[10];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a2 + 16);
  v5 = a3;
  objc_msgSend(v4, "count");
  *(_DWORD *)v8 = 136315906;
  OUTLINED_FUNCTION_2();
  *(_DWORD *)&v8[7] = 119;
  v8[9] = 2112;
  v9 = a1;
  v10 = 2048;
  v11 = v6;
  OUTLINED_FUNCTION_5_0(&dword_20E622000, v5, v7, "%s:%u - session completed with error: %@, count: %lu", (uint8_t *)v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)URLSession:(void *)a3 task:willPerformHTTPRedirection:newRequest:completionHandler:.cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _WORD v11[10];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "originalRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v11 = 136315906;
  OUTLINED_FUNCTION_2();
  *(_DWORD *)&v11[7] = 163;
  v11[9] = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v9;
  OUTLINED_FUNCTION_5_0(&dword_20E622000, v5, v10, "%s:%u - Unexpected redirect to %@ for %@", (uint8_t *)v11);

  OUTLINED_FUNCTION_3_0();
}

- (void)didFinishCollectingMetrics:(os_log_t)log task:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int8 *)(a1 + 160);
  v4 = 136315906;
  v5 = "-[LatencyURLSessionDelegate didFinishCollectingMetrics:task:]";
  v6 = 1024;
  v7 = 213;
  v8 = 1024;
  v9 = v3;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_20E622000, log, OS_LOG_TYPE_ERROR, "%s:%u - Unexpected number of transactionMetrics | cancelled=%d on task %@", (uint8_t *)&v4, 0x22u);
  OUTLINED_FUNCTION_4();
}

- (void)didFinishCollectingMetrics:task:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - This should not happen - redirects should be caught by willPerformHTTPRedirection on task %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

@end
