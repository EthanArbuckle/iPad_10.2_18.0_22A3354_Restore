@implementation GKScopedIDsBatchRequest

- (NSArray)playerIDs
{
  return (NSArray *)sub_100170FA4((uint64_t)self, (uint64_t)a2, (void (*)(void))ScopedIDsBatchRequest.playerIDs.getter);
}

- (NSArray)gameBundleIDs
{
  return (NSArray *)sub_100170FA4((uint64_t)self, (uint64_t)a2, (void (*)(void))ScopedIDsBatchRequest.gameBundleIDs.getter);
}

- (GKScopedIDsBatchRequest)init
{
  ScopedIDsBatchRequest.init()();
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKScopedIDsBatchRequest_playerIDs), a2);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKScopedIDsBatchRequest_gameBundleIDs), v3);
}

@end
