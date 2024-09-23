@implementation _UITransitionBackdropView

+ (Class)layerClass
{
  sub_1851F9080(0, &qword_1EDD88748);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5UIKitP33_F084B5C1489DDF8EC47531A7840D5DBB25_UITransitionBackdropView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for _UITransitionBackdropView();
  return -[UIView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC5UIKitP33_F084B5C1489DDF8EC47531A7840D5DBB25_UITransitionBackdropView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UITransitionBackdropView();
  return -[UIView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
