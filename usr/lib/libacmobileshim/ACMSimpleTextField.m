@implementation ACMSimpleTextField

- (ACMSimpleTextField)initWithFrame:(CGRect)a3
{
  ACMSimpleTextField *v3;
  const __CFString *v4;
  id v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ACMSimpleTextField;
  v3 = -[ACMSimpleTextField initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v4 = CFSTR("textField.png");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v4 = CFSTR("textField_iPad.png");
    }
    v5 = ACMImageWithName((uint64_t)v4);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      v6 = 4;
    }
    else
    {
      v6 = 3;
    }
    -[ACMSimpleTextField setBackground:](v3, "setBackground:", objc_msgSend(v5, "stretchableImageWithLeftCapWidth:topCapHeight:", v6, 0));
    -[ACMSimpleTextField setBorderStyle:](v3, "setBorderStyle:", 0);
  }
  return v3;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  height = a3.size.height;
  -[ACMSimpleTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width);
  v5 = v4 + -7.0 + -6.0;
  v6 = height + -4.0;
  v7 = 7.0;
  v8 = 2.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  height = a3.size.height;
  -[ACMSimpleTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width);
  v5 = v4 + -7.0 + -6.0;
  v6 = height + -4.0;
  v7 = 7.0;
  v8 = 2.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  height = a3.size.height;
  -[ACMSimpleTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width);
  v5 = v4 + -7.0 + -6.0;
  v6 = height + -4.0;
  v7 = 9.0;
  v8 = 2.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

@end
