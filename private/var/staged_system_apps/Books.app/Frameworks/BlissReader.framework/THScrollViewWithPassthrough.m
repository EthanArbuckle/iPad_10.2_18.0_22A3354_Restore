@implementation THScrollViewWithPassthrough

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  id v6;
  THScrollViewWithPassthrough *v7;
  double v8;
  THScrollViewWithPassthrough *v9;
  objc_super v11;

  y = a3.y;
  v11.receiver = self;
  v11.super_class = (Class)THScrollViewWithPassthrough;
  v6 = -[THScrollViewWithPassthrough hitTest:withEvent:](&v11, "hitTest:withEvent:", a4, a3.x);
  v7 = (THScrollViewWithPassthrough *)objc_claimAutoreleasedReturnValue(v6);
  if (v7 == self
    && (-[THScrollViewWithPassthrough heightOfTopZoneForDockingSwipe](self, "heightOfTopZoneForDockingSwipe"), y > v8))
  {
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (double)heightOfTopZoneForDockingSwipe
{
  return self->mHeightOfTopZoneForDockingSwipe;
}

- (void)setHeightOfTopZoneForDockingSwipe:(double)a3
{
  self->mHeightOfTopZoneForDockingSwipe = a3;
}

@end
