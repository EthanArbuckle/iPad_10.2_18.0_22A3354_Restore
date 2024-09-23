@implementation CRLWPTextMagnifierRenderer

- (CRLWPTextMagnifierRenderer)initWithFrame:(CGRect)a3
{
  CRLWPTextMagnifierRenderer *v3;
  CRLWPTextMagnifierRenderer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLWPTextMagnifierRenderer;
  v3 = -[CRLWPTextMagnifierRenderer initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CRLWPTextMagnifierRenderer setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[CRLWPTextMagnifierRenderer setOpaque:](v4, "setOpaque:", 0);
  }
  return v4;
}

- (void)setAutoscrollDirections:(int)a3
{
  double v4;

  if (self->_autoscrollDirections != a3)
  {
    self->_autoscrollDirections = a3;
    v4 = 0.800000012;
    if (!a3)
      v4 = 1.0;
    -[CRLWPTextMagnifierRenderer setAlpha:](self, "setAlpha:", v4);
    -[CRLWPTextMagnifierRenderer setNeedsLayout](self, "setNeedsLayout");
    -[CRLWPTextMagnifierRenderer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)layoutSubviews
{
  id WeakRetained;
  unsigned int v4;
  _BOOL8 v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);
  v4 = objc_msgSend(WeakRetained, "shouldHideCanvasLayer");

  if (v4)
    v5 = -[CRLWPTextMagnifierRenderer autoscrollDirections](self, "autoscrollDirections") != 0;
  else
    v5 = 0;
  -[CRLWPTextMagnifierRenderer setHidden:](self, "setHidden:", v5);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext;
  void *v5;
  void *v6;
  id WeakRetained;

  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRenderer layer](self, "layer"));
  objc_msgSend(v5, "crl_ignoreAccessibilityInvertColorsIfNeeded:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRenderer layer](self, "layer"));
  objc_msgSend(WeakRetained, "drawMagnifierClippedCanvasLayer:inContext:", v6, CurrentContext);

}

- (CRLWPTextMagnifierRendererDelegate)rendererDelegate
{
  return (CRLWPTextMagnifierRendererDelegate *)objc_loadWeakRetained((id *)&self->_rendererDelegate);
}

- (void)setRendererDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rendererDelegate, a3);
}

- (int)autoscrollDirections
{
  return self->_autoscrollDirections;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rendererDelegate);
}

@end
