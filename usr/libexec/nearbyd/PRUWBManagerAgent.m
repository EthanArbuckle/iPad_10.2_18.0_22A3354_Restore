@implementation PRUWBManagerAgent

- (PRUWBManagerAgent)initWithClientReference:(shared_ptr<PRRangingManagerClient>)a3
{
  uint64_t *ptr;
  PRUWBManagerAgent *v4;
  PRUWBManagerAgent *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)PRUWBManagerAgent;
  v4 = -[PRUWBManagerAgent init](&v7, "init", a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    sub_100021C24(&v4->_clientReference.__ptr_, ptr);
  return v5;
}

- (id)getQueue
{
  return *((id *)sub_1002CA108() + 7);
}

- (PRUWBDeviceCapabilities)deviceCapabilities
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  int v19;
  int v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;

  v2 = sub_100004784();
  v3 = sub_1003956C0((uint64_t)v2);
  v4 = sub_100004784();
  v5 = sub_1003956C8((uint64_t)v4);
  v6 = sub_100004784();
  v7 = sub_100395734((uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("NI_SimulateUnsupportedPlatform"));
  v10 = (v9 ^ 1) & v3;
  v11 = (v9 ^ 1) & v5;
  v12 = (v9 ^ 1) & v7;
  v13 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    if (v10)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    if (v11)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v21 = 138413058;
    v22 = v15;
    if (v12)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v17;
    if (v9)
      v14 = CFSTR("YES");
    v27 = 2112;
    v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[UWBAgent] query device capabilities. Supports UWB: %@, Supports AoA: %@, Supports NMI: %@, Simulated: %@", (uint8_t *)&v21, 0x2Au);
  }

  if (v12)
    v18 = 0x10000;
  else
    v18 = 0;
  if (v11)
    v19 = 256;
  else
    v19 = 0;
  return (PRUWBDeviceCapabilities)(v18 | v19 | v10);
}

- (shared_ptr<PRConfigurationManager>)configurationManager
{
  _QWORD *v2;
  _QWORD *v3;
  PRConfigurationManager *v4;
  __shared_weak_count *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  shared_ptr<PRConfigurationManager> result;

  v3 = v2;
  v4 = (PRConfigurationManager *)sub_1002CA108();
  v6 = *((_QWORD *)v4 + 407);
  *v3 = *((_QWORD *)v4 + 406);
  v3[1] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)connect
{
  NSObject *v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[UWBAgent] connect with client reference", (uint8_t *)&v11, 2u);
  }
  v4 = sub_1002CA108();
  sub_10001ADBC(&v11, (_QWORD *)self->_clientReference.__ptr_ + 1);
  v12 = v11;
  v11 = 0uLL;
  sub_1002CE308((uint64_t)v4, (unint64_t *)&v12);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
  if (*((_QWORD *)&v12 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (void)disconnect
{
  NSObject *v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[UWBAgent] disconnect", (uint8_t *)&v11, 2u);
  }
  v4 = sub_1002CA108();
  sub_10001ADBC(&v11, (_QWORD *)self->_clientReference.__ptr_ + 1);
  v12 = v11;
  v11 = 0uLL;
  sub_1002CE3E0((uint64_t)v4, (unint64_t *)&v12);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
  if (*((_QWORD *)&v12 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (void)requestAsyncServiceStatusUpdate
{
  void *v3;
  unint64_t *p_shared_weak_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v3 = sub_1002CA108();
  sub_10001ADBC(&v9, (_QWORD *)self->_clientReference.__ptr_ + 1);
  v11 = v9;
  v12 = v10;
  if (v10)
  {
    p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
    do
      v5 = __ldxr(p_shared_weak_owners);
    while (__stxr(v5 + 1, p_shared_weak_owners));
  }
  sub_1002CA79C((uint64_t)v3, &v11);
  if (v12)
    std::__shared_weak_count::__release_weak(v12);
  v6 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (RoseServiceStateUpdate)currentServiceState
{
  _QWORD **v2;

  v2 = (_QWORD **)sub_1002CA108();
  return (RoseServiceStateUpdate)(*(uint64_t (**)(_QWORD *))(*v2[807] + 72))(v2[807]);
}

- (void).cxx_destruct
{
  sub_10001AE68((uint64_t)&self->_clientReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
