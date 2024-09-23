@implementation SBSystemApertureSceneElementAccessoryView

- (void)setSourceLayerRenderingId:(unint64_t)a3 contextId:(unsigned int)a4
{
  if (self->_layerRenderingId != a3 || self->_sourceContextId != a4)
  {
    self->_layerRenderingId = a3;
    self->_sourceContextId = a4;
    -[SBSystemApertureSceneElementAccessoryView _configurePortalView](self, "_configurePortalView");
  }
}

- (void)_configurePortalView
{
  void *v3;
  void *v4;
  int v5;
  unsigned int sourceContextId;
  SBSystemApertureSceneElementAccessoryPortalView *v7;
  SBSystemApertureSceneElementAccessoryPortalView *v8;
  SBSystemApertureSceneElementAccessoryPortalView *portalView;
  void *v10;

  -[SBSystemApertureSceneElementAccessoryPortalView portalLayer](self->_portalView, "portalLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sourceLayerRenderId") == self->_layerRenderingId)
  {
    -[SBSystemApertureSceneElementAccessoryPortalView portalLayer](self->_portalView, "portalLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "sourceContextId");
    sourceContextId = self->_sourceContextId;

    if (v5 == sourceContextId)
      return;
  }
  else
  {

  }
  if (!self->_portalView)
  {
    v7 = [SBSystemApertureSceneElementAccessoryPortalView alloc];
    -[SBSystemApertureSceneElementAccessoryView bounds](self, "bounds");
    v8 = -[SBSystemApertureSceneElementAccessoryPortalView initWithFrame:](v7, "initWithFrame:");
    portalView = self->_portalView;
    self->_portalView = v8;

    -[SBSystemApertureSceneElementAccessoryView addSubview:](self, "addSubview:", self->_portalView);
    -[SBSystemApertureSceneElementAccessoryPortalView layer](self->_portalView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsHitTesting:", 0);

    -[SBSystemApertureSceneElementAccessoryPortalView setUserInteractionEnabled:](self->_portalView, "setUserInteractionEnabled:", 0);
  }
  -[SBSystemApertureSceneElementAccessoryView _configurePortalLayerWithSourceLayerRenderingId:contextId:](self, "_configurePortalLayerWithSourceLayerRenderingId:contextId:", self->_layerRenderingId, self->_sourceContextId);
}

- (void)_configurePortalLayerWithSourceLayerRenderingId:(unint64_t)a3 contextId:(unsigned int)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  unsigned int v14;
  id from;
  id location;

  if (a3 && a4)
  {
    objc_initWeak(&location, self);
    -[SBSystemApertureSceneElementAccessoryPortalView portalLayer](self->_portalView, "portalLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, v7);

    v8 = (void *)*MEMORY[0x24BDF74F8];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __103__SBSystemApertureSceneElementAccessoryView__configurePortalLayerWithSourceLayerRenderingId_contextId___block_invoke;
    v11[3] = &unk_24D4D0550;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(v13, &from);
    v14 = a4;
    v13[1] = (id)a3;
    objc_msgSend(v8, "sb_performBlockAfterCATransactionSynchronizedCommit:", v11);
    objc_destroyWeak(v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SBSystemApertureSceneElementAccessoryPortalView portalLayer](self->_portalView, "portalLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSourceLayerRenderId:", 0);

    -[SBSystemApertureSceneElementAccessoryPortalView portalLayer](self->_portalView, "portalLayer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceContextId:", 0);

  }
}

void __103__SBSystemApertureSceneElementAccessoryView__configurePortalLayerWithSourceLayerRenderingId_contextId___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2)
  {
    v3 = *(_DWORD *)(a1 + 56);
    if (v3 == objc_msgSend(WeakRetained, "sourceContextId"))
    {
      v4 = *(_QWORD *)(a1 + 48);
      if (v4 == objc_msgSend(WeakRetained, "layerRenderingId"))
      {
        objc_msgSend(v2, "setSourceLayerRenderId:", *(_QWORD *)(a1 + 48));
        objc_msgSend(v2, "setSourceContextId:", *(unsigned int *)(a1 + 56));
      }
    }
  }

}

- (void)setPreferredSize:(CGSize)a3
{
  double v3;
  double v4;

  v3 = fmax(a3.width, 0.0);
  v4 = fmax(a3.height, 0.0);
  if (self->_preferredSize.width != v3 || self->_preferredSize.height != v4)
  {
    self->_preferredSize.width = v3;
    self->_preferredSize.height = v4;
    -[SBSystemApertureSceneElementAccessoryView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSystemApertureSceneElementAccessoryView;
  -[SBSystemApertureSceneElementAccessoryView layoutSubviews](&v5, sel_layoutSubviews);
  -[SBSystemApertureSceneElementAccessoryView portalView](self, "portalView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElementAccessoryView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[SBSystemApertureSceneElementAccessoryView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[SBSystemApertureSceneElementAccessoryView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsHitTesting:", 0);

}

- (BOOL)allowsReparentingByLayoutHost
{
  return 1;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (SBSystemApertureSceneElementAccessoryPortalView)portalView
{
  return self->_portalView;
}

- (unint64_t)layerRenderingId
{
  return self->_layerRenderingId;
}

- (void)setLayerRenderingId:(unint64_t)a3
{
  self->_layerRenderingId = a3;
}

- (unsigned)sourceContextId
{
  return self->_sourceContextId;
}

- (void)setSourceContextId:(unsigned int)a3
{
  self->_sourceContextId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
}

@end
