@implementation PXStoryMemoryFeedViewLayoutSpecManager

- (PXStoryMemoryFeedViewLayoutSpecManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedViewLayoutSpecManager.m"), 42, CFSTR("%s is not available as initializer"), "-[PXStoryMemoryFeedViewLayoutSpecManager init]");

  abort();
}

- (PXStoryMemoryFeedViewLayoutSpecManager)initWithLayoutKind:(int64_t)a3 extendedTraitCollection:(id)a4
{
  id v7;
  void *v8;
  PXStoryMemoryFeedViewLayoutSpecManager *v9;
  PXStoryMemoryFeedViewLayoutSpecManager *v10;
  PXMemoriesSpecManager *v11;
  PXMemoriesSpecManager *memoriesSpecManager;
  uint64_t v13;
  PXUpdater *updater;
  void *v16;
  void *v17;
  _QWORD v18[4];
  PXStoryMemoryFeedViewLayoutSpecManager *v19;
  objc_super v20;

  v7 = a4;
  v8 = v7;
  if (a3 == 1)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedViewLayoutSpecManager.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutKind == PXStoryMemoryFeedLayoutKindVerticalFeed"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedViewLayoutSpecManager.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extendedTraitCollection != nil"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)PXStoryMemoryFeedViewLayoutSpecManager;
  v9 = -[PXStoryMemoryFeedViewLayoutSpecManager init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_layoutKind = a3;
    v11 = -[PXMemoriesSpecManager initWithExtendedTraitCollection:options:style:]([PXMemoriesSpecManager alloc], "initWithExtendedTraitCollection:options:style:", v8, 0, 0);
    memoriesSpecManager = v10->_memoriesSpecManager;
    v10->_memoriesSpecManager = v11;

    -[PXMemoriesSpecManager registerChangeObserver:context:](v10->_memoriesSpecManager, "registerChangeObserver:context:", v10, MemoriesSpecManagerObservationContext);
    v13 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v10, sel__setNeedsUpdate);
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v13;

    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateSpec);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__PXStoryMemoryFeedViewLayoutSpecManager_initWithLayoutKind_extendedTraitCollection___block_invoke;
    v18[3] = &unk_1E51479C8;
    v19 = v10;
    -[PXStoryMemoryFeedViewLayoutSpecManager performChanges:](v19, "performChanges:", v18);

  }
  return v10;
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryMemoryFeedViewLayoutSpecManager;
  -[PXStoryMemoryFeedViewLayoutSpecManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryMemoryFeedViewLayoutSpecManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)_setNeedsUpdate
{
  -[PXStoryMemoryFeedViewLayoutSpecManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateSpec
{
  id v2;

  -[PXStoryMemoryFeedViewLayoutSpecManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSpec);

}

- (void)_updateSpec
{
  void *v3;
  PXStoryMemoryFeedViewLayoutSpec *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  -[PXStoryMemoryFeedViewLayoutSpecManager memoriesSpecManager](self, "memoriesSpecManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[PXStoryMemoryFeedViewLayoutSpec initWithMemoriesSpec:]([PXStoryMemoryFeedViewLayoutSpec alloc], "initWithMemoriesSpec:", v13);
  -[PXFeedViewLayoutSpecManager setSpec:](self, "setSpec:", v4);

  objc_msgSend(v13, "extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutReferenceSize");
  v7 = v6;
  objc_msgSend(v13, "extendedTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootExtendedTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutReferenceSize");
  v11 = v7 == v10;
  -[PXFeedViewLayoutSpecManager spec](self, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsFullScreen:", v11);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v9 = a3;
  if ((void *)MemoriesSpecManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedViewLayoutSpecManager.m"), 96, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__PXStoryMemoryFeedViewLayoutSpecManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E51479C8;
    v12[4] = self;
    -[PXStoryMemoryFeedViewLayoutSpecManager performChanges:](self, "performChanges:", v12);
  }

}

- (int64_t)layoutKind
{
  return self->_layoutKind;
}

- (PXMemoriesSpecManager)memoriesSpecManager
{
  return self->_memoriesSpecManager;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_memoriesSpecManager, 0);
}

uint64_t __71__PXStoryMemoryFeedViewLayoutSpecManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSpec");
}

uint64_t __85__PXStoryMemoryFeedViewLayoutSpecManager_initWithLayoutKind_extendedTraitCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSpec");
}

@end
