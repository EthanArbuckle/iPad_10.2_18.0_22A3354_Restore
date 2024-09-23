@implementation SiriUIObjectPickerViewController

+ (id)pickerControllerWithPicker:(id)a3
{
  id v3;
  SiriUIPersonPickerViewController *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = -[SiriUIObjectPickerViewController initWithPicker:]([SiriUIPersonPickerViewController alloc], "initWithPicker:", v3);
  else
    v4 = 0;

  return v4;
}

- (SiriUIObjectPickerViewController)initWithPicker:(id)a3
{
  id v5;
  SiriUIObjectPickerViewController *v6;
  SiriUIObjectPickerViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriUIObjectPickerViewController;
  v6 = -[SiriUIObjectPickerViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_picker, a3);

  return v7;
}

- (SiriUIObjectPickerViewControllerDelegate)pickerDelegate
{
  return (SiriUIObjectPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_pickerDelegate);
}

- (void)setPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pickerDelegate, a3);
}

- (SAUIDomainObjectPicker)_picker
{
  return self->_picker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_destroyWeak((id *)&self->_pickerDelegate);
}

@end
