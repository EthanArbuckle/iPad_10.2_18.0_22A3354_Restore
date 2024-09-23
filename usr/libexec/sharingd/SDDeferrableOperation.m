@implementation SDDeferrableOperation

- (SDDeferrableOperation)initWithIdentifier:(id)a3 queue:(id)a4 operation:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  SDDeferrableOperation *v13;

  v7 = _Block_copy(a5);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = swift_allocObject(&unk_1007241D8, 24, 7);
  *(_QWORD *)(v11 + 16) = v7;
  v12 = a4;
  v13 = (SDDeferrableOperation *)sub_100361F48(v8, v10, v12, (uint64_t)sub_100361F40, v11);

  swift_release(v11);
  return v13;
}

- (void)addReason:(id)a3
{
  sub_10035D91C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_10035CB40);
}

- (void)removeReason:(id)a3
{
  sub_10035D91C(self, (uint64_t)a2, (uint64_t)a3, sub_10035D058);
}

- (void)pushPreventionDateForReason:(id)a3 newDate:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  SDDeferrableOperation *v14;
  __n128 v15;
  uint64_t v16;

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  sub_10035D970(v11, v13, (uint64_t)v10);

  v15 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v15);
}

- (void)scheduleOperation
{
  SDDeferrableOperation *v2;

  v2 = self;
  sub_10035E7A8();

}

- (id)returnPreventUntilDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  _BYTE v12[24];

  v3 = sub_100008384(&qword_1007C4330);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR___SDDeferrableOperation_preventUntilDate;
  swift_beginAccess(v6, v12, 0, 0);
  sub_100221F28((uint64_t)v6, (uint64_t)v5, &qword_1007C4330);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return isa;
}

- (BOOL)returnHasActiveTimer
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDDeferrableOperation_mainTimer) != 0;
}

- (SDDeferrableOperation)init
{
  SDDeferrableOperation *result;

  result = (SDDeferrableOperation *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDDeferrableOperation", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3;

  swift_bridgeObjectRelease(*(const char **)&self->identifier[OBJC_IVAR___SDDeferrableOperation_identifier], a2);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR___SDDeferrableOperation_preventUntilDate, &qword_1007C4330);
  swift_release(*(_QWORD *)&self->identifier[OBJC_IVAR___SDDeferrableOperation_operation]);

  *(_QWORD *)&v3 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR___SDDeferrableOperation_timedReasons)).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa + OBJC_IVAR___SDDeferrableOperation_reasons), v3);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___SDDeferrableOperation_mainTimer));
}

@end
