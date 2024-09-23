@implementation ThroughputDelegate

- (ThroughputDelegate)initWithExecution:(id)a3 testName:(id)a4 withQueue:(id)a5 testEndpoint:(id)a6 withConfig:(id)a7 resultsObject:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ThroughputDelegate *v20;
  NSMutableArray *v21;
  NSMutableArray *sessions;
  NSMutableArray *v23;
  NSMutableArray *probeSessions;
  NSMutableArray *v25;
  NSMutableArray *tasks;
  NSMutableArray *v27;
  NSMutableArray *uploadStream;
  NSDate *start;
  ThroughputSaturationDetection *v30;
  ThroughputSaturationDetection *saturation;
  int v32;
  uint64_t v33;
  NSDate *lastUpdate;
  void *v35;
  int instanceId;
  NSString *testName;
  NSObject *v38;
  uint64_t v39;
  id obj;
  id v42;
  objc_super v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  obj = a6;
  v17 = a6;
  v18 = a7;
  v42 = a8;
  v19 = a8;
  v44.receiver = self;
  v44.super_class = (Class)ThroughputDelegate;
  v20 = -[ThroughputDelegate init](&v44, sel_init);
  if (v20)
  {
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sessions = v20->_sessions;
    v20->_sessions = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    probeSessions = v20->_probeSessions;
    v20->_probeSessions = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    tasks = v20->_tasks;
    v20->_tasks = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    uploadStream = v20->_uploadStream;
    v20->_uploadStream = v27;

    objc_storeStrong((id *)&v20->_nqConfig, a7);
    start = v20->_start;
    v20->_start = 0;

    v30 = -[ThroughputSaturationDetection initWithConfig:]([ThroughputSaturationDetection alloc], "initWithConfig:", v18);
    saturation = v20->_saturation;
    v20->_saturation = v30;

    v20->_saturation_reached = 0;
    objc_storeStrong((id *)&v20->_queue, a5);
    objc_storeStrong((id *)&v20->_testEndpoint, obj);
    v32 = instance_id++;
    v20->_instanceId = v32;
    objc_storeStrong((id *)&v20->_results, v42);
    objc_storeStrong((id *)&v20->_execution, a3);
    objc_storeStrong((id *)&v20->_testName, a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v33 = objc_claimAutoreleasedReturnValue();
    lastUpdate = v20->_lastUpdate;
    v20->_lastUpdate = (NSDate *)v33;

    netqual_log_init();
    v35 = (void *)os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      instanceId = v20->_instanceId;
      testName = v20->_testName;
      v38 = v35;
      v39 = -[NSString UTF8String](testName, "UTF8String");
      *(_DWORD *)buf = 136315906;
      v46 = "-[ThroughputDelegate initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:]";
      v47 = 1024;
      v48 = 98;
      v49 = 1024;
      v50 = instanceId;
      v51 = 2080;
      v52 = v39;
      _os_log_impl(&dword_20E622000, v38, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] - created Throughput instance with name %s", buf, 0x22u);

    }
  }

  return v20;
}

- (id)lastUpdate
{
  return self->_lastUpdate;
}

- (id)getSessions
{
  return self->_probeSessions;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  -[NetworkQualityExecutionsResult mutableURLSessionMetrics](self->_results, "mutableURLSessionMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", self->_testName);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NetworkQualityExecutionsResult mutableURLSessionMetrics](self->_results, "mutableURLSessionMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, self->_testName);

    objc_msgSend(v13, "transactionMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NetworkQualityResult interfaceName](self->_results, "interfaceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v10, "_interfaceName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NetworkQualityResult setInterfaceName:](self->_results, "setInterfaceName:", v12);

      -[NetworkQualityResult setIsCellular:](self->_results, "setIsCellular:", objc_msgSend(v10, "isCellular"));
    }

  }
  objc_msgSend(v7, "addObject:", v13);

}

- (void)dealloc
{
  NSMutableArray *tasks;
  NSMutableArray *sessions;
  NSMutableArray *probeSessions;
  objc_super v6;

  tasks = self->_tasks;
  self->_tasks = 0;

  sessions = self->_sessions;
  self->_sessions = 0;

  probeSessions = self->_probeSessions;
  self->_probeSessions = 0;

  v6.receiver = self;
  v6.super_class = (Class)ThroughputDelegate;
  -[ThroughputDelegate dealloc](&v6, sel_dealloc);
}

- (void)addTasks
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int instanceId;
  NSURLRequest *request;
  void *v12;
  int v13;
  const char *v14;
  int v15;
  NSMutableArray *tasks;
  NSObject *v17;
  uint64_t v18;
  dispatch_time_t v19;
  NSObject *v20;
  int v21;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE v30[28];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (self->_canceled)
    return;
  if (self->_exitCriteriaMet)
    return;
  v3 = -[NSMutableArray count](self->_tasks, "count");
  if (v3 >= -[ThroughputDelegate maxFlows](self, "maxFlows"))
    return;
  if (-[NSMutableArray count](self->_tasks, "count"))
  {
    v4 = 1;
    goto LABEL_7;
  }
  v4 = -[ThroughputDelegate minFlows](self, "minFlows");
  if (v4 >= 1)
  {
LABEL_7:
    v21 = v4;
    do
    {
      v5 = -[NSMutableArray count](self->_tasks, "count");
      if (v5 == -[ThroughputDelegate maxFlows](self, "maxFlows") || self->_exitCriteriaMet)
        break;
      -[NetworkQualityExecutions createDefaultNSURLSessionConfiguration](self->_execution, "createDefaultNSURLSessionConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v6, self, self->_queue);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_sessions, "addObject:", v7);
      -[ThroughputDelegate createTaskWithRequest:session:](self, "createTaskWithRequest:session:", self->_request, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "set_hostOverride:", self->_testEndpoint);
      -[NSMutableArray addObject:](self->_tasks, "addObject:", v8);
      netqual_log_init();
      v9 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        instanceId = self->_instanceId;
        request = self->_request;
        *(_DWORD *)buf = 136316418;
        v24 = "-[ThroughputDelegate addTasks]";
        v25 = 1024;
        v26 = 171;
        v27 = 1024;
        v28 = instanceId;
        v29 = 2112;
        *(_QWORD *)v30 = v8;
        *(_WORD *)&v30[8] = 2112;
        *(_QWORD *)&v30[10] = v7;
        *(_WORD *)&v30[18] = 2112;
        *(_QWORD *)&v30[20] = request;
        _os_log_impl(&dword_20E622000, v9, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] - added task %@ to %@ for %@", buf, 0x36u);
      }
      objc_msgSend(v8, "resume");

      --v4;
    }
    while (v4);
    v4 = v21;
  }
  -[ThroughputDelegate updateResultsWithFlowCount](self, "updateResultsWithFlowCount");
  netqual_log_init();
  v12 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_instanceId;
    if (v4 <= 1)
      v14 = "";
    else
      v14 = "s";
    v15 = v4;
    tasks = self->_tasks;
    v17 = v12;
    v18 = -[NSMutableArray count](tasks, "count");
    *(_DWORD *)buf = 136316418;
    v24 = "-[ThroughputDelegate addTasks]";
    v25 = 1024;
    v26 = 178;
    v27 = 1024;
    v28 = v13;
    v29 = 1024;
    *(_DWORD *)v30 = v15;
    *(_WORD *)&v30[4] = 2080;
    *(_QWORD *)&v30[6] = v14;
    *(_WORD *)&v30[14] = 2048;
    *(_QWORD *)&v30[16] = v18;
    _os_log_impl(&dword_20E622000, v17, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Added %u more task%s, now %lu", buf, 0x32u);

  }
  v19 = dispatch_time(0, 1000000000);
  -[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__ThroughputDelegate_addTasks__block_invoke;
  block[3] = &unk_24C9764D0;
  block[4] = self;
  dispatch_after(v19, v20, block);

}

uint64_t __30__ThroughputDelegate_addTasks__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addTasks");
  return objc_msgSend(*(id *)(a1 + 32), "shareProgress");
}

- (id)createTaskWithRequest:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (id)amendRequest:(id)a3
{
  return a3;
}

- (int)executeTaskWithRequest:(id)a3 saturationHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id saturationHandler;
  void *v15;
  id completionHandler;
  NSURLRequest *v17;
  NSURLRequest *request;
  NSObject *v19;
  int instanceId;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCE60];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_start, v12);
  objc_storeStrong((id *)&self->_current, self->_start);
  v13 = (void *)MEMORY[0x212BC1F98](v11);

  saturationHandler = self->_saturationHandler;
  self->_saturationHandler = v13;

  v15 = (void *)MEMORY[0x212BC1F98](v10);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v15;

  -[ThroughputDelegate amendRequest:](self, "amendRequest:", v8);
  v17 = (NSURLRequest *)objc_claimAutoreleasedReturnValue();
  request = self->_request;
  self->_request = v17;

  netqual_log_init();
  v19 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    instanceId = self->_instanceId;
    v22 = 136315906;
    v23 = "-[ThroughputDelegate executeTaskWithRequest:saturationHandler:completionHandler:]";
    v24 = 1024;
    v25 = 215;
    v26 = 1024;
    v27 = instanceId;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_20E622000, v19, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Starting ... request: %@", (uint8_t *)&v22, 0x22u);
  }
  -[ThroughputDelegate addTasks](self, "addTasks");

  return 0;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int instanceId;
  int v10;
  void (**cancelCompletionHandler)(id, id);
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  netqual_log_init();
  v8 = os_log_netqual;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    {
      instanceId = self->_instanceId;
      v12 = 136316162;
      v13 = "-[ThroughputDelegate URLSession:didBecomeInvalidWithError:]";
      v14 = 1024;
      v15 = 225;
      v16 = 1024;
      v17 = instanceId;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_error_impl(&dword_20E622000, v8, OS_LOG_TYPE_ERROR, "%s:%u - [%d] Closing session %@ with error %@", (uint8_t *)&v12, 0x2Cu);
    }
  }
  else if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_instanceId;
    v12 = 136315906;
    v13 = "-[ThroughputDelegate URLSession:didBecomeInvalidWithError:]";
    v14 = 1024;
    v15 = 227;
    v16 = 1024;
    v17 = v10;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_20E622000, v8, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Closing session %@", (uint8_t *)&v12, 0x22u);
  }
  -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v6);
  -[NSMutableArray removeObject:](self->_probeSessions, "removeObject:", v6);
  if (!-[NSMutableArray count](self->_sessions, "count"))
  {
    cancelCompletionHandler = (void (**)(id, id))self->_cancelCompletionHandler;
    if (cancelCompletionHandler)
      cancelCompletionHandler[2](cancelCompletionHandler, v7);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  int instanceId;
  NSObject *v17;
  void (*v18)(void);
  NSObject *v19;
  int v20;
  int v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
LABEL_4:
    v14 = v11 != 0;
    netqual_log_init();
    v15 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      instanceId = self->_instanceId;
      v22 = 136316418;
      v23 = "-[ThroughputDelegate URLSession:task:didCompleteWithError:]";
      v24 = 1024;
      v25 = 247;
      v26 = 1024;
      v27 = instanceId;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_20E622000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Closing task %@ of session %@ with error %@", (uint8_t *)&v22, 0x36u);
    }
    goto LABEL_10;
  }
  objc_msgSend(v10, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD1308]) & 1) != 0)
  {
    v13 = objc_msgSend(v11, "code");

    if (v13 == -999)
      goto LABEL_4;
  }
  else
  {

  }
  netqual_log_init();
  v17 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
  {
    v21 = self->_instanceId;
    v22 = 136316418;
    v23 = "-[ThroughputDelegate URLSession:task:didCompleteWithError:]";
    v24 = 1024;
    v25 = 245;
    v26 = 1024;
    v27 = v21;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v11;
    _os_log_error_impl(&dword_20E622000, v17, OS_LOG_TYPE_ERROR, "%s:%u - [%d] Force-closing task %@ of session %@ with error %@", (uint8_t *)&v22, 0x36u);
  }
  v14 = 0;
LABEL_10:
  -[NSMutableArray removeObject:](self->_tasks, "removeObject:", v9);
  if (!v11 || v14)
  {
    if (!-[NSMutableArray count](self->_tasks, "count"))
    {
      netqual_log_init();
      v19 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_instanceId;
        v22 = 136315650;
        v23 = "-[ThroughputDelegate URLSession:task:didCompleteWithError:]";
        v24 = 1024;
        v25 = 271;
        v26 = 1024;
        v27 = v20;
        _os_log_impl(&dword_20E622000, v19, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Reaching completion", (uint8_t *)&v22, 0x18u);
      }
      v18 = (void (*)(void))*((_QWORD *)self->_completionHandler + 2);
      goto LABEL_20;
    }
  }
  else
  {
    if (!self->_error)
      objc_storeStrong((id *)&self->_error, a5);
    if (!self->_canceled)
    {
      objc_storeStrong((id *)&self->_error, a5);
      v18 = (void (*)(void))*((_QWORD *)self->_completionHandler + 2);
LABEL_20:
      v18();
    }
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void (**)(id, uint64_t))a6;
  if (objc_msgSend(v8, "statusCode") == 200)
  {
    v9[2](v9, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected HTTP status code 200, got %lu"), objc_msgSend(v8, "statusCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    netqual_log_init();
    v11 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      -[ThroughputDelegate URLSession:dataTask:didReceiveResponse:completionHandler:].cold.1((uint64_t)v10, v11);
    v17 = (void *)MEMORY[0x24BDD1540];
    v18[0] = CFSTR("statusCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "statusCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v18[1] = CFSTR("URL");
    -[NSURLRequest URL](self->_request, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = *MEMORY[0x24BDD0FC8];
    v19[1] = v14;
    v19[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1003, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_canceled)
    {
      objc_storeStrong((id *)&self->_error, v16);
      if (!self->_error)
        objc_storeStrong((id *)&self->_error, v16);
      (*((void (**)(void))self->_completionHandler + 2))();
    }
    v9[2](v9, 0);

  }
}

- (void)addNewThroughputMeasurement:(unint64_t)a3
{
  void *v5;
  NSDate *current;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  float v12;
  void *v13;
  int v14;
  ThroughputSaturationDetection *v15;
  NSObject *v16;
  float v17;
  int64_t v18;
  float v19;
  void (**saturationHandler)(void);
  int instanceId;
  ThroughputSaturationDetection *saturation;
  NSObject *v23;
  int64_t currentBytesTransferred;
  float v25;
  int64_t byte_accumulator;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  int64_t v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentBytesTransferred += a3;
  -[ThroughputDelegate updateResultsWithByteCount](self, "updateResultsWithByteCount");
  if (!-[ThroughputDelegate checkLimits](self, "checkLimits"))
  {
    current = self->_current;
    self->_byte_accumulator += a3;
    objc_msgSend(v5, "timeIntervalSinceDate:", current);
    v8 = v7;
    if (v7 >= 0.2)
    {
      v9 = (uint64_t)((double)(8 * self->_byte_accumulator) / v7);
      netqual_log_init();
      v10 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEBUG))
      {
        instanceId = self->_instanceId;
        saturation = self->_saturation;
        v23 = v10;
        -[SaturationDetection getAverage](saturation, "getAverage");
        currentBytesTransferred = self->_currentBytesTransferred;
        byte_accumulator = self->_byte_accumulator;
        v27 = 136316930;
        v28 = "-[ThroughputDelegate addNewThroughputMeasurement:]";
        v29 = 1024;
        v30 = 342;
        v31 = 1024;
        v32 = instanceId;
        v33 = 2048;
        v34 = (double)v9 * 0.000000953674316;
        v35 = 2048;
        v36 = v25 * 0.000000953674316;
        v37 = 2048;
        v38 = currentBytesTransferred;
        v39 = 2048;
        v40 = byte_accumulator;
        v41 = 2048;
        v42 = v8;
        _os_log_debug_impl(&dword_20E622000, v23, OS_LOG_TYPE_DEBUG, "%s:%u - [%d] throughput is now: %.3f Mbps avg %.3f Mbps at %ld bytes transferred, accumulated %ld over %.3f seconds", (uint8_t *)&v27, 0x4Au);

      }
      self->_byte_accumulator = 0;
      objc_storeStrong((id *)&self->_current, v5);
      *(float *)&v11 = (float)v9;
      if (-[SaturationDetection add:](self->_saturation, "add:", v11) && !self->_saturation_reached)
      {
        netqual_log_init();
        v13 = (void *)os_log_netqual;
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
        {
          v14 = self->_instanceId;
          v15 = self->_saturation;
          v16 = v13;
          -[SaturationDetection getSaturation](v15, "getSaturation");
          v27 = 136316162;
          v18 = self->_currentBytesTransferred;
          v28 = "-[ThroughputDelegate addNewThroughputMeasurement:]";
          v29 = 1024;
          v30 = 348;
          v31 = 1024;
          v32 = v14;
          v33 = 2048;
          v34 = v17 * 0.000000953674316;
          v35 = 2048;
          v36 = *(double *)&v18;
          _os_log_impl(&dword_20E622000, v16, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] achieved saturation at %.3f Mbps with %ld bytes", (uint8_t *)&v27, 0x2Cu);

        }
        self->_saturation_reached = 1;
        -[SaturationDetection getSaturation](self->_saturation, "getSaturation");
        -[ThroughputDelegate updateResultsWithThroughput:confidence:](self, "updateResultsWithThroughput:confidence:", (uint64_t)v19, 3);
        saturationHandler = (void (**)(void))self->_saturationHandler;
        if (saturationHandler)
          saturationHandler[2]();
      }
      else
      {
        -[SaturationDetection getAverage](self->_saturation, "getAverage");
        -[ThroughputDelegate updateResultsWithThroughput:confidence:](self, "updateResultsWithThroughput:confidence:", (uint64_t)v12, 2);
        -[ThroughputDelegate shareProgress](self, "shareProgress");
      }
    }
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
  if (-[NetworkQualityConfiguration validateCertificate](self->_nqConfig, "validateCertificate"))
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
  if (-[NetworkQualityConfiguration validateCertificate](self->_nqConfig, "validateCertificate"))
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
  int instanceId;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = (void (**)(id, _QWORD))a7;
  netqual_log_init();
  v13 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
  {
    instanceId = self->_instanceId;
    v15 = v13;
    objc_msgSend(v11, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originalRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136316162;
    v20 = "-[ThroughputDelegate URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:]";
    v21 = 1024;
    v22 = 389;
    v23 = 1024;
    v24 = instanceId;
    v25 = 2112;
    v26 = v16;
    v27 = 2112;
    v28 = v18;
    _os_log_error_impl(&dword_20E622000, v15, OS_LOG_TYPE_ERROR, "%s:%u - [%d] Unexpected redirect to %@ for %@", (uint8_t *)&v19, 0x2Cu);

  }
  v12[2](v12, 0);

}

- (BOOL)metExitCriteria
{
  return self->_exitCriteriaMet && !self->_saturation_reached;
}

- (void)cancelWithCompletionHandler:(id)a3
{
  void *v4;
  id cancelCompletionHandler;
  id saturationHandler;
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

  saturationHandler = self->_saturationHandler;
  self->_saturationHandler = 0;

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
    block[2] = __50__ThroughputDelegate_cancelWithCompletionHandler___block_invoke;
    block[3] = &unk_24C9764D0;
    block[4] = self;
    dispatch_async(v12, block);

  }
}

uint64_t __50__ThroughputDelegate_cancelWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) + 16))();
}

- (void)cancel
{
  -[ThroughputDelegate cancelWithCompletionHandler:](self, "cancelWithCompletionHandler:", 0);
}

- (void)shareProgress
{
  -[NetworkQualityExecutions shareProgress](self->_execution, "shareProgress");
}

- (void)updateResultsWithFlowCount
{
  __assert_rtn("-[ThroughputDelegate updateResultsWithFlowCount]", "ThroughputDelegate.m", 433, "0");
}

- (void)updateResultsWithByteCount
{
  __assert_rtn("-[ThroughputDelegate updateResultsWithByteCount]", "ThroughputDelegate.m", 439, "0");
}

- (void)updateResultsWithThroughput:(int64_t)a3 confidence:(int64_t)a4
{
  __assert_rtn("-[ThroughputDelegate updateResultsWithThroughput:confidence:]", "ThroughputDelegate.m", 446, "0");
}

- (BOOL)checkLimits
{
  __assert_rtn("-[ThroughputDelegate checkLimits]", "ThroughputDelegate.m", 452, "0");
}

- (unint64_t)minFlows
{
  __assert_rtn("-[ThroughputDelegate minFlows]", "ThroughputDelegate.m", 460, "0");
}

- (unint64_t)maxFlows
{
  __assert_rtn("-[ThroughputDelegate maxFlows]", "ThroughputDelegate.m", 468, "0");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_execution, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_saturationHandler, 0);
  objc_storeStrong(&self->_cancelCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testEndpoint, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_saturation, 0);
  objc_storeStrong((id *)&self->_nqConfig, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_uploadStream, 0);
  objc_storeStrong((id *)&self->_probeSessions, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

- (void)URLSession:(uint64_t)a1 dataTask:(NSObject *)a2 didReceiveResponse:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = "-[ThroughputDelegate URLSession:dataTask:didReceiveResponse:completionHandler:]";
  v4 = 1024;
  v5 = 289;
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_20E622000, a2, OS_LOG_TYPE_ERROR, "%s:%u - %@", (uint8_t *)&v2, 0x1Cu);
}

@end
