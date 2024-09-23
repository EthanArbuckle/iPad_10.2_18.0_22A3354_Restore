@implementation DriverKitDaemonXPCRequestDelegate

- (void)dumpStateWithReplyBlock:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10014A090, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  swift_retain(self);
  sub_100081B18((uint64_t)sub_100086000, v5);
  swift_release(self);
  swift_release(v5);
}

- (void)getApprovalStateForSettingsWithReplyBlock:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = swift_retain(self);
  sub_10008474C(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
  swift_release(self);
}

- (void)enqueueApprovalStateUpdateWithEntry:(id)a3 replyBlock:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v6 = _Block_copy(a4);
  v7 = a3;
  swift_retain(self);
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  _Block_copy(v6);
  sub_100084C24(v8, v10, (uint64_t)self, v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_100011F40(v8, v10);
  swift_release(self);
}

- (void)launchDriverWithBundleID:(id)a3 userServerName:(id)a4 tag:(id)a5 replyBlock:(id)a6
{
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v10 = _Block_copy(a6);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;
  if (a5)
  {
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v18;
  }
  else
  {
    v17 = 0;
  }
  _Block_copy(v10);
  swift_retain(self);
  sub_100084F64(v11, v13, v14, v16, v17, (unint64_t)a5, (uint64_t)self, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);
  swift_release(self);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(a5);
}

@end
