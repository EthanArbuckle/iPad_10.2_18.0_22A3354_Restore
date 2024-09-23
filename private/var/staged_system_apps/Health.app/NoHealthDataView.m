@implementation NoHealthDataView

- (_TtC6Health16NoHealthDataView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC6Health16NoHealthDataView *v10;
  _TtC6Health16NoHealthDataView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC6Health16NoHealthDataView_label;
  v9 = objc_allocWithZone((Class)UILabel);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, "init");

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for NoHealthDataView();
  v11 = -[NoHealthDataView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_10006E920();

  return v11;
}

- (_TtC6Health16NoHealthDataView)initWithCoder:(id)a3
{
  return (_TtC6Health16NoHealthDataView *)sub_10006E854(a3);
}

- (void).cxx_destruct
{

}

@end
