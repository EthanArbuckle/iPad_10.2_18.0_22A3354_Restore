@implementation MTContentUnavailableView

+ (id)messageLabelWithFrame:(CGRect)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setOpaque:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v3, "setFont:", v5);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setAlpha:", 0.4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v3, "setTextColor:", v6);

  return v3;
}

- (MTContentUnavailableView)initWithFrame:(CGRect)a3
{
  return -[MTContentUnavailableView initWithFrame:title:](self, "initWithFrame:title:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4
{
  return -[MTContentUnavailableView initWithFrame:title:message:](self, "initWithFrame:title:message:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 message:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  MTContentUnavailableView *v13;
  MTContentUnavailableView *v14;
  id v15;
  UIView *v16;
  UIView *containerView;
  void *v18;
  void *v19;
  objc_super v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MTContentUnavailableView;
  v13 = -[MTContentUnavailableView initWithFrame:](&v21, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[MTContentUnavailableView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
    v15 = objc_alloc((Class)UIView);
    -[MTContentUnavailableView bounds](v14, "bounds");
    v16 = (UIView *)objc_msgSend(v15, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v22), 0.0);
    containerView = v14->_containerView;
    v14->_containerView = v16;

    -[MTContentUnavailableView addSubview:](v14, "addSubview:", v14->_containerView);
    -[MTContentUnavailableView setTitle:](v14, "setTitle:", v11);
    -[MTContentUnavailableView setMessage:](v14, "setMessage:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[MTContentUnavailableView setBackgroundColor:](v14, "setBackgroundColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v14, "_sizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)MTContentUnavailableView;
  -[MTContentUnavailableView dealloc](&v4, "dealloc");
}

- (void)setColorTheme:(id)a3
{
  void *v5;
  UILabel **p_titleLabel;
  void *v7;
  UILabel **p_messageLabel;
  double v9;
  UILabel **v10;
  void *v11;
  void *v12;
  UIButton *button;
  void *v14;
  id v15;

  v15 = a3;
  objc_storeStrong((id *)&self->_colorTheme, a3);
  if (v15)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor primaryTextColorForTheme:](UIColor, "primaryTextColorForTheme:", v15));
    p_titleLabel = &self->_titleLabel;
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](UIColor, "secondaryTextColorForTheme:", v15));
    p_messageLabel = &self->_messageLabel;
    v9 = 1.0;
    v10 = &self->_messageLabel;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v10 = &self->_messageLabel;
    -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v7);
    p_messageLabel = &self->_titleLabel;
    v9 = 0.400000006;
    p_titleLabel = &self->_titleLabel;
  }
  -[UILabel setTextColor:](*p_messageLabel, "setTextColor:", v7);

  -[UILabel setAlpha:](*v10, "setAlpha:", v9);
  -[UILabel setAlpha:](*p_titleLabel, "setAlpha:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "backgroundColor"));
  if (v11)
  {
    -[MTContentUnavailableView setBackgroundColor:](self, "setBackgroundColor:", v11);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[MTContentUnavailableView setBackgroundColor:](self, "setBackgroundColor:", v12);

  }
  button = self->_button;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColorForTheme:](UIColor, "tintColorForTheme:", v15));
  -[UIButton setTitleColor:forState:](button, "setTitleColor:forState:", v14, 0);

}

- (void)setButtonText:(id)a3
{
  UIButton *v5;
  UIButton *button;
  UIButton *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!-[NSString isEqualToString:](self->_buttonText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_buttonText, a3);
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    button = self->_button;
    self->_button = v5;

    -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", v12, 0);
    -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "_buttonClick", 64);
    v7 = self->_button;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](UIColor, "appTintColor"));
    -[UIButton setTitleColor:forState:](v7, "setTitleColor:forState:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
    objc_msgSend(v10, "setFont:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
    objc_msgSend(v11, "setTextAlignment:", 1);

    -[UIButton sizeToFit](self->_button, "sizeToFit");
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_button);
  }

}

- (void)setPlaceholderImage:(id)a3
{
  UIImageView *v5;
  UIImageView *imageView;
  id v7;

  v7 = a3;
  if ((-[UIImage isEqual:](self->_placeholderImage, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    v5 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    imageView = self->_imageView;
    self->_imageView = v5;

    -[UIView addSubview:](self->_containerView, "addSubview:", self->_imageView);
  }
  -[MTContentUnavailableView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  NSString *v6;
  id v7;
  UILabel *v8;
  UILabel *titleLabel;
  void *v10;
  void *v11;
  void *v12;
  CGRect v13;

  if (self->_title != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    title = self->_title;
    self->_title = v4;

    v6 = self->_title;
    if (v6)
    {
      if (!self->_titleLabel)
      {
        v7 = objc_alloc((Class)UILabel);
        -[UIView bounds](self->_containerView, "bounds");
        v8 = (UILabel *)objc_msgSend(v7, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v13), 20.0);
        titleLabel = self->_titleLabel;
        self->_titleLabel = v8;

        -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v10);

        -[UILabel setOpaque:](self->_titleLabel, "setOpaque:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleHeadline));
        -[UILabel setFont:](self->_titleLabel, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v12);

        -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 0.4);
        -[UIView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
        v6 = self->_title;
      }
    }
    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    -[MTContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMessage:(id)a3
{
  NSString *v4;
  NSString *message;
  NSString *v6;
  void *v7;
  id v8;
  UILabel *v9;
  UILabel *messageLabel;
  CGRect v11;

  if (self->_message != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    message = self->_message;
    self->_message = v4;

    v6 = self->_message;
    if (v6)
    {
      if (!self->_messageLabel)
      {
        v7 = (void *)objc_opt_class(self);
        -[UIView bounds](self->_containerView, "bounds");
        v8 = objc_msgSend(v7, "messageLabelWithFrame:", 0.0, 0.0, CGRectGetWidth(v11), 20.0);
        v9 = (UILabel *)objc_claimAutoreleasedReturnValue(v8);
        messageLabel = self->_messageLabel;
        self->_messageLabel = v9;

        -[UIView addSubview:](self->_containerView, "addSubview:", self->_messageLabel);
        v6 = self->_message;
      }
    }
    -[UILabel setText:](self->_messageLabel, "setText:", v6);
    -[MTContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
  }
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
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double y;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  id v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  id v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGFloat MaxY;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  UIButton *button;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double Width;
  double v96;
  double v97;
  double v98;
  objc_super v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  v99.receiver = self;
  v99.super_class = (Class)MTContentUnavailableView;
  -[MTContentUnavailableView layoutSubviews](&v99, "layoutSubviews");
  -[MTContentUnavailableView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView frame](self->_containerView, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v100.origin.x = v4;
  v100.origin.y = v6;
  v100.size.width = v8;
  v100.size.height = v10;
  v93 = v6;
  v94 = v4;
  v91 = v10;
  v92 = v8;
  if (CGRectGetWidth(v100) >= 478.0)
  {
    v19 = IMRectCenteredXInRectScale(v17, v12, v14, 418.0, v16, v4, v6, v8, v10, 0.0);
    v14 = v20;
    v18 = v21;
    v16 = v22;
  }
  else
  {
    v101.origin.x = v4;
    v101.origin.y = v6;
    v101.size.width = v8;
    v101.size.height = v10;
    v18 = CGRectGetWidth(v101) + -30.0;
    v19 = 15.0;
  }
  y = CGPointZero.y;
  v89 = v19;
  v24 = v14;
  v25 = v18;
  v26 = v16;
  Width = CGRectGetWidth(*(CGRect *)&v19);
  v27 = -[UIImageView frame](self->_imageView, "frame");
  v97 = y;
  v98 = v18;
  v32 = IMRectCenteredXInRectScale(v27, v28, v29, v30, v31, CGPointZero.x, y, v18, v16, 0.0);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[UILabel frame](self->_titleLabel, "frame");
  v40 = v39;
  v41 = 0.0;
  if (self->_imageView)
  {
    v102.origin.x = v32;
    v102.origin.y = v34;
    v102.size.width = v36;
    v102.size.height = v38;
    v41 = CGRectGetMaxY(v102) + 40.0;
  }
  v90 = v14;
  v42 = -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", Width, 1.79769313e308);
  v43 = v16;
  v46 = IMRectCenteredXInRectScale(v42, v40, v41, v44, v45, CGPointZero.x, v97, v98, v16, 0.0);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  -[UILabel frame](self->_messageLabel, "frame");
  v54 = v53;
  v55 = 0.0;
  if (self->_title)
  {
    v103.origin.x = v46;
    v103.origin.y = v48;
    v103.size.width = v50;
    v103.size.height = v52;
    v55 = CGRectGetMaxY(v103) + 20.0;
  }
  v56 = -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", Width, 1.79769313e308);
  v88 = v43;
  v59 = IMRectCenteredXInRectScale(v56, v54, v55, v57, v58, CGPointZero.x, v97, v98, v43, 0.0);
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v66 = v59;
  v96 = v59;
  -[UILabel setFrame:](self->_messageLabel, "setFrame:");
  -[UIButton frame](self->_button, "frame");
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v104.origin.x = v66;
  v104.origin.y = v61;
  v104.size.width = v63;
  v104.size.height = v65;
  MaxY = CGRectGetMaxY(v104);
  v75 = IMRectCenteredXInRectScale(v74, v68, MaxY + 30.0, v70, v72, CGPointZero.x, v97, v98, v88, 0.0);
  v77 = v76;
  v79 = v78;
  v81 = v80;
  -[UIButton setFrame:](self->_button, "setFrame:");
  button = self->_button;
  v83 = v96;
  if (button)
  {
    v83 = v75;
    v84 = v77;
  }
  else
  {
    v84 = v61;
  }
  if (button)
    v85 = v79;
  else
    v85 = v63;
  if (button)
    v86 = v81;
  else
    v86 = v65;
  v87 = CGRectGetMaxY(*(CGRect *)&v83);
  -[UIView setFrame:](self->_containerView, "setFrame:", IMRectCenteredYInRectScale(v89, v90, v98, v87, v94, v93, v92, v91, 0.0));
}

- (void)_buttonClick
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTContentUnavailableView buttonCallback](self, "buttonCallback"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTContentUnavailableView buttonCallback](self, "buttonCallback"));
    v4[2]();

  }
}

- (void)_sizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleHeadline));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  objc_msgSend(v6, "setFont:", v5);

  -[UIButton sizeToFit](self->_button, "sizeToFit");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_messageLabel, "setFont:", v7);

  -[MTContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (id)buttonCallback
{
  return self->_buttonCallback;
}

- (void)setButtonCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorTheme, 0);
  objc_storeStrong(&self->_buttonCallback, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
