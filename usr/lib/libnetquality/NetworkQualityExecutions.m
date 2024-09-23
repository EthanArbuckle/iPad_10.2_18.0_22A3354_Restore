@implementation NetworkQualityExecutions

- (NetworkQualityExecutions)initWithConfiguration:(id)a3
{
  id v5;
  NetworkQualityExecutions *v6;
  NetworkQualityExecutions *v7;
  id *p_config;
  uint64_t v9;
  OS_nw_activity *parentNWActivity;
  dispatch_queue_t v11;
  OS_dispatch_queue *executionsQueue;
  NSOperationQueue *v13;
  NSOperationQueue *operationQueue;
  NetworkQualityExecutionsResult *v15;
  NetworkQualityExecutionsResult *progressResults;
  void *v17;
  id v18;
  void *v19;
  NetworkQualityExecutions *v20;
  void *v22;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NetworkQualityExecutions;
  v6 = -[NetworkQualityExecutions init](&v23, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  p_config = (id *)&v6->config;
  objc_storeStrong((id *)&v6->config, a3);
  v9 = nw_activity_create();
  parentNWActivity = v7->_parentNWActivity;
  v7->_parentNWActivity = (OS_nw_activity *)v9;

  v11 = dispatch_queue_create("com.apple.networkQuality.executions", 0);
  executionsQueue = v7->_executionsQueue;
  v7->_executionsQueue = (OS_dispatch_queue *)v11;

  v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
  operationQueue = v7->_operationQueue;
  v7->_operationQueue = v13;

  -[NSOperationQueue setUnderlyingQueue:](v7->_operationQueue, "setUnderlyingQueue:", v7->_executionsQueue);
  -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_operationQueue, "setMaxConcurrentOperationCount:", 1);
  -[NSOperationQueue setQualityOfService:](v7->_operationQueue, "setQualityOfService:", 17);
  v7->cancelled = 0;
  *(_WORD *)&v7->_throughputSaturated = 0;
  v15 = objc_alloc_init(NetworkQualityExecutionsResult);
  progressResults = v7->_progressResults;
  v7->_progressResults = v15;

  -[NetworkQualityConfiguration networkInterfaceName](v7->config, "networkInterfaceName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_5:
    v7->_stage = 0;
LABEL_6:
    v20 = v7;
    goto LABEL_7;
  }
  objc_msgSend(*p_config, "networkInterfaceName");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v18, "cStringUsingEncoding:", 4);
  v19 = (void *)nw_interface_create_with_name();

  if (v19)
  {

    goto LABEL_5;
  }
  netqual_log_init();
  v22 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    -[NetworkQualityExecutions initWithConfiguration:].cold.1((void **)&v7->config, v22);
  v20 = 0;
LABEL_7:

  return v20;
}

- (BOOL)currentStageIs:(int)a3
{
  return self->_stage == a3;
}

- (NetworkQualityExecutions)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v7;
  NetworkQualityExecutions *v8;
  NetworkQualityExecutions *v9;

  v7 = a4;
  v8 = -[NetworkQualityExecutions initWithConfiguration:](self, "initWithConfiguration:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_delegate, a4);

  return v9;
}

- (id)createDefaultNSURLSessionConfiguration
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestCachePolicy:", 1);
  objc_msgSend(v3, "setURLCache:", 0);
  if (-[NetworkQualityConfiguration forceHTTP3](self->config, "forceHTTP3"))
    objc_msgSend(v3, "set_allowsHTTP3:", 1);
  if (-[NetworkQualityConfiguration forceL4S](self->config, "forceL4S"))
    objc_msgSend(v3, "set_enablesL4S:", 1);
  if (-[NetworkQualityConfiguration forceDisableL4S](self->config, "forceDisableL4S"))
    objc_msgSend(v3, "set_enablesL4S:", 0);
  if (-[NetworkQualityConfiguration privateRelay](self->config, "privateRelay"))
    objc_msgSend(v3, "set_sourceApplicationSecondaryIdentifier:", CFSTR("com.apple.networkQuality.private-relay"));
  if (-[NetworkQualityConfiguration multipathServiceType](self->config, "multipathServiceType"))
    objc_msgSend(v3, "setMultipathServiceType:", -[NetworkQualityConfiguration multipathServiceType](self->config, "multipathServiceType"));
  if (-[NetworkQualityConfiguration useUnifiedHTTPStack](self->config, "useUnifiedHTTPStack"))
    objc_msgSend(v3, "set_usesNWLoader:", 1);
  return v3;
}

- (id)createDefaultRequestwithURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityConfiguration networkInterfaceName](self->config, "networkInterfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NetworkQualityConfiguration networkInterfaceName](self->config, "networkInterfaceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBoundInterfaceIdentifier:", v6);

  }
  if (-[NetworkQualityConfiguration forceHTTP1](self->config, "forceHTTP1")
    || -[NetworkQualityConfiguration forceHTTP2](self->config, "forceHTTP2"))
  {
    goto LABEL_7;
  }
  if (-[NetworkQualityConfiguration forceHTTP3](self->config, "forceHTTP3"))
  {
    objc_msgSend(v4, "setAssumesHTTP3Capable:", 1);
LABEL_7:
    objc_msgSend(objc_retainAutorelease(v4), "_CFURLRequest");
    _CFURLRequestSetAllowedProtocolTypes();
  }
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("identity"), CFSTR("Accept-Encoding"));
  return v4;
}

- (void)checkTimeout
{
  void *v3;
  void *v4;
  double v5;
  NSDate *timeout;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_timeout)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:");
    if (v5 > 0.0)
    {
      timeout = self->_timeout;
      self->_timeout = 0;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Timed out waiting for stage %s to drain"), NetworkQualityStages_to_string(self->_stage));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      netqual_log_init();
      v8 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_retainAutorelease(v7);
        v10 = v8;
        *(_DWORD *)buf = 136315650;
        v17 = "-[NetworkQualityExecutions checkTimeout]";
        v18 = 1024;
        v19 = 260;
        v20 = 2080;
        v21 = objc_msgSend(v9, "UTF8String");
        _os_log_impl(&dword_20E622000, v10, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] %s. Moving on.", buf, 0x1Cu);

      }
      if (-[NetworkQualityExecutions isDraining](self, "isDraining"))
      {
        v11 = (void *)MEMORY[0x24BDD1540];
        v14 = *MEMORY[0x24BDD0FC8];
        v15 = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1011, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[NetworkQualityExecutions reportingCompletionHandler:](self, "reportingCompletionHandler:", v13);
      }
      else
      {
        -[NetworkQualityExecutions run](self, "run");
      }

    }
  }

}

- (void)shareProgress
{
  double v3;
  id obj;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  obj = (id)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityExecutions checkTimeout](self, "checkTimeout");
  if (self->_delegate)
  {
    objc_msgSend(obj, "timeIntervalSinceDate:", self->_lastProgressUpdate);
    if (v3 >= 0.2)
    {
      objc_storeStrong((id *)&self->_lastProgressUpdate, obj);
      -[NetworkQualityResult setIndex:](self->_progressResults, "setIndex:", -[NetworkQualityResult index](self->_progressResults, "index") + 1);
      -[NetworkQualityResult setTimestamp:](self->_progressResults, "setTimestamp:", obj);
      -[NetworkQualityExecutionsDelegate progress:](self->_delegate, "progress:", self->_progressResults);
    }
  }

}

- (int64_t)currentThroughput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[NetworkQualityResult downlinkCapacity](self->_progressResults, "downlinkCapacity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NetworkQualityResult downlinkCapacity](self->_progressResults, "downlinkCapacity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[NetworkQualityResult uplinkCapacity](self->_progressResults, "uplinkCapacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NetworkQualityResult uplinkCapacity](self->_progressResults, "uplinkCapacity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    if (v12 < v7)
    {
      -[NetworkQualityResult uplinkCapacity](self->_progressResults, "uplinkCapacity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v14, "integerValue");

    }
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v7;
}

- (void)reportingCompletionHandler:(id)a3
{
  void (**completionHandler)(id, NetworkQualityExecutionsResult *, void *);
  NetworkQualityExecutionsResult *progressResults;
  void *v7;

  if (!self->cancelled)
  {
    -[NetworkQualityExecutions captureError:](self, "captureError:");
    if (!a3)
      -[NetworkQualityExecutions _sendSymptomReport](self, "_sendSymptomReport");
    nw_activity_complete_with_reason();
    completionHandler = (void (**)(id, NetworkQualityExecutionsResult *, void *))self->_completionHandler;
    progressResults = self->_progressResults;
    -[NetworkQualityResult error](progressResults, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    completionHandler[2](completionHandler, progressResults, v7);

    -[NetworkQualityExecutions _cancelWithOptionalError:](self, "_cancelWithOptionalError:", 0);
  }
}

- (void)drain
{
  __assert_rtn("-[NetworkQualityExecutions drain]", "Executions.m", 447, "[self isDraining]");
}

uint64_t __33__NetworkQualityExecutions_drain__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drain");
}

void __33__NetworkQualityExecutions_drain__block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  netqual_log_init();
  v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v10 = 136315650;
    v11 = "-[NetworkQualityExecutions drain]_block_invoke";
    v12 = 1024;
    v13 = 379;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - [Draining] Canceled latency delegate %@", (uint8_t *)&v10, 0x1Cu);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = 0;

  v8 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v8, "reportingCompletionHandler:", v3);
  }
  else if (!v8[10] && !v8[8] && !v8[9])
  {
    netqual_log_init();
    v9 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[NetworkQualityExecutions drain]_block_invoke";
      v12 = 1024;
      v13 = 389;
      _os_log_impl(&dword_20E622000, v9, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Finished draining stage - moving on", (uint8_t *)&v10, 0x12u);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
      __33__NetworkQualityExecutions_drain__block_invoke_47_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "run");
  }

}

void __33__NetworkQualityExecutions_drain__block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  netqual_log_init();
  v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v10 = 136315650;
    v11 = "-[NetworkQualityExecutions drain]_block_invoke";
    v12 = 1024;
    v13 = 407;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - [Draining] Canceled dl delegate %@", (uint8_t *)&v10, 0x1Cu);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = 0;

  v8 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v8, "reportingCompletionHandler:", v3);
  }
  else if (!v8[10] && !v8[8] && !v8[9])
  {
    netqual_log_init();
    v9 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[NetworkQualityExecutions drain]_block_invoke";
      v12 = 1024;
      v13 = 417;
      _os_log_impl(&dword_20E622000, v9, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Finished draining stage - moving on", (uint8_t *)&v10, 0x12u);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
      __33__NetworkQualityExecutions_drain__block_invoke_51_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "run");
  }

}

void __33__NetworkQualityExecutions_drain__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  netqual_log_init();
  v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    v10 = 136315650;
    v11 = "-[NetworkQualityExecutions drain]_block_invoke";
    v12 = 1024;
    v13 = 428;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - [Draining] Canceled ul delegate %@", (uint8_t *)&v10, 0x1Cu);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = 0;

  v8 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v8, "reportingCompletionHandler:", v3);
  }
  else if (!v8[10] && !v8[8] && !v8[9])
  {
    netqual_log_init();
    v9 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[NetworkQualityExecutions drain]_block_invoke";
      v12 = 1024;
      v13 = 438;
      _os_log_impl(&dword_20E622000, v9, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Finished draining stage - moving on", (uint8_t *)&v10, 0x12u);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
      __33__NetworkQualityExecutions_drain__block_invoke_52_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "run");
  }

}

- (BOOL)isDraining
{
  return -[NetworkQualityExecutions currentStageIs:](self, "currentStageIs:", 2)
      || -[NetworkQualityExecutions currentStageIs:](self, "currentStageIs:", 5)
      || -[NetworkQualityExecutions currentStageIs:](self, "currentStageIs:", 8)
      || -[NetworkQualityExecutions currentStageIs:](self, "currentStageIs:", 11);
}

- (void)setTimeout
{
  __assert_rtn("-[NetworkQualityExecutions setTimeout]", "Executions.m", 508, "divisor > 0");
}

uint64_t __38__NetworkQualityExecutions_setTimeout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkTimeout");
}

- (void)run
{
  __assert_rtn("-[NetworkQualityExecutions run]", "Executions.m", 801, "self->latencyDelegate == nil");
}

void __31__NetworkQualityExecutions_run__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
  {
    if (v3)
    {
      objc_msgSend(v3, "code");
      nw_activity_complete_with_reason();
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
        __31__NetworkQualityExecutions_run__block_invoke_cold_1();
      objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v3);
    }
    else
    {
      nw_activity_complete_with_reason();
      netqual_log_init();
      v4 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315394;
        v6 = "-[NetworkQualityExecutions run]_block_invoke";
        v7 = 1024;
        v8 = 586;
        _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Finished idle latency stage - moving to draining", (uint8_t *)&v5, 0x12u);
      }
      objc_msgSend(*(id *)(a1 + 32), "run");
    }
  }

}

void __31__NetworkQualityExecutions_run__block_invoke_71(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "code");
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __31__NetworkQualityExecutions_run__block_invoke_71_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v4);
  }
  else
  {
    nw_activity_complete_with_reason();
  }

}

uint64_t __31__NetworkQualityExecutions_run__block_invoke_72(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  netqual_log_init();
  v2 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[NetworkQualityExecutions run]_block_invoke";
    v6 = 1024;
    v7 = 674;
    _os_log_impl(&dword_20E622000, v2, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Parallel Responsiveness saturated", (uint8_t *)&v4, 0x12u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

void __31__NetworkQualityExecutions_run__block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "code");
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __31__NetworkQualityExecutions_run__block_invoke_81_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v4);
  }
  else
  {
    nw_activity_complete_with_reason();
  }

}

uint64_t __31__NetworkQualityExecutions_run__block_invoke_82(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  netqual_log_init();
  v2 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[NetworkQualityExecutions run]_block_invoke";
    v6 = 1024;
    v7 = 761;
    _os_log_impl(&dword_20E622000, v2, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Downlink Responsiveness saturated", (uint8_t *)&v4, 0x12u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

void __31__NetworkQualityExecutions_run__block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "code");
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __31__NetworkQualityExecutions_run__block_invoke_91_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v4);
  }
  else
  {
    nw_activity_complete_with_reason();
  }

}

uint64_t __31__NetworkQualityExecutions_run__block_invoke_92(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  netqual_log_init();
  v2 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[NetworkQualityExecutions run]_block_invoke";
    v6 = 1024;
    v7 = 846;
    _os_log_impl(&dword_20E622000, v2, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Uplink Responsiveness saturated", (uint8_t *)&v4, 0x12u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

- (void)runWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *executionsQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  executionsQueue = self->_executionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke;
  block[3] = &unk_24C976570;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(executionsQueue, block);

}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  id v15;
  nw_endpoint_t bonjour_service;
  dispatch_semaphore_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  dispatch_time_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  const char *v49;
  void *v50;
  uint64_t isKindOfClass;
  NetworkQualityRemoteConfiguration *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  char v64;
  id v65;
  nw_endpoint_t host;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[10];
  id v75;
  NSObject *v76;
  _BYTE *v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  void *v81;
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  uint64_t v87;
  _BYTE v88[32];
  _BYTE v89[24];
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = a1 + 32;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v3 + 216);
  *(_QWORD *)(v3 + 216) = v2;

  objc_storeStrong((id *)(*(_QWORD *)v4 + 240), *(id *)(*(_QWORD *)v4 + 216));
  v6 = MEMORY[0x212BC1F98](*(_QWORD *)(a1 + 40));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
  *(_QWORD *)(*(_QWORD *)v4 + 200) = v6;

  objc_msgSend(*(id *)(a1 + 32), "createDefaultNSURLSessionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "bonjourHost");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "configuration");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v52 = [NetworkQualityRemoteConfiguration alloc];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "configuration");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:](v52, "initWithDictionary:andConfig:", v53, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
        v55 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = v54;

        netqual_log_init();
        v56 = os_log_netqual;
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v89 = 136315394;
          *(_QWORD *)&v89[4] = "-[NetworkQualityExecutions runWithCompletionHandler:]_block_invoke";
          *(_WORD *)&v89[12] = 1024;
          *(_DWORD *)&v89[14] = 1008;
          _os_log_impl(&dword_20E622000, v56, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Moving to initial stage", v89, 0x12u);
        }
        objc_msgSend(*(id *)(a1 + 32), "run");
      }
      else
      {
        v57 = *(_QWORD *)(a1 + 40);
        v58 = objc_alloc(MEMORY[0x24BDD1540]);
        v78 = *MEMORY[0x24BDD0FC8];
        v79 = CFSTR("Unknown object type");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_msgSend(v58, "initWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1002, v59);
        (*(void (**)(uint64_t, _QWORD, void *))(v57 + 16))(v57, 0, v60);

      }
      goto LABEL_33;
    }
  }
  *(_QWORD *)v89 = 0;
  *(_QWORD *)&v89[8] = v89;
  *(_QWORD *)&v89[16] = 0x3032000000;
  v90 = __Block_byref_object_copy_;
  v91 = __Block_byref_object_dispose_;
  v92 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "bonjourHost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  v14 = MEMORY[0x24BDAC760];
  if (v12)
  {
    objc_msgSend(v13, "configuration");
    v26 = objc_claimAutoreleasedReturnValue();
    bonjour_service = 0;
    v21 = *(NSObject **)(*(_QWORD *)&v89[8] + 40);
    *(_QWORD *)(*(_QWORD *)&v89[8] + 40) = v26;
  }
  else
  {
    objc_msgSend(v13, "bonjourHost");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    bonjour_service = nw_endpoint_create_bonjour_service((const char *)objc_msgSend(v15, "UTF8String"), "_nq._tcp", "local");

    v17 = dispatch_semaphore_create(0);
    v18 = (void *)nw_resolver_create_with_endpoint();
    dispatch_get_global_queue(0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v74[6] = v14;
    v74[7] = 3221225472;
    v74[8] = __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_95;
    v74[9] = &unk_24C976520;
    v77 = v89;
    v20 = v18;
    v75 = v20;
    v21 = v17;
    v76 = v21;
    nw_resolver_set_update_handler();

    v22 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v21, v22);
    if (!*(_QWORD *)(*(_QWORD *)&v89[8] + 40))
    {
      netqual_log_init();
      v23 = (id)os_log_netqual;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "bonjourHost");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_cold_2(v24, (uint64_t)v88, v23);
      }

      v25 = *(void **)(*(_QWORD *)&v89[8] + 40);
      *(_QWORD *)(*(_QWORD *)&v89[8] + 40) = CFSTR("https://networkquality/.well-known/nq");

    }
  }

  netqual_log_init();
  v27 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(_QWORD *)(*(_QWORD *)&v89[8] + 40);
    *(_DWORD *)buf = 136315650;
    v83 = "-[NetworkQualityExecutions runWithCompletionHandler:]_block_invoke";
    v84 = 1024;
    v85 = 918;
    v86 = 2112;
    v87 = v28;
    _os_log_impl(&dword_20E622000, v27, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Configuration URL: %@", buf, 0x1Cu);
  }
  objc_msgSend(v8, "setTimeoutIntervalForRequest:", 15.0);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v8, *(_QWORD *)(a1 + 32), 0);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(v30 + 88);
  *(_QWORD *)(v30 + 88) = v29;

  v32 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(*(_QWORD *)&v89[8] + 40));
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "requestWithURL:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "networkInterfaceName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = v35 == 0;

  if ((v33 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "networkInterfaceName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBoundInterfaceIdentifier:", v36);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "forceHTTP3"))
    objc_msgSend(v34, "setAssumesHTTP3Capable:", 1);
  objc_msgSend(v34, "setValue:forHTTPHeaderField:", CFSTR("identity"), CFSTR("Accept-Encoding"));
  v37 = *(_QWORD *)(a1 + 32);
  v38 = *(void **)(v37 + 88);
  v74[0] = v14;
  v74[1] = 3221225472;
  v74[2] = __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_110;
  v74[3] = &unk_24C976548;
  v74[4] = v37;
  v74[5] = v89;
  objc_msgSend(v38, "dataTaskWithRequest:completionHandler:", v34, v74);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (bonjour_service)
  {
    objc_msgSend(v39, "set_hostOverride:", bonjour_service);
LABEL_32:
    objc_msgSend(v40, "resume");

    _Block_object_dispose(v89, 8);
    goto LABEL_33;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "hostOverride");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41 == 0;

  if (v42)
    goto LABEL_32;
  v43 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "configuration");
  v44 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "URLWithString:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "port");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v44) = v46 == 0;

  if ((v44 & 1) == 0)
  {
    objc_msgSend(v45, "port");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringValue");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v49 = (const char *)objc_msgSend(v48, "UTF8String");

LABEL_31:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "hostOverride");
    v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    host = nw_endpoint_create_host((const char *)objc_msgSend(v65, "UTF8String"), v49);
    objc_msgSend(v40, "set_hostOverride:", host);

    goto LABEL_32;
  }
  objc_msgSend(v45, "scheme");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("https"));

  if ((v62 & 1) != 0)
  {
    v49 = "443";
    goto LABEL_31;
  }
  objc_msgSend(v45, "scheme");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("http"));

  if ((v64 & 1) != 0)
  {
    v49 = "80";
    goto LABEL_31;
  }
  v67 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "configuration");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "hostOverride");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "stringWithFormat:", CFSTR("URL %@ not valid for use with host-override %@"), v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_cold_1();
  v71 = (void *)MEMORY[0x24BDD1540];
  v80 = *MEMORY[0x24BDD0FC8];
  v81 = v70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1006, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v73);
  _Block_object_dispose(v89, 8);

LABEL_33:
}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_95(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (nw_array_get_count())
  {
    nw_array_get_object_at_index();
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", nw_endpoint_get_hostname(v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasSuffix:", CFSTR(".")))
    {
      objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", nw_endpoint_copy_port_string(v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("443")))
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@/.well-known/nq"), v5, v11);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@:%@/.well-known/nq"), v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  nw_resolver_cancel();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_110(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NetworkQualityRemoteConfiguration *v15;
  NetworkQualityRemoteConfiguration *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;
  const __CFString *v38;
  _QWORD v39[3];
  _QWORD v40[4];

  v40[3] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "invalidateAndCancel");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 88);
  *(_QWORD *)(v10 + 88) = 0;

  v12 = v8;
  v13 = v12;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v9);
  }
  else
  {
    v14 = objc_msgSend(v12, "statusCode");
    if (v7 && v14 == 200)
    {
      v15 = -[NetworkQualityRemoteConfiguration initWithData:andConfig:]([NetworkQualityRemoteConfiguration alloc], "initWithData:andConfig:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
      v16 = v15;
      if (v15)
      {
        -[NetworkQualityRemoteConfiguration testEndpoint](v15, "testEndpoint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setTestEndpoint:", v17);

        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v16);
        netqual_log_init();
        v18 = os_log_netqual;
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[NetworkQualityExecutions runWithCompletionHandler:]_block_invoke";
          v35 = 1024;
          v36 = 970;
          _os_log_impl(&dword_20E622000, v18, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Moving to initial stage", buf, 0x12u);
        }
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(void **)(v20 + 216);
        *(_QWORD *)(v20 + 216) = v19;

        objc_msgSend(*(id *)(a1 + 32), "run");
      }
      else
      {
        v30 = (void *)MEMORY[0x24BDD1540];
        v37 = *MEMORY[0x24BDD0FC8];
        v38 = CFSTR("Could not parse server side configuration");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1000, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v32);
      }

    }
    else
    {
      netqual_log_init();
      v22 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
        __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_110_cold_1(v22, v13, (uint64_t)v7);
      v23 = (void *)MEMORY[0x24BDD1540];
      v39[0] = CFSTR("statusCode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "statusCode"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = CFSTR("URL");
      v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v40[0] = v25;
      v40[1] = v26;
      v39[2] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected HTTP status code 200, got %lu"), objc_msgSend(v13, "statusCode"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2] = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1003, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v29);
    }
  }

}

- (void)captureError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NetworkQualityResult error](self->_progressResults, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[NetworkQualityResult setError:](self->_progressResults, "setError:", v5);

}

- (void)execDLWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  DownloadThroughputDelegate *v8;
  NSOperationQueue *operationQueue;
  void *v10;
  ThroughputDelegate *v11;
  ThroughputDelegate *v12;
  OS_nw_activity *v13;
  OS_nw_activity *downloadThroughputNWActivity;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  netqual_log_init();
  v5 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[NetworkQualityExecutions execDLWithCompletionHandler:]";
    v21 = 1024;
    v22 = 1029;
    _os_log_impl(&dword_20E622000, v5, OS_LOG_TYPE_DEFAULT, "%s:%u - Running Multi-flow Download Test", buf, 0x12u);
  }
  -[NetworkQualityRemoteConfiguration URLForURLType:](self->remoteConfig, "URLForURLType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityExecutions createDefaultRequestwithURL:](self, "createDefaultRequestwithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [DownloadThroughputDelegate alloc];
  operationQueue = self->_operationQueue;
  -[NetworkQualityRemoteConfiguration testEndpoint:](self->remoteConfig, "testEndpoint:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ThroughputDelegate initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:](v8, "initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:", self, CFSTR("tp_dl_multi_h2"), operationQueue, v10, self->config, self->_progressResults);

  if (self->dlDelegate)
    -[NetworkQualityExecutions execDLWithCompletionHandler:].cold.1();
  self->dlDelegate = v11;
  v12 = v11;

  v13 = (OS_nw_activity *)nw_activity_create();
  downloadThroughputNWActivity = self->_downloadThroughputNWActivity;
  self->_downloadThroughputNWActivity = v13;

  nw_activity_set_parent_activity();
  nw_activity_activate();
  v17 = v4;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke;
  v18[3] = &unk_24C9764D0;
  v18[4] = self;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke_138;
  v16[3] = &unk_24C976598;
  v16[4] = self;
  v15 = v4;
  -[ThroughputDelegate executeTaskWithRequest:saturationHandler:completionHandler:](v12, "executeTaskWithRequest:saturationHandler:completionHandler:", v7, v18, v16);

}

uint64_t __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t result;
  NSObject *v23;
  const char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "metExitCriteria");
  netqual_log_init();
  v3 = (void *)os_log_netqual;
  v4 = os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
      v6 = v3;
      objc_msgSend(v5, "downlinkCapacity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (double)objc_msgSend(v8, "integerValue") * 0.000000953674316;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkFlows");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkBytesTransferred");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136316162;
      v26 = "-[NetworkQualityExecutions execDLWithCompletionHandler:]_block_invoke";
      v27 = 1024;
      v28 = 1056;
      v29 = 2048;
      v30 = v9;
      v31 = 2048;
      v32 = v11;
      v33 = 2048;
      v34 = objc_msgSend(v12, "integerValue");
      _os_log_impl(&dword_20E622000, v6, OS_LOG_TYPE_DEFAULT, "%s:%u - Exit throughput %.3f Mbps at %lu flows, transferred %ld bytes", (uint8_t *)&v25, 0x30u);

    }
    v13 = 249;
  }
  else
  {
    if (v4)
    {
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
      v15 = v3;
      objc_msgSend(v14, "downlinkCapacity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (double)objc_msgSend(v17, "integerValue") * 0.000000953674316;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkFlows");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "integerValue");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkBytesTransferred");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136316162;
      v26 = "-[NetworkQualityExecutions execDLWithCompletionHandler:]_block_invoke";
      v27 = 1024;
      v28 = 1063;
      v29 = 2048;
      v30 = v18;
      v31 = 2048;
      v32 = v20;
      v33 = 2048;
      v34 = objc_msgSend(v21, "integerValue");
      _os_log_impl(&dword_20E622000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - Saturation throughput %.3f Mbps at %lu flows, transferred %ld bytes", (uint8_t *)&v25, 0x30u);

    }
    v13 = 248;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + v13) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "currentStageIs:", 6);
  if ((_DWORD)result)
  {
    netqual_log_init();
    v23 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 248))
        v24 = "True";
      else
        v24 = "False";
      v25 = 136315650;
      v26 = "-[NetworkQualityExecutions execDLWithCompletionHandler:]_block_invoke";
      v27 = 1024;
      v28 = 1070;
      v29 = 2080;
      v30 = *(double *)&v24;
      _os_log_impl(&dword_20E622000, v23, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Downlink saturated %s, moving to responsiveness", (uint8_t *)&v25, 0x1Cu);
    }
    return objc_msgSend(*(id *)(a1 + 32), "run");
  }
  return result;
}

void __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "code") != -999)
    {
      objc_msgSend(v4, "domain");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v5 == CFSTR("NetworkQualityErrorDomain"))
        objc_msgSend(v4, "code");
      else

    }
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke_138_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    nw_activity_complete_with_reason();
  }

}

- (void)execULWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  UploadThroughputDelegate *v8;
  NSOperationQueue *operationQueue;
  void *v10;
  ThroughputDelegate *v11;
  ThroughputDelegate *v12;
  OS_nw_activity *v13;
  OS_nw_activity *uploadThroughputNWActivity;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  netqual_log_init();
  v5 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[NetworkQualityExecutions execULWithCompletionHandler:]";
    v21 = 1024;
    v22 = 1095;
    _os_log_impl(&dword_20E622000, v5, OS_LOG_TYPE_DEFAULT, "%s:%u - Running Multi-flow Upload Test", buf, 0x12u);
  }
  -[NetworkQualityRemoteConfiguration URLForURLType:](self->remoteConfig, "URLForURLType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityExecutions createDefaultRequestwithURL:](self, "createDefaultRequestwithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [UploadThroughputDelegate alloc];
  operationQueue = self->_operationQueue;
  -[NetworkQualityRemoteConfiguration testEndpoint:](self->remoteConfig, "testEndpoint:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ThroughputDelegate initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:](v8, "initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:", self, CFSTR("tp_ul_multi_h2"), operationQueue, v10, self->config, self->_progressResults);

  if (self->ulDelegate)
    -[NetworkQualityExecutions execULWithCompletionHandler:].cold.1();
  self->ulDelegate = v11;
  v12 = v11;

  v13 = (OS_nw_activity *)nw_activity_create();
  uploadThroughputNWActivity = self->_uploadThroughputNWActivity;
  self->_uploadThroughputNWActivity = v13;

  nw_activity_set_parent_activity();
  nw_activity_activate();
  v17 = v4;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke;
  v18[3] = &unk_24C9764D0;
  v18[4] = self;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke_143;
  v16[3] = &unk_24C976598;
  v16[4] = self;
  v15 = v4;
  -[ThroughputDelegate executeTaskWithRequest:saturationHandler:completionHandler:](v12, "executeTaskWithRequest:saturationHandler:completionHandler:", v7, v18, v16);

}

uint64_t __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t result;
  NSObject *v23;
  const char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "metExitCriteria");
  netqual_log_init();
  v3 = (void *)os_log_netqual;
  v4 = os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
      v6 = v3;
      objc_msgSend(v5, "uplinkCapacity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (double)objc_msgSend(v8, "integerValue") * 0.000000953674316;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkFlows");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkBytesTransferred");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136316162;
      v26 = "-[NetworkQualityExecutions execULWithCompletionHandler:]_block_invoke";
      v27 = 1024;
      v28 = 1122;
      v29 = 2048;
      v30 = v9;
      v31 = 2048;
      v32 = v11;
      v33 = 2048;
      v34 = objc_msgSend(v12, "integerValue");
      _os_log_impl(&dword_20E622000, v6, OS_LOG_TYPE_DEFAULT, "%s:%u - Exit throughput %.3f Mbps at %lu flows, transferred %ld bytes", (uint8_t *)&v25, 0x30u);

    }
    v13 = 249;
  }
  else
  {
    if (v4)
    {
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
      v15 = v3;
      objc_msgSend(v14, "uplinkCapacity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (double)objc_msgSend(v17, "integerValue") * 0.000000953674316;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkFlows");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "integerValue");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkBytesTransferred");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136316162;
      v26 = "-[NetworkQualityExecutions execULWithCompletionHandler:]_block_invoke";
      v27 = 1024;
      v28 = 1129;
      v29 = 2048;
      v30 = v18;
      v31 = 2048;
      v32 = v20;
      v33 = 2048;
      v34 = objc_msgSend(v21, "integerValue");
      _os_log_impl(&dword_20E622000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - Saturation throughput %.3f Mbps at %lu flows, transferred %ld bytes", (uint8_t *)&v25, 0x30u);

    }
    v13 = 248;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + v13) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "currentStageIs:", 9);
  if ((_DWORD)result)
  {
    netqual_log_init();
    v23 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 248))
        v24 = "True";
      else
        v24 = "False";
      v25 = 136315650;
      v26 = "-[NetworkQualityExecutions execULWithCompletionHandler:]_block_invoke";
      v27 = 1024;
      v28 = 1136;
      v29 = 2080;
      v30 = *(double *)&v24;
      _os_log_impl(&dword_20E622000, v23, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Uplink saturated %s, moving to responsiveness", (uint8_t *)&v25, 0x1Cu);
    }
    return objc_msgSend(*(id *)(a1 + 32), "run");
  }
  return result;
}

void __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "code") != -999)
    {
      objc_msgSend(v4, "domain");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v5 == CFSTR("NetworkQualityErrorDomain"))
        objc_msgSend(v4, "code");
      else

    }
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke_143_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    nw_activity_complete_with_reason();
  }

}

- (void)execParallelWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  DownloadThroughputDelegate *v8;
  NSOperationQueue *operationQueue;
  void *v10;
  DownloadThroughputDelegate *v11;
  void *v12;
  void *v13;
  UploadThroughputDelegate *v14;
  NSOperationQueue *v15;
  void *v16;
  UploadThroughputDelegate *v17;
  OS_nw_activity *v18;
  OS_nw_activity *downloadThroughputNWActivity;
  uint64_t v20;
  id v21;
  OS_nw_activity *v22;
  OS_nw_activity *uploadThroughputNWActivity;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[7];
  _QWORD v30[5];
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[7];
  _QWORD v35[3];
  char v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[3];
  char v40;
  _QWORD v41[3];
  char v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  netqual_log_init();
  v5 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]";
    v45 = 1024;
    v46 = 1166;
    _os_log_impl(&dword_20E622000, v5, OS_LOG_TYPE_DEFAULT, "%s:%u - Running Multi-flow Parallel Test", buf, 0x12u);
  }
  -[NetworkQualityRemoteConfiguration URLForURLType:](self->remoteConfig, "URLForURLType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityExecutions createDefaultRequestwithURL:](self, "createDefaultRequestwithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [DownloadThroughputDelegate alloc];
  operationQueue = self->_operationQueue;
  -[NetworkQualityRemoteConfiguration testEndpoint:](self->remoteConfig, "testEndpoint:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ThroughputDelegate initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:](v8, "initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:", self, CFSTR("tp_dl_parallel_h2"), operationQueue, v10, self->config, self->_progressResults);

  if (self->dlDelegate)
    __assert_rtn("-[NetworkQualityExecutions execParallelWithCompletionHandler:]", "Executions.m", 1179, "self->dlDelegate == nil");
  objc_storeStrong((id *)&self->dlDelegate, v11);
  -[NetworkQualityRemoteConfiguration URLForURLType:](self->remoteConfig, "URLForURLType:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityExecutions createDefaultRequestwithURL:](self, "createDefaultRequestwithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [UploadThroughputDelegate alloc];
  v15 = self->_operationQueue;
  -[NetworkQualityRemoteConfiguration testEndpoint:](self->remoteConfig, "testEndpoint:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ThroughputDelegate initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:](v14, "initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:", self, CFSTR("tp_ul_parallel_h2"), v15, v16, self->config, self->_progressResults);

  if (self->ulDelegate)
    __assert_rtn("-[NetworkQualityExecutions execParallelWithCompletionHandler:]", "Executions.m", 1192, "self->ulDelegate == nil");
  objc_storeStrong((id *)&self->ulDelegate, v17);
  v18 = (OS_nw_activity *)nw_activity_create();
  downloadThroughputNWActivity = self->_downloadThroughputNWActivity;
  self->_downloadThroughputNWActivity = v18;

  nw_activity_set_parent_activity();
  nw_activity_activate();
  v20 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke;
  v34[3] = &unk_24C9765C0;
  v34[4] = self;
  v34[5] = v39;
  v34[6] = v41;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_148;
  v30[3] = &unk_24C9765E8;
  v30[4] = self;
  v21 = v4;
  v31 = v21;
  v32 = v37;
  v33 = v35;
  -[ThroughputDelegate executeTaskWithRequest:saturationHandler:completionHandler:](v11, "executeTaskWithRequest:saturationHandler:completionHandler:", v7, v34, v30);
  v22 = (OS_nw_activity *)nw_activity_create();
  uploadThroughputNWActivity = self->_uploadThroughputNWActivity;
  self->_uploadThroughputNWActivity = v22;

  nw_activity_set_parent_activity();
  nw_activity_activate();
  v29[0] = v20;
  v29[1] = 3221225472;
  v29[2] = __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_149;
  v29[3] = &unk_24C9765C0;
  v29[4] = self;
  v29[5] = v41;
  v29[6] = v39;
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_150;
  v25[3] = &unk_24C9765E8;
  v25[4] = self;
  v24 = v21;
  v26 = v24;
  v27 = v35;
  v28 = v37;
  -[ThroughputDelegate executeTaskWithRequest:saturationHandler:completionHandler:](v17, "executeTaskWithRequest:saturationHandler:completionHandler:", v13, v29, v25);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  netqual_log_init();
  v2 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    v4 = v2;
    objc_msgSend(v3, "downlinkCapacity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (double)objc_msgSend(v6, "integerValue") * 0.000000953674316;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkFlows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkBytesTransferred");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v16 = 136316418;
    v17 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]_block_invoke";
    v18 = 1024;
    v19 = 1206;
    v20 = 2048;
    v21 = v7;
    v22 = 2048;
    v23 = v9;
    v24 = 2048;
    v25 = v11;
    v26 = 1024;
    v27 = v12;
    _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Download saturation throughput %.3f Mbps at %lu flows, transferred %ld bytes, uplink saturation %u", (uint8_t *)&v16, 0x36u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "metExitCriteria");
    v14 = 248;
    if (v13)
      v14 = 249;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + v14) = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "currentStageIs:", 3))
    {
      netqual_log_init();
      v15 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315394;
        v17 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]_block_invoke";
        v18 = 1024;
        v19 = 1218;
        _os_log_impl(&dword_20E622000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] parallel saturated - moving to responsiveness", (uint8_t *)&v16, 0x12u);
      }
      objc_msgSend(*(id *)(a1 + 32), "run");
    }
  }
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_148(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void (*v5)(void);
  __CFString *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "code") != -999)
    {
      objc_msgSend(v4, "domain");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v6 == CFSTR("NetworkQualityErrorDomain"))
        objc_msgSend(v4, "code");
      else

    }
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_148_cold_1();
    v5 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_12;
  }
  nw_activity_complete_with_reason();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v5 = *(void (**)(void))(a1[5] + 16);
LABEL_12:
    v5();
  }

}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_149(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  netqual_log_init();
  v2 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    v4 = v2;
    objc_msgSend(v3, "uplinkCapacity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (double)objc_msgSend(v6, "integerValue") * 0.000000953674316;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkFlows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkBytesTransferred");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v16 = 136316418;
    v17 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]_block_invoke";
    v18 = 1024;
    v19 = 1257;
    v20 = 2048;
    v21 = v7;
    v22 = 2048;
    v23 = v9;
    v24 = 2048;
    v25 = v11;
    v26 = 1024;
    v27 = v12;
    _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Upload saturation throughput %.3f Mbps at %lu flows, transferred %ld bytes, downlink saturation %u", (uint8_t *)&v16, 0x36u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "metExitCriteria");
    v14 = 248;
    if (v13)
      v14 = 249;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + v14) = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "currentStageIs:", 3))
    {
      netqual_log_init();
      v15 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315394;
        v17 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]_block_invoke";
        v18 = 1024;
        v19 = 1268;
        _os_log_impl(&dword_20E622000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] parallel saturated - moving to draining", (uint8_t *)&v16, 0x12u);
      }
      objc_msgSend(*(id *)(a1 + 32), "run");
    }
  }
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_150(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void (*v5)(void);
  __CFString *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "code") != -999)
    {
      objc_msgSend(v4, "domain");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v6 == CFSTR("NetworkQualityErrorDomain"))
        objc_msgSend(v4, "code");
      else

    }
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_150_cold_1();
    v5 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_12;
  }
  nw_activity_complete_with_reason();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v5 = *(void (**)(void))(a1[5] + 16);
LABEL_12:
    v5();
  }

}

- (void)reallyExecuteParallel
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__NetworkQualityExecutions_reallyExecuteParallel__block_invoke;
  v5[3] = &unk_24C976610;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[NetworkQualityExecutions execParallelWithCompletionHandler:](self, "execParallelWithCompletionHandler:", v5);

}

void __49__NetworkQualityExecutions_reallyExecuteParallel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkCapacity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v8 = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkBytesTransferred");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", (uint64_t)((double)(int)(8 * objc_msgSend(v10, "intValue")) / v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkCapacity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkCapacity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateConfidence:", 1);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkCapacity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v18 = v17;

    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkBytesTransferred");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInteger:", (uint64_t)((double)(int)(8 * objc_msgSend(v20, "intValue")) / v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkCapacity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:", v21);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkCapacity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateConfidence:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "shareProgress");
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v24 != CFSTR("NetworkQualityErrorDomain"))
    {

LABEL_12:
      objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v3);
      goto LABEL_13;
    }
    if (objc_msgSend(v3, "code") != 1005)
      goto LABEL_12;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 96))
    {
      objc_msgSend(v3, "domain");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v25 == CFSTR("NetworkQualityErrorDomain"))
      {
        if (objc_msgSend(v3, "code") == 1005 && (objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
        {
          netqual_log_init();
          v26 = os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            v27 = 136315394;
            v28 = "-[NetworkQualityExecutions reallyExecuteParallel]_block_invoke";
            v29 = 1024;
            v30 = 1330;
            _os_log_impl(&dword_20E622000, v26, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Parallel data limit exceeded - moving to draining", (uint8_t *)&v27, 0x12u);
          }
          objc_msgSend(*(id *)(a1 + 32), "run");
        }
      }
      else
      {

      }
    }
  }
LABEL_13:

}

- (void)reallyExecuteDL
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  netqual_log_init();
  v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[NetworkQualityExecutions reallyExecuteDL]";
    v10 = 1024;
    v11 = 1340;
    _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Running dl test", buf, 0x12u);
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__NetworkQualityExecutions_reallyExecuteDL__block_invoke;
  v6[3] = &unk_24C976610;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[NetworkQualityExecutions execDLWithCompletionHandler:](self, "execDLWithCompletionHandler:", v6);

}

void __43__NetworkQualityExecutions_reallyExecuteDL__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkCapacity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v8 = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkBytesTransferred");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", (uint64_t)((double)(int)(8 * objc_msgSend(v10, "intValue")) / v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkCapacity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "downlinkCapacity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateConfidence:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "shareProgress");
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v14 != CFSTR("NetworkQualityErrorDomain"))
    {

LABEL_10:
      objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v3);
      goto LABEL_11;
    }
    if (objc_msgSend(v3, "code") != 1005)
      goto LABEL_10;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 96))
    {
      objc_msgSend(v3, "domain");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v15 == CFSTR("NetworkQualityErrorDomain"))
      {
        if (objc_msgSend(v3, "code") == 1005 && (objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
        {
          netqual_log_init();
          v16 = os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            v17 = 136315394;
            v18 = "-[NetworkQualityExecutions reallyExecuteDL]_block_invoke";
            v19 = 1024;
            v20 = 1363;
            _os_log_impl(&dword_20E622000, v16, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Downlink data limit exceeded - moving to draining", (uint8_t *)&v17, 0x12u);
          }
          objc_msgSend(*(id *)(a1 + 32), "run");
        }
      }
      else
      {

      }
    }
  }
LABEL_11:

}

- (void)reallyExecuteUL
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  netqual_log_init();
  v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[NetworkQualityExecutions reallyExecuteUL]";
    v10 = 1024;
    v11 = 1373;
    _os_log_impl(&dword_20E622000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Running ul test", buf, 0x12u);
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__NetworkQualityExecutions_reallyExecuteUL__block_invoke;
  v6[3] = &unk_24C976610;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[NetworkQualityExecutions execULWithCompletionHandler:](self, "execULWithCompletionHandler:", v6);

}

void __43__NetworkQualityExecutions_reallyExecuteUL__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkCapacity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v8 = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkBytesTransferred");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", (uint64_t)((double)(int)(8 * objc_msgSend(v10, "intValue")) / v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkCapacity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "uplinkCapacity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateConfidence:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "shareProgress");
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v14 != CFSTR("NetworkQualityErrorDomain"))
    {

LABEL_10:
      objc_msgSend(*(id *)(a1 + 32), "reportingCompletionHandler:", v3);
      goto LABEL_11;
    }
    if (objc_msgSend(v3, "code") != 1005)
      goto LABEL_10;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 96))
    {
      objc_msgSend(v3, "domain");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v15 == CFSTR("NetworkQualityErrorDomain"))
      {
        if (objc_msgSend(v3, "code") == 1005 && (objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
        {
          netqual_log_init();
          v16 = os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            v17 = 136315394;
            v18 = "-[NetworkQualityExecutions reallyExecuteUL]_block_invoke";
            v19 = 1024;
            v20 = 1396;
            _os_log_impl(&dword_20E622000, v16, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Uplink data limit exceeded - moving to draining", (uint8_t *)&v17, 0x12u);
          }
          objc_msgSend(*(id *)(a1 + 32), "run");
        }
      }
      else
      {

      }
    }
  }
LABEL_11:

}

- (void)_cancelWithOptionalError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NetworkQualityExecutionsDelegate *delegate;
  id completionHandler;
  ThroughputDelegate *dlDelegate;
  ThroughputDelegate *v10;
  ThroughputDelegate *ulDelegate;
  ThroughputDelegate *v12;
  LatencyURLSessionDelegate *latencyDelegate;
  LatencyURLSessionDelegate *v14;
  NSURLSession *configSession;
  NSURLSession *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  netqual_log_init();
  v5 = (id)os_log_netqual;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v6 = objc_msgSend(v4, "code");
    else
      v6 = 0;
    v17 = 136315650;
    v18 = "-[NetworkQualityExecutions _cancelWithOptionalError:]";
    v19 = 1024;
    v20 = 1405;
    v21 = 2048;
    v22 = v6;
    _os_log_impl(&dword_20E622000, v5, OS_LOG_TYPE_DEFAULT, "%s:%u - Cancelling with %ld", (uint8_t *)&v17, 0x1Cu);
  }

  if (!self->cancelled)
  {
    self->cancelled = 1;
    delegate = self->_delegate;
    self->_delegate = 0;

    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    -[NetworkQualityExecutions captureError:](self, "captureError:", v4);
    dlDelegate = self->dlDelegate;
    if (dlDelegate)
    {
      -[ThroughputDelegate cancel](dlDelegate, "cancel");
      v10 = self->dlDelegate;
      self->dlDelegate = 0;

    }
    ulDelegate = self->ulDelegate;
    if (ulDelegate)
    {
      -[ThroughputDelegate cancel](ulDelegate, "cancel");
      v12 = self->ulDelegate;
      self->ulDelegate = 0;

    }
    latencyDelegate = self->latencyDelegate;
    if (latencyDelegate)
    {
      -[LatencyURLSessionDelegate cancel](latencyDelegate, "cancel");
      v14 = self->latencyDelegate;
      self->latencyDelegate = 0;

    }
    configSession = self->_configSession;
    if (configSession)
    {
      -[NSURLSession invalidateAndCancel](configSession, "invalidateAndCancel");
      v16 = self->_configSession;
      self->_configSession = 0;

    }
    if (v4)
      nw_activity_complete_with_reason();
  }

}

- (void)cancel
{
  NSObject *executionsQueue;
  _QWORD block[5];

  executionsQueue = self->_executionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__NetworkQualityExecutions_cancel__block_invoke;
  block[3] = &unk_24C9764D0;
  block[4] = self;
  dispatch_async(executionsQueue, block);
}

void __34__NetworkQualityExecutions_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD0FC8];
  v6[0] = CFSTR("Test canceled by user.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1004, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_cancelWithOptionalError:", v4);

}

- (void)_sendSymptomReport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Failed to archive dictionary. Error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
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
  if (-[NetworkQualityConfiguration validateCertificate](self->config, "validateCertificate"))
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

- (BOOL)throughputSaturated
{
  return self->_throughputSaturated;
}

- (BOOL)throughputMetExitCriteria
{
  return self->_throughputMetExitCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProgressUpdate, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_startCapacityTest, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_progressResults, 0);
  objc_storeStrong((id *)&self->config, 0);

  objc_storeStrong((id *)&self->remoteConfig, 0);
  objc_storeStrong((id *)&self->_configSession, 0);
  objc_storeStrong((id *)&self->latencyDelegate, 0);
  objc_storeStrong((id *)&self->ulDelegate, 0);
  objc_storeStrong((id *)&self->dlDelegate, 0);
  objc_storeStrong((id *)&self->_uploadThroughputNWActivity, 0);
  objc_storeStrong((id *)&self->_downloadThroughputNWActivity, 0);
  objc_storeStrong((id *)&self->_workingLatencyNWActivity, 0);
  objc_storeStrong((id *)&self->_idleLatencyNWActivity, 0);
  objc_storeStrong((id *)&self->_parentNWActivity, 0);
  objc_storeStrong((id *)&self->_executionsQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)initWithConfiguration:(void *)a1 .cold.1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "networkInterfaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_20E622000, v3, v5, "%s:%u - Invalid interface name %@ specified", (uint8_t *)v6);

}

void __33__NetworkQualityExecutions_drain__block_invoke_47_cold_1()
{
  __assert_rtn("-[NetworkQualityExecutions drain]_block_invoke", "Executions.m", 390, "[self isDraining]");
}

void __33__NetworkQualityExecutions_drain__block_invoke_51_cold_1()
{
  __assert_rtn("-[NetworkQualityExecutions drain]_block_invoke", "Executions.m", 418, "[self isDraining]");
}

void __33__NetworkQualityExecutions_drain__block_invoke_52_cold_1()
{
  __assert_rtn("-[NetworkQualityExecutions drain]_block_invoke", "Executions.m", 439, "[self isDraining]");
}

void __31__NetworkQualityExecutions_run__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - IdleLatencyURLSessionDelegate failed with an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __31__NetworkQualityExecutions_run__block_invoke_71_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - WorkingLatencyURLSessionDelegate failed with an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __31__NetworkQualityExecutions_run__block_invoke_81_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - WorkingLatencyURLSessionDelegate failed with an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __31__NetworkQualityExecutions_run__block_invoke_91_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - WorkingLatencyURLSessionDelegate failed with an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315650;
  *(_QWORD *)(a2 + 4) = "-[NetworkQualityExecutions runWithCompletionHandler:]_block_invoke_2";
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = 909;
  *(_WORD *)(a2 + 18) = 2112;
  *(_QWORD *)(a2 + 20) = a1;
  OUTLINED_FUNCTION_3(&dword_20E622000, a3, (uint64_t)a3, "%s:%u - Timed-out resolving %@. Defaulting confURL", (uint8_t *)a2);

}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_110_cold_1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  _WORD v7[10];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "statusCode");
  *(_DWORD *)v7 = 136315906;
  OUTLINED_FUNCTION_2();
  *(_DWORD *)&v7[7] = 946;
  v7[9] = 2048;
  v8 = v6;
  v9 = 2048;
  v10 = a3;
  _os_log_error_impl(&dword_20E622000, v5, OS_LOG_TYPE_ERROR, "%s:%u - Either the HTTP response %lu or network data %p are invalid", (uint8_t *)v7, 0x26u);

}

- (void)execDLWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[NetworkQualityExecutions execDLWithCompletionHandler:]", "Executions.m", 1040, "self->dlDelegate == nil");
}

void __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke_138_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Test failed with an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)execULWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[NetworkQualityExecutions execULWithCompletionHandler:]", "Executions.m", 1106, "self->ulDelegate == nil");
}

void __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke_143_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Test failed with an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_148_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Test failed with an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_150_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Test failed with an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

@end
