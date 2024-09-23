@implementation HistoryView

- (_TtC7Measure11HistoryView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC7Measure11HistoryView *v11;
  _TtC7Measure11HistoryView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = OBJC_IVAR____TtC7Measure11HistoryView_tableView;
  v10 = objc_allocWithZone((Class)UITableView);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, "init");
  swift_unknownObjectWeakInit((char *)v11 + OBJC_IVAR____TtC7Measure11HistoryView_cardContainer, 0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[HistoryView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  sub_1000AA230();

  return v12;
}

- (_TtC7Measure11HistoryView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7Measure11HistoryView *result;

  v5 = OBJC_IVAR____TtC7Measure11HistoryView_tableView;
  v6 = objc_allocWithZone((Class)UITableView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC7Measure11HistoryView_cardContainer, 0);

  result = (_TtC7Measure11HistoryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/HistoryView.swift", 25, 2, 20, 0);
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC7Measure11HistoryView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1000AA7C0((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure11HistoryView_cardContainer, v3);
}

@end
