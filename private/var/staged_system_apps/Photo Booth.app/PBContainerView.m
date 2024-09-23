@implementation PBContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBContainerView;
  result = -[PBContainerView hitTest:withEvent:](&v6, "hitTest:withEvent:", a4, a3.x, a3.y);
  if (result == self)
    return 0;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBContainerView;
  -[PBContainerView layoutSubviews](&v3, "layoutSubviews");
  -[PBContainerViewDelegate layoutContentView:](self->_delegate, "layoutContentView:", self);
}

- (PBContainerViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PBContainerViewDelegate *)a3;
}

@end
