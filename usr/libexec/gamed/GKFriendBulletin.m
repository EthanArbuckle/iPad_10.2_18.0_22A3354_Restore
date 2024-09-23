@implementation GKFriendBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t ObjCClassMetadata;
  uint64_t v9;

  v6 = _Block_copy(a4);
  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  _Block_copy(v6);
  sub_1001817BC(v7, ObjCClassMetadata, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  swift_bridgeObjectRelease(v7, v9);
}

- (void)handleAction:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  GKFriendBulletin *v7;
  uint64_t v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10018339C(v4, v6);

  swift_bridgeObjectRelease(v6, v8);
}

- (GKFriendBulletin)initWithPushNotification:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v3 = 0;
  return (GKFriendBulletin *)sub_1001839F0(v3);
}

- (GKFriendBulletin)init
{
  return (GKFriendBulletin *)sub_100183AD0();
}

- (GKFriendBulletin)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (GKFriendBulletin *)sub_100183B20();
}

@end
