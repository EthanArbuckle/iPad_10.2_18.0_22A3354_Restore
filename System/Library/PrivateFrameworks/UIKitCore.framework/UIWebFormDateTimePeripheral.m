@implementation UIWebFormDateTimePeripheral

- (int64_t)_datePickerModeForInputType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("date")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("datetime-local")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("time")) & 1) != 0)
    return 0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("month")))
    return 4;
  return -1;
}

- (UIWebFormDateTimePeripheral)initWithDOMHTMLInputElement:(id)a3
{
  UIWebFormDateTimePeripheral *v4;
  UIWebFormDateTimePeripheral *v5;
  uint64_t v6;
  uint64_t v7;
  __objc2_class *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIWebFormDateTimePeripheral;
  v4 = -[UIWebFormDateTimePeripheral init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    -[UIWebFormDateTimePeripheral set_inputElement:](v4, "set_inputElement:", a3);
    WebThreadLock();
    v6 = -[UIWebFormDateTimePeripheral _datePickerModeForInputType:](v5, "_datePickerModeForInputType:", -[DOMHTMLInputElement type](v5->_inputElement, "type"));
    if (v6 == -1)
    {

      return 0;
    }
    else
    {
      v7 = v6;
      if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)v8 = UIWebDefaultDateTimePopover;
      else
        v8 = UIWebDefaultDateTimePicker;
      -[UIWebFormDateTimePeripheral set_control:](v5, "set_control:", (id)objc_msgSend([v8 alloc], "initWithDOMHTMLInputElement:datePickerMode:", a3, v7));
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebFormDateTimePeripheral set_inputElement:](self, "set_inputElement:", 0);
  -[UIWebFormDateTimePeripheral set_control:](self, "set_control:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebFormDateTimePeripheral;
  -[UIWebFormDateTimePeripheral dealloc](&v3, sel_dealloc);
}

+ (id)createPeripheralWithDOMHTMLInputElement:(id)a3
{
  return -[UIWebFormDateTimePeripheral initWithDOMHTMLInputElement:]([UIWebFormDateTimePeripheral alloc], "initWithDOMHTMLInputElement:", a3);
}

- (void)beginEditing
{
  -[UIWebFormControl controlBeginEditing](self->_control, "controlBeginEditing");
}

- (void)endEditing
{
  -[UIWebFormControl controlEndEditing](self->_control, "controlEndEditing");
}

- (id)assistantView
{
  return (id)-[UIWebFormControl controlView](self->_control, "controlView");
}

- (DOMHTMLInputElement)_inputElement
{
  return self->_inputElement;
}

- (void)set_inputElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIWebFormControl)_control
{
  return self->_control;
}

- (void)set_control:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
