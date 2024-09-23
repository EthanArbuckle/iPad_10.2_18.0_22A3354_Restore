@implementation PAEBaseCorrectorEffect

- (PAEBaseCorrectorEffect)initWithAPIManager:(id)a3
{
  PAEBaseCorrectorEffect *v4;
  PAEBaseCorrectorEffect *v5;
  _DWORD *v6;
  _DWORD *v7;
  FxHostCapabilities *v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEBaseCorrectorEffect;
  v4 = -[PAEBaseCorrectorEffect init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_apiManager = (PROAPIAccessing *)a3;
    v4->_resyncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.paeft.effect", 0);
    v6 = (_DWORD *)operator new();
    *v6 = 0;
    v5->_resyncOnce = v6;
    pthread_mutex_init(&v5->_resyncMutex, 0);
    pthread_cond_init(&v5->_resyncCondition, 0);
    v7 = (_DWORD *)operator new();
    *v7 = 0;
    v5->_actionCount = v7;
    v8 = -[FxHostCapabilities initWithAPIManager:]([FxHostCapabilities alloc], "initWithAPIManager:", v5->_apiManager);
    if (-[FxHostCapabilities hostIsFCP](v8, "hostIsFCP"))
    {
      v9 = 1;
    }
    else
    {
      if (!-[FxHostCapabilities hostIsMotion](v8, "hostIsMotion"))
      {
LABEL_7:

        return v5;
      }
      v9 = 2;
    }
    v5->_hostApplication = v9;
    goto LABEL_7;
  }
  return v5;
}

- (void)dealloc
{
  void *resyncOnce;
  void *actionCount;
  objc_super v5;

  pthread_mutex_destroy(&self->_resyncMutex);
  pthread_cond_destroy(&self->_resyncCondition);
  dispatch_release((dispatch_object_t)self->_resyncQueue);
  resyncOnce = self->_resyncOnce;
  if (resyncOnce)
    MEMORY[0x1B5E29170](resyncOnce, 0x1000C4052888210);
  actionCount = self->_actionCount;
  if (actionCount)
    MEMORY[0x1B5E29170](actionCount, 0x1000C4052888210);
  v5.receiver = self;
  v5.super_class = (Class)PAEBaseCorrectorEffect;
  -[PAEBaseCorrectorEffect dealloc](&v5, sel_dealloc);
}

- (BOOL)hostIsFCP
{
  return self->_hostApplication == 1;
}

- (BOOL)hostIsMotion
{
  return self->_hostApplication == 2;
}

- (void)newNodeForCorrector
{
  return 0;
}

- (BOOL)overrideRender:(id)a3 withOutputImage:(id)a4 inputImage:(id)a5 input:(void *)a6 withInfo:(id *)a7
{
  return 0;
}

- (id)properties
{
  if (-[PAEBaseCorrectorEffect properties]::once != -1)
    dispatch_once(&-[PAEBaseCorrectorEffect properties]::once, &__block_literal_global_26);
  return (id)-[PAEBaseCorrectorEffect properties]::properties;
}

uint64_t __36__PAEBaseCorrectorEffect_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("PositionIndependent"), MEMORY[0x1E0C9AAA0], CFSTR("MayRemapTime"), MEMORY[0x1E0C9AAB0], CFSTR("SupportsLargeRenderScale"), MEMORY[0x1E0C9AAB0], CFSTR("SupportsHeliumRendering"), v1, CFSTR("SDRWorkingSpace"), v2, CFSTR("HDRWorkingSpace"), v3, CFSTR("AutoColorProcessingSupport"), v4, CFSTR("PixelTransformSupport"), 0);
  -[PAEBaseCorrectorEffect properties]::properties = result;
  return result;
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  return 0;
}

- (BOOL)oscIsPublishable:(BOOL)a3
{
  return 0;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  if (a3)
    *a3 = a5->var0;
  if (a4)
    *a4 = a5->var1;
  return 1;
}

- (void)_resyncOnceAtTime:(id *)a3 apiManager:(id)a4
{
  unsigned int *resyncOnce;
  void *v8;
  _opaque_pthread_t *v9;
  mach_port_t v10;
  NSObject *resyncQueue;
  unsigned int v13;
  char v14;
  pthread_mutex_t *p_resyncMutex;
  char v16;
  pthread_cond_t *p_resyncCondition;
  char v18;
  _QWORD block[7];
  _QWORD v20[8];

  resyncOnce = (unsigned int *)self->_resyncOnce;
  if (-[PAEBaseCorrectorEffect hostIsFCP](self, "hostIsFCP"))
  {
    v8 = (void *)objc_msgSend(a4, "apiForProtocol:", &unk_1EF0B6480);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__PAEBaseCorrectorEffect__resyncOnceAtTime_apiManager___block_invoke;
    v20[3] = &unk_1E64DC430;
    v20[4] = self;
    v20[5] = a4;
    v20[6] = resyncOnce;
    v20[7] = a3;
    objc_msgSend(v8, "performBlockWithinReadLock:", v20);
  }
  else
  {
    v9 = pthread_self();
    v10 = pthread_mach_thread_np(v9);
    while (!__ldaxr(resyncOnce))
    {
      if (!__stlxr(v10, resyncOnce))
      {
        pthread_mutex_lock(&self->_resyncMutex);
        resyncQueue = self->_resyncQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__PAEBaseCorrectorEffect__resyncOnceAtTime_apiManager___block_invoke_2;
        block[3] = &unk_1E64DC458;
        block[4] = self;
        block[5] = a4;
        block[6] = a3;
        dispatch_sync(resyncQueue, block);
        do
          v13 = __ldaxr(resyncOnce);
        while (__stlxr(v13 & 0xFFFFFFFC, resyncOnce));
        pthread_cond_broadcast(&self->_resyncCondition);
        pthread_mutex_unlock(&self->_resyncMutex);
        return;
      }
    }
    __clrex();
    v14 = atomic_load(resyncOnce);
    if ((v14 & 3) != 0)
    {
      p_resyncMutex = &self->_resyncMutex;
      pthread_mutex_lock(&self->_resyncMutex);
      v16 = atomic_load(resyncOnce);
      if ((v16 & 3) != 0)
      {
        p_resyncCondition = &self->_resyncCondition;
        do
        {
          pthread_cond_wait(p_resyncCondition, p_resyncMutex);
          v18 = atomic_load(resyncOnce);
        }
        while ((v18 & 3) != 0);
      }
      pthread_mutex_unlock(p_resyncMutex);
    }
  }
}

uint64_t __55__PAEBaseCorrectorEffect__resyncOnceAtTime_apiManager___block_invoke(uint64_t a1)
{
  _opaque_pthread_t *v2;
  uint64_t result;
  unsigned int *v4;

  v2 = pthread_self();
  result = pthread_mach_thread_np(v2);
  v4 = *(unsigned int **)(a1 + 48);
  while (!__ldaxr(v4))
  {
    if (!__stlxr(result, v4))
      return objc_msgSend(*(id *)(a1 + 32), "resyncOnce:atTime:", *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 56));
  }
  __clrex();
  return result;
}

uint64_t __55__PAEBaseCorrectorEffect__resyncOnceAtTime_apiManager___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resyncOnce:atTime:", *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 48));
}

- (void)_resyncAtTime:(id *)a3 apiManager:(id)a4
{
  BOOL v5;
  void *v9;
  _QWORD v10[7];

  if (atomic_load((unsigned int *)self->_actionCount))
    v5 = 1;
  else
    v5 = a3->var1 == 0;
  if (!v5)
  {
    if (-[PAEBaseCorrectorEffect hostIsFCP](self, "hostIsFCP"))
    {
      v9 = (void *)objc_msgSend(a4, "apiForProtocol:", &unk_1EF0B6480);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__PAEBaseCorrectorEffect__resyncAtTime_apiManager___block_invoke;
      v10[3] = &unk_1E64DC458;
      v10[4] = self;
      v10[5] = a4;
      v10[6] = a3;
      objc_msgSend(v9, "performBlockWithinReadLock:", v10);
    }
    else
    {
      -[PAEBaseCorrectorEffect resync:atTime:](self, "resync:atTime:", a4, a3->var1);
    }
  }
}

uint64_t __51__PAEBaseCorrectorEffect__resyncAtTime_apiManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resync:atTime:", *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 48));
}

- (BOOL)renderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  PROAPIAccessing *apiManager;
  __int128 v10;
  void *v11;
  PROAPIAccessing *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  uint64_t v14;
  BOOL v15;
  void *v17;
  __int128 v18;
  uint64_t v19;
  _OWORD v20[3];
  uint64_t v21;

  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v21 = 0;
  -[PAEBaseCorrectorEffect _resyncOnceAtTime:apiManager:](self, "_resyncOnceAtTime:apiManager:", a5, self->_apiManager);
  -[PAEBaseCorrectorEffect _resyncAtTime:apiManager:](self, "_resyncAtTime:apiManager:", a5, self->_apiManager);
  apiManager = self->_apiManager;
  v10 = *(_OWORD *)&a5->var2;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v10;
  v20[2] = *(_OWORD *)&a5->var4;
  if (-[PAEBaseCorrectorEffect overrideRender:withOutputImage:inputImage:input:withInfo:](self, "overrideRender:withOutputImage:inputImage:input:withInfo:", apiManager, a3, a4, v21, v20))
  {
LABEL_11:
    v15 = 1;
    goto LABEL_12;
  }
  v11 = -[PAEBaseCorrectorEffect newNodeForCorrector](self, "newNodeForCorrector");
  if (v11)
  {
    v12 = self->_apiManager;
    var1 = a5->var0.var1;
    if (!a5->var0.var1)
      var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)MEMORY[0x1E0CA2E68];
    v14 = *((_QWORD *)var1 + 2);
    v18 = *(_OWORD *)var1;
    v19 = v14;
    -[PAEBaseCorrectorEffect setParameters:onNodeCorrector:time:](self, "setParameters:onNodeCorrector:time:", v12, v11, &v18);
    (*(void (**)(void *, _QWORD, uint64_t))(*(_QWORD *)v11 + 120))(v11, 0, v21);
    (*(void (**)(void *))(*(_QWORD *)v11 + 16))(v11);
    v17 = v11;
    objc_msgSend(a3, "setHeliumRef:", &v17);
    if (v17)
      (*(void (**)(void *))(*(_QWORD *)v17 + 24))(v17);
    (*(void (**)(void *))(*(_QWORD *)v11 + 24))(v11);
    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 24))(v21);
  return v15;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  if (a6)
    *a6 = 0;
  if (a5)
    *a5 = 1;
  return 1;
}

- (BOOL)frameCleanup
{
  return 1;
}

- (id)customChannelData:(id)a3 ofParamID:(unsigned int)a4 time:(id *)a5
{
  void *v6;

  v6 = 0;
  -[PAEBaseCorrectorEffect resync:atTime:paramID:customChannelData:](self, "resync:atTime:paramID:customChannelData:", a3, a5, *(_QWORD *)&a4, &v6);
  return v6;
}

- (BOOL)parameterChanged:(id)a3 atTime:(id *)a4 paramID:(unsigned int)a5 customChannelData:(id)a6
{
  return 1;
}

- (BOOL)resync:(id)a3 atTime:(id)a4 paramID:(unsigned int)a5 customChannelData:(id *)a6
{
  return 0;
}

- (PROAPIAccessing)apiManager
{
  return self->_apiManager;
}

- (id)parameterCreationAPI
{
  return (id)-[PROAPIAccessing apiForProtocol:](self->_apiManager, "apiForProtocol:", &unk_1EF0A41C0);
}

- (id)versionsingAPI
{
  return (id)-[PROAPIAccessing apiForProtocol:](self->_apiManager, "apiForProtocol:", &unk_1EF0A8190);
}

+ (id)setterAPI:(id)a3
{
  return (id)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0A7268);
}

+ (id)getterAPI:(id)a3
{
  return (id)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0A70B8);
}

+ (id)keyframingAPI:(id)a3
{
  return (id)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0B6420);
}

+ (id)temporalImageAPI:(id)a3
{
  return (id)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0B0088);
}

+ (unint64_t)colorPrimaries:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0A2958), "colorPrimaries");
}

- (BOOL)isACEScctGammaCorrected
{
  return 0;
}

@end
