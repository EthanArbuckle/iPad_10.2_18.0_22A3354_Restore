@implementation BottomPlayerViewController.RouteButtonWorkaround

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  objc_opt_self(UITapGestureRecognizer);
  return swift_dynamicCastObjCClass(a3) == 0;
}

- (_TtCC16MusicApplication26BottomPlayerViewController21RouteButtonWorkaround)initWithFrame:(CGRect)a3
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

- (_TtCC16MusicApplication26BottomPlayerViewController21RouteButtonWorkaround)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication26BottomPlayerViewController21RouteButtonWorkaround *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BottomPlayerViewController.RouteButtonWorkaround();
  v4 = a3;
  v5 = -[BottomPlayerViewController.RouteButtonWorkaround initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

@end
