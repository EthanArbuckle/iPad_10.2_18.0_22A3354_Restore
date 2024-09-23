@implementation PKDateSelectorCollectionViewCell

- (PKDateSelectorCollectionViewCell)init
{
  return -[PKDateSelectorCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKDateSelectorCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKDateSelectorCollectionViewCell *v3;
  UIDatePicker *v4;
  UIDatePicker *datePicker;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDateSelectorCollectionViewCell;
  v3 = -[PKDateSelectorCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0DC36F0]);
    datePicker = v3->_datePicker;
    v3->_datePicker = v4;

    -[UIDatePicker setDatePickerMode:](v3->_datePicker, "setDatePickerMode:", 1);
    -[UIDatePicker setPreferredDatePickerStyle:](v3->_datePicker, "setPreferredDatePickerStyle:", 3);
    -[UIDatePicker addTarget:action:forControlEvents:](v3->_datePicker, "addTarget:action:forControlEvents:", v3, sel__didUpdateDate_, 4096);
    -[PKDateSelectorCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_datePicker);

  }
  return v3;
}

- (void)setDate:(id)a3
{
  NSDate **p_date;
  id v6;

  p_date = &self->_date;
  objc_storeStrong((id *)&self->_date, a3);
  v6 = a3;
  -[UIDatePicker setDate:](self->_datePicker, "setDate:", *p_date);

}

- (void)_didUpdateDate:(id)a3
{
  NSDate *v4;
  NSDate *date;
  id WeakRetained;

  objc_msgSend(a3, "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dateSelectorCollectionViewCell:didUpdateDate:", self, self->_date);

}

- (NSDate)minimumDate
{
  return -[UIDatePicker minimumDate](self->_datePicker, "minimumDate");
}

- (void)setMinimumDate:(id)a3
{
  -[UIDatePicker setMinimumDate:](self->_datePicker, "setMinimumDate:", a3);
}

- (NSDate)maximumDate
{
  return -[UIDatePicker maximumDate](self->_datePicker, "maximumDate");
}

- (void)setMaximumDate:(id)a3
{
  -[UIDatePicker setMaximumDate:](self->_datePicker, "setMaximumDate:", a3);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDateSelectorCollectionViewCell;
  v4 = a3;
  -[PKDateSelectorCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[PKDateSelectorCollectionViewCell contentView](self, "contentView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[UIDatePicker setBackgroundColor:](self->_datePicker, "setBackgroundColor:", v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKDateSelectorCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDateSelectorCollectionViewCell;
  -[PKDateSelectorCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKDateSelectorCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKDateSelectorCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.size.width;
  -[UIDatePicker sizeThatFits:](self->_datePicker, "sizeThatFits:", a3.size.width, 1.79769313e308);
  v8 = v7;
  if (!a4)
  {
    PKSizeAlignedInRect();
    -[UIDatePicker setFrame:](self->_datePicker, "setFrame:");
  }
  v9 = width;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKDateSelectorCollectionViewCell;
  -[PKDateSelectorCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v17, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  -[PKDateSelectorCollectionViewCell sizeThatFits:](self, "sizeThatFits:", v9, v10);
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v15, "setFrame:", v6, v8, v12, v14);

  return v15;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSDate)date
{
  return self->_date;
}

- (PKDateSelectorCollectionViewCellDelegate)delegate
{
  return (PKDateSelectorCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- ($85CD2974BE96D4886BB301820D1C36C2)contentAlignment
{
  return ($85CD2974BE96D4886BB301820D1C36C2)self->_contentAlignment;
}

- (void)setContentAlignment:(id)a3
{
  self->_contentAlignment = ($D338B265850D33B29D0E4C40C8D279D7)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
