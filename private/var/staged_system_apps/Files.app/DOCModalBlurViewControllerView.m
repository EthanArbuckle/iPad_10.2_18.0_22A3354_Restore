@implementation DOCModalBlurViewControllerView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC5Files30DOCModalBlurViewControllerView *v7;
  char v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_1003C5E54(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

- (_TtC5Files30DOCModalBlurViewControllerView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerView();
  return -[DOCModalBlurViewControllerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Files30DOCModalBlurViewControllerView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerView();
  return -[DOCModalBlurViewControllerView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
