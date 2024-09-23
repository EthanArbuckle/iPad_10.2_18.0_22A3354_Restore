@implementation PKFixedAmountWrapperView

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
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKFixedAmountWrapperView;
  -[PKFixedAmountWrapperView layoutSubviews](&v16, sel_layoutSubviews);
  -[PKFixedAmountWrapperView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIPickerView bounds](self->_pickerView, "bounds");
  v12 = v11;
  v14 = v13;
  v15 = v10 - v13;
  -[UITableView setFrame:](self->_tableView, "setFrame:", v4, v6, v8, v15);
  -[UIPickerView setFrame:](self->_pickerView, "setFrame:", v12, v15, v8, v14);
}

- (void)setPickerView:(id)a3
{
  UIPickerView *v4;
  UIPickerView *pickerView;
  UIPickerView *v6;
  UIPickerView *v7;

  v4 = (UIPickerView *)a3;
  pickerView = self->_pickerView;
  if (pickerView)
  {
    -[UIPickerView resignFirstResponder](pickerView, "resignFirstResponder");
    -[UIPickerView removeFromSuperview](self->_pickerView, "removeFromSuperview");
    v6 = self->_pickerView;
  }
  else
  {
    v6 = 0;
  }
  self->_pickerView = v4;
  v7 = v4;

  -[PKFixedAmountWrapperView addSubview:](self, "addSubview:", v7);
  -[PKFixedAmountWrapperView setNeedsLayout](self, "setNeedsLayout");
  -[UIPickerView becomeFirstResponder](self->_pickerView, "becomeFirstResponder");

}

- (void)setTableView:(id)a3
{
  UITableView *v4;
  UITableView *tableView;
  UITableView *v6;
  UITableView *v7;

  v4 = (UITableView *)a3;
  tableView = self->_tableView;
  if (tableView)
  {
    -[UITableView removeFromSuperview](tableView, "removeFromSuperview");
    v6 = self->_tableView;
  }
  else
  {
    v6 = 0;
  }
  self->_tableView = v4;
  v7 = v4;

  -[PKFixedAmountWrapperView addSubview:](self, "addSubview:", v7);
  -[PKFixedAmountWrapperView setNeedsLayout](self, "setNeedsLayout");
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
