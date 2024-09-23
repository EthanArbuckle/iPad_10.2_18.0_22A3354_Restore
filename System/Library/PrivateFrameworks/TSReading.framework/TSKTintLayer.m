@implementation TSKTintLayer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKTintLayer;
  -[TSKTintLayer dealloc](&v3, sel_dealloc);
}

- (void)setContentsLayer:(id)a3
{
  CALayer *contentsLayer;

  contentsLayer = self->_contentsLayer;
  if (contentsLayer)
    -[TSKTintLayer replaceSublayer:with:](self, "replaceSublayer:with:", contentsLayer, a3);
  else
    -[TSKTintLayer addSublayer:](self, "addSublayer:", a3);
  self->_contentsLayer = (CALayer *)a3;
  -[TSKTintLayer setNeedsLayout](self, "setNeedsLayout");
}

- (id)contents
{
  return -[CALayer contents](self->_contentsLayer, "contents");
}

- (void)setContents:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKTintLayer setContents:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKTintLayer.m"), 44, CFSTR("Don't call -setContents: on TSKTintLayer"));
}

- (void)setNeedsDisplay
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKTintLayer setNeedsDisplay]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKTintLayer.m"), 49, CFSTR("Don't call -setNeedsDisplay on TSKTintLayer"));
}

- (void)layoutSublayers
{
  -[TSKTintLayer bounds](self, "bounds");
  -[CALayer setFrame:](self->_contentsLayer, "setFrame:");
}

- (CALayer)contentsLayer
{
  return self->_contentsLayer;
}

@end
