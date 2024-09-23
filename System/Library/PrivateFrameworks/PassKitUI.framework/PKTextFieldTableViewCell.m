@implementation PKTextFieldTableViewCell

- (PKTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKTextFieldTableViewCell *v4;
  id v5;
  uint64_t v6;
  UITextField *textField;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKTextFieldTableViewCell;
  v4 = -[PKTextFieldTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 1, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3DB8]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textField = v4->_textField;
    v4->_textField = (UITextField *)v6;

    -[UITextField setAdjustsFontSizeToFitWidth:](v4->_textField, "setAdjustsFontSizeToFitWidth:", 1);
    -[PKTextFieldTableViewCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_textField);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKTextFieldTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKTextFieldTableViewCell;
  -[PKTextFieldTableViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PKTextFieldTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKTextFieldTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:", v5, v7, v9, v11);
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRectEdge v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  CGRect slice;
  CGRect remainder;
  CGSize result;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PKTextFieldTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v8 = CGRectMaxXEdge;
  else
    v8 = CGRectMinXEdge;
  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins");
  v10 = v9;
  v12 = v11;
  v14 = x + v13;
  remainder.origin.x = x + v13;
  remainder.origin.y = y + v9;
  remainder.size.width = width - (v13 + v15);
  remainder.size.height = height - (v9 + v11);
  memset(&slice, 0, sizeof(slice));
  -[PKTextFieldTableViewCell textLabel](self, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  v18 = v17;
  v25 = v19;
  v30.origin.x = v14;
  v30.origin.y = remainder.origin.y;
  v30.size.width = remainder.size.width;
  v30.size.height = remainder.size.height;
  CGRectDivide(v30, &slice, &remainder, v18, v8);
  if (!self->_isTemplateLayout)
    objc_msgSend(v16, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  if (v18 > 0.0)
    CGRectDivide(remainder, &slice, &remainder, 8.0, v8);
  -[UITextField sizeThatFits:](self->_textField, "sizeThatFits:", remainder.size.width, remainder.size.height, v25);
  v21 = v20;
  if (!self->_isTemplateLayout)
    -[UITextField setFrame:](self->_textField, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  v31.origin.y = y;
  v31.origin.x = x;
  v31.size.width = width;
  v31.size.height = height;
  v22 = CGRectGetWidth(v31);

  v23 = v22;
  v24 = v12 + v10 + fmax(v26, v21);
  result.height = v24;
  result.width = v23;
  return result;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
