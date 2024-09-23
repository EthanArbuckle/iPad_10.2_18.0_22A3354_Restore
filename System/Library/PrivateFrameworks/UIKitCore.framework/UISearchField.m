@implementation UISearchField

+ (double)defaultHeight
{
  return 29.0;
}

- (UISearchField)initWithFrame:(CGRect)a3
{
  UISearchField *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)UISearchField;
  v3 = -[UITextField initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    _UIImageWithName(CFSTR("UISearchFieldIcon.png"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "scale");
    _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v8, v9);
    objc_msgSend(v4, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
    -[UIView _interactionTintColor](v3, "_interactionTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UIView _interactionTintColor](v3, "_interactionTintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor _composedColorFromSourceColor:destinationColor:tintColor:alpha:](1.0, (uint64_t)UIColor, v12, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "set");

    objc_msgSend(v4, "size");
    v14 = v13;
    objc_msgSend(v4, "size");
    v19.size.height = v15;
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.width = v14;
    UIRectFillUsingBlendMode(v19, kCGBlendModeSourceIn);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    -[UITextField setIcon:](v3, "setIcon:", v16);
    -[UITextField setBorderStyle:](v3, "setBorderStyle:", 3);

  }
  return v3;
}

- (id)_placeholderColor
{
  int v2;
  double v3;

  v2 = _AXDarkenSystemColors();
  v3 = 0.25;
  if (!v2)
    v3 = 0.5;
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v3, 1.0);
}

- (CGRect)iconRect
{
  double v3;
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
  objc_super v14;
  CGRect result;

  v14.receiver = self;
  v14.super_class = (Class)UISearchField;
  -[UITextField iconRect](&v14, sel_iconRect);
  v4 = v3;
  v6 = v5;
  UIRoundToViewScale(self);
  v8 = v7;
  UIRoundToViewScale(self);
  v10 = v9;
  v11 = v8;
  v12 = v4;
  v13 = v6;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (CGRect)_availableTextRectExcludingButtonsForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  UIRoundToViewScale(self);
  v8 = _UICGRectInsetZeroClamped(x, y, width, height, v7, 2.0);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)UISearchField;
  -[UITextField rightViewRectForBounds:](&v8, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6 + 6.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v7;
  return result;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 0;
}

@end
