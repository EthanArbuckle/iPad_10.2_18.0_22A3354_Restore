@implementation PXGSingleViewContainerView

- (void)setUserData:(id)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSingleViewContainerView.m"), 34, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("userData"), v8, v9);

    }
  }
  objc_msgSend(v10, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSingleViewContainerView setContentView:](self, "setContentView:", v5);

}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  PXGSingleViewContainerView *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v8 = v5;
    -[UIView superview](contentView, "superview");
    v7 = (PXGSingleViewContainerView *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    v5 = v8;
    if (v8)
    {
      -[PXGSingleViewContainerView bounds](self, "bounds");
      -[UIView setFrame:](v8, "setFrame:");
      -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
      -[PXGSingleViewContainerView addSubview:](self, "addSubview:", v8);
      v5 = v8;
    }
  }

}

- (void)becomeReusable
{
  -[PXGSingleViewContainerView setContentView:](self, "setContentView:", 0);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->clippingRect.origin.x;
  y = self->clippingRect.origin.y;
  width = self->clippingRect.size.width;
  height = self->clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (NSCopying)userData
{
  return self->userData;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->userData, 0);
}

@end
