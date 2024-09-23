@implementation PVEffectDebugPoint

- (PVEffectDebugPoint)init
{
  PVEffectDebugPoint *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PVEffectDebugPoint;
  v2 = -[PVEffectDebugPoint init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugPoint setFillColor:](v2, "setFillColor:", v3);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugPoint setStrokeColor:](v2, "setStrokeColor:", v4);

  }
  return v2;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
}

- (NSArray)lineDashPattern
{
  return self->_lineDashPattern;
}

- (void)setLineDashPattern:(id)a3
{
  objc_storeStrong((id *)&self->_lineDashPattern, a3);
}

- (double)lineDashPhase
{
  return self->_lineDashPhase;
}

- (void)setLineDashPhase:(double)a3
{
  self->_lineDashPhase = a3;
}

- (BOOL)ignoreTransform
{
  return self->_ignoreTransform;
}

- (void)setIgnoreTransform:(BOOL)a3
{
  self->_ignoreTransform = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineDashPattern, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
