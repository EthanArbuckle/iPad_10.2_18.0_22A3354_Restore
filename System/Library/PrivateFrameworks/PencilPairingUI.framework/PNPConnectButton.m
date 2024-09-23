@implementation PNPConnectButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGPoint v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  -[PNPConnectButton superview](self, "superview", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPConnectButton superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "convertRect:toView:", self);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  v18.x = x;
  v18.y = y;
  return CGRectContainsPoint(v19, v18);
}

@end
