@implementation PXFeedHorizontalGadgetViewLayoutSpecManager

- (PXFeedHorizontalGadgetViewLayoutSpecManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedHorizontalGadgetViewLayoutSpecManager.m"), 34, CFSTR("%s is not available as initializer"), "-[PXFeedHorizontalGadgetViewLayoutSpecManager init]");

  abort();
}

- (PXFeedHorizontalGadgetViewLayoutSpecManager)initWithGadgetSpec:(id)a3 style:(int64_t)a4
{
  id v7;
  PXFeedHorizontalGadgetViewLayoutSpecManager *v8;
  PXFeedHorizontalGadgetViewLayoutSpecManager *v9;
  void *v11;
  objc_super v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedHorizontalGadgetViewLayoutSpecManager.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadgetSpec != nil"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PXFeedHorizontalGadgetViewLayoutSpecManager;
  v8 = -[PXFeedHorizontalGadgetViewLayoutSpecManager init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_style = a4;
    -[PXFeedHorizontalGadgetViewLayoutSpecManager setGadgetSpec:](v8, "setGadgetSpec:", v7);
  }

  return v9;
}

- (PXFeedHorizontalGadgetViewLayoutSpecManager)initWithGadgetSpecManager:(id)a3 style:(int64_t)a4
{
  id v7;
  PXFeedHorizontalGadgetViewLayoutSpecManager *v8;
  PXFeedHorizontalGadgetViewLayoutSpecManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXFeedHorizontalGadgetViewLayoutSpecManager;
  v8 = -[PXFeedHorizontalGadgetViewLayoutSpecManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_style = a4;
    objc_storeStrong((id *)&v8->_gadgetSpecManager, a3);
    -[PXGadgetSpecManager registerChangeObserver:context:](v9->_gadgetSpecManager, "registerChangeObserver:context:", v9, GadgetSpecManagerObservationContext);
    -[PXFeedHorizontalGadgetViewLayoutSpecManager _invalidateGadgetSpec](v9, "_invalidateGadgetSpec");
  }

  return v9;
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  PXGadgetSpec *v6;

  v5 = (PXGadgetSpec *)a3;
  if (self->_gadgetSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_gadgetSpec, a3);
    -[PXFeedHorizontalGadgetViewLayoutSpecManager _invalidateSpec](self, "_invalidateSpec");
    v5 = v6;
  }

}

- (void)_updateGadgetSpec
{
  void *v3;
  id v4;

  -[PXFeedHorizontalGadgetViewLayoutSpecManager gadgetSpecManager](self, "gadgetSpecManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentGadgetSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedHorizontalGadgetViewLayoutSpecManager setGadgetSpec:](self, "setGadgetSpec:", v3);

}

- (void)_invalidateSpec
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__PXFeedHorizontalGadgetViewLayoutSpecManager__invalidateSpec__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXFeedHorizontalGadgetViewLayoutSpecManager performChanges:](self, "performChanges:", v2);
}

- (void)_updateSpec
{
  PXFeedHorizontalGadgetViewLayoutSpec *v3;
  id v4;

  -[PXFeedHorizontalGadgetViewLayoutSpecManager gadgetSpec](self, "gadgetSpec");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXFeedHorizontalGadgetViewLayoutSpec initWithGadgetSpec:style:]([PXFeedHorizontalGadgetViewLayoutSpec alloc], "initWithGadgetSpec:style:", v4, -[PXFeedHorizontalGadgetViewLayoutSpecManager style](self, "style"));
  -[PXFeedViewLayoutSpecManager setSpec:](self, "setSpec:", v3);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)GadgetSpecManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedHorizontalGadgetViewLayoutSpecManager.m"), 98, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXFeedHorizontalGadgetViewLayoutSpecManager _invalidateGadgetSpec](self, "_invalidateGadgetSpec");
    v9 = v11;
  }

}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (int64_t)style
{
  return self->_style;
}

- (PXGadgetSpecManager)gadgetSpecManager
{
  return self->_gadgetSpecManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetSpecManager, 0);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

uint64_t __62__PXFeedHorizontalGadgetViewLayoutSpecManager__invalidateSpec__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSpec");
}

@end
