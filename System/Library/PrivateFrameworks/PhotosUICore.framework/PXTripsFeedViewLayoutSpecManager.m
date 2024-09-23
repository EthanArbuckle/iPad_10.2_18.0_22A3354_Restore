@implementation PXTripsFeedViewLayoutSpecManager

- (PXTripsFeedViewLayoutSpecManager)initWithTraitCollection:(id)a3
{
  id v5;
  PXTripsFeedViewLayoutSpecManager *v6;
  PXTripsFeedViewLayoutSpecManager *v7;
  uint64_t v8;
  PXUpdater *updater;
  _QWORD v11[4];
  PXTripsFeedViewLayoutSpecManager *v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXTripsFeedViewLayoutSpecManager;
  v6 = -[PXTripsFeedViewLayoutSpecManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extendedTraitCollection, a3);
    -[PXExtendedTraitCollection registerChangeObserver:context:](v7->_extendedTraitCollection, "registerChangeObserver:context:", v7, TripsFeedSpecManagerObservationContext);
    v8 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel__setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v8;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateSpec);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PXTripsFeedViewLayoutSpecManager_initWithTraitCollection___block_invoke;
    v11[3] = &unk_1E51479C8;
    v12 = v7;
    -[PXTripsFeedViewLayoutSpecManager performChanges:](v12, "performChanges:", v11);

  }
  return v7;
}

- (PXTripsFeedViewLayoutSpecManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedViewLayoutSpecManager.m"), 49, CFSTR("%s is not available as initializer"), "-[PXTripsFeedViewLayoutSpecManager init]");

  abort();
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXTripsFeedViewLayoutSpecManager;
  -[PXTripsFeedViewLayoutSpecManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXTripsFeedViewLayoutSpecManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)_setNeedsUpdate
{
  -[PXTripsFeedViewLayoutSpecManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateSpec
{
  id v2;

  -[PXTripsFeedViewLayoutSpecManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSpec);

}

- (void)_updateSpec
{
  PXTripsFeedViewLayoutSpec *v3;
  PXTripsFeedViewLayoutSpec *v4;
  id v5;

  v3 = [PXTripsFeedViewLayoutSpec alloc];
  -[PXTripsFeedViewLayoutSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PXFeatureSpec initWithExtendedTraitCollection:](v3, "initWithExtendedTraitCollection:", v5);
  -[PXFeedViewLayoutSpecManager setSpec:](self, "setSpec:", v4);

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
  if ((void *)TripsFeedSpecManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedViewLayoutSpecManager.m"), 81, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 0x10) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__PXTripsFeedViewLayoutSpecManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E51479C8;
    v12[4] = self;
    -[PXTripsFeedViewLayoutSpecManager performChanges:](self, "performChanges:", v12);
  }

}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
}

uint64_t __65__PXTripsFeedViewLayoutSpecManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSpec");
}

uint64_t __60__PXTripsFeedViewLayoutSpecManager_initWithTraitCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSpec");
}

@end
