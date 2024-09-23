@implementation TSDMutableShadow

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMutableShadow copyWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 663, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSDMutableShadow copyWithZone:]"), 0));
}

- (void)setAngle:(double)a3
{
  double v4;

  TSDNormalizeAngleInDegrees(a3);
  self->super.mAngle = v4;
}

- (void)setOffset:(double)a3
{
  double v4;

  -[TSDShadow clampOffset:](self, "clampOffset:", a3);
  self->super.mOffset = v4;
}

- (void)setRadius:(double)a3
{
  double v4;

  -[TSDShadow clampRadius:](self, "clampRadius:", a3);
  self->super.mRadius = v4;
}

- (void)setOpacity:(double)a3
{
  double v4;

  -[TSDShadow clampOpacity:](self, "clampOpacity:", a3);
  self->super.mOpacity = v4;
}

- (void)setColor:(CGColor *)a3
{
  void *v5;
  uint64_t v6;
  CGColor *mColor;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMutableShadow setColor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadow.m"), 689, CFSTR("invalid nil value for '%s'"), "color");
  }
  mColor = self->super.mColor;
  if (mColor != a3)
  {
    CGColorRelease(mColor);
    self->super.mColor = CGColorRetain(a3);
  }
}

- (void)setTSUColor:(id)a3
{
  -[TSDMutableShadow setColor:](self, "setColor:", objc_msgSend(a3, "CGColor"));
}

- (void)setEnabled:(BOOL)a3
{
  self->super.mEnabled = a3;
}

@end
