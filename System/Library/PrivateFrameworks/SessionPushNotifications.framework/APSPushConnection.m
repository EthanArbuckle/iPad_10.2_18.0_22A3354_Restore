@implementation APSPushConnection

- (_TtC24SessionPushNotifications17APSPushConnection)init
{
  _TtC24SessionPushNotifications17APSPushConnection *result;

  result = (_TtC24SessionPushNotifications17APSPushConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24SessionPushNotifications17APSPushConnection_connection));
  sub_1C12F1778((uint64_t)self + OBJC_IVAR____TtC24SessionPushNotifications17APSPushConnection_delegate);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  _TtC24SessionPushNotifications17APSPushConnection *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC24SessionPushNotifications17APSPushConnection *v13;

  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = a4;
    v9 = sub_1C13083CC();
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v13 = self;
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  sub_1C12F06C8(v9, v11);
  sub_1C12F1688(v9, v11);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtC24SessionPushNotifications17APSPushConnection *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1C12F0958(a4);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
  id v8;
  id v9;
  _TtC24SessionPushNotifications17APSPushConnection *v10;
  id v11;
  NSObject *v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  _TtC24SessionPushNotifications17APSPushConnection *v17;

  if (a4)
  {
    v8 = a3;
    v9 = a5;
    v10 = self;
    v11 = a4;
    v12 = sub_1C13083CC();
    v14 = v13;

  }
  else
  {
    v15 = a3;
    v16 = a5;
    v17 = self;
    v12 = 0;
    v14 = 0xF000000000000000;
  }
  sub_1C12F0C9C(v12, v14, a5);
  sub_1C12F1688((uint64_t)v12, v14);

}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  unint64_t v4;
  id v7;
  _TtC24SessionPushNotifications17APSPushConnection *v8;

  v4 = (unint64_t)a4;
  if (a4)
  {
    sub_1C12F173C();
    v4 = sub_1C13088AC();
  }
  v7 = a3;
  v8 = self;
  sub_1C12F111C(v4);

  swift_bridgeObjectRelease();
}

@end
