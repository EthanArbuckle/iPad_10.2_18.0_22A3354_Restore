@implementation SPUIResilientView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGAffineTransform v9;
  objc_super v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v12, 0, sizeof(v12));
  -[SPUIResilientView transform](self, "transform");
  v11 = v12;
  if (CGAffineTransformIsIdentity(&v11))
  {
    v10.receiver = self;
    v10.super_class = (Class)SPUIResilientView;
    -[SPUIResilientView setFrame:](&v10, sel_setFrame_, x, y, width, height, v8.receiver, v8.super_class);
  }
  else
  {
    memset(&v11, 0, sizeof(v11));
    v9 = v12;
    CGAffineTransformInvert(&v11, &v9);
    -[SPUIResilientView frame](self, "frame");
    v9 = v11;
    v15 = CGRectApplyAffineTransform(v13, &v9);
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    if (!CGRectEqualToRect(v14, v15))
      -[SPUIResilientView setFrame:](&v8, sel_setFrame_, x, y, width, height, self, SPUIResilientView);
  }
}

@end
