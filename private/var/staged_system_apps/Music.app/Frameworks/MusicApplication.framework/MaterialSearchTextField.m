@implementation MaterialSearchTextField

- (void)layoutSubviews
{
  _TtC16MusicApplication23MaterialSearchTextField *v2;

  v2 = self;
  sub_3412A0();

}

- (_TtC16MusicApplication23MaterialSearchTextField)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC16MusicApplication23MaterialSearchTextField_blurEffectStyle;
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication23MaterialSearchTextField____lazy_storage___blurEffectView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MaterialSearchTextField initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication23MaterialSearchTextField)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  id v7;
  _TtC16MusicApplication23MaterialSearchTextField *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC16MusicApplication23MaterialSearchTextField_blurEffectStyle;
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication23MaterialSearchTextField____lazy_storage___blurEffectView) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  v7 = a3;
  v8 = -[MaterialSearchTextField initWithCoder:](&v10, "initWithCoder:", v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23MaterialSearchTextField____lazy_storage___blurEffectView));
}

@end
