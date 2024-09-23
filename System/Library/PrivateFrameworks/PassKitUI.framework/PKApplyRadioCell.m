@implementation PKApplyRadioCell

- (PKApplyRadioCell)initWithFrame:(CGRect)a3
{
  PKApplyRadioCell *v3;
  PKApplyRadioCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIButton *button;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PKApplyRadioCell;
  v3 = -[PKApplyRadioCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKApplyRadioCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v8 = v4->_titleLabel;
    v9 = (NSString *)*MEMORY[0x1E0DC4A88];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v10);

    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    objc_initWeak(&location, v4);
    v11 = (void *)MEMORY[0x1E0DC3428];
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __34__PKApplyRadioCell_initWithFrame___block_invoke;
    v26 = &unk_1E3E62BD0;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v11, "actionWithHandler:", &v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration", v23, v24, v25, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v14);

    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackground:", v15);
    objc_msgSend(v13, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
    v16 = (void *)MEMORY[0x1E0DC3888];
    PKFontForDefaultDesign(v9, 0, *MEMORY[0x1E0DC1440]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithFont:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setPreferredSymbolConfigurationForImage:", v18);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v13, v12);
    v19 = objc_claimAutoreleasedReturnValue();
    button = v4->_button;
    v4->_button = (UIButton *)v19;

    -[UIButton setAccessibilityIdentifier:](v4->_button, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
    objc_msgSend(v5, "addSubview:", v4->_button);
    PKProvisioningSecondaryBackgroundColor();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v21);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __34__PKApplyRadioCell_initWithFrame___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[85] + 16))();
    WeakRetained = v2;
  }

}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *title;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  title = self->_title;
  v9 = (NSString *)v5;
  v7 = title;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    -[PKApplyRadioCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setRadioButtonSelected:(BOOL)a3
{
  const __CFString *v4;
  id v5;

  if (((!self->_radioButtonSelected ^ a3) & 1) == 0)
  {
    self->_radioButtonSelected = a3;
    if (a3)
      v4 = CFSTR("checkmark.circle.fill");
    else
      v4 = CFSTR("circle");
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton pkui_updateConfigurationWithImage:](self->_button, "pkui_updateConfigurationWithImage:", v5);
    -[PKApplyRadioCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKApplyRadioCell;
  -[PKApplyRadioCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKApplyRadioCell bounds](self, "bounds");
  -[PKApplyRadioCell _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKApplyRadioCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRectEdge v12;
  double v13;
  CGFloat v14;
  UIButton *button;
  CGFloat v16;
  double v17;
  UILabel *titleLabel;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = PKTableViewCellTextInset();
  v9 = x + v8;
  v21 = width;
  v22 = height;
  v10 = width - (v8 + v8);
  v11 = height + -24.0;
  if (-[PKApplyRadioCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v12 = CGRectMinXEdge;
  else
    v12 = CGRectMaxXEdge;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v9;
  remainder.origin.y = y + 12.0;
  remainder.size.width = v10;
  remainder.size.height = v11;
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v10, v11);
  if (v13 <= v10)
    v14 = v13;
  else
    v14 = v10;
  v26.origin.x = v9;
  v26.origin.y = y + 12.0;
  v26.size.width = v10;
  v26.size.height = v11;
  CGRectDivide(v26, &slice, &remainder, v14, v12);
  if (!self->_isTemplateLayout)
  {
    button = self->_button;
    PKSizeAlignedInRect();
    -[UIButton setFrame:](button, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 4.0, v12);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v17 = v16;
  CGRectDivide(remainder, &slice, &remainder, v16, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    titleLabel = self->_titleLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](titleLabel, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 12.0, CGRectMinYEdge);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = v21;
  v27.size.height = v22;
  v19 = CGRectGetWidth(v27);
  v20 = v17 + 12.0 + 12.0;
  result.height = v20;
  result.width = v19;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)radioButtonSelected
{
  return self->_radioButtonSelected;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
