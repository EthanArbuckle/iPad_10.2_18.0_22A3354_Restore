@implementation UIDOMHTMLOptGroupCell

- (UIDOMHTMLOptGroupCell)initWithHTMLOptGroupNode:(id)a3
{
  UIDOMHTMLOptGroupCell *v4;

  v4 = -[UIDOMHTMLOptionPickerCell initCommon](self, "initCommon");
  if (v4)
  {
    -[UILabel setText:](-[UIPickerContentView titleLabel](v4, "titleLabel"), "setText:", objc_msgSend(a3, "itemTitle"));
    -[UIPickerContentView setChecked:](v4, "setChecked:", 0);
    -[UILabel setTextColor:](-[UIPickerContentView titleLabel](v4, "titleLabel"), "setTextColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    -[UIDOMHTMLOptionPickerCell setDisabled:](v4, "setDisabled:", 1);
  }
  return v4;
}

- (double)labelWidthForBounds:(CGRect)a3
{
  double Width;
  double v4;

  Width = CGRectGetWidth(a3);
  +[UIPickerContentView _checkmarkOffset](UIPickerContentView, "_checkmarkOffset");
  return Width - v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double MaxX;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;

  if (-[UIPickerContentView titleLabel](self, "titleLabel"))
  {
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    +[UIPickerContentView _checkmarkOffset](UIPickerContentView, "_checkmarkOffset");
    v12 = v11;
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    MaxX = CGRectGetMaxX(v16);
    +[UIPickerContentView _checkmarkOffset](UIPickerContentView, "_checkmarkOffset");
    v15 = MaxX - v14;
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    -[UILabel setFrame:](-[UIPickerContentView titleLabel](self, "titleLabel"), "setFrame:", v12, 0.0, v15, CGRectGetHeight(v17));
  }
}

@end
