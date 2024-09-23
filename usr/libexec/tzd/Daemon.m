@implementation Daemon

- (_TtC3tzd6Daemon)init
{
  _TtC3tzd6Daemon *result;

  sub_100013B5C();
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC3tzd6Daemon *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1000183C8(v7);

  return v9;
}

- (void)isUpdateWaitingWithReply:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(char);
  _TtC3tzd6Daemon *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1000215B8, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100018D88;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_100014F18((uint64_t)v7, v6);
  sub_100018D54((uint64_t)v7, v6);

}

- (void)purgeAllAssetsWithReply:(id)a3
{
  void *v4;
  const void *v5;
  void (*v6)(const void *, uint64_t, _QWORD);
  _TtC3tzd6Daemon *v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = (void (*)(const void *, uint64_t, _QWORD))*((_QWORD *)v4 + 2);
    v7 = self;
    v6(v5, 1, 0);
    _Block_release(v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _TtC3tzd6Daemon *v21;

  if (a5)
  {
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v16 = v15;
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  v17 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a8;
  v21 = self;
  sub_1000186E4(v14, v16, a6, (uint64_t)a7);

  swift_bridgeObjectRelease(v16);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC3tzd6Daemon *v19;

  if (a6)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = self;
  sub_1000188C8(a4, a5, v12, v14);

  swift_bridgeObjectRelease(v14);
}

- (void)handleAssetDetectedMsg:(id)a3
{
  id v4;
  _TtC3tzd6Daemon *v5;

  v4 = a3;
  v5 = self;
  sub_100018A6C(v4);

}

- (void).cxx_destruct
{

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _TtC3tzd6Daemon *v12;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v12 = self;
  v11 = os_transaction_create("com.apple.timezoneupdates.tznotify.rebooting");
  sub_100016B68(v10, (void (**)(_QWORD))v8);
  swift_unknownObjectRelease(v11);
  _Block_release(v8);

}

@end
