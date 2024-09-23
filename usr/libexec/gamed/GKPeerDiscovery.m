@implementation GKPeerDiscovery

- (GKPeerDiscovery)initWithDelegate:(id)a3 localPlayerID:(id)a4 localPushToken:(id)a5
{
  id v6;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  swift_unknownObjectRetain();
  v6 = a5;
  static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);

  return (GKPeerDiscovery *)PeerDiscovery.init(delegate:localPlayerID:localPushToken:)();
}

- (void)startBrowsingWithCompletionHandler:(id)a3
{
  sub_100178A2C((uint64_t)self, (int)a2, a3, (uint64_t)&unk_1002C5DE8);
}

- (void)stopBrowsingWithCompletionHandler:(id)a3
{
  sub_100178A2C((uint64_t)self, (int)a2, a3, (uint64_t)&unk_1002C5DC0);
}

- (void)startListening:(NSDictionary *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSDictionary *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject(&unk_1002C5D98, 40, 7);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  swift_retain(self);
  sub_1001C15C4((uint64_t)&unk_100315138, (uint64_t)v7);
}

- (void)stopListeningWithCompletionHandler:(id)a3
{
  sub_100178A2C((uint64_t)self, (int)a2, a3, (uint64_t)&unk_1002C5D70);
}

- (void)sendDataToParticipant:(NSString *)a3 deviceID:(NSString *)a4 data:(NSData *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSString *v12;
  NSString *v13;
  NSData *v14;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject(&unk_1002C5D48, 56, 7);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  swift_retain(self);
  sub_1001C15C4((uint64_t)&unk_100315118, (uint64_t)v11);
}

- (GKPeerDiscovery)init
{
  PeerDiscovery.init()();
}

@end
