@implementation GKLeaderboardChallengeBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)handleAction:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  GKLeaderboardChallengeBulletin *v6;
  uint64_t v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = self;
  sub_1001BE82C();

  swift_bridgeObjectRelease(v5, v7);
}

+ (BOOL)shouldProcessNotification
{
  swift_getObjCClassMetadata(a1);
  return sub_1001BEA98() & 1;
}

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
  sub_1001BEB3C(v7, ObjCClassMetadata, v6);
  _Block_release(v6);
  swift_bridgeObjectRelease(v7, v9);
}

- (GKLeaderboardChallengeBulletin)initWithPushNotification:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v3 = 0;
  return (GKLeaderboardChallengeBulletin *)sub_1001C075C(v3);
}

- (GKLeaderboardChallengeBulletin)init
{
  return (GKLeaderboardChallengeBulletin *)sub_1001C0898();
}

- (GKLeaderboardChallengeBulletin)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (GKLeaderboardChallengeBulletin *)sub_1001C08E8();
}

@end
