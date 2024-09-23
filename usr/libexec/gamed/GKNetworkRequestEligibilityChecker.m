@implementation GKNetworkRequestEligibilityChecker

- (GKNetworkRequestEligibilityChecker)initWithHasAcknowledgedLatestGDPR:(BOOL)a3 alwaysAllowedBagKeysObject:(id)a4 isAppUnlistedAndDisallowed:(BOOL)a5
{
  uint64_t v7;
  _OWORD v9[2];

  if (a4)
  {
    v7 = swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)(v9, v7);
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  return (GKNetworkRequestEligibilityChecker *)NetworkRequestEligibiltyChecker.init(hasAcknowledgedLatestGDPR:alwaysAllowedBagKeysObject:isAppUnlistedAndDisallowed:)(a3, (uint64_t)v9, a5);
}

- (id)verifyEligibilityWithBagKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  GKNetworkRequestEligibilityChecker *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = NetworkRequestEligibiltyChecker.verifyEligibility(bagKey:)(v4, v6);

  swift_bridgeObjectRelease(v6, v9);
  if (v8)
  {
    v10 = (void *)_convertErrorToNSError(_:)(v8);
    swift_errorRelease(v8);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (GKNetworkRequestEligibilityChecker)init
{
  NetworkRequestEligibiltyChecker.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKNetworkRequestEligibilityChecker_alwaysAllowedBagKeys), a2);
}

@end
