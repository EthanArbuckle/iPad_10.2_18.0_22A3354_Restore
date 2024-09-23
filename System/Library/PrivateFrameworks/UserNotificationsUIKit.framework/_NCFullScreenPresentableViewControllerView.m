@implementation _NCFullScreenPresentableViewControllerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _NCFullScreenPresentableViewControllerView *v5;
  void *v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NCFullScreenPresentableViewControllerView;
  -[_NCFullScreenPresentableViewControllerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_NCFullScreenPresentableViewControllerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    -[_NCFullScreenPresentableViewControllerView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowsHitTesting");

    if ((v7 & 1) != 0)
      return self;

    v5 = 0;
  }
  return v5;
}

@end
