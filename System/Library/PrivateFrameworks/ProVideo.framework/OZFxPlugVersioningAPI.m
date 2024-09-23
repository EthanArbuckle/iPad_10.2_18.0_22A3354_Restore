@implementation OZFxPlugVersioningAPI

- (OZFxPlugVersioningAPI)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  uint64_t *ptr;
  OZFxPlugVersioningAPI *v4;
  OZFxPlugVersioningAPI *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)OZFxPlugVersioningAPI;
  v4 = -[OZFxPlugVersioningAPI init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<TXTextStyle>::operator=[abi:ne180100](&v4->_fxPlugLock.__ptr_, ptr);
  return v5;
}

- (unsigned)versionAtCreation
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  unsigned int v8;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v11;
  OZLocking *v12[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v12, (uint64_t)&ptr);
  v5 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v6 = (unint64_t *)((char *)v11 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (*(_QWORD *)v12[0])
    v8 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)v12[0] + 192))(*(_QWORD *)v12[0]);
  else
    v8 = -1;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
  return v8;
}

- (BOOL)updateVersionAtCreation:(unsigned int)a3
{
  uint64_t v3;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  OZFactoryBase *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v21;
  OZLocking *v22[2];

  v3 = *(_QWORD *)&a3;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v21 = cntrl;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v22, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v21;
  if (v21)
  {
    v9 = (unint64_t *)((char *)v21 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = *(const void **)v22[0];
  if (*(_QWORD *)v22[0])
  {
    if (TXParagraphStyleFolder_Factory::createInstance(*(TXParagraphStyleFolder_Factory **)v22[0], v7))
    (*(void (**)(const void *, uint64_t))(*(_QWORD *)v11 + 184))(v11, v3);
    PCPrint("File %s, line %d should not have been reached:\n\t", v12, v13, v14, v15, v16, v17, v18, (char)"/Library/Caches/com.apple.xbs/Sources/MotioniOS/Ozone/Effects/FxFilter/OZFxPlugHostPropertiesAPI.mm");
    pcAbortImpl();
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v22);
  return 0;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1EF0A8190 == a3;
}

- (void).cxx_destruct
{
  std::shared_ptr<HGCPUComputeDevice const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_fxPlugLock);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
