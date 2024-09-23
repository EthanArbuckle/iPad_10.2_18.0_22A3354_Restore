@implementation PXGTrackingContainerView

- (PXGTrackingContainerView)initWithFrame:(CGRect)a3
{
  PXGTrackingContainerView *v3;
  PXGTrackingContainerView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGTrackingContainerView;
  v3 = -[PXGTrackingContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXGTrackingContainerView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGTrackingContainerView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)becomeReusable
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTrackingContainerView.m"), 27, CFSTR("%@ is not reusable"), v6);

  abort();
}

- (void)prepareForReuse
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTrackingContainerView.m"), 31, CFSTR("%@ is not reusable"), v6);

  abort();
}

- (void)setIsSpriteRemoved:(BOOL)a3
{
  if (self->_isSpriteRemoved != a3)
  {
    self->_isSpriteRemoved = a3;
    -[PXGTrackingContainerView _removeFromSuperviewIfFinished](self, "_removeFromSuperviewIfFinished");
  }
}

- (void)willRemoveSubview:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGTrackingContainerView;
  -[PXGTrackingContainerView willRemoveSubview:](&v9, sel_willRemoveSubview_, a3);
  -[PXGTrackingContainerView superview](self, "superview");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PXGTrackingContainerView subviews](self, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 == 1)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__PXGTrackingContainerView_willRemoveSubview___block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

- (void)_removeFromSuperviewIfFinished
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[PXGTrackingContainerView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (v7 = v3, v4 = -[PXGTrackingContainerView isSpriteRemoved](self, "isSpriteRemoved"), v3 = v7, v4))
  {
    -[PXGTrackingContainerView subviews](self, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
      -[PXGTrackingContainerView removeFromSuperview](self, "removeFromSuperview");
  }
  else
  {

  }
}

- (NSCopying)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (BOOL)isSpriteRemoved
{
  return self->_isSpriteRemoved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
}

uint64_t __46__PXGTrackingContainerView_willRemoveSubview___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeFromSuperviewIfFinished");
}

@end
