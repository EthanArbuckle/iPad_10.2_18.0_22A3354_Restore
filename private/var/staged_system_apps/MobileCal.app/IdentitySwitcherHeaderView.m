@implementation IdentitySwitcherHeaderView

- (IdentitySwitcherHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  IdentitySwitcherHeaderView *v7;
  void *v8;
  uint64_t v9;
  UIFont *font;
  UILabel *v11;
  UILabel *label;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *separator;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)IdentitySwitcherHeaderView;
  v7 = -[IdentitySwitcherHeaderView initWithFrame:](&v19, "initWithFrame:");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleTitle2, 32770, 0));
    v9 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v8, 0.0));
    font = v7->_font;
    v7->_font = (UIFont *)v9;

    v11 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v7->_label;
    v7->_label = v11;

    -[UILabel setFont:](v7->_label, "setFont:", v7->_font);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Calendars"), &stru_1001B67C0, 0));
    -[UILabel setText:](v7->_label, "setText:", v14);

    -[UILabel sizeToFit](v7->_label, "sizeToFit");
    -[IdentitySwitcherHeaderView addSubview:](v7, "addSubview:", v7->_label);
    v15 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
    separator = v7->_separator;
    v7->_separator = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v7->_separator, "setBackgroundColor:", v17);

    -[IdentitySwitcherHeaderView addSubview:](v7, "addSubview:", v7->_separator);
  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int IsLeftToRight;
  double v17;
  double v18;
  double v19;
  double MaxY;
  uint64_t v21;
  double v22;
  uint64_t v23;
  CGRect v24;

  -[IdentitySwitcherHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UILabel frame](self->_label, "frame");
  v13 = v12;
  v15 = v14;
  IsLeftToRight = CalInterfaceIsLeftToRight(v11);
  -[IdentitySwitcherHeaderView layoutMargins](self, "layoutMargins");
  v19 = v8 - v18 - v13;
  if (IsLeftToRight)
    v19 = v17;
  -[UILabel setFrame:](self->_label, "setFrame:", v19, v10 * 0.5 - v15 * 0.5, v13, v15);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  MaxY = CGRectGetMaxY(v24);
  v22 = MaxY - CalOnePixelInPoints(v21);
  -[UIView setFrame:](self->_separator, "setFrame:", 0.0, v22, v8, CalOnePixelInPoints(v23));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[UIFont _scaledValueForValue:](self->_font, "_scaledValueForValue:", 52.0, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
