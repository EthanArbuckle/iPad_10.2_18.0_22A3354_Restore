@implementation RDDebouncerWithCKDatabaseNotification

- (double)debouncingInterval
{
  _TtC7remindd37RDDebouncerWithCKDatabaseNotification *v2;
  double v3;

  v2 = self;
  v3 = sub_10038FF54();

  return v3;
}

- (void)setDebouncingInterval:(double)a3
{
  _TtC7remindd37RDDebouncerWithCKDatabaseNotification *v4;

  v4 = self;
  sub_1000E63AC(a3);

}

- (_TtC7remindd37RDDebouncerWithCKDatabaseNotification)initWithDebouncingInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC7remindd37RDDebouncerWithCKDatabaseNotification *v11;
  _TtC7remindd37RDDebouncerWithCKDatabaseNotification *v12;
  objc_super v14;
  _QWORD v15[4];
  __int16 v16;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1007E3510, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(double *)v15 = a3;
  memset(&v15[1], 0, 24);
  v16 = 0;
  objc_allocWithZone((Class)sub_10001A630(&qword_10083A678));
  v10 = a4;
  v11 = self;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC7remindd37RDDebouncerWithCKDatabaseNotification_debouncer) = (Class)sub_10039A848(0, 0, v15, v10, sub_1000E6B00, v9);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for RDDebouncerWithCKDatabaseNotification();
  v12 = -[RDDebouncerWithCKDatabaseNotification init](&v14, "init");

  swift_release(v9);
  return v12;
}

- (void)fire:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  _TtC7remindd37RDDebouncerWithCKDatabaseNotification *v13;

  v6 = _Block_copy(a4);
  v7 = type metadata accessor for RDDebounceableCKDatabaseNotification();
  v9 = sub_1000E6BAC(&qword_100844380, v8, (uint64_t (*)(uint64_t))type metadata accessor for RDDebounceableCKDatabaseNotification);
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v9);
  if (v6)
  {
    v11 = swift_allocObject(&unk_1007E34E8, 24, 7);
    *(_QWORD *)(v11 + 16) = v6;
    v12 = (uint64_t (*)(uint64_t, uint64_t))sub_1000E6AD8;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  v13 = self;
  sub_1003907E8(v10, v12, v11);
  sub_1000A5C24((uint64_t)v12, v11);

  swift_bridgeObjectRelease(v10);
}

- (_TtC7remindd37RDDebouncerWithCKDatabaseNotification)init
{
  _TtC7remindd37RDDebouncerWithCKDatabaseNotification *result;

  result = (_TtC7remindd37RDDebouncerWithCKDatabaseNotification *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDDebouncerWithCKDatabaseNotification", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd37RDDebouncerWithCKDatabaseNotification_debouncer));
}

@end
