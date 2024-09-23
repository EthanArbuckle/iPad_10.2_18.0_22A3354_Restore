@implementation UIFocusRingDefaultShapeLayer

- (UIFocusRingDefaultShapeLayer)init
{
  UIFocusRingDefaultShapeLayer *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIFocusRingDefaultShapeLayer;
  v2 = -[UIFocusRingDefaultShapeLayer init](&v8, sel_init);
  if (v2)
  {
    +[UIColor keyboardFocusIndicatorColor]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)UIApp, "_effectiveUserInterfaceStyle") == 2)
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    v5 = objc_retainAutorelease(v3);
    -[UIFocusRingDefaultShapeLayer setBorderColor:](v2, "setBorderColor:", objc_msgSend(v5, "CGColor"));
    v6 = objc_retainAutorelease(v5);
    -[UIFocusRingDefaultShapeLayer setStrokeColor:](v2, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
    -[UIFocusRingDefaultShapeLayer setShadowOffset:](v2, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[UIFocusRingDefaultShapeLayer setFillColor:](v2, "setFillColor:", 0);
    +[UIFocusRingStyle cornerRadius](UIFocusRingStyle, "cornerRadius");
    -[UIFocusRingDefaultShapeLayer setCornerRadius:](v2, "setCornerRadius:");
    -[UIFocusRingDefaultShapeLayer setLineJoin:](v2, "setLineJoin:", *MEMORY[0x1E0CD3030]);
    -[UIFocusRingDefaultShapeLayer setLineCap:](v2, "setLineCap:", *MEMORY[0x1E0CD3010]);

  }
  return v2;
}

+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3
{
  void *v3;

  objc_msgSend(a1, "layer", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIFocusRingStyle borderThickness](UIFocusRingStyle, "borderThickness");
  objc_msgSend(v3, "setBorderWidth:");
  +[UIFocusRingStyle borderThickness](UIFocusRingStyle, "borderThickness");
  objc_msgSend(v3, "setLineWidth:");
  return v3;
}

+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3
{
  void *v3;

  objc_msgSend(a1, "layer", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIFocusRingStyle childrenFocusedBorderThickness](UIFocusRingStyle, "childrenFocusedBorderThickness");
  objc_msgSend(v3, "setBorderWidth:");
  +[UIFocusRingStyle childrenFocusedBorderThickness](UIFocusRingStyle, "childrenFocusedBorderThickness");
  objc_msgSend(v3, "setLineWidth:");
  return v3;
}

@end
