@implementation UIPopoverButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (UIPopoverButton)initWithFrame:(CGRect)a3 buttonType:(int64_t)a4
{
  UIPopoverButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIPopoverButton;
  v4 = -[UIButton initWithFrame:](&v14, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forStates:](v4, "setTitleColor:forStates:", v5, 0);

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleShadowColor:forState:](v4, "setTitleShadowColor:forState:", v6, 0);

    -[UIButton setAdjustsImageWhenDisabled:](v4, "setAdjustsImageWhenDisabled:", 0);
    -[UIButton setAdjustsImageWhenHighlighted:](v4, "setAdjustsImageWhenHighlighted:", 0);
    -[UIButton titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShadowOffset:", 0.0, -1.0);

    -[UIView traitCollection](v4, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    v10 = 19.0;
    if (v9 == 5)
      v10 = 15.0;
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v4, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

  }
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIPopoverButton;
  -[UIButton setEnabled:](&v8, sel_setEnabled_);
  if (!-[UIButton _isModernButton](self, "_isModernButton"))
  {
    -[UIButton titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0.5;
    if (v3)
      v7 = 1.0;
    objc_msgSend(v5, "setAlpha:", v7);

  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  v12.receiver = self;
  v12.super_class = (Class)UIPopoverButton;
  -[UIButton _intrinsicSizeWithinSize:](&v12, sel__intrinsicSizeWithinSize_, width, height);
  v9 = 22.0;
  if (v7 == 5)
    v9 = 16.0;
  v10 = v9 + v8;
  v11 = 44.0;
  if (v7 == 5)
    v11 = 34.0;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
