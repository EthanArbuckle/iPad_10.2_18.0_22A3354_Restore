@implementation SKUIPickerView

- (SKUIPickerView)initWithCoder:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIPickerView initWithCoder:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  return -[SKUIPickerView initWithTitles:](self, "initWithTitles:", 0);
}

- (SKUIPickerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIPickerView *v16;
  SKUIPickerView *v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIPickerView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = -[SKUIPickerView initWithTitles:](self, "initWithTitles:", 0);
  v17 = v16;
  if (v16)
    -[SKUIPickerView setFrame:](v16, "setFrame:", x, y, width, height);
  return v17;
}

- (SKUIPickerView)initWithTitles:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIPickerView *v13;
  uint64_t v14;
  NSArray *titles;
  uint64_t v16;
  _UIBackdropView *backdropView;
  UIView *v18;
  UIView *separatorView;
  UIView *v20;
  void *v21;
  id v22;
  uint64_t v23;
  UIPickerView *pickerView;
  void *v25;
  objc_super v27;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPickerView initWithTitles:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUIPickerView;
  v13 = -[SKUIPickerView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v13)
  {
    v14 = objc_msgSend(v4, "copy");
    titles = v13->_titles;
    v13->_titles = (NSArray *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2010);
    backdropView = v13->_backdropView;
    v13->_backdropView = (_UIBackdropView *)v16;

    -[SKUIPickerView addSubview:](v13, "addSubview:", v13->_backdropView);
    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v13->_separatorView;
    v13->_separatorView = v18;

    v20 = v13->_separatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    -[SKUIPickerView addSubview:](v13, "addSubview:", v13->_separatorView);
    v22 = objc_alloc(MEMORY[0x1E0DC3AE0]);
    -[SKUIPickerView bounds](v13, "bounds");
    v23 = objc_msgSend(v22, "initWithFrame:");
    pickerView = v13->_pickerView;
    v13->_pickerView = (UIPickerView *)v23;

    -[UIPickerView setDataSource:](v13->_pickerView, "setDataSource:", v13);
    -[UIPickerView setDelegate:](v13->_pickerView, "setDelegate:", v13);
    -[UIPickerView setShowsSelectionIndicator:](v13->_pickerView, "setShowsSelectionIndicator:", 1);
    -[SKUIPickerView addSubview:](v13, "addSubview:", v13->_pickerView);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPickerView setBackgroundColor:](v13, "setBackgroundColor:", v25);

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPickerView setDataSource:](self->_pickerView, "setDataSource:", 0);
  -[UIPickerView setDelegate:](self->_pickerView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIPickerView;
  -[SKUIPickerView dealloc](&v3, sel_dealloc);
}

- (int64_t)selectedItemIndex
{
  return -[UIPickerView selectedRowInComponent:](self->_pickerView, "selectedRowInComponent:", 0);
}

- (void)setSelectedItemIndex:(int64_t)a3
{
  -[UIPickerView selectRow:inComponent:animated:](self->_pickerView, "selectRow:inComponent:animated:", a3, 0, 0);
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
  UIView *separatorView;
  double v12;
  id v13;

  -[SKUIPickerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  -[UIPickerView setFrame:](self->_pickerView, "setFrame:", v4, v6, v8, v10);
  separatorView = self->_separatorView;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  -[UIView setFrame:](separatorView, "setFrame:", v4, v6, v8, 1.0 / v12);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSArray count](self->_titles, "count", a3, a4);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  SKUIPickerViewDelegate **p_delegate;
  id WeakRetained;
  char v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "pickerView:didSelectItemAtIndex:", self, a4);

  }
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[NSArray objectAtIndex:](self->_titles, "objectAtIndex:", a4);
}

- (SKUIPickerViewDelegate)delegate
{
  return (SKUIPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithTitles:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
