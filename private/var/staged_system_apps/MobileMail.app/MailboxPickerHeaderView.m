@implementation MailboxPickerHeaderView

- (MailboxPickerHeaderView)init
{
  MailboxPickerHeaderView *v2;
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MailboxPickerHeaderView;
  v2 = -[MailboxPickerHeaderView init](&v14, "init");
  if (v2)
  {
    v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleSubheadline1, 0x8000, 0));
    v6 = v2->_titleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, 0.0));
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = v2->_titleLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailAccountCellTitleColor](UIColor, "mailAccountCellTitleColor"));
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    v10 = v2->_titleLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerHeaderView contentView](v2, "contentView"));
    objc_msgSend(v12, "addSubview:", v2->_titleLabel);

  }
  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double MaxX;
  void *v15;
  double v16;
  __n128 v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)MailboxPickerHeaderView;
  -[MailboxPickerHeaderView layoutSubviews](&v19, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));

  if (v3)
  {
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[UILabel frame](self->_titleLabel, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = 16.0;
    if (-[MailboxPickerHeaderView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerHeaderView contentView](self, "contentView"));
      objc_msgSend(v13, "bounds");
      MaxX = CGRectGetMaxX(v20);
      v21.origin.x = v5;
      v21.origin.y = v7;
      v21.size.width = v9;
      v21.size.height = v11;
      v12 = MaxX - CGRectGetWidth(v21) + -16.0;

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
    objc_msgSend(v15, "_bodyLeading");
    v17.n128_f64[0] = v16 * 1.83333333;
    v18 = UIRoundToViewScale(self, v17) + -4.0;

    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v12, v18, v9, v11);
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
