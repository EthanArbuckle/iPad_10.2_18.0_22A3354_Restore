@implementation MaterialSearchTextField

- (void)layoutSubviews
{
  _TtC5Music23MaterialSearchTextField *v2;

  v2 = self;
  sub_1003F1FF8();

}

- (_TtC5Music23MaterialSearchTextField)initWithFrame:(CGRect)a3
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
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = (char *)self + OBJC_IVAR____TtC5Music23MaterialSearchTextField_blurEffectStyle;
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music23MaterialSearchTextField____lazy_storage___blurEffectView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MaterialSearchTextField initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC5Music23MaterialSearchTextField)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = (char *)self + OBJC_IVAR____TtC5Music23MaterialSearchTextField_blurEffectStyle;
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music23MaterialSearchTextField____lazy_storage___blurEffectView) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[MaterialSearchTextField initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music23MaterialSearchTextField____lazy_storage___blurEffectView));
}

@end
