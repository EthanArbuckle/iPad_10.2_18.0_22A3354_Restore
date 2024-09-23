@implementation TSDMutableCurvedShadow

- (void)setCurve:(double)a3
{
  self->super.mCurve = a3;
}

- (void)setOffset:(double)a3
{
  double v4;

  -[TSDCurvedShadow clampOffset:](self, "clampOffset:", a3);
  self->super.super.mOffset = v4;
}

- (void)setAngle:(double)a3
{
  self->super.super.mAngle = a3;
}

- (void)setRadius:(double)a3
{
  self->super.super.mRadius = a3;
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
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMutableCurvedShadow setColor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCurvedShadow.m"), 376, CFSTR("invalid nil value for '%s'"), "color");
  }
  mColor = self->super.super.mColor;
  if (mColor != a3)
  {
    CGColorRelease(mColor);
    self->super.super.mColor = CGColorRetain(a3);
  }
}

- (void)setTSUColor:(id)a3
{
  -[TSDMutableCurvedShadow setColor:](self, "setColor:", objc_msgSend(a3, "CGColor"));
}

@end
