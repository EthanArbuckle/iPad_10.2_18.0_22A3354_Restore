@implementation OZFxPlugHostPrivateAPI

- (OZFxPlugHostPrivateAPI)initWithPluginLock:(shared_ptr<OZFxPlugSharedLock>)a3
{
  uint64_t *ptr;
  OZFxPlugHostPrivateAPI *v4;
  OZFxPlugHostPrivateAPI *v5;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  OZFxPlugSharedBase *v12;
  PCString v14;
  OZFxPlugSharedLock *v15;
  std::__shared_weak_count *v16;
  OZLocking *v17[2];
  objc_super v18;

  ptr = (uint64_t *)a3.__ptr_;
  v18.receiver = self;
  v18.super_class = (Class)OZFxPlugHostPrivateAPI;
  v4 = -[OZFxPlugHostPrivateAPI init](&v18, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    std::shared_ptr<TXTextStyle>::operator=[abi:ne180100](&v4->_fxPlugLock.__ptr_, ptr);
    cntrl = v5->_fxPlugLock.__cntrl_;
    v15 = v5->_fxPlugLock.__ptr_;
    v16 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      v7 = (unint64_t *)((char *)cntrl + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v17, (uint64_t)&v15);
    v9 = v16;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = *(OZFxPlugSharedBase **)v17[0];
    OZFxPlugSharedBase::getPluginUUID(*(const PCString **)v17[0], &v14);
    v5->_pluginUUID = (NSString *)-[__CFString copy]((id)PCString::ns_str(&v14), "copy");
    PCString::~PCString(&v14);
    v5->_sessionID = OZFxPlugSharedBase::getPluginSessionID(v12);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v17);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OZFxPlugHostPrivateAPI;
  -[OZFxPlugHostPrivateAPI dealloc](&v3, sel_dealloc);
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1EF0A3D08 == a3;
}

- (id)URLForMediaFolder
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFURL **v10;
  void *v11;
  void *v12;
  PCString v14;
  PCSharedCount v15;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v17;
  OZLocking *v18[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v17 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v18, (uint64_t)&ptr);
  v5 = (std::__shared_weak_count *)v17;
  if (v17)
  {
    v6 = (unint64_t *)((char *)v17 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (*(_QWORD *)v18[0])
  {
    v8 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)v18[0] + 32))(*(_QWORD *)v18[0]);
    if (v8 && (v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 272))(v8)) != 0)
      v10 = *(const __CFURL ***)(v9 + 1584);
    else
      v10 = 0;
    PCSharedCount::PCSharedCount(&v15);
    if (v10)
    {
      OZDocument::getFilename(v10, (PCURL *)&v14);
      PCString::set((PCString *)&v15, &v14);
      PCString::~PCString(&v14);
    }
    PCString::empty((PCString *)&v15);
    if (PCString::empty((PCString *)&v15))
    {
      v11 = 0;
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", PCString::ns_str((PCString *)&v15));
      v11 = (void *)objc_msgSend((id)objc_msgSend(v12, "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:isDirectory:", CFSTR("Media"), 1);

    }
    PCString::~PCString((PCString *)&v15);
  }
  else
  {
    v11 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v18);
  return v11;
}

- (BOOL)navigateToTime:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  PCPrint("File %s, line %d should not have been reached:\n\t", (uint64_t)a2, (uint64_t)a3.var1, v3, v4, v5, v6, v7, (char)"/Library/Caches/com.apple.xbs/Sources/MotioniOS/Ozone/Effects/FxFilter/OZFxPlugHostPrivateAPI.mm");
  pcAbortImpl();
}

- (BOOL)giveEffectUIFocus
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  void *v8;
  _BOOL8 v9;
  const void *v10;
  void *v11;
  OZScene *v12;
  OZDocument *v13;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v16;
  OZLocking *v17[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v16 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v17, (uint64_t)&ptr);
  v5 = (std::__shared_weak_count *)v16;
  if (v16)
  {
    v6 = (unint64_t *)((char *)v16 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (!*(_QWORD *)v17[0])
    goto LABEL_14;
  v9 = (_BOOL8)v8;
  if (v8)
  {
    v10 = (const void *)(*(uint64_t (**)(void *))(*(_QWORD *)v8 + 248))(v8);
    if (v10)
    {
      if (v11)
      {
        v12 = (OZScene *)(*(uint64_t (**)(void *))(*(_QWORD *)v11 + 272))(v11);
        v13 = (OZDocument *)*((_QWORD *)v12 + 198);
        OZScene::selectObject(v12, (OZObjectManipulator *)(v9 + 48), 0, 0);
        OZDocument::postNotification(v13, 32);
        LOBYTE(v9) = 1;
        goto LABEL_15;
      }
    }
LABEL_14:
    LOBYTE(v9) = 0;
  }
LABEL_15:
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v17);
  return v9;
}

- (float)blendingGamma
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  PCRenderModel *v8;
  float DefaultBlendingGamma;
  float v10;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v13;
  OZLocking *v14[2];

  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v13 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v14, (uint64_t)&ptr);
  v5 = (std::__shared_weak_count *)v13;
  if (v13)
  {
    v6 = (unint64_t *)((char *)v13 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v8 = *(PCRenderModel **)v14[0];
  if (*(_QWORD *)v14[0]
    && (v8 = (PCRenderModel *)(*(uint64_t (**)(PCRenderModel *))(*(_QWORD *)v8 + 24))(v8)) != 0)
  {
    (*(void (**)(PCRenderModel *))(*(_QWORD *)v8 + 296))(v8);
  }
  else
  {
    DefaultBlendingGamma = PCRenderModel::getDefaultBlendingGamma(v8);
  }
  v10 = DefaultBlendingGamma;
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v14);
  return v10;
}

- (id)URLForHostResource:(id)a3 withExtension:(id)a4 subDirectory:(id)a5 inBundle:(id)a6
{
  id v6;

  v6 = a6;
  if (!a6)
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  return (id)objc_msgSend(v6, "URLForResource:withExtension:subdirectory:", a3, a4, a5);
}

- (id)URLForHostResource:(id)a3 withExtension:(id)a4 subDirectory:(id)a5 inBundleWithIdentifier:(id)a6
{
  if (a6)
    a6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", a6);
  return -[OZFxPlugHostPrivateAPI URLForHostResource:withExtension:subDirectory:inBundle:](self, "URLForHostResource:withExtension:subDirectory:inBundle:", a3, a4, a5, a6);
}

- (id)URLForHostResource:(id)a3 withExtension:(id)a4 subDirectory:(id)a5 inBundleWithURL:(id)a6
{
  uint64_t v10;

  if (a6)
    v10 = 0;
  else
    v10 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", 0);
  return -[OZFxPlugHostPrivateAPI URLForHostResource:withExtension:subDirectory:inBundle:](self, "URLForHostResource:withExtension:subDirectory:inBundle:", a3, a4, a5, v10);
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
