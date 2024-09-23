@implementation TUILayerContainerView

- (TUILayerContainerView)initWithFrame:(CGRect)a3
{
  TUILayerContainerView *v3;
  TUILayerContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUILayerContainerView;
  v3 = -[TUILayerContainerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TUILayerContainerView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[TUILayerContainerView setClipsToBounds:](v4, "setClipsToBounds:", 0);
  }
  return v4;
}

+ (id)renderModelWithLayerModel:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  TUIRenderModelView *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIIdentifierLayerContainerView"), v5, v6);

  return v7;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUILayerContainerView;
  -[TUILayerContainerView _dynamicUserInterfaceTraitDidChange](&v3, "_dynamicUserInterfaceTraitDidChange");
  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    -[TUIRenderModelLayerBuilder dynamicUserInterfaceTraitDidChange](self->_builder, "dynamicUserInterfaceTraitDidChange");
  }
  else
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[TUIRenderModelLayerBuilder dynamicUserInterfaceTraitDidChange](self->_builder, "dynamicUserInterfaceTraitDidChange");
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUILayerContainerView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v7, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v7.receiver, v7.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  -[TUILayerContainerView configureWithModel:](self, "configureWithModel:", v6);

}

- (void)configureWithModel:(id)a3
{
  id v4;
  TUIRenderModelLayerBuilder *v5;
  TUIRenderModelLayerBuilder *builder;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  double v17;
  double v18;
  CALayer *containerClipLayer;
  unsigned int v20;
  CALayer *v21;
  CALayer *v22;
  CALayer *v23;
  char v24;
  CALayer *v25;
  CALayer *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CALayer *v33;
  CALayer **p_contentLayer;
  CALayer *contentLayer;
  void *v36;
  void *v37;
  _TUILayerContainerClip *WeakRetained;
  CALayer *v39;
  void *v40;
  CALayer *v41;
  char v42;
  CALayer *v43;
  CALayer *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  unsigned int v50;
  unsigned int v51;
  uint64_t v52;
  CABackdropLayer *backdropLayer;
  CALayer *v54;
  BOOL v55;
  void *v56;
  CABackdropLayer *v57;
  CABackdropLayer *v58;
  CABackdropLayer *v59;
  CABackdropLayer *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  void *v64;
  CATransform3D v65;
  CATransform3D v66;

  v4 = a3;
  if (!self->_builder)
  {
    v5 = objc_alloc_init(TUIRenderModelLayerBuilder);
    builder = self->_builder;
    self->_builder = v5;

  }
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIAnimationState currentState](_TUIAnimationState, "currentState"));
  v8 = objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayerBuilder model](self->_builder, "model"));
  v9 = (void *)v8;
  v10 = 0;
  if (v4 && v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayerBuilder model](self->_builder, "model"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v10 = objc_msgSend(v12, "isEqual:", v13);

  }
  v14 = objc_msgSend(v7, "shouldCaptureCALayerAnimations");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "config"));
  if ((objc_opt_respondsToSelector(v15, "clipContainerForCrossfade") & 1) != 0)
    v16 = objc_msgSend(v15, "clipContainerForCrossfade");
  else
    v16 = 0;
  objc_msgSend(v7, "duration");
  v18 = v17;
  v62 = v15;
  if (v10)
    v10 = objc_msgSend(v7, "shouldCaptureCALayerAnimations");
  containerClipLayer = self->_containerClipLayer;
  if (containerClipLayer)
    v20 = 0;
  else
    v20 = v16;
  if (v20 == 1)
  {
    v21 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    v22 = self->_containerClipLayer;
    self->_containerClipLayer = v21;

    -[CALayer setDelegate:](self->_containerClipLayer, "setDelegate:", self->_builder);
    v23 = (CALayer *)objc_claimAutoreleasedReturnValue(-[TUILayerContainerView layer](self, "layer"));
    -[CALayer addSublayer:](v23, "addSublayer:", self->_containerClipLayer);
LABEL_21:

    goto LABEL_22;
  }
  if (containerClipLayer)
    v24 = v16;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
  {
    -[CALayer removeFromSuperlayer](containerClipLayer, "removeFromSuperlayer");
    v23 = self->_containerClipLayer;
    self->_containerClipLayer = 0;
    goto LABEL_21;
  }
LABEL_22:
  if ((v16 & 1) == 0)
  {
    v25 = (CALayer *)objc_claimAutoreleasedReturnValue(-[TUILayerContainerView layer](self, "layer"));
    v64 = 0;
    if (!v14)
      goto LABEL_27;
    goto LABEL_26;
  }
  v25 = self->_containerClipLayer;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayerContainerView layer](self, "layer"));
  if (v14)
  {
LABEL_26:
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 0);
  }
LABEL_27:
  -[TUIRenderModelLayerBuilder setModel:](self->_builder, "setModel:", v4);
  v26 = (CALayer *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayerBuilder layer](self->_builder, "layer"));
  -[TUILayerContainerView bounds](self, "bounds");
  -[CALayer setPosition:](v26, "setPosition:", v27 * 0.5, v28 * 0.5);
  if (self->_containerClipLayer)
  {
    -[CALayer frame](v26, "frame");
    v30 = v29;
    v32 = v31;
    -[CALayer setFrame:](self->_containerClipLayer, "setFrame:");
    CATransform3DMakeTranslation(&v66, -v30, -v32, 0.0);
    v33 = self->_containerClipLayer;
    v65 = v66;
    -[CALayer setSublayerTransform:](v33, "setSublayerTransform:", &v65);
  }
  v63 = v7;
  if (v14)
    +[CATransaction commit](CATransaction, "commit");
  p_contentLayer = &self->_contentLayer;
  contentLayer = self->_contentLayer;
  if (contentLayer == v26)
  {
    if (v26)
    {
      v41 = (CALayer *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](v26, "superlayer"));

      if (v41 != v25)
      {
        -[CALayer removeFromSuperlayer](*p_contentLayer, "removeFromSuperlayer");
        -[CALayer addSublayer:](v25, "addSublayer:", *p_contentLayer);
      }
    }
  }
  else
  {
    if (v10)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
      objc_msgSend(v36, "setDuration:", v18);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
      objc_msgSend(v36, "setTimingFunction:", v37);

      objc_msgSend(v36, "setRemovedOnCompletion:", 1);
      if (v16)
      {
        WeakRetained = (_TUILayerContainerClip *)objc_loadWeakRetained((id *)&self->_containerClip);
        if (!WeakRetained)
        {
          WeakRetained = -[_TUILayerContainerClip initWithLayer:]([_TUILayerContainerClip alloc], "initWithLayer:", v25);
          objc_storeWeak((id *)&self->_containerClip, WeakRetained);
        }
        -[_TUILayerContainerClip addAnimation:](WeakRetained, "addAnimation:", v36);

      }
      -[CALayer addAnimation:forKey:](v25, "addAnimation:forKey:", v36, CFSTR("crossfade"));

      contentLayer = *p_contentLayer;
    }
    if ((objc_opt_respondsToSelector(contentLayer, "willRemoveLayerWithFeedControllerHost:") & 1) != 0)
    {
      v39 = *p_contentLayer;
      if (v39)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
        -[CALayer willRemoveLayerWithFeedControllerHost:](v39, "willRemoveLayerWithFeedControllerHost:", v40);

      }
    }
    else
    {
      v39 = 0;
    }
    -[CALayer removeFromSuperlayer](*p_contentLayer, "removeFromSuperlayer");
    if (v26)
    {
      -[CALayer addSublayer:](v25, "addSublayer:", v26);
      v42 = objc_opt_respondsToSelector(v26, "didAddLayerWithFeedControllerHost:");
      if ((v42 & 1) != 0)
        v43 = v26;
      else
        v43 = 0;
      v44 = v43;
      if ((v42 & 1) != 0)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
        -[CALayer didAddLayerWithFeedControllerHost:](v26, "didAddLayerWithFeedControllerHost:", v45);

      }
      -[CALayer bounds](v26, "bounds");
      if (v47 > 8192.0 || v46 > 8192.0)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
        objc_msgSend(v48, "reportLargeLayer:renderModel:", v26, v4);

      }
    }
    objc_storeStrong((id *)&self->_contentLayer, v26);

  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer compositingFilter](*p_contentLayer, "compositingFilter"));
  v50 = TUILayerCompositingFilterNeedsBackdropLayer(v49);
  v51 = v50;
  if (v49)
    v52 = v50;
  else
    v52 = 1;
  -[CALayer setAllowsGroupBlending:](v25, "setAllowsGroupBlending:", v52);
  objc_msgSend(v64, "setAllowsGroupBlending:", 1);
  backdropLayer = self->_backdropLayer;
  if (v51)
  {
    if (backdropLayer)
    {
      v54 = (CALayer *)objc_claimAutoreleasedReturnValue(-[CABackdropLayer superlayer](backdropLayer, "superlayer"));

      v55 = v54 == v25;
      v56 = v62;
      if (!v55)
      {
        -[CABackdropLayer removeFromSuperlayer](self->_backdropLayer, "removeFromSuperlayer");
        -[CALayer insertSublayer:atIndex:](v25, "insertSublayer:atIndex:", self->_backdropLayer, 0);
      }
    }
    else
    {
      v58 = (CABackdropLayer *)objc_claimAutoreleasedReturnValue(+[CABackdropLayer layer](CABackdropLayer, "layer"));
      v59 = self->_backdropLayer;
      self->_backdropLayer = v58;

      -[CABackdropLayer setDelegate:](self->_backdropLayer, "setDelegate:", self->_builder);
      -[CALayer insertSublayer:atIndex:](v25, "insertSublayer:atIndex:", self->_backdropLayer, 0);
      v56 = v62;
    }
  }
  else
  {
    v56 = v62;
    if (backdropLayer)
    {
      -[CABackdropLayer removeFromSuperlayer](backdropLayer, "removeFromSuperlayer");
      v57 = self->_backdropLayer;
      self->_backdropLayer = 0;

    }
  }
  v60 = self->_backdropLayer;
  if (v60)
    v61 = v14;
  else
    v61 = 0;
  if (v61 == 1)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 0);
    -[CALayer frame](*p_contentLayer, "frame");
    -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
    +[CATransaction commit](CATransaction, "commit");
  }
  else if (v60)
  {
    -[CALayer frame](*p_contentLayer, "frame");
    -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  }
  +[CATransaction commit](CATransaction, "commit");

}

- (void)viewDidEndDisplay
{
  CALayer *contentLayer;
  CABackdropLayer *backdropLayer;
  TUIRenderModelLayerBuilder *builder;
  CALayer *containerClipLayer;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUILayerContainerView;
  -[TUIReusableBaseView viewDidEndDisplay](&v8, "viewDidEndDisplay");
  -[CALayer removeFromSuperlayer](self->_contentLayer, "removeFromSuperlayer");
  contentLayer = self->_contentLayer;
  self->_contentLayer = 0;

  -[CABackdropLayer removeFromSuperlayer](self->_backdropLayer, "removeFromSuperlayer");
  backdropLayer = self->_backdropLayer;
  self->_backdropLayer = 0;

  builder = self->_builder;
  self->_builder = 0;

  -[CALayer removeFromSuperlayer](self->_containerClipLayer, "removeFromSuperlayer");
  containerClipLayer = self->_containerClipLayer;
  self->_containerClipLayer = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayerContainerView layer](self, "layer"));
  objc_msgSend(v7, "setAllowsGroupBlending:", 1);

}

- (void)prepareForReuse
{
  CALayer *contentLayer;
  CABackdropLayer *backdropLayer;
  TUIRenderModelLayerBuilder *builder;
  CALayer *containerClipLayer;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUILayerContainerView;
  -[TUIReusableBaseView prepareForReuse](&v8, "prepareForReuse");
  -[CALayer removeFromSuperlayer](self->_contentLayer, "removeFromSuperlayer");
  contentLayer = self->_contentLayer;
  self->_contentLayer = 0;

  -[CABackdropLayer removeFromSuperlayer](self->_backdropLayer, "removeFromSuperlayer");
  backdropLayer = self->_backdropLayer;
  self->_backdropLayer = 0;

  builder = self->_builder;
  self->_builder = 0;

  -[CALayer removeFromSuperlayer](self->_containerClipLayer, "removeFromSuperlayer");
  containerClipLayer = self->_containerClipLayer;
  self->_containerClipLayer = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayerContainerView layer](self, "layer"));
  objc_msgSend(v7, "setAllowsGroupBlending:", 1);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerClip);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_containerClipLayer, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
