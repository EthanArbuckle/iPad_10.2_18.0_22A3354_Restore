@implementation THPageLayerAndSubviewNoHitView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THPageLayerAndSubviewNoHitView;
  result = -[THPageLayerAndSubviewNoHitView hitTest:withEvent:](&v6, "hitTest:withEvent:", a4, a3.x, a3.y);
  if (result == self)
    return 0;
  return result;
}

@end
