@implementation QoSObservationServiceClient

- (_TtC11SessionCore27QoSObservationServiceClient)init
{
  _TtC11SessionCore27QoSObservationServiceClient *result;

  result = (_TtC11SessionCore27QoSObservationServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1339040((uint64_t)self + OBJC_IVAR____TtC11SessionCore27QoSObservationServiceClient_delegate);

  swift_release();
  swift_bridgeObjectRelease();
  sub_1C132C860((uint64_t)self + OBJC_IVAR____TtC11SessionCore27QoSObservationServiceClient__lock_predicate, (uint64_t *)&unk_1EF6DC4B8);
}

- (BOOL)subscribeToActivityQoSMatchingPredicate:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC11SessionCore27QoSObservationServiceClient *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v17;

  v6 = sub_1C14254EC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  v12 = sub_1C14250D8();
  v14 = v13;

  v15 = (void *)sub_1C14250CC();
  sub_1C1329AD0(&qword_1EF6DC4B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0C8F6F0], MEMORY[0x1E0C8F6E8]);
  sub_1C1425BAC();

  sub_1C141D084((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  sub_1C13282B4(v12, v14);
  return 1;
}

@end
