@implementation _UIAccessDeniedView

- (_UIAccessDeniedView)initWithFrame:(CGRect)a3
{
  _UIAccessDeniedView *v3;
  void *v4;
  uint64_t v5;
  NSString *title;
  uint64_t v7;
  NSString *message;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIAccessDeniedView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    _UINSLocalizedStringWithDefaultValue(CFSTR("This app does not have access to your photos or videos."), CFSTR("This app does not have access to your photos or videos."));
    v5 = objc_claimAutoreleasedReturnValue();
    title = v3->_title;
    v3->_title = (NSString *)v5;

    _UINSLocalizedStringWithDefaultValue(CFSTR("You can enable access in Privacy Settings."), CFSTR("You can enable access in Privacy Settings."));
    v7 = objc_claimAutoreleasedReturnValue();
    message = v3->_message;
    v3->_message = (NSString *)v7;

  }
  return v3;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    title = self->_title;
    self->_title = v4;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMessage:(id)a3
{
  NSString *v4;
  NSString *message;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    message = self->_message;
    self->_message = v4;

    -[UILabel setText:](self->_messageLabel, "setText:", self->_message);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)_textColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5, 0.533, 0.584, 1.0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UILabel *v10;
  UILabel *titleLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  UILabel *messageLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UIImageView *lockView;
  void *v27;
  UIImageView *v28;
  UIImageView *v29;
  double width;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double x;
  double height;
  double v44;
  objc_super v45;
  CGRect v46;
  CGRect v47;

  v45.receiver = self;
  v45.super_class = (Class)_UIAccessDeniedView;
  -[UIView layoutSubviews](&v45, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v44 = v9;
  if (!self->_titleLabel)
  {
    v10 = objc_alloc_init(UILabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v10;

    v12 = self->_titleLabel;
    -[_UIAccessDeniedView title](self, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v12, "setText:", v13);

    v14 = self->_titleLabel;
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v15);

    v16 = self->_titleLabel;
    -[_UIAccessDeniedView _textColor](self, "_textColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
    -[UIView addSubview:](self, "addSubview:", self->_titleLabel);
  }
  if (!self->_messageLabel)
  {
    v18 = objc_alloc_init(UILabel);
    messageLabel = self->_messageLabel;
    self->_messageLabel = v18;

    v20 = self->_messageLabel;
    -[_UIAccessDeniedView message](self, "message");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v20, "setText:", v21);

    v22 = self->_messageLabel;
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 15.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v22, "setFont:", v23);

    v24 = self->_messageLabel;
    -[_UIAccessDeniedView _textColor](self, "_textColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v24, "setTextColor:", v25);

    -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_messageLabel, "setLineBreakMode:", 4);
    -[UIView addSubview:](self, "addSubview:", self->_messageLabel);
  }
  lockView = self->_lockView;
  if (!lockView)
  {
    _UIImageWithName(CFSTR("UIAccessDeniedViewLock.png"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v27);
    v29 = self->_lockView;
    self->_lockView = v28;

    -[UIView addSubview:](self, "addSubview:", self->_lockView);
    lockView = self->_lockView;
  }
  -[UIView frame](lockView, "frame");
  width = v46.size.width;
  v46.origin.x = round((v8 - v46.size.width) * 0.5);
  x = v46.origin.x;
  height = v46.size.height;
  v31 = v4 + 12.0;
  v46.origin.y = v6;
  v32 = CGRectGetMaxY(v46) + 18.0;
  v33 = v8 + -24.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v33, 40.0);
  v35 = v34;
  v36 = v32 + v34 + 6.0;
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v33, 40.0);
  v38 = v37;
  v47.origin.x = v31;
  v47.origin.y = v36;
  v47.size.width = v33;
  v47.size.height = v38;
  v39 = round((v44 - CGRectGetMaxY(v47)) * 0.5);
  v40 = v32 + v39;
  v41 = v36 + v39;
  -[UIImageView setFrame:](self->_lockView, "setFrame:", x, v6 + v39, width, height);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v31, v40, v33, v35);
  -[UILabel setFrame:](self->_messageLabel, "setFrame:", v31, v41, v33, v38);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
}

@end
