@implementation PXGOtherItemPlacementController

- (PXGOtherItemPlacementController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGItemPlacementController.m"), 30, CFSTR("%s is not available as initializer"), "-[PXGOtherItemPlacementController init]");

  abort();
}

- (PXGOtherItemPlacementController)initWithOriginalItemPlacementController:(id)a3 originalItemReference:(id)a4
{
  id v7;
  id v8;
  PXGOtherItemPlacementController *v9;
  PXGOtherItemPlacementController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXGOtherItemPlacementController;
  v9 = -[PXGOtherItemPlacementController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalItemPlacementController, a3);
    objc_storeStrong(&v10->_originalItemReference, a4);
  }

  return v10;
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  return 0;
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[PXGOtherItemPlacementController originalItemPlacementController](self, "originalItemPlacementController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "otherItemsPlacement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGOtherItemPlacementController originalItemReference](self, "originalItemReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlacementOverride:forItemReference:", v6, v7);

}

- (BOOL)isIndirectItemPlacementController
{
  return 1;
}

- (PXGItemPlacementController)originalItemPlacementController
{
  return self->_originalItemPlacementController;
}

- (id)originalItemReference
{
  return self->_originalItemReference;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_originalItemReference, 0);
  objc_storeStrong((id *)&self->_originalItemPlacementController, 0);
}

@end
