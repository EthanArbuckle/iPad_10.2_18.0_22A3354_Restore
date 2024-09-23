@implementation _TUISymbolImageLayer

- (void)updateContentAndBoundsWithImage:(id)a3 color:(id)a4
{
  id v6;
  CALayer *v7;
  CALayer *contentLayer;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double y;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id *v34;
  id v35;
  int v36;
  id v37;
  id v38;
  double v39;
  double v40;
  id v41;

  v41 = a3;
  v6 = a4;
  if (!self->_contentLayer)
  {
    v7 = (CALayer *)objc_claimAutoreleasedReturnValue(+[_TUIImplicitAnimationLayer layer](_TUIImplicitAnimationLayer, "layer"));
    contentLayer = self->_contentLayer;
    self->_contentLayer = v7;

    -[_TUISymbolImageLayer addSublayer:](self, "addSublayer:", self->_contentLayer);
  }
  if (v41)
  {
    objc_msgSend(v41, "contentInsets");
    v39 = v9;
    v40 = v10;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v41, "alignmentInsets");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    y = CGPointZero.y;
    v24 = -[_TUISymbolImageLayer bounds](self, "bounds");
    v27 = UIRectInset(v24, CGPointZero.x - v18, y - v16, v18 + v22 + v25, v16 + v20 + v26, v39, v14, v12, v40);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[_TUISymbolImageLayer contentsScale](self, "contentsScale");
    -[CALayer setContentsScale:](self->_contentLayer, "setContentsScale:");
    -[CALayer setFrame:](self->_contentLayer, "setFrame:", v27, v29, v31, v33);
    if (v6 && !objc_msgSend(v41, "isMulticolor"))
      v34 = (id *)&kCALayerContentsSwizzleAAAA;
    else
      v34 = (id *)&kCALayerContentsSwizzleRGBA;
    v35 = *v34;
    if (v35 != (id)kCALayerContentsSwizzleRGBA
      || (v37 = (id)objc_claimAutoreleasedReturnValue(-[CALayer contentsSwizzle](self->_contentLayer, "contentsSwizzle")),
          v37,
          v37 == v35))
    {
      v36 = 0;
    }
    else
    {
      +[CATransaction begin](CATransaction, "begin");
      v36 = 1;
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    }
    -[CALayer setContents:](self->_contentLayer, "setContents:", objc_msgSend(v41, "CGImage"));
    -[CALayer setContentsSwizzle:](self->_contentLayer, "setContentsSwizzle:", v35);
    if (v35 == (id)kCALayerContentsSwizzleAAAA)
      v38 = objc_msgSend(objc_retainAutorelease(v6), "CGColor");
    else
      v38 = 0;
    -[CALayer setContentsMultiplyColor:](self->_contentLayer, "setContentsMultiplyColor:", v38);
    if (v36)
      +[CATransaction commit](CATransaction, "commit");

  }
  -[_TUISymbolImageLayer _updateBackdropLayer](self, "_updateBackdropLayer");

}

- (void)setContentCompositingFilter:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CALayer compositingFilter](self->_contentLayer, "compositingFilter"));

  v5 = v6;
  if (v4 != v6)
  {
    -[CALayer setCompositingFilter:](self->_contentLayer, "setCompositingFilter:", v6);
    -[_TUISymbolImageLayer _updateBackdropLayer](self, "_updateBackdropLayer");
    v5 = v6;
  }

}

- (CAFilter)contentCompositingFilter
{
  return (CAFilter *)-[CALayer compositingFilter](self->_contentLayer, "compositingFilter");
}

- (void)_updateBackdropLayer
{
  unsigned int v3;
  uint64_t v4;
  CABackdropLayer *backdropLayer;
  CABackdropLayer *v6;
  CABackdropLayer *v7;
  CABackdropLayer *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CALayer compositingFilter](self->_contentLayer, "compositingFilter"));
  v3 = TUILayerCompositingFilterNeedsBackdropLayer(v9);
  if (v9)
    v4 = v3;
  else
    v4 = 1;
  -[_TUISymbolImageLayer setAllowsGroupBlending:](self, "setAllowsGroupBlending:", v4);
  backdropLayer = self->_backdropLayer;
  if (v3)
  {
    if (!backdropLayer)
    {
      v6 = (CABackdropLayer *)objc_claimAutoreleasedReturnValue(+[CABackdropLayer layer](CABackdropLayer, "layer"));
      v7 = self->_backdropLayer;
      self->_backdropLayer = v6;

      -[_TUISymbolImageLayer insertSublayer:below:](self, "insertSublayer:below:", self->_backdropLayer, self->_contentLayer);
    }
  }
  else if (backdropLayer)
  {
    -[CABackdropLayer removeFromSuperlayer](backdropLayer, "removeFromSuperlayer");
    v8 = self->_backdropLayer;
    self->_backdropLayer = 0;

  }
  -[CALayer frame](self->_contentLayer, "frame");
  -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
}

@end
