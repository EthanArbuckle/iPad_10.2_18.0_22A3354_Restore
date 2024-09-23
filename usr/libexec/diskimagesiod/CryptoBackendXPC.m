@implementation CryptoBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CryptoBackendXPC)initWithFormat:(const void *)a3 baseBackendXPC:(id)a4
{
  id v7;
  CryptoBackendXPC *v8;
  CryptoBackendXPC *v9;
  id *p_baseBackendXPC;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v21;
  std::__shared_weak_count *v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;

  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CryptoBackendXPC;
  v8 = -[CryptoBackendXPC init](&v25, "init");
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a4);
    if (*p_baseBackendXPC)
    {
      objc_msgSend(*p_baseBackendXPC, "backend");
    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    sub_1000BE4A0((uint64_t)&v21, (uint64_t)a3, &v23);
    v24 = v23;
    v23 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v24);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
    if (*((_QWORD *)&v23 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }

  return v9;
}

- (CryptoBackendXPC)initWithCoder:(id)a3
{
  id v4;
  CryptoBackendXPC *v5;
  CryptoBackendXPC *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  BackendXPC *baseBackendXPC;
  BackendXPC *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD *exception;
  const std::error_category *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CryptoBackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v33, "initWithCoder:", v4);
  v6 = v5;
  if (v5)
  {
    sub_1000B982C(v4, (uint64_t *)-[BackendXPC cryptoHeader](v5, "cryptoHeader"), &v31);
    if (!v31)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      *exception = &off_1001924F8;
      v26 = std::generic_category();
      exception[1] = 154;
      exception[2] = v26;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = "Failed to deserialize crypto format";
    }
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BackendXPC, v7), CFSTR("baseBackend"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    baseBackendXPC = v6->_baseBackendXPC;
    v6->_baseBackendXPC = (BackendXPC *)v9;

    v11 = v6->_baseBackendXPC;
    if (v11)
    {
      -[BackendXPC backend](v11, "backend");
    }
    else
    {
      v27 = 0;
      v28 = 0;
    }
    sub_1000BE560((uint64_t)&v27, (uint64_t)&v31, &v29);
    v30 = v29;
    v29 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v30);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = v28;
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = v32;
    if (v32)
    {
      v22 = (unint64_t *)&v32->__shared_owners_;
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

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CryptoBackendXPC;
  -[BackendXPC encodeWithCoder:](&v17, "encodeWithCoder:", v4);
  -[BackendXPC backend](self, "backend");
  v16 = v14;
  v5 = *(_QWORD **)(v14 + 40);
  v6 = *(std::__shared_weak_count **)(v14 + 48);
  *(_QWORD *)&v15 = v5;
  *((_QWORD *)&v15 + 1) = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  sub_1000B9C34(v4, v5);
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CryptoBackendXPC baseBackendXPC](self, "baseBackendXPC", v15, (_QWORD)v16));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("baseBackend"));

  if (*((_QWORD *)&v16 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v16 + 1) + 16))(*((_QWORD *)&v16 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v16 + 1));
    }
  }

}

- (void)replaceWithBackendXPC:(id)a3
{
  id v5;
  __int128 v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v5 = a3;
  -[BackendXPC backend](self, "backend");
  if (v5)
  {
    objc_msgSend(v5, "backend");
    v6 = v12;
  }
  else
  {
    v6 = 0uLL;
  }
  v7 = *(std::__shared_weak_count **)(v13 + 32);
  *(_OWORD *)(v13 + 24) = v6;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  objc_storeStrong((id *)&self->_baseBackendXPC, a3);
  if (v14)
  {
    v10 = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }

}

- (BOOL)isUnlocked
{
  return 1;
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
