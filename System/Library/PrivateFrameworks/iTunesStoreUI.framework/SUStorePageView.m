@implementation SUStorePageView

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUStorePageView;
  -[SUStorePageView dealloc](&v3, sel_dealloc);
}

- (void)setBackdropView:(id)a3
{
  UIView *backdropView;
  UIView *v6;

  backdropView = self->_backdropView;
  if (backdropView != a3)
  {
    -[UIView removeFromSuperview](backdropView, "removeFromSuperview");

    v6 = (UIView *)a3;
    self->_backdropView = v6;
    if (v6)
      -[SUStorePageView insertSubview:atIndex:](self, "insertSubview:atIndex:", v6, 0);
  }
}

- (void)setContentView:(id)a3
{
  UIView *contentView;
  UIView *v6;

  contentView = self->_contentView;
  if (contentView != a3)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");

    v6 = (UIView *)a3;
    self->_contentView = v6;
    if (v6)
    {
      if (self->_headerScrollView || self->_previewOverlayView)
        -[SUStorePageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v6);
      else
        -[SUStorePageView addSubview:](self, "addSubview:", v6);
    }
  }
}

- (void)setHeaderView:(id)a3
{
  UIView *headerView;
  UIView *v6;
  UIScrollView *headerScrollView;
  UIScrollView *v8;
  UIScrollView *v9;

  headerView = self->_headerView;
  if (headerView != a3)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");

    v6 = (UIView *)a3;
    self->_headerView = v6;
    headerScrollView = self->_headerScrollView;
    if (v6)
    {
      if (!headerScrollView)
      {
        v8 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BDF6D50]);
        self->_headerScrollView = v8;
        -[UIScrollView setScrollEnabled:](v8, "setScrollEnabled:", 0);
        v9 = self->_headerScrollView;
        if (self->_previewOverlayView)
          -[SUStorePageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9);
        else
          -[SUStorePageView addSubview:](self, "addSubview:", v9);
      }
      -[UIScrollView addSubview:](self->_headerScrollView, "addSubview:", self->_headerView);
    }
    else
    {
      -[UIScrollView removeFromSuperview](headerScrollView, "removeFromSuperview");

      self->_headerScrollView = 0;
    }
    -[SUStorePageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPreviewOverlayView:(id)a3
{
  UIView *previewOverlayView;
  UIView *v6;

  previewOverlayView = self->_previewOverlayView;
  if (previewOverlayView != a3)
  {
    if ((SUStorePageView *)-[UIView superview](previewOverlayView, "superview") == self)
      -[UIView removeFromSuperview](self->_previewOverlayView, "removeFromSuperview");

    v6 = (UIView *)a3;
    self->_previewOverlayView = v6;
    if (v6)
      -[SUStorePageView addSubview:](self, "addSubview:", v6);
  }
}

- (void)setContentViewInsets:(UIEdgeInsets)a3
{
  if (self->_contentViewInsets.left != a3.left
    || self->_contentViewInsets.top != a3.top
    || self->_contentViewInsets.right != a3.right
    || self->_contentViewInsets.bottom != a3.bottom)
  {
    self->_contentViewInsets = a3;
    -[SUStorePageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *previewOverlayView;
  double v12;
  double v13;
  double top;
  double v15;
  double v16;
  double v17;
  double v18;
  double Width;
  UIView *headerView;
  CGRect v21;
  CGRect v22;

  -[SUStorePageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  previewOverlayView = self->_previewOverlayView;
  if (previewOverlayView)
  {
    -[UIView frame](previewOverlayView, "frame");
    v13 = v12;
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    -[UIView setFrame:](self->_previewOverlayView, "setFrame:", v4, v6, CGRectGetWidth(v21), v13);
  }
  if (self->_headerScrollView)
  {
    top = self->_contentViewInsets.top;
    -[UIView frame](self->_headerView, "frame");
    v16 = top - v15;
    -[UIView frame](self->_headerView, "frame");
    v18 = v17;
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.width = v8;
    v22.size.height = v10;
    Width = CGRectGetWidth(v22);
    -[UIScrollView setFrame:](self->_headerScrollView, "setFrame:", v4, v16, Width, v18);
    -[UIScrollView setContentSize:](self->_headerScrollView, "setContentSize:", Width, v18);
    headerView = self->_headerView;
    -[UIScrollView bounds](self->_headerScrollView, "bounds");
    -[UIView setFrame:](headerView, "setFrame:");
  }
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
}

- (UIView)backdropView
{
  return self->_backdropView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)previewOverlayView
{
  return self->_previewOverlayView;
}

- (UIEdgeInsets)contentViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentViewInsets.top;
  left = self->_contentViewInsets.left;
  bottom = self->_contentViewInsets.bottom;
  right = self->_contentViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
