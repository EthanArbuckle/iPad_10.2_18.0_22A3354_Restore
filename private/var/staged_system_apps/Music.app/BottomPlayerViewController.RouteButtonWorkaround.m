@implementation BottomPlayerViewController.RouteButtonWorkaround

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_self(UITapGestureRecognizer);
  return swift_dynamicCastObjCClass(a3, v4) == 0;
}

- (_TtCC5Music26BottomPlayerViewController21RouteButtonWorkaround)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for BottomPlayerViewController.RouteButtonWorkaround();
  return -[BottomPlayerViewController.RouteButtonWorkaround initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC5Music26BottomPlayerViewController21RouteButtonWorkaround)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BottomPlayerViewController.RouteButtonWorkaround();
  return -[BottomPlayerViewController.RouteButtonWorkaround initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
