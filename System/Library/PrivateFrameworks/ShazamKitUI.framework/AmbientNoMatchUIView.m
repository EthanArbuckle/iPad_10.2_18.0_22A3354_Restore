@implementation AmbientNoMatchUIView

- (_TtC11ShazamKitUI20AmbientNoMatchUIView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC11ShazamKitUI20AmbientNoMatchUIView *v11;
  _TtC11ShazamKitUI20AmbientNoMatchUIView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC11ShazamKitUI20AmbientNoMatchUIView_titleLabel;
  v10 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[AmbientNoMatchUIView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_2287BCEC8();

  return v12;
}

- (_TtC11ShazamKitUI20AmbientNoMatchUIView)initWithCoder:(id)a3
{
  return (_TtC11ShazamKitUI20AmbientNoMatchUIView *)sub_2287BD29C(a3);
}

- (CGSize)intrinsicContentSize
{
  _TtC11ShazamKitUI20AmbientNoMatchUIView *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[AmbientNoMatchUIView superview](v2, sel_superview);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;

  }
  else
  {

    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI20AmbientNoMatchUIView_titleLabel));
}

@end
