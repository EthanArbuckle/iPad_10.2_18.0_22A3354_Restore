@implementation TGITextGenerationInferenceRunnerManager

- (TGITextGenerationInferenceRunnerManager)initWithWorkQueue:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  TGITextGenerationInferenceDataSource *v7;
  TGITextGenerationInferenceRunnerManager *v8;

  v4 = a3;
  v5 = dispatch_queue_create("com.apple.text-generation-inference", 0);
  dispatch_get_global_queue(33, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v5, v6);

  v7 = objc_alloc_init(TGITextGenerationInferenceDataSource);
  v8 = -[TGITextGenerationInferenceRunnerManager initWithWorkQueue:inferenceQueue:dataSource:](self, "initWithWorkQueue:inferenceQueue:dataSource:", v4, v5, v7);

  return v8;
}

- (TGITextGenerationInferenceRunnerManager)initWithWorkQueue:(id)a3 inferenceQueue:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  TGITextGenerationInferenceRunnerManager *v12;
  TGITextGenerationInferenceRunnerManager *v13;
  uint64_t v14;
  NSMutableDictionary *inferenceRunnerByExecutionUUID;
  uint64_t v16;
  NSDictionary *scheduledInferenceRunnerByExecutionUUID;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TGITextGenerationInferenceRunnerManager;
  v12 = -[TGITextGenerationInferenceRunnerManager init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a5);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    inferenceRunnerByExecutionUUID = v13->_inferenceRunnerByExecutionUUID;
    v13->_inferenceRunnerByExecutionUUID = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    scheduledInferenceRunnerByExecutionUUID = v13->_scheduledInferenceRunnerByExecutionUUID;
    v13->_scheduledInferenceRunnerByExecutionUUID = (NSDictionary *)v16;

    objc_storeStrong((id *)&v13->_inferenceQueue, a4);
    objc_storeStrong((id *)&v13->_workQueue, a3);
  }

  return v13;
}

- (void)start
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_247FAC000, log, OS_LOG_TYPE_ERROR, "Cannot start inference runner manager, default configuration is nil", v1, 2u);
}

void __48__TGITextGenerationInferenceRunnerManager_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "createModelWithConfiguration:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  objc_msgSend(v2, "setModel:", &v8);
  v5 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

}

- (void)enqueueOperation:(id)a3 executionUUID:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  -[TGITextGenerationInferenceRunnerManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[TGITextGenerationInferenceRunnerManager dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGITextGenerationInferenceRunnerManager inferenceQueue](self, "inferenceQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createInferenceRunnerWithQueue:executionUUID:operation:session:", v12, v8, v17, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TGITextGenerationInferenceRunnerManager inferenceRunnerByExecutionUUID](self, "inferenceRunnerByExecutionUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  -[TGITextGenerationInferenceRunnerManager inferenceRunnerByExecutionUUID](self, "inferenceRunnerByExecutionUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, v8);

  if (!v15)
    -[TGITextGenerationInferenceRunnerManager runInferenceRunners](self, "runInferenceRunners");

}

- (void)runInferenceRunners
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  TGITextGenerationInferenceRunnerManager *v16;

  -[TGITextGenerationInferenceRunnerManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TGITextGenerationInferenceRunnerManager inferenceRunnerByExecutionUUID](self, "inferenceRunnerByExecutionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[TGITextGenerationInferenceRunnerManager inferenceRunnerByExecutionUUID](self, "inferenceRunnerByExecutionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    -[TGITextGenerationInferenceRunnerManager inferenceRunnerByExecutionUUID](self, "inferenceRunnerByExecutionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[TGITextGenerationInferenceRunnerManager setScheduledInferenceRunnerByExecutionUUID:](self, "setScheduledInferenceRunnerByExecutionUUID:", v10);

    -[TGITextGenerationInferenceRunnerManager inferenceRunnerByExecutionUUID](self, "inferenceRunnerByExecutionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    -[TGITextGenerationInferenceRunnerManager inferenceQueue](self, "inferenceQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __62__TGITextGenerationInferenceRunnerManager_runInferenceRunners__block_invoke;
    v14[3] = &unk_25197AF10;
    v15 = v8;
    v16 = self;
    v13 = v8;
    dispatch_async(v12, v14);

  }
  else
  {
    -[TGITextGenerationInferenceRunnerManager setScheduledInferenceRunnerByExecutionUUID:](self, "setScheduledInferenceRunnerByExecutionUUID:", MEMORY[0x24BDBD1B8]);
  }
}

void __62__TGITextGenerationInferenceRunnerManager_runInferenceRunners__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  uint64_t v13;
  std::__shared_weak_count *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v16;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v5);
        v7 = *(void **)(a1 + 40);
        if (v7)
        {
          objc_msgSend(v7, "model");
        }
        else
        {
          v13 = 0;
          v14 = 0;
        }
        objc_msgSend(v6, "setModel:", &v13);
        v8 = v14;
        if (v14)
        {
          p_shared_owners = (unint64_t *)&v14->__shared_owners_;
          do
            v10 = __ldaxr(p_shared_owners);
          while (__stlxr(v10 - 1, p_shared_owners));
          if (!v10)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
        objc_msgSend(v6, "run");
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 40), "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__TGITextGenerationInferenceRunnerManager_runInferenceRunners__block_invoke_2;
  block[3] = &unk_25197AEE8;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v11, block);

}

uint64_t __62__TGITextGenerationInferenceRunnerManager_runInferenceRunners__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runInferenceRunners");
}

- (void)cancelOperationWithExecutionUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  -[TGITextGenerationInferenceRunnerManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TGITextGenerationInferenceRunnerManager inferenceRunnerByExecutionUUID](self, "inferenceRunnerByExecutionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TGITextGenerationInferenceRunnerManager inferenceRunnerByExecutionUUID](self, "inferenceRunnerByExecutionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v4);

LABEL_4:
    objc_msgSend(v7, "cancel");
    goto LABEL_5;
  }
  -[TGITextGenerationInferenceRunnerManager scheduledInferenceRunnerByExecutionUUID](self, "scheduledInferenceRunnerByExecutionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  _nlpDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[TGITextGenerationInferenceRunnerManager cancelOperationWithExecutionUUID:].cold.1((uint64_t)v4, v10);

  v7 = 0;
LABEL_5:

}

- (NSMutableDictionary)inferenceRunnerByExecutionUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)scheduledInferenceRunnerByExecutionUUID
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScheduledInferenceRunnerByExecutionUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)inferenceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (shared_ptr<TGITextGenerationInferenceModelInterface>)model
{
  void *v2;
  TGITextGenerationInferenceModelInterface *v3;
  __shared_weak_count *v4;
  shared_ptr<TGITextGenerationInferenceModelInterface> result;

  objc_copyCppObjectAtomic(v2, &self->_model, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__0);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setModel:(shared_ptr<TGITextGenerationInferenceModelInterface>)a3
{
  objc_copyCppObjectAtomic(&self->_model, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__0);
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (TGITextGenerationInferenceDataSource)dataSource
{
  return (TGITextGenerationInferenceDataSource *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  std::shared_ptr<TGITextGenerationInferenceDecodingPolicy>::~shared_ptr[abi:ne180100]((uint64_t)&self->_model);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inferenceQueue, 0);
  objc_storeStrong((id *)&self->_scheduledInferenceRunnerByExecutionUUID, 0);
  objc_storeStrong((id *)&self->_inferenceRunnerByExecutionUUID, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (void)cancelOperationWithExecutionUUID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_247FAC000, a2, OS_LOG_TYPE_ERROR, "Cannot cancel, operation with uuid not found: %@", (uint8_t *)&v2, 0xCu);
}

@end
