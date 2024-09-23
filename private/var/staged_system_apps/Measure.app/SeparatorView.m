@implementation SeparatorView

- (_TtC7Measure13SeparatorView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC7Measure13SeparatorView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13SeparatorView_targetAlpha) = (Class)0x3FF0000000000000;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[SeparatorView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_10004F8C8();

  return v9;
}

- (_TtC7Measure13SeparatorView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC7Measure13SeparatorView *v7;
  _TtC7Measure13SeparatorView *v8;
  _TtC7Measure13SeparatorView *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13SeparatorView_targetAlpha) = (Class)0x3FF0000000000000;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v6 = a3;
  v7 = -[SeparatorView initWithCoder:](&v11, "initWithCoder:", v6);
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    sub_10004F8C8();

  }
  return v8;
}

@end
