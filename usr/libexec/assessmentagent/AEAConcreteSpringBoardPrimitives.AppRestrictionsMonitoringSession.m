@implementation AEAConcreteSpringBoardPrimitives.AppRestrictionsMonitoringSession

- (void)dealloc
{
  _TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession *v2;

  v2 = self;
  sub_10001E2A4();
}

- (void).cxx_destruct
{
  sub_100008370(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession_invalidationHandler), *(_QWORD *)&self->invalidationHandler[OBJC_IVAR____TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession_invalidationHandler]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession_monitoringAssertion));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession_streamMulticaster));
}

- (void)cancel
{
  _TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession *v2;

  v2 = self;
  sub_10001E528();

}

- (void)monitorDidUpdateApplicationRestrictionState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004D20(&qword_1000907A0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  v11 = objc_msgSend(v9, "allowedBundleIdentifiers");
  v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  v14 = v12;
  CATAsyncStreamMulticaster.yield(_:)(&v14);
  swift_bridgeObjectRelease(v12);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)monitorDidLoseConnection
{
  _TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession *v2;

  v2 = self;
  sub_10001E6B0();

}

- (_TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession)init
{
  _TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession *result;

  result = (_TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession *)_swift_stdlib_reportUnimplementedInitializer("assessmentagent.AppRestrictionsMonitoringSession", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
