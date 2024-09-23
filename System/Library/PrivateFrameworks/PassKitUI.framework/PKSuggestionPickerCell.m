@implementation PKSuggestionPickerCell

- (PKSuggestionPickerCell)initWithFrame:(CGRect)a3
{
  PKSuggestionPickerCell *v3;
  UIPickerView *v4;
  UIPickerView *pickerView;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKSuggestionPickerCell;
  v3 = -[PKSuggestionPickerCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
    pickerView = v3->_pickerView;
    v3->_pickerView = v4;

    -[UIPickerView setDelegate:](v3->_pickerView, "setDelegate:", v3);
    -[UIPickerView setDataSource:](v3->_pickerView, "setDataSource:", v3);
    v6 = *MEMORY[0x1E0D680D8];
    -[UIPickerView setAccessibilityIdentifier:](v3->_pickerView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680D8]);
    -[PKSuggestionPickerCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_pickerView);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    -[PKSuggestionPickerCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v6);
  }
  return v3;
}

- (void)setValues:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_values, a3);
  v5 = a3;
  -[UIPickerView reloadAllComponents](self->_pickerView, "reloadAllComponents");

}

- (void)updateSelectedValue:(id)a3
{
  NSUInteger v4;

  v4 = -[NSArray indexOfObject:](self->_values, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[UIPickerView selectRow:inComponent:animated:](self->_pickerView, "selectRow:inComponent:animated:", v4, 0, 1);
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
  v12.super_class = (Class)PKSuggestionPickerCell;
  -[PKSuggestionPickerCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PKSuggestionPickerCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6 + 11.0;
  v9 = v8 + 0.0;
  v11 = v10 + -22.0;

  -[UIPickerView setFrame:](self->_pickerView, "setFrame:", v7, v9, v11, v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIPickerView sizeThatFits:](self->_pickerView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSArray count](self->_values, "count", a3, a4);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void (**selectionChanged)(id, int64_t);

  selectionChanged = (void (**)(id, int64_t))self->_selectionChanged;
  if (selectionChanged)
    selectionChanged[2](selectionChanged, a4);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[NSArray objectAtIndex:](self->_values, "objectAtIndex:", a4);
}

- (NSArray)values
{
  return self->_values;
}

- (id)selectionChanged
{
  return self->_selectionChanged;
}

- (void)setSelectionChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionChanged, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
}

@end
