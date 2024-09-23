@implementation RDDebouncerWithNumber

- (double)debouncingInterval
{
  _TtC7remindd21RDDebouncerWithNumber *v2;
  double v3;

  v2 = self;
  v3 = sub_10038FF54();

  return v3;
}

- (void)setDebouncingInterval:(double)a3
{
  _TtC7remindd21RDDebouncerWithNumber *v4;

  v4 = self;
  sub_1000E5C24(a3);

}

- (_TtC7remindd21RDDebouncerWithNumber)initWithDebouncingInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC7remindd21RDDebouncerWithNumber *v11;
  _TtC7remindd21RDDebouncerWithNumber *v12;
  objc_super v14;
  _QWORD v15[4];
  __int16 v16;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1007E3560, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(double *)v15 = a3;
  memset(&v15[1], 0, 24);
  v16 = 0;
  objc_allocWithZone((Class)sub_10001A630(&qword_10083A680));
  v10 = a4;
  v11 = self;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC7remindd21RDDebouncerWithNumber_debouncer) = (Class)sub_10039A848(0, 0, v15, v10, sub_1000E6C1C, v9);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for RDDebouncerWithNumber();
  v12 = -[RDDebouncerWithNumber init](&v14, "init");

  swift_release(v9);
  return v12;
}

- (void)fire:(id)a3 completion:(id)a4
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char, uint64_t);
  _TtC7remindd21RDDebouncerWithNumber *v12;

  v6 = _Block_copy(a4);
  v7 = sub_1000E6B70();
  v8 = sub_1000E6BAC(&qword_100847B30, 255, (uint64_t (*)(uint64_t))sub_1000E6B70);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  if (v6)
  {
    v10 = swift_allocObject(&unk_1007E3538, 24, 7);
    *(_QWORD *)(v10 + 16) = v6;
    v11 = sub_1000E6BEC;
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v12 = self;
  sub_100390178(v9, (uint64_t (*)(uint64_t, uint64_t))v11, v10);
  sub_1000A5C24((uint64_t)v11, v10);

  swift_bridgeObjectRelease(v9);
}

- (_TtC7remindd21RDDebouncerWithNumber)init
{
  _TtC7remindd21RDDebouncerWithNumber *result;

  result = (_TtC7remindd21RDDebouncerWithNumber *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDDebouncerWithNumber", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
