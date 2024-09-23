@implementation SNNetworkManagerInternal

+ (SNNetworkManagerInternal)shared
{
  return (SNNetworkManagerInternal *)static NetworkManager.shared.getter();
}

- (void)dealloc
{
  SNNetworkManagerInternal *v2;

  v2 = self;
  NetworkManager.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0(OBJC_IVAR___SNNetworkManagerInternal_coreTelephonyClient);
  OUTLINED_FUNCTION_2_0(OBJC_IVAR___SNNetworkManagerInternal_dataServiceDescriptor);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_1();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_2_0(OBJC_IVAR___SNNetworkManagerInternal_queue);
  OUTLINED_FUNCTION_2_0(OBJC_IVAR___SNNetworkManagerInternal_networkWiFiManager);
  swift_release();

}

- (SNNetworkManagerInternal)init
{
  NetworkManager.init()();
}

- (void)registerClient
{
  SNNetworkManagerInternal *v2;

  v2 = self;
  NetworkManager.registerClient()();

}

- (void)unregisterClient
{
  SNNetworkManagerInternal *v2;

  v2 = self;
  NetworkManager.unregisterClient()();

}

- (void)resetLinkRecommendationInfo
{
  SNNetworkManagerInternal *v2;

  v2 = self;
  NetworkManager.resetLinkRecommendationInfo()();

}

- (void)getSNProximityLinkRecommendationWithRetry:(BOOL)a3 completion:(id)a4
{
  void *v6;

  v6 = _Block_copy(a4);
  if (v6)
    *(_QWORD *)(swift_allocObject() + 16) = v6;
  self;
  NetworkManager.getSNProximityLinkRecommendation(retry:completion:)(a3);
}

- (void)getSNLinkRecommendationMetrics:(id)a3
{
  void *v4;

  v4 = _Block_copy(a3);
  if (v4)
    *(_QWORD *)(swift_allocObject() + 16) = v4;
  self;
  NetworkManager.getSNLinkRecommendationMetrics(_:)();
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4;
  SNNetworkManagerInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkManager.preferredDataSimChanged(_:)(v4);

}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  SNNetworkManagerInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkManager.carrierBundleChange(_:)(v4);

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  SNNetworkManagerInternal *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = a3;
  v10 = self;
  NetworkManager.simStatusDidChange(_:status:)(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  SNNetworkManagerInternal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  NetworkManager.signalStrengthChanged(_:info:)(v6);

}

- (void)acquireWiFiAssertionWithWifiAssertionTypeRawValue:(int64_t)a3
{
  self;
  NetworkManager.acquireWiFiAssertion(wifiAssertionTypeRawValue:)(a3);
}

- (void)releaseWiFiAssertion
{
  self;
  NetworkManager.releaseWiFiAssertion()();
}

- (void)updateNetworkPerformanceFeed
{
  SNNetworkManagerInternal *v2;

  v2 = self;
  NetworkManager.updateNetworkPerformanceFeed()();

}

- (int64_t)networkQualityWithNetworkType:(int64_t)a3
{
  SNNetworkManagerInternal *v4;
  int64_t v5;

  v4 = self;
  v5 = NetworkManager.networkQuality(networkType:)(a3);

  return v5;
}

- (void)addObserver:(id)a3
{
  @objc NetworkManager.addObserver(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))NetworkManager.addObserver(_:));
}

- (void)removeObserver:(id)a3
{
  @objc NetworkManager.addObserver(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))NetworkManager.removeObserver(_:));
}

- (void)startMonitoringNetwork:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  SNNetworkManagerInternal *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  NetworkManager.startMonitoringNetwork(_:)(v8);
}

- (void)stopMonitoringNetwork
{
  SNNetworkManagerInternal *v2;

  v2 = self;
  NetworkManager.stopMonitoringNetwork()();

}

- (void)forceFastDormancy
{
  SNNetworkManagerInternal *v2;

  v2 = self;
  NetworkManager.forceFastDormancy()();

}

+ (void)acquireDormancySuspendAssertion:(id *)a3
{
  static NetworkManager.acquireDormancySuspendAssertion(_:)(a3);
}

+ (void)releaseDormancySuspendAssertion:(id *)a3
{
  static NetworkManager.releaseDormancySuspendAssertion(_:)(a3);
}

@end
