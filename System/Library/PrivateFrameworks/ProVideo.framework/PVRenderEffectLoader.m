@implementation PVRenderEffectLoader

- (PVRenderEffectLoader)init
{
  PVRenderEffectLoader *v2;
  PVRenderEffectLoader *v3;
  _OWORD *v4;
  HGSynchronizable *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PVRenderEffectLoader;
  v2 = -[PVRenderEffectLoader init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_unusedEffectTimeout = 1.0;
    v4 = (_OWORD *)operator new();
    v4[1] = 0u;
    v4[2] = 0u;
    *v4 = 0u;
    v3->_loadedEffects = v4;
    v5 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v5);
    v3->_lock = v5;
    v3->_flushesOnEffectStackChanges = 0;
  }
  return v3;
}

- (void)dealloc
{
  _QWORD *loadedEffects;
  uint64_t v4;
  HGSynchronizable *lock;
  objc_super v6;

  -[PVRenderEffectLoader unloadEffects](self, "unloadEffects");
  loadedEffects = self->_loadedEffects;
  if (loadedEffects)
  {
    v4 = std::deque<PVLoadedEffectItem>::~deque[abi:ne180100](loadedEffects);
    MEMORY[0x1B5E29170](v4, 0x1080C40BE8D5F09);
  }
  lock = self->_lock;
  if (lock)
    (*((void (**)(HGSynchronizable *))lock->var0 + 1))(lock);
  v6.receiver = self;
  v6.super_class = (Class)PVRenderEffectLoader;
  -[PVRenderEffectLoader dealloc](&v6, sel_dealloc);
}

- (void)loadEffectsForGraphs:(id)a3 loadContext:(HGRef<PVInstructionGraphContext>)a4
{
  id v6;
  const char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  const char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  HGSynchronizable *lock;
  char v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v7) >= 1)
    kdebug_trace();
  lock = self->_lock;
  v30 = 0;
  HGSynchronizable::Lock(lock);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v14 = *(_QWORD *)a4.m_Obj;
        v24 = v14;
        if (v14)
          (*(void (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14);
        objc_msgSend(v13, "loadIGNode:returnLoadedEffects:", &v24, v8);
        if (v24)
          (*(void (**)(uint64_t))(*(_QWORD *)v24 + 24))(v24);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v10);
  }

  -[PVRenderEffectLoader _removeUnusedEffects_noLock:](self, "_removeUnusedEffects_noLock:", v8);
  -[PVRenderEffectLoader _loadEffects_noLock:](self, "_loadEffects_noLock:", v8);
  -[PVRenderEffectLoader _removeTimedOutEffects_noLock](self, "_removeTimedOutEffects_noLock");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "unloadIGNode", (_QWORD)v20);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    }
    while (v16);
  }

  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v19) >= 1)
    kdebug_trace();

  HGSynchronizer::~HGSynchronizer(&lock);
}

- (void)unloadEffects
{
  _QWORD *loadedEffects;
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  HGSynchronizable *lock;
  char v9;

  lock = self->_lock;
  v9 = 0;
  HGSynchronizable::Lock(lock);
  while (1)
  {
    loadedEffects = self->_loadedEffects;
    v4 = loadedEffects[5];
    if (!v4)
      break;
    v5 = (id *)(*(_QWORD *)(loadedEffects[1]
                          + (((unint64_t)(v4 + loadedEffects[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
              + 16 * (v4 + *((_BYTE *)loadedEffects + 32) - 1));
    v6 = *v5;
    v7 = v5[1];
    objc_msgSend(v6, "releaseEffect");
    std::deque<PVLoadedEffectItem>::pop_back((_QWORD *)self->_loadedEffects);

  }
  HGSynchronizer::~HGSynchronizer(&lock);
}

- (void)ageOutEffects
{
  HGSynchronizable *lock;
  char v4;

  lock = self->_lock;
  v4 = 0;
  HGSynchronizable::Lock(lock);
  -[PVRenderEffectLoader _removeTimedOutEffects_noLock](self, "_removeTimedOutEffects_noLock");
  HGSynchronizer::~HGSynchronizer(&lock);
}

- (void)_removeUnusedEffects_noLock:(id)a3
{
  id v4;
  _QWORD *loadedEffects;
  char v6;
  unint64_t v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64x2_t *v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  loadedEffects = self->_loadedEffects;
  if (loadedEffects[5])
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = (id *)(*(_QWORD *)(loadedEffects[1] + (((loadedEffects[4] + v7) >> 5) & 0x7FFFFFFFFFFFFF8))
                + 16 * (*((_BYTE *)loadedEffects + 32) + v7));
      v9 = *v8;
      v10 = v8[1];
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v4;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v24;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v11);
            if (v9 == *(id *)(*((_QWORD *)&v23 + 1) + 8 * v14))
            {

              ++v7;
              goto LABEL_16;
            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v12)
            continue;
          break;
        }
      }

      v15 = (int64x2_t *)self->_loadedEffects;
      v16 = v15[2].u64[0];
      v17 = v15->i64[1];
      v18 = (_QWORD *)(v17 + 8 * (v16 >> 8));
      if (v15[1].i64[0] == v17)
        v19 = 0;
      else
        v19 = *v18 + 16 * v16;
      v22[0] = v18;
      v22[1] = v19;
      v20 = (char *)std::__deque_iterator<PVLoadedEffectItem,PVLoadedEffectItem*,PVLoadedEffectItem&,PVLoadedEffectItem**,long,256l>::operator+[abi:ne180100]((uint64_t)v22, v7);
      std::deque<PVLoadedEffectItem>::erase(v15, v20, v21);
      v6 = 1;
LABEL_16:

      loadedEffects = self->_loadedEffects;
    }
    while (v7 < loadedEffects[5]);
    if ((v6 & 1) != 0 && self->_flushesOnEffectStackChanges)
      +[PVEffectResources flushEngine](PVEffectResources, "flushEngine");
  }

}

- (void)_loadEffects_noLock:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *loadedEffects;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD **v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  int64x2_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        PVLoadedEffectItem::PVLoadedEffectItem((PVLoadedEffectItem *)v22, *(PVEffect **)(*((_QWORD *)&v23 + 1) + 8 * i));
        loadedEffects = self->_loadedEffects;
        v9 = loadedEffects[4];
        v10 = loadedEffects[1];
        v11 = (_QWORD *)(v10 + 8 * (v9 >> 8));
        if (loadedEffects[2] == v10)
        {
          v12 = 0;
          v15 = 0;
          v14 = (_QWORD **)(v10 + 8 * ((loadedEffects[5] + v9) >> 8));
        }
        else
        {
          v12 = (_QWORD *)(*v11 + 16 * v9);
          v13 = loadedEffects[5] + v9;
          v14 = (_QWORD **)(v10 + 8 * (v13 >> 8));
          v15 = &(*v14)[2 * v13];
        }
        v17 = (char *)std::__find_segment_if[abi:ne180100]<std::__deque_iterator<PVLoadedEffectItem,PVLoadedEffectItem*,PVLoadedEffectItem&,PVLoadedEffectItem**,long,256l>,std::__find_segment<PVLoadedEffectItem>,std::__identity>(v11, v12, v14, v15, v22);
        v18 = (int64x2_t *)self->_loadedEffects;
        v19 = v18->i64[1];
        if (v18[1].i64[0] == v19)
        {
          v21 = 0;
        }
        else
        {
          v20 = v18[2].i64[1] + v18[2].i64[0];
          v21 = *(_QWORD *)(v19 + ((v20 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v20;
        }
        if (v21 == v16)
          objc_msgSend(v22[0], "loadEffect", v17);
        else
          std::deque<PVLoadedEffectItem>::erase(v18, v17, v16);
        std::deque<PVLoadedEffectItem>::push_front((uint64_t)self->_loadedEffects, v22);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

}

- (void)_removeTimedOutEffects_noLock
{
  _QWORD *loadedEffects;
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  float v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    loadedEffects = self->_loadedEffects;
    v4 = loadedEffects[5];
    if (!v4)
      break;
    v5 = (id *)(*(_QWORD *)(loadedEffects[1]
                          + (((unint64_t)(v4 + loadedEffects[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
              + 16 * (v4 + *((_BYTE *)loadedEffects + 32) - 1));
    v6 = *v5;
    v7 = v5[1];
    objc_msgSend(v11, "timeIntervalSinceDate:", v7);
    v9 = v8;

    -[PVRenderEffectLoader unusedEffectTimeout](self, "unusedEffectTimeout");
    if (v9 <= v10)
    {

      break;
    }
    objc_msgSend(v6, "releaseEffect");
    std::deque<PVLoadedEffectItem>::pop_back((_QWORD *)self->_loadedEffects);

  }
}

- (float)unusedEffectTimeout
{
  return self->_unusedEffectTimeout;
}

- (void)setUnusedEffectTimeout:(float)a3
{
  self->_unusedEffectTimeout = a3;
}

@end
