@implementation PluginBackendXPC

- (PluginBackendXPC)initWithURL:(id)a3 openMode:(int)a4
{
  id v7;
  PluginBackendXPC *v8;
  id v9;
  char *v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  _QWORD *exception;
  const std::error_category *v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  char *v29;
  objc_super v30;
  unsigned int v31;

  v7 = a3;
  v31 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PluginBackendXPC;
  v8 = -[PluginBackendXPC init](&v30, "init");
  if (v8)
  {
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pluginName")));
    v10 = (char *)objc_msgSend(v9, "UTF8String");

    v29 = v10;
    if (!v10)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      *exception = &off_1001924F8;
      v23 = std::generic_category();
      exception[1] = 22;
      exception[2] = v23;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = "Invalid plugin URL, plugin name is missing";
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pluginParams"));
    v26 = v11;
    sub_1000BEADC(&v29, (uint64_t *)&v26, &v31, &v27);

    sub_1000BECA8(&v27, &v24);
    v25 = v24;
    v24 = 0uLL;
    -[BackendXPC setBackend:](v8, "setBackend:", &v25, 0);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
    if (*((_QWORD *)&v25 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    objc_storeStrong((id *)&v8->_URL, a3);
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
  }

  return v8;
}

- (PluginBackendXPC)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  PluginBackendXPC *v6;
  id v7;
  uint64_t v8;
  DIURL *URL;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  void *v19;
  id v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  __int128 v31;
  __int128 v32;
  void *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  __int128 v38;
  void (__cdecl *v39)(void *);
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PluginBackendXPC;
  v6 = -[BackendXPC initWithCoder:](&v40, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIURL, v5), CFSTR("URL"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    URL = v6->_URL;
    v6->_URL = (DIURL *)v8;

    v11 = objc_opt_class(NSData, v10);
    v13 = objc_opt_class(NSString, v12);
    v15 = objc_opt_class(NSDictionary, v14);
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v13, v15, objc_opt_class(NSFileHandle, v16), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("encodedDict")));

    v38 = *(_OWORD *)off_1001852E8;
    v39 = j__free_0;
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DIURL pluginName](v6->_URL, "pluginName")));
    v34 = 0;
    v35 = (char *)objc_msgSend(v20, "UTF8String");
    v33 = v19;
    sub_1000BEEE8(&v35, (uint64_t)&v34, (uint64_t)&unk_100145207, (uint64_t)&v38, &v33, &v36);

    sub_1000BECA8(&v36, &v31);
    v32 = v31;
    v31 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v32);
    v21 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v32 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    v24 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
    if (*((_QWORD *)&v31 + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    v27 = v37;
    if (v37)
    {
      p_shared_owners = (unint64_t *)&v37->__shared_owners_;
      do
        v29 = __ldaxr(p_shared_owners);
      while (__stlxr(v29 - 1, p_shared_owners));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PluginBackendXPC;
  -[BackendXPC encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PluginBackendXPC URL](self, "URL"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  (*(void (**)(void))(*(_QWORD *)-[PluginBackendXPC pluginHeader](self, "pluginHeader") + 64))();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("encodedDict"));

}

- (const)pluginHeader
{
  const void *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[BackendXPC backend](self, "backend");
  v2 = *(const void **)(v6 + 24);
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
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
