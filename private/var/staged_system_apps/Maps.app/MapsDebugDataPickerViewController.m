@implementation MapsDebugDataPickerViewController

- (void)loadView
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UIDatePicker), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setDatePickerMode:", 1);
  -[MapsDebugDataPickerViewController setView:](self, "setView:", v3);

}

@end
