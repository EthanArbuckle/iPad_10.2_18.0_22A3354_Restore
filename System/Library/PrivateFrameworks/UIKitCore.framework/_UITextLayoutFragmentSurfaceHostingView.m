@implementation _UITextLayoutFragmentSurfaceHostingView

- (void)_updateGeometry
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  if (self->_surface)
  {
    v18.receiver = self;
    v18.super_class = (Class)_UITextLayoutFragmentSurfaceHostingView;
    -[_UITextLayoutFragmentViewBase _updateGeometry](&v18, sel__updateGeometry);
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[NSCustomTextSurface layer](self->_surface, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);

    -[NSCustomTextSurface layer](self->_surface, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnchorPoint:", 0.0, 0.0);

    -[UIView bounds](self, "bounds");
    v14 = v13;
    v16 = v15;
    -[NSCustomTextSurface layer](self->_surface, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPosition:", v14, v16);

  }
}

- (CGRect)_activeLayoutFragmentFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSCustomTextSurface *surface;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[_UITextLayoutFragmentViewBase layoutFragment](self, "layoutFragment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFragmentFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  surface = self->_surface;
  if (surface)
  {
    -[NSCustomTextSurface adjustedLayoutFragmentFrame:](surface, "adjustedLayoutFragmentFrame:", v5, v7, v9, v11);
    v5 = v13;
    v7 = v14;
    v9 = v15;
    v11 = v16;
  }
  v17 = v5;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGPoint)_activeContainerOrigin
{
  double v3;
  double v4;
  NSCustomTextSurface *surface;
  CGPoint result;

  -[_UITextLayoutFragmentViewBase containerOrigin](self, "containerOrigin");
  surface = self->_surface;
  if (surface)
    -[NSCustomTextSurface adjustedContainerOrigin:](surface, "adjustedContainerOrigin:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)_activeClipRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSCustomTextSurface *surface;
  CGRect result;

  -[_UITextLayoutFragmentViewBase clipRect](self, "clipRect");
  surface = self->_surface;
  if (surface)
    -[NSCustomTextSurface adjustedClipRect:](surface, "adjustedClipRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)updateWithSurface:(id)a3
{
  NSCustomTextSurface *v5;
  CALayer **p_hostedLayer;
  void *v7;
  void *v8;
  uint64_t v9;
  CALayer *v10;
  void *v11;
  CALayer *v12;
  CALayer *hostedLayer;
  void *v14;
  void *v15;
  NSCustomTextSurface *v16;

  v5 = (NSCustomTextSurface *)a3;
  v16 = v5;
  if (self->_surface == v5)
  {
    -[NSCustomTextSurface layer](v5, "layer");
    v12 = (CALayer *)objc_claimAutoreleasedReturnValue();
    p_hostedLayer = &self->_hostedLayer;
    hostedLayer = self->_hostedLayer;

    if (v12 == hostedLayer)
      goto LABEL_6;
    -[CALayer superlayer](*p_hostedLayer, "superlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
      -[CALayer removeFromSuperlayer](*p_hostedLayer, "removeFromSuperlayer");
  }
  else
  {
    p_hostedLayer = &self->_hostedLayer;
    -[CALayer superlayer](self->_hostedLayer, "superlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
      -[CALayer removeFromSuperlayer](*p_hostedLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_surface, a3);
  }
  -[NSCustomTextSurface layer](self->_surface, "layer");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *p_hostedLayer;
  *p_hostedLayer = (CALayer *)v9;

  -[UIView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSublayer:", *p_hostedLayer);

LABEL_6:
}

- (void)teardown
{
  void *v3;
  void *v4;
  CALayer *hostedLayer;
  NSCustomTextSurface *surface;
  objc_super v7;

  -[CALayer superlayer](self->_hostedLayer, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    -[CALayer removeFromSuperlayer](self->_hostedLayer, "removeFromSuperlayer");
  hostedLayer = self->_hostedLayer;
  self->_hostedLayer = 0;

  surface = self->_surface;
  self->_surface = 0;

  v7.receiver = self;
  v7.super_class = (Class)_UITextLayoutFragmentSurfaceHostingView;
  -[_UITextLayoutFragmentViewBase teardown](&v7, sel_teardown);
}

- (void)setNeedsDisplay
{
  -[CALayer setNeedsDisplay](self->_hostedLayer, "setNeedsDisplay");
}

- (NSCustomTextSurface)surface
{
  return self->_surface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surface, 0);
  objc_storeStrong((id *)&self->_hostedLayer, 0);
}

@end
