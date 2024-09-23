@implementation PVAVFRenderJobDelegate

+ (unsigned)jobTypeTag
{
  return 10000;
}

- (PVAVFRenderJobDelegate)initWithCompositor:(id)a3 request:(id)a4 compositionTime:(id *)a5 thumbnailCompositing:(BOOL)a6
{
  id v11;
  id v12;
  PVAVFRenderJobDelegate *v13;
  PVAVFRenderJobDelegate *v14;
  id *p_m_compositor;
  uint64_t v16;
  PVVideoCompositionInstruction *m_instruction;
  __int128 v18;
  PVRenderManager *v19;
  PVRenderManager *m_Obj;
  CMTimeValue value;
  PVVideoCompositingContext *v22;
  AVVideoCompositionRenderContext *v23;
  char v24;
  PVAVFInstructionGraphContext *v25;
  PVAVFInstructionGraphContext *v26;
  void *v27;
  CMTimeValue v28;
  uint64_t timescale;
  void *v30;
  void *v31;
  id *v32;
  id v33;
  void *__p[2];
  char v36;
  objc_super v37;
  CMTime time;

  v11 = a3;
  v12 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PVAVFRenderJobDelegate;
  v13 = -[PVAVFRenderJobDelegate init](&v37, sel_init);
  v14 = v13;
  if (v13)
  {
    p_m_compositor = (id *)&v13->m_compositor;
    objc_storeStrong((id *)&v13->m_compositor, a3);
    objc_storeStrong((id *)&v14->m_request, a4);
    -[AVAsynchronousVideoCompositionRequest videoCompositionInstruction](v14->m_request, "videoCompositionInstruction");
    v16 = objc_claimAutoreleasedReturnValue();
    m_instruction = v14->m_instruction;
    v14->m_instruction = (PVVideoCompositionInstruction *)v16;

    v18 = *(_OWORD *)&a5->var0;
    v14->m_compositionTime.epoch = a5->var3;
    *(_OWORD *)&v14->m_compositionTime.value = v18;
    v14->m_thumbnailCompositing = a6;
    v14->m_minimumRequestCompletionTimeMS = 0;
    PerfTimer::Start(&v14->m_timer);
    v19 = (PVRenderManager *)-[PVAVFRenderJobDelegate jobTypeTag](v14, "jobTypeTag");
    v14->m_parentCode = v19;
    v14->m_childCode = 0;
    PVRenderManager::INSTANCE(v19, &time);
    m_Obj = v14->m_renderManager.m_Obj;
    value = time.value;
    if (m_Obj == (PVRenderManager *)time.value)
    {
      if (m_Obj)
        (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(m_Obj);
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(PVRenderManager *))(*(_QWORD *)m_Obj + 24))(m_Obj);
        value = time.value;
      }
      v14->m_renderManager.m_Obj = (PVRenderManager *)value;
    }
    objc_msgSend(*p_m_compositor, "videoCompositingContext");
    v22 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
    -[AVAsynchronousVideoCompositionRequest renderContext](v14->m_request, "renderContext");
    v23 = (AVVideoCompositionRenderContext *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(*p_m_compositor, "thumbnailCompositing");
    v25 = (PVAVFInstructionGraphContext *)HGObject::operator new(0x88uLL);
    PVAVFInstructionGraphContext::PVAVFInstructionGraphContext(v25, v22, v23, v24);
    v26 = (PVAVFInstructionGraphContext *)v14->m_instructionGraphContext.m_Obj;
    if (v26 == v25)
    {
      if (v25)
        (*(void (**)(PVAVFInstructionGraphContext *))(*(_QWORD *)v25 + 24))(v25);
    }
    else
    {
      if (v26)
        (*(void (**)(PVAVFInstructionGraphContext *))(*(_QWORD *)v26 + 24))(v26);
      v14->m_instructionGraphContext.m_Obj = (PVInstructionGraphContext *)v25;
    }

    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = v14->m_compositionTime.value;
    timescale = v14->m_compositionTime.timescale;
    *(_QWORD *)&time.flags = *(_QWORD *)&v14->m_compositionTime.flags;
    HIDWORD(time.epoch) = HIDWORD(v14->m_compositionTime.epoch);
    time.value = v28;
    time.timescale = timescale;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lld/%d = %.3f}"), v28, timescale, CMTimeGetSeconds(&time));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("RequestTime: %@"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (id *)v14->m_instructionGraphContext.m_Obj;
    v33 = objc_retainAutorelease(v31);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v33, "UTF8String"));
    PVInstructionGraphContext::AddContextDotNode(v32, (uint64_t)__p);
    if (v36 < 0)
      operator delete(__p[0]);

  }
  return v14;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)compositionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (PVVideoCompositionInstruction)compositionInstruction
{
  return (PVVideoCompositionInstruction *)-[AVAsynchronousVideoCompositionRequest videoCompositionInstruction](self->m_request, "videoCompositionInstruction");
}

- (AVAsynchronousVideoCompositionRequest)compositionRequest
{
  return self->m_request;
}

- (unsigned)jobTypeTag
{
  return objc_msgSend((id)objc_opt_class(), "jobTypeTag");
}

- (PVVideoCompositingContext)videoCompositingContext
{
  return -[PVVideoCompositing videoCompositingContext](self->m_compositor, "videoCompositingContext");
}

- (int)jobPriority
{
  if (self->m_thumbnailCompositing)
    return 0;
  else
    return 6;
}

- (int)renderThreadPriority
{
  void *v3;
  _BOOL4 v4;

  -[AVAsynchronousVideoCompositionRequest renderContext](self->m_request, "renderContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "highQualityRendering"))
  {
    v4 = -[PVVideoCompositing shouldDoLowPowerExport](self->m_compositor, "shouldDoLowPowerExport");

    if (v4)
      return 1;
    else
      return 3;
  }
  else
  {

    return 3;
  }
}

- (int)renderContextPriority
{
  void *v3;
  _BOOL4 v4;

  -[AVAsynchronousVideoCompositionRequest renderContext](self->m_request, "renderContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "highQualityRendering"))
  {
    v4 = -[PVVideoCompositing shouldDoLowPowerExport](self->m_compositor, "shouldDoLowPowerExport");

    if (v4)
      return 0;
    else
      return 5;
  }
  else
  {

    return 5;
  }
}

- (void)buildGraph:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  _QWORD *v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];

  v9 = v10;
  v10[0] = 0;
  v11[0] = 0;
  v11[1] = 0;
  v10[1] = 0;
  v10[2] = v11;
  v11[2] = v12;
  v12[0] = 0;
  v13[0] = 0;
  v13[1] = 0;
  v12[1] = 0;
  v12[2] = v13;
  v13[2] = v14;
  v14[0] = 0;
  v15[0] = 0;
  v15[1] = 0;
  v14[1] = 0;
  v14[2] = v15;
  -[PVAVFRenderJobDelegate _setupInputs:renderContext:frameStats:](self, "_setupInputs:renderContext:frameStats:", &v9);
  -[PVAVFRenderJobDelegate _buildGraph:renderContext:frameStats:outputNodes:](self, "_buildGraph:renderContext:frameStats:outputNodes:", &v9, a4, a5, a3);
  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::~PVInputHGNodeMap(&v9);
}

- (void)_setupInputs:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  __CVBuffer *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  uint64_t v37;
  __CVBuffer *v38;
  void *v39;
  PVInstructionGraphContext *m_Obj;
  size_t Width;
  size_t Height;
  __n128 v43;
  HGNode *v44;
  HGNode *v45;
  const char *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  id v54;
  id obj;
  id v56;
  id v58;
  id v59;
  __int128 v60;
  double v61;
  double v62;
  int *v63;
  PVInstructionGraphContext *v64;
  __int128 v65;
  int64_t epoch;
  uint64_t v67;
  HGNode *v68;
  HGNode *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  int *v78;
  int v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  HGNode *v92;
  PerfTimer v93;
  int *v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", a2) >= 1)
  {
    -[PVAVFRenderJobDelegate packedFamilyCode](self, "packedFamilyCode");
    kdebug_trace();
  }
  PerfTimer::PerfTimer(&v93);
  PerfTimer::Start(&v93);
  -[AVAsynchronousVideoCompositionRequest sourceTrackIDs](self->m_request, "sourceTrackIDs");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PVEnvironment PV_MULTI_SOURCE_PLAYBACK_FPS](PVEnvironment, "PV_MULTI_SOURCE_PLAYBACK_FPS")
    && *((_BYTE *)a5 + 56)
    && (unint64_t)objc_msgSend(v47, "count") <= 1)
  {
    *((_BYTE *)a5 + 56) = 0;
  }
  if (v47 && objc_msgSend(v47, "count"))
  {
    v56 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PVVideoCompositionInstruction outputNode](self->m_instruction, "outputNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getAllSourceNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v89 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "trackID"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15 == 0;

            if (v16)
            {
              v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v17, v14);

            }
            objc_msgSend(v56, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v13);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
      }
      while (v9);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v54 = obj;
    v19 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v85;
      v49 = *(_QWORD *)v85;
      do
      {
        v21 = 0;
        v52 = v19;
        do
        {
          if (*(_QWORD *)v85 != v20)
            objc_enumerationMutation(v54);
          v22 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v21);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = v22;
            *((_QWORD *)&v60 + 1) = 0;
            v61 = 0.0;
            *(_QWORD *)&v60 = (char *)&v60 + 8;
            objc_msgSend(v23, "requiredSourceTrackIDs");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v23;
            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            v25 = v24;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
            if (v26)
            {
              v27 = *(_QWORD *)v81;
              do
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v81 != v27)
                    objc_enumerationMutation(v25);
                  v29 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
                  v79 = 0;
                  v30 = objc_msgSend(v29, "intValue");
                  v79 = v30;
                  if ((_DWORD)v30)
                  {
                    v31 = -[AVAsynchronousVideoCompositionRequest sourceFrameByTrackID:](self->m_request, "sourceFrameByTrackID:", v30);
                    v94 = &v79;
                    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v60, &v79, (uint64_t)&std::piecewise_construct, &v94)[5] = (uint64_t *)v31;
                  }
                }
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
              }
              while (v26);
            }

            v20 = v49;
            v19 = v52;
            if (v58)
            {
              objc_msgSend(v58, "nodeForCompositeTrackMap:", &v60);
              v78 = v94;
              if (v94)
                (*(void (**)(int *))(*(_QWORD *)v94 + 16))(v94);
            }
            else
            {
              v94 = 0;
              v78 = 0;
            }
            PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, v58, (uint64_t *)&v78);
            if (v78)
              (*(void (**)(int *))(*(_QWORD *)v78 + 24))(v78);
            if (v94)
              (*(void (**)(int *))(*(_QWORD *)v94 + 24))(v94);

            std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v60, *((_QWORD **)&v60 + 1));
          }
          ++v21;
        }
        while (v21 != v19);
        v19 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
      }
      while (v19);
    }

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v48 = v47;
    v51 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v74, v96, 16);
    if (v51)
    {
      v50 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v75 != v50)
            objc_enumerationMutation(v48);
          v32 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          objc_msgSend(v56, "objectForKeyedSubscript:", v32);
          v59 = (id)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v70, v95, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v71;
            do
            {
              for (m = 0; m != v33; ++m)
              {
                if (*(_QWORD *)v71 != v34)
                  objc_enumerationMutation(v59);
                v36 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
                v37 = objc_msgSend(v32, "intValue");
                if ((_DWORD)v37)
                {
                  v38 = -[AVAsynchronousVideoCompositionRequest sourceFrameByTrackID:](self->m_request, "sourceFrameByTrackID:", v37);
                  if (v38)
                  {
                    if (objc_msgSend(v36, "dataTrackID"))
                    {
                      HGCVBitmap::create((HGCVPixelBuffer *)-[AVAsynchronousVideoCompositionRequest sourceFrameByTrackID:](self->m_request, "sourceFrameByTrackID:", objc_msgSend(v36, "dataTrackID")), 1, 0, &v60);
                      v67 = v60;
                      if ((_QWORD)v60)
                        (*(void (**)(_QWORD))(*(_QWORD *)v60 + 16))(v60);
                      PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetFrameDataPixelBuffer((uint64_t)a3, v36, &v67);
                      if (v67)
                        (*(void (**)(uint64_t))(*(_QWORD *)v67 + 24))(v67);
                      if ((_QWORD)v60)
                        (*(void (**)(_QWORD))(*(_QWORD *)v60 + 24))(v60);
                    }
                    if (objc_msgSend(v36, "depthTrackID")
                      && objc_msgSend(v36, "metadataTrackID"))
                    {
                      -[AVAsynchronousVideoCompositionRequest sourceTimedMetadataByTrackID:](self->m_request, "sourceTimedMetadataByTrackID:", objc_msgSend(v36, "metadataTrackID"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v39)
                        objc_msgSend(v36, "setTimedMetadataGroup:", v39);

                    }
                    v65 = *(_OWORD *)&self->m_compositionTime.value;
                    epoch = self->m_compositionTime.epoch;
                    m_Obj = self->m_instructionGraphContext.m_Obj;
                    v64 = m_Obj;
                    if (m_Obj)
                      (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)m_Obj + 16))(m_Obj);
                    PVCreateInputGraphForPixelBuffer(v38, &v64, (HGNode **)&v94);
                    if (v64)
                      (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v64 + 24))(v64);
                    v63 = v94;
                    if (v94)
                      (*(void (**)(int *))(*(_QWORD *)v94 + 16))(v94);
                    PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, v36, (uint64_t *)&v63);
                    if (v63)
                      (*(void (**)(int *))(*(_QWORD *)v63 + 24))(v63);
                    Width = CVPixelBufferGetWidth(v38);
                    Height = CVPixelBufferGetHeight(v38);
                    v60 = 0uLL;
                    v61 = (double)Width;
                    v62 = (double)Height;
                    v43 = PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetInputSize((uint64_t)a3, v36, &v60);
                    if (v94)
                      (*(void (**)(int *, __n128))(*(_QWORD *)v94 + 24))(v94, v43);
                  }
                  else
                  {
                    v44 = (HGNode *)HGObject::operator new(0x1A0uLL);
                    HGNode::HGNode(v44);
                    v68 = v44;
                    if (v44)
                      (*(void (**)(HGNode *))(*(_QWORD *)v44 + 16))(v44);
                    PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, v36, (uint64_t *)&v68);
                    if (v68)
                      (*(void (**)(HGNode *))(*(_QWORD *)v68 + 24))(v68);
                    if (v44)
                      goto LABEL_91;
                  }
                }
                else
                {
                  v44 = (HGNode *)HGObject::operator new(0x1A0uLL);
                  HGNode::HGNode(v44);
                  v69 = v44;
                  if (v44)
                    (*(void (**)(HGNode *))(*(_QWORD *)v44 + 16))(v44);
                  PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, v36, (uint64_t *)&v69);
                  if (v69)
                    (*(void (**)(HGNode *))(*(_QWORD *)v69 + 24))(v69);
                  if (v44)
                  {
LABEL_91:
                    (*(void (**)(HGNode *))(*(_QWORD *)v44 + 24))(v44);
                    continue;
                  }
                }
              }
              v33 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v70, v95, 16, v43.n128_f64[0]);
            }
            while (v33);
          }

        }
        v51 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v74, v96, 16);
      }
      while (v51);
    }

  }
  else
  {
    v45 = (HGNode *)HGObject::operator new(0x1A0uLL);
    HGNode::HGNode(v45);
    v92 = v45;
    if (v45)
      (*(void (**)(HGNode *))(*(_QWORD *)v45 + 16))(v45);
    PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::SetNode((uint64_t **)a3, 0, (uint64_t *)&v92);
    if (v92)
      (*(void (**)(HGNode *))(*(_QWORD *)v92 + 24))(v92);
    if (v45)
      (*(void (**)(HGNode *))(*(_QWORD *)v45 + 24))(v45);
  }
  PerfTimer::End(&v93);
  PVPerfStats::FrameStats::SetValueForIndex((uint64_t)a5, 1u, v93._end - v93._start);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v46) >= 1)
    kdebug_trace();

}

- (void)_buildGraph:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5 outputNodes:(void *)a6
{
  uint64_t Renderer;
  HGRenderer *v10;
  void *v11;
  const char *v12;
  const char *v13;
  char *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  const char *v19;
  char *v20;
  PVVideoCompositionInstruction *m_instruction;
  unsigned __int8 v22;
  HGNode *v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  const char *v27;
  char *v28;
  void *v29;
  PVInstructionGraphContext *m_Obj;
  void **v31;
  void **v32;
  HgcHighlightOutOfGamut *v33;
  void *v34;
  void *v35;
  void **v36;
  HgcHighlightHDRRegion *v37;
  void **v38;
  void *v39;
  void *v40;
  id v41;
  void **v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  float v51;
  float v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  uint64_t *v57;
  int v58;
  float v59;
  unsigned int v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t DOD;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  HGColorClamp *v72;
  HGColorClamp *v73;
  HGColorClamp *v74;
  PVInstructionGraphContext *v75;
  __int128 v76;
  int64_t epoch;
  void **v78;
  CMTimeRange range;
  CMTime time;
  void **v81;
  HGRenderer *v82;

  Renderer = HGRenderContext::GetRenderer((HGRenderContext *)a4);
  v10 = (HGRenderer *)Renderer;
  if (Renderer)
    (*(void (**)(uint64_t))(*(_QWORD *)Renderer + 16))(Renderer);
  v81 = 0;
  v82 = v10;
  -[PVVideoCompositionInstruction outputNode](self->m_instruction, "outputNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v12) >= 1)
    {
      time = (CMTime)self->m_compositionTime;
      CMTimeCopyDescription(0, &time);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = atomic_load(HGLogger::_enabled);
      if ((v17 & 1) != 0)
      {
        v18 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Current Time:           %s\n", v19, v20, v18);
      }
      CFRelease(v16);
      m_instruction = self->m_instruction;
      if (m_instruction)
        -[PVVideoCompositionInstruction timeRange](m_instruction, "timeRange");
      else
        memset(&range, 0, sizeof(range));
      CMTimeRangeCopyDescription(0, &range);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = atomic_load(HGLogger::_enabled);
      if ((v25 & 1) != 0)
      {
        v26 = objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Instruction Time Range: %s\n", v27, v28, v26);
      }
      CFRelease(v24);

    }
    -[PVVideoCompositionInstruction outputNode](self->m_instruction, "outputNode");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = *(_OWORD *)&self->m_compositionTime.value;
    epoch = self->m_compositionTime.epoch;
    m_Obj = self->m_instructionGraphContext.m_Obj;
    v75 = m_Obj;
    if (m_Obj)
      (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)m_Obj + 16))(m_Obj);
    if (v29)
    {
      objc_msgSend(v29, "hgNodeForTime:trackInputs:renderer:igContext:", &v76, a3, &v82, &v75);
      v31 = v78;
      v32 = v81;
      if (v81 == v78)
      {
        if (v78)
          (*((void (**)(void))*v78 + 3))();
        goto LABEL_26;
      }
      if (!v81)
        goto LABEL_25;
    }
    else
    {
      v78 = 0;
      v32 = v81;
      if (!v81)
      {
LABEL_26:
        if (v75)
          (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v75 + 24))(v75);

        goto LABEL_29;
      }
    }
    (*((void (**)(void **))*v32 + 3))(v32);
    v31 = v78;
LABEL_25:
    v81 = v31;
    v78 = 0;
    goto LABEL_26;
  }
  v22 = atomic_load(HGLogger::_enabled);
  if ((v22 & 1) != 0)
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"instruction.outputNode is nil; returning empty HGNode\n",
      v13,
      v14);
  v23 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v23);
  if (v81 == (void **)v23)
  {
    if (v23)
      (*(void (**)(HGNode *))(*(_QWORD *)v23 + 24))(v23);
  }
  else
  {
    v81 = (void **)v23;
  }
LABEL_29:
  if (+[PVEnvironment PV_HIGHLIGHT_OUT_OF_GAMUT](PVEnvironment, "PV_HIGHLIGHT_OUT_OF_GAMUT"))
  {
    v33 = (HgcHighlightOutOfGamut *)HGObject::operator new(0x1A0uLL);
    HgcHighlightOutOfGamut::HgcHighlightOutOfGamut(v33);
    (*(void (**)(HgcHighlightOutOfGamut *, _QWORD, void **))(*(_QWORD *)v33 + 120))(v33, 0, v81);
    if (v81 != (void **)v33)
    {
      if (v81)
        (*((void (**)(void **))*v81 + 3))(v81);
      v81 = (void **)v33;
      (*(void (**)(HgcHighlightOutOfGamut *))(*(_QWORD *)v33 + 16))(v33);
    }
    (*(void (**)(HgcHighlightOutOfGamut *))(*(_QWORD *)v33 + 24))(v33);
  }
  if (+[PVEnvironment PVHighlightHDRRegions](PVEnvironment, "PVHighlightHDRRegions"))
  {
    PVInstructionGraphContext::WorkingColorSpace(self->m_instructionGraphContext.m_Obj);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PVColorSpace rec2020LinearColorSpace](PVColorSpace, "rec2020LinearColorSpace");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "isEqual:", v35) & 1) == 0)
    {
      v74 = (HGColorClamp *)v81;
      if (v81)
        (*((void (**)(void **))*v81 + 2))(v81);
      ColorConformInput(&v74, v34, v35, 0, 0, (HGColorConform **)&v78);
      v36 = v78;
      if (v81 == v78)
      {
        if (v81)
          (*((void (**)(void **))*v81 + 3))(v81);
      }
      else
      {
        if (v81)
        {
          (*((void (**)(void **))*v81 + 3))(v81);
          v36 = v78;
        }
        v81 = v36;
        v78 = 0;
      }
      if (v74)
        (*(void (**)(HGColorClamp *))(*(_QWORD *)v74 + 24))(v74);
    }
    v37 = (HgcHighlightHDRRegion *)HGObject::operator new(0x1A0uLL);
    HgcHighlightHDRRegion::HgcHighlightHDRRegion(v37);
    (*(void (**)(HgcHighlightHDRRegion *, _QWORD, void **))(*(_QWORD *)v37 + 120))(v37, 0, v81);
    if (v81 != (void **)v37)
    {
      if (v81)
        (*((void (**)(void **))*v81 + 3))(v81);
      v81 = (void **)v37;
      (*(void (**)(HgcHighlightHDRRegion *))(*(_QWORD *)v37 + 16))(v37);
    }
    if ((objc_msgSend(v34, "isEqual:", v35) & 1) == 0)
    {
      v73 = (HGColorClamp *)v81;
      if (v81)
        (*((void (**)(void **))*v81 + 2))(v81);
      ColorConformInput(&v73, v35, v34, 0, 0, (HGColorConform **)&v78);
      v38 = v78;
      if (v81 == v78)
      {
        if (v81)
          (*((void (**)(void **))*v81 + 3))(v81);
      }
      else
      {
        if (v81)
        {
          (*((void (**)(void **))*v81 + 3))(v81);
          v38 = v78;
        }
        v81 = v38;
        v78 = 0;
      }
      if (v73)
        (*(void (**)(HGColorClamp *))(*(_QWORD *)v73 + 24))(v73);
    }
    (*(void (**)(HgcHighlightHDRRegion *))(*(_QWORD *)v37 + 24))(v37);

  }
  v72 = (HGColorClamp *)v81;
  if (v81)
    (*((void (**)(void **))*v81 + 2))(v81);
  PVInstructionGraphContext::WorkingColorSpace(self->m_instructionGraphContext.m_Obj);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  PVInstructionGraphContext::OutputColorSpace(self->m_instructionGraphContext.m_Obj);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  ColorConformInput(&v72, v39, v40, 1, &v71, (HGColorConform **)&v78);
  v41 = v71;
  v42 = v78;
  if (v81 == v78)
  {
    if (v81)
      (*((void (**)(void **))*v81 + 3))(v81);
  }
  else
  {
    if (v81)
    {
      (*((void (**)(void **))*v81 + 3))(v81);
      v42 = v78;
    }
    v81 = v42;
    v78 = 0;
  }

  if (v72)
    (*(void (**)(HGColorClamp *))(*(_QWORD *)v72 + 24))(v72);
  if (v41)
    NSLog(CFSTR("Conform Error: %@"), v41);
  -[PVVideoCompositing requiredPixelBufferAttributesForRenderContext](self->m_compositor, "requiredPixelBufferAttributesForRenderContext");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKey:", *MEMORY[0x1E0CA9040]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectAtIndex:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "unsignedIntValue");

  if (PVIsMultiplaneCoreVideo420Format(v46) || PVIsMultiplaneCoreVideo422Format(v46))
  {
    v70 = v41;
    -[AVAsynchronousVideoCompositionRequest renderContext](self->m_request, "renderContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "size");
    v49 = v48;
    -[AVAsynchronousVideoCompositionRequest renderContext](self->m_request, "renderContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "renderScale");
    v52 = v51;

    -[AVAsynchronousVideoCompositionRequest renderContext](self->m_request, "renderContext");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "size");
    v55 = v54;
    -[AVAsynchronousVideoCompositionRequest renderContext](self->m_request, "renderContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "renderScale");
    v57 = (uint64_t *)a6;
    v58 = (int)(v49 * v52);
    v60 = (int)(v55 * v59);

    v61 = v58 & 1;
    if (v58 < 0)
      v61 = -v61;
    v62 = HGRectMake4i(0, 0, v61 + v58, v60);
    v64 = v63;
    DOD = HGRenderer::GetDOD(v82, (HGNode *)v81);
    v67 = v66;
    PVInstructionGraphContext::OutputColorSpace(self->m_instructionGraphContext.m_Obj);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "nclcTriplet");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    PVCreateYUVPlanesWithBackfillBlackBackground(DOD, v67, v62, v64, (HGHWBlendFlipped **)&v81, v69, v46, v57);
    v41 = v70;
  }
  else
  {
    std::vector<HGRef<HGNode>>::push_back[abi:ne180100]((uint64_t *)a6, &v81);
  }

  if (v81)
    (*((void (**)(void **))*v81 + 3))(v81);
  if (v82)
    (*(void (**)(HGRenderer *))(*(_QWORD *)v82 + 24))(v82);
}

- (void)setupDestinationBuffers:(void *)a3 renderContext:(const void *)a4 frameStats:(void *)a5
{
  __CVBuffer *m_destinationPixelBuffer;
  void *v9;

  m_destinationPixelBuffer = self->m_destinationPixelBuffer;
  if (!m_destinationPixelBuffer)
  {
    -[AVAsynchronousVideoCompositionRequest renderContext](self->m_request, "renderContext", a3, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->m_destinationPixelBuffer = (__CVBuffer *)objc_msgSend(v9, "newPixelBuffer");

    m_destinationPixelBuffer = self->m_destinationPixelBuffer;
  }
  PVCreateOutputBufferForHGCVPixelBuffer(m_destinationPixelBuffer, (HGRenderContext *)a4, (uint64_t *)a3);
}

- (void)finishCompletedJob
{
  unint64_t v3;
  double v4;
  double v5;

  PerfTimer::End(&self->m_timer);
  HIDWORD(v3) = 1083129856;
  v4 = (self->m_timer._end - self->m_timer._start) * 1000.0;
  LODWORD(v3) = self->m_minimumRequestCompletionTimeMS;
  v5 = (double)v3;
  if (v4 < v5)
    usleep(1000 * (v5 - v4));
  -[AVAsynchronousVideoCompositionRequest finishWithComposedVideoFrame:](self->m_request, "finishWithComposedVideoFrame:", self->m_destinationPixelBuffer);
  CVPixelBufferRelease(self->m_destinationPixelBuffer);
  self->m_destinationPixelBuffer = 0;
}

- (void)finishCancelledJob
{
  __CVBuffer *m_destinationPixelBuffer;

  -[AVAsynchronousVideoCompositionRequest finishCancelledRequest](self->m_request, "finishCancelledRequest");
  m_destinationPixelBuffer = self->m_destinationPixelBuffer;
  if (m_destinationPixelBuffer)
  {
    CVPixelBufferRelease(m_destinationPixelBuffer);
    self->m_destinationPixelBuffer = 0;
  }
}

- (void)renderJobFinished:(HGRef<PVRenderJob>)a3
{
  PVVideoCompositing *m_compositor;
  uint64_t v4;
  uint64_t v5;

  m_compositor = self->m_compositor;
  v4 = *(_QWORD *)a3.var0;
  v5 = v4;
  if (v4)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v4 + 16))(v4, a2);
  -[PVVideoCompositing renderRequestFinished:](m_compositor, "renderRequestFinished:", &v5);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
}

- (unint64_t)packedFamilyCode
{
  unsigned int v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = -[PVAVFRenderJobDelegate parentCode](self, "parentCode");
  -[AVAsynchronousVideoCompositionRequest renderContext](self->m_request, "renderContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "highQualityRendering");

  LODWORD(v6) = v3 + 100;
  if (v5)
    v6 = v6;
  else
    v6 = v3;
  return self->m_childCode | (unint64_t)(v6 << 32);
}

- (unsigned)minimumRequestCompletionTimeMS
{
  return self->m_minimumRequestCompletionTimeMS;
}

- (void)setMinimumRequestCompletionTimeMS:(unsigned int)a3
{
  self->m_minimumRequestCompletionTimeMS = a3;
}

- (unsigned)parentCode
{
  return self->m_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->m_parentCode = a3;
}

- (unsigned)childCode
{
  return self->m_childCode;
}

- (void)setChildCode:(unsigned int)a3
{
  self->m_childCode = a3;
}

- (PVTaskToken)token
{
  return (PVTaskToken *)objc_getProperty(self, a2, 128, 1);
}

- (void)setToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  PVInstructionGraphContext *m_Obj;
  PVRenderManager *v4;

  objc_storeStrong((id *)&self->_token, 0);
  m_Obj = self->m_instructionGraphContext.m_Obj;
  if (m_Obj)
    (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)m_Obj + 24))(m_Obj);
  v4 = self->m_renderManager.m_Obj;
  if (v4)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v4 + 24))(v4);
  objc_storeStrong((id *)&self->m_instruction, 0);
  objc_storeStrong((id *)&self->m_request, 0);
  objc_storeStrong((id *)&self->m_compositor, 0);
}

- (id).cxx_construct
{
  PerfTimer::PerfTimer(&self->m_timer);
  self->m_renderManager.m_Obj = 0;
  self->m_instructionGraphContext.m_Obj = 0;
  return self;
}

@end
