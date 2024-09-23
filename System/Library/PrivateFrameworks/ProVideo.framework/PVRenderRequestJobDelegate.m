@implementation PVRenderRequestJobDelegate

+ (unsigned)jobTypeTag
{
  return 12000;
}

- (PVRenderRequestJobDelegate)initWithRequest:(id)a3 completionHandler:(id)a4 pvRenderer:(id)a5
{
  id v9;
  id v10;
  id v11;
  PVRenderRequestJobDelegate *v12;
  PVRenderRequestJobDelegate *v13;
  PVRenderRequestJobDelegate *v14;
  PVRenderManager *v15;
  PVRenderManager *m_Obj;
  PVRenderManager *v17;
  uint64_t v18;
  id m_completionHandler;
  _QWORD *v20;
  PVRenderManager *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PVRenderRequestJobDelegate;
  v12 = -[PVRenderRequestJobDelegate init](&v23, sel_init);
  v13 = v12;
  v14 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->m_request, a3);
    objc_storeStrong((id *)&v13->m_pvRenderer, a5);
    PVRenderManager::INSTANCE(v15, &v22);
    m_Obj = v14->m_renderManager.m_Obj;
    v17 = v22;
    if (m_Obj == v22)
    {
      if (m_Obj)
        (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(m_Obj);
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(m_Obj);
        v17 = v22;
      }
      v14->m_renderManager.m_Obj = v17;
    }
    v18 = MEMORY[0x1B5E29E00](v10);
    m_completionHandler = v14->m_completionHandler;
    v14->m_completionHandler = (id)v18;

    v20 = (_QWORD *)operator new();
    *v20 = 0;
    v20[1] = 0;
    v20[2] = 0;
    v14->m_destinationBitmaps = v20;
  }

  return v14;
}

- (void)dealloc
{
  void *m_destinationBitmaps;
  objc_super v4;
  void **v5;

  m_destinationBitmaps = self->m_destinationBitmaps;
  if (m_destinationBitmaps)
  {
    v5 = (void **)self->m_destinationBitmaps;
    std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1B5E29170](m_destinationBitmaps, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)PVRenderRequestJobDelegate;
  -[PVRenderRequestJobDelegate dealloc](&v4, sel_dealloc);
}

- (unsigned)jobTypeTag
{
  return objc_msgSend((id)objc_opt_class(), "jobTypeTag");
}

- (unsigned)outputCVPixelBufferFormat
{
  unsigned int v3;
  uint64_t v4;

  v3 = -[PVRenderRequest outputCVPixelBufferFormat](self->m_request, "outputCVPixelBufferFormat");
  v4 = 16;
  if (!v3)
    v4 = 8;
  return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "outputCVPixelBufferFormat");
}

- (PVVideoCompositingContext)videoCompositingContext
{
  return -[PVRendererBase compositingContext](self->m_pvRenderer, "compositingContext");
}

- (void)buildGraph:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  PVRenderRequest **p_m_request;
  BOOL v7;
  PVVideoCompositingContext *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  PVRenderer *m_pvRenderer;
  PVRendererInstructionGraphContext *v14;
  void *v15;
  PVRenderRequest *m_request;
  void *v17;
  CMTimeValue value;
  uint64_t timescale;
  void *v20;
  void *v21;
  const char *v22;
  PVRenderRequest *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  uint64_t v27;
  const char *v28;
  char *v29;
  uint64_t Renderer;
  CMTimeValue v31;
  PVRenderRequestJobDelegate *v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  PVRenderRequest *v36;
  HgcHighlightOutOfGamut *v37;
  void *v38;
  void *v39;
  id v40;
  HGNode *v41;
  int v42;
  double v43;
  double v44;
  double v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t DOD;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id obj;
  uint64_t v58;
  uint64_t v59;
  id v61;
  HGNode *v62;
  HGNode *v63;
  PVRendererInstructionGraphContext *v64;
  HGNode *v65[3];
  HGNode *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  CMTime time;
  _QWORD *v72;
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[2];
  CMTime v78;
  void *__p[2];
  char v80;
  CMTime v81;
  CMTime v82;
  _BYTE v83[128];
  uint64_t v84;
  CGSize v85;

  v84 = *MEMORY[0x1E0C80C00];
  p_m_request = &self->m_request;
  -[PVRenderer loadInstructionGraphEffects:](self->m_pvRenderer, "loadInstructionGraphEffects:", self->m_request, a4, a5);
  v7 = -[PVRenderRequest highQuality](*p_m_request, "highQuality");
  -[PVRenderRequest compositingContext](*(p_m_request - 1), "compositingContext");
  v8 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
  -[PVRenderRequest outputSize](*p_m_request, "outputSize");
  v10 = v9;
  v12 = v11;
  m_pvRenderer = self->m_pvRenderer;
  if (m_pvRenderer)
    -[PVRenderer frameDuration](m_pvRenderer, "frameDuration");
  else
    memset(&v82, 0, sizeof(v82));
  v14 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
  time = v82;
  v85.width = v10;
  v85.height = v12;
  PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v14, v8, v85, v7, &time);

  v15 = (void *)MEMORY[0x1E0CB3940];
  m_request = self->m_request;
  if (m_request)
  {
    -[PVRenderRequest time](m_request, "time");
    v17 = (void *)MEMORY[0x1E0CB3940];
    value = v81.value;
    timescale = v81.timescale;
  }
  else
  {
    timescale = 0;
    value = 0;
    memset(&v81, 0, sizeof(v81));
    v17 = (void *)MEMORY[0x1E0CB3940];
  }
  time = v81;
  objc_msgSend(v17, "stringWithFormat:", CFSTR("{%lld/%d = %.3f}"), value, timescale, CMTimeGetSeconds(&time));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("RequestTime: %@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = objc_retainAutorelease(v21);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v55, "UTF8String"));
  PVInstructionGraphContext::AddContextDotNode((id *)v14, (uint64_t)__p);
  if (v80 < 0)
    operator delete(__p[0]);
  if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v22) >= 1)
  {
    v23 = self->m_request;
    if (v23)
      -[PVRenderRequest time](v23, "time");
    else
      memset(&v78, 0, sizeof(v78));
    CMTimeCopyDescription(0, &v78);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = atomic_load(HGLogger::_enabled);
    if ((v26 & 1) != 0)
    {
      v27 = objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Current Time:           %s\n", v28, v29, v27);
    }
    CFRelease(v25);

  }
  time.value = (CMTimeValue)&time.timescale;
  *(_QWORD *)&time.timescale = 0;
  v73[0] = 0;
  v73[1] = 0;
  time.epoch = 0;
  v72 = v73;
  v73[2] = v74;
  v74[0] = 0;
  v75[0] = 0;
  v75[1] = 0;
  v74[1] = 0;
  v74[2] = v75;
  v75[2] = v76;
  v76[0] = 0;
  v77[0] = 0;
  v77[1] = 0;
  v76[1] = 0;
  v76[2] = v77;
  Renderer = HGRenderContext::GetRenderer((HGRenderContext *)a4);
  v31 = Renderer;
  if (Renderer)
    (*(void (**)(uint64_t))(*(_QWORD *)Renderer + 16))(Renderer);
  v82.value = v31;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v32 = self;
  -[PVRenderRequest outputNodes](self->m_request, "outputNodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
  if (v33)
  {
    v58 = *(_QWORD *)v68;
    do
    {
      v59 = v33;
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v68 != v58)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        v36 = v32->m_request;
        if (v36)
          -[PVRenderRequest time](v36, "time");
        else
          memset(v65, 0, sizeof(v65));
        v64 = v14;
        if (v14)
          (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v14 + 16))(v14);
        if (v35)
          objc_msgSend(v35, "hgNodeForTime:trackInputs:renderer:igContext:", v65, &time, &v82, &v64);
        else
          v66 = 0;
        if (v64)
          (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v64 + 24))(v64);
        if (+[PVEnvironment PV_HIGHLIGHT_OUT_OF_GAMUT](PVEnvironment, "PV_HIGHLIGHT_OUT_OF_GAMUT"))
        {
          v37 = (HgcHighlightOutOfGamut *)HGObject::operator new(0x1A0uLL);
          HgcHighlightOutOfGamut::HgcHighlightOutOfGamut(v37);
          (*(void (**)(HgcHighlightOutOfGamut *, _QWORD, HGNode *))(*(_QWORD *)v37 + 120))(v37, 0, v66);
          if (v66 != (HGNode *)v37)
          {
            if (v66)
              (*(void (**)(void))(*(_QWORD *)v66 + 24))();
            v66 = (HGNode *)v37;
            (*(void (**)(HgcHighlightOutOfGamut *))(*(_QWORD *)v37 + 16))(v37);
          }
          (*(void (**)(HgcHighlightOutOfGamut *))(*(_QWORD *)v37 + 24))(v37);
        }
        v62 = v66;
        if (v66)
          (*(void (**)(HGNode *))(*(_QWORD *)v66 + 16))(v66);
        PVInstructionGraphContext::WorkingColorSpace((PVInstructionGraphContext *)v14);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        PVInstructionGraphContext::OutputColorSpace((PVInstructionGraphContext *)v14);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0;
        ColorConformInput((HGColorClamp **)&v62, v38, v39, 1, &v61, (HGColorConform **)&v63);
        v40 = v61;
        v41 = v63;
        if (v66 == v63)
        {
          if (v66)
            (*(void (**)(void))(*(_QWORD *)v66 + 24))();
        }
        else
        {
          if (v66)
          {
            (*(void (**)(void))(*(_QWORD *)v66 + 24))();
            v41 = v63;
          }
          v66 = v41;
          v63 = 0;
        }

        if (v62)
          (*(void (**)(HGNode *))(*(_QWORD *)v62 + 24))(v62);
        if (v40)
          NSLog(CFSTR("Conform Error: %@"), v40);
        v42 = -[PVRenderRequestJobDelegate outputCVPixelBufferFormat](self, "outputCVPixelBufferFormat");
        if (PVIsMultiplaneCoreVideo420Format(v42) || PVIsMultiplaneCoreVideo422Format(v42))
        {
          -[PVRenderRequest outputSize](self->m_request, "outputSize");
          v44 = v43;
          -[PVRenderRequest outputSize](self->m_request, "outputSize");
          v46 = (int)v44 & 1;
          if ((int)v44 < 0)
            v46 = -v46;
          v47 = HGRectMake4i(0, 0, v46 + (int)v44, (int)v45);
          v49 = v48;
          DOD = HGRenderer::GetDOD((HGRenderer *)v82.value, v66);
          v52 = v51;
          PVInstructionGraphContext::OutputColorSpace((PVInstructionGraphContext *)v14);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "nclcTriplet");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          PVCreateYUVPlanesWithBackfillBlackBackground(DOD, v52, v47, v49, (HGHWBlendFlipped **)&v66, v54, v42, (uint64_t *)a3);
        }
        else if (v42 == 1380411457 || v42 == 1111970369)
        {
          std::vector<HGRef<HGNode>>::push_back[abi:ne180100]((uint64_t *)a3, (void ***)&v66);
        }

        if (v66)
          (*(void (**)(HGNode *))(*(_QWORD *)v66 + 24))(v66);
        v32 = self;
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    }
    while (v33);
  }

  if (v82.value)
    (*(void (**)(CMTimeValue))(*(_QWORD *)v82.value + 24))(v82.value);
  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::~PVInputHGNodeMap(&time);

  if (v14)
    (*(void (**)(PVRendererInstructionGraphContext *))(*(_QWORD *)v14 + 24))(v14);
}

- (void)setupDestinationBuffers:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  PVRenderer *m_pvRenderer;
  HGBitmap *v12;
  _QWORD *CVBitmapStorage;
  HGCVBitmap *v14;

  if (*((_QWORD *)self->m_destinationBitmaps + 1) == *(_QWORD *)self->m_destinationBitmaps)
  {
    v8 = -[PVRenderRequestJobDelegate outputCVPixelBufferFormat](self, "outputCVPixelBufferFormat", a3, a4, a5);
    -[PVRenderRequest outputNodes](self->m_request, "outputNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    for (; v10; --v10)
    {
      m_pvRenderer = self->m_pvRenderer;
      -[PVRenderRequest outputSize](self->m_request, "outputSize");
      if (m_pvRenderer)
        -[PVRenderer getDestinationBuffer:cvPixelBufferFormat:](m_pvRenderer, "getDestinationBuffer:cvPixelBufferFormat:", v8);
      else
        v14 = 0;
      std::vector<HGRef<HGBitmap>>::push_back[abi:ne180100]((uint64_t *)self->m_destinationBitmaps, (void ***)&v14);
      CVBitmapStorage = HGCVBitmap::getCVBitmapStorage((HGBitmap *)v14, v12);
      if (CVBitmapStorage)
        PVCreateOutputBufferForHGCVPixelBuffer(*(__CVBuffer **)(CVBitmapStorage[16] + 24), (HGRenderContext *)a4, (uint64_t *)a3);
      else
        std::vector<HGRef<HGBitmap>>::push_back[abi:ne180100]((uint64_t *)a3, (void ***)&v14);
      if (v14)
        (*(void (**)(HGCVBitmap *))(*(_QWORD *)v14 + 24))(v14);
    }
  }
}

- (void)finishCompletedJob
{
  void *v3;
  _QWORD *m_destinationBitmaps;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(*((_QWORD *)self->m_destinationBitmaps + 1) - *(_QWORD *)self->m_destinationBitmaps) >> 3);
  m_destinationBitmaps = self->m_destinationBitmaps;
  v5 = (_QWORD *)*m_destinationBitmaps;
  if (*m_destinationBitmaps != m_destinationBitmaps[1])
  {
    do
    {
      v6 = *v5;
      if (*v5)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)v6 + 16))(*v5);
        v8 = v6;
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
      }
      else
      {
        v8 = 0;
      }
      +[PVImageBuffer imageWithHGBitmap:](PVImageBuffer, "imageWithHGBitmap:", &v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
      objc_msgSend(v3, "addObject:", v7);

      if (v6)
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
      ++v5;
    }
    while (v5 != *((_QWORD **)self->m_destinationBitmaps + 1));
  }
  (*((void (**)(void))self->m_completionHandler + 2))();

}

- (void)finishCancelledJob
{
  (*((void (**)(id, _QWORD, PVRenderRequest *, uint64_t))self->m_completionHandler + 2))(self->m_completionHandler, 0, self->m_request, 1);
}

- (void)renderJobFinished:(HGRef<PVRenderJob>)a3
{
  PVRenderer *m_pvRenderer;
  uint64_t v4;
  uint64_t v5;

  m_pvRenderer = self->m_pvRenderer;
  v4 = *(_QWORD *)a3.var0;
  v5 = v4;
  if (v4)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v4 + 16))(v4, a2);
  -[PVRenderer renderJobFinished:](m_pvRenderer, "renderJobFinished:", &v5);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
}

- (int)jobPriority
{
  unsigned int v2;

  v2 = -[PVRenderRequest priority](self->m_request, "priority");
  if (v2 >= 3)
    return 5;
  else
    return 5 * v2;
}

- (int)graphBuildThreadPriority
{
  return 0;
}

- (int)renderThreadPriority
{
  unsigned int v2;

  v2 = -[PVRenderRequest gcdPriority](self->m_request, "gcdPriority");
  if (v2 <= 2)
    return v2 + 1;
  else
    return 2;
}

- (int)renderContextPriority
{
  unsigned int v2;

  v2 = -[PVRenderRequest gpuPriority](self->m_request, "gpuPriority");
  if (v2 >= 3)
    return 5;
  else
    return 5 * v2;
}

- (unint64_t)packedFamilyCode
{
  uint64_t v3;

  v3 = -[PVRenderRequest parentCode](self->m_request, "parentCode");
  return -[PVRenderRequest childCode](self->m_request, "childCode") | (unint64_t)(v3 << 32);
}

- (void).cxx_destruct
{
  PVRenderManager *m_Obj;

  objc_storeStrong(&self->m_completionHandler, 0);
  m_Obj = self->m_renderManager.m_Obj;
  if (m_Obj)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(m_Obj);
  objc_storeStrong((id *)&self->m_request, 0);
  objc_storeStrong((id *)&self->m_pvRenderer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
