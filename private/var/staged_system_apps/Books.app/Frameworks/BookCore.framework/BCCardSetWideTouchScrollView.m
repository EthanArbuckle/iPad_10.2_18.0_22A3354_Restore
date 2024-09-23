@implementation BCCardSetWideTouchScrollView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[BCCardSetWideTouchScrollView contentSize](self, "contentSize", a4);
  v10.origin.x = CGRectMakeWithSize(v6, v7);
  v9.x = x;
  v9.y = y;
  return CGRectContainsPoint(v10, v9);
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetWideTouchScrollView accessibilityDelegate](self, "accessibilityDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityScrollStatusForWideTouchScrollView:", self));

  return v4;
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double x;
  objc_super v9;

  v5 = a5;
  v6 = a4;
  x = a3.x;
  -[BCCardSetWideTouchScrollView contentOffset](self, "contentOffset", a3.x, a3.y);
  v9.receiver = self;
  v9.super_class = (Class)BCCardSetWideTouchScrollView;
  -[BCCardSetWideTouchScrollView accessibilityApplyScrollContent:sendScrollStatus:animated:](&v9, "accessibilityApplyScrollContent:sendScrollStatus:animated:", v6, v5, x);
}

- (BCCardSetWideTouchScrollViewDelegate)accessibilityDelegate
{
  return (BCCardSetWideTouchScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityDelegate);
}

- (void)setAccessibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessibilityDelegate);
}

@end
