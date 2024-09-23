@implementation RBSymbolDrawingLayer

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = -[RBSymbolDrawingLayer delegate](self, "delegate");
  if (v4)
  {
    -[RBSymbolLayer drawingContents](v4, &v6);
    v5 = v6;
    objc_msgSend(v6, "renderInContext:options:", a3, 0);

  }
}

@end
