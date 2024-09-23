@implementation PXGConcreteHostingControllerPresenter

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CGSize v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGConcreteHostingControllerPresenter size](self, "size");
  NSStringFromCGSize(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGConcreteHostingControllerPresenter displayScale](self, "displayScale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; size:%@ displayScale:%.2f>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXGConcreteHostingControllerPresenter *v4;

  v4 = objc_alloc_init(PXGConcreteHostingControllerPresenter);
  -[PXGConcreteHostingControllerPresenter size](self, "size");
  -[PXGConcreteHostingControllerPresenter setSize:](v4, "setSize:");
  -[PXGConcreteHostingControllerPresenter displayScale](self, "displayScale");
  -[PXGConcreteHostingControllerPresenter setDisplayScale:](v4, "setDisplayScale:");
  return v4;
}

- (void)performChanges:(id)a3
{
  id v4;

  if (self->_isPerformingChanges)
  {
    (*((void (**)(id, PXGConcreteHostingControllerPresenter *))a3 + 2))(a3, self);
    self->_isPerformingChanges = 1;
  }
  else
  {
    self->_didChange = 0;
    (*((void (**)(id, PXGConcreteHostingControllerPresenter *))a3 + 2))(a3, self);
    self->_isPerformingChanges = 0;
    if (self->_didChange)
    {
      self->_didChange = 0;
      -[PXGConcreteHostingControllerPresenter hostingController](self, "hostingController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clientQueue_presenterDidChange:", self);

    }
  }
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    self->_didChange = 1;
  }
}

- (void)setSize:(CGSize)a3
{
  double height;
  double width;
  void *v8;

  height = a3.height;
  width = a3.width;
  if ((PXSizeIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGHostingController.m"), 589, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSizeIsValid(size)"));

  }
  if (self->_size.width != width || self->_size.height != height)
  {
    self->_size.width = width;
    self->_size.height = height;
    self->_didChange = 1;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXGConcreteHostingControllerPresenter size](self, "size");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "size");
    if (v7 == v11 && v9 == v10)
    {
      -[PXGConcreteHostingControllerPresenter displayScale](self, "displayScale");
      v15 = v14;
      objc_msgSend(v5, "displayScale");
      v13 = v15 == v16;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  objc_super v6;
  _QWORD block[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PXGConcreteHostingControllerPresenter_dealloc__block_invoke;
    block[3] = &unk_1E5149198;
    v8 = v4;
    dispatch_async(v5, block);

  }
  v6.receiver = self;
  v6.super_class = (Class)PXGConcreteHostingControllerPresenter;
  -[PXGConcreteHostingControllerPresenter dealloc](&v6, sel_dealloc);
}

- (double)displayScale
{
  return self->_displayScale;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PXGHostingController)hostingController
{
  return (PXGHostingController *)objc_loadWeakRetained((id *)&self->_hostingController);
}

- (void)setHostingController:(id)a3
{
  objc_storeWeak((id *)&self->_hostingController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingController);
}

uint64_t __48__PXGConcreteHostingControllerPresenter_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientQueue_presenterDidChange:", 0);
}

@end
