@implementation SURedeemCodeTextField

- (SURedeemCodeTextField)initWithHeight:(double)a3
{
  SURedeemCodeTextField *v4;
  SURedeemCodeTextField *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SURedeemCodeTextField;
  v4 = -[SURedeemCodeTextField init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_height = a3;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURedeemCodeTextField setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[SURedeemCodeTextField _setupSubviews](v5, "_setupSubviews");
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SURedeemCodeTextField textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (void)setPlaceholder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDF6A70];
  v5 = a3;
  objc_msgSend(v4, "systemFontOfSize:", 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDF65F8];
  v15[0] = v6;
  v8 = *MEMORY[0x24BDF6600];
  v14[0] = v7;
  v14[1] = v8;
  -[SURedeemCodeTextField tintColor](self, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.7, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v11);
  -[SURedeemCodeTextField textField](self, "textField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttributedPlaceholder:", v12);

}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SURedeemCodeTextField textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (UITextFieldDelegate)delegate
{
  void *v2;
  void *v3;

  -[SURedeemCodeTextField textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextFieldDelegate *)v3;
}

- (NSString)placeholder
{
  void *v2;
  void *v3;

  -[SURedeemCodeTextField textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[SURedeemCodeTextField textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setupSubviews
{
  -[SURedeemCodeTextField _setupVisualEffectView](self, "_setupVisualEffectView");
  -[SURedeemCodeTextField _setupTextField](self, "_setupTextField");
}

- (void)_setupVisualEffectView
{
  UIVisualEffectView *v3;
  UIVisualEffectView *visualEffectView;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 10);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v5);
  -[SURedeemCodeTextField addSubview:](self, "addSubview:", v3);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v3;

}

- (void)_setupTextField
{
  UITextField *v3;
  void *v4;
  UITextField *textField;
  id v6;

  v3 = (UITextField *)objc_alloc_init(MEMORY[0x24BDF6EA8]);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[UITextField setAutocorrectionType:](v3, "setAutocorrectionType:", 1);
  -[UITextField setAutocapitalizationType:](v3, "setAutocapitalizationType:", 3);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 16.0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](v3, "setFont:", v6);
  -[SURedeemCodeTextField addSubview:](self, "addSubview:", v3);
  textField = self->_textField;
  self->_textField = v3;

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
  void *v15;
  void *v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SURedeemCodeTextField;
  -[SURedeemCodeTextField layoutSubviews](&v18, sel_layoutSubviews);
  -[SURedeemCodeTextField bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SURedeemCodeTextField safeAreaInsets](self, "safeAreaInsets");
  v12 = v11;
  -[SURedeemCodeTextField safeAreaInsets](self, "safeAreaInsets");
  v14 = v13;
  -[SURedeemCodeTextField visualEffectView](self, "visualEffectView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

  -[SURedeemCodeTextField textField](self, "textField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURedeemCodeTextField height](self, "height");
  objc_msgSend(v16, "setFrame:", v12 + 16.0, v6, v8 - (v12 + 32.0 + v14), v17);

}

- (double)height
{
  return self->_height;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
