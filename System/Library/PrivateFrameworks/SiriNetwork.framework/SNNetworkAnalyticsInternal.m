@implementation SNNetworkAnalyticsInternal

+ (SNNetworkAnalyticsInternal)sharedNetworkAnalytics
{
  return (SNNetworkAnalyticsInternal *)static NetworkAnalytics.sharedNetworkAnalytics.getter();
}

- (void)reset
{
  self;
  NetworkAnalytics.reset()();
}

- (void)resetNetId
{
  self;
  NetworkAnalytics.resetNetId()();
}

- (void)setNetId:(id)a3
{
  @objc NetworkAnalytics.setNetId(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))NetworkAnalytics.setNetId(_:));
}

- (id)getNetId
{
  return @objc NetworkAnalytics.getNetId()(self, (uint64_t)a2, NetworkAnalytics.getNetId());
}

- (void)setNetworkConnectionId:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  SNNetworkAnalyticsInternal *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = type metadata accessor for UUID();
    v9 = 0;
  }
  else
  {
    v8 = type metadata accessor for UUID();
    v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  NetworkAnalytics.setNetworkConnectionId(_:)();
}

- (void)setConnectionProvider:(id)a3
{
  @objc NetworkAnalytics.setNetId(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))NetworkAnalytics.setConnectionProvider(_:));
}

- (unsigned)getSequenceNumber
{
  SNNetworkAnalyticsInternal *v2;
  Swift::UInt32 v3;

  v2 = self;
  v3 = NetworkAnalytics.getSequenceNumber()();

  return v3;
}

- (void)setIsConnectionActive:(BOOL)a3
{
  self;
  NetworkAnalytics.setIsConnectionActive(_:)(a3);
}

- (BOOL)getIsConnectionActive
{
  SNNetworkAnalyticsInternal *v2;
  Swift::Bool IsConnection;

  v2 = self;
  IsConnection = NetworkAnalytics.getIsConnectionActive()();

  return IsConnection;
}

- (void)setNetIdAvailable:(BOOL)a3
{
  self;
  NetworkAnalytics.setNetIdAvailable(_:)(a3);
}

- (BOOL)isNetIdAvailable
{
  SNNetworkAnalyticsInternal *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = NetworkAnalytics.isNetIdAvailable()();

  return v3;
}

- (void)increaseSequenceNumber
{
  self;
  NetworkAnalytics.increaseSequenceNumber()();
}

- (void)resetSequenceNumber
{
  self;
  NetworkAnalytics.resetSequenceNumber()();
}

- (void)setOrchestatorRequestId:(id)a3
{
  @objc NetworkAnalytics.setNetId(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))NetworkAnalytics.setOrchestatorRequestId(_:));
}

- (id)getOrchestratorRequestId
{
  return @objc NetworkAnalytics.getNetId()(self, (uint64_t)a2, NetworkAnalytics.getOrchestratorRequestId());
}

- (BOOL)emitLogDebug
{
  SNNetworkAnalyticsInternal *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = NetworkAnalytics.emitLogDebug()();

  return v3;
}

- (void)logRequestLinkBetweenOrchestratorAndNetworkComponent
{
  self;
  NetworkAnalytics.logRequestLinkBetweenOrchestratorAndNetworkComponent()();
}

- (void)logSessionConnectionHttpHeaderCreated:(id)a3
{
  id v4;
  SNNetworkAnalyticsInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkAnalytics.logSessionConnectionHttpHeaderCreated(_:)();

}

- (void)logNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4;
  SNNetworkAnalyticsInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkAnalytics.logNetworkConnectionStatePreparationSnapshotCaptured(_:)();

}

- (void)logDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4;
  SNNetworkAnalyticsInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkAnalytics.logDebugNetworkConnectionStatePreparationSnapshotCaptured(_:)();

}

- (void)logNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4;
  SNNetworkAnalyticsInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkAnalytics.logNetworkConnectionStateReadySnapshotCaptured(_:)();

}

- (void)logDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4;
  SNNetworkAnalyticsInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkAnalytics.logDebugNetworkConnectionStateReadySnapshotCaptured(_:)();

}

- (void)logSessionConnectionSnapshotCaptured:(id)a3
{
  id v4;
  SNNetworkAnalyticsInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkAnalytics.logSessionConnectionSnapshotCaptured(_:)();

}

- (void)logDebugSessionConnectionSnapshotCaptured:(id)a3
{
  id v4;
  SNNetworkAnalyticsInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkAnalytics.logDebugSessionConnectionSnapshotCaptured(_:)();

}

- (void)logSessionConnectionFailed:(id)a3
{
  id v4;
  SNNetworkAnalyticsInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkAnalytics.logSessionConnectionFailed(_:)();

}

- (void)logPeerConnectionFailed:(id)a3
{
  id v4;
  SNNetworkAnalyticsInternal *v5;

  v4 = a3;
  v5 = self;
  NetworkAnalytics.logPeerConnectionFailed(_:)();

}

- (SNNetworkAnalyticsInternal)init
{
  NetworkAnalytics.init()();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_25_4((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_netId);
  OUTLINED_FUNCTION_25_4((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_networkConnectionId);
  OUTLINED_FUNCTION_25_4((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_orchestratorRequestId);
  OUTLINED_FUNCTION_25_4((uint64_t)self + OBJC_IVAR___SNNetworkAnalyticsInternal_netIdForRequestLink);
  OUTLINED_FUNCTION_29_2(OBJC_IVAR___SNNetworkAnalyticsInternal_httpHeaderEvent);
  OUTLINED_FUNCTION_29_2(OBJC_IVAR___SNNetworkAnalyticsInternal_preparationSnapshotEvent);
  OUTLINED_FUNCTION_29_2(OBJC_IVAR___SNNetworkAnalyticsInternal_debugPreparationSnapshotEvent);
  OUTLINED_FUNCTION_29_2(OBJC_IVAR___SNNetworkAnalyticsInternal_readySnapshotEvent);
  OUTLINED_FUNCTION_29_2(OBJC_IVAR___SNNetworkAnalyticsInternal_debugReadySnapshotEvent);
  OUTLINED_FUNCTION_29_2(OBJC_IVAR___SNNetworkAnalyticsInternal_sessionConnectionSnapthotEvent);
  OUTLINED_FUNCTION_29_2(OBJC_IVAR___SNNetworkAnalyticsInternal_debugSessionConnectionSnapthotEvent);
  OUTLINED_FUNCTION_29_2(OBJC_IVAR___SNNetworkAnalyticsInternal_sessionConnectionFailedEvent);
  OUTLINED_FUNCTION_29_2(OBJC_IVAR___SNNetworkAnalyticsInternal_peerConnectionFailedEvent);
  swift_unknownObjectRelease();
}

+ (id)netSessionConnectionFailedWithError:(id)a3 connectionMode:(id)a4 sessionType:(id)a5 sessionState:(id)a6 isDormant:(BOOL)a7 snConnectionAnalysisInfo:(id)a8
{
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  _BOOL4 v23;

  v23 = a7;
  v10 = a5;
  if (a4)
  {
    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v12;
    if (v10)
      goto LABEL_3;
LABEL_6:
    v14 = 0;
    if (a6)
      goto LABEL_4;
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v22 = 0;
  v13 = 0;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v15;
  if (!a6)
    goto LABEL_7;
LABEL_4:
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a6 = v17;
LABEL_8:
  swift_getObjCClassMetadata();
  v18 = a3;
  v19 = a8;
  v20 = (void *)static NetworkAnalytics.netSessionConnectionFailed(error:connectionMode:sessionType:sessionState:isDormant:snConnectionAnalysisInfo:)(a3, v22, v13, v14, (uint64_t)v10, v16, (uint64_t)a6, v23, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

+ (int)netConnectionModeFrom:(id)a3
{
  int v3;
  int v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static NetworkAnalytics.netConnectionMode(from:)();
  v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

+ (int)netSessionTypeFrom:(id)a3
{
  int v3;
  int v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static NetworkAnalytics.netSessionType(from:)();
  v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

+ (int)netSessionStateFrom:(id)a3
{
  int v3;
  int v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static NetworkAnalytics.netSessionState(from:)();
  v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

+ (int)netEndpointTypeFrom:(unsigned int)a3
{
  return static NetworkAnalytics.netEndpointType(from:)(a3);
}

+ (id)netEndpointFromDictionary:(id)a3
{
  void *v3;

  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = (void *)static NetworkAnalytics.netEndpointFromDictionary(_:)();
  swift_bridgeObjectRelease();
  return v3;
}

@end
