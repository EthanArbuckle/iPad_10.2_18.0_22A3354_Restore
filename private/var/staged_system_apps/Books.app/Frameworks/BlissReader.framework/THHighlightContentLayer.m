@implementation THHighlightContentLayer

+ (id)layer
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THHighlightContentLayer;
  v2 = objc_msgSendSuper2(&v4, "layer");
  objc_msgSend(v2, "setBlendMode:", 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_highlightColor);
  v3.receiver = self;
  v3.super_class = (Class)THHighlightContentLayer;
  -[THHighlightContentLayer dealloc](&v3, "dealloc");
}

- (void)setHighlightColor:(CGColor *)a3
{
  CGColor *highlightColor;

  highlightColor = self->_highlightColor;
  if (highlightColor != a3)
  {
    CGColorRelease(highlightColor);
    self->_highlightColor = CGColorRetain(a3);
  }
}

- (void)drawInContext:(CGContext *)a3
{
  CGRect v5;
  CGRect v6;

  CGContextSaveGState(a3);
  CGContextSetFillColorWithColor(a3, (CGColorRef)-[THHighlightContentLayer backgroundColor](self, "backgroundColor"));
  -[THHighlightContentLayer bounds](self, "bounds");
  CGContextFillRect(a3, v5);
  CGContextSetBlendMode(a3, (CGBlendMode)self->_blendMode);
  CGContextSetFillColorWithColor(a3, -[THHighlightContentLayer highlightColor](self, "highlightColor"));
  -[THHighlightContentLayer bounds](self, "bounds");
  CGContextFillRect(a3, v6);
  CGContextRestoreGState(a3);
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (CGColor)highlightColor
{
  return self->_highlightColor;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

@end
