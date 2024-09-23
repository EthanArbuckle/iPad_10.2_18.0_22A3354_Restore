@implementation SUPreviewOverlayView

- (SUPreviewOverlayView)initWithFrame:(CGRect)a3
{
  SUPreviewOverlayView *v3;
  UIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUPreviewOverlayView;
  v3 = -[SUPreviewOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    -[SUPreviewOverlayView setBackgroundColor:](v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[SUPreviewOverlayView setOpaque:](v3, "setOpaque:", 0);
    if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
      v3->_borderView = v4;
      -[UIView setBackgroundColor:](v4, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.3));
      -[SUPreviewOverlayView addSubview:](v3, "addSubview:", v3->_borderView);
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUPreviewOverlayView;
  -[SUPreviewOverlayView dealloc](&v3, sel_dealloc);
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
  UIView *borderView;
  double v12;
  double v13;
  UIView *storePageView;
  CGRect v15;

  -[SUPreviewOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  borderView = self->_borderView;
  if (borderView)
  {
    -[UIView frame](borderView, "frame");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    v13 = 1.0 / v12;
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.width = v8;
    v15.size.height = v10;
    -[UIView setFrame:](self->_borderView, "setFrame:", v4, CGRectGetMaxY(v15) - v13, v8, v13);
  }
  storePageView = self->_storePageView;
  if (storePageView)
    -[UIView setFrame:](storePageView, "setFrame:", v4, v6, v8, v10);
}

- (void)setStorePageView:(id)a3
{
  UIView *storePageView;
  UIView *v6;

  storePageView = self->_storePageView;
  if (storePageView != a3)
  {
    -[UIView removeFromSuperview](storePageView, "removeFromSuperview");

    v6 = (UIView *)a3;
    self->_storePageView = v6;
    -[SUPreviewOverlayView insertSubview:atIndex:](self, "insertSubview:atIndex:", v6, 0);
    -[SUPreviewOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIView)storePageView
{
  return self->_storePageView;
}

@end
