@implementation SKUIComposeTextField

- (SKUIComposeTextField)initWithConfiguration:(id)a3 style:(int64_t)a4
{
  id v7;
  double v8;
  SKUIComposeTextField *v9;
  SKUIComposeTextField *v10;
  id *p_configuration;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *label;
  UILabel *v16;
  void *v17;
  UITextField *v18;
  UITextField *textField;
  UITextField *v20;
  void *v21;
  UITextField *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 44.0);
  v27.receiver = self;
  v27.super_class = (Class)SKUIComposeTextField;
  v9 = -[SKUIComposeTextField initWithFrame:](&v27, sel_initWithFrame_, 0.0, 0.0, 0.0, v8);
  v10 = v9;
  if (v9)
  {
    p_configuration = (id *)&v9->_configuration;
    objc_storeStrong((id *)&v9->_configuration, a3);
    v10->_style = a4;
    objc_msgSend((id)objc_opt_class(), "labelFontForStyle:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_configuration, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      label = v10->_label;
      v10->_label = v14;

      -[UILabel setFont:](v10->_label, "setFont:", v12);
      -[UILabel setText:](v10->_label, "setText:", v13);
      v16 = v10->_label;
      objc_msgSend((id)objc_opt_class(), "labelColorForStyle:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v16, "setTextColor:", v17);

      -[UILabel sizeToFit](v10->_label, "sizeToFit");
      -[UILabel setHoverStyle:](v10->_label, "setHoverStyle:", 0);
      -[SKUIComposeTextField addSubview:](v10, "addSubview:", v10->_label);
    }
    v18 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    textField = v10->_textField;
    v10->_textField = v18;

    -[UITextField addTarget:action:forControlEvents:](v10->_textField, "addTarget:action:forControlEvents:", v10, sel__textChanged_, 0x20000);
    -[UITextField setAutocapitalizationType:](v10->_textField, "setAutocapitalizationType:", 2);
    -[UITextField setAutocorrectionType:](v10->_textField, "setAutocorrectionType:", 0);
    -[UITextField setDelegate:](v10->_textField, "setDelegate:", v10);
    v20 = v10->_textField;
    objc_msgSend((id)objc_opt_class(), "labelFontForStyle:", v10->_style);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v20, "setFont:", v21);

    -[UITextField setKeyboardType:](v10->_textField, "setKeyboardType:", 0);
    v22 = v10->_textField;
    objc_msgSend(v7, "placeholder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setPlaceholder:](v22, "setPlaceholder:", v23);

    -[UITextField setClipsToBounds:](v10->_textField, "setClipsToBounds:", 0);
    objc_msgSend(*p_configuration, "value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIComposeTextField setText:](v10, "setText:", v24);

    -[SKUIComposeTextField addSubview:](v10, "addSubview:", v10->_textField);
    -[UITextField sizeToFit](v10->_textField, "sizeToFit");
    -[UITextField setHoverStyle:](v10->_textField, "setHoverStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIComposeTextField setBackgroundColor:](v10, "setBackgroundColor:", v25);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextField removeTarget:action:forControlEvents:](self->_textField, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKUIComposeTextField;
  -[SKUIComposeTextField dealloc](&v3, sel_dealloc);
}

+ (id)labelFontForStyle:(int64_t)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", a3, 17.0);
  return (id)objc_msgSend(v3, "systemFontOfSize:");
}

+ (id)labelColorForStyle:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor", a3);
}

- (SKUIComposeTextFieldConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isValid
{
  return self->_currentTextLength > 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NSString)text
{
  return -[UITextField text](self->_textField, "text");
}

- (void)setText:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v4 = objc_msgSend(v7, "length");
  if (v4 <= -[SKUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength"))
  {
    v6 = v7;
  }
  else
  {
    objc_msgSend(v7, "substringToIndex:", -[SKUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength"));
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  v8 = v6;
  -[UITextField setText:](self->_textField, "setText:", v6);
  self->_currentTextLength = objc_msgSend(v8, "length");

}

- (void)drawRect:(CGRect)a3
{
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
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;

  v4 = 0.0;
  if (!-[SKUIComposeTextFieldConfiguration columnIndex](self->_configuration, "columnIndex", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 15.0);
    v4 = v5;
  }
  -[SKUIComposeTextFieldConfiguration borderInsets](self->_configuration, "borderInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SKUIComposeTextField bounds](self, "bounds");
  v46 = v14;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "colorWithAlphaComponent:", 0.2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "set");

  v23 = -[SKUIComposeTextField effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v24 = v23;
  if (v7 > 0.0)
  {
    v25 = v18 - v4;
    v26 = 0;
    v27 = v4;
    if (v23 == 1)
    {
      v27 = CGRectWithFlippedOriginRelativeToBoundingRect(v4, 0.0, v25, v7, v46, v16, v18, v20);
      v7 = v28;
    }
    v29 = v7;
    UIRectFillUsingBlendMode(*(CGRect *)&v27, kCGBlendModeNormal);
  }
  if (v11 > 0.0)
  {
    v30 = v18 - v4;
    v31 = v20 - v11;
    if (v24 == 1)
    {
      v4 = CGRectWithFlippedOriginRelativeToBoundingRect(v4, v31, v30, v11, v46, v16, v18, v20);
      v11 = v32;
    }
    v33 = v4;
    v34 = v11;
    UIRectFillUsingBlendMode(*(CGRect *)(&v31 - 1), kCGBlendModeNormal);
  }
  if (v9 > 0.0)
  {
    v35 = 0;
    if (v24 == 1)
    {
      v36 = CGRectWithFlippedOriginRelativeToBoundingRect(0.0, 0.0, v9, v20, v46, v16, v18, v20);
      v9 = v38;
    }
    else
    {
      v37 = v20;
      v36 = 0.0;
    }
    v39 = v9;
    UIRectFillUsingBlendMode(*(CGRect *)(&v35 - 1), kCGBlendModeNormal);
  }
  if (v13 > 0.0)
  {
    v40 = v18 - v13;
    v41 = 0;
    if (v24 == 1)
    {
      v40 = CGRectWithFlippedOriginRelativeToBoundingRect(v40, 0.0, v13, v20, v46, v16, v18, v20);
      v13 = v42;
      v20 = v43;
    }
    v44 = v13;
    v45 = v20;
    UIRectFillUsingBlendMode(*(CGRect *)&v40, kCGBlendModeNormal);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UITextField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIComposeTextField;
  -[SKUIComposeTextField hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UITextField *)objc_claimAutoreleasedReturnValue();
  if (v5 == (UITextField *)self)
  {
    v5 = self->_textField;

  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  UILabel *label;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MaxX;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGRect v36;

  -[SKUIComposeTextField bounds](self, "bounds");
  v34 = v4;
  v35 = v3;
  v6 = v5;
  v8 = v7;
  v9 = -[SKUIComposeTextField effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 15.0);
  label = self->_label;
  if (label)
  {
    -[UILabel frame](label, "frame");
    v13 = v12;
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 15.0);
    v17 = v16;
    *(float *)&v16 = (v8 - v15) * 0.5;
    v18 = floorf(*(float *)&v16);
    v36.origin.x = v17;
    v36.origin.y = v18;
    v36.size.width = v13;
    v36.size.height = v15;
    MaxX = CGRectGetMaxX(v36);
    objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 4.0);
    v21 = v20;
    if (v9 == 1)
    {
      v17 = CGRectWithFlippedOriginRelativeToBoundingRect(v17, v18, v13, v15, v35, v34, v6, v8);
      v18 = v22;
      v13 = v23;
      v15 = v24;
    }
    v25 = MaxX + v21;
    -[UILabel setFrame:](self->_label, "setFrame:", v17, v18, v13, v15);
  }
  else
  {
    v25 = v10;
  }
  -[UITextField frame](self->_textField, "frame");
  v27 = v26;
  v28 = (v8 - v26) * 0.5;
  v29 = floorf(v28);
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 15.0);
  v31 = v6 - v30 - v25;
  if (v9 == 1)
  {
    v25 = CGRectWithFlippedOriginRelativeToBoundingRect(v25, v29, v31, v27, v35, v34, v6, v8);
    v29 = v32;
    v27 = v33;
  }
  -[UITextField setFrame:](self->_textField, "setFrame:", v25, v29, v31, v27);
}

- (BOOL)textField:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  int64_t currentTextLength;
  int64_t v10;
  uint64_t v11;
  BOOL v12;

  length = a5.length;
  location = a5.location;
  v8 = a4;
  if (self->_currentTextLength <= location + length)
    currentTextLength = location + length;
  else
    currentTextLength = self->_currentTextLength;
  if (-[SKUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength"))
    v10 = -[SKUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength");
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = objc_msgSend(v8, "length") - length + currentTextLength;
  if (v11 <= v10)
    self->_currentTextLength = v11 & ~(v11 >> 63);
  v12 = v11 <= v10;

  return v12;
}

- (void)_textChanged:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "composeTextFieldValidityChanged:", self);

}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
