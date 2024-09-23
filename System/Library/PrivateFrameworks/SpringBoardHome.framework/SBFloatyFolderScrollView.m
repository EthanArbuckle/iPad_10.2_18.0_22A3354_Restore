@implementation SBFloatyFolderScrollView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  SBFloatyFolderScrollView *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v6 = self;
  -[SBFloatyFolderScrollView superview](self, "superview", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatyFolderScrollView convertPoint:toView:](v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "bounds");
  v13.x = v9;
  v13.y = v11;
  LOBYTE(v6) = CGRectContainsPoint(v14, v13);

  return (char)v6;
}

@end
