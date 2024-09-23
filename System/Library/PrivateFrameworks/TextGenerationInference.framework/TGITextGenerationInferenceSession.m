@implementation TGITextGenerationInferenceSession

- (TGITextGenerationInferenceSession)initWithUUID:(id)a3 configuration:(id)a4 inferenceRunnerManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  TGITextGenerationInferenceSession *v11;
  uint64_t v12;
  NSUUID *uuid;
  uint64_t v14;
  TGTextGenerationConfiguration *configuration;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  __int128 v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TGITextGenerationInferenceSession;
  v11 = -[TGITextGenerationInferenceSession init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    configuration = v11->_configuration;
    v11->_configuration = (TGTextGenerationConfiguration *)v14;

    TGITextGenerationInferenceSessionStateCache::create((TGITextGenerationInferenceSessionStateCache *)0x400, &v20);
    std::shared_ptr<TGITextGenerationInferenceDecodingPolicy>::operator=[abi:ne180100]((uint64_t)&v11->_stateCache, &v20);
    v16 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v17 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    objc_storeStrong((id *)&v11->_inferenceRunnerManager, a5);
  }

  return v11;
}

- (id)enqueueOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGITextGenerationInferenceSession inferenceRunnerManager](self, "inferenceRunnerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueueOperation:executionUUID:session:", v4, v5, self);

  return v5;
}

- (void)cancelOperationWithExecutionUUID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TGITextGenerationInferenceSession inferenceRunnerManager](self, "inferenceRunnerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelOperationWithExecutionUUID:", v5);

}

- (TGTextGenerationOperationDelegate)delegate
{
  return (TGTextGenerationOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (TGTextGenerationConfiguration)configuration
{
  return (TGTextGenerationConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (TGITextGenerationInferenceRunnerManager)inferenceRunnerManager
{
  return (TGITextGenerationInferenceRunnerManager *)objc_getProperty(self, a2, 32, 1);
}

- (shared_ptr<TGITextGenerationInferenceSessionStateCache>)stateCache
{
  void *v2;
  TGITextGenerationInferenceSessionStateCache *v3;
  __shared_weak_count *v4;
  shared_ptr<TGITextGenerationInferenceSessionStateCache> result;

  objc_copyCppObjectAtomic(v2, &self->_stateCache, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__1);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<TGITextGenerationInferenceDecodingPolicy>::~shared_ptr[abi:ne180100]((uint64_t)&self->_stateCache);
  objc_storeStrong((id *)&self->_inferenceRunnerManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
