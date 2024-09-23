@implementation OZFxPlugGamutNotificationReceiver

- (OZFxPlugGamutNotificationReceiver)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  uint64_t *ptr;
  OZFxPlugGamutNotificationReceiver *v4;
  OZFxPlugGamutNotificationReceiver *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)OZFxPlugGamutNotificationReceiver;
  v4 = -[OZFxPlugGamutNotificationReceiver init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<TXTextStyle>::operator=[abi:ne180100](&v4->_pluginLock.__ptr_, ptr);
  return v5;
}

- (void)handleProjectColorChangeNotification:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  const PCString *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v11;
  OZLocking *v12[2];

  cntrl = self->_pluginLock.__cntrl_;
  ptr = self->_pluginLock.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v12, (uint64_t)&ptr);
  v7 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v8 = (unint64_t *)((char *)v11 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (*(_QWORD *)v12[0])
    OZChannelBase::setRangeName(*(OZChannelBase **)v12[0], v6);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
}

- (void)handleAllParameterResetNotification:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  const PCString *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v11;
  OZLocking *v12[2];

  cntrl = self->_pluginLock.__cntrl_;
  ptr = self->_pluginLock.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v12, (uint64_t)&ptr);
  v7 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v8 = (unint64_t *)((char *)v11 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (*(_QWORD *)v12[0])
    OZChannelBase::setRangeName(*(OZChannelBase **)v12[0], v6);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
}

- (void).cxx_destruct
{
  std::shared_ptr<HGCPUComputeDevice const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_pluginLock);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
