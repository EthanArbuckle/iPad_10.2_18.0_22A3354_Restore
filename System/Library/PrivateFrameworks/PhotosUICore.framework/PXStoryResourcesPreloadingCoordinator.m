@implementation PXStoryResourcesPreloadingCoordinator

- (PXStoryResourcesPreloadingCoordinator)init
{
  return -[PXStoryResourcesPreloadingCoordinator initWithQueue:](self, "initWithQueue:", 0);
}

- (PXStoryResourcesPreloadingCoordinator)initWithQueue:(id)a3
{
  id v4;
  PXStoryResourcesPreloadingCoordinator *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *storyQueue;
  OS_dispatch_queue *v8;
  id v9;
  NSMutableArray *v10;
  NSMutableArray *infos;
  uint64_t v12;
  PXUpdater *updater;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryResourcesPreloadingCoordinator;
  v5 = -[PXStoryResourcesPreloadingCoordinator init](&v15, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v6;
    }
    else
    {
      v8 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v8;
    }

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    infos = v5->_infos;
    v5->_infos = v10;

    v12 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v5, sel__setNeedsUpdate);
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v12;

    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateInfosOrder);
    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updatePreloadingControllers);
  }

  return v5;
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXStoryResourcesPreloadingCoordinator storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryResourcesPreloadingCoordinator;
  -[PXStoryResourcesPreloadingCoordinator performChanges:](&v6, sel_performChanges_, v4);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesPreloadingCoordinator;
  -[PXStoryResourcesPreloadingCoordinator didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryResourcesPreloadingCoordinator updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (id)_infoForPreloadingController:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *v7;
  _PXStoryPreloadingControllerInfo *v8;
  uint64_t v9;
  _PXStoryPreloadingControllerInfo *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_infos;
  v8 = (_PXStoryPreloadingControllerInfo *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (_PXStoryPreloadingControllerInfo *)((char *)i + 1))
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "preloadingController", (_QWORD)v14);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (_PXStoryPreloadingControllerInfo *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  if (!v8 && v4)
  {
    v8 = objc_alloc_init(_PXStoryPreloadingControllerInfo);
    -[_PXStoryPreloadingControllerInfo setPreloadingController:](v8, "setPreloadingController:", v6);
    objc_msgSend(v6, "registerChangeObserver:context:", self, PreloadinControllerObservationContext);
    -[NSMutableArray addObject:](self->_infos, "addObject:", v8);
  }

  return v8;
}

- (void)addPreloadingController:(id)a3 withPriority:(int64_t)a4
{
  void *v6;

  -[PXStoryResourcesPreloadingCoordinator _infoForPreloadingController:createIfNeeded:](self, "_infoForPreloadingController:createIfNeeded:", a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPriority:", a4);

  -[PXStoryResourcesPreloadingCoordinator _invalidateInfosOrder](self, "_invalidateInfosOrder");
  -[PXStoryResourcesPreloadingCoordinator _invalidatePreloadingControllers](self, "_invalidatePreloadingControllers");
}

- (void)removePreloadingController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PXStoryResourcesPreloadingCoordinator _infoForPreloadingController:createIfNeeded:](self, "_infoForPreloadingController:createIfNeeded:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "setIsPreloadingEnabled:", 0);
    objc_msgSend(v5, "unregisterChangeObserver:context:", self, PreloadinControllerObservationContext);
    -[NSMutableArray removeObject:](self->_infos, "removeObject:", v4);
    -[PXStoryResourcesPreloadingCoordinator _invalidatePreloadingControllers](self, "_invalidatePreloadingControllers");
  }

}

- (void)_setNeedsUpdate
{
  -[PXStoryResourcesPreloadingCoordinator signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateInfosOrder
{
  id v2;

  -[PXStoryResourcesPreloadingCoordinator updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInfosOrder);

}

- (void)_updateInfosOrder
{
  -[NSMutableArray sortUsingComparator:](self->_infos, "sortUsingComparator:", &__block_literal_global_108792);
}

- (void)_invalidatePreloadingControllers
{
  id v2;

  -[PXStoryResourcesPreloadingCoordinator updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePreloadingControllers);

}

- (void)_updatePreloadingControllers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  _BOOL8 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = self->_infos;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "preloadingController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isCompleted");

        if ((v10 & 1) == 0)
        {
          v11 = objc_msgSend(v8, "priority");
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_infos;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        v18 = objc_msgSend(v17, "priority", (_QWORD)v20) <= v11;
        objc_msgSend(v17, "preloadingController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setIsPreloadingEnabled:", v18);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v9 = a3;
  if ((void *)PreloadinControllerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesPreloadingCoordinator.m"), 146, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((objc_msgSend(v9, "isCompletedChangeDescriptor") & ~a4) == 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__PXStoryResourcesPreloadingCoordinator_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5127568;
    v12[4] = self;
    -[PXStoryResourcesPreloadingCoordinator performChanges:](self, "performChanges:", v12);
  }

}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_infos, 0);
}

uint64_t __70__PXStoryResourcesPreloadingCoordinator_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePreloadingControllers");
}

uint64_t __58__PXStoryResourcesPreloadingCoordinator__updateInfosOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "priority");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

@end
