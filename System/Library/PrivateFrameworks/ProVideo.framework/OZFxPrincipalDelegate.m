@implementation OZFxPrincipalDelegate

- (OZFxPrincipalDelegate)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  uint64_t *ptr;
  OZFxPrincipalDelegate *v4;
  OZFxPrincipalDelegate *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)OZFxPrincipalDelegate;
  v4 = -[OZFxPrincipalDelegate init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<TXTextStyle>::operator=[abi:ne180100](&v4->_fxPlugLock.__ptr_, ptr);
  return v5;
}

- (id)fxServiceProxy
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  void *v8;
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
    v8 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)v12[0] + 16), "pluginKitPlug", ptr), "plugInPrincipal");
  else
    v8 = 0;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
  return v8;
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
