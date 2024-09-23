@implementation PXGHostingLayer

- (PXGHostingLayer)init
{
  PXGHostingLayer *v2;
  PXGHostingLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGHostingLayer;
  v2 = -[PXImageQueueLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXGHostingLayer setMasksToBounds:](v2, "setMasksToBounds:", 1);
  return v3;
}

- (void)setHostingController:(id)a3
{
  void *v5;
  PXGHostingController *v6;

  v6 = (PXGHostingController *)a3;
  if (self->_hostingController != v6)
  {
    objc_storeStrong((id *)&self->_hostingController, a3);
    -[PXGHostingController lastFrame](v6, "lastFrame");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageQueueLayer setPixelBuffer:](self, "setPixelBuffer:", objc_msgSend(v5, "pixelBuffer"));

    -[PXGHostingController registerFrameObserver:](v6, "registerFrameObserver:", self);
    -[PXGHostingLayer _updatePresenter](self, "_updatePresenter");
  }

}

- (void)setVisibilityInfo:(id)a3
{
  PXGHostingLayerVisibilityInfo *v5;
  PXGHostingLayerVisibilityInfo *visibilityInfo;
  PXGHostingLayerVisibilityInfo *v7;

  v5 = (PXGHostingLayerVisibilityInfo *)a3;
  visibilityInfo = self->_visibilityInfo;
  v7 = v5;
  if (visibilityInfo != v5)
  {
    -[PXGHostingLayerVisibilityInfo setDelegate:](visibilityInfo, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_visibilityInfo, a3);
    -[PXGHostingLayerVisibilityInfo setDelegate:](v7, "setDelegate:", self);
    -[PXGHostingLayer _updatePresenter](self, "_updatePresenter");
  }

}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGHostingLayer;
  -[PXGHostingLayer setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXGHostingLayer _updatePresenter](self, "_updatePresenter");
}

- (void)setContentsScale:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGHostingLayer;
  -[PXGHostingLayer setContentsScale:](&v4, sel_setContentsScale_, a3);
  -[PXGHostingLayer _updatePresenter](self, "_updatePresenter");
}

- (void)_updatePresenter
{
  void *v3;
  void *v4;
  void *presenter;
  PXGMutableHostingControllerPresenter *v6;
  PXGMutableHostingControllerPresenter *v7;
  PXGMutableHostingControllerPresenter *v8;
  _QWORD v9[5];

  -[PXGHostingLayer visibilityInfo](self, "visibilityInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "isVisible"))
  {
    presenter = self->_presenter;
    if (presenter)
    {
      self->_presenter = 0;
      goto LABEL_7;
    }
  }
  else if (!self->_presenter)
  {
    -[PXGHostingLayer hostingController](self, "hostingController");
    presenter = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(presenter, "addPresenter");
    v6 = (PXGMutableHostingControllerPresenter *)objc_claimAutoreleasedReturnValue();
    v7 = self->_presenter;
    self->_presenter = v6;

LABEL_7:
  }
  v8 = self->_presenter;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__PXGHostingLayer__updatePresenter__block_invoke;
  v9[3] = &unk_1E5133DB0;
  v9[4] = self;
  -[PXGMutableHostingControllerPresenter performChanges:](v8, "performChanges:", v9);

}

- (OS_dispatch_queue)hostingControllerObservationQueue
{
  return -[PXGHostingController layoutQueue](self->_hostingController, "layoutQueue");
}

- (void)hostingController:(id)a3 didRenderFrame:(id)a4
{
  -[PXImageQueueLayer setPixelBuffer:](self, "setPixelBuffer:", objc_msgSend(a4, "pixelBuffer", a3));
}

- (PXGHostingController)hostingController
{
  return self->_hostingController;
}

- (PXGHostingLayerVisibilityInfo)visibilityInfo
{
  return self->_visibilityInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityInfo, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

void __35__PXGHostingLayer__updatePresenter__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v6, "setSize:", v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "contentsScale");
  objc_msgSend(v6, "setDisplayScale:");

}

@end
