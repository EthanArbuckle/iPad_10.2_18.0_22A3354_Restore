@implementation NetworkQualityAssessment

- (NetworkQualityAssessment)initWithConfiguration:(id)a3
{
  return -[NetworkQualityAssessment initWithConfiguration:delegate:delegateQueue:](self, "initWithConfiguration:delegate:delegateQueue:", a3, 0, 0);
}

- (NetworkQualityAssessment)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NetworkQualityAssessment *v11;
  uint64_t v12;
  NetworkQualityConfiguration *config;
  NetworkQualityResult *v14;
  NetworkQualityResult *progressResults;
  NetworkQualityDelegate *delegate;
  NetworkQualityExecutions *v17;
  NetworkQualityConfiguration *v18;
  uint64_t v19;
  NetworkQualityExecutions *execution;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NetworkQualityAssessment;
  v11 = -[NetworkQualityAssessment init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    config = v11->_config;
    v11->_config = (NetworkQualityConfiguration *)v12;

    objc_storeStrong((id *)&v11->_delegate, a4);
    objc_storeStrong((id *)&v11->_delegateQueue, a5);
    v11->_testRunning = 0;
    v14 = objc_alloc_init(NetworkQualityResult);
    progressResults = v11->_progressResults;
    v11->_progressResults = v14;

    v11->_resultsIndex = 0;
    delegate = v11->_delegate;
    v17 = [NetworkQualityExecutions alloc];
    v18 = v11->_config;
    if (delegate)
      v19 = -[NetworkQualityExecutions initWithConfiguration:delegate:](v17, "initWithConfiguration:delegate:", v18, v11);
    else
      v19 = -[NetworkQualityExecutions initWithConfiguration:](v17, "initWithConfiguration:", v18);
    execution = v11->_execution;
    v11->_execution = (NetworkQualityExecutions *)v19;

  }
  return v11;
}

- (void)progress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSOperationQueue *delegateQueue;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v4, "workingLatencyResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "setWorkingLatencyValues:", v7);

  objc_msgSend(v4, "idleLatencyResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v5, "setIdleLatencyValues:", v9);

  objc_msgSend(v4, "mutableOtherValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", CFSTR("protocols_seen"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAppProtocol:", v13);

  }
  if (self->_delegate)
  {
    ++self->_resultsIndex;
    objc_msgSend(v5, "setIndex:");
    objc_msgSend(v5, "finalizeResult");
    delegateQueue = self->_delegateQueue;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __37__NetworkQualityAssessment_progress___block_invoke;
    v15[3] = &unk_24C976810;
    v15[4] = self;
    v16 = v5;
    -[NSOperationQueue addOperationWithBlock:](delegateQueue, "addOperationWithBlock:", v15);

  }
}

uint64_t __37__NetworkQualityAssessment_progress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "progress:", *(_QWORD *)(a1 + 40));
}

- (void)finalizeResults:(id)a3 withError:(id)a4 withCompletionHandler:(id)a5
{
  void (**v8)(id, void *, id);
  id v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = (void (**)(id, void *, id))a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v26, "workingLatencyResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v10, "setWorkingLatencyValues:", v12);

  objc_msgSend(v26, "idleLatencyResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v10, "setIdleLatencyValues:", v14);

  objc_msgSend(v26, "mutableOtherValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("protocols_seen"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAppProtocol:", v18);

    objc_msgSend(v10, "setProtocolNames:", v16);
  }
  objc_msgSend(v26, "mutableOtherValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocols_seen"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("proxied"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProxied:", v21 != 0);

  objc_msgSend(v26, "mutableOtherValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v10, "setOtherValues:", v23);

  objc_msgSend(v26, "mutableURLSessionMetrics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v10, "setUrlSessionMetrics:", v25);

  ++self->_resultsIndex;
  objc_msgSend(v10, "setIndex:");
  objc_msgSend(v10, "finalizeResult");
  v8[2](v8, v10, v9);

}

- (void)runWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NetworkQualityAssessment *v5;
  void *v6;
  NetworkQualityExecutions *execution;
  _QWORD v8[5];
  void (**v9)(id, _QWORD, void *);

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_testRunning)
  {
    objc_sync_exit(v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1002, 0);
    v4[2](v4, 0, v6);

  }
  else
  {
    v5->_testRunning = 1;
    objc_sync_exit(v5);

    execution = v5->_execution;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__NetworkQualityAssessment_runWithCompletionHandler___block_invoke;
    v8[3] = &unk_24C976838;
    v8[4] = v5;
    v9 = v4;
    -[NetworkQualityExecutions runWithCompletionHandler:](execution, "runWithCompletionHandler:", v8);

  }
}

uint64_t __53__NetworkQualityAssessment_runWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalizeResults:withError:withCompletionHandler:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)cancel
{
  -[NetworkQualityExecutions cancel](self->_execution, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressResults, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_execution, 0);
}

@end
