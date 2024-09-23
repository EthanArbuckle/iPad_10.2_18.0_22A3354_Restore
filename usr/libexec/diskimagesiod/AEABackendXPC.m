@implementation AEABackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AEABackendXPC)initWithBackend:(id)a3 key:(shared_ptr<unsigned char>)a4
{
  uint64_t *ptr;
  id v7;
  AEABackendXPC *v8;
  AEABackendXPC *v9;
  id *p_baseBackendXPC;
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

  ptr = (uint64_t *)a4.__ptr_;
  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AEABackendXPC;
  v8 = -[AEABackendXPC init](&v23, "init");
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a3);
    sub_100027CB4(&v9->_key.__ptr_, ptr);
    if (*p_baseBackendXPC)
      objc_msgSend(*p_baseBackendXPC, "backend");
    else
      v20 = 0;
    sub_1000BE7C0(&v21);
    v22 = v21;
    v21 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v22);
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

  return v9;
}

- (AEABackendXPC)initWithCoder:(id)a3
{
  id v4;
  AEABackendXPC *v5;
  AEABackendXPC *v6;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEABackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v9, "initWithCoder:", v4);
  if (v5)
  {
    v8 = 0;
    if (objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("encKeys"), &v8)
      && v8 == 32)
    {
      operator new[]();
    }
    v6 = 0;
  }
  else
  {
    v6 = (AEABackendXPC *)0;
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
  v6.super_class = (Class)AEABackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_key.__ptr_, 32, CFSTR("encKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEABackendXPC baseBackendXPC](self, "baseBackendXPC"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("baseBackend"));

}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (shared_ptr<unsigned)key
{
  char **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<unsigned char> result;

  cntrl = self->_key.__cntrl_;
  *v2 = self->_key.__ptr_;
  v2[1] = (char *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (char *)self;
  return result;
}

- (void).cxx_destruct
{
  sub_100012168((uint64_t)&self->_key);
  objc_storeStrong((id *)&self->_baseBackendXPC, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
