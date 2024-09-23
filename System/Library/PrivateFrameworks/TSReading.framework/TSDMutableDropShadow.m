@implementation TSDMutableDropShadow

- (id)copyWithZone:(_NSZone *)a3
{
  TSDDropShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = +[TSDDropShadow allocWithZone:](TSDDropShadow, "allocWithZone:", a3);
  -[TSDShadow angle](self, "angle");
  v6 = v5;
  -[TSDShadow offset](self, "offset");
  v8 = v7;
  -[TSDShadow radius](self, "radius");
  v10 = v9;
  -[TSDShadow opacity](self, "opacity");
  return -[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:](v4, "initWithAngle:offset:radius:opacity:color:enabled:", -[TSDShadow color](self, "color"), -[TSDShadow isEnabled](self, "isEnabled"), v6, v8, v10, v11);
}

- (void)setAngle:(double)a3
{
  double v4;

  TSDNormalizeAngleInDegrees(a3);
  self->super.super.mAngle = v4;
}

- (void)setOffset:(double)a3
{
  double v4;

  -[TSDShadow clampOffset:](self, "clampOffset:", a3);
  self->super.super.mOffset = v4;
}

- (void)setRadius:(double)a3
{
  double v4;

  -[TSDShadow clampRadius:](self, "clampRadius:", a3);
  self->super.super.mRadius = v4;
}

- (void)setOpacity:(double)a3
{
  double v4;

  -[TSDShadow clampOpacity:](self, "clampOpacity:", a3);
  self->super.super.mOpacity = v4;
}

- (void)setColor:(CGColor *)a3
{
  void *v5;
  uint64_t v6;
  CGColor *mColor;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMutableDropShadow setColor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDropShadow.m"), 314, CFSTR("invalid nil value for '%s'"), "color");
  }
  mColor = self->super.super.mColor;
  if (mColor != a3)
  {
    CGColorRelease(mColor);
    self->super.super.mColor = CGColorRetain(a3);
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->super.super.mEnabled = a3;
}

- (void)setTSUColor:(id)a3
{
  -[TSDMutableDropShadow setColor:](self, "setColor:", objc_msgSend(a3, "CGColor"));
}

@end
