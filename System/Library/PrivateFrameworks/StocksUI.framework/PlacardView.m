@implementation PlacardView

- (_TtC8StocksUI11PlacardView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC8StocksUI11PlacardView *v11;
  _TtC8StocksUI11PlacardView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC8StocksUI11PlacardView_messageLabel;
  v10 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[PlacardView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  -[PlacardView addSubview:](v12, sel_addSubview_, *(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC8StocksUI11PlacardView_messageLabel));
  return v12;
}

- (_TtC8StocksUI11PlacardView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8StocksUI11PlacardView *result;

  v5 = OBJC_IVAR____TtC8StocksUI11PlacardView_messageLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI11PlacardView *)sub_1DC409838();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
