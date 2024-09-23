@implementation SNNetworkWiFiManagerInternal

- (BOOL)registerOneShotPowerStateDidChangeForWiFiInterface:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  SNNetworkWiFiManagerInternal *v8;
  BOOL v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  v9 = NetworkWiFiManager.registerOneShotPowerStateDidChangeForWiFiInterface(_:)((uint64_t)v7, v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v7);

  return v9;
}

- (void)powerStateDidChangeForWiFiInterfaceWithName:(id)a3
{
  Swift::String v4;
  void *countAndFlagsBits;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4._countAndFlagsBits = (uint64_t)self;
  countAndFlagsBits = (void *)v4._countAndFlagsBits;
  NetworkWiFiManager.powerStateDidChangeForWiFiInterface(withName:)(v4);

  swift_bridgeObjectRelease();
}

+ (SNNetworkWiFiManagerInternal)shared
{
  return (SNNetworkWiFiManagerInternal *)static NetworkWiFiManager.shared.getter();
}

- (SNNetworkWiFiManagerInternal)init
{
  return (SNNetworkWiFiManagerInternal *)NetworkWiFiManager.init()();
}

- (void)dealloc
{
  SNNetworkWiFiManagerInternal *v2;

  v2 = self;
  NetworkWiFiManager.__deallocating_deinit();
}

- (void).cxx_destruct
{

}

- (id)getWiFiRecordRepresentation
{
  SNNetworkWiFiManagerInternal *v2;
  id v3;

  v2 = self;
  v3 = NetworkWiFiManager.getWiFiRecordRepresentation()();

  return v3;
}

- (BOOL)isWiFiEnabled
{
  SNNetworkWiFiManagerInternal *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = NetworkWiFiManager.isWiFiEnabled()();

  return v3;
}

- (void)acquireWiFiAssertionWithWifiAssertionTypeRawValue:(int64_t)a3
{
  SNNetworkWiFiManagerInternal *v4;

  v4 = self;
  NetworkWiFiManager.acquireWiFiAssertion(wifiAssertionTypeRawValue:)(a3);

}

- (void)releaseWiFiAssertion
{
  SNNetworkWiFiManagerInternal *v2;

  v2 = self;
  NetworkWiFiManager.releaseWiFiAssertion()();

}

@end
