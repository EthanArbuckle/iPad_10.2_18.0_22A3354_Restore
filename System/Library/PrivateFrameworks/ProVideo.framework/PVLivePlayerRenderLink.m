@implementation PVLivePlayerRenderLink

- (PVLivePlayerRenderLink)init
{
  PVLivePlayerRenderLink *v2;
  HGSynchronizable *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PVLivePlayerRenderLink;
  v2 = -[PVLivePlayerRenderLink init](&v5, sel_init);
  if (v2)
  {
    v3 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v3);
    v2->_lock = v3;
    v2->_throttledFPS = 0;
    objc_storeWeak((id *)&v2->_player, 0);
  }
  return v2;
}

- (void)dealloc
{
  HGSynchronizable *lock;
  objc_super v4;

  lock = self->_lock;
  if (lock)
    (*((void (**)(HGSynchronizable *, SEL))lock->var0 + 1))(lock, a2);
  v4.receiver = self;
  v4.super_class = (Class)PVLivePlayerRenderLink;
  -[PVLivePlayerRenderLink dealloc](&v4, sel_dealloc);
}

- (void)registerWithPlayer:(id)a3
{
  id v4;
  id v5;
  HGSynchronizable *lock;
  char v7;

  v4 = a3;
  lock = self->_lock;
  v7 = 0;
  HGSynchronizable::Lock(lock);
  v5 = objc_storeWeak((id *)&self->_player, v4);

  if (v4)
    -[PVLivePlayerRenderLink rebuild](self, "rebuild");
  else
    -[PVLivePlayerRenderLink teardown](self, "teardown");
  HGSynchronizer::~HGSynchronizer(&lock);

}

- (BOOL)setThrottledFPS:(unsigned int)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  HGSynchronizable *lock;
  char v10;

  lock = self->_lock;
  v10 = 0;
  HGSynchronizable::Lock(lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  objc_msgSend(WeakRetained, "thermalThrottlingPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_player);
    NSLog(CFSTR("[%@] ignore -setThrottledFPS when player (%@) has a throttling policy"), self, v7);

  }
  else
  {
    self->_throttledFPS = a3;
  }
  HGSynchronizer::~HGSynchronizer(&lock);
  return v6 == 0;
}

- (unsigned)throttledFPS
{
  PVLivePlayerRenderLink *v2;
  HGSynchronizable *lock;
  char v5;

  v2 = self;
  lock = self->_lock;
  v5 = 0;
  HGSynchronizable::Lock(lock);
  LODWORD(v2) = v2->_throttledFPS;
  HGSynchronizer::~HGSynchronizer(&lock);
  return v2;
}

- (unsigned)thermalPolicyThrottledFPS
{
  PVLivePlayerRenderLink *v2;
  HGSynchronizable *lock;
  char v5;

  v2 = self;
  lock = self->_lock;
  v5 = 0;
  HGSynchronizable::Lock(lock);
  LODWORD(v2) = -[PVLivePlayerRenderLink _throttledRenderLinkFPS_NoLock](v2, "_throttledRenderLinkFPS_NoLock");
  HGSynchronizer::~HGSynchronizer(&lock);
  return v2;
}

- (BOOL)skipThrottledRenderLinkTime:(id *)a3
{
  int32_t v5;
  int32_t v6;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastTime;
  BOOL v8;
  CMTime v10;
  CMTime time1;
  CMTime time;
  CMTime v13;
  HGSynchronizable *lock;
  char v15;

  lock = self->_lock;
  v15 = 0;
  HGSynchronizable::Lock(lock);
  v5 = -[PVLivePlayerRenderLink _throttledRenderLinkFPS_NoLock](self, "_throttledRenderLinkFPS_NoLock");
  if (v5)
  {
    memset(&v13, 0, sizeof(v13));
    time = (CMTime)*a3;
    CMTimeConvertScale(&v13, &time, v5, kCMTimeRoundingMethod_RoundTowardZero);
    time1 = (CMTime)self->_lastTime;
    v10 = v13;
    v6 = CMTimeCompare(&time1, &v10);
    p_lastTime = &self->_lastTime;
    v8 = v6 == 0;
    *(CMTime *)p_lastTime = v13;
  }
  else
  {
    v8 = 0;
  }
  HGSynchronizer::~HGSynchronizer(&lock);
  return v8;
}

- (unsigned)_throttledRenderLinkFPS_NoLock
{
  unsigned int v3;
  PVLivePlayer **p_player;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = -[PVLivePlayerRenderLink throttledFPS](self, "throttledFPS");
  p_player = &self->_player;
  WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  objc_msgSend(WeakRetained, "thermalThrottlingPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)p_player);
    objc_msgSend(v7, "thermalThrottlingPolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "populatedControlParametersForCurrentThermalLevel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "renderLinkRate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "renderLinkRate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      if (v12)
      {
        objc_msgSend(v9, "renderLinkRate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v13, "unsignedIntegerValue");

      }
    }

  }
  return v3;
}

- (void)signalPlayer:(id *)a3
{
  id WeakRetained;
  __int128 v6;
  int64_t v7;
  __int128 v8;
  int64_t var3;
  HGSynchronizable *lock;
  char v11;

  lock = self->_lock;
  v11 = 0;
  HGSynchronizable::Lock(lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  HGSynchronizer::~HGSynchronizer(&lock);
  if (WeakRetained)
  {
    v8 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    if (-[PVLivePlayerRenderLink skipThrottledRenderLinkTime:](self, "skipThrottledRenderLinkTime:", &v8))
    {
      objc_msgSend(WeakRetained, "renderLinkSignalSkipped");
    }
    else
    {
      v6 = *(_OWORD *)&a3->var0;
      v7 = a3->var3;
      objc_msgSend(WeakRetained, "renderLinkSignal:", &v6);
    }
  }

}

- (void)signalDroppedRenderLink
{
  id WeakRetained;
  HGSynchronizable *lock;
  char v5;

  lock = self->_lock;
  v5 = 0;
  HGSynchronizable::Lock(lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  HGSynchronizer::~HGSynchronizer(&lock);
  if (WeakRetained)
    objc_msgSend(WeakRetained, "renderLinkSignalDropped");

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
}

@end
