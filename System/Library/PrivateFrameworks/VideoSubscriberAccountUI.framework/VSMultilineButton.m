@implementation VSMultilineButton

- (VSMultilineButton)initWithFrame:(CGRect)a3
{
  VSMultilineButton *v3;
  VSMultilineButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSMultilineButton;
  v3 = -[VSMultilineButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    commonInit(v3);
  return v4;
}

- (VSMultilineButton)initWithCoder:(id)a3
{
  id v4;
  VSMultilineButton *v5;
  objc_super v7;

  v4 = a3;
  VSRequireKeyedCoder();
  v7.receiver = self;
  v7.super_class = (Class)VSMultilineButton;
  v5 = -[VSMultilineButton initWithCoder:](&v7, sel_initWithCoder_, v4);

  if (v5)
    commonInit(v5);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSMultilineButton;
  -[VSMultilineButton dealloc](&v3, sel_dealloc);
}

- (void)_updateTitleTextColor
{
  id v3;

  -[VSMultilineButton tintColor](self, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VSMultilineButton setTitleColor:forState:](self, "setTitleColor:forState:", v3, 0);

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[VSMultilineButton layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VSMultilineButton titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intrinsicContentSize");
  v13 = v12;
  v15 = v14;

  v16 = v4 + v8 + v15;
  v17 = v6 + v10 + v13;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSMultilineButton;
  -[VSMultilineButton layoutSubviews](&v6, sel_layoutSubviews);
  -[VSMultilineButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setPreferredMaxLayoutWidth:", v4);
  v5.receiver = self;
  v5.super_class = (Class)VSMultilineButton;
  -[VSMultilineButton layoutSubviews](&v5, sel_layoutSubviews);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSMultilineButton;
  -[VSMultilineButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[VSMultilineButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[VSMultilineButton isHighlighted](self, "isHighlighted", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.200000003);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set");

    v5 = (void *)MEMORY[0x24BDF6870];
    -[VSMultilineButton bounds](self, "bounds");
    objc_msgSend(v5, "bezierPathWithRoundedRect:cornerRadius:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fill");

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VSMultilineButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSMultilineButton;
  -[VSMultilineButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[VSMultilineButton _updateTitleTextColor](self, "_updateTitleTextColor");
}

@end
