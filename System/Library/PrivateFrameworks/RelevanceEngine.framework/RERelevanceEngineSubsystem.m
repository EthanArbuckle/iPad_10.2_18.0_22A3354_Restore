@implementation RERelevanceEngineSubsystem

- (OS_dispatch_queue)queue
{
  return self->_relevanceEngineQueue;
}

- (RERelevanceEngine)relevanceEngine
{
  return (RERelevanceEngine *)objc_loadWeakRetained((id *)&self->_relevanceEngine);
}

- (void)beginActivity:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (!-[REActivityTracker trackingObject:](self->_activityTracker, "trackingObject:", v6))
    -[REActivityTracker trackObject:](self->_activityTracker, "trackObject:", v6);
  -[REActivityTracker beginActivity:forObject:](self->_activityTracker, "beginActivity:forObject:", v7, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)endActivity:(id)a3 forObject:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[REActivityTracker endActivity:forObject:](self->_activityTracker, "endActivity:forObject:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)activityTracker:(id)a3 didEndActivity:(id)a4
{
  RERelevanceEngine **p_relevanceEngine;
  id v6;
  id WeakRetained;

  p_relevanceEngine = &self->_relevanceEngine;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_relevanceEngine);
  objc_msgSend(WeakRetained, "endActivity:forObject:", v6, self);

}

- (void)activityTracker:(id)a3 didBeginActivity:(id)a4
{
  RERelevanceEngine **p_relevanceEngine;
  id v6;
  id WeakRetained;

  p_relevanceEngine = &self->_relevanceEngine;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_relevanceEngine);
  objc_msgSend(WeakRetained, "beginActivity:forObject:", v6, self);

}

- (void)trackObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[REActivityTracker trackObject:](self->_activityTracker, "trackObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (RERelevanceEngineSubsystem)initWithRelevanceEngine:(id)a3
{
  id v4;
  RERelevanceEngineSubsystem *v5;
  RERelevanceEngineSubsystem *v6;
  uint64_t v7;
  OS_dispatch_queue *relevanceEngineQueue;
  REActivityTracker *v9;
  REActivityTracker *activityTracker;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RERelevanceEngineSubsystem;
  v5 = -[RERelevanceEngineSubsystem init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_relevanceEngine, v4);
    objc_msgSend(v4, "subsystemQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    relevanceEngineQueue = v6->_relevanceEngineQueue;
    v6->_relevanceEngineQueue = (OS_dispatch_queue *)v7;

    v6->_running = 0;
    v6->_lock._os_unfair_lock_opaque = 0;
    v9 = -[REActivityTracker initWithDelegate:]([REActivityTracker alloc], "initWithDelegate:", v6);
    activityTracker = v6->_activityTracker;
    v6->_activityTracker = v9;

    objc_msgSend(v4, "_addSubsystem:", v6);
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  OS_dispatch_queue *relevanceEngineQueue;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_msgSend(WeakRetained, "_removeSubsystem:", self);

  relevanceEngineQueue = self->_relevanceEngineQueue;
  self->_relevanceEngineQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)RERelevanceEngineSubsystem;
  -[RERelevanceEngineSubsystem dealloc](&v5, sel_dealloc);
}

- (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void)withdrawObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = 0;
  do
  {
    -[REActivityTracker outstandingActivitiesForObject:](self->_activityTracker, "outstandingActivitiesForObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v6;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v5);
          -[REActivityTracker endActivity:forObject:](self->_activityTracker, "endActivity:forObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  while (objc_msgSend(v5, "count"));
  -[REActivityTracker withdrawObject:](self->_activityTracker, "withdrawObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_relevanceEngine);
  objc_storeStrong((id *)&self->_activityTracker, 0);
  objc_storeStrong((id *)&self->_relevanceEngineQueue, 0);
}

@end
