@implementation WFContextualActionRunQueue

- (WFContextualActionRunQueue)init
{
  WFContextualActionRunQueue *v2;
  uint64_t v3;
  NSMutableArray *runnerClients;
  WFContextualActionRunQueue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFContextualActionRunQueue;
  v2 = -[WFContextualActionRunQueue init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    runnerClients = v2->_runnerClients;
    v2->_runnerClients = (NSMutableArray *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (void)enqueueRun:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSMutableArray count](self->_runnerClients, "count"))
    objc_msgSend(v4, "startFromQueue");
  -[NSMutableArray addObject:](self->_runnerClients, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)runFinished:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray removeObject:](self->_runnerClients, "removeObject:", v5);

  if (-[NSMutableArray count](self->_runnerClients, "count"))
  {
    -[NSMutableArray firstObject](self->_runnerClients, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startFromQueue");

  }
  os_unfair_lock_unlock(p_lock);
}

- (NSMutableArray)runnerClients
{
  return self->_runnerClients;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runnerClients, 0);
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1)
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global);
  return (id)sharedQueue_queue;
}

void __41__WFContextualActionRunQueue_sharedQueue__block_invoke()
{
  WFContextualActionRunQueue *v0;
  void *v1;

  v0 = objc_alloc_init(WFContextualActionRunQueue);
  v1 = (void *)sharedQueue_queue;
  sharedQueue_queue = (uint64_t)v0;

}

@end
