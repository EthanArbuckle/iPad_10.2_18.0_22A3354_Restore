@implementation InheritanceMessageProcessor

- (void)messageService:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _TtC13appleaccountd27InheritanceMessageProcessor *v17;

  swift_unknownObjectRetain(a3);
  v9 = a4;
  v10 = a5;
  v17 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v16 = v15;

  sub_1001AC6BC(v11, v13, v14, v16);
  swift_bridgeObjectRelease(v16);
  sub_10000F494(v11, v13);
  swift_unknownObjectRelease(a3);

}

- (_TtC13appleaccountd27InheritanceMessageProcessor)init
{
  _TtC13appleaccountd27InheritanceMessageProcessor *result;

  result = (_TtC13appleaccountd27InheritanceMessageProcessor *)_swift_stdlib_reportUnimplementedInitializer("appleaccountd.InheritanceMessageProcessor", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_accountStore));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_invitationHandler));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_invitationResponseHandler));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_accessKeyMessageHandler));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd27InheritanceMessageProcessor_beneficiaryRemovedMessageHandler));
}

@end
