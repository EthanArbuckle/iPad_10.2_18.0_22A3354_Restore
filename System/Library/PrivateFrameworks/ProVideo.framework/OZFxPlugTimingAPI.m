@implementation OZFxPlugTimingAPI

- (OZFxPlugTimingAPI)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  uint64_t *ptr;
  OZFxPlugTimingAPI *v4;
  OZFxPlugTimingAPI *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)OZFxPlugTimingAPI;
  v4 = -[OZFxPlugTimingAPI init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<TXTextStyle>::operator=[abi:ne180100](&v4->_fxPlugLock.__ptr_, ptr);
  return v5;
}

- (void)copyFxTime:(id)a3 toFxTime:(id *)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  uint64_t v12;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v14;
  OZLocking *v15[2];
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;

  var1 = a3.var1;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v14 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v15, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v14;
  if (v14)
  {
    v9 = (unint64_t *)((char *)v14 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (*(_QWORD *)v15[0])
  {
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)v15[0] + 160))(*(_QWORD *)v15[0]))
    {
      v11 = a4->var1;
      v12 = *((_QWORD *)var1 + 2);
      *(_OWORD *)v11 = *(_OWORD *)var1;
      *((_QWORD *)v11 + 2) = v12;
    }
    else
    {
      a4->var1 = var1;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v15);
}

- ($EBBD99E4BEE052F512DA5DADC73F537E)invalidTime
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 *FxTimeInvalid;
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
  if (*(_QWORD *)v12[0] && !(*(unsigned int (**)(_QWORD))(**(_QWORD **)v12[0] + 160))(*(_QWORD *)v12[0]))
    FxTimeInvalid = (__int128 *)0xBFF0000000000000;
  else
    FxTimeInvalid = getFxTimeInvalid();
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
  return ($EBBD99E4BEE052F512DA5DADC73F537E)FxTimeInvalid;
}

- ($EBBD99E4BEE052F512DA5DADC73F537E)zeroTime
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 *FxTimeZero;
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
  if (*(_QWORD *)v12[0] && !(*(unsigned int (**)(_QWORD))(**(_QWORD **)v12[0] + 160))(*(_QWORD *)v12[0]))
    FxTimeZero = 0;
  else
    FxTimeZero = getFxTimeZero();
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
  return ($EBBD99E4BEE052F512DA5DADC73F537E)FxTimeZero;
}

- (double)startTimeOfInputToFilter:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  const PCString *v9;
  const __CFString *v10;
  double v11;
  PCString v13[2];
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v18;
  id v19;

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v18 = cntrl;
  v19 = 0;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v15, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v18;
  if (v18)
  {
    v7 = (unint64_t *)((char *)v18 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = *(const PCString **)v15;
  if (*(_QWORD *)v15)
  {
    if (!((unsigned int (*)(_QWORD))v9->var0[5].isa)(*(_QWORD *)v15))
    {
      PCMakeNSRefAndRetain<EAGLContext *>(v9[4].var0, (id *)&v13[0].var0);
      ProCore_Impl::PCNSRefImpl::release((id *)&v13[0].var0);
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v15);
      (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)objc_msgSend(v19, "getSceneNode") + 1128))(&v15);
      *(_OWORD *)&v13[0].var0 = v15;
      v14 = v16;
      v11 = COERCE_DOUBLE(objc_msgSend(v19, "figTimeToFxTime:withConversionData:", v13, 0));
      goto LABEL_14;
    }
    PCString::PCString(v13, v9 + 19);
    v10 = PCString::ns_str(v13);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI startTimeOfInputToFilter:], which returns a frame number, but the plug-in expects a rational time."), v10);
    PCString::~PCString(v13);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v15);
  v11 = -1.0;
LABEL_14:
  ProCore_Impl::PCNSRefImpl::release(&v19);
  return v11;
}

- (double)startTimeOfInputAToTransition:(id)a3
{
  return -1.0;
}

- (double)startTimeOfInputBToTransition:(id)a3
{
  return -1.0;
}

- (double)startTimeOfImageParm:(unsigned int)a3 forEffect:(id)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  const PCString *v11;
  const __CFString *v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  uint64_t *v22;
  OZChannelBase *v23;
  const void *ImageNode;
  uint64_t v25;
  uint64_t v26;
  PCString v27[2];
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v32;
  id v33;

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v32 = cntrl;
  v33 = 0;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v29, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v32;
  if (v32)
  {
    v9 = (unint64_t *)((char *)v32 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = *(const PCString **)v29;
  if (!*(_QWORD *)v29)
    goto LABEL_12;
  if (((unsigned int (*)(_QWORD))v11->var0[5].isa)(*(_QWORD *)v29))
  {
    PCString::PCString(v27, v11 + 19);
    v12 = PCString::ns_str(v27);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI startTimeOfImageParm:forEffect:], which returns a frame number, but the plug-in expects a rational time."), v12);
    PCString::~PCString(v27);
LABEL_12:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v29);
    v13 = -1.0;
    goto LABEL_13;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v11[4].var0, (id *)&v27[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v33, (id *)&v27[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v27[0].var0);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v29);
  v15 = objc_msgSend(v33, "channelMap");
  v18 = *(_QWORD *)(v15 + 8);
  v16 = v15 + 8;
  v17 = v18;
  v13 = 0.0;
  if (v18)
  {
    v19 = v16;
    do
    {
      v20 = *(_DWORD *)(v17 + 32);
      v21 = v20 >= a3;
      if (v20 >= a3)
        v22 = (uint64_t *)v17;
      else
        v22 = (uint64_t *)(v17 + 8);
      if (v21)
        v19 = v17;
      v17 = *v22;
    }
    while (*v22);
    if (v19 != v16 && *(_DWORD *)(v19 + 32) <= a3)
    {
      v23 = *(OZChannelBase **)(v19 + 40);
      if (v23)
      {
        ImageNode = OZChanElementOrFootageRef::getImageNode(v23);
        if (ImageNode)
        {
          v25 = (*(uint64_t (**)(const void *))(*(_QWORD *)ImageNode + 104))(ImageNode);
          v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v25 + 232))(v25);
          if (v26)
          {
            (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)v26 + 1128))(&v29);
            *(_OWORD *)&v27[0].var0 = v29;
            v28 = v30;
            v13 = COERCE_DOUBLE(objc_msgSend(v33, "figTimeToFxTime:withConversionData:", v27, 0));
          }
        }
      }
    }
  }
LABEL_13:
  ProCore_Impl::PCNSRefImpl::release(&v33);
  return v13;
}

- (double)durationOfInputToFilter:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  const PCString *v10;
  const __CFString *v11;
  double v12;
  OZLocking *v14[3];
  __int128 v15;
  uint64_t v16;
  PCString v17;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v19;
  id v20;
  __int128 v21;
  uint64_t v22;

  v21 = *MEMORY[0x1E0CA2E68];
  v22 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[OZFxPlugTimingAPI invalidTime](self, "invalidTime", a3);
  v20 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v19 = cntrl;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v14, (uint64_t)&ptr);
  v7 = (std::__shared_weak_count *)v19;
  if (v19)
  {
    v8 = (unint64_t *)((char *)v19 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = *(const PCString **)v14[0];
  if (*(_QWORD *)v14[0])
  {
    if (!((unsigned int (*)(_QWORD))v10->var0[5].isa)(*(_QWORD *)v14[0]))
    {
      PCMakeNSRefAndRetain<EAGLContext *>(v10[4].var0, (id *)&v17.var0);
      ProCore_Impl::PCNSRefImpl::operator=(&v20, (id *)&v17.var0);
      ProCore_Impl::PCNSRefImpl::release((id *)&v17.var0);
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v14);
      (*(void (**)(OZLocking **__return_ptr))(*(_QWORD *)objc_msgSend(v20, "getSceneNode") + 1128))(v14);
      v21 = v15;
      v22 = v16;
      v12 = COERCE_DOUBLE(objc_msgSend(v20, "figTimeToFxTime:withConversionData:", &v21, 0));
      goto LABEL_14;
    }
    PCString::PCString(&v17, v10 + 19);
    v11 = PCString::ns_str(&v17);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI durationOfInputToFilter:], which returns a frame number, but the plug-in expects a rational time."), v11);
    PCString::~PCString(&v17);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v14);
  v12 = -1.0;
LABEL_14:
  ProCore_Impl::PCNSRefImpl::release(&v20);
  return v12;
}

- (double)durationOfInputAToTransition:(id)a3
{
  return -1.0;
}

- (double)durationOfInputBToTransition:(id)a3
{
  return -1.0;
}

- (double)durationOfImageParm:(unsigned int)a3 forEffect:(id)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  PCString *v11;
  const __CFString *v12;
  double v13;
  uint64_t v15;
  OZFactoryBase *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  BOOL v22;
  uint64_t *v23;
  const void *v24;
  OZChannelBase *v25;
  void *Instance;
  const void *ImageNode;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  PCString v31[2];
  uint64_t v32;
  OZLocking *v33[3];
  __int128 v34;
  uint64_t v35;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v37;
  id v38;
  id v39;

  v38 = 0;
  v39 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v37 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v33, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v37;
  if (v37)
  {
    v9 = (unint64_t *)((char *)v37 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = *(PCString **)v33[0];
  if (!*(_QWORD *)v33[0])
    goto LABEL_12;
  if (((unsigned int (*)(_QWORD))v11->var0[5].isa)(*(_QWORD *)v33[0]))
  {
    PCString::PCString(v31, v11 + 19);
    v12 = PCString::ns_str(v31);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI durationOfImageParm:forEffect], which returns a frame number, but the plug-in expects a rational time."), v12);
    PCString::~PCString(v31);
LABEL_12:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v33);
    v13 = -1.0;
    goto LABEL_13;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v11[4].var0, (id *)&v31[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v39, (id *)&v31[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v31[0].var0);
  v15 = objc_msgSend(v39, "channelMap");
  v19 = *(_QWORD *)(v15 + 8);
  v17 = v15 + 8;
  v18 = v19;
  if (!v19)
    goto LABEL_27;
  v20 = v17;
  do
  {
    v21 = *(_DWORD *)(v18 + 32);
    v22 = v21 >= a3;
    if (v21 >= a3)
      v23 = (uint64_t *)v18;
    else
      v23 = (uint64_t *)(v18 + 8);
    if (v22)
      v20 = v18;
    v18 = *v23;
  }
  while (*v23);
  if (v20 != v17 && *(_DWORD *)(v20 + 32) <= a3 && (v24 = *(const void **)(v20 + 40)) != 0)
  else
LABEL_27:
    v25 = 0;
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v11, v16);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v31[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v38, (id *)&v31[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v31[0].var0);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v33);
  v13 = -1.0;
  if (v25)
  {
    ImageNode = OZChanElementOrFootageRef::getImageNode(v25);
    v28 = ImageNode;
    if (ImageNode)
    {
      v29 = (*(uint64_t (**)(const void *))(*(_QWORD *)v28 + 104))(v28);
      v30 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v29 + 232))(v29);
      if (v30)
      {
        (*(void (**)(OZLocking **__return_ptr))(*(_QWORD *)v30 + 1128))(v33);
        *(_OWORD *)&v31[0].var0 = v34;
        v32 = v35;
        v13 = COERCE_DOUBLE(objc_msgSend(v39, "figDurationToFxDuration:withConversionData:", v31, 0));
      }
    }
  }
LABEL_13:
  ProCore_Impl::PCNSRefImpl::release(&v38);
  ProCore_Impl::PCNSRefImpl::release(&v39);
  return v13;
}

- (unint64_t)timelineFpsNumeratorForEffect:(id)a3
{
  double *v4;
  double v5;
  double v6;
  double v7;

  if (!-[OZFxPlugTimingAPI scene](self, "scene", a3))
    return 30;
  v4 = -[OZFxPlugTimingAPI sceneSettings](self, "sceneSettings");
  v5 = v4[4];
  v6 = ceil(v5) * 1000.0;
  v7 = v5 * 600.0;
  if (*((_BYTE *)v4 + 40))
    return (unint64_t)v6;
  return (unint64_t)v7;
}

- (unint64_t)timelineFpsDenominatorForEffect:(id)a3
{
  if (!-[OZFxPlugTimingAPI scene](self, "scene", a3))
    return 600;
  if (*(_BYTE *)(-[OZFxPlugTimingAPI sceneSettings](self, "sceneSettings") + 40))
    return 1001;
  return 600;
}

- (double)inPointOfTimelineForEffect:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  PCString *v9;
  const __CFString *v10;
  double v11;
  OZFactoryBase *v12;
  void *Instance;
  PCString v15;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v17;
  OZLocking *v18[2];
  id v19;
  id v20;

  v20 = 0;
  v19 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v17 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v18, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v17;
  if (v17)
  {
    v7 = (unint64_t *)((char *)v17 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = *(PCString **)v18[0];
  if (*(_QWORD *)v18[0])
  {
    if (!((unsigned int (*)(_QWORD))v9->var0[5].isa)(*(_QWORD *)v18[0]))
    {
      PCMakeNSRefAndRetain<EAGLContext *>(v9[4].var0, (id *)&v15.var0);
      ProCore_Impl::PCNSRefImpl::operator=(&v20, (id *)&v15.var0);
      ProCore_Impl::PCNSRefImpl::release((id *)&v15.var0);
      Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v9, v12);
      PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v15.var0);
      ProCore_Impl::PCNSRefImpl::operator=(&v19, (id *)&v15.var0);
      ProCore_Impl::PCNSRefImpl::release((id *)&v15.var0);
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v18);
      v11 = 0.0;
      OZScene::getPlayRange((OZScene *)objc_msgSend(v20, "getScene"));
      goto LABEL_14;
    }
    PCString::PCString(&v15, v9 + 19);
    v10 = PCString::ns_str(&v15);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI inPointOfTimelineForEffect:], which returns a frame number, but the plug-in expects a rational time."), v10);
    PCString::~PCString(&v15);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v18);
  v11 = -1.0;
LABEL_14:
  ProCore_Impl::PCNSRefImpl::release(&v19);
  ProCore_Impl::PCNSRefImpl::release(&v20);
  return v11;
}

- (double)outPointOfTimelineForEffect:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  PCString *v9;
  PCString *v10;
  const __CFString *v11;
  double v12;
  OZFactoryBase *v13;
  void *Instance;
  uint64_t v15;
  uint64_t PlayRange;
  double v17;
  __n128 v19;
  CMTimeEpoch v20;
  _QWORD v21[3];
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v23;
  id v24;
  id v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;

  v24 = 0;
  v25 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v23 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v28, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v23;
  if (v23)
  {
    v7 = (unint64_t *)((char *)v23 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = *(PCString **)v28.value;
  if (*(_QWORD *)v28.value)
  {
    if (!((unsigned int (*)(PCString *))v9->var0[5].isa)(v9))
    {
      PCMakeNSRefAndRetain<EAGLContext *>(v9[4].var0, (id *)&v27);
      ProCore_Impl::PCNSRefImpl::operator=(&v24, (id *)&v27);
      ProCore_Impl::PCNSRefImpl::release((id *)&v27);
      Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v9, v13);
      PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v27);
      ProCore_Impl::PCNSRefImpl::operator=(&v25, (id *)&v27);
      ProCore_Impl::PCNSRefImpl::release((id *)&v27);
      v15 = objc_msgSend(v24, "getScene");
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v28);
      PlayRange = OZScene::getPlayRange((OZScene *)v15);
      memset(v21, 0, sizeof(v21));
      OZSceneSettings::getFrameDuration((OZSceneSettings *)(v15 + 336), &v19);
      v28 = *(CMTime *)PlayRange;
      v27 = *(CMTime *)(PlayRange + 24);
      PC_CMTimeSaferAdd(&v28, &v27, (uint64_t)&v26);
      v28 = v26;
      *(__n128 *)&v27.value = v19;
      v27.epoch = v20;
      v17 = PC_CMTimeSaferSubtract(&v28, &v27, (uint64_t)v21);
      v12 = COERCE_DOUBLE(objc_msgSend(v24, "figTimeToFxTime:withConversionData:", v21, 0, v17));
      goto LABEL_14;
    }
    PCString::PCString((PCString *)&v27, v9 + 19);
    v11 = PCString::ns_str(v10);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI outPointOfTimelineForEffect:], which returns a frame number, but the plug-in expects a rational time."), v11);
    PCString::~PCString((PCString *)&v27);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v28);
  v12 = -1.0;
LABEL_14:
  ProCore_Impl::PCNSRefImpl::release(&v24);
  ProCore_Impl::PCNSRefImpl::release(&v25);
  return v12;
}

- (double)timelineDurationForEffect:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  const PCString *v10;
  double v11;
  const __CFString *v12;
  uint64_t PlayRange;
  __CFString *var0;
  PCString v16[2];
  uint64_t v17;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v19;
  OZLocking *v20[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v19 = cntrl;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v20, (uint64_t)&ptr);
  v7 = (std::__shared_weak_count *)v19;
  if (v19)
  {
    v8 = (unint64_t *)((char *)v19 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = *(const PCString **)v20[0];
  v11 = -1.0;
  if (*(_QWORD *)v20[0])
  {
    if (((unsigned int (*)(const PCString *))v10->var0[5].isa)(v10))
    {
      PCString::PCString(v16, v10 + 19);
      v12 = PCString::ns_str(v16);
      NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI timelineDurationForEffect:], which returns a frame number, but the plug-in expects a rational time."), v12);
      PCString::~PCString(v16);
    }
    else
    {
      PlayRange = OZScene::getPlayRange((OZScene *)-[OZFxPlugTimingAPI scene](self, "scene"));
      var0 = v10[4].var0;
      *(_OWORD *)&v16[0].var0 = *(_OWORD *)(PlayRange + 24);
      v17 = *(_QWORD *)(PlayRange + 40);
      v11 = COERCE_DOUBLE(-[__CFString figTimeToFxTime:withConversionData:](var0, "figTimeToFxTime:withConversionData:", v16, 0));
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v20);
  return v11;
}

- (double)startTimeForEffect:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  const PCString *v9;
  const __CFString *v10;
  double v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  PCString v16[2];
  uint64_t v17;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v19;
  OZLocking *v20[2];
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  id v25;

  v25 = 0;
  v21 = *MEMORY[0x1E0CA2E68];
  v22 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v23 = v21;
  v24 = v22;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v19 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v20, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v19;
  if (v19)
  {
    v7 = (unint64_t *)((char *)v19 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = *(const PCString **)v20[0];
  if (!*(_QWORD *)v20[0])
    goto LABEL_12;
  if (((unsigned int (*)(_QWORD))v9->var0[5].isa)(*(_QWORD *)v20[0]))
  {
    PCString::PCString(v16, v9 + 19);
    v10 = PCString::ns_str(v16);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI startTimeForEffect:], which returns a frame number, but the plug-in expects a rational time."), v10);
    PCString::~PCString(v16);
LABEL_12:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v20);
    v11 = -1.0;
    goto LABEL_18;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v9[4].var0, (id *)&v16[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v25, (id *)&v16[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v16[0].var0);
  if (v12)
    v13 = v12;
  v14 = 592;
  if (!v12)
    v14 = 1128;
  (*(void (**)(PCString *__return_ptr))(*v13 + v14))(v16);
  v21 = *(_OWORD *)&v16[0].var0;
  v22 = v17;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v20);
  *(_OWORD *)&v16[0].var0 = v21;
  v17 = v22;
  v11 = COERCE_DOUBLE(objc_msgSend(v25, "figTimeToFxTime:withConversionData:", v16, 0));
LABEL_18:
  ProCore_Impl::PCNSRefImpl::release(&v25);
  return v11;
}

- (double)durationForEffect:(id)a3
{
  CMTimeEpoch v3;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  PCString *v10;
  const __CFString *v11;
  double v12;
  OZFactoryBase *v13;
  void *Instance;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _QWORD v20[3];
  CMTime v21;
  CMTime v22[2];
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v24;
  id v25;
  id v26;
  CMTime v27;
  CMTime v28;
  CMTime v29;

  *(_OWORD *)&v27.value = *MEMORY[0x1E0CA2E68];
  v3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  *(_OWORD *)&v28.value = *(_OWORD *)&v27.value;
  v27.epoch = v3;
  v28.epoch = v3;
  v25 = 0;
  v26 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v24 = cntrl;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v29, (uint64_t)&ptr);
  v7 = (std::__shared_weak_count *)v24;
  if (v24)
  {
    v8 = (unint64_t *)((char *)v24 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = *(PCString **)v29.value;
  if (!*(_QWORD *)v29.value)
    goto LABEL_12;
  if (((unsigned int (*)(PCString *))v10->var0[5].isa)(v10))
  {
    PCString::PCString((PCString *)v22, v10 + 19);
    v11 = PCString::ns_str((PCString *)v22);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI durationForEffect:], which returns a frame number, but the plug-in expects a rational time."), v11);
    PCString::~PCString((PCString *)v22);
LABEL_12:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v29);
    v12 = -1.0;
    goto LABEL_19;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v10[4].var0, (id *)v22);
  ProCore_Impl::PCNSRefImpl::operator=(&v25, (id *)v22);
  ProCore_Impl::PCNSRefImpl::release((id *)v22);
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v10, v13);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)v22);
  ProCore_Impl::PCNSRefImpl::operator=(&v26, (id *)v22);
  ProCore_Impl::PCNSRefImpl::release((id *)v22);
  if (v15)
    (*(void (**)(CMTime *__return_ptr, void *))(*(_QWORD *)v15 + 592))(v22, v15);
  else
    (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)v16 + 1128))(v22);
  v27 = v22[0];
  v28 = v22[1];
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v29);
  if (v26)
  {
    v21 = v27;
    memset(v20, 0, sizeof(v20));
    v22[0] = v27;
    v29 = v28;
    v17 = PC_CMTimeSaferAdd(v22, &v29, (uint64_t)v20);
    v18 = COERCE_DOUBLE(objc_msgSend(v25, "figTimeToFxTime:withConversionData:", &v21, 0, v17));
    v12 = COERCE_DOUBLE(objc_msgSend(v25, "figTimeToFxTime:withConversionData:", v20, 0)) - v18;
  }
  else
  {
    v22[0] = v28;
    v12 = COERCE_DOUBLE(objc_msgSend(v25, "figTimeToFxTime:withConversionData:", v22, 0));
  }
LABEL_19:
  ProCore_Impl::PCNSRefImpl::release(&v25);
  ProCore_Impl::PCNSRefImpl::release(&v26);
  return v12;
}

- (double)timelineTimeFromInputTime:(double)a3 forFilter:(id)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  PCString *v12;
  double v13;
  const __CFString *v14;
  OZFactoryBase *v15;
  void *Instance;
  __shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  OZFxPlugSharedLock *v29;
  __shared_weak_count *v30;
  OZLocking *v31[2];
  PCString v32[2];
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v37;
  id v38;
  id v39;

  v38 = 0;
  v39 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v37 = cntrl;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v34, (uint64_t)&ptr);
  v9 = (std::__shared_weak_count *)v37;
  if (v37)
  {
    v10 = (unint64_t *)((char *)v37 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = *(PCString **)v34;
  v13 = -1.0;
  if (!*(_QWORD *)v34)
    goto LABEL_28;
  if (((unsigned int (*)(PCString *))v12->var0[5].isa)(v12))
  {
    PCString::PCString(v32, v12 + 19);
    v14 = PCString::ns_str(v32);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI timelineTimeFromInputTime:forFilter:], which returns a frame number, but the plug-in expects a rational time."), v14);
    PCString::~PCString(v32);
LABEL_28:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v34);
    a3 = v13;
    goto LABEL_29;
  }
  {
    v13 = 0.0;
    goto LABEL_28;
  }
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v12, v15);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v32[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v39, (id *)&v32[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v32[0].var0);
  PCMakeNSRefAndRetain<EAGLContext *>(v12[4].var0, (id *)&v32[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v38, (id *)&v32[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v32[0].var0);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v34);
  if (!v39)
  {
    v34 = 0uLL;
    v35 = 0;
    if (v38)
      objc_msgSend(v38, "fxTimeToFigTime:withConversionData:", *(_QWORD *)&a3, 0);
    v17 = self->_fxPlugLock.__cntrl_;
    v29 = self->_fxPlugLock.__ptr_;
    v30 = v17;
    if (v17)
    {
      v18 = (unint64_t *)((char *)v17 + 8);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v31, (uint64_t)&v29);
    v20 = (std::__shared_weak_count *)v30;
    if (v30)
    {
      v21 = (unint64_t *)((char *)v30 + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    if (*(_QWORD *)v31[0])
    {
      v25 = v34;
      v26 = v35;
      (*(void (**)(__int128 *__return_ptr, void *, __int128 *))(*(_QWORD *)v23 + 608))(&v27, v23, &v25);
      *(_OWORD *)&v32[0].var0 = v27;
      v33 = v28;
    }
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v31);
    a3 = COERCE_DOUBLE(objc_msgSend(v38, "figTimeToFxTime:withConversionData:", v32, 0));
  }
LABEL_29:
  ProCore_Impl::PCNSRefImpl::release(&v38);
  ProCore_Impl::PCNSRefImpl::release(&v39);
  return a3;
}

- (double)timelineTimeFromInputATime:(double)a3 forTransition:(id)a4
{
  return -1.0;
}

- (double)timelineTimeFromInputBTime:(double)a3 forTransition:(id)a4
{
  return -1.0;
}

- (double)timelineTimeFromImageTime:(double)a3 forParmId:(unsigned int)a4 forEffect:(id)a5
{
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  const PCString *v13;
  PCString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  BOOL v22;
  uint64_t *v23;
  const void *v24;
  OZChannelBase *v25;
  const void *ImageNode;
  uint64_t v27;
  uint64_t v28;
  CMTime v30;
  CMTime v31[2];
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v33;
  id v34;
  CMTime v35;
  CMTime v36;
  PCString v37[2];
  CMTimeEpoch v38;

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v33 = cntrl;
  v34 = 0;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v31, (uint64_t)&ptr);
  v10 = (std::__shared_weak_count *)v33;
  if (v33)
  {
    v11 = (unint64_t *)((char *)v33 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = *(const PCString **)v31[0].value;
  if (!*(_QWORD *)v31[0].value)
    goto LABEL_12;
  if (((unsigned int (*)(_QWORD))v13->var0[5].isa)(*(_QWORD *)v31[0].value))
  {
    PCString::PCString(v37, v13 + 19);
    v15 = PCString::ns_str(v14);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI timelineTimeFromImageTime:forParmId:forEffect:], which returns a frame number, but the plug-in expects a rational time."), v15);
    PCString::~PCString(v37);
LABEL_12:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v31);
    a3 = -1.0;
    goto LABEL_32;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v13[4].var0, (id *)&v37[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v34, (id *)&v37[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v37[0].var0);
  v16 = objc_msgSend(v34, "channelMap");
  v19 = *(_QWORD *)(v16 + 8);
  v17 = v16 + 8;
  v18 = v19;
  if (!v19)
    goto LABEL_31;
  v20 = v17;
  do
  {
    v21 = *(_DWORD *)(v18 + 32);
    v22 = v21 >= a4;
    if (v21 >= a4)
      v23 = (uint64_t *)v18;
    else
      v23 = (uint64_t *)(v18 + 8);
    if (v22)
      v20 = v18;
    v18 = *v23;
  }
  while (*v23);
  if (v20 != v17 && *(_DWORD *)(v20 + 32) <= a4 && (v24 = *(const void **)(v20 + 40)) != 0)
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v31);
    if (v25)
    {
      ImageNode = OZChanElementOrFootageRef::getImageNode(v25);
      if (ImageNode)
      {
        v27 = (*(uint64_t (**)(const void *))(*(_QWORD *)ImageNode + 104))(ImageNode);
        v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v27 + 232))(v27);
        if (v28)
        {
          (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)v28 + 1128))(v31);
          memset(&v30, 0, sizeof(v30));
          if (v34)
            objc_msgSend(v34, "fxTimeToFigTime:withConversionData:", *(_QWORD *)&a3, 0);
          v35 = v31[0];
          v36 = v30;
          PC_CMTimeSaferAdd(&v36, &v35, (uint64_t)v37);
          *(_OWORD *)&v30.value = *(_OWORD *)&v37[0].var0;
          v30.epoch = v38;
          a3 = COERCE_DOUBLE(objc_msgSend(v34, "figTimeToFxTime:withConversionData:", &v30, 0));
        }
      }
    }
  }
  else
  {
LABEL_31:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v31);
  }
LABEL_32:
  ProCore_Impl::PCNSRefImpl::release(&v34);
  return a3;
}

- (double)inputTimeForFilter:(id)a3 fromTimelineTime:(double)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  PCString *v12;
  double v13;
  OZFactoryBase *v14;
  const __CFString *v15;
  __shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  const void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  OZFxPlugSharedLock *v32;
  __shared_weak_count *v33;
  OZLocking *v34[2];
  PCString v35[2];
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v40;
  id v41;

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v40 = cntrl;
  v41 = 0;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v37, (uint64_t)&ptr);
  v9 = (std::__shared_weak_count *)v40;
  if (v40)
  {
    v10 = (unint64_t *)((char *)v40 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = *(PCString **)v37;
  v13 = -1.0;
  if (!*(_QWORD *)v37)
    goto LABEL_14;
  if (((unsigned int (*)(PCString *))v12->var0[5].isa)(v12))
  {
    PCString::PCString(v35, v12 + 19);
    v15 = PCString::ns_str(v35);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI inputTimeForFilter:fromTimelineTime:], which returns a frame number, but the plug-in expects a rational time."), v15);
    PCString::~PCString(v35);
LABEL_14:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v37);
    goto LABEL_15;
  }
  if (TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v12, v14))
  {
    v13 = a4;
    goto LABEL_14;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v12[4].var0, (id *)&v35[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v41, (id *)&v35[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v35[0].var0);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v37);
  v37 = 0uLL;
  v38 = 0;
  if (v41)
    objc_msgSend(v41, "fxTimeToFigTime:withConversionData:", *(_QWORD *)&a4, 0);
  *(_OWORD *)&v35[0].var0 = *MEMORY[0x1E0CA2E18];
  v36 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v17 = self->_fxPlugLock.__cntrl_;
  v32 = self->_fxPlugLock.__ptr_;
  v33 = v17;
  if (v17)
  {
    v18 = (unint64_t *)((char *)v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v34, (uint64_t)&v32);
  v20 = (std::__shared_weak_count *)v33;
  if (v33)
  {
    v21 = (unint64_t *)((char *)v33 + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = *(const void **)v34[0];
  if (*(_QWORD *)v34[0])
  {
    if (v24)
    {
      v28 = v37;
      v29 = v38;
      (*(void (**)(__int128 *__return_ptr, void *, __int128 *))(*(_QWORD *)v24 + 600))(&v30, v24, &v28);
    }
    else
    {
      v26 = v37;
      v27 = v38;
      (*(void (**)(__int128 *__return_ptr, void *, __int128 *))(*(_QWORD *)v25 + 1144))(&v30, v25, &v26);
    }
    *(_OWORD *)&v35[0].var0 = v30;
    v36 = v31;
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v34);
    v13 = COERCE_DOUBLE(objc_msgSend(v41, "figTimeToFxTime:withConversionData:", v35, 0));
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v34);
    v13 = 0.0;
  }
LABEL_15:
  ProCore_Impl::PCNSRefImpl::release(&v41);
  return v13;
}

- (double)inputATimeForTransition:(id)a3 fromTimelineTime:(double)a4
{
  return -1.0;
}

- (double)inputBTimeForTransition:(id)a3 fromTimelineTime:(double)a4
{
  return -1.0;
}

- (double)imageTimeForParmId:(unsigned int)a3 forEffect:(id)a4 fromTimelineTime:(double)a5
{
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  const PCString *v13;
  PCString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  BOOL v22;
  uint64_t *v23;
  const void *v24;
  OZChannelBase *v25;
  const void *ImageNode;
  uint64_t v27;
  uint64_t v28;
  CMTime v30;
  CMTime v31[2];
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v33;
  id v34;
  CMTime v35;
  CMTime v36;
  PCString v37[2];
  CMTimeEpoch v38;

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v33 = cntrl;
  v34 = 0;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v31, (uint64_t)&ptr);
  v10 = (std::__shared_weak_count *)v33;
  if (v33)
  {
    v11 = (unint64_t *)((char *)v33 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = *(const PCString **)v31[0].value;
  if (!*(_QWORD *)v31[0].value)
    goto LABEL_12;
  if (((unsigned int (*)(_QWORD))v13->var0[5].isa)(*(_QWORD *)v31[0].value))
  {
    PCString::PCString(v37, v13 + 19);
    v15 = PCString::ns_str(v14);
    NSLog(CFSTR("The plug-in %@ called -[FxTimingAPI imageTimeForParmId:forEffect:fromTimelineTime:], which returns a frame number, but the plug-in expects a rational time."), v15);
    PCString::~PCString(v37);
LABEL_12:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v31);
    a5 = -1.0;
    goto LABEL_32;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v13[4].var0, (id *)&v37[0].var0);
  ProCore_Impl::PCNSRefImpl::operator=(&v34, (id *)&v37[0].var0);
  ProCore_Impl::PCNSRefImpl::release((id *)&v37[0].var0);
  v16 = objc_msgSend(v34, "channelMap");
  v19 = *(_QWORD *)(v16 + 8);
  v17 = v16 + 8;
  v18 = v19;
  if (!v19)
    goto LABEL_31;
  v20 = v17;
  do
  {
    v21 = *(_DWORD *)(v18 + 32);
    v22 = v21 >= a3;
    if (v21 >= a3)
      v23 = (uint64_t *)v18;
    else
      v23 = (uint64_t *)(v18 + 8);
    if (v22)
      v20 = v18;
    v18 = *v23;
  }
  while (*v23);
  if (v20 != v17 && *(_DWORD *)(v20 + 32) <= a3 && (v24 = *(const void **)(v20 + 40)) != 0)
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v31);
    if (v25)
    {
      ImageNode = OZChanElementOrFootageRef::getImageNode(v25);
      if (ImageNode)
      {
        v27 = (*(uint64_t (**)(const void *))(*(_QWORD *)ImageNode + 104))(ImageNode);
        v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v27 + 232))(v27);
        if (v28)
        {
          (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)v28 + 1128))(v31);
          memset(&v30, 0, sizeof(v30));
          if (v34)
            objc_msgSend(v34, "fxTimeToFigTime:withConversionData:", *(_QWORD *)&a5, 0);
          v35 = v31[0];
          v36 = v30;
          PC_CMTimeSaferSubtract(&v36, &v35, (uint64_t)v37);
          *(_OWORD *)&v30.value = *(_OWORD *)&v37[0].var0;
          v30.epoch = v38;
          a5 = COERCE_DOUBLE(objc_msgSend(v34, "figTimeToFxTime:withConversionData:", &v30, 0));
        }
      }
    }
  }
  else
  {
LABEL_31:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v31);
  }
LABEL_32:
  ProCore_Impl::PCNSRefImpl::release(&v34);
  return a5;
}

- (unint64_t)fieldOrderForInputToFilter:(id)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD *v9;
  const void *v10;
  OZImageElement *v11;
  OZFootage *Footage;
  int FieldDominance;
  unint64_t v14;
  CMTime v16;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v18;
  OZLocking *v19[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v18 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v19, (uint64_t)&ptr);
  v6 = (std::__shared_weak_count *)v18;
  if (v18)
  {
    v7 = (unint64_t *)((char *)v18 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (*(_QWORD *)v19[0]
  {
    v16 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    FieldDominance = OZFootage::getFieldDominance(Footage, &v16);
    if (FieldDominance == 1)
      v14 = 1;
    else
      v14 = 2 * (FieldDominance == 2);
  }
  else
  {
    v14 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v19);
  return v14;
}

- (unint64_t)fieldOrderForInputAToTransition:(id)a3
{
  return 0;
}

- (unint64_t)fieldOrderForInputBToTransition:(id)a3
{
  return 0;
}

- (unint64_t)fieldOrderForImageParm:(unsigned int)a3 forEffect:(id)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  uint64_t *v18;
  const void *ImageNode;
  OZFootage *v20;
  int FieldDominance;
  unint64_t v22;
  CMTime v24;
  id v25;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v27;
  OZLocking *v28[2];
  id v29;

  v29 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v27 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v28, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v27;
  if (v27)
  {
    v9 = (unint64_t *)((char *)v27 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (!*(_QWORD *)v28[0])
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v28);
LABEL_28:
    v22 = 0;
    goto LABEL_29;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(*(void **)(*(_QWORD *)v28[0] + 32), &v25);
  ProCore_Impl::PCNSRefImpl::operator=(&v29, &v25);
  ProCore_Impl::PCNSRefImpl::release(&v25);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v28);
  if (!v29)
    goto LABEL_28;
  v11 = objc_msgSend(v29, "channelMap");
  v14 = *(_QWORD *)(v11 + 8);
  v12 = v11 + 8;
  v13 = v14;
  if (!v14)
    goto LABEL_28;
  v15 = v12;
  do
  {
    v16 = *(_DWORD *)(v13 + 32);
    v17 = v16 >= a3;
    if (v16 >= a3)
      v18 = (uint64_t *)v13;
    else
      v18 = (uint64_t *)(v13 + 8);
    if (v17)
      v15 = v13;
    v13 = *v18;
  }
  while (*v18);
  if (v15 == v12)
    goto LABEL_28;
  if (*(_DWORD *)(v15 + 32) > a3)
    goto LABEL_28;
  ImageNode = OZChanElementOrFootageRef::getImageNode(*(OZChannelBase **)(v15 + 40));
  if (!ImageNode)
    goto LABEL_28;
  if (!v20)
    goto LABEL_28;
  v24 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  FieldDominance = OZFootage::getFieldDominance(v20, &v24);
  if (FieldDominance == 1)
    v22 = 1;
  else
    v22 = 2 * (FieldDominance == 2);
LABEL_29:
  ProCore_Impl::PCNSRefImpl::release(&v29);
  return v22;
}

- (double)transitionTimeFractionAtTime:(double)a3
{
  return 0.0;
}

- (void)frameDuration:(id *)a3
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)0x3FF0000000000000;
}

- (void)sampleDuration:(id *)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  TXParagraphStyleFolder_Factory *v10;
  uint64_t v11;
  int v12;
  OZFactoryBase *v13;
  void *Instance;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18[3];
  __n128 v19;
  uint64_t v20;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v22;
  id v23;

  v23 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v22 = cntrl;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v19, (uint64_t)&ptr);
  v7 = (std::__shared_weak_count *)v22;
  if (v22)
  {
    v8 = (unint64_t *)((char *)v22 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = *(TXParagraphStyleFolder_Factory **)v19.n128_u64[0];
  if (*(_QWORD *)v19.n128_u64[0])
  {
    v11 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v10 + 32))(*(_QWORD *)v19.n128_u64[0]);
    v12 = (*(uint64_t (**)(TXParagraphStyleFolder_Factory *))(*(_QWORD *)v10 + 160))(v10);
    Instance = (void *)TXParagraphStyleFolder_Factory::createInstance(v10, v13);
    PCMakeNSRefAndRetain<EAGLContext *>(Instance, v18);
    ProCore_Impl::PCNSRefImpl::operator=(&v23, v18);
    ProCore_Impl::PCNSRefImpl::release(v18);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v19);
    if (v11)
    {
      v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 272))(v11);
      v16 = v15;
      if (v15)
      {
        if (v12)
        {
          v19 = 0uLL;
          v20 = 0;
          OZSceneSettings::getFrameDuration((OZSceneSettings *)(v15 + 336), &v19);
          if (*(_DWORD *)(v16 + 480))
            operator/((__int128 *)&v19, 2, (uint64_t)v18);
        }
        else
        {
          if (*(_DWORD *)(v15 + 480))
            v17 = 0x3FE0000000000000;
          else
            v17 = 0x3FF0000000000000;
          a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v17;
        }
      }
    }
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v19);
  }
  ProCore_Impl::PCNSRefImpl::release(&v23);
}

- (void)startFxTimeForEffect:(id *)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  OZFactoryBase *v14;
  uint64_t Instance;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  __int128 *v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v25;
  OZLocking *v26[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v25 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v26, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v25;
  if (v25)
  {
    v9 = (unint64_t *)((char *)v25 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = *(_QWORD *)v26[0];
  if (*(_QWORD *)v26[0])
  {
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 160))(v11) & 1) != 0)
    {
      Instance = TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v11, v14);
      if (v12)
        (*(void (**)(__int128 *__return_ptr, void *))(*(_QWORD *)v12 + 592))(&v20, v12);
      else
        (*(void (**)(__int128 *__return_ptr, void *))(*(_QWORD *)v13 + 1128))(&v20, v13);
      v22 = v20;
      v23 = v21;
      if (Instance)
        v17 = (__int128 *)objc_msgSend(*(id *)(v11 + 32), "figTimeToFxTime:withConversionData:", &v22, 0);
      else
        v17 = &v22;
      var1 = a3->var1;
      v19 = *v17;
      *((_QWORD *)var1 + 2) = *((_QWORD *)v17 + 2);
      *(_OWORD *)var1 = v19;
    }
    else
    {
      -[OZFxPlugTimingAPI startTimeForEffect:](self, "startTimeForEffect:", *(_QWORD *)(v11 + 24));
      a3->var1 = v16;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v26);
}

- (void)durationFxTimeForEffect:(id *)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  OZFactoryBase *v14;
  uint64_t Instance;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  void *v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime v25[2];
  CMTime v26;
  CMTime v27;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v29;
  OZLocking *v30[2];
  CMTime v31;

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v29 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v30, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v9 = (unint64_t *)((char *)v29 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = *(_QWORD **)v30[0];
  if (*(_QWORD *)v30[0])
  {
    if (((*(uint64_t (**)(_QWORD *))(*v11 + 160))(v11) & 1) != 0)
    {
      Instance = TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v11, v14);
      if (v12)
        (*(void (**)(CMTime *__return_ptr, void *))(*(_QWORD *)v12 + 592))(v25, v12);
      else
        (*(void (**)(CMTime *__return_ptr, void *))(*(_QWORD *)v13 + 1128))(v25, v13);
      v26 = v25[0];
      v27 = v25[1];
      if (Instance)
      {
        memset(&v24, 0, sizeof(v24));
        v25[0] = v26;
        v31 = v27;
        PC_CMTimeSaferAdd(v25, &v31, (uint64_t)&v24);
        v23 = v26;
        v22 = v24;
        v17 = (void *)v11[4];
        objc_msgSend(v17, "figTimeToFxTime:withConversionData:", &v23, 0);
        objc_msgSend(v17, "figTimeToFxTime:withConversionData:", &v22, 0);
        v25[0] = v22;
        v31 = v23;
        PC_CMTimeSaferSubtract(v25, &v31, (uint64_t)&v20);
        var1 = a3->var1;
        v19 = v20;
        *((_QWORD *)var1 + 2) = v21;
        *(_OWORD *)var1 = v19;
      }
      else
      {
        *(CMTime *)a3->var1 = v27;
      }
    }
    else
    {
      -[OZFxPlugTimingAPI durationForEffect:](self, "durationForEffect:", v11[3]);
      a3->var1 = v16;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v30);
}

- (void)startFxTimeOfInputToFilter:(id *)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v20;
  OZLocking *v21[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v20 = cntrl;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v21, (uint64_t)&ptr);
  v7 = (std::__shared_weak_count *)v20;
  if (v20)
  {
    v8 = (unint64_t *)((char *)v20 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = *(_QWORD **)v21[0];
  if (*(_QWORD *)v21[0])
  {
    v11 = (void *)v10[4];
    (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)objc_msgSend(v11, "getSceneNode") + 1128))(&v17);
    v15 = v17;
    v16 = v18;
    v12 = objc_msgSend(v11, "figTimeToFxTime:withConversionData:", &v15, 0);
    if ((*(unsigned int (**)(_QWORD *))(*v10 + 160))(v10))
    {
      var1 = a3->var1;
      v14 = *(_OWORD *)v12;
      *((_QWORD *)var1 + 2) = *(_QWORD *)(v12 + 16);
      *(_OWORD *)var1 = v14;
    }
    else
    {
      a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v12;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v21);
}

- (void)durationFxTimeOfInputToFilter:(id *)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  void **v11;
  char v12;
  OZFactoryBase *v13;
  void *Instance;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  OZLocking *v18[3];
  __int128 v19;
  uint64_t v20;
  id v21;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v23;
  id v24;
  id v25;
  id v26;

  v25 = 0;
  v26 = 0;
  v24 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v23 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v18, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v23;
  if (v23)
  {
    v9 = (unint64_t *)((char *)v23 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = *(void ***)v18[0];
  if (*(_QWORD *)v18[0])
  {
    v12 = (*((uint64_t (**)(_QWORD))*v11 + 20))(*(_QWORD *)v18[0]);
    PCMakeNSRefAndRetain<EAGLContext *>(v11[4], &v21);
    ProCore_Impl::PCNSRefImpl::operator=(&v26, &v21);
    ProCore_Impl::PCNSRefImpl::release(&v21);
    Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v11, v13);
    PCMakeNSRefAndRetain<EAGLContext *>(Instance, &v21);
    ProCore_Impl::PCNSRefImpl::operator=(&v25, &v21);
    ProCore_Impl::PCNSRefImpl::release(&v21);
    PCMakeNSRefAndRetain<EAGLContext *>(v11[3], &v21);
    ProCore_Impl::PCNSRefImpl::operator=(&v24, &v21);
    ProCore_Impl::PCNSRefImpl::release(&v21);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v18);
    if ((v12 & 1) != 0)
    {
      (*(void (**)(OZLocking **__return_ptr))(*(_QWORD *)objc_msgSend(v26, "getSceneNode") + 1128))(v18);
      var1 = a3->var1;
      v16 = v19;
      *((_QWORD *)var1 + 2) = v20;
      *(_OWORD *)var1 = v16;
    }
    else
    {
      -[OZFxPlugTimingAPI durationOfInputToFilter:](self, "durationOfInputToFilter:", v24);
      a3->var1 = v17;
    }
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v18);
  }
  ProCore_Impl::PCNSRefImpl::release(&v24);
  ProCore_Impl::PCNSRefImpl::release(&v25);
  ProCore_Impl::PCNSRefImpl::release(&v26);
}

- (void)startFxTime:(id *)a3 ofImageParam:(unsigned int)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  BOOL v19;
  uint64_t *v20;
  OZChannelBase *v21;
  void *Node;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v30;
  id v31;

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v30 = cntrl;
  v31 = 0;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v27, (uint64_t)&ptr);
  v10 = (std::__shared_weak_count *)v30;
  if (v30)
  {
    v11 = (unint64_t *)((char *)v30 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (!*(_QWORD *)v27)
    goto LABEL_21;
  PCMakeNSRefAndRetain<EAGLContext *>(*(void **)(*(_QWORD *)v27 + 32), (id *)&v25);
  ProCore_Impl::PCNSRefImpl::operator=(&v31, (id *)&v25);
  ProCore_Impl::PCNSRefImpl::release((id *)&v25);
  v13 = objc_msgSend(v31, "channelMap");
  v16 = *(_QWORD *)(v13 + 8);
  v14 = v13 + 8;
  v15 = v16;
  if (!v16)
    goto LABEL_21;
  v17 = v14;
  do
  {
    v18 = *(_DWORD *)(v15 + 32);
    v19 = v18 >= a4;
    if (v18 >= a4)
      v20 = (uint64_t *)v15;
    else
      v20 = (uint64_t *)(v15 + 8);
    if (v19)
      v17 = v15;
    v15 = *v20;
  }
  while (*v20);
  if (v17 != v14 && *(_DWORD *)(v17 + 32) <= a4)
  {
    v21 = *(OZChannelBase **)(v17 + 40);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v27);
    if (v21)
    {
      Node = OZChanSceneNodeRef::getNode(v21);
      if (Node)
      {
        (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)Node + 1128))(&v27);
        v25 = v27;
        v26 = v28;
        -[OZFxPlugTimingAPI copyFxTime:toFxTime:](self, "copyFxTime:toFxTime:", objc_msgSend(v31, "figTimeToFxTime:withConversionData:", &v25, 0), a3);
      }
      else
      {
        var1 = a3->var1;
        v24 = *MEMORY[0x1E0CA2E18];
        *((_QWORD *)var1 + 2) = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        *(_OWORD *)var1 = v24;
      }
    }
  }
  else
  {
LABEL_21:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v27);
  }
  ProCore_Impl::PCNSRefImpl::release(&v31);
}

- (void)durationFxTime:(id *)a3 ofImageParm:(unsigned int)a4
{
  uint64_t v4;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  TXParagraphStyleFolder_Factory *v13;
  uint64_t v14;
  OZFactoryBase *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  uint64_t *v22;
  const void *v23;
  OZChannelBase *v24;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v25;
  void *Instance;
  const void *ImageNode;
  OZImageElement *v28;
  void *Node;
  double v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  CMTime v36;
  CMTime v37;
  CMTime v38[2];
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v40;
  id v41;
  id v42;
  CMTime v43;
  CMTime v44;

  v4 = *(_QWORD *)&a4;
  v41 = 0;
  v42 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v40 = cntrl;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v38, (uint64_t)&ptr);
  v10 = (std::__shared_weak_count *)v40;
  if (v40)
  {
    v11 = (unint64_t *)((char *)v40 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = *(TXParagraphStyleFolder_Factory **)v38[0].value;
  if (!*(_QWORD *)v38[0].value)
    goto LABEL_25;
  if (((*(uint64_t (**)(_QWORD))(*(_QWORD *)v13 + 160))(*(_QWORD *)v38[0].value) & 1) == 0)
  {
    -[OZFxPlugTimingAPI durationOfImageParm:forEffect:](self, "durationOfImageParm:forEffect:", v4, *((_QWORD *)v13 + 3));
    a3->var1 = v25;
LABEL_25:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v38);
    goto LABEL_36;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(*((void **)v13 + 4), (id *)&v44);
  ProCore_Impl::PCNSRefImpl::operator=(&v41, (id *)&v44);
  ProCore_Impl::PCNSRefImpl::release((id *)&v44);
  v14 = objc_msgSend(v41, "channelMap");
  v18 = *(_QWORD *)(v14 + 8);
  v16 = v14 + 8;
  v17 = v18;
  if (!v18)
    goto LABEL_26;
  v19 = v16;
  do
  {
    v20 = *(_DWORD *)(v17 + 32);
    v21 = v20 >= v4;
    if (v20 >= v4)
      v22 = (uint64_t *)v17;
    else
      v22 = (uint64_t *)(v17 + 8);
    if (v21)
      v19 = v17;
    v17 = *v22;
  }
  while (*v22);
  if (v19 != v16 && *(_DWORD *)(v19 + 32) <= v4 && (v23 = *(const void **)(v19 + 40)) != 0)
  else
LABEL_26:
    v24 = 0;
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance(v13, v15);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v44);
  ProCore_Impl::PCNSRefImpl::operator=(&v42, (id *)&v44);
  ProCore_Impl::PCNSRefImpl::release((id *)&v44);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v38);
  if (v24)
  {
    ImageNode = OZChanElementOrFootageRef::getImageNode(v24);
    if (!ImageNode)
      goto LABEL_34;
    if (v42 && v28)
      OZImageElement::isBackgroundDropZone(v28);
    Node = OZChanSceneNodeRef::getNode(v24);
    if (Node)
    {
      (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)Node + 1128))(v38);
      v37 = v38[0];
      memset(&v36, 0, sizeof(v36));
      v44 = v38[1];
      v43 = v38[0];
      v30 = PC_CMTimeSaferAdd(&v44, &v43, (uint64_t)&v36);
      objc_msgSend(v41, "figTimeToFxTime:withConversionData:", &v37, 0, v30);
      objc_msgSend(v41, "figTimeToFxTime:withConversionData:", &v36, 0);
      v34 = 0uLL;
      v35 = 0;
      v44 = v36;
      v43 = v37;
      PC_CMTimeSaferSubtract(&v44, &v43, (uint64_t)&v34);
      var1 = a3->var1;
      v32 = v34;
      v33 = v35;
    }
    else
    {
LABEL_34:
      var1 = a3->var1;
      v32 = *MEMORY[0x1E0CA2E18];
      v33 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    }
    *((_QWORD *)var1 + 2) = v33;
    *(_OWORD *)var1 = v32;
  }
LABEL_36:
  ProCore_Impl::PCNSRefImpl::release(&v41);
  ProCore_Impl::PCNSRefImpl::release(&v42);
}

- (void)inPointFxTimeOfTimelineForEffect:(id *)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  OZFactoryBase *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  void **v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 v14;
  OZScene *v15;
  uint64_t PlayRange;
  __int128 v17;
  uint64_t v18;
  id v19;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v21;
  id v22;

  v22 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v21 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v17, (uint64_t)&ptr);
  v9 = (std::__shared_weak_count *)v21;
  if (v21)
  {
    v10 = (unint64_t *)((char *)v21 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = *(void ***)v17;
  if (!*(_QWORD *)v17)
    goto LABEL_16;
  if (TXParagraphStyleFolder_Factory::createInstance(*(TXParagraphStyleFolder_Factory **)v17, v8))
  {
    if ((*((unsigned int (**)(void **))*v12 + 20))(v12))
    {
      var1 = a3->var1;
      v14 = *MEMORY[0x1E0CA2E68];
      *((_QWORD *)var1 + 2) = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      *(_OWORD *)var1 = v14;
    }
    else
    {
      a3->var1 = 0;
    }
LABEL_16:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v17);
    goto LABEL_17;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v12[4], &v19);
  ProCore_Impl::PCNSRefImpl::operator=(&v22, &v19);
  ProCore_Impl::PCNSRefImpl::release(&v19);
  v15 = (OZScene *)objc_msgSend(v22, "getScene");
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v17);
  if (v15)
  {
    PlayRange = OZScene::getPlayRange(v15);
    v17 = *(_OWORD *)PlayRange;
    v18 = *(_QWORD *)(PlayRange + 16);
    -[OZFxPlugTimingAPI copyFxTime:toFxTime:](self, "copyFxTime:toFxTime:", objc_msgSend(v22, "figTimeToFxTime:withConversionData:", &v17, 0), a3);
  }
LABEL_17:
  ProCore_Impl::PCNSRefImpl::release(&v22);
}

- (void)outPointFxTimeOfTimelineForEffect:(id *)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  void **v11;
  OZFactoryBase *v12;
  void *Instance;
  OZScene *v14;
  uint64_t PlayRange;
  double v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 v18;
  uint64_t v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  __int128 v21;
  uint64_t v22;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v24;
  id v25;
  id v26;
  CMTime v27;
  CMTime v28;

  v25 = 0;
  v26 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v24 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v28, (uint64_t)&ptr);
  v8 = (std::__shared_weak_count *)v24;
  if (v24)
  {
    v9 = (unint64_t *)((char *)v24 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = *(void ***)v28.value;
  if (!*(_QWORD *)v28.value)
    goto LABEL_14;
  if (((*((uint64_t (**)(void **))*v11 + 20))(v11) & 1) == 0)
  {
    -[OZFxPlugTimingAPI outPointOfTimelineForEffect:](self, "outPointOfTimelineForEffect:", v11[3]);
    a3->var1 = v20;
LABEL_14:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v28);
    goto LABEL_17;
  }
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v11, v12);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v27);
  ProCore_Impl::PCNSRefImpl::operator=(&v26, (id *)&v27);
  ProCore_Impl::PCNSRefImpl::release((id *)&v27);
  PCMakeNSRefAndRetain<EAGLContext *>(v11[4], (id *)&v27);
  ProCore_Impl::PCNSRefImpl::operator=(&v25, (id *)&v27);
  ProCore_Impl::PCNSRefImpl::release((id *)&v27);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v28);
  v14 = -[OZFxPlugTimingAPI scene](self, "scene");
  if (v14)
  {
    PlayRange = OZScene::getPlayRange(v14);
    v27 = *(CMTime *)PlayRange;
    v21 = 0uLL;
    v22 = 0;
    v28 = *(CMTime *)(PlayRange + 24);
    v16 = PC_CMTimeSaferAdd(&v28, &v27, (uint64_t)&v21);
    objc_msgSend(v25, "figTimeToFxTime:withConversionData:", &v21, 0, v16);
    var1 = a3->var1;
    v18 = v21;
    v19 = v22;
  }
  else
  {
    var1 = a3->var1;
    v18 = *MEMORY[0x1E0CA2E68];
    v19 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  }
  *((_QWORD *)var1 + 2) = v19;
  *(_OWORD *)var1 = v18;
LABEL_17:
  ProCore_Impl::PCNSRefImpl::release(&v25);
  ProCore_Impl::PCNSRefImpl::release(&v26);
}

- (void)timelineFxTime:(id *)a3 fromInputTime:(id)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void **v13;
  void *v14;
  OZFactoryBase *v15;
  void *Instance;
  $EBBD99E4BEE052F512DA5DADC73F537E v17;
  __shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  OZLocking **v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  OZFxPlugSharedLock *v30;
  __shared_weak_count *v31;
  OZLocking *v32[2];
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v38;
  id v39;
  id v40;

  v39 = 0;
  v40 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v38 = cntrl;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v35, (uint64_t)&ptr);
  v10 = (std::__shared_weak_count *)v38;
  if (v38)
  {
    v11 = (unint64_t *)((char *)v38 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = *(void ***)v35;
  if (!*(_QWORD *)v35)
  {
    v25 = (OZLocking **)&v35;
    goto LABEL_26;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v13[4], (id *)&v33);
  ProCore_Impl::PCNSRefImpl::operator=(&v40, (id *)&v33);
  ProCore_Impl::PCNSRefImpl::release((id *)&v33);
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v13, v15);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v33);
  ProCore_Impl::PCNSRefImpl::operator=(&v39, (id *)&v33);
  ProCore_Impl::PCNSRefImpl::release((id *)&v33);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v35);
  v17.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)-[OZFxPlugTimingAPI zeroTime](self, "zeroTime");
  v35 = *MEMORY[0x1E0CA2E18];
  v36 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  if (v14)
  {
    v33 = 0uLL;
    v34 = 0;
    if (v40)
      objc_msgSend(v40, "fxTimeToFigTime:withConversionData:", a4.var1, 0);
    v18 = self->_fxPlugLock.__cntrl_;
    v30 = self->_fxPlugLock.__ptr_;
    v31 = v18;
    if (v18)
    {
      v19 = (unint64_t *)((char *)v18 + 8);
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v32, (uint64_t)&v30);
    v21 = (std::__shared_weak_count *)v31;
    if (v31)
    {
      v22 = (unint64_t *)((char *)v31 + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    if (*(_QWORD *)v32[0])
    {
      v26 = v33;
      v27 = v34;
      (*(void (**)(__int128 *__return_ptr, void *, __int128 *))(*(_QWORD *)v24 + 608))(&v28, v24, &v26);
      v35 = v28;
      v36 = v29;
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v32);
      v17.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)objc_msgSend(v40, "figTimeToFxTime:withConversionData:", &v35, 0);
      goto LABEL_23;
    }
    v25 = v32;
LABEL_26:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v25);
    goto LABEL_27;
  }
LABEL_23:
  -[OZFxPlugTimingAPI copyFxTime:toFxTime:](self, "copyFxTime:toFxTime:", v17.var1, a3);
LABEL_27:
  ProCore_Impl::PCNSRefImpl::release(&v39);
  ProCore_Impl::PCNSRefImpl::release(&v40);
}

- (void)timelineFxTime:(id *)a3 fromInputATime:(id)a4
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)-[OZFxPlugTimingAPI invalidTime](self, "invalidTime", a3, a4.var1);
}

- (void)timelineFxTime:(id *)a3 fromInputBTime:(id)a4
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)-[OZFxPlugTimingAPI invalidTime](self, "invalidTime", a3, a4.var1);
}

- (void)timelineFxTime:(id *)a3 fromImageTime:(id)a4 forParmId:(unsigned int)a5
{
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  uint64_t *v22;
  const void *v23;
  OZChannelBase *v24;
  const void *ImageNode;
  uint64_t v26;
  uint64_t v27;
  CMTime v28;
  CMTime v29[2];
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v31;
  id v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v31 = cntrl;
  v32 = 0;
  if (cntrl)
  {
    v10 = (unint64_t *)((char *)cntrl + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v29, (uint64_t)&ptr);
  v12 = (std::__shared_weak_count *)v31;
  if (v31)
  {
    v13 = (unint64_t *)((char *)v31 + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (*(_QWORD *)v29[0].value)
  {
    PCMakeNSRefAndRetain<EAGLContext *>(*(void **)(*(_QWORD *)v29[0].value + 32), (id *)&v35);
    ProCore_Impl::PCNSRefImpl::operator=(&v32, (id *)&v35);
    ProCore_Impl::PCNSRefImpl::release((id *)&v35);
    v15 = objc_msgSend(v32, "channelMap");
    v18 = *(_QWORD *)(v15 + 8);
    v16 = v15 + 8;
    v17 = v18;
    if (!v18)
      goto LABEL_28;
    v19 = v16;
    do
    {
      v20 = *(_DWORD *)(v17 + 32);
      v21 = v20 >= a5;
      if (v20 >= a5)
        v22 = (uint64_t *)v17;
      else
        v22 = (uint64_t *)(v17 + 8);
      if (v21)
        v19 = v17;
      v17 = *v22;
    }
    while (*v22);
    if (v19 != v16 && *(_DWORD *)(v19 + 32) <= a5 && (v23 = *(const void **)(v19 + 40)) != 0)
    {
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v29);
      if (v24)
      {
        ImageNode = OZChanElementOrFootageRef::getImageNode(v24);
        if (ImageNode)
        {
          v26 = (*(uint64_t (**)(const void *))(*(_QWORD *)ImageNode + 104))(ImageNode);
          v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 232))(v26);
          if (v27)
          {
            (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)v27 + 1128))(v29);
            memset(&v28, 0, sizeof(v28));
            if (v32)
              objc_msgSend(v32, "fxTimeToFigTime:withConversionData:", a4.var1, 0);
            v33 = v29[0];
            v34 = v28;
            PC_CMTimeSaferAdd(&v34, &v33, (uint64_t)&v35);
            v28 = v35;
            a4.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)objc_msgSend(v32, "figTimeToFxTime:withConversionData:", &v28, 0);
          }
        }
      }
    }
    else
    {
LABEL_28:
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v29);
    }
    -[OZFxPlugTimingAPI copyFxTime:toFxTime:](self, "copyFxTime:toFxTime:", a4.var1, a3);
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v29);
  }
  ProCore_Impl::PCNSRefImpl::release(&v32);
}

- (void)inputFxTime:(id *)a3 fromTimelineTime:(id)a4
{
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void **v13;
  OZFactoryBase *v14;
  void *Instance;
  OZLocking **v16;
  __shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  const void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  OZFxPlugSharedLock *v30;
  __shared_weak_count *v31;
  OZLocking *v32[2];
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v40;
  id v41;
  id v42;

  v41 = 0;
  v42 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v40 = cntrl;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v37, (uint64_t)&ptr);
  v10 = (std::__shared_weak_count *)v40;
  if (v40)
  {
    v11 = (unint64_t *)((char *)v40 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = *(void ***)v37;
  if (!*(_QWORD *)v37)
  {
    v16 = (OZLocking **)&v37;
LABEL_26:
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v16);
    goto LABEL_29;
  }
  PCMakeNSRefAndRetain<EAGLContext *>(v13[4], (id *)&v35);
  ProCore_Impl::PCNSRefImpl::operator=(&v42, (id *)&v35);
  ProCore_Impl::PCNSRefImpl::release((id *)&v35);
  Instance = (void *)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)v13, v14);
  PCMakeNSRefAndRetain<EAGLContext *>(Instance, (id *)&v35);
  ProCore_Impl::PCNSRefImpl::operator=(&v41, (id *)&v35);
  ProCore_Impl::PCNSRefImpl::release((id *)&v35);
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v37);
  v35 = *MEMORY[0x1E0CA2E18];
  v36 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  if (v42)
  {
    objc_msgSend(v42, "fxTimeToFigTime:withConversionData:", a4.var1, 0);
  }
  else
  {
    v33 = 0uLL;
    v34 = 0;
  }
  v37 = v33;
  v38 = v34;
  v17 = self->_fxPlugLock.__cntrl_;
  v30 = self->_fxPlugLock.__ptr_;
  v31 = v17;
  if (v17)
  {
    v18 = (unint64_t *)((char *)v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v32, (uint64_t)&v30);
  v20 = (std::__shared_weak_count *)v31;
  if (v31)
  {
    v21 = (unint64_t *)((char *)v31 + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = *(const void **)v32[0];
  if (!*(_QWORD *)v32[0])
  {
    v16 = v32;
    goto LABEL_26;
  }
  if (v24)
  {
    v28 = v37;
    v29 = v38;
    (*(void (**)(__int128 *__return_ptr, void *, __int128 *))(*(_QWORD *)v24 + 600))(&v33, v24, &v28);
  }
  else
  {
    v26 = v37;
    v27 = v38;
    (*(void (**)(__int128 *__return_ptr, void *, __int128 *))(*(_QWORD *)v25 + 1144))(&v33, v25, &v26);
  }
  v35 = v33;
  v36 = v34;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v32);
  -[OZFxPlugTimingAPI copyFxTime:toFxTime:](self, "copyFxTime:toFxTime:", objc_msgSend(v42, "figTimeToFxTime:withConversionData:", &v35, 0), a3);
LABEL_29:
  ProCore_Impl::PCNSRefImpl::release(&v41);
  ProCore_Impl::PCNSRefImpl::release(&v42);
}

- (void)inputAFxTime:(id *)a3 fromTimelineTime:(id)a4
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)-[OZFxPlugTimingAPI invalidTime](self, "invalidTime", a3, a4.var1);
}

- (void)inputBFxTime:(id *)a3 fromTimelineTime:(id)a4
{
  a3->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)-[OZFxPlugTimingAPI invalidTime](self, "invalidTime", a3, a4.var1);
}

- (void)imageFxTime:(id *)a3 forParmId:(unsigned int)a4 fromTimelineTime:(id)a5
{
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  uint64_t *v22;
  const void *v23;
  OZChannelBase *v24;
  const void *ImageNode;
  uint64_t v26;
  uint64_t v27;
  CMTime v28;
  CMTime v29[2];
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v31;
  id v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v31 = cntrl;
  v32 = 0;
  if (cntrl)
  {
    v10 = (unint64_t *)((char *)cntrl + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v29, (uint64_t)&ptr);
  v12 = (std::__shared_weak_count *)v31;
  if (v31)
  {
    v13 = (unint64_t *)((char *)v31 + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (*(_QWORD *)v29[0].value)
  {
    PCMakeNSRefAndRetain<EAGLContext *>(*(void **)(*(_QWORD *)v29[0].value + 32), (id *)&v35);
    ProCore_Impl::PCNSRefImpl::operator=(&v32, (id *)&v35);
    ProCore_Impl::PCNSRefImpl::release((id *)&v35);
    v15 = objc_msgSend(v32, "channelMap");
    v18 = *(_QWORD *)(v15 + 8);
    v16 = v15 + 8;
    v17 = v18;
    if (!v18)
      goto LABEL_28;
    v19 = v16;
    do
    {
      v20 = *(_DWORD *)(v17 + 32);
      v21 = v20 >= a4;
      if (v20 >= a4)
        v22 = (uint64_t *)v17;
      else
        v22 = (uint64_t *)(v17 + 8);
      if (v21)
        v19 = v17;
      v17 = *v22;
    }
    while (*v22);
    if (v19 != v16 && *(_DWORD *)(v19 + 32) <= a4 && (v23 = *(const void **)(v19 + 40)) != 0)
    {
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v29);
      if (v24)
      {
        ImageNode = OZChanElementOrFootageRef::getImageNode(v24);
        if (ImageNode)
        {
          v26 = (*(uint64_t (**)(const void *))(*(_QWORD *)ImageNode + 104))(ImageNode);
          v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 232))(v26);
          if (v27)
          {
            (*(void (**)(CMTime *__return_ptr))(*(_QWORD *)v27 + 1128))(v29);
            memset(&v28, 0, sizeof(v28));
            if (v32)
              objc_msgSend(v32, "fxTimeToFigTime:withConversionData:", a5.var1, 0);
            v33 = v29[0];
            v34 = v28;
            PC_CMTimeSaferSubtract(&v34, &v33, (uint64_t)&v35);
            v28 = v35;
            a5.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)objc_msgSend(v32, "figTimeToFxTime:withConversionData:", &v28, 0);
          }
        }
      }
    }
    else
    {
LABEL_28:
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v29);
    }
    -[OZFxPlugTimingAPI copyFxTime:toFxTime:](self, "copyFxTime:toFxTime:", a5.var1, a3);
  }
  else
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v29);
  }
  ProCore_Impl::PCNSRefImpl::release(&v32);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOffsetForImageParameter:(SEL)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  uint64_t *v19;
  const void *v20;
  OZChannelBase *v21;
  uint64_t v22;
  void *Node;
  int64_t v24;
  uint64_t v25;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v27;
  int64_t v28;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v30;
  OZLocking *v31[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v30 = cntrl;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v31, (uint64_t)&ptr);
  v9 = (std::__shared_weak_count *)v30;
  if (v30)
  {
    v10 = (unint64_t *)((char *)v30 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (!*(_QWORD *)v31[0])
    goto LABEL_25;
  v12 = objc_msgSend(*(id *)(*(_QWORD *)v31[0] + 32), "channelMap");
  v15 = *(_QWORD *)(v12 + 8);
  v13 = v12 + 8;
  v14 = v15;
  if (!v15)
    goto LABEL_25;
  v16 = v13;
  do
  {
    v17 = *(_DWORD *)(v14 + 32);
    v18 = v17 >= a4;
    if (v17 >= a4)
      v19 = (uint64_t *)v14;
    else
      v19 = (uint64_t *)(v14 + 8);
    if (v18)
      v16 = v14;
    v14 = *v19;
  }
  while (*v19);
  if (v16 == v13 || *(_DWORD *)(v16 + 32) > a4 || (v20 = *(const void **)(v16 + 40)) == 0)
  {
LABEL_25:
    v25 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    v24 = *(_QWORD *)(v25 + 16);
    goto LABEL_26;
  }
  v22 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
  retstr->var3 = *(_QWORD *)(v22 + 16);
  if (v21)
  {
    Node = OZChanSceneNodeRef::getNode(v21);
    if (Node)
    {
      (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)Node + 1128))(&v27);
      *(_OWORD *)&retstr->var0 = v27;
      v24 = v28;
LABEL_26:
      retstr->var3 = v24;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v31);
  return result;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1EF0A79F8 == a3;
}

- (void)scene
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
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)v12[0] + 32), "getScene", ptr);
  else
    v8 = 0;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v12);
  return v8;
}

- (const)sceneSettings
{
  return -[OZFxPlugTimingAPI scene](self, "scene") + 336;
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
