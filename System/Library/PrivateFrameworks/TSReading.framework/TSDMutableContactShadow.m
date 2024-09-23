@implementation TSDMutableContactShadow

- (void)setHeight:(double)a3
{
  self->super.mHeight = a3;
}

- (void)setPerspective:(double)a3
{
  self->super.mHeight = sin(a3 / 180.0 * 3.14159265);
}

- (void)setRadius:(double)a3
{
  double v4;

  -[TSDContactShadow clampRadius:](self, "clampRadius:", a3);
  self->super.super.mRadius = v4;
}

- (void)setOffset:(double)a3
{
  double v4;

  -[TSDContactShadow clampOffset:](self, "clampOffset:", a3);
  self->super.super.mOffset = v4;
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
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMutableContactShadow setColor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContactShadow.m"), 497, CFSTR("invalid nil value for '%s'"), "color");
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
  -[TSDMutableContactShadow setColor:](self, "setColor:", objc_msgSend(a3, "CGColor"));
}

@end
