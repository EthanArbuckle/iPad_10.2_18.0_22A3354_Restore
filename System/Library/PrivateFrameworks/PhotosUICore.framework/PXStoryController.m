@implementation PXStoryController

- (PXStoryController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryController.m"), 22, CFSTR("%s is not available as initializer"), "-[PXStoryController init]");

  abort();
}

- (PXStoryController)initWithObservableModel:(id)a3
{
  id v4;
  PXStoryController *v5;
  PXStoryController *v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  OS_dispatch_queue *storyQueue;
  uint64_t v11;
  PXUpdater *updater;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryController;
  v5 = -[PXStoryController init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PXStoryController copyLogConfigurationFrom:](v5, "copyLogConfigurationFrom:", v4);
    v7 = objc_storeWeak((id *)&v6->_observableModel, v4);
    objc_msgSend(v4, "registerChangeObserver:context:", v6, ModelObservationContext_201525);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_observableModel);
    objc_msgSend(WeakRetained, "storyQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    storyQueue = v6->_storyQueue;
    v6->_storyQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v6, sel__setNeedsUpdate);
    updater = v6->_updater;
    v6->_updater = (PXUpdater *)v11;

    -[PXStoryController configureUpdater:](v6, "configureUpdater:", v6->_updater);
  }

  return v6;
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXStoryController storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryController;
  -[PXStoryController performChanges:](&v6, sel_performChanges_, v4);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryController;
  -[PXStoryController didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)_setNeedsUpdate
{
  -[PXStoryController signalChange:](self, "signalChange:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  id v10;

  v10 = a3;
  if ((void *)ModelObservationContext_201525 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryController.m"), 66, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXStoryController handleModelChange:](self, "handleModelChange:", a4);

}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (PXStoryQueueParticipant)observableModel
{
  return (PXStoryQueueParticipant *)objc_loadWeakRetained((id *)&self->_observableModel);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_observableModel);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

@end
