@implementation ColorPicker

- (_TtC7Measure11ColorPicker)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC7Measure11ColorPicker *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_redSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_greenSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_blueSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_alphaSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_value) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[ColorPicker initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_100126814();

  return v9;
}

- (_TtC7Measure11ColorPicker)initWithCoder:(id)a3
{
  id v4;
  _TtC7Measure11ColorPicker *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_redSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_greenSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_blueSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_alphaSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_value) = 0;
  v4 = a3;

  result = (_TtC7Measure11ColorPicker *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/ColorPicker.swift", 25, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)updateValue:(id)a3
{
  id v4;
  _TtC7Measure11ColorPicker *v5;

  v4 = a3;
  v5 = self;
  sub_1001271EC();

}

- (void).cxx_destruct
{

}

@end
