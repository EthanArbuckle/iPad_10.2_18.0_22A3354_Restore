@implementation PKDatePickerCellAccessory

+ (id)accessoryWithDatePicker:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[PKDatePickerCellAccessory _initWithDatePicker:]([PKDatePickerCellAccessory alloc], "_initWithDatePicker:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v4, 1);
  objc_msgSend(v5, "setMaintainsFixedSize:", 1);
  objc_msgSend(v5, "setReservedLayoutWidth:", 0.0);

  return v5;
}

- (id)_initWithDatePicker:(id)a3
{
  id v5;
  PKDatePickerCellAccessory *v6;
  PKDatePickerCellAccessory *v7;
  double v8;
  double v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDatePickerCellAccessory;
  v6 = -[PKDatePickerCellAccessory init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_datePicker, a3);
    -[PKDatePickerCellAccessory addSubview:](v7, "addSubview:", v5);
    -[PKDatePickerCellAccessory sizeThatFits:](v7, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    -[PKDatePickerCellAccessory setFrame:](v7, "setFrame:", 0.0, 0.0, v8, v9);
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIDatePicker systemLayoutSizeFittingSize:](self->_datePicker, "systemLayoutSizeFittingSize:", 50.0, 1.79769313e308);
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

  -[PKDatePickerCellAccessory bounds](self, "bounds");
  -[PKDatePickerCellAccessory sizeThatFits:](self, "sizeThatFits:", v3, v4);
  -[UIDatePicker setFrame:](self->_datePicker, "setFrame:", 0.0, 0.0, v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
