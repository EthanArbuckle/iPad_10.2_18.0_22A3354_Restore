@implementation RBSymbolContentsLayer

- (BOOL)allowsBottomLeftOrigin
{
  return 1;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  void *v3;

  v3 = (void *)-[RBSymbolContentsLayer delegate](self, "delegate", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
    objc_msgSend(v3, "setNeedsLayout");
}

@end
