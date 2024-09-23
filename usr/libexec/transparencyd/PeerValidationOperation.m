@implementation PeerValidationOperation

- (NSDictionary)result
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_result);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_result, v6, 0, 0);
  v3 = *v2;
  sub_10006D6DC(0, &qword_10029FDF0, KTVerifierResult_ptr);
  swift_bridgeObjectRetain(v3);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)setResult:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v5 = sub_10006D6DC(0, &qword_10029FDF0, KTVerifierResult_ptr);
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, v5, &protocol witness table for String);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_result);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (_TtC13transparencyd23PeerValidationOperation)initWithDeps:(id)a3 application:(id)a4 uris:(id)a5 logClient:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC13transparencyd23PeerValidationOperation *v14;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  v13 = a3;
  swift_unknownObjectRetain(a6);
  v14 = (_TtC13transparencyd23PeerValidationOperation *)sub_10009A21C(v13, v9, v11, v12, (uint64_t)a6);

  swift_unknownObjectRelease(a6);
  return v14;
}

- (void)groupStart
{
  _TtC13transparencyd23PeerValidationOperation *v2;

  v2 = self;
  PeerValidationOperation.groupStart()();

}

- (_TtC13transparencyd23PeerValidationOperation)init
{
  _TtC13transparencyd23PeerValidationOperation *result;

  result = (_TtC13transparencyd23PeerValidationOperation *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.PeerValidationOperation", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_deps));
  swift_bridgeObjectRelease(*(_QWORD *)(&self->super.super._timeoutCanOccur
                                      + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_application));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_uris));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_verifierInfo));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_verifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_completeOp));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_logClient));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_peerValidateQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd23PeerValidationOperation_result));
}

@end
