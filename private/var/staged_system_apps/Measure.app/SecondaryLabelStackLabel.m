@implementation SecondaryLabelStackLabel

- (_TtC7Measure24SecondaryLabelStackLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC7Measure24SecondaryLabelStackLabel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType(self);
  v7 = -[ViewWithInteractiveLabel initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  sub_1000ED270();
  v9 = v8;
  v11 = v10;
  v12 = *(Class *)((char *)&v7->super.super.super.super.isa + OBJC_IVAR____TtC7Measure24ViewWithInteractiveLabel_label);
  objc_msgSend(v12, "setFont:", v8);
  objc_msgSend(v12, "setTextColor:", v11);

  return v7;
}

- (_TtC7Measure24SecondaryLabelStackLabel)initWithCoder:(id)a3
{
  return (_TtC7Measure24SecondaryLabelStackLabel *)sub_1000ED170(a3);
}

@end
