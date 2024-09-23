@implementation GKMatchReporter

+ (GKMatchReporter)shared
{
  return (GKMatchReporter *)static MatchReporter.shared.getter();
}

- (GKMatchReporter)init
{
  return (GKMatchReporter *)sub_1001B3B9C();
}

- (void)recordMatchStartWithType:(id)a3 minPlayers:(id)a4 maxPlayers:(id)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  GKMatchReporter *v13;
  Swift::String v14;
  uint64_t v15;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14._countAndFlagsBits = v8;
  v14._object = v10;
  MatchReporter.recordMatchStart(type:minPlayers:maxPlayers:)(v14, (NSNumber)v11, (NSNumber)v12);

  swift_bridgeObjectRelease(v10, v15);
}

- (void)recordMatchServerWithType:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  GKMatchReporter *v7;
  Swift::String v8;
  uint64_t v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  MatchReporter.recordMatchServer(type:)(v8);

  swift_bridgeObjectRelease(v6, v9);
}

- (void)recordActiveDevicesWithCount:(id)a3
{
  id v4;
  GKMatchReporter *v5;

  v4 = a3;
  v5 = self;
  MatchReporter.recordActiveDevices(count:)((NSNumber)v4);

}

- (void)recordSharePlayDevicesWithCount:(id)a3
{
  id v4;
  GKMatchReporter *v5;

  v4 = a3;
  v5 = self;
  MatchReporter.recordSharePlayDevices(count:)((NSNumber)v4);

}

- (void)recordMatchCompleteWithMatchType:(id)a3 result:(id)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  GKMatchReporter *v12;
  uint64_t v13;
  uint64_t v14;

  v8 = _Block_copy(a5);
  if (!a3)
  {
    if (!a4)
      goto LABEL_5;
    goto LABEL_3;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  a3 = v9;
  if (a4)
  {
LABEL_3:
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
LABEL_5:
  v11 = swift_allocObject(&unk_1002C7EC0, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = self;
  MatchReporter.recordMatchComplete(matchType:result:completion:)();

  swift_release(v11);
  swift_bridgeObjectRelease(a4, v13);
  swift_bridgeObjectRelease(a3, v14);
}

- (void)recordGameStart
{
  GKMatchReporter *v2;

  v2 = self;
  MatchReporter.recordGameStart()();

}

- (void)recordGameCompleteWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  GKMatchReporter *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1002C7E98, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  MatchReporter.recordGameComplete(completion:)();

  swift_release(v5);
}

+ (void)onInviteReceivedWithBulletin:(id)a3
{
  id v3;

  v3 = a3;
  static MatchReporter.onInviteReceived(bulletin:)();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKMatchReporter_matchRecording));

}

@end
