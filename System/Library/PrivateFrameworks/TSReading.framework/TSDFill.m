@implementation TSDFill

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGPathAddRect(Mutable, 0, v11);
  -[TSDFill paintPath:inContext:](self, "paintPath:inContext:", Mutable, a4);
  CGPathRelease(Mutable);
}

- (BOOL)canApplyToCALayer
{
  return 0;
}

- (BOOL)shouldBeReappliedToCALayer:(id)a3
{
  return 0;
}

- (void)applyToCALayer:(id)a3 withScale:(double)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFill applyToCALayer:withScale:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFill.m"), 79, CFSTR("called -applyToCALayer:withScale: on a TSDFill that can't"));
}

- (BOOL)canApplyToCAShapeLayer
{
  return 0;
}

- (void)applyToCAShapeLayer:(id)a3 withScale:(double)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFill applyToCAShapeLayer:withScale:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFill.m"), 89, CFSTR("called -applyToCAShapeLayer:withScale: on a TSDFill that can't"));
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isNearlyWhite
{
  return 0;
}

- (BOOL)isClear
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

- (id)referenceColor
{
  return (id)objc_msgSend(MEMORY[0x24BEB3C40], "clearColor");
}

- (void)addInterest
{
  int *p_mInterest;
  unsigned int v3;

  p_mInterest = &self->mInterest;
  do
    v3 = __ldxr((unsigned int *)p_mInterest);
  while (__stxr(v3 + 1, (unsigned int *)p_mInterest));
}

- (void)removeInterest
{
  int *p_mInterest;
  unsigned int v3;
  unsigned int v4;

  p_mInterest = &self->mInterest;
  do
  {
    v3 = __ldxr((unsigned int *)p_mInterest);
    v4 = v3 - 1;
  }
  while (__stxr(v4, (unsigned int *)p_mInterest));
  if (!v4)
    -[TSDFill i_flushCaches](self, "i_flushCaches");
}

- (int)fillType
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFill fillType]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFill.m"), 145, CFSTR("subclasses must override"));
  return 4;
}

@end
