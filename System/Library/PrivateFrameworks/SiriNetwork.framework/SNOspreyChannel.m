@implementation SNOspreyChannel

- (NSString)description
{
  SNOspreyChannel *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = SiriNetworkOspreyChannel.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x24956D034](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (id)bidirectionalStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SNOspreyChannel *v18;
  id v19;

  v9 = _Block_copy(a4);
  v10 = _Block_copy(a5);
  v11 = _Block_copy(a6);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  if (v9)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v9;
    v9 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ();
  }
  else
  {
    v15 = 0;
  }
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v10;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v11;
  v18 = self;
  v19 = SiriNetworkOspreyChannel.bidirectionalStreamingRequest(withMethodName:requestBuilder:streamingResponseHandler:completion:)(v12, v14, (uint64_t)v9, v15, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSData) -> (), v16, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), v17);
  swift_release();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v9);

  swift_bridgeObjectRelease();
  return v19;
}

- (SNOspreyChannel)initWithURL:(id)a3 configuration:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v11;

  v5 = type metadata accessor for URL();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = a4;
  return (SNOspreyChannel *)SiriNetworkOspreyChannel.init(url:configuration:)((uint64_t)v7, v8, v9);
}

- (SNOspreyChannel)initWithURL:(id)a3 configuration:(id)a4 useCache:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v5 = a5;
  v7 = type metadata accessor for URL();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (SNOspreyChannel *)SiriNetworkOspreyChannel.init(url:configuration:useCache:)((uint64_t)v9, a4, v5);
}

- (SNOspreyChannel)init
{
  uint64_t v2;

  return (SNOspreyChannel *)SiriNetworkOspreyChannel.init()((uint64_t)self, (uint64_t)a2, v2);
}

- (void).cxx_destruct
{
  _BYTE v3[520];
  _BYTE v4[1440];

  outlined init with take of ConnectionSnapshotReport?((uint64_t)self + OBJC_IVAR___SNOspreyChannel_connectionConfiguration, (uint64_t)v3, &demangling cache variable for type metadata for ConnectionConfiguration?);
  outlined release of ConnectionConfiguration?((uint64_t)v3);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_18_2(OBJC_IVAR___SNOspreyChannel_ospreyRequestBuilder);
  OUTLINED_FUNCTION_18_2(OBJC_IVAR___SNOspreyChannel_ospreyConnectionMetrics);
  outlined init with take of ConnectionSnapshotReport?((uint64_t)self + OBJC_IVAR___SNOspreyChannel_connectionMetrics, (uint64_t)v4, (uint64_t *)&demangling cache variable for type metadata for ConnectionMetrics?);
  outlined release of ConnectionMetrics?(v4, outlined consume of ConnectionMetrics?);

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_1();
}

@end
