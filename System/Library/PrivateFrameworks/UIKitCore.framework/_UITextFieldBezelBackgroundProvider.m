@implementation _UITextFieldBezelBackgroundProvider

+ (id)bezelStyleMetricsProvider
{
  return -[_UITextFieldPaddedMetricsProvider initWithPerEdgePadding:]([_UITextFieldPaddedMetricsProvider alloc], "initWithPerEdgePadding:", 4.0, 7.0, 1.0, 7.0);
}

- (id)preferredMetricsProvider
{
  return +[_UITextFieldBezelBackgroundProvider bezelStyleMetricsProvider](_UITextFieldBezelBackgroundProvider, "bezelStyleMetricsProvider");
}

- (int64_t)associatedBorderStyle
{
  return 2;
}

- (void)addToTextField:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UITextFieldBezelBackgroundProvider;
  v3 = a3;
  -[_UITextFieldDrawingBackgroundProvider addToTextField:](&v8, sel_addToTextField_, v3);
  objc_msgSend(v3, "_contentView", v8.receiver, v8.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "alphaComponent");
    v7 = v6 == 1.0;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "setOpaque:", v7);

}

- (void)enabledDidChangeAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldBezelBackgroundProvider;
  -[_UITextFieldBackgroundProvider enabledDidChangeAnimated:](&v4, sel_enabledDidChangeAnimated_, a3);
  -[_UITextFieldDrawingBackgroundProvider setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  id v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[_UITextFieldDrawingBackgroundProvider drawsContent](self, "drawsContent"))
  {
    -[_UITextFieldBackgroundProvider textField](self, "textField");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");

    if (v9 == 2)
      +[UIColor darkGrayColor](UIColor, "darkGrayColor");
    else
      +[UIColor lightGrayColor](UIColor, "lightGrayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "set");

    v11 = x + 1.0;
    v12 = y + 1.0;
    UIRectFrameUsingOperation(1, v11, v12, width, height);
    +[UIColor grayColor](UIColor, "grayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "set");

    UIRectFrameUsingOperation(1, v11 + -1.0, v12 + -1.0, width, height);
  }
}

@end
