@implementation CustodianMessageProcessor

- (void)messageService:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC13appleaccountd25CustodianMessageProcessor *v16;

  swift_unknownObjectRetain(a3);
  v9 = a4;
  v10 = a5;
  v16 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;

  static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v15 = v14;

  sub_10009E7A0(v11, v13);
  swift_bridgeObjectRelease(v15);
  sub_10000F494(v11, v13);
  swift_unknownObjectRelease(a3);

}

- (_TtC13appleaccountd25CustodianMessageProcessor)init
{
  _TtC13appleaccountd25CustodianMessageProcessor *result;

  result = (_TtC13appleaccountd25CustodianMessageProcessor *)_swift_stdlib_reportUnimplementedInitializer("appleaccountd.CustodianMessageProcessor", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_accountStore));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_invitationHandler));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_invitationResponseHandler));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_shareHandler));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_setupFinalizationHandler));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd25CustodianMessageProcessor_custodianRemovedHandler));
}

@end
