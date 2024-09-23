@implementation HiddenCardViewController

- (_TtC8StocksUI24HiddenCardViewController)init
{
  objc_class *ObjectType;
  _TtC8StocksUI24HiddenCardViewController *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1DC404C00();
  sub_1DC4047F8();

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return -[HiddenCardViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC8StocksUI24HiddenCardViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8StocksUI24HiddenCardViewController *result;

  v4 = a3;
  sub_1DC404C00();
  sub_1DC4047F8();

  result = (_TtC8StocksUI24HiddenCardViewController *)sub_1DC409838();
  __break(1u);
  return result;
}

- (_TtC8StocksUI24HiddenCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI24HiddenCardViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI24HiddenCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI24HiddenCardViewController_cardViewAppearance;
  v4 = sub_1DC404C0C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8StocksUI24HiddenCardViewController_cardViewBehavior;
  v6 = sub_1DC40481C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
