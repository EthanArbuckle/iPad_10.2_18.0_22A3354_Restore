@implementation MTCountInfoButton

- (MTCountInfoButton)initWithFrame:(CGRect)a3
{
  MTCountInfoButton *v3;
  MTCountInfoButton *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTCountInfoButton;
  v3 = -[MTCountInfoButton initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton button](v3, "button"));
    -[MTCountInfoButton addSubview:](v4, "addSubview:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](v4, "label"));
    -[MTCountInfoButton addSubview:](v4, "addSubview:", v6);

  }
  return v4;
}

- (void)setIndex:(unint64_t)a3 forCount:(unint64_t)a4
{
  unint64_t *p_count;

  if (self->_index != a3)
  {
    self->_index = a3;
    p_count = &self->_count;
    if (self->_count == a4)
    {
_objc_msgSend$_updateLabelText:
      -[MTCountInfoButton _updateLabelText](self, "_updateLabelText");
      return;
    }
LABEL_5:
    *p_count = a4;
    goto _objc_msgSend$_updateLabelText;
  }
  p_count = &self->_count;
  if (self->_count != a4)
    goto LABEL_5;
}

- (void)setIndex:(unint64_t)a3
{
  if (self->_index != a3)
  {
    self->_index = a3;
    -[MTCountInfoButton _updateLabelText](self, "_updateLabelText");
  }
}

- (void)setCount:(unint64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    -[MTCountInfoButton _updateLabelText](self, "_updateLabelText");
  }
}

- (UIFont)font
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  objc_msgSend(v6, "sizeToFit");

  -[MTCountInfoButton setNeedsLayout](self, "setNeedsLayout");
}

- (UIColor)textColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textColor"));

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)_updateLabelText
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton _createLabelTextForCurrentState](self, "_createLabelTextForCurrentState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  objc_msgSend(v4, "setText:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  objc_msgSend(v5, "sizeToFit");

  -[MTCountInfoButton setNeedsLayout](self, "setNeedsLayout");
}

- (id)_createLabelTextForCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (-[MTCountInfoButton index](self, "index") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@ of %@"), &stru_1004C6D40, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)-[MTCountInfoButton index](self, "index") + 1));
    v7 = IMAccessibilityLocalizedNumber();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = -[MTCountInfoButton count](self, "count");
    if (v9 <= 1)
      v10 = 1;
    else
      v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    v12 = IMAccessibilityLocalizedNumber();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v8, v13));

  }
  return v3;
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
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  void *v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)MTCountInfoButton;
  -[MTCountInfoButton layoutSubviews](&v18, "layoutSubviews");
  -[MTCountInfoButton bounds](self, "bounds");
  v4 = v3;
  -[MTCountInfoButton buttonSize](self, "buttonSize");
  v6 = v5;
  v8 = v7;
  v9 = IMRoundToPixel((v4 - v5) * 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton button](self, "button"));
  objc_msgSend(v10, "setFrame:", v9, 0.0, v6, v8);

  -[MTCountInfoButton labelSize](self, "labelSize");
  v12 = v11;
  v14 = v13;
  v15 = IMRoundToPixel((v4 - v11) * 0.5);
  v19.origin.y = 0.0;
  v19.origin.x = v9;
  v19.size.width = v6;
  v19.size.height = v8;
  v16 = CGRectGetMaxY(v19) + 5.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  objc_msgSend(v17, "setFrame:", v15, v16, v12, v14);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[MTCountInfoButton buttonSize](self, "buttonSize", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[MTCountInfoButton labelSize](self, "labelSize");
  if (v5 >= v8)
    v8 = v5;
  v10 = v7 + 5.0 + v9;
  result.height = v10;
  result.width = v8;
  return result;
}

- (CGSize)buttonSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton button](self, "button"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)labelSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton label](self, "label"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)buttonTapped:(id)a3
{
  -[MTCountInfoButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (MTTouchInsetsButton)button
{
  MTTouchInsetsButton *button;
  MTTouchInsetsButton *v4;
  MTTouchInsetsButton *v5;
  MTTouchInsetsButton *v6;
  void *v7;

  button = self->_button;
  if (!button)
  {
    v4 = (MTTouchInsetsButton *)objc_claimAutoreleasedReturnValue(+[MTTouchInsetsButton buttonWithType:](MTTouchInsetsButton, "buttonWithType:", 1));
    v5 = self->_button;
    self->_button = v4;

    v6 = self->_button;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage infoIcon](UIImage, "infoIcon"));
    -[MTTouchInsetsButton setImage:forState:](v6, "setImage:forState:", v7, 0);

    -[MTTouchInsetsButton setTouchInsets:](self->_button, "setTouchInsets:", -15.0, -8.0, -15.0, -15.0);
    -[MTTouchInsetsButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "buttonTapped:", 64);
    -[MTTouchInsetsButton sizeToFit](self->_button, "sizeToFit");
    button = self->_button;
  }
  return button;
}

- (UILabel)label
{
  UILabel *label;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;

  label = self->_label;
  if (!label)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    v5 = self->_label;
    self->_label = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton font](self, "font"));
    -[UILabel setFont:](self->_label, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCountInfoButton textColor](self, "textColor"));
    -[UILabel setTextColor:](self->_label, "setTextColor:", v7);

    label = self->_label;
  }
  return label;
}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
