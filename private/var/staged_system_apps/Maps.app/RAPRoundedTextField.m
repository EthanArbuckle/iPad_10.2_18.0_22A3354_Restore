@implementation RAPRoundedTextField

- (RAPRoundedTextField)init
{
  RAPRoundedTextField *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPRoundedTextField;
  v2 = -[RAPRoundedTextField init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray6Color](UIColor, "systemGray6Color"));
    -[RAPRoundedTextField setBackgroundColor:](v2, "setBackgroundColor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRoundedTextField layer](v2, "layer"));
    objc_msgSend(v4, "setCornerRadius:", 7.5);

    -[RAPRoundedTextField setClipsToBounds:](v2, "setClipsToBounds:", 1);
  }
  return v2;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[RAPRoundedTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[RAPRoundedTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect result;

  v11.receiver = self;
  v11.super_class = (Class)RAPRoundedTextField;
  -[RAPRoundedTextField textRectForBounds:](&v11, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3 + 15.0;
  v6 = v5 + 7.5;
  v8 = v7 + -15.0;
  v10 = v9 + -15.0;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

@end
