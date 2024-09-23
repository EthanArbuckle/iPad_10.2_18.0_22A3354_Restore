@implementation PVRendererBase

- (PVRendererBase)init
{
  return -[PVRendererBase initWithOptions:](self, "initWithOptions:", 0);
}

- (PVRendererBase)initWithOptions:(id)a3
{
  id v4;
  PVRendererBase *v5;
  PVRendererBase *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PVVideoCompositingContext *v12;
  PVVideoCompositingContext *compositingContext;
  NSLock *v14;
  NSLock *inFlightRenderJobsLock;
  HGSynchronizable *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  NSString *name;
  _QWORD *v23;
  objc_super v24;

  v4 = a3;
  if (-[PVRendererBase initWithOptions:]::onceToken != -1)
    dispatch_once(&-[PVRendererBase initWithOptions:]::onceToken, &__block_literal_global_5);
  v24.receiver = self;
  v24.super_class = (Class)PVRendererBase;
  v5 = -[PVRendererBase init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    atomic_store(0, (unsigned __int8 *)&v5->_hasRendered);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPVRendererBase_RenderingIntent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "intValue");
    else
      v9 = 0;
    -[PVRendererBase _outputColorSpace:renderingIntent:](v6, "_outputColorSpace:renderingIntent:", v4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVRendererBase _workingColorSpace:outputColorSpace:](v6, "_workingColorSpace:outputColorSpace:", v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PVVideoCompositingContext initWithDevice:workingColorSpace:outputColorSpace:]([PVVideoCompositingContext alloc], "initWithDevice:workingColorSpace:outputColorSpace:", 0, v11, v10);
    compositingContext = v6->_compositingContext;
    v6->_compositingContext = v12;

    -[PVRendererBase updateDestinationFormatForOutputColorSpace](v6, "updateDestinationFormatForOutputColorSpace");
    v6->_immediatelyCancelPendingRequests = 0;
    v14 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    inFlightRenderJobsLock = v6->_inFlightRenderJobsLock;
    v6->_inFlightRenderJobsLock = v14;

    v16 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v16);
    v6->_perfStatsLock = v16;
    v17 = operator new();
    v18 = (_QWORD *)operator new();
    *v18 = &unk_1E64D5E98;
    v23 = v18;
    PVPerfStats::PVPerfStats(v17, &v23);
    v6->_perfStats = (void *)v17;
    v19 = v23;
    v23 = 0;
    if (v19)
      MEMORY[0x1B5E29170](v19, 0x81C40B8603338);
    atomic_store(0, &v6->_frameCount.__a_.__a_value);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel_didRecieveMemoryWarning_, *MEMORY[0x1E0CEB298], 0);

    v6->_trackStats = 1;
    name = v6->_name;
    v6->_name = (NSString *)&stru_1E65EDDA0;

    PVPerfStats::SetName((PVPerfStats *)v6->_perfStats, (__CFString *)v6->_name);
  }

  return v6;
}

- (id)_outputColorSpace:(id)a3 renderingIntent:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPVRendererBase_OutputColorSpace"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kPVRendererBase_OutputColorSpace"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringForKey:", CFSTR("PVRendererColorSpaceOverride"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", CFSTR("p3")))
  {
    +[PVColorSpace p3d65GammaColorSpace](PVColorSpace, "p3d65GammaColorSpace");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("srgb")))
  {
    +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("709")))
      goto LABEL_13;
    +[PVColorSpace rec709GammaColorSpace](PVColorSpace, "rec709GammaColorSpace");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  if (v12)
  {
    NSLog(CFSTR("%@: overriding color space from %@ to %@"), self, v8, v12);
    v14 = v13;

    v8 = v14;
    goto LABEL_16;
  }
LABEL_13:
  if (v8)
  {
    v14 = 0;
  }
  else
  {
    +[PVVideoCompositingContext defaultOutputColorSpaceWithRenderingIntent:](PVVideoCompositingContext, "defaultOutputColorSpaceWithRenderingIntent:", v4);
    v14 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:

  return v8;
}

- (id)_workingColorSpace:(id)a3 outputColorSpace:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (!v5
    || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kPVRendererBase_WorkingColorSpace")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7)
    || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kPVRendererBase_WorkingColorSpace")),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[PVVideoCompositingContext defaultWorkingColorSpaceWithOutputColorSpace:](PVVideoCompositingContext, "defaultWorkingColorSpaceWithOutputColorSpace:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  HGSynchronizable *perfStatsLock;
  PVPerfStats *perfStats;
  objc_super v6;

  -[PVRendererBase cancelAllPendingRequests](self, "cancelAllPendingRequests");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB298], 0);

  -[PVRendererBase printAndClearStats:](self, "printAndClearStats:", 1);
  perfStatsLock = self->_perfStatsLock;
  if (perfStatsLock)
    (*((void (**)(HGSynchronizable *))perfStatsLock->var0 + 1))(perfStatsLock);
  perfStats = (PVPerfStats *)self->_perfStats;
  if (perfStats)
  {
    PVPerfStats::~PVPerfStats(perfStats);
    MEMORY[0x1B5E29170]();
  }
  v6.receiver = self;
  v6.super_class = (Class)PVRendererBase;
  -[PVRendererBase dealloc](&v6, sel_dealloc);
}

- (void)cancelAllPendingRequests
{
  _BOOL4 v3;
  PVRenderJob **v4;
  int v5;
  PVRenderJob **v6;
  PVRenderJob **v7;
  uint64_t v8;
  PVRenderJob ***v9;

  -[NSLock lock](self->_inFlightRenderJobsLock, "lock");
  v6 = 0;
  v7 = 0;
  v8 = 0;
  std::vector<HGRef<PVRenderJob>>::__init_with_size[abi:ne180100]<HGRef<PVRenderJob>*,HGRef<PVRenderJob>*>((uint64_t *)&v6, (uint64_t *)self->_inFlightRenderJobs.__begin_, (uint64_t *)self->_inFlightRenderJobs.__end_, ((char *)self->_inFlightRenderJobs.__end_ - (char *)self->_inFlightRenderJobs.__begin_) >> 3);
  -[NSLock unlock](self->_inFlightRenderJobsLock, "unlock");
  v3 = -[PVRendererBase immediatelyCancelPendingRequests](self, "immediatelyCancelPendingRequests");
  v4 = v6;
  if (v6 != v7)
  {
    v5 = v3;
    do
      PVRenderJob::CancelJob(*v4++, v5);
    while (v4 != v7);
  }
  v9 = &v6;
  std::vector<HGRef<PVRenderJob>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
}

- (HGRef<PVRenderJob>)startJobForDelegate:(id)a3 time:(id *)a4 playback:(BOOL)a5
{
  PVRenderJob **v5;
  PVRenderJob **v9;
  id v10;
  PVRenderJob *v11;
  atomic<unsigned int> *p_frameCount;
  int v13;
  PVRenderJob *v14;
  HGRef<PVRenderJob> v15;
  PVRenderJob *v16;
  CMTime v17;

  v9 = v5;
  v10 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_hasRendered);
  v11 = (PVRenderJob *)HGObject::operator new(0x118uLL);
  PVRenderJob::PVRenderJob(v11, v10);
  *v9 = v11;
  p_frameCount = &self->_frameCount;
  do
    v13 = __ldaxr(&p_frameCount->__a_.__a_value);
  while (__stlxr(v13 + 1, &p_frameCount->__a_.__a_value));
  v17 = (CMTime)*a4;
  PVRenderJob::InitFrameStats(v11, v13, &v17, a5);
  v14 = *v9;
  v16 = v14;
  if (v14)
    (*(void (**)(PVRenderJob *))(*(_QWORD *)v14 + 16))(v14);
  -[PVRendererBase addRenderJobInFlight:](self, "addRenderJobInFlight:", &v16);
  if (v16)
    (*(void (**)(PVRenderJob *))(*(_QWORD *)v16 + 24))(v16);
  PVRenderJob::StartHandlingRequest(v14);

  return v15;
}

- (void)addRenderJobInFlight:(HGRef<PVRenderJob>)a3
{
  -[NSLock lock](self->_inFlightRenderJobsLock, "lock");
  std::vector<HGRef<PVRenderJob>>::push_back[abi:ne180100]((uint64_t *)&self->_inFlightRenderJobs, (void ***)a3.var0);
  -[NSLock unlock](self->_inFlightRenderJobsLock, "unlock");
}

- (void)renderJobFinished:(HGRef<PVRenderJob>)a3
{
  PVRenderJob **end;
  PVRenderJob **begin;
  PVRenderJob *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", a2) >= 1)
    kdebug_trace();
  -[NSLock lock](self->_inFlightRenderJobsLock, "lock");
  begin = (PVRenderJob **)self->_inFlightRenderJobs.__begin_;
  end = (PVRenderJob **)self->_inFlightRenderJobs.__end_;
  if (begin != end)
  {
    v7 = *(PVRenderJob **)a3.var0;
    v8 = -(uint64_t)begin;
    while (*begin != v7)
    {
      ++begin;
      v8 -= 8;
      if (begin == end)
        goto LABEL_13;
    }
    if (PVRenderJob::State(v7) == 4)
      -[PVRendererBase addFrameStats:](self, "addFrameStats:", PVRenderJob::GetFrameStats(*begin));
    if (*begin)
      (*(void (**)(_QWORD))(*(_QWORD *)*begin + 24))(*begin);
    *begin = 0;
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,HGRef<PVRenderJob> *,HGRef<PVRenderJob> *,HGRef<PVRenderJob> *,0>((uint64_t *)(8 - v8), (uint64_t *)self->_inFlightRenderJobs.__end_, (uint64_t *)-v8);
    std::vector<HGRef<PVRenderJob>>::__base_destruct_at_end[abi:ne180100](&self->_inFlightRenderJobs.__begin_, v9);
  }
LABEL_13:
  -[NSLock unlock](self->_inFlightRenderJobsLock, "unlock");
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v10) >= 1)
    kdebug_trace();
}

- (void)setOutputColorSpace:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = atomic_load((unsigned __int8 *)&self->_hasRendered);
  if ((v4 & 1) != 0)
  {
    NSLog(CFSTR("%@: WARNING: Cannot change color space after use! Ignoring"), self);
  }
  else
  {
    -[PVRendererBase compositingContext](self, "compositingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputColorSpace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v9);

    if ((v7 & 1) == 0)
    {
      -[PVRendererBase compositingContext](self, "compositingContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setOutputColorSpace:", v9);

      -[PVRendererBase updateDestinationFormatForOutputColorSpace](self, "updateDestinationFormatForOutputColorSpace");
    }
  }

}

- (void)cleanupMemoryCaches
{
  +[PVEffectResources clearAllCachesAndPools](PVEffectResources, "clearAllCachesAndPools");
}

- (unsigned)frameCount
{
  return atomic_load(&self->_frameCount.__a_.__a_value);
}

- (void)setName:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  HGSynchronizable *perfStatsLock;
  char v8;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = &stru_1E65EDDA0;
  objc_storeStrong((id *)&self->_name, v6);
  perfStatsLock = self->_perfStatsLock;
  v8 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  PVPerfStats::SetName((PVPerfStats *)self->_perfStats, (__CFString *)self->_name);
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);

}

- (void)addFrameStats:(const void *)a3
{
  HGSynchronizable *perfStatsLock;
  char v6;

  if (PVPerfStats::FrameStats::GetSize((PVPerfStats::FrameStats *)a3))
  {
    perfStatsLock = self->_perfStatsLock;
    v6 = 0;
    HGSynchronizable::Lock(perfStatsLock);
    if (self->_trackStats)
      PVPerfStats::AddFrameStats((PVPerfStats *)self->_perfStats, (const PVPerfStats::FrameStats *)a3);
    HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  }
}

- (void)trackStats:(BOOL)a3
{
  HGSynchronizable *perfStatsLock;
  char v6;

  perfStatsLock = self->_perfStatsLock;
  v6 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  self->_trackStats = a3;
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
}

- (void)printAndClearStats
{
  -[PVRendererBase printAndClearStats:](self, "printAndClearStats:", 1);
}

- (void)printAndClearStats:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (-[PVRendererBase printAndClearStats:]::onceToken != -1)
    dispatch_once(&-[PVRendererBase printAndClearStats:]::onceToken, &__block_literal_global_30);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PVRendererBase_printAndClearStats___block_invoke_2;
  v5[3] = &unk_1E64D53A0;
  v5[4] = self;
  v6 = a3;
  dispatch_sync((dispatch_queue_t)-[PVRendererBase printAndClearStats:]::sSerialLogger, v5);
}

void __37__PVRendererBase_printAndClearStats___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.ProVideo.RenderLogQ", 0);
  v1 = (void *)-[PVRendererBase printAndClearStats:]::sSerialLogger;
  -[PVRendererBase printAndClearStats:]::sSerialLogger = (uint64_t)v0;

}

void __37__PVRendererBase_printAndClearStats___block_invoke_2(uint64_t a1)
{
  HGSynchronizable *v2;
  char v3;

  v2 = *(HGSynchronizable **)(*(_QWORD *)(a1 + 32) + 48);
  v3 = 0;
  HGSynchronizable::Lock(v2);
  PVPerfStats::Print(*(PVPerfStats **)(*(_QWORD *)(a1 + 32) + 56), 0, 1);
  if (*(_BYTE *)(a1 + 40))
    PVPerfStats::Reset(*(PVPerfStats **)(*(_QWORD *)(a1 + 32) + 56));
  HGSynchronizer::~HGSynchronizer(&v2);
}

- (double)windowedFPS
{
  double v3;
  HGSynchronizable *perfStatsLock;
  char v6;

  perfStatsLock = self->_perfStatsLock;
  v6 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  v3 = PVPerfStats::WindowedFPS((PVPerfStats *)self->_perfStats);
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  return v3;
}

- (double)numFrames
{
  double v3;
  HGSynchronizable *perfStatsLock;
  char v6;

  perfStatsLock = self->_perfStatsLock;
  v6 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  v3 = PVPerfStats::NumFrames((PVPerfStats *)self->_perfStats);
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  return v3;
}

- (double)averageStat:(int)a3
{
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double ValueForIndex;
  _OWORD v11[2];
  _BYTE v12[26];
  void *__p;
  void *v14;
  uint64_t v15;
  HGSynchronizable *perfStatsLock;
  char v17;

  perfStatsLock = self->_perfStatsLock;
  v17 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  v5 = PVPerfStats::AverageFrameStats((PVPerfStats *)self->_perfStats);
  v6 = *(_OWORD *)v5;
  v7 = *(_OWORD *)(v5 + 16);
  v8 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&v12[10] = *(_OWORD *)(v5 + 42);
  v11[1] = v7;
  *(_OWORD *)v12 = v8;
  v11[0] = v6;
  v14 = 0;
  v15 = 0;
  __p = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)(v5 + 64), *(_QWORD *)(v5 + 72), (uint64_t)(*(_QWORD *)(v5 + 72) - *(_QWORD *)(v5 + 64)) >> 3);
  ValueForIndex = PVPerfStats::FrameStats::GetValueForIndex((PVPerfStats::FrameStats *)v11, a3);
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  return ValueForIndex;
}

- (double)getLastStat:(int)a3
{
  uint64_t FrameStats;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double ValueForIndex;
  _OWORD v11[2];
  _BYTE v12[26];
  void *__p;
  void *v14;
  uint64_t v15;
  HGSynchronizable *perfStatsLock;
  char v17;

  perfStatsLock = self->_perfStatsLock;
  v17 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  FrameStats = PVPerfStats::LastFrameStats((PVPerfStats *)self->_perfStats);
  v6 = *(_OWORD *)FrameStats;
  v7 = *(_OWORD *)(FrameStats + 16);
  v8 = *(_OWORD *)(FrameStats + 32);
  *(_OWORD *)&v12[10] = *(_OWORD *)(FrameStats + 42);
  v11[1] = v7;
  *(_OWORD *)v12 = v8;
  v11[0] = v6;
  v14 = 0;
  v15 = 0;
  __p = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)(FrameStats + 64), *(_QWORD *)(FrameStats + 72), (uint64_t)(*(_QWORD *)(FrameStats + 72) - *(_QWORD *)(FrameStats + 64)) >> 3);
  ValueForIndex = PVPerfStats::FrameStats::GetValueForIndex((PVPerfStats::FrameStats *)v11, a3);
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  return ValueForIndex;
}

- (unint64_t)taskResidentSize
{
  _OWORD v3[4];

  memset(v3, 0, sizeof(v3));
  PVGetMemUsageStats((uint64_t)v3);
  return *((_QWORD *)&v3[0] + 1);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVRendererBase name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PVRendererBase name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", &stru_1E65EDDA0);

    if ((v6 & 1) == 0)
    {
      -[PVRendererBase name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v8;
    }
  }
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(">"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PVVideoCompositingContext)compositingContext
{
  return self->_compositingContext;
}

- (void)setCompositingContext:(id)a3
{
  objc_storeStrong((id *)&self->_compositingContext, a3);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)immediatelyCancelPendingRequests
{
  return self->_immediatelyCancelPendingRequests;
}

- (void)setImmediatelyCancelPendingRequests:(BOOL)a3
{
  self->_immediatelyCancelPendingRequests = a3;
}

- (void).cxx_destruct
{
  vector<HGRef<PVRenderJob>, std::allocator<HGRef<PVRenderJob>>> *p_inFlightRenderJobs;

  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_compositingContext, 0);
  objc_storeStrong((id *)&self->_inFlightRenderJobsLock, 0);
  p_inFlightRenderJobs = &self->_inFlightRenderJobs;
  std::vector<HGRef<PVRenderJob>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_inFlightRenderJobs);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
