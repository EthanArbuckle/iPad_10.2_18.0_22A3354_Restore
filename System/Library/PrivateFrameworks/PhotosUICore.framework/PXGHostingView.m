@implementation PXGHostingView

- (PXGHostingView)initWithFrame:(CGRect)a3
{
  PXGHostingView *v3;
  PXPixelBufferView *v4;
  uint64_t v5;
  PXPixelBufferView *pixelBufferView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGHostingView;
  v3 = -[PXGHostingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PXPixelBufferView alloc];
    -[PXGHostingView bounds](v3, "bounds");
    v5 = -[PXPixelBufferView initWithFrame:](v4, "initWithFrame:");
    pixelBufferView = v3->_pixelBufferView;
    v3->_pixelBufferView = (PXPixelBufferView *)v5;

    -[PXGHostingView addSubview:](v3, "addSubview:", v3->_pixelBufferView);
    -[PXGHostingView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  }
  return v3;
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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXGHostingView;
  -[PXGHostingView layoutSubviews](&v12, sel_layoutSubviews);
  -[PXGHostingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGHostingView pixelBufferView](self, "pixelBufferView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PXGHostingView _updatePresenter](self, "_updatePresenter");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGHostingView;
  -[PXGHostingView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXGHostingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGHostingView;
  -[PXGHostingView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PXGHostingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updatePresenter
{
  PXGMutableHostingControllerPresenter *presenter;
  _QWORD v3[5];

  presenter = self->_presenter;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__PXGHostingView__updatePresenter__block_invoke;
  v3[3] = &unk_1E5133DB0;
  v3[4] = self;
  -[PXGMutableHostingControllerPresenter performChanges:](presenter, "performChanges:", v3);
}

- (void)setHostingController:(id)a3
{
  PXGHostingController *v5;
  PXGHostingController *hostingController;
  void *v7;
  PXGMutableHostingControllerPresenter *v8;
  PXGMutableHostingControllerPresenter *presenter;
  PXGHostingController *v10;

  v5 = (PXGHostingController *)a3;
  hostingController = self->_hostingController;
  v10 = v5;
  if (hostingController != v5)
  {
    -[PXGHostingController unregisterFrameObserver:](hostingController, "unregisterFrameObserver:", self);
    objc_storeStrong((id *)&self->_hostingController, a3);
    -[PXGHostingView pixelBufferView](self, "pixelBufferView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueuePixelBuffer:", 0);

    -[PXGHostingController registerFrameObserver:](self->_hostingController, "registerFrameObserver:", self);
    -[PXGHostingController addPresenter](v10, "addPresenter");
    v8 = (PXGMutableHostingControllerPresenter *)objc_claimAutoreleasedReturnValue();
    presenter = self->_presenter;
    self->_presenter = v8;

    -[PXGHostingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (OS_dispatch_queue)hostingControllerObservationQueue
{
  OS_dispatch_queue *v2;
  id v3;

  v2 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  return v2;
}

- (void)hostingController:(id)a3 didRenderFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[PXGHostingView hostingController](self, "hostingController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[PXGHostingView pixelBufferView](self, "pixelBufferView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enqueuePixelBuffer:", objc_msgSend(v9, "pixelBuffer"));

  }
}

- (PXGHostingController)hostingController
{
  return self->_hostingController;
}

- (PXPixelBufferView)pixelBufferView
{
  return self->_pixelBufferView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferView, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

void __34__PXGHostingView__updatePresenter__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v7, "setSize:", v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "scale");
    objc_msgSend(v7, "setDisplayScale:");
  }

}

@end
