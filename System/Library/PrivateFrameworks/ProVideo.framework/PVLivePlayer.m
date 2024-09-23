@implementation PVLivePlayer

- (PVLivePlayer)initWithOptions:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  char *v8;
  PVLivePlayer *v9;
  id *v10;
  void *v11;
  PVRenderer *v12;
  void *v13;
  void *v14;
  HGRenderQueue *v15;
  HGRenderQueue *v16;
  PerfTimer *v17;
  uint64_t v18;
  id *v19;
  id *v20;
  PVPerfStats *v21;
  id *v22;
  unsigned int *v23;
  PVTaskTokenPool *v24;
  uint64_t v25;
  uint64_t v26;
  PVTaskTokenPool *tokenPool;
  objc_super v29;
  id *v30;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PVLivePlayer;
  v8 = -[PVLivePlayer init](&v29, sel_init);
  v9 = (PVLivePlayer *)v8;
  if (v8)
  {
    v10 = (id *)operator new();
    *v10 = dispatch_queue_create("com.apple.PVLivePlayer.Lock", 0);
    v30 = 0;
    std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)v8 + 1, v10);
    std::unique_ptr<PVGCDLock>::reset[abi:ne180100](&v30, 0);
    v11 = (void *)*((_QWORD *)v8 + 27);
    *((_QWORD *)v8 + 27) = 0;

    v12 = -[PVRenderer initWithOptions:]([PVRenderer alloc], "initWithOptions:", v6);
    v13 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = v12;

    objc_storeWeak((id *)v8 + 6, v7);
    v14 = (void *)*((_QWORD *)v8 + 8);
    *((_QWORD *)v8 + 8) = 0;

    v8[211] = 1;
    objc_msgSend(v8, "resetRenderTime");
    *((_QWORD *)v8 + 18) = 0;
    *((_QWORD *)v8 + 10) = 0;
    v15 = (HGRenderQueue *)HGObject::operator new(0x2F0uLL);
    HGRenderQueue::HGRenderQueue(v15);
    v16 = (HGRenderQueue *)*((_QWORD *)v8 + 9);
    if (v16 == v15)
    {
      if (v15)
      {
        (*(void (**)(HGRenderQueue *))(*(_QWORD *)v15 + 24))(v15);
        v15 = (HGRenderQueue *)*((_QWORD *)v8 + 9);
      }
    }
    else
    {
      if (v16)
        (*(void (**)(HGRenderQueue *))(*(_QWORD *)v16 + 24))(v16);
      *((_QWORD *)v8 + 9) = v15;
    }
    HGRenderQueue::Start(v15);
    v17 = (PerfTimer *)operator new();
    PerfTimer::PerfTimer(v17);
    v18 = *((_QWORD *)v8 + 23);
    *((_QWORD *)v8 + 23) = v17;
    if (v18)
      MEMORY[0x1B5E29170](v18, 0x1000C40451B5BE8);
    v19 = (id *)operator new();
    *v19 = dispatch_queue_create("com.apple.PVLivePlayer.StatsLock", 0);
    v30 = 0;
    std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)v8 + 24, v19);
    std::unique_ptr<PVGCDLock>::reset[abi:ne180100](&v30, 0);
    v20 = (id *)operator new();
    *v20 = &unk_1E64D5EE8;
    v21 = (PVPerfStats *)operator new();
    v30 = v20;
    PVPerfStats::PVPerfStats(v21, &v30);
    v22 = v30;
    v30 = 0;
    if (v22)
      MEMORY[0x1B5E29170](v22, 0x81C40B8603338);
    std::unique_ptr<PVPerfStats>::reset[abi:ne180100]((PVPerfStats **)v8 + 25, v21);
    v8[208] = 0;
    atomic_store(0, (unsigned int *)v8 + 15);
    atomic_store(0, (unsigned int *)v8 + 38);
    v23 = (unsigned int *)(v8 + 168);
    atomic_store(0x32C8u, v23);
    v24 = [PVTaskTokenPool alloc];
    v25 = atomic_load(v23);
    v26 = -[PVTaskTokenPool initWithOffset:](v24, "initWithOffset:", v25);
    tokenPool = v9->_tokenPool;
    v9->_tokenPool = (PVTaskTokenPool *)v26;

    -[PVLivePlayer setQueueSize:](v9, "setQueueSize:", 2);
    -[PVLivePlayer setLowerGCDPriority:](v9, "setLowerGCDPriority:", 0);
    -[PVLivePlayer setLowerGPUPriority:](v9, "setLowerGPUPriority:", 0);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[PVLivePlayer printAndClearStats:](self, "printAndClearStats:", 1);
  if (-[PVLivePlayer status](self, "status") != 3)
  {
    NSLog(CFSTR("%@ -dealloc without -shutdown!"), self);
    -[PVLivePlayer shutdown](self, "shutdown");
  }
  v3.receiver = self;
  v3.super_class = (Class)PVLivePlayer;
  -[PVLivePlayer dealloc](&v3, sel_dealloc);
}

- (void)setSource:(id)a3 inputID:(unsigned int)a4
{
  id v6;
  PVGCDLock *value;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  PVLivePlayer *v12;
  unsigned int v13;

  v6 = a3;
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PVLivePlayer_setSource_inputID___block_invoke;
  block[3] = &unk_1E64D8808;
  v11 = v6;
  v12 = self;
  v13 = a4;
  v8 = *(NSObject **)value;
  v9 = v6;
  dispatch_sync(v8, block);

}

void __34__PVLivePlayer_setSource_inputID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t **v3;
  unsigned int *v4;
  uint64_t **v5;
  _DWORD *v6;

  v2 = *(void **)(a1 + 32);
  v3 = (uint64_t **)(*(_QWORD *)(a1 + 40) + 16);
  v4 = (unsigned int *)(a1 + 48);
  if (v2)
  {
    v6 = (_DWORD *)(a1 + 48);
    v5 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v3, v4, (uint64_t)&std::piecewise_construct, &v6);
    objc_storeStrong((id *)v5 + 5, v2);
  }
  else
  {
    std::__tree<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>>>::__erase_unique<unsigned int>((uint64_t)v3, v4);
  }
}

- (id)playerSources
{
  PVGCDLock *value;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = (id)objc_opt_new();
  value = self->_lock.__ptr_.__value_;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__PVLivePlayer_playerSources__block_invoke;
  v6[3] = &unk_1E64D6458;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(*(dispatch_queue_t *)value, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __29__PVLivePlayer_playerSources__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(v1 + 16);
  v3 = (_QWORD *)(v1 + 24);
  if (v2 != (_QWORD *)(v1 + 24))
  {
    do
    {
      v5 = *((unsigned int *)v2 + 8);
      v6 = (id)v2[5];
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

      v9 = (_QWORD *)v2[1];
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (_QWORD *)v2[2];
          v11 = *v10 == (_QWORD)v2;
          v2 = v10;
        }
        while (!v11);
      }
      v2 = v10;
    }
    while (v10 != v3);
  }
}

- (BOOL)throttledBypassRenderLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[PVLivePlayer thermalThrottlingPolicy](self, "thermalThrottlingPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = 0;
LABEL_6:
    v8 = -[PVLivePlayer bypassRenderLink](self, "bypassRenderLink");
    goto LABEL_7;
  }
  -[PVLivePlayer thermalThrottlingPolicy](self, "thermalThrottlingPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "populatedControlParametersForCurrentThermalLevel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "playerBypassRenderLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  objc_msgSend(v5, "playerBypassRenderLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

LABEL_7:
  return v8;
}

- (void)setQueueSize:(unsigned int)a3
{
  atomic_store(a3, &self->_queueSize);
  -[PVLivePlayer updateRenderQueueUnits](self, "updateRenderQueueUnits");
}

- (unsigned)queueSize
{
  return atomic_load(&self->_queueSize);
}

- (void)updateRenderQueueUnits
{
  PVGCDLock *value;
  _QWORD block[5];

  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PVLivePlayer_updateRenderQueueUnits__block_invoke;
  block[3] = &unk_1E64D47C0;
  block[4] = self;
  dispatch_sync(*(dispatch_queue_t *)value, block);
}

HGSynchronizable *__38__PVLivePlayer_updateRenderQueueUnits__block_invoke(uint64_t a1)
{
  _DWORD *v2;
  unsigned int v3;
  HGSynchronizable *result;
  unsigned int v5;
  _DWORD *v6;
  unsigned int v7;

  v2 = *(_DWORD **)(a1 + 32);
  v3 = v2[20];
  result = (HGSynchronizable *)objc_msgSend(v2, "queueSize");
  if (v3 < result)
  {
    v5 = result;
    do
    {
      HGRenderQueue::AddUserJobQueue(*(HGRenderQueue **)(*(_QWORD *)(a1 + 32) + 72));
      ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v6 = *(_DWORD **)(a1 + 32);
      v7 = v6[20];
      result = (HGSynchronizable *)objc_msgSend(v6, "queueSize");
    }
    while (v7 < result);
    if (v3 < v5)
      return HGRenderQueue::Start(*(HGRenderQueue **)(*(_QWORD *)(a1 + 32) + 72));
  }
  return result;
}

- (unsigned)_throttledQueueSize_NoLock
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[PVLivePlayer queueSize](self, "queueSize");
  -[PVLivePlayer thermalThrottlingPolicy](self, "thermalThrottlingPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PVLivePlayer thermalThrottlingPolicy](self, "thermalThrottlingPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "populatedControlParametersForCurrentThermalLevel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "playerQueueSize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "playerQueueSize");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "unsignedIntegerValue");

    }
  }
  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  PVGCDLock *value;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v8;
  uint64_t v9;
  __n128 (*v10)(__n128 *, __n128 *);
  uint64_t (*v11)();
  void *v12;

  v7 = 0;
  v8 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v7;
  v9 = 0x4812000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__10;
  v12 = &unk_1B3948866;
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__PVLivePlayer_renderTime__block_invoke;
  block[3] = &unk_1E64D5490;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(*(dispatch_queue_t *)value, block);
  *retstr = v8[2];
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __26__PVLivePlayer_renderTime__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 *v2;
  __n128 result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(v1 + 88);
  v2[4].n128_u64[0] = *(_QWORD *)(v1 + 104);
  v2[3] = result;
  return result;
}

- (void)resetRenderTime
{
  PVGCDLock *value;
  _QWORD block[5];

  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PVLivePlayer_resetRenderTime__block_invoke;
  block[3] = &unk_1E64D47C0;
  block[4] = self;
  dispatch_sync(*(dispatch_queue_t *)value, block);
}

__n128 __31__PVLivePlayer_resetRenderTime__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = MEMORY[0x1E0CA2E68];
  result = *(__n128 *)MEMORY[0x1E0CA2E68];
  *(_OWORD *)(v1 + 88) = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(v1 + 104) = *(_QWORD *)(v2 + 16);
  atomic_store(0, (unsigned int *)(*(_QWORD *)(a1 + 32) + 152));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  return result;
}

- (void)start
{
  if (-[PVLivePlayer status](self, "status") != 3)
  {
    atomic_store(1u, (unsigned int *)&self->_playerStatus);
    PerfTimer::Start(self->_statLogTimer.__ptr_.__value_);
  }
}

- (void)stop
{
  if (-[PVLivePlayer status](self, "status") != 3)
  {
    atomic_store(0, (unsigned int *)&self->_playerStatus);
    -[PVLivePlayer printAndClearStats:](self, "printAndClearStats:", 1);
  }
}

- (void)shutdown
{
  if (-[PVLivePlayer status](self, "status") != 3)
  {
    atomic_store(3u, (unsigned int *)&self->_playerStatus);
    -[PVLivePlayerRenderLink registerWithPlayer:](self->_renderLink, "registerWithPlayer:", 0);
    -[PVLivePlayerRenderLink teardown](self->_renderLink, "teardown");
    HGRenderQueue::Pause(self->_playerQueue.m_Obj);
    HGRenderQueue::CancelAllRenderJobs(self->_playerQueue.m_Obj, 1);
    HGRenderQueue::CancelUserJobs(self->_playerQueue.m_Obj, 1);
    HGRenderQueue::Drain(self->_playerQueue.m_Obj);
    HGRenderQueue::Shutdown(self->_playerQueue.m_Obj);
  }
}

- (void)flush
{
  HGRenderQueue::Pause(self->_playerQueue.m_Obj);
  HGRenderQueue::CancelAllRenderJobs(self->_playerQueue.m_Obj, 1);
  HGRenderQueue::CancelUserJobs(self->_playerQueue.m_Obj, 1);
  -[PVRendererBase cancelAllPendingRequests](self->_renderer, "cancelAllPendingRequests");
  +[PVEffectResources flushEngine](PVEffectResources, "flushEngine");
  HGRenderQueue::Restart(self->_playerQueue.m_Obj);
}

- (int)status
{
  return atomic_load((unsigned int *)&self->_playerStatus);
}

- (void)setStatus:(int)a3
{
  atomic_store(a3, (unsigned int *)&self->_playerStatus);
}

- (void)setOutputColorSpace:(id)a3
{
  -[PVRendererBase setOutputColorSpace:](self->_renderer, "setOutputColorSpace:", a3);
}

- (PVColorSpace)outputColorSpace
{
  void *v2;
  void *v3;

  -[PVRendererBase compositingContext](self->_renderer, "compositingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PVColorSpace *)v3;
}

- (void)setPrimaryPlayer:(id)a3
{
  id v4;
  PVGCDLock *value;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PVLivePlayer_setPrimaryPlayer___block_invoke;
  block[3] = &unk_1E64D47E8;
  block[4] = self;
  v9 = v4;
  v6 = *(NSObject **)value;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __33__PVLivePlayer_setPrimaryPlayer___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  void *v6;
  PVGCDLock *value;
  id v8;
  _QWORD block[5];

  v8 = a3;
  v4 = (NSString *)objc_msgSend(v8, "copy");
  name = self->_name;
  self->_name = v4;

  -[NSString stringByAppendingString:](self->_name, "stringByAppendingString:", CFSTR("_Renderer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVRendererBase setName:](self->_renderer, "setName:", v6);

  value = self->_perfStatsLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__PVLivePlayer_setName___block_invoke;
  block[3] = &unk_1E64D47C0;
  block[4] = self;
  dispatch_sync(*(dispatch_queue_t *)value, block);

}

void __24__PVLivePlayer_setName___block_invoke(uint64_t a1)
{
  PVPerfStats::SetName(*(PVPerfStats **)(*(_QWORD *)(a1 + 32) + 200), *(__CFString **)(*(_QWORD *)(a1 + 32) + 160));
}

- (void)setParentCode:(unsigned int)a3
{
  PVGCDLock *value;
  _QWORD v4[5];
  unsigned int v5;

  value = self->_lock.__ptr_.__value_;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__PVLivePlayer_setParentCode___block_invoke;
  v4[3] = &unk_1E64D8830;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(*(dispatch_queue_t *)value, v4);
}

void __30__PVLivePlayer_setParentCode___block_invoke(uint64_t a1)
{
  PVTaskTokenPool *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  atomic_store(*(_DWORD *)(a1 + 40), (unsigned int *)(*(_QWORD *)(a1 + 32) + 168));
  v2 = [PVTaskTokenPool alloc];
  v3 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 168));
  v4 = -[PVTaskTokenPool initWithOffset:](v2, "initWithOffset:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v4;

}

- (unint64_t)getPackedFamilyCode:(unsigned int)a3
{
  uint64_t v3;

  v3 = atomic_load(&self->_parentCode);
  return a3 | (unint64_t)(v3 << 32);
}

- (id)getTaskToken
{
  PVGCDLock *value;
  id v3;
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
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  value = self->_lock.__ptr_.__value_;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__PVLivePlayer_getTaskToken__block_invoke;
  v5[3] = &unk_1E64D5490;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__PVLivePlayer_getTaskToken__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "getToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setRenderLink:(id)a3
{
  id v4;
  PVGCDLock *value;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PVLivePlayer_setRenderLink___block_invoke;
  block[3] = &unk_1E64D47E8;
  block[4] = self;
  v9 = v4;
  v6 = *(NSObject **)value;
  v7 = v4;
  dispatch_sync(v6, block);

}

uint64_t __30__PVLivePlayer_setRenderLink___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  if (v3)
  {
    objc_msgSend(v3, "registerWithPlayer:", 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 216), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "registerWithPlayer:");
}

- (void)renderLinkSignalDropped
{
  const char *v2;

  -[PVLivePlayer getPackedFamilyCode:](self, "getPackedFamilyCode:", 0);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v2) >= 1)
    kdebug_trace();
}

- (void)renderLinkSignalSkipped
{
  const char *v3;

  if (-[PVLivePlayer status](self, "status"))
  {
    -[PVLivePlayer getPackedFamilyCode:](self, "getPackedFamilyCode:", 0);
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v3) >= 1)
      kdebug_trace();
  }
}

- (void)renderLinkSignal:(id *)a3
{
  const char *v5;
  PVGCDLock *value;
  __int128 v7;
  uint64_t v8;
  _QWORD block[6];
  __int128 v10;
  int64_t var3;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  __n128 (*v15)(__n128 *, __n128 *);
  uint64_t (*v16)();
  void *v17;

  if (-[PVLivePlayer status](self, "status"))
  {
    -[PVLivePlayer getPackedFamilyCode:](self, "getPackedFamilyCode:", 0);
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v5) >= 1)
      kdebug_trace();
    v12 = 0;
    v13 = &v12;
    v14 = 0x4812000000;
    v15 = __Block_byref_object_copy__9;
    v16 = __Block_byref_object_dispose__10;
    v17 = &unk_1B3948866;
    value = self->_lock.__ptr_.__value_;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PVLivePlayer_renderLinkSignal___block_invoke;
    block[3] = &unk_1E64D8858;
    v10 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    block[4] = self;
    block[5] = &v12;
    dispatch_sync(*(dispatch_queue_t *)value, block);
    v7 = *((_OWORD *)v13 + 3);
    v8 = v13[8];
    -[PVLivePlayer _renderLinkSignal:](self, "_renderLinkSignal:", &v7);
    -[PVLivePlayer _statsLogCheck](self, "_statsLogCheck");
    _Block_object_dispose(&v12, 8);
  }
}

__n128 __33__PVLivePlayer_renderLinkSignal___block_invoke(__n128 *a1)
{
  unint64_t v2;
  __n128 *v3;
  __n128 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 *v8;
  __n128 result;
  CMTime v10;
  CMTime v11;
  CMTime v12;
  CMTime rhs;
  CMTime lhs;
  CMTime v15;

  v2 = a1[2].n128_u64[0];
  v3 = a1 + 3;
  if (*(_BYTE *)(v2 + 136))
  {
    *(__n128 *)&lhs.value = *v3;
    lhs.epoch = a1[4].n128_i64[0];
    rhs = *(CMTime *)(v2 + 112);
    CMTimeSubtract(&v15, &lhs, &rhs);
  }
  else
  {
    v4 = *v3;
    *(_QWORD *)(v2 + 128) = a1[4].n128_u64[0];
    *(__n128 *)(v2 + 112) = v4;
    *(_BYTE *)(a1[2].n128_u64[0] + 136) = 1;
    v15 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  }
  v11 = *(CMTime *)(a1[2].n128_u64[0] + 88);
  v10 = v15;
  CMTimeAdd(&v12, &v11, &v10);
  *(CMTime *)(a1[2].n128_u64[0] + 88) = v12;
  v5 = a1[2].n128_u64[0];
  v6 = *(_QWORD *)(a1[2].n128_u64[1] + 8);
  v7 = *(_QWORD *)(v5 + 104);
  *(_OWORD *)(v6 + 48) = *(_OWORD *)(v5 + 88);
  *(_QWORD *)(v6 + 64) = v7;
  v8 = (__n128 *)a1[2].n128_u64[0];
  result = a1[3];
  v8[8].n128_u64[0] = a1[4].n128_u64[0];
  v8[7] = result;
  return result;
}

- (void)_renderLinkSignal:(id *)a3
{
  PVTaskToken *v5;
  double v6;
  char *v7;
  uint64_t (***FrameStatsDescription)(_QWORD);
  int v9;
  unsigned int *p_frameCount;
  int v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  if (-[PVLivePlayer status](self, "status") != 3
    && !-[PVLivePlayer _dropFrameForSaturatedPrimaryPlayer](self, "_dropFrameForSaturatedPrimaryPlayer")
    && !-[PVLivePlayer _dropFrameForFullQueue](self, "_dropFrameForFullQueue"))
  {
    -[PVLivePlayer getTaskToken](self, "getTaskToken");
    v5 = (PVTaskToken *)objc_claimAutoreleasedReturnValue();
    v6 = CACurrentMediaTime();
    v7 = (char *)HGObject::operator new(0xD0uLL);
    v12 = *a3;
    PVRenderLinkJob::PVRenderLinkJob((PVRenderLinkJob *)v7, self, (CMTime *)&v12, v6, v5);
    FrameStatsDescription = (uint64_t (***)(_QWORD))PVPerfStats::GetFrameStatsDescription(self->_perfStats.__ptr_.__value_);
    v9 = (**FrameStatsDescription)(FrameStatsDescription);
    p_frameCount = &self->_frameCount;
    do
      v11 = __ldaxr(p_frameCount);
    while (__stlxr(v11 + 1, p_frameCount));
    PVPerfStats::FrameStats::Init((PVPerfStats::FrameStats *)(v7 + 120), v9, v11);
    HGRenderQueue::EnqueueUserJob(self->_playerQueue.m_Obj, (HGUserJob *)v7);
    if (v7)
      (*(void (**)(char *))(*(_QWORD *)v7 + 24))(v7);

  }
}

- (BOOL)_dropFrameForSaturatedPrimaryPlayer
{
  PVGCDLock *value;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  value = self->_lock.__ptr_.__value_;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PVLivePlayer__dropFrameForSaturatedPrimaryPlayer__block_invoke;
  v6[3] = &unk_1E64D6458;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(*(dispatch_queue_t *)value, v6);
  if (*((_BYTE *)v8 + 24))
  {
    -[PVLivePlayer _notifyDelegateOfDroppedFrame:](self, "_notifyDelegateOfDroppedFrame:", 1);
    v4 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__51__PVLivePlayer__dropFrameForSaturatedPrimaryPlayer__block_invoke(uint64_t a1)
{
  void *result;
  const char *v3;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (result)
  {
    result = (void *)objc_msgSend(result, "status");
    if ((_DWORD)result == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "getPackedFamilyCode:", 0);
      result = (void *)HGLogger::getLevel((HGLogger *)"PVSignPost", v3);
      if ((int)result >= 1)
        result = (void *)kdebug_trace();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (BOOL)_dropFrameForFullQueue
{
  PVGCDLock *value;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  value = self->_lock.__ptr_.__value_;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PVLivePlayer__dropFrameForFullQueue__block_invoke;
  v6[3] = &unk_1E64D6458;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(*(dispatch_queue_t *)value, v6);
  if (*((_BYTE *)v8 + 24))
  {
    -[PVLivePlayer _notifyDelegateOfDroppedFrame:](self, "_notifyDelegateOfDroppedFrame:", 0);
    v4 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __38__PVLivePlayer__dropFrameForFullQueue__block_invoke(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_throttledQueueSize_NoLock");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 84);
  if (v4 >= v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "getPackedFamilyCode:", 0);
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v7) >= 1)
      kdebug_trace();
    result = objc_msgSend(*(id *)(a1 + 32), "setStatus:", 2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *(_DWORD *)(v3 + 84) = v4 + 1;
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 84) >= v2)
    {
      v5 = *(void **)(a1 + 32);
      v6 = 2;
    }
    else
    {
      v5 = *(void **)(a1 + 32);
      v6 = 1;
    }
    return objc_msgSend(v5, "setStatus:", v6);
  }
  return result;
}

- (void)_notifyDelegateOfDroppedFrame:(int)a3
{
  uint64_t v3;
  id WeakRetained;
  void *v6;
  _BYTE v7[24];

  v3 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PVLivePlayer readSourceFrameSets:](self, "readSourceFrameSets:", CACurrentMediaTime());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVLivePlayer renderTime](self, "renderTime");
    objc_msgSend(WeakRetained, "livePlayerDroppedFrame:sources:time:", v3, v6, v7);

  }
}

- (id)readSourceFrameSets:(double)a3
{
  PVGCDLock *value;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  v14 = (id)objc_opt_new();
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PVLivePlayer_readSourceFrameSets___block_invoke;
  block[3] = &unk_1E64D8880;
  block[4] = self;
  block[5] = &v9;
  *(double *)&block[6] = a3;
  dispatch_sync(*(dispatch_queue_t *)value, block);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __36__PVLivePlayer_readSourceFrameSets___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(v1 + 16);
  if (v2 != (_QWORD *)(v1 + 24))
  {
    do
    {
      v4 = *((unsigned int *)v2 + 8);
      v5 = (id)v2[5];
      objc_msgSend(v5, "imageBufferForHostTime:", *(double *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

      v9 = (_QWORD *)v2[1];
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (_QWORD *)v2[2];
          v11 = *v10 == (_QWORD)v2;
          v2 = v10;
        }
        while (!v11);
      }
      v2 = v10;
    }
    while (v10 != (_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  }
}

- (void)handleRenderLinkJob:(HGRef<PVRenderLinkJob>)a3
{
  unint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  double v9;
  id WeakRetained;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  PVRenderer *renderer;
  uint64_t v19;
  _QWORD v20[7];
  uint64_t v21;
  _QWORD v22[6];
  PerfTimer v23;
  __int128 v24;
  uint64_t v25;
  PerfTimer v26;
  uint64_t v27;
  PerfTimer v28;
  uint64_t v29;

  if (HGGLBlendingInfo::GetRGBOperation(*(HGGLBlendingInfo **)a3.var0) == 4)
  {
    v29 = *(_QWORD *)a3.var0;
    if (v29)
      (*(void (**)(uint64_t))(*(_QWORD *)v29 + 16))(v29);
    -[PVLivePlayer renderLinkJobFinished:](self, "renderLinkJobFinished:", &v29);
    if (v29)
      (*(void (**)(uint64_t))(*(_QWORD *)v29 + 24))(v29);
  }
  else
  {
    PerfTimer::PerfTimer(&v28);
    v5 = -[PVLivePlayer getPackedFamilyCode:](self, "getPackedFamilyCode:", objc_msgSend(*(id *)(*(_QWORD *)a3.var0 + 112), "tokenId"));
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v6) >= 1)
      kdebug_trace();
    -[PVLivePlayer readSourceFrameSets:](self, "readSourceFrameSets:", *(double *)(*(_QWORD *)a3.var0 + 104));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)a3.var0;
    v9 = PerfTimer::End(&v28);
    PVPerfStats::FrameStats::SetValueForIndex(v8 + 120, 0, v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakDelegate);
    if (WeakRetained)
    {
      PerfTimer::PerfTimer(&v26);
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v11) >= 1)
        kdebug_trace();
      v12 = *(_QWORD *)a3.var0;
      v24 = *(_OWORD *)(*(_QWORD *)a3.var0 + 80);
      v25 = *(_QWORD *)(v12 + 96);
      objc_msgSend(WeakRetained, "buildRenderRequest:time:", v7, &v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PVLivePlayer lowerGCDPriority](self, "lowerGCDPriority"))
        objc_msgSend(v13, "setGcdPriority:", 0);
      if (-[PVLivePlayer lowerGPUPriority](self, "lowerGPUPriority"))
        objc_msgSend(v13, "setGpuPriority:", 0);
      objc_msgSend(v13, "setParentCode:", HIDWORD(v5));
      objc_msgSend(v13, "setChildCode:", v5);
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v14) >= 1)
        kdebug_trace();
      v15 = *(_QWORD *)a3.var0;
      v16 = PerfTimer::End(&v26);
      PVPerfStats::FrameStats::SetValueForIndex(v15 + 120, 1u, v16);
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x4012000000;
      v22[3] = __Block_byref_object_copy__18;
      v22[4] = __Block_byref_object_dispose__19;
      v22[5] = &unk_1B3948866;
      PerfTimer::PerfTimer(&v23);
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v17) >= 1)
        kdebug_trace();
      renderer = self->_renderer;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3321888768;
      v20[2] = __36__PVLivePlayer_handleRenderLinkJob___block_invoke;
      v20[3] = &unk_1E64D88E0;
      v19 = *(_QWORD *)a3.var0;
      v20[6] = v5;
      v21 = v19;
      if (v19)
        (*(void (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
      v20[4] = self;
      v20[5] = v22;
      -[PVRenderer startRenderRequest:completionHandler:](renderer, "startRenderRequest:completionHandler:", v13, v20);
      if (v21)
        (*(void (**)(uint64_t))(*(_QWORD *)v21 + 24))(v21);
      _Block_object_dispose(v22, 8);

    }
    else
    {
      v27 = *(_QWORD *)a3.var0;
      if (v27)
        (*(void (**)(uint64_t))(*(_QWORD *)v27 + 16))(v27);
      -[PVLivePlayer renderLinkJobFinished:](self, "renderLinkJobFinished:", &v27);
      if (v27)
        (*(void (**)(uint64_t))(*(_QWORD *)v27 + 24))(v27);
    }

  }
}

void __36__PVLivePlayer_handleRenderLinkJob___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v7) >= 1)
    kdebug_trace();
  v8 = a1[7];
  v9 = PerfTimer::End((PerfTimer *)(*(_QWORD *)(a1[5] + 8) + 48));
  PVPerfStats::FrameStats::SetValueForIndex(v8 + 120, 2u, v9);
  dispatch_get_global_queue(2, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __36__PVLivePlayer_handleRenderLinkJob___block_invoke_2;
  block[3] = &unk_1E64D88A8;
  v11 = a1[7];
  block[4] = a1[4];
  v17 = v11;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
  v18 = a1[6];
  v12 = v6;
  v15 = v12;
  v13 = v5;
  v16 = v13;
  dispatch_async(v10, block);

  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 24))(v17);

}

void __36__PVLivePlayer_handleRenderLinkJob___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  PerfTimer v21;
  uint64_t v22;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  if (WeakRetained)
  {
    PerfTimer::PerfTimer(&v21);
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v3) >= 1)
      kdebug_trace();
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 56);
    v20 = v5;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
    v7 = objc_msgSend(v4, "testOutOfOrderCompletion:", &v20);
    if (v20)
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
    if ((_DWORD)v7 && (int)HGLogger::getLevel((HGLogger *)"PVSignPost", v6) >= 1)
      kdebug_trace();
    objc_msgSend(WeakRetained, "renderRequestComplete:results:completedOutOfOrder:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7);
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v8) >= 1)
      kdebug_trace();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = PerfTimer::End(&v21);
    PVPerfStats::FrameStats::SetValueForIndex(v9 + 120, 3u, v10);
    v11 = PVPerfStats::FrameStats::MarkEndTimeForIndex((PVPerfStats::FrameStats *)(*(_QWORD *)(a1 + 56) + 120), 4u);
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 56);
    v19 = v13;
    if (v13)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v13 + 16))(v13, v11);
    objc_msgSend(v12, "renderLinkJobFinished:", &v19, v11);
    if (v19)
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 24))(v19);
    objc_msgSend(*(id *)(a1 + 32), "addStats:", *(_QWORD *)(a1 + 56) + 120);
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 56);
    v18 = v15;
    if (v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
    objc_msgSend(v14, "bypassRenderLink:", &v18);
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 24))(v18);
  }
  else
  {
    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 56);
    v22 = v17;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 16))(v17);
    objc_msgSend(v16, "renderLinkJobFinished:", &v22);
    if (v22)
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 24))(v22);
  }

}

- (BOOL)testOutOfOrderCompletion:(HGRef<PVRenderLinkJob>)a3
{
  PVGCDLock *value;
  uint64_t v5;
  int v6;
  _QWORD block[6];
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  value = self->_lock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __41__PVLivePlayer_testOutOfOrderCompletion___block_invoke;
  block[3] = &unk_1E64D8918;
  v5 = *(_QWORD *)a3.var0;
  v9 = v5;
  if (v5)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v5 + 16))(v5, a2);
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(*(dispatch_queue_t *)value, block);
  v6 = *((unsigned __int8 *)v11 + 24);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  _Block_object_dispose(&v10, 8);
  return v6 != 0;
}

_QWORD *__41__PVLivePlayer_testOutOfOrderCompletion___block_invoke(_QWORD *result)
{
  double v1;

  v1 = *(double *)(result[6] + 104);
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = v1 < *(double *)(result[4] + 144);
  *(double *)(result[4] + 144) = v1;
  return result;
}

- (void)renderLinkJobFinished:(HGRef<PVRenderLinkJob>)a3
{
  PVGCDLock *value;
  uint64_t v5;
  _QWORD v6[5];
  uint64_t v7;

  value = self->_lock.__ptr_.__value_;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3321888768;
  v6[2] = __38__PVLivePlayer_renderLinkJobFinished___block_invoke;
  v6[3] = &unk_1E64D8950;
  v5 = *(_QWORD *)a3.var0;
  v6[4] = self;
  v7 = v5;
  if (v5)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v5 + 16))(v5, a2);
  dispatch_sync(*(dispatch_queue_t *)value, v6);
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
}

uint64_t __38__PVLivePlayer_renderLinkJobFinished___block_invoke(uint64_t a1)
{
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
  if (objc_msgSend(*(id *)(a1 + 32), "status") != 3)
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "returnToken:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
}

- (void)bypassRenderLink:(HGRef<PVRenderLinkJob>)a3
{
  const char *v5;
  CMTime v6;
  CMTime time2;
  CMTime time1;
  CMTime v9;

  if (-[PVLivePlayer throttledBypassRenderLink](self, "throttledBypassRenderLink"))
  {
    if (-[PVLivePlayer _throttledQueueSize_NoLock](self, "_throttledQueueSize_NoLock") == 1)
    {
      memset(&v9, 0, sizeof(v9));
      -[PVLivePlayer renderTime](self, "renderTime");
      time1 = v9;
      time2 = *(CMTime *)(*(_QWORD *)a3.var0 + 80);
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v5) >= 1)
        {
          -[PVLivePlayer getPackedFamilyCode:](self, "getPackedFamilyCode:", 0);
          kdebug_trace();
        }
        v6 = v9;
        -[PVLivePlayer _renderLinkSignal:](self, "_renderLinkSignal:", &v6);
      }
    }
  }
}

- (void)trackStats:(BOOL)a3
{
  PVGCDLock *value;
  _QWORD v4[5];
  BOOL v5;

  value = self->_perfStatsLock.__ptr_.__value_;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__PVLivePlayer_trackStats___block_invoke;
  v4[3] = &unk_1E64D53A0;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(*(dispatch_queue_t *)value, v4);
}

uint64_t __27__PVLivePlayer_trackStats___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "trackStats:", *(unsigned __int8 *)(a1 + 40));
}

- (void)addStats:(const void *)a3
{
  PVGCDLock *value;
  _QWORD v6[6];

  if (PVPerfStats::FrameStats::GetSize((PVPerfStats::FrameStats *)a3))
  {
    value = self->_perfStatsLock.__ptr_.__value_;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __25__PVLivePlayer_addStats___block_invoke;
    v6[3] = &unk_1E64D8988;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(*(dispatch_queue_t *)value, v6);
  }
}

void __25__PVLivePlayer_addStats___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 208))
    PVPerfStats::AddFrameStats(*(PVPerfStats **)(v1 + 200), *(const PVPerfStats::FrameStats **)(a1 + 40));
}

- (void)printAndClearStats:(BOOL)a3
{
  unsigned __int8 v5;
  _QWORD v6[5];
  BOOL v7;

  {
    __cxa_atexit((void (*)(void *))std::unique_ptr<PVGCDLock>::~unique_ptr[abi:ne180100], &-[PVLivePlayer printAndClearStats:]::sSerialLogLock, &dword_1B2737000);
  }
  if (-[PVLivePlayer printAndClearStats:]::onceToken != -1)
    dispatch_once(&-[PVLivePlayer printAndClearStats:]::onceToken, &__block_literal_global_18);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PVLivePlayer_printAndClearStats___block_invoke_2;
  v6[3] = &unk_1E64D53A0;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(*(dispatch_queue_t *)-[PVLivePlayer printAndClearStats:]::sSerialLogLock, v6);
  PerfTimer::Start(self->_statLogTimer.__ptr_.__value_);
}

id **__35__PVLivePlayer_printAndClearStats___block_invoke()
{
  id *v0;
  id *v2;

  v0 = (id *)operator new();
  *v0 = dispatch_queue_create("com.apple.ProVideo.SerialLogging", 0);
  v2 = 0;
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&-[PVLivePlayer printAndClearStats:]::sSerialLogLock, v0);
  return std::unique_ptr<PVGCDLock>::reset[abi:ne180100](&v2, 0);
}

void __35__PVLivePlayer_printAndClearStats___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  dispatch_queue_t *v2;
  _QWORD v3[5];
  char v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(dispatch_queue_t **)(v1 + 192);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PVLivePlayer_printAndClearStats___block_invoke_3;
  v3[3] = &unk_1E64D53A0;
  v3[4] = v1;
  v4 = *(_BYTE *)(a1 + 40);
  dispatch_sync(*v2, v3);
}

void __35__PVLivePlayer_printAndClearStats___block_invoke_3(uint64_t a1)
{
  PVPerfStats::Print(*(PVPerfStats **)(*(_QWORD *)(a1 + 32) + 200), 0, 1);
  if (*(_BYTE *)(a1 + 40))
    PVPerfStats::Reset(*(PVPerfStats **)(*(_QWORD *)(a1 + 32) + 200));
}

- (void)_statsLogCheck
{
  if (PerfTimer::End(self->_statLogTimer.__ptr_.__value_) > 5.0)
    -[PVLivePlayer printAndClearStats:](self, "printAndClearStats:", 1);
}

- (double)getWindowedFPS
{
  return PVPerfStats::WindowedFPS(self->_perfStats.__ptr_.__value_);
}

- (PVLivePlayerRenderLink)renderLink
{
  return self->_renderLink;
}

- (PVLivePlayerThermalThrottlingPolicy)thermalThrottlingPolicy
{
  return self->_thermalThrottlingPolicy;
}

- (void)setThermalThrottlingPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_thermalThrottlingPolicy, a3);
}

- (BOOL)lowerGCDPriority
{
  return self->_lowerGCDPriority;
}

- (void)setLowerGCDPriority:(BOOL)a3
{
  self->_lowerGCDPriority = a3;
}

- (BOOL)lowerGPUPriority
{
  return self->_lowerGPUPriority;
}

- (void)setLowerGPUPriority:(BOOL)a3
{
  self->_lowerGPUPriority = a3;
}

- (BOOL)bypassRenderLink
{
  return self->_bypassRenderLink;
}

- (void)setBypassRenderLink:(BOOL)a3
{
  self->_bypassRenderLink = a3;
}

- (void).cxx_destruct
{
  PerfTimer *value;
  HGRenderQueue *m_Obj;

  objc_storeStrong((id *)&self->_thermalThrottlingPolicy, 0);
  objc_storeStrong((id *)&self->_renderLink, 0);
  std::unique_ptr<PVPerfStats>::reset[abi:ne180100](&self->_perfStats.__ptr_.__value_, 0);
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_perfStatsLock, 0);
  value = self->_statLogTimer.__ptr_.__value_;
  self->_statLogTimer.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x1B5E29170](value, 0x1000C40451B5BE8);
  objc_storeStrong((id *)&self->_tokenPool, 0);
  objc_storeStrong((id *)&self->_name, 0);
  m_Obj = self->_playerQueue.m_Obj;
  if (m_Obj)
    (*(void (**)(HGRenderQueue *))(*(_QWORD *)m_Obj + 24))(m_Obj);
  objc_storeStrong((id *)&self->_primaryPlayer, 0);
  objc_destroyWeak((id *)&self->_weakDelegate);
  objc_storeStrong((id *)&self->_renderer, 0);
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::destroy((uint64_t)&self->_sourceMap, (_QWORD *)self->_sourceMap.__tree_.__pair1_.__value_.__left_);
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_lock, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = (char *)self + 24;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 23) = 0;
  return self;
}

@end
