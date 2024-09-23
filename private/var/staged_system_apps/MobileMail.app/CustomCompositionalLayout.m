@implementation CustomCompositionalLayout

- (id)targetIndexPathForInteractivelyMovingItem:(id)a3 withPosition:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CustomCompositionalLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", x, y, 1.0, 1.0));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPath"));

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CustomCompositionalLayout;
    v11 = -[CustomCompositionalLayout targetIndexPathForInteractivelyMovingItem:withPosition:](&v13, "targetIndexPathForInteractivelyMovingItem:withPosition:", v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v10;
}

@end
