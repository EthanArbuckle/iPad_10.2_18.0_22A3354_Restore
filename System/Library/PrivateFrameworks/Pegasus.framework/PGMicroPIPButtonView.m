@implementation PGMicroPIPButtonView

+ (id)button
{
  id *v2;
  PGLayerHostView *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = (id *)objc_alloc_init((Class)a1);
  if (v2)
  {
    v3 = [PGLayerHostView alloc];
    objc_msgSend(v2, "bounds");
    v4 = -[PGLayerHostView initWithFrame:](v3, "initWithFrame:");
    v5 = v2[52];
    v2[52] = (id)v4;

    objc_msgSend(v2[52], "setUserInteractionEnabled:", 0);
    objc_msgSend(v2[52], "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsHitTesting:", 0);

    objc_msgSend(v2, "insertSubview:atIndex:", v2[52], 0);
    objc_msgSend(v2, "setClipsToBounds:", 1);
  }
  return v2;
}

- (PGHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return -[PGLayerHostView hostedWindowHostingHandle](self->_layerHostView, "hostedWindowHostingHandle");
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  -[PGLayerHostView setHostedWindowHostingHandle:](self->_layerHostView, "setHostedWindowHostingHandle:", a3);
}

- (void)layoutSubviews
{
  PGLayerHostView *layerHostView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGMicroPIPButtonView;
  -[PGMicroPIPButtonView layoutSubviews](&v4, sel_layoutSubviews);
  layerHostView = self->_layerHostView;
  -[PGMicroPIPButtonView bounds](self, "bounds");
  -[PGLayerHostView setFrame:](layerHostView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerHostView, 0);
}

@end
