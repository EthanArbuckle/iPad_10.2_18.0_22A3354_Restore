@implementation E5RunnerObjC

+ (id)log
{
  if (+[E5RunnerObjC log]::onceToken != -1)
    dispatch_once(&+[E5RunnerObjC log]::onceToken, &__block_literal_global);
  return (id)+[E5RunnerObjC log]::log;
}

void __19__E5RunnerObjC_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.tokengenerationinference", "E5LanguageModel");
  v1 = (void *)+[E5RunnerObjC log]::log;
  +[E5RunnerObjC log]::log = (uint64_t)v0;

}

- (id)description
{
  return self->_description;
}

- (E5RunnerObjC)initWithModelConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  E5RunnerObjC *v6;
  NSObject *v7;
  cgm::token_generation_inference::ajax::FlexibleShapeAJAXE5MLModel *v8;
  AJAXE5MLModel *value;
  cgm::token_generation_inference::ajax::FlexibleShapeAJAXE5MLModel *v10;
  NSObject *v11;
  AJAXE5MLModel *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *description;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  TGIE5ANESessionObjC *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  TGIE5ANESessionObjC *aneSession;
  E5RunnerObjC *v28;
  cgm::token_generation_inference::ajax::FlexibleShapeAJAXE5MLModel *v30;
  objc_super v31;
  void **v32[5];
  uint8_t buf[16];
  __int128 v34;
  _OWORD v35[3];
  _OWORD v36[2];
  void *__p[2];
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)E5RunnerObjC;
  v6 = -[E5RunnerObjC init](&v31, sel_init);
  if (v6)
  {
    +[E5RunnerObjC log](E5RunnerObjC, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_248CAA000, v7, OS_LOG_TYPE_DEFAULT, "Initializing E5RunnerObjC with model configuration: %@", buf, 0xCu);
    }

    if (v5)
    {
      objc_msgSend(v5, "modelConfiguration");
    }
    else
    {
      v39 = 0;
      *(_OWORD *)__p = 0u;
      v38 = 0u;
      memset(v36, 0, sizeof(v36));
      v34 = 0u;
      memset(v35, 0, sizeof(v35));
      *(_OWORD *)buf = 0u;
    }
    cgm::token_generation_inference::ajax::AJAXE5MLModelLoader::createModelFromBundle((TGIE5ModelConfiguration *)buf, &v30);
    v8 = v30;
    v30 = 0;
    value = v6->ajax_e5_model.__ptr_.__value_;
    v6->ajax_e5_model.__ptr_.__value_ = (AJAXE5MLModel *)v8;
    if (value)
    {
      (*(void (**)(AJAXE5MLModel *))(*(_QWORD *)value + 88))(value);
      v10 = v30;
      v30 = 0;
      if (v10)
        (*(void (**)(cgm::token_generation_inference::ajax::FlexibleShapeAJAXE5MLModel *))(*(_QWORD *)v10 + 88))(v10);
    }
    if (SHIBYTE(v38) < 0)
      operator delete(__p[1]);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table((uint64_t)v36);
    v32[0] = (void **)&v35[1] + 1;
    std::vector<TGIE5Function>::__destroy_vector::operator()[abi:ne180100](v32);
    v32[0] = (void **)v35;
    std::vector<TGIE5AdapterConfiguration>::__destroy_vector::operator()[abi:ne180100](v32);
    if (SHIBYTE(v34) < 0)
      operator delete(*(void **)&buf[8]);
    if (objc_msgSend(v5, "modelType") == 2)
    {
      cgm::token_generation_inference::common::logging::CGMTGILogger::GENERAL((cgm::token_generation_inference::common::logging::CGMTGILogger *)2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_248CAA000, v11, OS_LOG_TYPE_INFO, "Setting GPU runner telemetry sampler to idle duration 1000ms sampler.", buf, 2u);
      }

      v12 = v6->ajax_e5_model.__ptr_.__value_;
      v13 = operator new();
      *(_QWORD *)v13 = &unk_2519DE3A8;
      *(_QWORD *)(v13 + 8) = 1000;
      *(_BYTE *)(v13 + 16) = 0;
      *(_QWORD *)(v13 + 24) = 0;
      v14 = *((_QWORD *)v12 + 4);
      *((_QWORD *)v12 + 4) = v13;
      if (v14)
        MEMORY[0x2495AA834](v14, 0x81C40B8603338);
    }
    objc_msgSend(v5, "modelBundlePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    description = v6->_description;
    v6->_description = (NSString *)v16;

    if (objc_msgSend(v5, "modelType") == 1)
    {
      objc_msgSend(v5, "adapterConfigurations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anyObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDBCF48];
      if (v19)
        objc_msgSend(v19, "mutableWeightsFilePath");
      else
        objc_msgSend(v5, "modelBundlePath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLWithString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = [TGIE5ANESessionObjC alloc];
      v24 = objc_msgSend(v5, "useEnergyEfficientMode");
      objc_msgSend(v5, "assetIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[TGIE5ANESessionObjC initWithResourceURL:useEnergyEfficientMode:assetIdentifier:](v23, "initWithResourceURL:useEnergyEfficientMode:assetIdentifier:", v22, v24, v25);
      aneSession = v6->_aneSession;
      v6->_aneSession = (TGIE5ANESessionObjC *)v26;

      -[TGIE5ANESessionObjC resume](v6->_aneSession, "resume");
    }
  }
  v28 = v6;

  return v28;
}

- (void)runTokens:(id)a3 outputBlock:(id)a4
{
  -[E5RunnerObjC runTokens:tokenTreeIndexes:outputBlock:](self, "runTokens:tokenTreeIndexes:outputBlock:", a3, 0, a4);
}

- (BOOL)supportsNonLinearRunning
{
  AJAXE5MLModel *value;

  value = self->ajax_e5_model.__ptr_.__value_;
  if (value)
  return (char)value;
}

- (BOOL)supportsModularAttention
{
  AJAXE5MLModel *value;

  value = self->ajax_e5_model.__ptr_.__value_;
  if (value)
  return (char)value;
}

- (void)runTokens:(id)a3 tokenTreeIndexes:(id)a4 outputBlock:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t *v28;
  uint64_t v29;
  AJAXE5MLModel *value;
  void (***v31)(void *, std::vector<unsigned int> *, uint64_t *);
  E5RunnerLastForwardLogits *v32;
  E5RunnerLastForwardLogits *v33;
  std::runtime_error *exception;
  id v35;
  void *v36;
  void (**v38)(id, void *, _QWORD);
  id obj;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  std::vector<unsigned int> v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *__p;
  void *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _OWORD v59[8];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v38 = (void (**)(id, void *, _QWORD))a5;
  v36 = v7;
  if (v8)
  {
    v44 = 0;
    v45 = 0;
    v43 = 0;
    v35 = v8;
    std::vector<std::vector<unsigned long>>::reserve(&v43, objc_msgSend(v35, "count"));
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v35;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v9)
    {
      v40 = *(_QWORD *)v55;
      do
      {
        v10 = 0;
        v41 = v9;
        do
        {
          if (*(_QWORD *)v55 != v40)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
          __p = 0;
          v52 = 0;
          v53 = 0;
          std::vector<std::vector<unsigned long>>::push_back[abi:ne180100](&v43, (uint64_t)&__p);
          if (__p)
          {
            v52 = __p;
            operator delete(__p);
          }
          std::vector<unsigned long>::reserve((void **)(v44 - 24), objc_msgSend(v11, "count"));
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v48 != v14)
                  objc_enumerationMutation(v12);
                v16 = v44;
                v17 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "unsignedIntegerValue");
                v18 = v17;
                v19 = *(_QWORD *)(v16 - 8);
                v20 = *(uint64_t **)(v16 - 16);
                if ((unint64_t)v20 >= v19)
                {
                  v22 = *(uint64_t **)(v16 - 24);
                  v23 = v20 - v22;
                  if ((unint64_t)(v23 + 1) >> 61)
                    std::vector<std::string>::__throw_length_error[abi:ne180100]();
                  v24 = v19 - (_QWORD)v22;
                  v25 = (uint64_t)(v19 - (_QWORD)v22) >> 2;
                  if (v25 <= v23 + 1)
                    v25 = v23 + 1;
                  if (v24 >= 0x7FFFFFFFFFFFFFF8)
                    v26 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v26 = v25;
                  if (v26)
                  {
                    v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v16 - 8, v26);
                    v22 = *(uint64_t **)(v16 - 24);
                    v20 = *(uint64_t **)(v16 - 16);
                  }
                  else
                  {
                    v27 = 0;
                  }
                  v28 = (uint64_t *)&v27[8 * v23];
                  *v28 = v18;
                  v21 = v28 + 1;
                  while (v20 != v22)
                  {
                    v29 = *--v20;
                    *--v28 = v29;
                  }
                  *(_QWORD *)(v16 - 24) = v28;
                  *(_QWORD *)(v16 - 16) = v21;
                  *(_QWORD *)(v16 - 8) = &v27[8 * v26];
                  if (v22)
                    operator delete(v22);
                }
                else
                {
                  *v20 = v17;
                  v21 = v20 + 1;
                }
                *(_QWORD *)(v16 - 16) = v21;
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
            }
            while (v13);
          }

          ++v10;
        }
        while (v10 != v41);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v9);
    }

    value = self->ajax_e5_model.__ptr_.__value_;
    if (value
    {
      (**v31)(v31, &v46, &v43);
    }
    else
    {
      if (!cgm::token_generation_inference::ajax::utils::tokenTreeIndexesAreLinear(&v43))
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Model does not support non-linear positions.");
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      (**(void (***)(AJAXE5MLModel *, std::vector<unsigned int> *))self->ajax_e5_model.__ptr_.__value_)(self->ajax_e5_model.__ptr_.__value_, &v46);
    }
    *(_QWORD *)&v59[0] = &v43;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)v59);
  }
  else
  {
    (**(void (***)(AJAXE5MLModel *, std::vector<unsigned int> *))self->ajax_e5_model.__ptr_.__value_)(self->ajax_e5_model.__ptr_.__value_, &v46);
  }
  if (v46.__begin_)
  {
    v46.__end_ = v46.__begin_;
    operator delete(v46.__begin_);
  }
  (*(void (**)(_OWORD *__return_ptr))(*(_QWORD *)self->ajax_e5_model.__ptr_.__value_ + 40))(v59);
  v32 = [E5RunnerLastForwardLogits alloc];
  v42[0] = v59[0];
  v42[1] = v59[1];
  v42[2] = v59[2];
  v33 = -[E5RunnerLastForwardLogits initWithLogits:](v32, "initWithLogits:", v42);
  v38[2](v38, v33, 0);

}

- (void)reset
{
  (*(void (**)(AJAXE5MLModel *, _QWORD))(*(_QWORD *)self->ajax_e5_model.__ptr_.__value_ + 8))(self->ajax_e5_model.__ptr_.__value_, 0);
}

- (void)resetToStep:(int64_t)a3
{
  (*(void (**)(AJAXE5MLModel *, int64_t))(*(_QWORD *)self->ajax_e5_model.__ptr_.__value_ + 8))(self->ajax_e5_model.__ptr_.__value_, a3);
}

- (void)clearAllState
{
  (*(void (**)(AJAXE5MLModel *))(*(_QWORD *)self->ajax_e5_model.__ptr_.__value_ + 16))(self->ajax_e5_model.__ptr_.__value_);
}

- (void)purgeSteps:(id)a3
{
  id v4;
  AJAXE5MLModel *value;
  void *v6;
  void *v7;
  std::runtime_error *exception;
  std::vector<unsigned int> __p;

  v4 = a3;
  value = self->ajax_e5_model.__ptr_.__value_;
  if (!value
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Model does not support non-linear positions.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v7 = v6;
  (*(void (**)(void *, std::vector<unsigned int> *))(*(_QWORD *)v7 + 8))(v7, &__p);
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }

}

- (void)purgeUnusedKeyValueCache:(id)a3 trgIdxs:(id)a4
{
  id v6;
  AJAXE5MLModel *value;
  std::vector<unsigned int> __p;
  std::vector<unsigned int> v9;

  v6 = a4;
  value = self->ajax_e5_model.__ptr_.__value_;
  (*(void (**)(AJAXE5MLModel *, std::vector<unsigned int> *, std::vector<unsigned int> *))(*(_QWORD *)value + 48))(value, &v9, &__p);
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  if (v9.__begin_)
  {
    v9.__end_ = v9.__begin_;
    operator delete(v9.__begin_);
  }

}

- (unint64_t)getNumTokensProcessed
{
  return (*(uint64_t (**)(AJAXE5MLModel *))(*(_QWORD *)self->ajax_e5_model.__ptr_.__value_ + 56))(self->ajax_e5_model.__ptr_.__value_);
}

- (unint64_t)maxContextLength
{
  return (*(uint64_t (**)(AJAXE5MLModel *))(*(_QWORD *)self->ajax_e5_model.__ptr_.__value_ + 24))(self->ajax_e5_model.__ptr_.__value_);
}

- (unint64_t)vocabularyCount
{
  return (*(uint64_t (**)(AJAXE5MLModel *))(*(_QWORD *)self->ajax_e5_model.__ptr_.__value_ + 32))(self->ajax_e5_model.__ptr_.__value_);
}

- (id)createKVCacheEntry:(_NSRange)a3 error:(id *)a4
{
  AJAXE5MLModel *value;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  uint64_t *v10;
  NSObject *log;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  value = self->ajax_e5_model.__ptr_.__value_;
  if (value
    && (length = a3.length,
        location = a3.location,
  {
    v23[0] = location;
    v23[1] = length;
    (*(void (**)(_QWORD *__return_ptr, void *, _QWORD *))(*(_QWORD *)v9 + 16))(v24, v9, v23);
    a4 = -[TGIE5KVCacheEntryObjC initWithKVCacheEntry:]([TGIE5KVCacheEntryObjC alloc], "initWithKVCacheEntry:", v24);
    v10 = (uint64_t *)v24[0];
    v24[0] = 0;
    if (v10)
      std::default_delete<TGIE5KVCacheEntry>::operator()[abi:ne180100]((uint64_t)v24, v10);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[E5RunnerObjC createKVCacheEntry:error:].cold.1(log, v12, v13, v14, v15, v16, v17, v18);
    if (a4)
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create KV cache entry, model does not support modular attention"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.TokenGenerationInference.E5Runner"), 0, v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  return a4;
}

- (BOOL)setKVCacheEntry:(id)a3 startIndex:(int64_t)a4 error:(id *)a5
{
  id v8;
  AJAXE5MLModel *value;
  void *v10;
  NSObject *log;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  value = self->ajax_e5_model.__ptr_.__value_;
  if (value
  {
    (*(void (**)(void *, int64_t, uint64_t))(*(_QWORD *)v10 + 8))(v10, a4, objc_msgSend(v8, "kvCacheEntry"));
    LOBYTE(a5) = 1;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[E5RunnerObjC setKVCacheEntry:startIndex:error:].cold.1(log, v12, v13, v14, v15, v16, v17, v18);
    if (a5)
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to set KV cache entry, model does not support modular attention"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.TokenGenerationInference.E5Runner"), 0, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

+ (BOOL)compileModelAtPath:(id)a3 modelType:(int64_t)a4 error:(id *)a5
{
  id v7;
  TGIMutableE5ModelConfigurationObjC *v8;
  void *v9;
  void *v10;
  TGIMutableE5ModelConfigurationObjC *v11;

  v7 = a3;
  v8 = [TGIMutableE5ModelConfigurationObjC alloc];
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = -[TGIE5ModelConfigurationObjC initWithModelType:modelBundlePath:e5Functions:adapterConfigurations:](v8, "initWithModelType:modelBundlePath:e5Functions:adapterConfigurations:", a4, v7, v9, v10);

  -[TGIE5ModelConfigurationObjC setUseModelCatalogE5CompilerCache:](v11, "setUseModelCatalogE5CompilerCache:", 1);
  LOBYTE(a5) = +[E5RunnerObjC compileModelWithConfiguration:error:](E5RunnerObjC, "compileModelWithConfiguration:error:", v11, a5);

  return (char)a5;
}

+ (BOOL)compileModelWithConfiguration:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  E5RT::E5CompilerOptions *v8;
  char *v10;
  uint64_t v11;
  E5RT::E5CompilerOptions *v12;
  std::string buf;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[E5RunnerObjC log](E5RunnerObjC, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
    _os_log_impl(&dword_248CAA000, v5, OS_LOG_TYPE_DEFAULT, "Compiling model with configuration: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v4, "modelBundlePath");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (char *)objc_msgSend(v6, "UTF8String");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&buf, &v10);
  cgm::token_generation_inference::ajax::utils::makeProgramLibrary((const std::__fs::filesystem::path *)&buf, (const E5RT::E5CompilerOptions *)objc_msgSend(v4, "useModelCatalogE5CompilerCache"), &v11);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);

  v7 = v11;
  v11 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = v12;
  v12 = 0;
  if (v8)
    (*(void (**)(E5RT::E5CompilerOptions *))(*(_QWORD *)v8 + 8))(v8);

  return 1;
}

+ (BOOL)doesModelRequireCompilationAtPath:(id)a3 modelType:(int64_t)a4
{
  id v5;
  TGIMutableE5ModelConfigurationObjC *v6;
  void *v7;
  void *v8;
  TGIMutableE5ModelConfigurationObjC *v9;

  v5 = a3;
  v6 = [TGIMutableE5ModelConfigurationObjC alloc];
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = -[TGIE5ModelConfigurationObjC initWithModelType:modelBundlePath:e5Functions:adapterConfigurations:](v6, "initWithModelType:modelBundlePath:e5Functions:adapterConfigurations:", a4, v5, v7, v8);

  -[TGIE5ModelConfigurationObjC setUseModelCatalogE5CompilerCache:](v9, "setUseModelCatalogE5CompilerCache:", 1);
  LOBYTE(v7) = +[E5RunnerObjC doesModelRequireCompilationWithConfiguration:](E5RunnerObjC, "doesModelRequireCompilationWithConfiguration:", v9);

  return (char)v7;
}

+ (BOOL)doesModelRequireCompilationWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  char v10;
  const std::__fs::filesystem::path *v11;
  char *v13;
  const std::__fs::filesystem::path *v14;
  std::string buf;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "modelBundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[E5RunnerObjC log](E5RunnerObjC, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v3;
    _os_log_impl(&dword_248CAA000, v5, OS_LOG_TYPE_DEFAULT, "Checking if model with configuration: %@ requires compilation", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v3, "modelBundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("bundle"));

  if (v8)
  {
    +[E5RunnerObjC log](E5RunnerObjC, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[E5RunnerObjC doesModelRequireCompilationWithConfiguration:].cold.1();

    v10 = 0;
  }
  else
  {
    v13 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&buf, &v13);
    v10 = cgm::token_generation_inference::ajax::utils::modelRequiresCompilation((cgm::token_generation_inference::ajax::utils *)&buf, v14, (const E5RT::E5CompilerOptions *)objc_msgSend(v3, "useModelCatalogE5CompilerCache"));
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    v11 = v14;
    v14 = 0;
    if (v11)
      (*(void (**)(const std::__fs::filesystem::path *))(v11->__pn_.__r_.__value_.__r.__words[0] + 8))(v11);
  }

  return v10;
}

- (void)moveToDynamicState
{
  TGIE5ANESessionObjC *aneSession;

  aneSession = self->_aneSession;
  if (aneSession)
    -[TGIE5ANESessionObjC stop](aneSession, "stop");
  (*(void (**)(AJAXE5MLModel *))(*(_QWORD *)self->ajax_e5_model.__ptr_.__value_ + 64))(self->ajax_e5_model.__ptr_.__value_);
}

- (void)moveToFullyLoadedState
{
  TGIE5ANESessionObjC *aneSession;

  aneSession = self->_aneSession;
  if (aneSession)
    -[TGIE5ANESessionObjC resume](aneSession, "resume");
  (*(void (**)(AJAXE5MLModel *))(*(_QWORD *)self->ajax_e5_model.__ptr_.__value_ + 72))(self->ajax_e5_model.__ptr_.__value_);
}

- (void)enableTelemetryWithIdentifier:(id)a3
{
  id v4;
  AJAXE5MLModel *value;
  id v6;
  std::string __str;

  v4 = a3;
  value = self->ajax_e5_model.__ptr_.__value_;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v6, "UTF8String"));
  std::string::operator=((std::string *)((char *)value + 8), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);

}

- (void).cxx_destruct
{
  AJAXE5MLModel *value;

  objc_storeStrong((id *)&self->_aneSession, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_log, 0);
  value = self->ajax_e5_model.__ptr_.__value_;
  self->ajax_e5_model.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(AJAXE5MLModel *))(*(_QWORD *)value + 88))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)initWithModelConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_1(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_248CAA000, a2, v3, "Failed to load model: %s.", v4);
  OUTLINED_FUNCTION_2();
}

- (void)runTokens:(uint64_t)a1 tokenTreeIndexes:(void *)a2 outputBlock:.cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_248CAA000, v2, v3, "Failed to run inference: %s.", v4);

  OUTLINED_FUNCTION_4();
}

- (void)createKVCacheEntry:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_248CAA000, a1, a3, "Failed to create KV cache entry, model does not support modular attention", a5, a6, a7, a8, 0);
}

- (void)createKVCacheEntry:(uint64_t)a1 error:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_248CAA000, v2, v3, "Failed to run inference: %s.", v4);

  OUTLINED_FUNCTION_4();
}

- (void)setKVCacheEntry:(uint64_t)a3 startIndex:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_248CAA000, a1, a3, "Failed to set KV cache entry, model does not support modular attention", a5, a6, a7, a8, 0);
}

+ (void)compileModelWithConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_1(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_248CAA000, a2, v3, "Failed to compile model: %s.", v4);
  OUTLINED_FUNCTION_2();
}

+ (void)doesModelRequireCompilationWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_248CAA000, v0, v1, "Model path has .bundle extension, assuming its already compiled: %@", v2);
}

+ (void)doesModelRequireCompilationWithConfiguration:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 16))(a2);
  v6 = 138412546;
  v7 = a1;
  v8 = 2080;
  v9 = v5;
  _os_log_error_impl(&dword_248CAA000, a3, OS_LOG_TYPE_ERROR, "Failed to check if model: %@ requires compilation: %s, defaulting to require compilation", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
