@implementation KTOptIOValidator

- (_TtC13transparencyd16KTOptIOValidator)initWithOptInRecords:(id)a3 uriToSMT:(id)a4
{
  unint64_t v7;
  objc_class *v8;
  uint64_t v9;
  objc_class *v10;
  _BYTE *v11;
  objc_super v13;
  _BYTE v14[24];

  v7 = sub_1000C3058();
  v8 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = sub_10006F03C(&qword_10029FFC8);
  v10 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v9, &protocol witness table for String);
  v11 = (char *)self + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_intendedState;
  *v11 = 2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_optInRecords) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_uriToSMT) = v10;
  swift_beginAccess(v11, v14, 1, 0);
  *v11 = 2;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for KTOptIOValidator();
  return -[KTOptIOValidator init](&v13, "init");
}

- (void)setIntendedStateWithState:(BOOL)a3
{
  _BOOL8 v3;
  void (*v4)(_BOOL8);
  _TtC13transparencyd16KTOptIOValidator *v5;

  v3 = a3;
  v4 = *(void (**)(_BOOL8))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v5 = self;
  v4(v3);

}

- (id)evaluateLogDataAndReturnError:(id *)a3
{
  return sub_1000BFAD4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))KTOptIOValidator.evaluateLogData());
}

- (id)evaluateCloudDataAndReturnError:(id *)a3
{
  return sub_1000BFAD4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))KTOptIOValidator.evaluateCloudData());
}

- (id)urisNeedOptInAndReturnError:(id *)a3
{
  _TtC13transparencyd16KTOptIOValidator *v3;
  uint64_t v4;
  Class isa;

  v3 = self;
  v4 = KTOptIOValidator.urisNeedOptIn()();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (_TtC13transparencyd16KTOptIOValidator)init
{
  _TtC13transparencyd16KTOptIOValidator *result;

  result = (_TtC13transparencyd16KTOptIOValidator *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTOptIOValidator", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_optInRecords));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_uriToSMT));
}

@end
