@implementation OZFxPlugColorGamutHandler

- (OZFxPlugColorGamutHandler)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  uint64_t *ptr;
  OZFxPlugColorGamutHandler *v4;
  OZFxPlugColorGamutHandler *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)OZFxPlugColorGamutHandler;
  v4 = -[OZFxPlugColorGamutHandler init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<TXTextStyle>::operator=[abi:ne180100](&v4->_fxPlugLock.__ptr_, ptr);
  return v5;
}

- (id)pcFloat33MatrixToFxMatrix44:(const float *)a3
{
  uint64_t v3;
  double *v4;
  uint64_t i;
  _OWORD v7[6];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = 0;
  v12 = *MEMORY[0x1E0C80C00];
  memset(v7, 0, sizeof(v7));
  v4 = (double *)v7;
  do
  {
    for (i = 0; i != 3; ++i)
      v4[i] = a3[i];
    *((_QWORD *)&v7[2 * v3++ + 1] + 1) = 0;
    a3 += 3;
    v4 += 4;
  }
  while (v3 != 3);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0x3FF0000000000000;
  return -[FxMatrix44 initWithColorMatrix44Data:]([FxMatrix44 alloc], "initWithColorMatrix44Data:", v7);
}

- (id)colorMatrixFromDesiredRGBToYCbCr
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  int WorkingGamut;
  FxMatrix44 *v10;
  FxMatrix44 *v11;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v14;
  OZLocking *v15[2];
  _BYTE v16[36];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v14 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v15, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v14;
  if (v14)
  {
    v7 = (unint64_t *)((char *)v14 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (*(_QWORD *)v15[0])
  {
    WorkingGamut = getWorkingGamut(*(OZChannelBase **)v15[0]);
    PCGetWorkingColorSpaceRGBToYCbCrMatrix(WorkingGamut, (uint64_t)v16);
    v10 = -[OZFxPlugColorGamutHandler pcFloat33MatrixToFxMatrix44:](self, "pcFloat33MatrixToFxMatrix44:", v16, ptr);
  }
  else
  {
    v10 = objc_alloc_init(FxMatrix44);
  }
  v11 = v10;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v15);
  return v11;
}

- (id)colorMatrixFromYCbCrToDesiredRGB
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  int WorkingGamut;
  FxMatrix44 *v10;
  FxMatrix44 *v11;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v14;
  OZLocking *v15[2];
  _BYTE v16[36];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v14 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v15, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v14;
  if (v14)
  {
    v7 = (unint64_t *)((char *)v14 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (*(_QWORD *)v15[0])
  {
    WorkingGamut = getWorkingGamut(*(OZChannelBase **)v15[0]);
    PCGetWorkingColorSpaceYCbCrToRGBMatrix(WorkingGamut, (uint64_t)v16);
    v10 = -[OZFxPlugColorGamutHandler pcFloat33MatrixToFxMatrix44:](self, "pcFloat33MatrixToFxMatrix44:", v16, ptr);
  }
  else
  {
    v10 = objc_alloc_init(FxMatrix44);
  }
  v11 = v10;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v15);
  return v11;
}

- (unint64_t)colorPrimaries
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
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
    v8 = getWorkingGamut(*(OZChannelBase **)v12[0]) == 1;
  else
    v8 = 0;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
  return v8;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1EF0A2958 == a3;
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
