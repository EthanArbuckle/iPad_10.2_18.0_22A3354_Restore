@implementation PVEffectScheduler

- (PVEffectScheduler)init
{
  PVEffectScheduler *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *loadQueue;
  uint64_t v5;
  HGSynchronizable *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PVEffectScheduler;
  v2 = -[PVEffectScheduler init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ProVideo.EffectScheduler", 0);
    loadQueue = v2->_loadQueue;
    v2->_loadQueue = (OS_dispatch_queue *)v3;

    v5 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&v2->_endTime.value = *MEMORY[0x1E0CA2E68];
    v2->_endTime.epoch = *(_QWORD *)(v5 + 16);
    *(_WORD *)&v2->_loadedFinalInstructions = 0;
    atomic_store(0, (unsigned __int8 *)&v2->_isScheduling);
    v6 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v6);
    v2->_effectScheduleLock = v6;
  }
  return v2;
}

- (void)dealloc
{
  PVEffectScheduler *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *p_pair1;
  id *v5;
  PVEffectScheduler *isa;
  PVEffectScheduler *left;
  BOOL v8;
  HGSynchronizable *effectScheduleLock;
  objc_super v10;

  begin_node = (PVEffectScheduler *)self->_effectSchedule.__tree_.__begin_node_;
  p_pair1 = &self->_effectSchedule.__tree_.__pair1_;
  if (begin_node != (PVEffectScheduler *)&self->_effectSchedule.__tree_.__pair1_)
  {
    do
    {
      v5 = (id *)begin_node->_previousScheduleToUnload.__tree_.__begin_node_;
      if (*((_BYTE *)v5 + 12))
      {
        objc_msgSend(v5[2], "unloadInstructionGraphNodes");
        *((_BYTE *)v5 + 12) = 0;
      }
      isa = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PVEffectScheduler *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__pair1_.__value_.__left_;
          v8 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v8);
      }
      begin_node = left;
    }
    while (left != (PVEffectScheduler *)p_pair1);
  }
  effectScheduleLock = self->_effectScheduleLock;
  if (effectScheduleLock)
    (*((void (**)(HGSynchronizable *, SEL))effectScheduleLock->var0 + 1))(effectScheduleLock, a2);
  v10.receiver = self;
  v10.super_class = (Class)PVEffectScheduler;
  -[PVEffectScheduler dealloc](&v10, sel_dealloc);
}

- (void)resetSchedule:(id)a3
{
  uint64_t *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  $95D729B680665BEAEFA1D6FCA8238556 *p_endTime;
  uint64_t i;
  PVVideoCompositionInstruction *v14;
  LoadableInstruction *v15;
  id v16;
  CMTime time2;
  CMTime time1;
  CMTimeRange range;
  LoadableInstruction *v20;
  CMTime v21[2];
  CMTime time;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  HGSynchronizable *effectScheduleLock;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  effectScheduleLock = self->_effectScheduleLock;
  v28 = 0;
  HGSynchronizable::Lock(effectScheduleLock);
  begin_node = (uint64_t *)self->_effectSchedule.__tree_.__begin_node_;
  p_pair1 = &self->_effectSchedule.__tree_.__pair1_;
  if (begin_node != (uint64_t *)&self->_effectSchedule.__tree_.__pair1_)
  {
    do
    {
      std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::__emplace_unique_key_args<HGRef<LoadableInstruction>,HGRef<LoadableInstruction> const&>((uint64_t **)&self->_previousScheduleToUnload, begin_node + 4, begin_node + 4);
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)begin_node[1];
      if (left)
      {
        do
        {
          v7 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)begin_node[2];
          v8 = v7->__value_.__left_ == begin_node;
          begin_node = (uint64_t *)v7;
        }
        while (!v8);
      }
      begin_node = (uint64_t *)v7;
    }
    while (v7 != p_pair1);
  }
  std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::destroy((uint64_t)&self->_effectSchedule, (_QWORD *)self->_effectSchedule.__tree_.__pair1_.__value_.__left_);
  self->_effectSchedule.__tree_.__pair1_.__value_.__left_ = 0;
  self->_effectSchedule.__tree_.__pair3_.__value_ = 0;
  self->_effectSchedule.__tree_.__begin_node_ = p_pair1;
  self->_lastLoadedEffectSetIterator.__ptr_ = p_pair1;
  self->_loadedFinalInstructions = 0;
  objc_msgSend(v16, "instructions");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    p_endTime = &self->_endTime;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v14 = *(PVVideoCompositionInstruction **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v14)
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "timeRange");
        else
          memset(v21, 0, sizeof(v21));
        time = v21[1];
        if (CMTimeGetSeconds(&time) > 0.0)
        {
          v15 = (LoadableInstruction *)HGObject::operator new(0xB0uLL);
          LoadableInstruction::LoadableInstruction(v15, v14, self->_isExporting);
          v20 = v15;
          std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::__emplace_unique_key_args<HGRef<LoadableInstruction>,HGRef<LoadableInstruction> const&>((uint64_t **)&self->_effectSchedule, (uint64_t *)&v20, (uint64_t *)&v20);
          memset(v21, 0, 24);
          if (v14)
            -[PVVideoCompositionInstruction timeRange](v14, "timeRange");
          else
            memset(&range, 0, sizeof(range));
          CMTimeRangeGetEnd(v21, &range);
          *(_OWORD *)&time1.value = *(_OWORD *)&p_endTime->value;
          time1.epoch = self->_endTime.epoch;
          time2 = v21[0];
          if (CMTimeCompare(&time1, &time2) < 0)
          {
            *(_OWORD *)&p_endTime->value = *(_OWORD *)&v21[0].value;
            self->_endTime.epoch = v21[0].epoch;
          }
          if (v20)
            (*(void (**)(LoadableInstruction *))(*(_QWORD *)v20 + 24))(v20);
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v10);
  }

  HGSynchronizer::~HGSynchronizer(&effectScheduleLock);
}

- (void)resetSearchPoint
{
  NSObject *loadQueue;
  _QWORD block[5];

  loadQueue = self->_loadQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PVEffectScheduler_resetSearchPoint__block_invoke;
  block[3] = &unk_1E64D47C0;
  block[4] = self;
  dispatch_async(loadQueue, block);
}

uint64_t __37__PVEffectScheduler_resetSearchPoint__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 56) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)setEffectLoadingRenderContext:(HGRef<PVInstructionGraphContext>)a3
{
  PVInstructionGraphContext *m_Obj;
  PVInstructionGraphContext *v6;
  HGSynchronizable *effectScheduleLock;
  char v8;

  effectScheduleLock = self->_effectScheduleLock;
  v8 = 0;
  HGSynchronizable::Lock(effectScheduleLock);
  m_Obj = self->_effectLoadRenderContext.m_Obj;
  v6 = *(PVInstructionGraphContext **)a3.m_Obj;
  if (m_Obj != *(PVInstructionGraphContext **)a3.m_Obj)
  {
    if (m_Obj)
    {
      (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)m_Obj + 24))(self->_effectLoadRenderContext.m_Obj);
      v6 = *(PVInstructionGraphContext **)a3.m_Obj;
    }
    self->_effectLoadRenderContext.m_Obj = v6;
    if (v6)
      (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v6 + 16))(v6);
  }
  HGSynchronizer::~HGSynchronizer(&effectScheduleLock);
}

- (void)setIsExporting:(BOOL)a3
{
  self->_isExporting = a3;
}

- (void)loadEffects:(id *)a3 playerRate:(float)a4
{
  unsigned __int8 v4;
  NSObject *loadQueue;
  _QWORD block[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  BOOL v8;

  if (a4 != 0.0 || (v4 = atomic_load((unsigned __int8 *)&self->_isScheduling), (v4 & 1) == 0))
  {
    loadQueue = self->_loadQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PVEffectScheduler_loadEffects_playerRate___block_invoke;
    block[3] = &unk_1E64D54D8;
    block[4] = self;
    v7 = *a3;
    v8 = a4 == 0.0;
    dispatch_async(loadQueue, block);
  }
}

void __44__PVEffectScheduler_loadEffects_playerRate___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  _OWORD *v7;
  void *v8;
  LoadableInstruction *v9;
  uint64_t v10;
  CMTime *v11;
  char v12;
  char *v13;
  char *v14;
  BOOL v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  const char *v21;
  uint64_t v22;
  CMTime v23;
  CMTime v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  HGSynchronizable *v28;
  char v29;
  CMTime time2;
  CMTime time1;

  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", a2) >= 1)
    kdebug_trace();
  v28 = *(HGSynchronizable **)(*(_QWORD *)(a1 + 32) + 112);
  v29 = 0;
  HGSynchronizable::Lock(v28);
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104));
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 24))
    goto LABEL_52;
  v26 = *(_OWORD *)(a1 + 40);
  v27 = *(_QWORD *)(a1 + 56);
  objc_msgSend((id)v3, "releaseAllUnusedEffects:", &v26);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 64) || (v5 = *(char **)(v4 + 56), v5 == (char *)(v4 + 16)))
  {
    v5 = *(char **)(v4 + 8);
  }
  else if (!*(_BYTE *)(v4 + 88))
  {
    v16 = objc_msgSend((id)v4, "previousLoadedIteratorIsLastInList");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(char **)(v4 + 56);
    if (v16)
    {
      if ((char *)(v4 + 16) != v5)
      {
        do
        {
          v17 = *((_QWORD *)v5 + 4);
          v18 = *(_QWORD *)(v4 + 120);
          v25 = v18;
          if (v18)
            (*(void (**)(uint64_t))(*(_QWORD *)v18 + 16))(v18);
          LoadableInstruction::LoadInstructionGraphNodes(v17, &v25);
          if (v25)
            (*(void (**)(uint64_t))(*(_QWORD *)v25 + 24))(v25);
          v19 = (char *)*((_QWORD *)v5 + 1);
          if (v19)
          {
            do
            {
              v20 = v19;
              v19 = *(char **)v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              v20 = (char *)*((_QWORD *)v5 + 2);
              v15 = *(_QWORD *)v20 == (_QWORD)v5;
              v5 = v20;
            }
            while (!v15);
          }
          v4 = *(_QWORD *)(a1 + 32);
          v5 = v20;
        }
        while (v20 != (char *)(v4 + 16));
      }
      *(_BYTE *)(v4 + 88) = 1;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v5 = *(char **)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_7;
    }
  }
  *(_BYTE *)(v4 + 88) = 0;
LABEL_7:
  v6 = *(char **)(a1 + 32);
  if (v5 == v6 + 16)
    goto LABEL_49;
  v7 = (_OWORD *)(a1 + 40);
  while (1)
  {
    v8 = (void *)MEMORY[0x1B5E29C50]();
    v9 = (LoadableInstruction *)*((_QWORD *)v5 + 4);
    if (v9)
      (*(void (**)(_QWORD))(*(_QWORD *)v9 + 16))(*((_QWORD *)v5 + 4));
    *(_OWORD *)&v24.value = *v7;
    v24.epoch = *(_QWORD *)(a1 + 56);
    v23 = *(CMTime *)(*(_QWORD *)(a1 + 32) + 64);
    if (LoadableInstruction::ShouldLoadForTime(v9, &v24, &v23, *(unsigned __int8 *)(a1 + 64)))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      v22 = v10;
      if (v10)
        (*(void (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10);
      LoadableInstruction::LoadInstructionGraphNodes((uint64_t)v9, &v22);
      if (v22)
        (*(void (**)(uint64_t))(*(_QWORD *)v22 + 24))(v22);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v5;
LABEL_23:
      v12 = 1;
      if (!v9)
        goto LABEL_25;
LABEL_24:
      (*(void (**)(LoadableInstruction *))(*(_QWORD *)v9 + 24))(v9);
      goto LABEL_25;
    }
    *(_OWORD *)&time2.value = *v7;
    time2.epoch = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(a1 + 64))
      v11 = (CMTime *)((char *)v9 + 76);
    else
      v11 = (CMTime *)((char *)v9 + 28);
    time1 = *v11;
    if (CMTimeCompare(&time1, &time2) != 1)
      goto LABEL_23;
    v12 = 0;
    if (v9)
      goto LABEL_24;
LABEL_25:
    objc_autoreleasePoolPop(v8);
    if ((v12 & 1) == 0)
      break;
    v13 = (char *)*((_QWORD *)v5 + 1);
    if (v13)
    {
      do
      {
        v14 = v13;
        v13 = *(char **)v13;
      }
      while (v13);
    }
    else
    {
      do
      {
        v14 = (char *)*((_QWORD *)v5 + 2);
        v15 = *(_QWORD *)v14 == (_QWORD)v5;
        v5 = v14;
      }
      while (!v15);
    }
    v6 = *(char **)(a1 + 32);
    v5 = v14;
    if (v14 == v6 + 16)
      goto LABEL_49;
  }
  v6 = *(char **)(a1 + 32);
LABEL_49:
  objc_msgSend(v6, "unloadInstructionFromPreviousSchedule");
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v21) >= 1)
    kdebug_trace();
  v3 = *(_QWORD *)(a1 + 32);
LABEL_52:
  atomic_store(0, (unsigned __int8 *)(v3 + 104));
  HGSynchronizer::~HGSynchronizer(&v28);
}

- (void)releaseAllUnusedEffects:(id *)a3
{
  PVEffectScheduler *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *p_pair1;
  char v6;
  $95D729B680665BEAEFA1D6FCA8238556 *p_endTime;
  LoadableInstruction *v8;
  id *v9;
  PVEffectScheduler *isa;
  PVEffectScheduler *left;
  BOOL v12;
  $95D729B680665BEAEFA1D6FCA8238556 v13;
  CMTime v14;

  begin_node = (PVEffectScheduler *)self->_effectSchedule.__tree_.__begin_node_;
  p_pair1 = &self->_effectSchedule.__tree_.__pair1_;
  if (begin_node != (PVEffectScheduler *)&self->_effectSchedule.__tree_.__pair1_)
  {
    v6 = 0;
    p_endTime = &self->_endTime;
    do
    {
      v8 = (LoadableInstruction *)begin_node->_previousScheduleToUnload.__tree_.__begin_node_;
      v14 = (CMTime)*a3;
      v13 = *p_endTime;
      if (LoadableInstruction::ShouldReleaseForTime(v8, &v14, (CMTime *)&v13))
      {
        v9 = (id *)begin_node->_previousScheduleToUnload.__tree_.__begin_node_;
        if (*((_BYTE *)v9 + 12))
        {
          objc_msgSend(v9[2], "unloadInstructionGraphNodes");
          *((_BYTE *)v9 + 12) = 0;
        }
        v6 = 1;
      }
      isa = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PVEffectScheduler *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__pair1_.__value_.__left_;
          v12 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v12);
      }
      begin_node = left;
    }
    while (left != (PVEffectScheduler *)p_pair1);
    if ((v6 & 1) != 0)
      +[PVInstructionGraphImageSourceNode purgeBitmapCache:](PVInstructionGraphImageSourceNode, "purgeBitmapCache:", 0);
  }
}

- (void)unloadInstructionFromPreviousSchedule
{
  set<HGRef<LoadableInstruction>, LoadableInstructionCompare, std::allocator<HGRef<LoadableInstruction>>> *p_previousScheduleToUnload;
  PVEffectScheduler *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *p_pair1;
  id *v6;
  PVEffectScheduler *isa;
  PVEffectScheduler *left;
  BOOL v9;

  p_previousScheduleToUnload = &self->_previousScheduleToUnload;
  begin_node = (PVEffectScheduler *)self->_previousScheduleToUnload.__tree_.__begin_node_;
  p_pair1 = &self->_previousScheduleToUnload.__tree_.__pair1_;
  if (begin_node != (PVEffectScheduler *)&self->_previousScheduleToUnload.__tree_.__pair1_)
  {
    do
    {
      v6 = (id *)begin_node->_previousScheduleToUnload.__tree_.__begin_node_;
      if (*((_BYTE *)v6 + 12))
      {
        objc_msgSend(v6[2], "unloadInstructionGraphNodes");
        *((_BYTE *)v6 + 12) = 0;
      }
      isa = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PVEffectScheduler *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PVEffectScheduler *)begin_node->_effectSchedule.__tree_.__pair1_.__value_.__left_;
          v9 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v9);
      }
      begin_node = left;
    }
    while (left != (PVEffectScheduler *)p_pair1);
  }
  std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::destroy((uint64_t)p_previousScheduleToUnload, (_QWORD *)self->_previousScheduleToUnload.__tree_.__pair1_.__value_.__left_);
  self->_previousScheduleToUnload.__tree_.__pair1_.__value_.__left_ = 0;
  self->_previousScheduleToUnload.__tree_.__pair3_.__value_ = 0;
  self->_previousScheduleToUnload.__tree_.__begin_node_ = p_pair1;
}

- (BOOL)loadTimeIsNearEnd:(id *)a3
{
  _BOOL4 v5;
  double v6;
  $95D729B680665BEAEFA1D6FCA8238556 endTime;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime v12;
  CMTime v13;

  memset(&v13, 0, sizeof(v13));
  v5 = +[PVDeviceCharacteristics isLowMemDevice](PVDeviceCharacteristics, "isLowMemDevice");
  v6 = 0.9;
  if (!v5)
    v6 = 3.0;
  CMTimeMakeWithSeconds(&v13, v6, 30);
  memset(&v12, 0, sizeof(v12));
  lhs = (CMTime)*a3;
  rhs = v13;
  CMTimeAdd(&v12, &lhs, &rhs);
  time1 = v12;
  endTime = self->_endTime;
  return CMTimeCompare(&time1, (CMTime *)&endTime) >= 0;
}

- (BOOL)previousLoadedIteratorIsLastInList
{
  void *ptr;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *v4;
  BOOL v5;

  ptr = self->_lastLoadedEffectSetIterator.__ptr_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)*((_QWORD *)ptr + 1);
  if (left)
  {
    do
    {
      v4 = left;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)left->__value_.__left_;
    }
    while (left);
  }
  else
  {
    do
    {
      v4 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<HGRef<LoadableInstruction>, void *>>> *)*((_QWORD *)ptr + 2);
      v5 = v4->__value_.__left_ == ptr;
      ptr = v4;
    }
    while (!v5);
  }
  return v4 == &self->_effectSchedule.__tree_.__pair1_;
}

- (void).cxx_destruct
{
  PVInstructionGraphContext *m_Obj;

  m_Obj = self->_effectLoadRenderContext.m_Obj;
  if (m_Obj)
    (*(void (**)(PVInstructionGraphContext *, SEL))(*(_QWORD *)m_Obj + 24))(m_Obj, a2);
  objc_storeStrong((id *)&self->_loadQueue, 0);
  std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::destroy((uint64_t)&self->_previousScheduleToUnload, (_QWORD *)self->_previousScheduleToUnload.__tree_.__pair1_.__value_.__left_);
  std::__tree<HGRef<LoadableInstruction>,LoadableInstructionCompare,std::allocator<HGRef<LoadableInstruction>>>::destroy((uint64_t)&self->_effectSchedule, (_QWORD *)self->_effectSchedule.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  *((_QWORD *)self + 15) = 0;
  return self;
}

@end
