@implementation UIPickerTableViewCell

- (UIPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  UIPickerTableViewCell *v4;
  UIPickerTableViewCell *v5;
  void *v6;
  uint64_t v7;
  _UIPickerViewStyle *style;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *tap;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIPickerTableViewCell;
  v4 = -[UITableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIView traitCollection](v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", objc_msgSend(v6, "userInterfaceIdiom"));
    v7 = objc_claimAutoreleasedReturnValue();
    style = v5->_style;
    v5->_style = (_UIPickerViewStyle *)v7;

    v9 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v5, sel__tapAction_);
    tap = v5->_tap;
    v5->_tap = v9;

    -[UIView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_tap);
  }
  return v5;
}

- (void)_tapAction:(id)a3
{
  UIPickerTableView *pickerTable;
  id v5;

  if (objc_msgSend(a3, "state") == 3)
  {
    pickerTable = self->pickerTable;
    -[UITableView indexPathForCell:](pickerTable, "indexPathForCell:", self);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPickerTableView tableView:didSelectRowAtIndexPath:](pickerTable, "tableView:didSelectRowAtIndexPath:", pickerTable, v5);

  }
}

- (UIPickerTableView)pickerTable
{
  return self->pickerTable;
}

- (void)setPickerTable:(id)a3
{
  self->pickerTable = (UIPickerTableView *)a3;
}

- (_UIPickerViewStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_tap, 0);
}

@end
