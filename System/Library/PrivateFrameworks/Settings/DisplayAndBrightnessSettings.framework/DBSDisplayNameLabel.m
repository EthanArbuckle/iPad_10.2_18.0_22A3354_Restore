@implementation DBSDisplayNameLabel

- (DBSDisplayNameLabel)initWithFrame:(CGRect)a3
{
  DBSDisplayNameLabel *v3;
  DBSDisplayNameLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DBSDisplayNameLabel;
  v3 = -[DBSDisplayNameLabel initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DBSDisplayNameLabel setTextMargins:](v3, "setTextMargins:", 3.0, 10.0, 3.0, 10.0);
    -[DBSDisplayNameLabel layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDisplayNameLabel setBackgroundColor:](v4, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDisplayNameLabel setTextColor:](v4, "setTextColor:", v7);

    v8 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontSize");
    objc_msgSend(v8, "systemFontOfSize:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDisplayNameLabel setFont:](v4, "setFont:", v9);

    -[DBSDisplayNameLabel intrinsicContentSize](v4, "intrinsicContentSize");
    v11 = v10 * 0.5;
    -[DBSDisplayNameLabel layer](v4, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v11);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGSize result;

  -[DBSDisplayNameLabel text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[DBSDisplayNameLabel setText:](self, "setText:", CFSTR("Sizing"));
  v17.receiver = self;
  v17.super_class = (Class)DBSDisplayNameLabel;
  -[DBSDisplayNameLabel intrinsicContentSize](&v17, sel_intrinsicContentSize);
  v5 = v4;
  v7 = v6;
  if (!v3)
    -[DBSDisplayNameLabel setText:](self, "setText:", 0);
  -[DBSDisplayNameLabel textMargins](self, "textMargins");
  v9 = v7 + v8;
  -[DBSDisplayNameLabel textMargins](self, "textMargins");
  v11 = v9 + v10;
  -[DBSDisplayNameLabel textMargins](self, "textMargins");
  v13 = v5 + v12;
  -[DBSDisplayNameLabel textMargins](self, "textMargins");
  v15 = v13 + v14;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[DBSDisplayNameLabel textMargins](self, "textMargins");
  v12.receiver = self;
  v12.super_class = (Class)DBSDisplayNameLabel;
  -[DBSDisplayNameLabel drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
}

- (UIEdgeInsets)textMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textMargins.top;
  left = self->_textMargins.left;
  bottom = self->_textMargins.bottom;
  right = self->_textMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextMargins:(UIEdgeInsets)a3
{
  self->_textMargins = a3;
}

@end
