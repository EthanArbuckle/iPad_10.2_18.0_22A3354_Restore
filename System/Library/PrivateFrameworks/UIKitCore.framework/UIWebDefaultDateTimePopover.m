@implementation UIWebDefaultDateTimePopover

- (void)clear:(id)a3
{
  WebThreadLock();
  -[DOMNode _accessoryClear](-[UIWebRotatingNodePopover node](self, "node"), "_accessoryClear");
}

- (UIWebDefaultDateTimePopover)initWithDOMHTMLInputElement:(id)a3 datePickerMode:(int64_t)a4
{
  UIWebDefaultDateTimePopover *v6;
  double v7;
  double v8;
  double v9;
  UINavigationController *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIWebDefaultDateTimePopover;
  v6 = -[UIWebFormRotatingAccessoryPopover initWithDOMNode:](&v12, sel_initWithDOMNode_);
  if (v6)
  {
    -[UIWebDefaultDateTimePopover set_webDateTimeViewController:](v6, "set_webDateTimeViewController:", -[UIWebDateTimePopoverViewController initWithDOMHTMLInputElement:datePickerMode:]([UIWebDateTimePopoverViewController alloc], "initWithDOMHTMLInputElement:datePickerMode:", a3, a4));
    objc_msgSend((id)-[UIWebFormControl _datePicker](-[UIWebDateTimePopoverViewController _innerWebDateTimeControl](v6->_webDateTimeViewController, "_innerWebDateTimeControl"), "_datePicker"), "_contentWidth");
    v8 = v7;
    -[UIView frame](-[UIViewController view](v6->_webDateTimeViewController, "view"), "frame");
    -[UIViewController setPreferredContentSize:](v6->_webDateTimeViewController, "setPreferredContentSize:", v8, v9);
    -[UIViewController setEdgesForExtendedLayout:](v6->_webDateTimeViewController, "setEdgesForExtendedLayout:", 0);
    -[UIViewController setTitle:](v6->_webDateTimeViewController, "setTitle:", objc_msgSend(a3, "title"));
    v10 = -[UINavigationController initWithRootViewController:]([UINavigationController alloc], "initWithRootViewController:", v6->_webDateTimeViewController);
    -[UINavigationItem setRightBarButtonItem:](-[UINavigationBar topItem](-[UINavigationController navigationBar](v10, "navigationBar"), "topItem"), "setRightBarButtonItem:", -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", _UINSLocalizedStringWithDefaultValue(CFSTR("Clear"), CFSTR("Clear")), 1, v6, sel_clear_));
    -[UIWebRotatingNodePopover setPopoverController:](v6, "setPopoverController:", -[UIPopoverController initWithContentViewController:]([UIPopoverController alloc], "initWithContentViewController:", v10));
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebDefaultDateTimePopover set_webDateTimeViewController:](self, "set_webDateTimeViewController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebDefaultDateTimePopover;
  -[UIWebRotatingNodePopover dealloc](&v3, sel_dealloc);
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  -[UIWebRotatingNodePopover presentPopoverAnimated:](self, "presentPopoverAnimated:", 0);
  -[UIWebFormControl controlBeginEditing](-[UIWebDateTimePopoverViewController _innerWebDateTimeControl](self->_webDateTimeViewController, "_innerWebDateTimeControl"), "controlBeginEditing");
}

- (UIWebDateTimePopoverViewController)_webDateTimeViewController
{
  return self->_webDateTimeViewController;
}

- (void)set_webDateTimeViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
