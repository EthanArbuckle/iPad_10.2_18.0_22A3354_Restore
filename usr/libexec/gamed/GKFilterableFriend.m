@implementation GKFilterableFriend

- (NSString)playerID
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t v5;

  sub_100160FCC();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3, v5);
  return (NSString *)v4;
}

- (BOOL)friendBiDirectional
{
  return sub_100161024() & 1;
}

- (BOOL)friendPlayedWith
{
  return sub_100161058() & 1;
}

- (_TtC14GameDaemonCore18GKFilterableFriend)initWithPlayerID:(id)a3 friendBiDirectional:(BOOL)a4 friendPlayedWith:(BOOL)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC14GameDaemonCore18GKFilterableFriend *)sub_1001610B0();
}

- (_TtC14GameDaemonCore18GKFilterableFriend)initWithCacheObject:(id)a3
{
  return (_TtC14GameDaemonCore18GKFilterableFriend *)sub_100161168(a3);
}

- (_TtC14GameDaemonCore18GKFilterableFriend)init
{
  sub_100161220();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->playerID[OBJC_IVAR____TtC14GameDaemonCore18GKFilterableFriend_playerID], a2);
}

@end
