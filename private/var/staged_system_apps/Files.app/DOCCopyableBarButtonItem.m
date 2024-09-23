@implementation DOCCopyableBarButtonItem

- (id)copyWithZone:(void *)a3
{
  _TtC5Files24DOCCopyableBarButtonItem *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v8[3];
  uint64_t v9;

  v3 = self;
  sub_100263170(v8);

  v4 = v9;
  v5 = sub_10007E7A0(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  sub_100068588(v8);
  return v6;
}

- (_TtC5Files24DOCCopyableBarButtonItem)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files24DOCCopyableBarButtonItem_creator);
  v4 = (objc_class *)type metadata accessor for DOCCopyableBarButtonItem();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[DOCBarButtonItem init](&v6, "init");
}

- (void).cxx_destruct
{
  sub_100087534(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files24DOCCopyableBarButtonItem_creator), *(_QWORD *)&self->creator[OBJC_IVAR____TtC5Files24DOCCopyableBarButtonItem_creator]);
}

@end
