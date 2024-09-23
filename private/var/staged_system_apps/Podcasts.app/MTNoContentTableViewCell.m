@implementation MTNoContentTableViewCell

+ (id)reuseIdentifier
{
  return CFSTR("kMTNoContentTableViewCellReuseIdentifier");
}

- (MTNoContentTableViewCell)init
{
  id v3;
  void *v4;
  MTNoContentTableViewCell *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[MTNoContentTableViewCell initWithReuseIdentifier:](self, "initWithReuseIdentifier:", v4);

  return v5;
}

- (MTNoContentTableViewCell)initWithReuseIdentifier:(id)a3
{
  return -[MTNoContentTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, a3);
}

- (MTNoContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTNoContentTableViewCell *v4;
  MTNoContentTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTNoContentTableViewCell;
  v4 = -[MTTableViewCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTNoContentTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[MTNoContentTableViewCell setSeparatorInset:](v5, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTNoContentTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

  }
  return v5;
}

- (void)setupCell
{
  UILabel *v3;
  UILabel *messageLabel;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTNoContentTableViewCell;
  -[MTTableViewCell setupCell](&v7, "setupCell");
  -[MTNoContentTableViewCell bounds](self, "bounds");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue(+[MTContentUnavailableView messageLabelWithFrame:](MTContentUnavailableView, "messageLabelWithFrame:"));
  messageLabel = self->_messageLabel;
  self->_messageLabel = v3;

  -[UILabel setAutoresizingMask:](self->_messageLabel, "setAutoresizingMask:", 18);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTNoContentTableViewCell message](self, "message"));
  -[UILabel setText:](self->_messageLabel, "setText:", v5);

  -[UILabel setAlpha:](self->_messageLabel, "setAlpha:", 1.0);
  -[UILabel setOpaque:](self->_messageLabel, "setOpaque:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTNoContentTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "addSubview:", self->_messageLabel);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTNoContentTableViewCell;
  v4 = a3;
  -[MTNoContentTableViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTNoContentTableViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  v7 = objc_msgSend(v4, "horizontalSizeClass");

  if (v6 != v7)
    -[MTNoContentTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  UIUserInterfaceLayoutDirection v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Width;
  unsigned int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v17.receiver = self;
  v17.super_class = (Class)MTNoContentTableViewCell;
  -[MTTableViewCell layoutSubviews](&v17, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTNoContentTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  CGRectGetHeight(v18);

  -[UILabel frame](self->_messageLabel, "frame");
  -[UILabel setFrame:](self->_messageLabel, "setFrame:");
  v4 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[MTNoContentTableViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  -[MTNoContentTableViewCell contentInset](self, "contentInset");
  v6 = v5;
  -[MTNoContentTableViewCell contentInset](self, "contentInset");
  v8 = v7;
  -[MTNoContentTableViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v19);
  v10 = -[MTNoContentTableViewCell isHorizontallyRegular](self, "isHorizontallyRegular");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v11, "scale");
  v13 = v12;

  if (v4)
  {
    if (-[MTNoContentTableViewCell isHorizontallyRegular](self, "isHorizontallyRegular"))
      v14 = v8;
    else
      v14 = 0.0;
  }
  else
  {
    v14 = v6;
  }
  v15 = 0.0;
  if (v10)
    v15 = v8;
  v16 = Width - v6 - v15;
  -[MTNoContentTableViewCell bounds](self, "bounds");
  -[UIView setFrame:](self->super._separator, "setFrame:", v14, CGRectGetMaxY(v20) + -24.0 - 1.0 / v13, v16, 1.0 / v13);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)MTNoContentTableViewCell;
  -[MTNoContentTableViewCell sizeThatFits:](&v6, "sizeThatFits:", a3.width, a3.height);
  v5 = v4 + 24.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setMessage:(id)a3
{
  -[UILabel setText:](self->_messageLabel, "setText:", a3);
}

- (NSString)message
{
  return -[UILabel text](self->_messageLabel, "text");
}

- (void)setColorTheme:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_colorTheme, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backgroundColor"));
  if (v5)
  {
    -[MTNoContentTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[MTNoContentTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](UIColor, "secondaryTextColorForTheme:", v9));
  -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColorForTheme:](UIColor, "separatorColorForTheme:", v9));
  -[UIView setBackgroundColor:](self->super._separator, "setBackgroundColor:", v8);

}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (UIEdgeInsets)_layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__layoutMargins.top;
  left = self->__layoutMargins.left;
  bottom = self->__layoutMargins.bottom;
  right = self->__layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)set_layoutMargins:(UIEdgeInsets)a3
{
  self->__layoutMargins = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorTheme, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
}

@end
