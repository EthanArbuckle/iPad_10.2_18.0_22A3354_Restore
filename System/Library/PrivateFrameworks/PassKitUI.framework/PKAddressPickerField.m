@implementation PKAddressPickerField

- (PKAddressPickerField)initWithFrame:(CGRect)a3 addressTextField:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  PKAddressPickerField *v12;
  id *p_isa;
  PKAddressPickerField *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  objc_msgSend(v10, "contactFieldConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "type") == 2)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKAddressPickerField;
    v12 = -[PKAddressPickerField initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
    p_isa = (id *)&v12->super.super.super.super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_addressTextField, a4);
      objc_storeStrong(p_isa + 70, v11);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (PKAddressTextField)addressTextField
{
  return self->_addressTextField;
}

- (PKPickerContactFieldConfiguration)pickerFieldConfiguration
{
  return self->_pickerFieldConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_addressTextField, 0);
}

@end
