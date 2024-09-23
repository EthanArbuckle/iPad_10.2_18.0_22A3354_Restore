@implementation SiriMailComposeCoordinator

- (void)setSubject:(id)a3
{
  id v4;
  _TtC10MobileMail26SiriMailComposeCoordinator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  sub_100361FEC(v6, v7);
  swift_bridgeObjectRelease(v8);

}

- (void)setBody:(id)a3
{
  id v4;
  _TtC10MobileMail26SiriMailComposeCoordinator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  sub_100362970(v6, v7);
  swift_bridgeObjectRelease(v8);

}

- (void)setSignature:(id)a3
{
  id v4;
  _TtC10MobileMail26SiriMailComposeCoordinator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  sub_1003632B4(v6, v7);
  swift_bridgeObjectRelease(v8);

}

- (void)setToRecipients:(id)a3
{
  id v4;
  _TtC10MobileMail26SiriMailComposeCoordinator *v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = self;
  v6 = sub_100367F84();
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  sub_100363B0C(v7);
  swift_bridgeObjectRelease(v7);

}

- (void)setCcRecipients:(id)a3
{
  id v4;
  _TtC10MobileMail26SiriMailComposeCoordinator *v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = self;
  v6 = sub_100367F84();
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  sub_1003644E8(v7);
  swift_bridgeObjectRelease(v7);

}

- (void)setBccRecipients:(id)a3
{
  id v4;
  _TtC10MobileMail26SiriMailComposeCoordinator *v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = self;
  v6 = sub_100367F84();
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  sub_100364DD4(v7);
  swift_bridgeObjectRelease(v7);

}

- (void)setFocusedField:(id)a3
{
  id v4;
  _TtC10MobileMail26SiriMailComposeCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1003656C0(a3);

}

- (void)setState:(id)a3
{
  id v4;
  _TtC10MobileMail26SiriMailComposeCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100365FD8(a3);

}

- (void)onHostAction:(id)a3
{
  id v4;
  _TtC10MobileMail26SiriMailComposeCoordinator *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC10MobileMail26SiriMailComposeCoordinator *v11;

  v11 = self;
  v10 = a3;
  v9 = type metadata accessor for Notification(0, a2);
  v7 = *(_QWORD *)(v9 - 8);
  v6 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (uint64_t)&v6 - v6;
  v4 = (id)__chkstk_darwin(v10);
  v5 = self;
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(v10);
  sub_100366B30(v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);

}

- (_TtC10MobileMail26SiriMailComposeCoordinator)init
{
  return (_TtC10MobileMail26SiriMailComposeCoordinator *)sub_1003670A0();
}

- (void).cxx_destruct
{
  sub_1003615F8((uint64_t)self + OBJC_IVAR____TtC10MobileMail26SiriMailComposeCoordinator_parent);
  sub_1001F0D3C((uint64_t)self + OBJC_IVAR____TtC10MobileMail26SiriMailComposeCoordinator_bodyWithoutSignature);
  sub_1001F0D3C((uint64_t)self + OBJC_IVAR____TtC10MobileMail26SiriMailComposeCoordinator_signature);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC10MobileMail26SiriMailComposeCoordinator_controller);
}

@end
