@implementation GKAppMetadataCache

- (GKAppMetadataCache)initWithPlayerID:(id)a3 language:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (GKAppMetadataCache *)sub_1001B842C(v6, v8, v9, v10);
}

- (void)deleteAllWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1002C8070, 32, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  swift_retain(self);
  sub_1001C15C4((uint64_t)&unk_100316DE8, v5);
}

- (GKAppMetadataCache)init
{
  AppMetadataCache.init()((uint64_t)self, (uint64_t)a2);
}

@end
