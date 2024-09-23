@implementation DurationLabel

- (_TtC9SeymourUI13DurationLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC9SeymourUI13DurationLabel *v8;
  id v9;
  _TtC9SeymourUI13DurationLabel *v10;
  id v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC9SeymourUI13DurationLabel_duration;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DurationLabel();
  v8 = -[TagLabel initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v9 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v10 = v8;
  v11 = objc_msgSend(v9, sel_initWithRed_green_blue_alpha_, 0.984313725, 0.901960784, 0.325490196, 1.0);
  -[DurationLabel setBackgroundColor:](v10, sel_setBackgroundColor_, v11);

  return v10;
}

- (_TtC9SeymourUI13DurationLabel)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC9SeymourUI13DurationLabel *result;

  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI13DurationLabel_duration;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = a3;

  result = (_TtC9SeymourUI13DurationLabel *)sub_22BA815D0();
  __break(1u);
  return result;
}

@end
