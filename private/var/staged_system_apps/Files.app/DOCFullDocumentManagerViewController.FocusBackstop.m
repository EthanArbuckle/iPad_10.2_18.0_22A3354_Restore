@implementation DOCFullDocumentManagerViewController.FocusBackstop

- (BOOL)canBecomeFocused
{
  return 1;
}

- (_TtCE5FilesCSo36DOCFullDocumentManagerViewControllerP33_6DB6B51135FB5D224397F02A0ADB066D13FocusBackstop)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_s13FocusBackstopCMa();
  return -[DOCFullDocumentManagerViewController.FocusBackstop initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCE5FilesCSo36DOCFullDocumentManagerViewControllerP33_6DB6B51135FB5D224397F02A0ADB066D13FocusBackstop)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_s13FocusBackstopCMa();
  return -[DOCFullDocumentManagerViewController.FocusBackstop initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
