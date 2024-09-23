@implementation KNOXBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KNOXBackendXPC)initWithURL:(id)a3 key:(void *)a4
{
  id v7;
  KNOXBackendXPC *v8;
  KNOXBackendXPC *v9;
  void *v10;
  id v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  int v22;
  char *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;

  v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)KNOXBackendXPC;
  v8 = -[KNOXBackendXPC init](&v28, "init");
  v9 = v8;
  if (v8)
  {
    sub_100027CB4(&v8->_key.__ptr_, (uint64_t *)a4);
    objc_storeStrong((id *)&v9->_URL, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KNOXBackendXPC URL](v9, "URL"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString")));
    v23 = (char *)objc_msgSend(v11, "UTF8String");
    sub_1000BE8C0(&v23, &v24);
    v22 = 0;
    sub_1000BE9C8((uint64_t)&v24, &v22, &v26);
    v27 = v26;
    v26 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v27);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
    if (*((_QWORD *)&v27 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

  }
  return v9;
}

- (KNOXBackendXPC)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  KNOXBackendXPC *v6;
  id v7;
  uint64_t v8;
  DIURL *URL;
  KNOXBackendXPC *v10;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KNOXBackendXPC;
  v6 = -[BackendXPC initWithCoder:](&v13, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIURL, v5), CFSTR("URL"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    URL = v6->_URL;
    v6->_URL = (DIURL *)v8;

    v12 = 0;
    if (objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("encKeys"), &v12)
      && v12 == 32)
    {
      operator new[]();
    }
    v10 = 0;
  }
  else
  {
    v10 = (KNOXBackendXPC *)0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)KNOXBackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNOXBackendXPC URL](self, "URL"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_key.__ptr_, 32, CFSTR("encKeys"));
}

- (DIURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_URL, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
