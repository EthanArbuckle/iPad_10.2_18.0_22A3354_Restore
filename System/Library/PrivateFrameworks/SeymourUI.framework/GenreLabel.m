@implementation GenreLabel

- (_TtC9SeymourUI10GenreLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  _TtC9SeymourUI10GenreLabel *v10;
  id v11;
  _TtC9SeymourUI10GenreLabel *v12;
  id v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10GenreLabel_genre);
  v9 = (objc_class *)type metadata accessor for GenreLabel();
  *v8 = 0;
  v8[1] = 0;
  v15.receiver = self;
  v15.super_class = v9;
  v10 = -[TagLabel initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v11 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v12 = v10;
  v13 = objc_msgSend(v11, sel_initWithRed_green_blue_alpha_, 0.980392157, 0.0666666667, 0.309803922, 1.0);
  -[GenreLabel setBackgroundColor:](v12, sel_setBackgroundColor_, v13);

  return v12;
}

- (_TtC9SeymourUI10GenreLabel)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC9SeymourUI10GenreLabel *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10GenreLabel_genre);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC9SeymourUI10GenreLabel *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
