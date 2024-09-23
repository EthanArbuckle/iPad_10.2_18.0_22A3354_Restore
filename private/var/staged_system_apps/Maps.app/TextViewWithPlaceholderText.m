@implementation TextViewWithPlaceholderText

- (TextViewWithPlaceholderText)initWithFrame:(CGRect)a3
{
  TextViewWithPlaceholderText *v3;
  void *v4;
  UILabel *v5;
  UILabel *placeholderLabel;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TextViewWithPlaceholderText;
  v3 = -[TextViewWithPlaceholderText initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TextViewWithPlaceholderText setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    placeholderLabel = v3->_placeholderLabel;
    v3->_placeholderLabel = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText font](v3, "font"));
    -[UILabel setFont:](v3->_placeholderLabel, "setFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UILabel setTextColor:](v3->_placeholderLabel, "setTextColor:", v8);

    -[UILabel setContentMode:](v3->_placeholderLabel, "setContentMode:", 5);
    -[UILabel setNumberOfLines:](v3->_placeholderLabel, "setNumberOfLines:", 0);
    -[TextViewWithPlaceholderText addSubview:](v3, "addSubview:", v3->_placeholderLabel);
    if (-[TextViewWithPlaceholderText _shouldReverseLayoutDirection](v3, "_shouldReverseLayoutDirection"))
      v9 = 2;
    else
      v9 = 0;
    -[TextViewWithPlaceholderText setTextAlignment:](v3, "setTextAlignment:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, "_updatePlaceholderVisibility", UITextViewTextDidChangeNotification, 0);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)TextViewWithPlaceholderText;
  -[TextViewWithPlaceholderText layoutSubviews](&v32, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self, "placeholderLabel"));
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self, "placeholderLabel"));
    -[TextViewWithPlaceholderText bringSubviewToFront:](self, "bringSubviewToFront:", v5);

    -[TextViewWithPlaceholderText textContainerInset](self, "textContainerInset");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText textContainer](self, "textContainer"));
    objc_msgSend(v14, "lineFragmentPadding");
    v16 = v9 + v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText textContainer](self, "textContainer"));
    objc_msgSend(v17, "lineFragmentPadding");
    v19 = v13 + v18;

    -[TextViewWithPlaceholderText bounds](self, "bounds");
    v21 = v16 + v20;
    v23 = v7 + v22;
    v25 = v24 - (v16 + v19);
    v27 = v26 - (v7 + v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self, "placeholderLabel"));
    objc_msgSend(v28, "sizeThatFits:", v25, 0.0);
    v30 = v29;

    if (v27 < v30)
      v30 = v27;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self, "placeholderLabel"));
    objc_msgSend(v31, "setFrame:", v21, v23, v25, v30);

  }
}

- (void)_updatePlaceholderVisibility
{
  void *v3;
  unsigned int v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self, "placeholderLabel"));
  v4 = objc_msgSend(v3, "isHidden");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText text](self, "text"));
  v6 = objc_msgSend(v5, "length") != 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self, "placeholderLabel"));
  objc_msgSend(v7, "setHidden:", v6);

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self, "placeholderLabel"));
    v9 = objc_msgSend(v8, "isHidden");

    if ((v9 & 1) == 0)
      -[TextViewWithPlaceholderText setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TextViewWithPlaceholderText;
  -[TextViewWithPlaceholderText setText:](&v4, "setText:", a3);
  -[TextViewWithPlaceholderText _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
}

@end
