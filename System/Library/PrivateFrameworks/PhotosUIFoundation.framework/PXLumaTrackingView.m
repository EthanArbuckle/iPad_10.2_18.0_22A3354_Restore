@implementation PXLumaTrackingView

- (PXLumaTrackingView)initWithFrame:(CGRect)a3 threshold:(double)a4
{
  PXLumaTrackingView *v5;
  PXLumaTrackingView *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _UILumaTrackingBackdropView *backdropView;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXLumaTrackingView;
  v5 = -[PXLumaTrackingView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_thresholdLuma = a4;
    v7 = objc_alloc(MEMORY[0x24BEBDCA0]);
    v8 = fmax(a4 + -0.05, 0.0);
    if (a4 + 0.05 <= 1.0)
      v9 = a4 + 0.05;
    else
      v9 = 1.0;
    -[PXLumaTrackingView bounds](v6, "bounds");
    v14 = objc_msgSend(v7, "initWithTransitionBoundaries:delegate:frame:", v6, v8, v9, v10, v11, v12, v13);
    backdropView = v6->_backdropView;
    v6->_backdropView = (_UILumaTrackingBackdropView *)v14;

    -[PXLumaTrackingView addSubview:](v6, "addSubview:", v6->_backdropView);
  }
  return v6;
}

- (PXLumaTrackingView)initWithThreshold:(double)a3
{
  return -[PXLumaTrackingView initWithFrame:threshold:](self, "initWithFrame:threshold:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), a3);
}

- (PXLumaTrackingView)initWithFrame:(CGRect)a3
{
  return -[PXLumaTrackingView initWithFrame:threshold:](self, "initWithFrame:threshold:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.5);
}

- (PXLumaTrackingView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLumaTrackingView.m"), 54, CFSTR("%s is not available as initializer"), "-[PXLumaTrackingView initWithCoder:]");

  abort();
}

- (void)setLumaLevel:(int64_t)a3
{
  id v5;

  if (self->_lumaLevel != a3)
  {
    self->_lumaLevel = a3;
    -[PXLumaTrackingView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lumaTrackingView:didTransitionToLevel:", self, a3);

  }
}

- (void)setLumaTrackingEnabled:(BOOL)a3
{
  if (self->_lumaTrackingEnabled != a3)
  {
    self->_lumaTrackingEnabled = a3;
    -[_UILumaTrackingBackdropView setPaused:](self->_backdropView, "setPaused:", !a3);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLumaTrackingView;
  -[PXLumaTrackingView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXLumaTrackingView bounds](self, "bounds");
  -[_UILumaTrackingBackdropView setFrame:](self->_backdropView, "setFrame:");
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  uint64_t v4;

  if (a4 == 1)
    v4 = 2;
  else
    v4 = a4 == 2;
  -[PXLumaTrackingView setLumaLevel:](self, "setLumaLevel:", v4);
}

- (int64_t)lumaLevel
{
  return self->_lumaLevel;
}

- (PXLumaTrackingViewDelegate)delegate
{
  return (PXLumaTrackingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)lumaTrackingEnabled
{
  return self->_lumaTrackingEnabled;
}

- (double)thresholdLuma
{
  return self->_thresholdLuma;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
