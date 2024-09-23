@implementation TVRUIPageButton

- (TVRUIPageButton)initWithType:(int64_t)a3 hasTapAction:(BOOL)a4
{
  TVRUIPageButton *v4;
  TVRUIPageButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRUIPageButton;
  v4 = -[TVRUIButton initWithType:hasTapAction:](&v7, sel_initWithType_hasTapAction_, a3, a4);
  v5 = v4;
  if (v4)
    -[TVRUIPageButton _setupSublayers](v4, "_setupSublayers");
  return v5;
}

- (void)_setupSublayers
{
  CALayer *v3;
  CALayer *contentLayer;
  CAShapeLayer *v5;
  CAShapeLayer *leftWing;
  CAShapeLayer *v7;
  CAShapeLayer *v8;
  CAShapeLayer *rightWing;
  CAShapeLayer *v10;
  void *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v3 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  contentLayer = self->_contentLayer;
  self->_contentLayer = v3;

  v5 = -[TVRUIPageButton newChevronWingLayer](self, "newChevronWingLayer");
  leftWing = self->_leftWing;
  self->_leftWing = v5;

  -[CAShapeLayer setAnchorPoint:](self->_leftWing, "setAnchorPoint:", 1.0, 0.5);
  CGAffineTransformMakeRotation(&v15, -0.279253);
  v7 = self->_leftWing;
  v14 = v15;
  -[CAShapeLayer setAffineTransform:](v7, "setAffineTransform:", &v14);
  v8 = -[TVRUIPageButton newChevronWingLayer](self, "newChevronWingLayer");
  rightWing = self->_rightWing;
  self->_rightWing = v8;

  -[CAShapeLayer setAnchorPoint:](self->_rightWing, "setAnchorPoint:", 0.0, 0.5);
  CGAffineTransformMakeRotation(&v13, 0.279253);
  v10 = self->_rightWing;
  v12 = v13;
  -[CAShapeLayer setAffineTransform:](v10, "setAffineTransform:", &v12);
  -[CALayer addSublayer:](self->_contentLayer, "addSublayer:", self->_leftWing);
  -[CALayer addSublayer:](self->_contentLayer, "addSublayer:", self->_rightWing);
  -[TVRUIPageButton layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSublayer:", self->_contentLayer);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIPageButton;
  -[TVRUIButton layoutSubviews](&v3, sel_layoutSubviews);
  -[TVRUIPageButton _updateLayers](self, "_updateLayers");
}

- (void)_updateLayers
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
  CGFloat v12;
  CGFloat v13;
  id v14;
  CGPath *v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[TVRUIPageButton layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CALayer setFrame:](self->_contentLayer, "setFrame:", v5, v7, v9, v11);
  -[CAShapeLayer setBounds:](self->_leftWing, "setBounds:", 0.0, 0.0, 12.0, 6.0);
  -[CAShapeLayer setBounds:](self->_rightWing, "setBounds:", 0.0, 0.0, 12.0, 6.0);
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  v12 = CGRectGetMidX(v16) + 2.0;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  -[CAShapeLayer setPosition:](self->_leftWing, "setPosition:", v12, CGRectGetMidY(v17));
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v13 = CGRectGetMidX(v18) + -2.0;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  -[CAShapeLayer setPosition:](self->_rightWing, "setPosition:", v13, CGRectGetMidY(v19));
  -[TVRUIPageButton wingPath](self, "wingPath");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = -[TVRUIPageButton _newScaledPathForPath:forSize:](self, "_newScaledPathForPath:forSize:", objc_msgSend(v14, "CGPath"), 12.0, 6.0);

  -[CAShapeLayer setPath:](self->_leftWing, "setPath:", v15);
  -[CAShapeLayer setPath:](self->_rightWing, "setPath:", v15);
  CGPathRelease(v15);
}

- (CGPath)_newScaledPathForPath:(CGPath *)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  CGPath *result;
  double v8;
  CGAffineTransform v9;
  CGRect PathBoundingBox;

  height = a4.height;
  width = a4.width;
  PathBoundingBox = CGPathGetPathBoundingBox(a3);
  result = 0;
  if (height != 0.0 && PathBoundingBox.size.height != 0.0)
  {
    if (PathBoundingBox.size.width / PathBoundingBox.size.height <= width / height)
      v8 = height / PathBoundingBox.size.height;
    else
      v8 = width / PathBoundingBox.size.width;
    memset(&v9, 0, sizeof(v9));
    CGAffineTransformMakeScale(&v9, v8, v8);
    return CGPathCreateMutableCopyByTransformingPath(a3, &v9);
  }
  return result;
}

- (UIBezierPath)wingPath
{
  UIBezierPath *wingPath;
  UIBezierPath *v4;
  UIBezierPath *v5;

  wingPath = self->_wingPath;
  if (!wingPath)
  {
    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 11.5, 2.5, 1.5);
    v4 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    -[UIBezierPath setLineCapStyle:](v4, "setLineCapStyle:", 0);
    -[UIBezierPath setLineJoinStyle:](v4, "setLineJoinStyle:", 0);
    -[UIBezierPath setLineWidth:](v4, "setLineWidth:", 1.0);
    -[UIBezierPath setMiterLimit:](v4, "setMiterLimit:", 10.0);
    v5 = self->_wingPath;
    self->_wingPath = v4;

    wingPath = self->_wingPath;
  }
  return wingPath;
}

- (id)newChevronWingLayer
{
  id v3;
  id v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x24BDE5758]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setFillColor:", objc_msgSend(v4, "CGColor"));

  -[TVRUIPageButton wingPath](self, "wingPath");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setPath:", objc_msgSend(v5, "CGPath"));

  return v3;
}

- (CAShapeLayer)leftWing
{
  return self->_leftWing;
}

- (void)setLeftWing:(id)a3
{
  objc_storeStrong((id *)&self->_leftWing, a3);
}

- (CAShapeLayer)rightWing
{
  return self->_rightWing;
}

- (void)setRightWing:(id)a3
{
  objc_storeStrong((id *)&self->_rightWing, a3);
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayer, a3);
}

- (void)setWingPath:(id)a3
{
  objc_storeStrong((id *)&self->_wingPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wingPath, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_rightWing, 0);
  objc_storeStrong((id *)&self->_leftWing, 0);
}

@end
