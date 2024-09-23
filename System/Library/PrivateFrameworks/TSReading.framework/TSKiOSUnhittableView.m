@implementation TSKiOSUnhittableView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKiOSUnhittableView;
  result = -[TSKiOSUnhittableView hitTest:withEvent:](&v6, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if (result == self)
    return 0;
  return result;
}

@end
