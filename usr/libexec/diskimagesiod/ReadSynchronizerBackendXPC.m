@implementation ReadSynchronizerBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ReadSynchronizerBackendXPC)initWithBackend:(id)a3
{
  id v5;
  ReadSynchronizerBackendXPC *v6;
  ReadSynchronizerBackendXPC *v7;
  id *p_baseBackendXPC;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ReadSynchronizerBackendXPC;
  v6 = -[ReadSynchronizerBackendXPC init](&v27, "init");
  v7 = v6;
  if (v6)
  {
    p_baseBackendXPC = (id *)&v6->_baseBackendXPC;
    objc_storeStrong((id *)&v6->_baseBackendXPC, a3);
    if (*p_baseBackendXPC)
    {
      objc_msgSend(*p_baseBackendXPC, "backend");
    }
    else
    {
      v25 = 0;
      v26 = 0;
    }
    sub_1000BE620(&v23);
    v21 = v23;
    v22 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    -[BackendXPC setBackend:](v7, "setBackend:", &v21);
    v11 = v22;
    if (v22)
    {
      v12 = (unint64_t *)&v22->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = v24;
    if (v24)
    {
      v15 = (unint64_t *)&v24->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = v26;
    if (v26)
    {
      v18 = (unint64_t *)&v26->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }

  return v7;
}

- (ReadSynchronizerBackendXPC)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  ReadSynchronizerBackendXPC *v6;
  id v7;
  uint64_t v8;
  BackendXPC *baseBackendXPC;
  BackendXPC *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ReadSynchronizerBackendXPC;
  v6 = -[BackendXPC initWithCoder:](&v23, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BackendXPC, v5), CFSTR("baseBackend"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    baseBackendXPC = v6->_baseBackendXPC;
    v6->_baseBackendXPC = (BackendXPC *)v8;

    v10 = v6->_baseBackendXPC;
    if (v10)
      -[BackendXPC backend](v10, "backend");
    else
      v20 = 0;
    sub_1000BE718(&v21);
    v22 = v21;
    v21 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v22);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v22 + 1);
    if (*((_QWORD *)&v22 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
    if (*((_QWORD *)&v21 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ReadSynchronizerBackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReadSynchronizerBackendXPC baseBackendXPC](self, "baseBackendXPC"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("baseBackend"));

}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseBackendXPC, 0);
}

@end
