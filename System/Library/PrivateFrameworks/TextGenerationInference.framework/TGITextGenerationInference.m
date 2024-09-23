@implementation TGITextGenerationInference

- (TGITextGenerationInference)initWithWorkQueue:(id)a3
{
  id v5;
  TGITextGenerationInference *v6;
  TGITextGenerationInference *v7;
  TGITextGenerationInferenceRunnerManager *v8;
  TGITextGenerationInferenceRunnerManager *inferenceRunnerManager;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TGITextGenerationInference;
  v6 = -[TGITextGenerationInference init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    v8 = -[TGITextGenerationInferenceRunnerManager initWithWorkQueue:]([TGITextGenerationInferenceRunnerManager alloc], "initWithWorkQueue:", v5);
    inferenceRunnerManager = v7->_inferenceRunnerManager;
    v7->_inferenceRunnerManager = v8;

  }
  return v7;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[TGITextGenerationInference workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__TGITextGenerationInference_start__block_invoke;
  block[3] = &unk_25197AEE8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __35__TGITextGenerationInference_start__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "inferenceRunnerManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "start");

}

- (id)createSessionWithUUID:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  TGITextGenerationInferenceSession *v8;
  void *v9;
  TGITextGenerationInferenceSession *v10;

  v6 = a3;
  v7 = a4;
  v8 = [TGITextGenerationInferenceSession alloc];
  -[TGITextGenerationInference inferenceRunnerManager](self, "inferenceRunnerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TGITextGenerationInferenceSession initWithUUID:configuration:inferenceRunnerManager:](v8, "initWithUUID:configuration:inferenceRunnerManager:", v6, v7, v9);

  return v10;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (TGITextGenerationInferenceRunnerManager)inferenceRunnerManager
{
  return (TGITextGenerationInferenceRunnerManager *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferenceRunnerManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
