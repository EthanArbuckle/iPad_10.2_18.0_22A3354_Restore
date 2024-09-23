@implementation TSKGradientShapeLayer

- (void)dealloc
{
  objc_super v3;

  -[CAGradientLayer removeFromSuperlayer](-[TSKGradientShapeLayer gradient](self, "gradient"), "removeFromSuperlayer");
  -[CAGradientLayer setDelegate:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setDelegate:", 0);
  -[TSKGradientShapeLayer setGradient:](self, "setGradient:", 0);
  -[CAShapeLayer removeFromSuperlayer](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "removeFromSuperlayer");
  -[CAShapeLayer setDelegate:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setDelegate:", 0);
  -[TSKGradientShapeLayer setShapeMask:](self, "setShapeMask:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_super v5;

  -[CAGradientLayer setDelegate:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setDelegate:", a3);
  -[CAShapeLayer setDelegate:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setDelegate:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setDelegate:](&v5, sel_setDelegate_, a3);
}

- (void)setPath:(CGPath *)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  const CGPath *v17;
  objc_super v18;
  CGAffineTransform v19;
  CGRect PathBoundingBox;
  CGRect v21;
  CGRect v22;

  if (-[TSKGradientShapeLayer isGradientTree](self, "isGradientTree"))
  {
    PathBoundingBox = CGPathGetPathBoundingBox(a3);
    x = PathBoundingBox.origin.x;
    y = PathBoundingBox.origin.y;
    width = PathBoundingBox.size.width;
    height = PathBoundingBox.size.height;
    -[TSKGradientShapeLayer lineWidth](self, "lineWidth");
    v10 = v9 * -0.5;
    -[TSKGradientShapeLayer lineWidth](self, "lineWidth");
    v12 = v11 * -0.5;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectInset(v21, v10, v12);
    v13 = v22.origin.x;
    v14 = v22.origin.y;
    v15 = v22.size.width;
    v16 = v22.size.height;
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeTranslation(&v19, -v22.origin.x, -v22.origin.y);
    v17 = (const CGPath *)MEMORY[0x219A1465C](a3, &v19);
    -[CAShapeLayer setPath:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setPath:", v17);
    CGPathRelease(v17);
    -[CAGradientLayer setFrame:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setFrame:", v13, v14, v15, v16);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)TSKGradientShapeLayer;
    -[TSKGradientShapeLayer setPath:](&v18, sel_setPath_, a3);
  }
}

- (void)setFillColor:(CGColor *)a3
{
  objc_super v5;

  -[CAShapeLayer setFillColor:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setFillColor:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setFillColor:](&v5, sel_setFillColor_, a3);
}

- (void)setFillRule:(id)a3
{
  objc_super v5;

  -[CAShapeLayer setFillRule:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setFillRule:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setFillRule:](&v5, sel_setFillRule_, a3);
}

- (void)setStrokeColor:(CGColor *)a3
{
  objc_super v5;

  -[CAShapeLayer setStrokeColor:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setStrokeColor:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setStrokeColor:](&v5, sel_setStrokeColor_, a3);
}

- (void)setStrokeStart:(double)a3
{
  objc_super v5;

  -[CAShapeLayer setStrokeStart:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setStrokeStart:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setStrokeStart:](&v5, sel_setStrokeStart_, a3);
}

- (void)setStrokeEnd:(double)a3
{
  objc_super v5;

  -[CAShapeLayer setStrokeEnd:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setStrokeEnd:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setStrokeEnd:](&v5, sel_setStrokeEnd_, a3);
}

- (void)setLineWidth:(double)a3
{
  objc_super v5;

  -[CAShapeLayer setLineWidth:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setLineWidth:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setLineWidth:](&v5, sel_setLineWidth_, a3);
}

- (void)setMiterLimit:(double)a3
{
  objc_super v5;

  -[CAShapeLayer setMiterLimit:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setMiterLimit:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setMiterLimit:](&v5, sel_setMiterLimit_, a3);
}

- (void)setLineCap:(id)a3
{
  objc_super v5;

  -[CAShapeLayer setLineCap:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setLineCap:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setLineCap:](&v5, sel_setLineCap_, a3);
}

- (void)setLineJoin:(id)a3
{
  objc_super v5;

  -[CAShapeLayer setLineJoin:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setLineJoin:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setLineJoin:](&v5, sel_setLineJoin_, a3);
}

- (void)setLineDashPhase:(double)a3
{
  objc_super v5;

  -[CAShapeLayer setLineDashPhase:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setLineDashPhase:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setLineDashPhase:](&v5, sel_setLineDashPhase_, a3);
}

- (void)setLineDashPattern:(id)a3
{
  objc_super v5;

  -[CAShapeLayer setLineDashPattern:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setLineDashPattern:", a3);
  v5.receiver = self;
  v5.super_class = (Class)TSKGradientShapeLayer;
  -[TSKGradientShapeLayer setLineDashPattern:](&v5, sel_setLineDashPattern_, a3);
}

- (void)setColors:(id)a3
{
  if (a3)
  {
    -[TSKGradientShapeLayer p_createGradientTreeIfNeeded](self, "p_createGradientTreeIfNeeded");
    -[CAGradientLayer setColors:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setColors:", a3);
  }
  else
  {
    -[TSKGradientShapeLayer p_flatten](self, "p_flatten");
  }
}

- (void)setLocations:(id)a3
{
  -[TSKGradientShapeLayer p_createGradientTreeIfNeeded](self, "p_createGradientTreeIfNeeded");
  -[CAGradientLayer setLocations:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setLocations:", a3);
}

- (void)setStartPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[TSKGradientShapeLayer p_createGradientTreeIfNeeded](self, "p_createGradientTreeIfNeeded");
  -[CAGradientLayer setStartPoint:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setStartPoint:", x, y);
}

- (void)setEndPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[TSKGradientShapeLayer p_createGradientTreeIfNeeded](self, "p_createGradientTreeIfNeeded");
  -[CAGradientLayer setEndPoint:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setEndPoint:", x, y);
}

- (void)setType:(id)a3
{
  -[TSKGradientShapeLayer p_createGradientTreeIfNeeded](self, "p_createGradientTreeIfNeeded");
  -[CAGradientLayer setType:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setType:", a3);
}

- (NSArray)colors
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (-[TSKGradientShapeLayer isGradientTree](self, "isGradientTree"))
    return -[CAGradientLayer colors](-[TSKGradientShapeLayer gradient](self, "gradient"), "colors");
  v4[0] = -[TSKGradientShapeLayer fillColor](self, "fillColor");
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
}

- (NSArray)locations
{
  if (-[TSKGradientShapeLayer isGradientTree](self, "isGradientTree"))
    return -[CAGradientLayer locations](-[TSKGradientShapeLayer gradient](self, "gradient"), "locations");
  else
    return 0;
}

- (CGPoint)startPoint
{
  double v3;
  double v4;
  CGPoint result;

  if (-[TSKGradientShapeLayer isGradientTree](self, "isGradientTree"))
  {
    -[CAGradientLayer startPoint](-[TSKGradientShapeLayer gradient](self, "gradient"), "startPoint");
  }
  else
  {
    v4 = 0.0;
    v3 = 0.5;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)endPoint
{
  double v3;
  double v4;
  CGPoint result;

  if (-[TSKGradientShapeLayer isGradientTree](self, "isGradientTree"))
  {
    -[CAGradientLayer endPoint](-[TSKGradientShapeLayer gradient](self, "gradient"), "endPoint");
  }
  else
  {
    v4 = 1.0;
    v3 = 0.5;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (NSString)type
{
  if (-[TSKGradientShapeLayer isGradientTree](self, "isGradientTree"))
    return -[CAGradientLayer type](-[TSKGradientShapeLayer gradient](self, "gradient"), "type");
  else
    return (NSString *)*MEMORY[0x24BDE5C48];
}

- (BOOL)isGradientTree
{
  return -[TSKGradientShapeLayer gradient](self, "gradient") != 0;
}

- (void)p_createGradientTreeIfNeeded
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  const CGPath *v16;
  id v17;
  objc_super v18;
  CGAffineTransform v19;
  CGRect PathBoundingBox;
  CGRect v21;
  CGRect v22;

  if (!-[TSKGradientShapeLayer gradient](self, "gradient"))
  {
    PathBoundingBox = CGPathGetPathBoundingBox((CGPathRef)-[TSKGradientShapeLayer path](self, "path"));
    x = PathBoundingBox.origin.x;
    y = PathBoundingBox.origin.y;
    width = PathBoundingBox.size.width;
    height = PathBoundingBox.size.height;
    -[TSKGradientShapeLayer lineWidth](self, "lineWidth");
    v8 = v7 * -0.5;
    -[TSKGradientShapeLayer lineWidth](self, "lineWidth");
    v10 = v9 * -0.5;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectInset(v21, v8, v10);
    v11 = v22.origin.x;
    v12 = v22.origin.y;
    v13 = v22.size.width;
    v14 = v22.size.height;
    v15 = (void *)objc_msgSend(MEMORY[0x24BDE56B8], "layer");
    objc_msgSend(v15, "setFrame:", v11, v12, v13, v14);
    objc_msgSend(v15, "setDelegate:", -[TSKGradientShapeLayer delegate](self, "delegate"));
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeTranslation(&v19, -v11, -v12);
    v16 = (const CGPath *)MEMORY[0x219A1465C](-[TSKGradientShapeLayer path](self, "path"), &v19);
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE5758]), "initWithLayer:", self);
    objc_msgSend(v17, "setFillColor:", -[TSKGradientShapeLayer fillColor](self, "fillColor"));
    objc_msgSend(v17, "setFillRule:", -[TSKGradientShapeLayer fillRule](self, "fillRule"));
    objc_msgSend(v17, "setStrokeColor:", -[TSKGradientShapeLayer strokeColor](self, "strokeColor"));
    -[TSKGradientShapeLayer strokeStart](self, "strokeStart");
    objc_msgSend(v17, "setStrokeStart:");
    -[TSKGradientShapeLayer strokeEnd](self, "strokeEnd");
    objc_msgSend(v17, "setStrokeEnd:");
    -[TSKGradientShapeLayer lineWidth](self, "lineWidth");
    objc_msgSend(v17, "setLineWidth:");
    -[TSKGradientShapeLayer miterLimit](self, "miterLimit");
    objc_msgSend(v17, "setMiterLimit:");
    objc_msgSend(v17, "setLineCap:", -[TSKGradientShapeLayer lineCap](self, "lineCap"));
    objc_msgSend(v17, "setLineJoin:", -[TSKGradientShapeLayer lineJoin](self, "lineJoin"));
    -[TSKGradientShapeLayer lineDashPhase](self, "lineDashPhase");
    objc_msgSend(v17, "setLineDashPhase:");
    objc_msgSend(v17, "setLineDashPattern:", -[TSKGradientShapeLayer lineDashPattern](self, "lineDashPattern"));
    objc_msgSend(v17, "setPath:", v16);
    objc_msgSend(v17, "setDelegate:", -[TSKGradientShapeLayer delegate](self, "delegate"));
    CGPathRelease(v16);
    -[TSKGradientShapeLayer setGradient:](self, "setGradient:", v15);
    -[TSKGradientShapeLayer setShapeMask:](self, "setShapeMask:", v17);
    -[CAGradientLayer setMask:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setMask:", -[TSKGradientShapeLayer shapeMask](self, "shapeMask"));
    -[TSKGradientShapeLayer addSublayer:](self, "addSublayer:", -[TSKGradientShapeLayer gradient](self, "gradient"));
    v18.receiver = self;
    v18.super_class = (Class)TSKGradientShapeLayer;
    -[TSKGradientShapeLayer setPath:](&v18, sel_setPath_, 0);
  }
}

- (void)p_flatten
{
  double v3;
  CGFloat v4;
  CGFloat v5;
  const CGPath *v6;
  objc_super v7;
  CGAffineTransform v8;

  if (-[TSKGradientShapeLayer gradient](self, "gradient"))
  {
    memset(&v8, 0, sizeof(v8));
    -[CAGradientLayer frame](-[TSKGradientShapeLayer gradient](self, "gradient"), "frame");
    v4 = v3;
    -[CAGradientLayer frame](-[TSKGradientShapeLayer gradient](self, "gradient"), "frame");
    CGAffineTransformMakeTranslation(&v8, v4, v5);
    v6 = (const CGPath *)MEMORY[0x219A1465C](-[CAShapeLayer path](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "path"), &v8);
    v7.receiver = self;
    v7.super_class = (Class)TSKGradientShapeLayer;
    -[TSKGradientShapeLayer setPath:](&v7, sel_setPath_, v6);
    CGPathRelease(v6);
    -[CAGradientLayer removeFromSuperlayer](-[TSKGradientShapeLayer gradient](self, "gradient"), "removeFromSuperlayer");
    -[CAGradientLayer setDelegate:](-[TSKGradientShapeLayer gradient](self, "gradient"), "setDelegate:", 0);
    -[TSKGradientShapeLayer setGradient:](self, "setGradient:", 0);
    -[CAShapeLayer removeFromSuperlayer](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "removeFromSuperlayer");
    -[CAShapeLayer setDelegate:](-[TSKGradientShapeLayer shapeMask](self, "shapeMask"), "setDelegate:", 0);
    -[TSKGradientShapeLayer setShapeMask:](self, "setShapeMask:", 0);
  }
}

- (CAGradientLayer)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CAShapeLayer)shapeMask
{
  return self->_shapeMask;
}

- (void)setShapeMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
