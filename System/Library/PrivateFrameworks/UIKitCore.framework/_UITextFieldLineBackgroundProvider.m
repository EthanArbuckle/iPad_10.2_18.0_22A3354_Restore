@implementation _UITextFieldLineBackgroundProvider

+ (id)lineStyleMetricsProvider
{
  return -[_UITextFieldPaddedMetricsProvider initWithSymmetricalPadding:]([_UITextFieldPaddedMetricsProvider alloc], "initWithSymmetricalPadding:", 2.0, 2.0);
}

- (id)preferredMetricsProvider
{
  return +[_UITextFieldLineBackgroundProvider lineStyleMetricsProvider](_UITextFieldLineBackgroundProvider, "lineStyleMetricsProvider");
}

- (int64_t)associatedBorderStyle
{
  return 1;
}

- (void)enabledDidChangeAnimated:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldLineBackgroundProvider;
  -[_UITextFieldBackgroundProvider enabledDidChangeAnimated:](&v5, sel_enabledDidChangeAnimated_, a3);
  -[_UITextFieldBackgroundProvider textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsDisplay");

}

- (void)drawInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[_UITextFieldDrawingBackgroundProvider drawsContent](self, "drawsContent"))
  {
    -[_UITextFieldBackgroundProvider textField](self, "textField");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEnabled") & 1) != 0)
      +[UIColor labelColor](UIColor, "labelColor");
    else
      +[UIColor grayColor](UIColor, "grayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "set");
    UIRectFrameUsingOperation(1, x, y, width, height);

  }
}

@end
