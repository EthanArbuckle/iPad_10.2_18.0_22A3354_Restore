@implementation PVVideoCompositing

- (NSDictionary)sourcePixelBufferAttributes
{
  NSDictionary *sourceAttributes;
  NSDictionary *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSDictionary **p_sourceAttributes;
  NSDictionary *v12;
  void *v14;
  _QWORD v15[9];
  _QWORD v16[6];
  _QWORD v17[5];

  v17[3] = *MEMORY[0x1E0C80C00];
  sourceAttributes = self->_sourceAttributes;
  if (!sourceAttributes)
  {
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (+[PVEnvironment PV_DISABLE_YCBCR_INPUTS](PVEnvironment, "PV_DISABLE_YCBCR_INPUTS"))
    {
      v17[0] = &unk_1E6648F28;
      v17[1] = &unk_1E6648F40;
      v17[2] = &unk_1E6648F58;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CA9040]);
      -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
      p_sourceAttributes = &self->_sourceAttributes;
      v12 = *p_sourceAttributes;
      *p_sourceAttributes = v4;

      sourceAttributes = *p_sourceAttributes;
      return sourceAttributes;
    }
    v16[0] = &unk_1E6648FA0;
    v16[1] = &unk_1E6648FB8;
    v16[2] = &unk_1E6648FD0;
    v16[3] = &unk_1E6648FE8;
    v16[4] = &unk_1E6648F40;
    v16[5] = &unk_1E6648F58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = &unk_1E6648F70;
    v15[1] = &unk_1E6648F88;
    v15[2] = &unk_1E6648FA0;
    v15[3] = &unk_1E6648FB8;
    v15[4] = &unk_1E6648FD0;
    v15[5] = &unk_1E6648FE8;
    v15[6] = &unk_1E6648F28;
    v15[7] = &unk_1E6648F40;
    v15[8] = &unk_1E6648F58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVRendererBase compositingContext](self, "compositingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outputColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isHDRSpace"))
    {
      v9 = -[PVVideoCompositing canConformColorOfSourceFrames](self, "canConformColorOfSourceFrames");

      v10 = v14;
      if (!v9)
        goto LABEL_9;
    }
    else
    {

    }
    v10 = v6;
LABEL_9:
    v5 = v10;

    goto LABEL_10;
  }
  return sourceAttributes;
}

- (NSDictionary)requiredPixelBufferAttributesForRenderContext
{
  NSDictionary *destinationBufferPoolAttributes;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSDictionary **p_destinationBufferPoolAttributes;
  NSDictionary *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  destinationBufferPoolAttributes = self->_destinationBufferPoolAttributes;
  if (!destinationBufferPoolAttributes)
  {
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (+[PVEnvironment PV_ENABLE_420V_OUTPUT](PVEnvironment, "PV_ENABLE_420V_OUTPUT"))
    {
      v5 = &unk_1E6648F70;
LABEL_10:
      v17[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CA9040]);

      -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
      p_destinationBufferPoolAttributes = &self->_destinationBufferPoolAttributes;
      v15 = *p_destinationBufferPoolAttributes;
      *p_destinationBufferPoolAttributes = v4;

      destinationBufferPoolAttributes = *p_destinationBufferPoolAttributes;
      return destinationBufferPoolAttributes;
    }
    -[PVRendererBase compositingContext](self, "compositingContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputColorSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isP3d65GammaColorSpace");

    if ((v8 & 1) == 0)
    {
      -[PVRendererBase compositingContext](self, "compositingContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "outputColorSpace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isWideGamutSpace") & 1) != 0)
      {
        -[PVRendererBase compositingContext](self, "compositingContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "gpuRenderAPI");

        if (v12)
        {
          v5 = &unk_1E6648FA0;
          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    v5 = &unk_1E6648F28;
    goto LABEL_10;
  }
  return destinationBufferPoolAttributes;
}

- (BOOL)supportsWideColorSourceFrames
{
  return 1;
}

- (BOOL)supportsHDRSourceFrames
{
  return 1;
}

- (BOOL)canConformColorOfSourceFrames
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = +[PVEnvironment PV_ENABLE_AVF_COLOR_CONFORM_INPUTS](PVEnvironment, "PV_ENABLE_AVF_COLOR_CONFORM_INPUTS");
  -[PVRendererBase compositingContext](self, "compositingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workingColorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRec2020LinearColorSpace");

  return v6 & ~v3;
}

- (PVVideoCompositing)init
{
  char *v2;
  PVVideoCompositing *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PVRenderManager *v9;
  HGSynchronizable *v10;
  HGSynchronizable *v11;
  uint64_t v12;
  void *v13;
  HGSynchronizable *v14;
  HGSynchronizable *v15;
  _QWORD *v16;
  void **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  HGSynchronizable *v22;
  void *v23;
  HGSynchronizable *v24;
  void *v25;
  void *v26;
  void *v27;
  HGSynchronizable *v28;
  id refreshCompletionBlock;
  dispatch_queue_t v30;
  OS_dispatch_queue *refreshCompletionCallbackQueue;
  PVTaskTokenPool *v32;
  PVTaskTokenPool *tokenPool;
  HGSynchronizable *v35;
  char v36;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)PVVideoCompositing;
  v2 = -[PVRendererBase init](&v37, sel_init);
  v3 = (PVVideoCompositing *)v2;
  if (v2)
  {
    if (-[PVVideoCompositing init]::onceToken != -1)
      dispatch_once(&-[PVVideoCompositing init]::onceToken, &__block_literal_global_13);
    v35 = (HGSynchronizable *)sRefCountLock;
    v36 = 0;
    HGSynchronizable::Lock((HGSynchronizable *)sRefCountLock);
    ++sLivingCompositorRefCount;
    v4 = +[PVEnvironment PV_MAX_EXPECTED_LIVE_COMPOSITORS](PVEnvironment, "PV_MAX_EXPECTED_LIVE_COMPOSITORS");
    if (sLivingCompositorRefCount > v4)
    {
      v38[0] = CFSTR("kPVVideoCompositingTooManyLiveCompositorsWarning_LiveCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = CFSTR("kPVVideoCompositingTooManyLiveCompositorsWarning_MaxExpected");
      v39[0] = v5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("kPVVideoCompositingTooManyCompositorsWarning"), v7);

    }
    HGSynchronizer::~HGSynchronizer(&v35);
    PVRenderManager::INSTANCE(v9, &v35);
    v10 = (HGSynchronizable *)*((_QWORD *)v2 + 36);
    v11 = v35;
    if (v10 == v35)
    {
      if (v10)
        (*((void (**)(HGSynchronizable *))v10->var0 + 3))(v10);
    }
    else
    {
      if (v10)
      {
        (*((void (**)(HGSynchronizable *))v10->var0 + 3))(v10);
        v11 = v35;
      }
      *((_QWORD *)v2 + 36) = v11;
    }
    objc_msgSend(v2, "setupTextureFactories");
    PVRenderManager::FreeTexturePools(*((PVRenderManager **)v2 + 36));
    objc_msgSend(v2, "setupEffectScheduler");
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *((_OWORD *)v2 + 7) = *MEMORY[0x1E0CA2E68];
    *((_QWORD *)v2 + 16) = v12;
    +[PVVideoCompositingContext createContextForGPU](PVVideoCompositingContext, "createContextForGPU");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setCompositingContext:", v13);

    v14 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v14);
    *((_QWORD *)v2 + 29) = v14;
    *((_DWORD *)v2 + 60) = 0;
    v15 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v15);
    *((_QWORD *)v2 + 17) = v15;
    v16 = v2 + 144;
    v17 = (void **)v16[1];
    v18 = v16[2];
    v16[5] = 0;
    v19 = v18 - (_QWORD)v17;
    if (v19 >= 0x11)
    {
      do
      {
        operator delete(*v17);
        v20 = v16[2];
        v17 = (void **)(v16[1] + 8);
        v16[1] = v17;
        v19 = v20 - (_QWORD)v17;
      }
      while (v19 > 0x10);
    }
    if (v19 >> 3 == 1)
    {
      v21 = 512;
    }
    else
    {
      if (v19 >> 3 != 2)
      {
LABEL_19:
        v3->_windowedDropTotal = 0;
        v3->_droppedResolution = 0;
        v22 = (HGSynchronizable *)operator new();
        HGSynchronizable::HGSynchronizable(v22);
        v3->_cancelPendingLock = v22;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObserver:selector:name:object:", v3, sel_didRecieveMemoryWarning_, *MEMORY[0x1E0CEB298], 0);

        v24 = (HGSynchronizable *)operator new();
        HGSynchronizable::HGSynchronizable(v24);
        v3->_throttleLock = v24;
        v3->_throttleRequestHandling = 0;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObserver:selector:name:object:", v3, sel_applicationWillTerminate_, *MEMORY[0x1E0CEB360], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObserver:selector:name:object:", v3, sel_didEnterBackground_, *MEMORY[0x1E0CEB288], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObserver:selector:name:object:", v3, sel_willEnterForeground_, *MEMORY[0x1E0CEB350], 0);

        v28 = (HGSynchronizable *)operator new();
        HGSynchronizable::HGSynchronizable(v28);
        v3->_notificationStateLock = v28;
        v3->_hostAppIsShuttingDown = 0;
        v3->_didEnterBackground = 0;
        v3->_thumbnailCompositing = 0;
        v3->_cancelsPendingRequests = 1;
        refreshCompletionBlock = v3->_refreshCompletionBlock;
        v3->_refreshCompletionBlock = 0;

        v30 = dispatch_queue_create("com.apple.PVVideoCompositing.refreshCompletionCallback", 0);
        refreshCompletionCallbackQueue = v3->_refreshCompletionCallbackQueue;
        v3->_refreshCompletionCallbackQueue = (OS_dispatch_queue *)v30;

        v3->_minimumRequestCompletionTimeMS = 0;
        v3->_parentCode = +[PVAVFRenderJobDelegate jobTypeTag](PVAVFRenderJobDelegate, "jobTypeTag");
        v32 = -[PVTaskTokenPool initWithOffset:]([PVTaskTokenPool alloc], "initWithOffset:", +[PVAVFRenderJobDelegate jobTypeTag](PVAVFRenderJobDelegate, "jobTypeTag"));
        tokenPool = v3->_tokenPool;
        v3->_tokenPool = v32;

        return v3;
      }
      v21 = 1024;
    }
    v16[4] = v21;
    goto LABEL_19;
  }
  return v3;
}

void __26__PVVideoCompositing_init__block_invoke()
{
  HGSynchronizable *v0;

  v0 = (HGSynchronizable *)operator new();
  HGSynchronizable::HGSynchronizable(v0);
  sRefCountLock = (uint64_t)v0;
}

- (void)setupTextureFactories
{
  PVRenderManager::SetupTextureFactories(self->_renderManager.m_Obj, 0.5);
}

- (void)setupEffectScheduler
{
  PVEffectScheduler *v3;
  PVEffectScheduler *effectScheduler;
  int64_t v5;

  v3 = objc_alloc_init(PVEffectScheduler);
  effectScheduler = self->_effectScheduler;
  self->_effectScheduler = v3;

  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  *(_OWORD *)&self->_schedulingTime.value = *MEMORY[0x1E0CA2E18];
  self->_schedulingTime.epoch = v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  double v5;
  int v6;
  HGSynchronizable *notificationStateLock;
  HGSynchronizable *throttleLock;
  HGSynchronizable *playerRateLock;
  HGSynchronizable *trackerLock;
  objc_super v11;
  __int128 v12;
  uint64_t v13;
  HGSynchronizable *v14;
  char v15;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB298], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB360], 0);

  -[PVVideoCompositing cancelAllPendingVideoCompositionRequests](self, "cancelAllPendingVideoCompositionRequests");
  v14 = (HGSynchronizable *)sRefCountLock;
  v15 = 0;
  HGSynchronizable::Lock((HGSynchronizable *)sRefCountLock);
  v6 = --sLivingCompositorRefCount;
  if (!sLivingCompositorRefCount)
  {
    LODWORD(v5) = 0;
    -[PVVideoCompositing setPlayerRate:](self, "setPlayerRate:", v5);
    v12 = *MEMORY[0x1E0CA2E18];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    -[PVVideoCompositing setSchedulingTime:](self, "setSchedulingTime:", &v12);
    +[PVInstructionGraphImageSourceNode purgeBitmapCache:](PVInstructionGraphImageSourceNode, "purgeBitmapCache:", 1);
  }
  HGSynchronizer::~HGSynchronizer(&v14);
  -[PVRendererBase printAndClearStats](self, "printAndClearStats");
  PVRenderManager::FlushTextureFactories(self->_renderManager.m_Obj);
  PVRenderManager::TearDownTextureFactories(self->_renderManager.m_Obj);
  if (!v6 && objc_msgSend((id)objc_opt_class(), "flushOnFinalRelease"))
    +[PVEffectResources flushEngine](PVEffectResources, "flushEngine");
  notificationStateLock = self->_notificationStateLock;
  if (notificationStateLock)
    (*((void (**)(HGSynchronizable *))notificationStateLock->var0 + 1))(notificationStateLock);
  throttleLock = self->_throttleLock;
  if (throttleLock)
    (*((void (**)(HGSynchronizable *))throttleLock->var0 + 1))(throttleLock);
  playerRateLock = self->_playerRateLock;
  if (playerRateLock)
    (*((void (**)(HGSynchronizable *))playerRateLock->var0 + 1))(playerRateLock);
  trackerLock = self->_trackerLock;
  if (trackerLock)
    (*((void (**)(HGSynchronizable *))trackerLock->var0 + 1))(trackerLock);
  v11.receiver = self;
  v11.super_class = (Class)PVVideoCompositing;
  -[PVRendererBase dealloc](&v11, sel_dealloc);
}

- (void)renderContextChanged:(id)a3
{
  AVVideoCompositionRenderContext *v4;
  PVVideoCompositingContext *v5;
  PVAVFInstructionGraphContext *v6;
  PVEffectScheduler *effectScheduler;
  PVEffectScheduler *v8;
  AVVideoComposition *videoComposition;
  AVVideoComposition *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  PVAVFInstructionGraphContext *v15;

  v4 = (AVVideoCompositionRenderContext *)a3;
  -[PVRendererBase compositingContext](self, "compositingContext");
  v5 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
  v6 = (PVAVFInstructionGraphContext *)HGObject::operator new(0x88uLL);
  PVAVFInstructionGraphContext::PVAVFInstructionGraphContext(v6, v5, v4, self->_thumbnailCompositing);

  effectScheduler = self->_effectScheduler;
  v15 = v6;
  if (v6)
    (*(void (**)(PVAVFInstructionGraphContext *))(*(_QWORD *)v6 + 16))(v6);
  -[PVEffectScheduler setEffectLoadingRenderContext:](effectScheduler, "setEffectLoadingRenderContext:", &v15);
  if (v15)
    (*(void (**)(PVAVFInstructionGraphContext *))(*(_QWORD *)v15 + 24))(v15);
  v13 = 0uLL;
  v14 = 0;
  -[PVVideoCompositing schedulingTime](self, "schedulingTime");
  if ((unsigned __int128)0 >> 96)
  {
    v8 = self->_effectScheduler;
    -[PVVideoCompositing playerRate](self, "playerRate", v13, v14);
    -[PVEffectScheduler loadEffects:playerRate:](v8, "loadEffects:playerRate:", &v12);
  }
  videoComposition = self->_videoComposition;
  -[AVVideoCompositionRenderContext videoComposition](v4, "videoComposition");
  v10 = (AVVideoComposition *)objc_claimAutoreleasedReturnValue();

  if (videoComposition != v10)
  {
    -[AVVideoCompositionRenderContext videoComposition](v4, "videoComposition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVVideoCompositing videoCompositionChanged:](self, "videoCompositionChanged:", v11);

  }
  -[PVVideoCompositing _validateDestinationBufferColorSpace:](self, "_validateDestinationBufferColorSpace:", v4);
  if (v6)
    (*(void (**)(PVAVFInstructionGraphContext *))(*(_QWORD *)v6 + 24))(v6);

}

- (void)setColorSpacesFromDestinationBuffer:(id)a3
{
  __CVBuffer *v4;
  __CVBuffer *v5;
  CFTypeRef v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (__CVBuffer *)objc_msgSend(a3, "newPixelBuffer");
  if (v4)
  {
    v5 = v4;
    v6 = CVBufferCopyAttachment(v4, (CFStringRef)*MEMORY[0x1E0CA8D68], 0);
    if (!v6)
    {
LABEL_10:
      CVPixelBufferRelease(v5);
      return;
    }
    v7 = v6;
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x1E0CA8D98]))
    {
      +[PVColorSpace p3d65GammaColorSpace](PVColorSpace, "p3d65GammaColorSpace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVRendererBase compositingContext](self, "compositingContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWorkingColorSpace:", v8);

      +[PVColorSpace p3d65GammaColorSpace](PVColorSpace, "p3d65GammaColorSpace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVRendererBase compositingContext](self, "compositingContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setOutputColorSpace:", v10);

      -[PVRendererBase compositingContext](self, "compositingContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWorkingColorSpaceConformIntent:", 0);

      -[PVRendererBase compositingContext](self, "compositingContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBufferFormat:", 24);
    }
    else
    {
      if (!CFEqual(v7, (CFTypeRef)*MEMORY[0x1E0CA8D88]))
      {
LABEL_9:
        CFRelease(v7);
        goto LABEL_10;
      }
      +[PVColorSpace rec709GammaColorSpace](PVColorSpace, "rec709GammaColorSpace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVRendererBase compositingContext](self, "compositingContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWorkingColorSpace:", v14);

      +[PVColorSpace rec709GammaColorSpace](PVColorSpace, "rec709GammaColorSpace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVRendererBase compositingContext](self, "compositingContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOutputColorSpace:", v16);

      -[PVRendererBase compositingContext](self, "compositingContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWorkingColorSpaceConformIntent:", 0);

      -[PVRendererBase compositingContext](self, "compositingContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBufferFormat:", 24);
    }

    goto LABEL_9;
  }
}

- (void)_validateDestinationBufferColorSpace:(id)a3
{
  __CVBuffer *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (__CVBuffer *)objc_msgSend(v11, "newPixelBuffer");
  if (v4)
  {
    +[PVColorSpace pvColorSpaceForCVPixelBuffer:](PVColorSpace, "pvColorSpaceForCVPixelBuffer:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVRendererBase compositingContext](self, "compositingContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputColorSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      -[PVRendererBase compositingContext](self, "compositingContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "outputColorSpace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ WARNING: Destination buffer color space (%@) does not match compositor output color space (%@)"), self, v5, v10);

    }
    CVPixelBufferRelease(v4);

  }
  else
  {
    NSLog(CFSTR("%@ WARNING: unable to validate output color space with null output buffer!"), self);
  }

}

- (void)updateDestinationFormatForOutputColorSpace
{
  if (self->_destinationBufferPoolAttributes)
    NSLog(CFSTR("%@ WARNING: Compositor has already built destination buffer attributes. Cannot change the color space!"), a2, self);
}

- (void)videoCompositionChanged:(id)a3
{
  id v5;
  $95D729B680665BEAEFA1D6FCA8238556 *p_videoCompositionDuration;
  int64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v13[4];
  CMTime rhs;
  CMTime lhs;
  CMTime v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_videoComposition, a3);
  p_videoCompositionDuration = &self->_videoCompositionDuration;
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  *(_OWORD *)&self->_videoCompositionDuration.value = *MEMORY[0x1E0CA2E68];
  self->_videoCompositionDuration.epoch = v7;
  -[AVVideoComposition instructions](self->_videoComposition, "instructions");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        *(_OWORD *)&lhs.value = *(_OWORD *)&p_videoCompositionDuration->value;
        lhs.epoch = self->_videoCompositionDuration.epoch;
        if (v12)
          objc_msgSend(v12, "timeRange");
        else
          memset(v13, 0, sizeof(v13));
        rhs = *(CMTime *)&v13[1];
        CMTimeAdd(&v16, &lhs, &rhs);
        *(_OWORD *)&p_videoCompositionDuration->value = *(_OWORD *)&v16.value;
        self->_videoCompositionDuration.epoch = v16.epoch;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  -[PVEffectScheduler resetSchedule:](self->_effectScheduler, "resetSchedule:", self->_videoComposition);
}

- (void)startVideoCompositionRequest:(id)a3
{
  id v4;
  _BOOL4 hostAppIsShuttingDown;
  void *v6;
  int32_t timescale;
  void *v8;
  PVAVFRenderJobDelegate *v9;
  PVAVFRenderJobDelegate *v10;
  unsigned int throttleRequestHandling;
  int v12;
  void *v13;
  int v14;
  const char *v15;
  const char *v16;
  void *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  _BOOL4 v22;
  const char *v23;
  const char *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  _OWORD v29[3];
  CMTime v30;
  CMTime rhs;
  CMTime lhs;
  CMTime v33;
  CMTime v34;
  CMTime time2;
  CMTime time1;
  CMTime v37;
  CMTime time;

  v4 = a3;
  time.value = (CMTimeValue)self->_notificationStateLock;
  LOBYTE(time.timescale) = 0;
  HGSynchronizable::Lock((HGSynchronizable *)time.value);
  hostAppIsShuttingDown = self->_hostAppIsShuttingDown;
  HGSynchronizer::~HGSynchronizer((HGSynchronizable **)&time);
  if (hostAppIsShuttingDown)
  {
    objc_msgSend(v4, "finishCancelledRequest");
  }
  else
  {
    objc_msgSend(v4, "renderContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVVideoCompositing _validateDestinationBufferColorSpace:](self, "_validateDestinationBufferColorSpace:", v6);

    memset(&v37, 0, sizeof(v37));
    if (v4)
    {
      objc_msgSend(v4, "compositionTime");
      timescale = v37.timescale;
    }
    else
    {
      timescale = 0;
    }
    time1 = v37;
    CMTimeMake(&time2, 0, timescale);
    CMTimeMaximum(&time, &time1, &time2);
    v37 = time;
    v34 = time;
    lhs = (CMTime)self->_videoCompositionDuration;
    CMTimeMake(&rhs, 1, self->_videoCompositionDuration.timescale);
    CMTimeSubtract(&v33, &lhs, &rhs);
    CMTimeMinimum(&time, &v34, &v33);
    v37 = time;
    -[PVTaskTokenPool getToken](self->_tokenPool, "getToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [PVAVFRenderJobDelegate alloc];
    v30 = v37;
    v10 = -[PVAVFRenderJobDelegate initWithCompositor:request:compositionTime:thumbnailCompositing:](v9, "initWithCompositor:request:compositionTime:thumbnailCompositing:", self, v4, &v30, self->_thumbnailCompositing);
    -[PVAVFRenderJobDelegate setMinimumRequestCompletionTimeMS:](v10, "setMinimumRequestCompletionTimeMS:", self->_minimumRequestCompletionTimeMS);
    -[PVAVFRenderJobDelegate setParentCode:](v10, "setParentCode:", -[PVVideoCompositing parentCode](self, "parentCode"));
    -[PVAVFRenderJobDelegate setChildCode:](v10, "setChildCode:", objc_msgSend(v8, "tokenId"));
    -[PVAVFRenderJobDelegate setToken:](v10, "setToken:", v8);
    time.value = (CMTimeValue)self->_throttleLock;
    LOBYTE(time.timescale) = 0;
    HGSynchronizable::Lock((HGSynchronizable *)time.value);
    if (+[PVEnvironment PV_THROTTLE_EXPORT_ON_MEM_WARNING](PVEnvironment, "PV_THROTTLE_EXPORT_ON_MEM_WARNING")&& (throttleRequestHandling = self->_throttleRequestHandling) != 0)
    {
      self->_throttleRequestHandling = throttleRequestHandling - 1;
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
    HGSynchronizer::~HGSynchronizer((HGSynchronizable **)&time);
    objc_msgSend(v4, "renderContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "highQualityRendering");

    if (v14)
    {
      PVRenderManager::FlushTextureFactories(self->_renderManager.m_Obj);
      if (v12)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v15) >= 1)
        {
          -[PVAVFRenderJobDelegate packedFamilyCode](v10, "packedFamilyCode");
          kdebug_trace();
        }
        usleep(0x7A120u);
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v16) >= 1)
        {
          -[PVAVFRenderJobDelegate packedFamilyCode](v10, "packedFamilyCode");
          kdebug_trace();
        }
      }
    }
    if (+[PVEnvironment PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS](PVEnvironment, "PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS"))
    {
      objc_msgSend(v4, "renderContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "highQualityRendering");

      if (v18)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v19) >= 1)
        {
          -[PVAVFRenderJobDelegate packedFamilyCode](v10, "packedFamilyCode");
          kdebug_trace();
        }
        usleep(1000* +[PVEnvironment PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS](PVEnvironment, "PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS"));
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v20) >= 1)
        {
          -[PVAVFRenderJobDelegate packedFamilyCode](v10, "packedFamilyCode");
          kdebug_trace();
        }
      }
    }
    objc_msgSend(v4, "renderContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "highQualityRendering"))
    {
      v22 = +[PVDeviceCharacteristics isLowMemDevice](PVDeviceCharacteristics, "isLowMemDevice");

      if (v22)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v23) >= 1)
        {
          -[PVAVFRenderJobDelegate packedFamilyCode](v10, "packedFamilyCode");
          kdebug_trace();
        }
        usleep(0x88B8u);
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v24) >= 1)
        {
          -[PVAVFRenderJobDelegate packedFamilyCode](v10, "packedFamilyCode");
          kdebug_trace();
        }
      }
    }
    else
    {

    }
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v23) >= 1)
    {
      if (v4)
        objc_msgSend(v4, "compositionTime");
      else
        memset((char *)&v29[1] + 8, 0, 24);
      time = *(CMTime *)((char *)&v29[1] + 8);
      CMTimeGetSeconds(&time);
      -[PVAVFRenderJobDelegate packedFamilyCode](v10, "packedFamilyCode");
      kdebug_trace();
    }
    -[PVRendererBase startJobForDelegate:time:playback:](self, "startJobForDelegate:time:playback:", v10, v29, -[PVVideoCompositing inPlayback](self, "inPlayback", *(_OWORD *)&v37.value, v37.epoch));
    if (+[PVEnvironment PV_SERIALIZE_EXPORT_REQUESTS](PVEnvironment, "PV_SERIALIZE_EXPORT_REQUESTS"))
    {
      objc_msgSend(v4, "renderContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "highQualityRendering");

      if (v26)
        PVRenderJob::WaitForFinish((PVRenderJob *)time.value);
    }
    objc_msgSend(v4, "renderContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12 & objc_msgSend(v27, "highQualityRendering");

    if (v28 == 1)
      PVRenderJob::WaitForFinish((PVRenderJob *)time.value);
    if (time.value)
      (*(void (**)(CMTimeValue))(*(_QWORD *)time.value + 24))(time.value);

  }
}

- (void)setCancelsPendingRequests:(BOOL)a3
{
  HGSynchronizable *cancelPendingLock;
  char v6;

  if (self->_cancelsPendingRequests != a3)
  {
    cancelPendingLock = self->_cancelPendingLock;
    v6 = 0;
    HGSynchronizable::Lock(cancelPendingLock);
    self->_cancelsPendingRequests = a3;
    HGSynchronizer::~HGSynchronizer(&cancelPendingLock);
  }
}

- (void)cancelAllPendingVideoCompositionRequests
{
  HGSynchronizable *cancelPendingLock;
  char v4;

  cancelPendingLock = self->_cancelPendingLock;
  v4 = 0;
  HGSynchronizable::Lock(cancelPendingLock);
  if (self->_cancelsPendingRequests)
    -[PVRendererBase cancelAllPendingRequests](self, "cancelAllPendingRequests");
  HGSynchronizer::~HGSynchronizer(&cancelPendingLock);
}

+ (void)setFlushOnFinalRelease:(BOOL)a3
{
  sFlushOnFinalRelease = a3;
}

+ (BOOL)flushOnFinalRelease
{
  return sFlushOnFinalRelease;
}

- (void)signalScheduling:(id *)a3 playerRate:(float)a4
{
  __int128 v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  -[PVVideoCompositing setPlayerRate:](self, "setPlayerRate:");
  v8 = *a3;
  -[PVVideoCompositing setSchedulingTime:](self, "setSchedulingTime:", &v8);
  -[PVEffectScheduler loadEffects:playerRate:](self->_effectScheduler, "loadEffects:playerRate:", &v7, COERCE_DOUBLE(__PAIR64__(HIDWORD(a3->var0), LODWORD(a4))));
}

- (void)signalSchedulingResetSearch
{
  -[PVEffectScheduler resetSearchPoint](self->_effectScheduler, "resetSearchPoint");
}

- (void)setPlayerRate:(float)a3
{
  int **begin;
  int **end;
  unint64_t v7;
  int **v8;
  unint64_t v9;
  HGSynchronizable *playerRateLock;
  char v11;

  playerRateLock = self->_playerRateLock;
  v11 = 0;
  HGSynchronizable::Lock(playerRateLock);
  if (a3 == 0.0 && self->_playerRate != 0.0)
  {
    -[PVRendererBase printAndClearStats](self, "printAndClearStats");
    self->_windowedDropTotal = 0;
    begin = self->_dropFrameTracker.__map_.__begin_;
    end = self->_dropFrameTracker.__map_.__end_;
    self->_dropFrameTracker.__size_.__value_ = 0;
    v7 = (char *)end - (char *)begin;
    if (v7 >= 0x11)
    {
      do
      {
        operator delete(*begin);
        v8 = self->_dropFrameTracker.__map_.__end_;
        begin = self->_dropFrameTracker.__map_.__begin_ + 1;
        self->_dropFrameTracker.__map_.__begin_ = begin;
        v7 = (char *)v8 - (char *)begin;
      }
      while (v7 > 0x10);
    }
    if (v7 >> 3 == 1)
    {
      v9 = 512;
      goto LABEL_9;
    }
    if (v7 >> 3 == 2)
    {
      v9 = 1024;
LABEL_9:
      self->_dropFrameTracker.__start_ = v9;
    }
  }
  self->_playerRate = a3;
  HGSynchronizer::~HGSynchronizer(&playerRateLock);
  PVRenderManager::SetMinRenderPriority(self->_renderManager.m_Obj, a3 != 0.0);
}

- (BOOL)inPlayback
{
  float v2;

  -[PVVideoCompositing playerRate](self, "playerRate");
  return v2 != 0.0;
}

- (float)playerRate
{
  float playerRate;
  HGSynchronizable *playerRateLock;
  char v6;

  playerRateLock = self->_playerRateLock;
  v6 = 0;
  HGSynchronizable::Lock(playerRateLock);
  playerRate = self->_playerRate;
  HGSynchronizer::~HGSynchronizer(&playerRateLock);
  return playerRate;
}

- (void)setSchedulingTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_schedulingTime.value = *(_OWORD *)&a3->var0;
  self->_schedulingTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)schedulingTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 208);
  return self;
}

- (void)setRefreshCompletionBlock:(id)a3
{
  id v4;
  NSObject *refreshCompletionCallbackQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  refreshCompletionCallbackQueue = self->_refreshCompletionCallbackQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PVVideoCompositing_setRefreshCompletionBlock___block_invoke;
  v7[3] = &unk_1E64D6510;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(refreshCompletionCallbackQueue, v7);

}

void __48__PVVideoCompositing_setRefreshCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1B5E29E00](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 328);
  *(_QWORD *)(v3 + 328) = v2;

}

- (id)refreshCompletionBlock
{
  NSObject *refreshCompletionCallbackQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  refreshCompletionCallbackQueue = self->_refreshCompletionCallbackQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PVVideoCompositing_refreshCompletionBlock__block_invoke;
  v5[3] = &unk_1E64D5490;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(refreshCompletionCallbackQueue, v5);
  v3 = (void *)MEMORY[0x1B5E29E00](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__PVVideoCompositing_refreshCompletionBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1B5E29E00](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 328));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)callRefreshCompletionBlock:(BOOL)a3
{
  NSObject *refreshCompletionCallbackQueue;
  _QWORD v4[5];
  BOOL v5;

  refreshCompletionCallbackQueue = self->_refreshCompletionCallbackQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PVVideoCompositing_callRefreshCompletionBlock___block_invoke;
  v4[3] = &unk_1E64D53A0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(refreshCompletionCallbackQueue, v4);
}

uint64_t __49__PVVideoCompositing_callRefreshCompletionBlock___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 328);
  if (v1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(*(_QWORD *)(result + 32) + 328), *(unsigned __int8 *)(result + 40));
  return result;
}

- (void)renderRequestFinished:(HGRef<PVRenderJob>)a3
{
  void *v5;
  PVTaskTokenPool *tokenPool;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  void *v11;
  void *v12;
  CMTime v13;
  uint64_t v14;
  CMTime time;

  PVRenderJob::GetDelegate(*(PVRenderJob **)a3.var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  tokenPool = self->_tokenPool;
  objc_msgSend(v5, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVTaskTokenPool returnToken:](tokenPool, "returnToken:", v7);

  v8 = *(_QWORD *)a3.var0;
  v14 = v8;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  -[PVRendererBase renderJobFinished:](self, "renderJobFinished:", &v14);
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 24))(v14);
  v9 = PVRenderJob::State(*(PVRenderJob **)a3.var0);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v10) >= 1)
  {
    objc_msgSend(v5, "compositionRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "compositionTime");
    else
      memset(&v13, 0, sizeof(v13));
    time = v13;
    CMTimeGetSeconds(&time);
    objc_msgSend(v5, "packedFamilyCode");
    kdebug_trace();

  }
  time.value = (CMTimeValue)self->_playerRateLock;
  LOBYTE(time.timescale) = 0;
  HGSynchronizable::Lock((HGSynchronizable *)time.value);
  if (self->_playerRate == 0.0)
    -[PVVideoCompositing callRefreshCompletionBlock:](self, "callRefreshCompletionBlock:", v9 == 4);
  HGSynchronizer::~HGSynchronizer((HGSynchronizable **)&time);

}

- (BOOL)shouldDoLowPowerExport
{
  _BOOL4 didEnterBackground;
  void *v4;
  char v5;
  BOOL v6;
  HGSynchronizable *notificationStateLock;
  char v9;

  notificationStateLock = self->_notificationStateLock;
  v9 = 0;
  HGSynchronizable::Lock(notificationStateLock);
  didEnterBackground = self->_didEnterBackground;
  HGSynchronizer::~HGSynchronizer(&notificationStateLock);
  -[PVRendererBase compositingContext](self, "compositingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "powerFriendlyExport");
  if (didEnterBackground)
    v6 = 1;
  else
    v6 = v5;

  return v6;
}

- (void)didRecieveMemoryWarning:(id)a3
{
  HGSynchronizable *throttleLock;
  char v5;

  PVRenderManager::FreeTexturePools(self->_renderManager.m_Obj);
  throttleLock = self->_throttleLock;
  v5 = 0;
  HGSynchronizable::Lock(throttleLock);
  self->_throttleRequestHandling = 10;
  HGSynchronizer::~HGSynchronizer(&throttleLock);
}

- (void)applicationWillTerminate:(id)a3
{
  HGSynchronizable *notificationStateLock;
  char v5;

  notificationStateLock = self->_notificationStateLock;
  v5 = 0;
  HGSynchronizable::Lock(notificationStateLock);
  self->_hostAppIsShuttingDown = 1;
  HGSynchronizer::~HGSynchronizer(&notificationStateLock);
}

- (void)didEnterBackground:(id)a3
{
  uint64_t v4;
  void *v5;
  HGSynchronizable *notificationStateLock;
  char v7;

  notificationStateLock = self->_notificationStateLock;
  v7 = 0;
  HGSynchronizable::Lock(notificationStateLock);
  self->_didEnterBackground = 1;
  v4 = +[PVEnvironment PVPageSizeBackgrounded](PVEnvironment, "PVPageSizeBackgrounded");
  -[PVRendererBase compositingContext](self, "compositingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPageSize:", v4);

  HGSynchronizer::~HGSynchronizer(&notificationStateLock);
}

- (void)willEnterForeground:(id)a3
{
  uint64_t v4;
  void *v5;
  HGSynchronizable *notificationStateLock;
  char v7;

  notificationStateLock = self->_notificationStateLock;
  v7 = 0;
  HGSynchronizable::Lock(notificationStateLock);
  self->_didEnterBackground = 0;
  v4 = +[PVEnvironment PVPageSize](PVEnvironment, "PVPageSize");
  -[PVRendererBase compositingContext](self, "compositingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPageSize:", v4);

  HGSynchronizer::~HGSynchronizer(&notificationStateLock);
}

- (BOOL)thumbnailCompositing
{
  return self->_thumbnailCompositing;
}

- (void)setThumbnailCompositing:(BOOL)a3
{
  self->_thumbnailCompositing = a3;
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (BOOL)cancelsPendingRequests
{
  return self->_cancelsPendingRequests;
}

- (unsigned)minimumRequestCompletionTimeMS
{
  return self->_minimumRequestCompletionTimeMS;
}

- (void)setMinimumRequestCompletionTimeMS:(unsigned int)a3
{
  self->_minimumRequestCompletionTimeMS = a3;
}

- (void).cxx_destruct
{
  PVRenderManager *m_Obj;

  objc_storeStrong(&self->_refreshCompletionBlock, 0);
  objc_storeStrong((id *)&self->_tokenPool, 0);
  objc_storeStrong((id *)&self->_refreshCompletionCallbackQueue, 0);
  m_Obj = self->_renderManager.m_Obj;
  if (m_Obj)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(m_Obj);
  objc_storeStrong((id *)&self->_effectScheduler, 0);
  std::deque<int>::~deque[abi:ne180100](&self->_dropFrameTracker.__map_.__first_);
  objc_storeStrong((id *)&self->_destinationBufferPoolAttributes, 0);
  objc_storeStrong((id *)&self->_sourceAttributes, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_QWORD *)self + 36) = 0;
  return self;
}

@end
