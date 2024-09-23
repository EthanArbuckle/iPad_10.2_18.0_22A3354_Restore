@implementation OneUpChromeViewController.View

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1AABA11D8((uint64_t)a4, x, y);

  return v10;
}

- (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View)initWithFrame:(CGRect)a3
{
  return (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View *)sub_1AABA1310(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View)initWithCoder:(id)a3
{
  return (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View *)sub_1AABA1394(a3);
}

@end
