@implementation PXGAsyncScrollController

- (PXGAsyncScrollController)initWithQueue:(id)a3
{
  id v5;
  PXGAsyncScrollController *v6;
  PXGAsyncScrollController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGAsyncScrollController;
  v6 = -[PXGAsyncScrollController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_isActive = 1;
  }

  return v7;
}

- (PXGAsyncScrollController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAsyncScrollController.m"), 42, CFSTR("%s is not available as initializer"), "-[PXGAsyncScrollController init]");

  abort();
}

- (void)setUpdateDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_updateDelegate, obj);
    self->_delegateRespondsToDidScroll = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setReferenceSize:(CGSize)a3
{
  if (self->_referenceSize.width != a3.width || self->_referenceSize.height != a3.height)
  {
    self->_referenceSize = a3;
    -[PXGAsyncScrollController visibleRect](self, "visibleRect");
    -[PXGAsyncScrollController setVisibleRect:](self, "setVisibleRect:");
    -[PXGAsyncScrollController setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXGAsyncScrollController setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[PXGAsyncScrollController visibleRect](self, "visibleRect");
  -[PXGAsyncScrollController setVisibleRect:](self, "setVisibleRect:", x, y);
}

- (void)setVisibleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_visibleRect, a3))
  {
    self->_visibleRect.origin.x = x;
    self->_visibleRect.origin.y = y;
    self->_visibleRect.size.width = width;
    self->_visibleRect.size.height = height;
    -[PXGAsyncScrollController didScroll](self, "didScroll");
  }
}

- (void)setNeedsUpdate
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  self->_needsUpdate = 1;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__PXGAsyncScrollController_setNeedsUpdate__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updateIfNeeded
{
  id v3;

  if (self->_needsUpdate)
  {
    if (-[PXGAsyncScrollController isActive](self, "isActive"))
    {
      self->_needsUpdate = 0;
      -[PXGAsyncScrollController updateDelegate](self, "updateDelegate");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "px_scrollControllerDidUpdate:", self);

    }
  }
}

- (void)didScroll
{
  id v3;

  if (self->_delegateRespondsToDidScroll)
  {
    -[PXGAsyncScrollController updateDelegate](self, "updateDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_scrollControllerDidScroll:", self);

  }
}

- (PXScrollControllerUpdateDelegate)updateDelegate
{
  return (PXScrollControllerUpdateDelegate *)objc_loadWeakRetained((id *)&self->_updateDelegate);
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)activeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_activeRect.origin.x;
  y = self->_activeRect.origin.y;
  width = self->_activeRect.size.width;
  height = self->_activeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PXScrollInfo)scrollInfo
{
  return self->_scrollInfo;
}

- (void)setScrollInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)respectsContentZOrder
{
  return self->_respectsContentZOrder;
}

- (void)setRespectsContentZOrder:(BOOL)a3
{
  self->_respectsContentZOrder = a3;
}

- (CGSize)presentedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_presentedContentSize.width;
  height = self->_presentedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPresentedContentSize:(CGSize)a3
{
  self->_presentedContentSize = a3;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scrollInfo, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
}

void __42__PXGAsyncScrollController_setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateIfNeeded");

}

@end
