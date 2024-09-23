@implementation BETableViewCellPageNumberLabel

- (BETableViewCellPageNumberLabel)initWithFrame:(CGRect)a3
{
  BETableViewCellPageNumberLabel *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BETableViewCellPageNumberLabel;
  v3 = -[BETableViewCellPageNumberLabel initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    -[BETableViewCellPageNumberLabel setFont:](v3, "setFont:", v4);

    v5 = objc_msgSend((id)objc_opt_class(v3), "p_textColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[BETableViewCellPageNumberLabel setTextColor:](v3, "setTextColor:", v6);

    -[BETableViewCellPageNumberLabel setTextAlignment:](v3, "setTextAlignment:", 2);
  }
  return v3;
}

+ (id)p_textColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.556862745, 0.556862745, 0.576470588, 1.0);
}

@end
