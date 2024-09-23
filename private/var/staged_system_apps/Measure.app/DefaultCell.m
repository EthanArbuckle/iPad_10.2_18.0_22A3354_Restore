@implementation DefaultCell

- (_TtC7Measure11DefaultCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC7Measure11DefaultCell *)sub_100042D4C(v4, v5);
}

- (_TtC7Measure11DefaultCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000431AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure11DefaultCell____lazy_storage___stack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure11DefaultCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure11DefaultCell____lazy_storage___valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure11DefaultCell____lazy_storage___control));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure11DefaultCell_cancellables));
  sub_100043264(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11DefaultCell_def), *(_QWORD *)&self->$__lazy_storage_$_stack[OBJC_IVAR____TtC7Measure11DefaultCell_def], *(_QWORD *)&self->$__lazy_storage_$_titleLabel[OBJC_IVAR____TtC7Measure11DefaultCell_def], *(_QWORD *)&self->$__lazy_storage_$_valueLabel[OBJC_IVAR____TtC7Measure11DefaultCell_def]);
}

@end
