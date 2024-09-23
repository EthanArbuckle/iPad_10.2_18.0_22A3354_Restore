@implementation RamXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RamXPC)initWithSize:(unint64_t)a3
{
  RamXPC *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  unint64_t v14;

  v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RamXPC;
  v3 = -[RamXPC init](&v13, "init");
  if (v3)
  {
    sub_1000BDFD8((uint64_t *)&v14, &v11);
    v12 = v11;
    v11 = 0uLL;
    -[BackendXPC setBackend:](v3, "setBackend:", &v12, 0);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  return v3;
}

- (void)createRamBackend
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22[2];

  -[BackendXPC backend](self, "backend");
  v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 40))(v20);
  -[BackendXPC backend](self, "backend");
  v22[0] = (*(uint64_t (**)())(*(_QWORD *)v15 + 160))();
  v22[1] = v3;
  sub_1000BE0B0((size_t *)&v17, v22, &v18);
  v19 = v18;
  v18 = 0uLL;
  -[BackendXPC setBackend:](self, "setBackend:", &v19);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v16->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v12 = v21;
  if (v21)
  {
    v13 = (unint64_t *)&v21->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (RamXPC)initWithCoder:(id)a3
{
  id v4;
  RamXPC *v5;
  uint64_t v6;
  id v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  id v18;
  objc_super v19;
  uint64_t v20[2];

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RamXPC;
  v5 = -[BackendXPC initWithCoder:](&v19, "initWithCoder:", v4);
  if (v5)
  {
    v18 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size"));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v6), CFSTR("identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v8, "getUUIDBytes:", v20);
    sub_1000BE3CC((uint64_t *)&v18, v20, &v16);
    v17 = v16;
    v16 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v17, 0);
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    if (*((_QWORD *)&v17 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RamXPC;
  -[BackendXPC encodeWithCoder:](&v10, "encodeWithCoder:", v4);
  -[BackendXPC backend](self, "backend");
  objc_msgSend(v4, "encodeInt64:forKey:", (*(uint64_t (**)())(*(_QWORD *)v8 + 40))(), CFSTR("size"));
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BackendXPC instanceID](self, "instanceID"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("identifier"));

}

- (id)description
{
  id v3;
  void *v4;
  NSString *v5;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RamXPC;
  v3 = -[BackendXPC description](&v13, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[BackendXPC backend](self, "backend");
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[ramsize=%llu]"), v4, (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 40))(v11));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return v6;
}

@end
