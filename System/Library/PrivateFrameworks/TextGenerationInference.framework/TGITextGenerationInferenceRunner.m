@implementation TGITextGenerationInferenceRunner

- (TGITextGenerationInferenceRunner)initWithQueue:(id)a3 executionUUID:(id)a4 operation:(id)a5 session:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TGITextGenerationInferenceRunner *v15;
  uint64_t v16;
  TGTextGenerationOperation *operation;
  uint64_t v18;
  NSUUID *executionUUID;
  TGITextGenerationInferenceDecodingPolicy *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  __int128 v25;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)TGITextGenerationInferenceRunner;
  v15 = -[TGITextGenerationInferenceRunner init](&v26, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v13, "copy");
    operation = v15->_operation;
    v15->_operation = (TGTextGenerationOperation *)v16;

    objc_storeStrong((id *)&v15->_session, a6);
    objc_storeStrong((id *)&v15->_workQueue, a3);
    *(_WORD *)&v15->_canceled = 256;
    v18 = objc_msgSend(v12, "copy");
    executionUUID = v15->_executionUUID;
    v15->_executionUUID = (NSUUID *)v18;

    TGITextGenerationInferenceDecodingPolicy::create(v20, &v25);
    std::shared_ptr<TGITextGenerationInferenceDecodingPolicy>::operator=[abi:ne180100]((uint64_t)&v15->_decodingPolicy, &v25);
    v21 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
    if (*((_QWORD *)&v25 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }

  return v15;
}

- (void)run
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_247FAC000, a2, a3, "Failed to run operation: %@, model configuration doesn't match session configuration", (uint8_t *)a2);

}

- (TGITextGenerationInferenceWordFragment)runIncrementalInferenceWithTokenIDs:(TGITextGenerationInferenceWordFragment *__return_ptr)retstr
{
  void *v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  NSObject *v6;
  void *v7;
  void *v8;
  __n128 v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  char *v20;
  float v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  TGITextGenerationInferenceWordFragment *result;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::string *p_var1;
  void *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  void *__p[2];
  uint64_t v48;
  char *v49;
  std::__shared_weak_count *v50;
  __int128 v51;
  std::string::size_type v52;
  uint64_t v53;
  unsigned int *v54;

  v3 = v2;
  v4 = v1;
  objc_msgSend(v1, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!v3[1])
    -[TGITextGenerationInferenceRunner runIncrementalInferenceWithTokenIDs:].cold.1();
  if (objc_msgSend(v4, "shouldDoCacheLookUp"))
  {
    objc_msgSend(v4, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "stateCache");
      v7 = __p[0];
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
    }
    v9.n128_f64[0] = TGITextGenerationInferenceSessionStateCache::cacheEntryForTokenIDs((const void ****)v7, (uint64_t)v3, (uint64_t)&v51);
    if (__p[1])
    {
      v10 = (unint64_t *)((char *)__p[1] + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        (*(void (**)(void *, __n128))(*(_QWORD *)__p[1] + 16))(__p[1], v9);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p[1]);
      }
    }

    if (v53)
    {
      v12 = *v54;
      objc_msgSend(v4, "model");
      (*(void (**)(void **__return_ptr, char *, uint64_t))(*(_QWORD *)v49 + 64))(__p, v49, v12);
      v13 = v50;
      if (v50)
      {
        p_shared_owners = (unint64_t *)&v50->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      retstr->var0 = v12;
      if (SHIBYTE(v48) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&retstr->var1, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      }
      else
      {
        *(_OWORD *)retstr->var1.var0.var0.var0.var0.var0 = *(_OWORD *)__p;
        *((_QWORD *)&retstr->var1.var0.var0.var0.var1 + 2) = v48;
      }
      objc_msgSend(v4, "model");
      result = (TGITextGenerationInferenceWordFragment *)(*(uint64_t (**)(char *, _QWORD, __int128 *))(*(_QWORD *)v49 + 16))(v49, v3[1], &v51);
      v42 = v50;
      if (v50)
      {
        v43 = (unint64_t *)&v50->__shared_owners_;
        do
          v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        if (!v44)
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
      }
      if (SHIBYTE(v48) < 0)
      {
        v41 = __p[0];
        goto LABEL_65;
      }
      return result;
    }
    objc_msgSend(v4, "setShouldDoCacheLookUp:", 0);
  }
  v16 = *(unsigned int *)(*v3 + 4 * v3[1] - 4);
  objc_msgSend(v4, "model");
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)v51 + 48))(v51, v16);
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
  if (*((_QWORD *)&v51 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  objc_msgSend(v4, "decodingPolicy");
  v20 = v49;
  objc_msgSend(v4, "model");
  (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)v45 + 32))(&v51);
  TGITextGenerationInferenceDecodingPolicy::stateWithLogits(v20, (char *)v51, *((unint64_t *)&v51 + 1), (uint64_t *)__p, v21);
  if (v46)
  {
    v22 = (unint64_t *)&v46->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)())v46->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  v24 = v50;
  if (v50)
  {
    v25 = (unint64_t *)&v50->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  objc_msgSend(v4, "session");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "stateCache");
    v29 = (uint64_t)v49;
  }
  else
  {
    v29 = 0;
    v49 = 0;
    v50 = 0;
  }
  objc_msgSend(v4, "model");
  (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)v45 + 24))(&v51);
  TGITextGenerationInferenceSessionStateCache::addCacheEntryForStepState(v29, (uint64_t)&v51, (uint64_t)__p);
  if (v46)
  {
    v30 = (unint64_t *)&v46->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)())v46->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  v32 = v50;
  if (v50)
  {
    v33 = (unint64_t *)&v50->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

  v35 = *(unsigned int *)__p[0];
  objc_msgSend(v4, "model");
  result = (TGITextGenerationInferenceWordFragment *)(*(_QWORD *(**)(__int128 *__return_ptr, char *, uint64_t))(*(_QWORD *)v49 + 64))(&v51, v49, v35);
  v37 = v50;
  if (v50)
  {
    v38 = (unint64_t *)&v50->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  retstr->var0 = v35;
  p_var1 = (std::string *)&retstr->var1;
  if ((SHIBYTE(v52) & 0x80000000) == 0)
  {
    *(_OWORD *)&p_var1->__r_.__value_.__l.__data_ = v51;
    p_var1->__r_.__value_.__r.__words[2] = v52;
    return result;
  }
  std::string::__init_copy_ctor_external(p_var1, (const std::string::value_type *)v51, *((std::string::size_type *)&v51 + 1));
  if (SHIBYTE(v52) < 0)
  {
    v41 = (void *)v51;
LABEL_65:
    operator delete(v41);
  }
  return result;
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  -[TGITextGenerationInferenceRunner workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  -[TGITextGenerationInferenceRunner setCanceled:](self, "setCanceled:", 1);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 89, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TGITextGenerationInferenceRunner session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGITextGenerationInferenceRunner executionUUID](self, "executionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operationWithExecutionUUID:didFailWithError:", v5, v7);

}

- (shared_ptr<TGITextGenerationInferenceModelInterface>)model
{
  void *v2;
  TGITextGenerationInferenceModelInterface *v3;
  __shared_weak_count *v4;
  shared_ptr<TGITextGenerationInferenceModelInterface> result;

  objc_copyCppObjectAtomic(v2, &self->_model, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setModel:(shared_ptr<TGITextGenerationInferenceModelInterface>)a3
{
  objc_copyCppObjectAtomic(&self->_model, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (TGTextGenerationOperation)operation
{
  return (TGTextGenerationOperation *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)executionUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (TGITextGenerationInferenceSession)session
{
  return (TGITextGenerationInferenceSession *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)shouldDoCacheLookUp
{
  return self->_shouldDoCacheLookUp;
}

- (void)setShouldDoCacheLookUp:(BOOL)a3
{
  self->_shouldDoCacheLookUp = a3;
}

- (shared_ptr<TGITextGenerationInferenceDecodingPolicy>)decodingPolicy
{
  void *v2;
  TGITextGenerationInferenceDecodingPolicy *v3;
  __shared_weak_count *v4;
  shared_ptr<TGITextGenerationInferenceDecodingPolicy> result;

  objc_copyCppObjectAtomic(v2, &self->_decodingPolicy, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__10);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<TGITextGenerationInferenceDecodingPolicy>::~shared_ptr[abi:ne180100]((uint64_t)&self->_decodingPolicy);
  std::shared_ptr<TGITextGenerationInferenceDecodingPolicy>::~shared_ptr[abi:ne180100]((uint64_t)&self->_model);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_executionUUID, 0);
  objc_storeStrong((id *)&self->_operation, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

- (void)runIncrementalInferenceWithTokenIDs:.cold.1()
{
  __assert_rtn("-[TGITextGenerationInferenceRunner runIncrementalInferenceWithTokenIDs:]", "TGITextGenerationInferenceRunner.mm", 215, "tokenIDs.Size() > 0");
}

@end
