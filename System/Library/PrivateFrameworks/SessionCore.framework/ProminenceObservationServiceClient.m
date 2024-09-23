@implementation ProminenceObservationServiceClient

- (_TtC11SessionCoreP33_4DC64229D2ABB0B5306670C4AE3A9EED34ProminenceObservationServiceClient)init
{
  _TtC11SessionCoreP33_4DC64229D2ABB0B5306670C4AE3A9EED34ProminenceObservationServiceClient *result;

  result = (_TtC11SessionCoreP33_4DC64229D2ABB0B5306670C4AE3A9EED34ProminenceObservationServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1339040((uint64_t)self+ OBJC_IVAR____TtC11SessionCoreP33_4DC64229D2ABB0B5306670C4AE3A9EED34ProminenceObservationServiceClient_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCoreP33_4DC64229D2ABB0B5306670C4AE3A9EED34ProminenceObservationServiceClient_connection));
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C132C860((uint64_t)self+ OBJC_IVAR____TtC11SessionCoreP33_4DC64229D2ABB0B5306670C4AE3A9EED34ProminenceObservationServiceClient__lock_predicate, (uint64_t *)&unk_1ED7928B0);
}

- (BOOL)subscribeToActivityProminenceMatchingPredicate:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC11SessionCoreP33_4DC64229D2ABB0B5306670C4AE3A9EED34ProminenceObservationServiceClient *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v17;

  v6 = sub_1C142569C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  v12 = sub_1C14250D8();
  v14 = v13;

  v15 = (void *)sub_1C14250CC();
  sub_1C1329AD0(&qword_1ED7928A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0C8FA98], MEMORY[0x1E0C8FA90]);
  sub_1C1425BAC();

  sub_1C135A0A8((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  sub_1C13282B4(v12, v14);
  return 1;
}

@end
