@implementation SiriUIObjectPickerButtonView

- (SiriUIObjectPickerButtonView)initWithFrame:(CGRect)a3
{
  SiriUIObjectPickerButtonView *v3;
  uint64_t v4;
  UIButton *button;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SiriUIObjectPickerButtonView;
  v3 = -[SiriUIObjectPickerButtonView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    v6 = v3->_button;
    -[SiriUIObjectPickerButtonView bounds](v3, "bounds");
    -[UIButton setFrame:](v6, "setFrame:");
    -[UIButton titleLabel](v3->_button, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "siriui_mediumWeightBodySizeFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    v9 = v3->_button;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v9, "setTintColor:", v10);

    v11 = v3->_button;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "siriUILocalizedStringForKey:", CFSTR("CHOOSE_CONTACT_BUTTON_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v11, "setTitle:forState:", v13, 0);

    -[SiriUIObjectPickerButtonView addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUIObjectPickerButtonView;
  -[SiriUIObjectPickerButtonView layoutSubviews](&v3, sel_layoutSubviews);
  -[SiriUIObjectPickerButtonView bounds](self, "bounds");
  -[UIButton setFrame:](self->_button, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "defaultHeight");
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

+ (double)defaultHeight
{
  _BOOL4 v2;
  void *v3;
  double result;

  v2 = SiriUIIsCompactWidth();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");

  result = 50.0;
  if (v2)
    return 44.0;
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
