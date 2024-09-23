@implementation UIWebDateTimePopoverViewController

- (UIWebDateTimePopoverViewController)initWithDOMHTMLInputElement:(id)a3 datePickerMode:(int64_t)a4
{
  UIWebDateTimePopoverViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIWebDateTimePopoverViewController;
  v6 = -[UIViewController init](&v8, sel_init);
  if (v6)
    -[UIWebDateTimePopoverViewController set_innerWebDateTimeControl:](v6, "set_innerWebDateTimeControl:", -[UIWebDefaultDateTimePicker initWithDOMHTMLInputElement:datePickerMode:]([UIWebDefaultDateTimePicker alloc], "initWithDOMHTMLInputElement:datePickerMode:", a3, a4));
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebDateTimePopoverViewController set_innerWebDateTimeControl:](self, "set_innerWebDateTimeControl:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebDateTimePopoverViewController;
  -[UIViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  -[UIViewController setView:](self, "setView:", -[UIWebFormControl controlView](self->_innerWebDateTimeControl, "controlView"));
}

- (UIWebFormControl)_innerWebDateTimeControl
{
  return self->_innerWebDateTimeControl;
}

- (void)set_innerWebDateTimeControl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 968);
}

@end
