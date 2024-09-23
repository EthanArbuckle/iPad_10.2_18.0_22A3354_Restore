@implementation SparseBundleBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SparseBundleBackendXPC)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  SparseBundleBackendXPC *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  unsigned __int8 v36;
  int v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SparseBundleBackendXPC;
  v6 = -[BackendXPC initWithCoder:](&v38, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSFileHandle, v5), CFSTR("bundle_handle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v37 = dup((int)objc_msgSend(v8, "fileDescriptor"));
    v36 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_writable"));
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BackendXPC, v9), CFSTR("lock_backend"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    v35 = 0uLL;
    if (v11)
    {
      objc_msgSend(v11, "backend");
      v13 = v34;
      v34 = 0uLL;
      v14 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
      v35 = v13;
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      if (*((_QWORD *)&v34 + 1))
      {
        v17 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 8);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          (*(void (**)(_QWORD))(**((_QWORD **)&v34 + 1) + 16))(*((_QWORD *)&v34 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v34 + 1));
        }
      }
    }
    sub_1000B982C(v4, (uint64_t *)-[BackendXPC cryptoHeader](v6, "cryptoHeader"), &v34);
    sub_1000BDBC0((unsigned int *)&v37, &v36, &v32);
    v33 = v32;
    v32 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v33, 0);
    v19 = (std::__shared_weak_count *)*((_QWORD *)&v33 + 1);
    if (*((_QWORD *)&v33 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v32 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v25 = (std::__shared_weak_count *)*((_QWORD *)&v34 + 1);
    if (*((_QWORD *)&v34 + 1))
    {
      v26 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 8);
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    v28 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
    if (*((_QWORD *)&v35 + 1))
    {
      v29 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  FileLocalXPC *v9;
  FileLocalXPC *v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  objc_super v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;

  v4 = a3;
  -[BackendXPC backend](self, "backend");
  v6 = v23;
  v5 = v24;
  v25 = v23;
  v26 = v24;
  v22.receiver = self;
  v22.super_class = (Class)SparseBundleBackendXPC;
  -[BackendXPC encodeWithCoder:](&v22, "encodeWithCoder:", v4);
  v7 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:", (**(uint64_t (***)(uint64_t))(v6 + 24))(v6 + 24));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bundle_handle"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6), CFSTR("is_writable"));
  v8 = *(_QWORD **)(v6 + 96);
  if (v8)
    sub_1000B9C34(v4, v8);
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v6 + 192))(v6))
  {
    v9 = objc_alloc_init(FileLocalXPC);
    v10 = v9;
    v12 = *(_QWORD *)(v6 + 80);
    v11 = *(std::__shared_weak_count **)(v6 + 88);
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    v20 = v12;
    v21 = v11;
    -[BackendXPC setBackend:](v9, "setBackend:", &v20, 0);
    v15 = v21;
    if (v21)
    {
      v16 = (unint64_t *)&v21->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("lock_backend"));

    v5 = v26;
  }

  if (v5)
  {
    v18 = (unint64_t *)&v5->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

}

- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4 bandSize:(unint64_t)a5
{
  id v8;
  SparseBundleBackendXPC *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char *v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  unint64_t v21;
  int v22;

  v8 = a3;
  v22 = a4;
  v21 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SparseBundleBackendXPC;
  v9 = -[SparseBundleBackendXPC init](&v20, "init");
  if (v9)
  {
    v17 = (char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    sub_1000BDCE0(&v17, &v22, &v21, &v18);
    v19 = v18;
    v18 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v19);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v19 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

  return v9;
}

- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4
{
  id v6;
  SparseBundleBackendXPC *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  char *v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  int v19;

  v6 = a3;
  v19 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SparseBundleBackendXPC;
  v7 = -[SparseBundleBackendXPC init](&v18, "init");
  if (v7)
  {
    v15 = (char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    sub_1000BDE6C(&v15, &v19, &v16);
    v17 = v16;
    v16 = 0uLL;
    -[BackendXPC setBackend:](v7, "setBackend:", &v17);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    if (*((_QWORD *)&v17 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }

  return v7;
}

- (shared_ptr<Backend>)getCryptoHeaderBackend
{
  _OWORD *v2;
  _OWORD *v3;
  std::__shared_weak_count *v4;
  Backend *v5;
  __shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _OWORD v9[2];
  shared_ptr<Backend> result;

  v3 = v2;
  -[BackendXPC backend](self, "backend");
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v9[0] + 1);
  v9[1] = v9[0];
  sub_10006D5BC(*(int **)&v9[0], v9);
  *v3 = v9[0];
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  result.__cntrl_ = v6;
  result.__ptr_ = v5;
  return result;
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;

  v4 = a3;
  -[BackendXPC backend](self, "backend");
  v20 = v19;
  v5 = *(_QWORD *)(v19 + 104);
  *(_QWORD *)&v19 = *(_QWORD *)(v19 + 96);
  *((_QWORD *)&v19 + 1) = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v18.receiver = self;
  v18.super_class = (Class)SparseBundleBackendXPC;
  -[BackendXPC replaceWithBackendXPC:](&v18, "replaceWithBackendXPC:", v4);
  -[BackendXPC backend](self, "backend");
  sub_100027CB4((_QWORD *)(v16 + 96), (uint64_t *)&v19);
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
  if (*((_QWORD *)&v20 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

}

- (BOOL)isUnlocked
{
  uint64_t v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[BackendXPC backend](self, "backend");
  v2 = *(_QWORD *)(v6 + 96);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2 != 0;
}

- (id)newWithCryptoFormat:(const void *)a3
{
  SparseBundleBackendXPC *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v5 = objc_alloc_init(SparseBundleBackendXPC);
  -[BackendXPC backend](self, "backend");
  v19 = v17;
  v20 = v18;
  sub_100027CB4((_QWORD *)(v17 + 96), (uint64_t *)a3);
  v15 = v17;
  v16 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  -[BackendXPC setBackend:](v5, "setBackend:", &v15);
  v8 = v16;
  if (v16)
  {
    v9 = (unint64_t *)&v16->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v5;
}

@end
