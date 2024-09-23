@implementation _PKSimpleFieldView

- (_PKSimpleFieldView)initWithField:(id)a3
{
  id v5;
  _PKSimpleFieldView *v6;
  _PKSimpleFieldView *v7;
  id *p_field;
  UILabel *v9;
  UILabel *labelLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  UILabel *valueLabel;
  UILabel *v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_PKSimpleFieldView;
  v6 = -[_PKSimpleFieldView init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    p_field = (id *)&v6->_field;
    objc_storeStrong((id *)&v6->_field, a3);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    labelLabel = v7->_labelLabel;
    v7->_labelLabel = v9;

    -[UILabel setNumberOfLines:](v7->_labelLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v7->_labelLabel, "setLineBreakMode:", 4);
    -[UILabel setAccessibilityIdentifier:](v7->_labelLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CC8]);
    -[UILabel setTextAlignment:](v7->_labelLabel, "setTextAlignment:", objc_msgSend(*p_field, "textAlignment"));
    v11 = v7->_labelLabel;
    objc_msgSend(*p_field, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v11, "setText:", v12);

    -[_PKSimpleFieldView addSubview:](v7, "addSubview:", v7->_labelLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    valueLabel = v7->_valueLabel;
    v7->_valueLabel = v13;

    -[UILabel setNumberOfLines:](v7->_valueLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v7->_valueLabel, "setLineBreakMode:", 4);
    -[UILabel setAccessibilityIdentifier:](v7->_valueLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D681B8]);
    -[UILabel setTextAlignment:](v7->_valueLabel, "setTextAlignment:", objc_msgSend(*p_field, "textAlignment"));
    v15 = v7->_valueLabel;
    objc_msgSend(*p_field, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v15, "setText:", v16);

    -[_PKSimpleFieldView addSubview:](v7, "addSubview:", v7->_valueLabel);
    -[_PKSimpleFieldView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67BE0]);
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKSimpleFieldView frame](self, "frame");
  objc_msgSend(v3, "appendFormat:", CFSTR("frame = (%g %g; %g %g); "), v4, v5, v6, v7);
  -[UILabel text](self->_labelLabel, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    -[_PKSimpleFieldView labelFont](self, "labelFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pointSize");
    v11 = v10;

    if ((unint64_t)objc_msgSend(v8, "length") >= 0x1A)
    {
      v12 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", 0, 25);
      objc_msgSend(v8, "substringWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingString:", CFSTR("..."));
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("<label = '%@'; font-size: %g>; "), v8, v11);
  }
  -[UILabel text](self->_valueLabel, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    -[_PKSimpleFieldView valueFont](self, "valueFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pointSize");
    v19 = v18;

    if ((unint64_t)objc_msgSend(v16, "length") >= 0x1A)
    {
      v20 = objc_msgSend(v16, "rangeOfComposedCharacterSequencesForRange:", 0, 25);
      objc_msgSend(v16, "substringWithRange:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingString:", CFSTR("..."));
      v23 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v23;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("<value = '%@'; font-size: %g>"), v16, v19);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (UIFont)labelFont
{
  return -[UILabel font](self->_labelLabel, "font");
}

- (void)setLabelFont:(id)a3
{
  -[UILabel setFont:](self->_labelLabel, "setFont:", a3);
}

- (UIColor)labelTextColor
{
  return -[UILabel textColor](self->_labelLabel, "textColor");
}

- (void)setLabelTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_labelLabel, "setTextColor:", a3);
}

- (NSString)labelBlendMode
{
  void *v2;
  void *v3;

  -[UILabel layer](self->_labelLabel, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositingFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLabelBlendMode:(id)a3
{
  UILabel *labelLabel;
  id v5;
  void *v6;

  labelLabel = self->_labelLabel;
  v5 = a3;
  -[UILabel layer](labelLabel, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v5);

  -[_PKSimpleFieldView _evaluateVibrancyEnablement](self, "_evaluateVibrancyEnablement");
}

- (UIFont)valueFont
{
  return -[UILabel font](self->_valueLabel, "font");
}

- (void)setValueFont:(id)a3
{
  -[UILabel setFont:](self->_valueLabel, "setFont:", a3);
}

- (UIColor)valueTextColor
{
  return -[UILabel textColor](self->_valueLabel, "textColor");
}

- (void)setValueTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_valueLabel, "setTextColor:", a3);
}

- (NSString)valueBlendMode
{
  void *v2;
  void *v3;

  -[UILabel layer](self->_valueLabel, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositingFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setValueBlendMode:(id)a3
{
  UILabel *valueLabel;
  id v5;
  void *v6;

  valueLabel = self->_valueLabel;
  v5 = a3;
  -[UILabel layer](valueLabel, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v5);

  -[_PKSimpleFieldView _evaluateVibrancyEnablement](self, "_evaluateVibrancyEnablement");
}

- (void)_evaluateVibrancyEnablement
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  -[_PKSimpleFieldView labelBlendMode](self, "labelBlendMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[_PKSimpleFieldView valueBlendMode](self, "valueBlendMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  -[_PKSimpleFieldView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupBlending:", v4);

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat rect;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)_PKSimpleFieldView;
  -[_PKSimpleFieldView layoutSubviews](&v21, sel_layoutSubviews);
  -[_PKSimpleFieldView bounds](self, "bounds");
  v4 = v3;
  rect = v5;
  v7 = v6;
  v9 = v8;
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v6, v8);
  v11 = fmax(v9, v10);
  PKSizeAlignedInRect();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UILabel setFrame:](self->_labelLabel, "setFrame:");
  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  CGRectGetMaxY(v22);
  v23.origin.x = v4;
  v23.origin.y = rect;
  v23.size.width = v7;
  v23.size.height = v11;
  CGRectGetMaxY(v23);
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v7, v9);
  PKSizeAlignedInRect();
  -[UILabel setFrame:](self->_valueLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", width, height);
  if (v7 > v10)
    v10 = v7;
  v12 = v9 + v11 + self->_verticalPadding;
  result.height = v12;
  result.width = v10;
  return result;
}

- (PKPassField)field
{
  return self->_field;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
