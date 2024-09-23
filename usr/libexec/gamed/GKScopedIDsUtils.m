@implementation GKScopedIDsUtils

+ (id)filterUnsupportedGameBundleIDs:(id)a3
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  Class isa;
  uint64_t v7;

  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v4 = static ScopedIDsUtils.filterUnsupportedGameBundleIDs(_:)(v3);
  swift_bridgeObjectRelease(v3, v5);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4, v7);
  return isa;
}

+ (id)batchRequestWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4 desiredSize:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v13;

  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v9 = static ScopedIDsUtils.batchRequest(playerIDs:gameBundleIDs:desiredSize:)(v7, v8, a5);
  swift_bridgeObjectRelease(v7, v10);
  swift_bridgeObjectRelease(v8, v11);
  type metadata accessor for ScopedIDsBatchRequest();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9, v13);
  return isa;
}

+ (id)incompletePlayerIDs:(id)a3 gameBundleIDs:(id)a4 scopedIDs:(id)a5
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  uint64_t v16;

  v7 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v9 = sub_10016CBB4(0, &qword_100315020, GKScopedIDs_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v9);
  v11 = static ScopedIDsUtils.incomplete(playerIDs:gameBundleIDs:scopedIDs:)(v7, v8, v10);
  swift_bridgeObjectRelease(v7, v12);
  swift_bridgeObjectRelease(v8, v13);
  swift_bridgeObjectRelease(v10, v14);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11, v16);
  return isa;
}

+ (id)mergeWithScopedIDs:(id)a3 with:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v13;

  v6 = sub_10016CBB4(0, &qword_100315020, GKScopedIDs_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v6);
  v9 = static ScopedIDsUtils.merge(scopedIDs:with:)(v7, v8);
  swift_bridgeObjectRelease(v7, v10);
  swift_bridgeObjectRelease(v8, v11);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9, v13);
  return isa;
}

- (GKScopedIDsUtils)init
{
  return (GKScopedIDsUtils *)ScopedIDsUtils.init()();
}

@end
