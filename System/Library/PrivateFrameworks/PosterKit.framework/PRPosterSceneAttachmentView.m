@implementation PRPosterSceneAttachmentView

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRPosterSceneAttachmentView;
  -[PRPosterSceneAttachmentView layoutSubviews](&v6, sel_layoutSubviews);
  -[PRPosterSceneAttachmentView contentLayer](self, "contentLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "superlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v4, "setFrame:");

  }
}

- (void)setAttachment:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_attachment) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attachment, a3);
    -[PRPosterSceneAttachmentView layerHost](self, "layerHost");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContextId:", objc_msgSend(v5, "contextId"));
    v7.receiver = self;
    v7.super_class = (Class)PRPosterSceneAttachmentView;
    -[PRRenderingView setLevel:](&v7, sel_setLevel_, objc_msgSend(v5, "level"));
    -[PRPosterSceneAttachmentView setNeedsLayout](self, "setNeedsLayout");
    -[PRPosterSceneAttachmentView layoutIfNeeded](self, "layoutIfNeeded");

  }
}

- (BOOL)isEmpty
{
  return self->_attachment == 0;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRPosterSceneAttachmentView;
  -[PRRenderingView invalidate](&v3, sel_invalidate);
  -[PRPosterSceneAttachmentView setAttachment:](self, "setAttachment:", 0);
  -[PRPosterSceneAttachmentView _teardownContentLayer](self, "_teardownContentLayer");
}

- (void)_teardownContentLayer
{
  void *v3;
  CALayerHost *layerHost;

  -[PRPosterSceneAttachmentView contentLayer](self, "contentLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  layerHost = self->_layerHost;
  self->_layerHost = 0;

}

- (id)contentLayer
{
  return self->_layerHost;
}

- (id)layerHost
{
  CALayerHost *layerHost;
  CALayerHost *v4;
  CALayerHost *v5;
  CALayerHost *v6;
  void *v7;
  void *v8;

  layerHost = self->_layerHost;
  if (!layerHost)
  {
    objc_msgSend(MEMORY[0x1E0CD27B0], "layer");
    v4 = (CALayerHost *)objc_claimAutoreleasedReturnValue();
    v5 = self->_layerHost;
    self->_layerHost = v4;

    v6 = self->_layerHost;
    -[PRPosterSceneAttachmentView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[CALayerHost setFrame:](v6, "setFrame:");

    -[PRPosterSceneAttachmentView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", self->_layerHost);

    layerHost = self->_layerHost;
  }
  return layerHost;
}

- (PUIPosterSceneAttachment)attachment
{
  return self->_attachment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_layerHost, 0);
}

@end
