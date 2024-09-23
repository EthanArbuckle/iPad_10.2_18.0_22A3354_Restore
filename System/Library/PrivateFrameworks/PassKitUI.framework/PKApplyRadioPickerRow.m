@implementation PKApplyRadioPickerRow

- (PKApplyRadioPickerRow)initWithTitle:(id)a3 submissionValue:(id)a4
{
  id v7;
  id v8;
  PKApplyRadioPickerRow *v9;
  PKApplyRadioPickerRow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplyRadioPickerRow;
  v9 = -[PKApplyRadioPickerRow init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_submissionValue, a4);
  }

  return v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_submissionValue;
}

- (void)configureCell:(id)a3
{
  _BOOL8 selected;
  id v5;
  id v6;

  v6 = a3;
  -[PKApplyRadioPickerRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    selected = self->_selected;
    v5 = v6;
    objc_msgSend(v5, "setRadioButtonSelected:", selected);
    objc_msgSend(v5, "setTitle:", self->_title);
    objc_msgSend(v5, "setAction:", self->_action);
    objc_msgSend(v5, "setAccessibilityIdentifier:", self->_submissionValue);

  }
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_submissionValue, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
