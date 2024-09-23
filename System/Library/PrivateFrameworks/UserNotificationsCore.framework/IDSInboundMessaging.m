@implementation IDSInboundMessaging

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC21UserNotificationsCore19IDSInboundMessaging *v8;

  if (a4)
    v6 = sub_249B027F4();
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  sub_249AD0200(v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _TtC21UserNotificationsCore19IDSInboundMessaging *v18;

  v8 = a6;
  if (!a5)
  {
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = sub_249B024D0();
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v13 = sub_249B0253C();
  v8 = v14;
LABEL_6:
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = self;
  sub_249AD0350(v12, v13, (unint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC21UserNotificationsCore19IDSInboundMessaging)init
{
  _TtC21UserNotificationsCore19IDSInboundMessaging *result;

  result = (_TtC21UserNotificationsCore19IDSInboundMessaging *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore19IDSInboundMessaging_payloadConsumer);
  swift_unknownObjectRelease();

}

@end
