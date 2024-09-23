@implementation TGITextGenerationInferenceDataSource

- (TGTextGenerationConfiguration)defaultConfiguration
{
  return (TGTextGenerationConfiguration *)objc_msgSend(MEMORY[0x24BEB4CA8], "defaultConfiguration");
}

- (shared_ptr<TGITextGenerationInferenceModelInterface>)createModelWithConfiguration:(id)a3
{
  _OWORD *v3;
  _OWORD *v4;
  id v5;
  void *v6;
  TGITextGenerationInferenceModelInterface *v7;
  __shared_weak_count *v8;
  void *v9[2];
  void *v10[2];
  __int128 v11;
  void *__p[2];
  uint64_t v13;
  __int128 v14;
  shared_ptr<TGITextGenerationInferenceModelInterface> result;

  v4 = v3;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "modelConfiguration");
  }
  else
  {
    v13 = 0;
    v11 = 0u;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)v9 = 0u;
    *(_OWORD *)v10 = 0u;
  }
  TGITextGenerationInferenceModel::createWithConfiguration((const std::string *)v9, &v14);
  *v4 = v14;
  v14 = 0uLL;
  if (SHIBYTE(v13) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v11) < 0)
    operator delete(v10[1]);
  if (SHIBYTE(v10[0]) < 0)
    operator delete(v9[0]);

  result.__cntrl_ = v8;
  result.__ptr_ = v7;
  return result;
}

- (id)createInferenceRunnerWithQueue:(id)a3 executionUUID:(id)a4 operation:(id)a5 session:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  TGITextGenerationInferenceRunner *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[TGITextGenerationInferenceRunner initWithQueue:executionUUID:operation:session:]([TGITextGenerationInferenceRunner alloc], "initWithQueue:executionUUID:operation:session:", v9, v10, v11, v12);

  return v13;
}

@end
