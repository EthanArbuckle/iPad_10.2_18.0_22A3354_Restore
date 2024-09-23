@implementation _UITextHighlightBackgroundView

- (_UITextHighlightBackgroundView)initWithFrame:(CGRect)a3
{
  _UITextHighlightBackgroundView *v3;
  CALayer *v4;
  CALayer *shadowLayer;
  double v6;
  void *v7;
  CAShapeLayer *v8;
  CAShapeLayer *highlightLayer;
  id v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UITextHighlightBackgroundView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    shadowLayer = v3->_shadowLayer;
    v3->_shadowLayer = v4;

    -[CALayer setShadowColor:](v3->_shadowLayer, "setShadowColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E0]));
    LODWORD(v6) = 0.25;
    -[CALayer setShadowOpacity:](v3->_shadowLayer, "setShadowOpacity:", v6);
    -[CALayer setShadowOffset:](v3->_shadowLayer, "setShadowOffset:", 0.0, 5.0);
    -[CALayer setShadowRadius:](v3->_shadowLayer, "setShadowRadius:", 15.0);
    -[UIView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v3->_shadowLayer);

    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    highlightLayer = v3->_highlightLayer;
    v3->_highlightLayer = v8;

    _UIGetTextHighlightFillColor();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_highlightLayer, "setFillColor:", objc_msgSend(v10, "CGColor"));

    -[UIView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v3->_highlightLayer);

  }
  return v3;
}

- (void)setVisiblePath:(id)a3
{
  UIBezierPath *v4;
  UIBezierPath *visiblePath;
  const CGPath *v6;
  id v7;

  v4 = (UIBezierPath *)objc_msgSend(a3, "copy");
  visiblePath = self->_visiblePath;
  self->_visiblePath = v4;

  -[CAShapeLayer setPath:](self->_highlightLayer, "setPath:", -[UIBezierPath CGPath](self->_visiblePath, "CGPath"));
  v6 = -[UIBezierPath CGPath](self->_visiblePath, "CGPath");
  -[_UITextHighlightBackgroundView shadowLayer](self, "shadowLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowPath:", v6);

}

- (UIBezierPath)visiblePath
{
  return self->_visiblePath;
}

- (CALayer)shadowLayer
{
  return self->_shadowLayer;
}

- (CAShapeLayer)highlightLayer
{
  return self->_highlightLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_visiblePath, 0);
}

@end
