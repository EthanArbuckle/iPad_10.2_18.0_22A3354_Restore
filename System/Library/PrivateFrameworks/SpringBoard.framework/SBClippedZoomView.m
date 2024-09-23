@implementation SBClippedZoomView

- (SBClippedZoomView)initWithClippingFrame:(CGRect)a3 fullscreenZoomView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SBClippedZoomView *v16;
  uint64_t v17;
  UIView *clippingView;
  void *v20;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBZoomView.m"), 216, CFSTR("%s requires a fullscreenZoomViewToClip"), "-[SBClippedZoomView initWithClippingFrame:fullscreenZoomView:]");

  }
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)SBClippedZoomView;
  v16 = -[SBZoomView _initWithFrame:](&v21, sel__initWithFrame_);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", x, y, width, height);
    clippingView = v16->_clippingView;
    v16->_clippingView = (UIView *)v17;

    -[UIView setClipsToBounds:](v16->_clippingView, "setClipsToBounds:", 1);
    -[SBClippedZoomView addSubview:](v16, "addSubview:", v16->_clippingView);
    objc_storeStrong((id *)&v16->_fullscreenZoomViewToClip, a4);
    -[SBFullscreenZoomView setFrame:](v16->_fullscreenZoomViewToClip, "setFrame:", -x, -y, v13, v15);
    -[UIView addSubview:](v16->_clippingView, "addSubview:", v16->_fullscreenZoomViewToClip);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_fullscreenZoomViewToClip, 0);
}

@end
