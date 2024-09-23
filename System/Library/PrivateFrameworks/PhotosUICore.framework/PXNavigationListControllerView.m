@implementation PXNavigationListControllerView

- (PXNavigationListControllerView)initWithFrame:(CGRect)a3
{
  PXNavigationListControllerView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXNavigationListControllerView;
  result = -[PXNavigationListControllerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_contentViewHeight = -1.0;
  return result;
}

- (void)addSubview:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListController.m"), 805, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXNavigationListControllerView;
  -[PXNavigationListControllerView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXNavigationListControllerView _updateContentViewFrame](self, "_updateContentViewFrame");
}

- (void)setContentView:(id)a3
{
  id v5;
  UIView *contentView;
  objc_super v7;

  v5 = a3;
  -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_contentView, a3);
  if (self->_contentView)
  {
    -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 0);
    contentView = self->_contentView;
    v7.receiver = self;
    v7.super_class = (Class)PXNavigationListControllerView;
    -[PXNavigationListControllerView addSubview:](&v7, sel_addSubview_, contentView);
    -[PXNavigationListControllerView _updateContentViewFrame](self, "_updateContentViewFrame");
  }

}

- (void)setContentViewHeight:(double)a3
{
  if (self->_contentViewHeight != a3)
  {
    self->_contentViewHeight = a3;
    -[PXNavigationListControllerView _updateContentViewFrame](self, "_updateContentViewFrame");
  }
}

- (void)_updateContentViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double contentViewHeight;
  double v11;
  double v12;
  void *v13;
  BOOL v14;
  id v15;
  CGRect v16;
  CGRect v17;

  -[PXNavigationListControllerView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  contentViewHeight = self->_contentViewHeight;
  v11 = fmin(v3, contentViewHeight);
  if (contentViewHeight >= 0.0)
    v12 = v11;
  else
    v12 = v3;
  -[PXNavigationListControllerView contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v12;
  v14 = CGRectEqualToRect(v16, v17);

  if (!v14)
  {
    -[PXNavigationListControllerView contentView](self, "contentView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v5, v7, v9, v12);

  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)contentViewHeight
{
  return self->_contentViewHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
