@implementation DebugPerformerMockDABabysittableAccount

- (id)waiterID
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->accountID[OBJC_IVAR____TtC7reminddP33_A793612D66A4A6A32EDDE79136FC5A3839DebugPerformerMockDABabysittableAccount_accountID];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

- (_TtC7reminddP33_A793612D66A4A6A32EDDE79136FC5A3839DebugPerformerMockDABabysittableAccount)init
{
  _TtC7reminddP33_A793612D66A4A6A32EDDE79136FC5A3839DebugPerformerMockDABabysittableAccount *result;

  result = (_TtC7reminddP33_A793612D66A4A6A32EDDE79136FC5A3839DebugPerformerMockDABabysittableAccount *)_swift_stdlib_reportUnimplementedInitializer("remindd.DebugPerformerMockDABabysittableAccount", 47, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->accountID[OBJC_IVAR____TtC7reminddP33_A793612D66A4A6A32EDDE79136FC5A3839DebugPerformerMockDABabysittableAccount_accountID]);
}

@end
