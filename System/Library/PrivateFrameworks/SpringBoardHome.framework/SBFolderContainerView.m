@implementation SBFolderContainerView

- (SBFolderContainerView)initWithFolderView:(id)a3
{
  id v5;
  SBFolderContainerView *v6;
  SBFolderContainerView *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "bounds");
  v9.receiver = self;
  v9.super_class = (Class)SBFolderContainerView;
  v6 = -[SBFolderContainerView initWithFrame:](&v9, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_folderView, a3);
    -[SBFolderContainerView addSubview:](v7, "addSubview:", v5);
  }

  return v7;
}

- (void)setChildFolderContainerView:(id)a3
{
  SBFolderContainerView *v5;
  SBFolderContainerView *childFolderContainerView;
  SBFolderContainerView *v7;

  v5 = (SBFolderContainerView *)a3;
  childFolderContainerView = self->_childFolderContainerView;
  if (childFolderContainerView != v5)
  {
    v7 = v5;
    if (childFolderContainerView)
      -[SBFolderContainerView removeFromSuperview](childFolderContainerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_childFolderContainerView, a3);
    if (v7)
      -[SBFolderContainerView addSubview:](self, "addSubview:", v7);
    -[SBFolderContainerView layoutIfNeeded](self, "layoutIfNeeded");
    v5 = v7;
  }

}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void)layoutSubviews
{
  SBFolderView *folderView;
  SBFolderContainerView *childFolderContainerView;
  void *v5;
  UIView *backgroundView;
  UIView *v7;
  CGAffineTransform v8;

  folderView = self->_folderView;
  if (folderView)
  {
    -[SBFolderContainerView _frameForFolderView:](self, "_frameForFolderView:", self->_folderView);
    -[SBFolderView setFrame:](folderView, "setFrame:");
  }
  childFolderContainerView = self->_childFolderContainerView;
  if (childFolderContainerView)
  {
    -[SBFolderContainerView folderView](self->_childFolderContainerView, "folderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderContainerView _frameForFolderView:](self, "_frameForFolderView:", v5);
    -[SBFolderContainerView setFrame:](childFolderContainerView, "setFrame:");

  }
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView transform](backgroundView, "transform");
    if (CGAffineTransformIsIdentity(&v8))
    {
      v7 = self->_backgroundView;
      -[SBFolderContainerView bounds](self, "bounds");
      -[UIView setFrame:](v7, "setFrame:");
    }
  }
}

- (SBFolderView)folderView
{
  return self->_folderView;
}

- (SBFolderContainerView)initWithFrame:(CGRect)a3
{
  return -[SBFolderContainerView initWithFolderView:](self, "initWithFolderView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBFolderContainerView)childFolderContainerView
{
  return self->_childFolderContainerView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void)setStatusBarHeight:(double)a3
{
  self->_statusBarHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_childFolderContainerView, 0);
  objc_storeStrong((id *)&self->_folderView, 0);
}

@end
