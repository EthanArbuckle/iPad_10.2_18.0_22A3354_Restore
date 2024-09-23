@implementation PRXTextField

- (PRXTextField)initWithFrame:(CGRect)a3
{
  PRXTextField *v3;
  PRXTextField *v4;
  void *v5;
  void *v6;
  PRXTextField *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRXTextField;
  v3 = -[PRXTextField initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PRXTextField setBorderStyle:](v3, "setBorderStyle:", 3);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXTextField _setBackgroundStrokeColor:](v4, "_setBackgroundStrokeColor:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXTextField _setBackgroundFillColor:](v4, "_setBackgroundFillColor:", v6);

    -[PRXTextField _setRoundedRectBackgroundCornerRadius:](v4, "_setRoundedRectBackgroundCornerRadius:", 12.0);
    v7 = v4;
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)PRXTextField;
  -[PRXTextField intrinsicContentSize](&v5, sel_intrinsicContentSize);
  v4 = fmax(v3, 50.0);
  result.height = v4;
  result.width = v2;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)PRXTextField;
  -[PRXTextField textRectForBounds:](&v9, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = fmax(v7, 20.0);
  if (width + -40.0 < v5)
    v5 = width + -40.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v8;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)PRXTextField;
  -[PRXTextField editingRectForBounds:](&v9, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = fmax(v7, 20.0);
  if (width + -40.0 < v5)
    v5 = width + -40.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v8;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)PRXTextField;
  -[PRXTextField placeholderRectForBounds:](&v9, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = fmax(v7, 20.0);
  if (width + -40.0 < v5)
    v5 = width + -40.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v8;
  return result;
}

@end
