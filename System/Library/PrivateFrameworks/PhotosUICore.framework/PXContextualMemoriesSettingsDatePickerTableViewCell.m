@implementation PXContextualMemoriesSettingsDatePickerTableViewCell

- (PXContextualMemoriesSettingsDatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXContextualMemoriesSettingsDatePickerTableViewCell *v4;
  PXContextualMemoriesSettingsDatePickerTableViewCell *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UIDatePicker *datePicker;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXContextualMemoriesSettingsDatePickerTableViewCell;
  v4 = -[PXContextualMemoriesSettingsDatePickerTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PXContextualMemoriesSettingsDatePickerTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = objc_alloc(MEMORY[0x1E0DC36F0]);
    -[PXContextualMemoriesSettingsDatePickerTableViewCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = objc_msgSend(v6, "initWithFrame:");
    datePicker = v5->_datePicker;
    v5->_datePicker = (UIDatePicker *)v8;

    -[UIDatePicker setAutoresizingMask:](v5->_datePicker, "setAutoresizingMask:", 18);
    -[UIDatePicker setDatePickerMode:](v5->_datePicker, "setDatePickerMode:", 1);
    -[PXContextualMemoriesSettingsDatePickerTableViewCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_datePicker);

  }
  return v5;
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
