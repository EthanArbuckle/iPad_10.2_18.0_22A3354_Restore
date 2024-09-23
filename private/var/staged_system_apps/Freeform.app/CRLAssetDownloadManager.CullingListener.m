@implementation CRLAssetDownloadManager.CullingListener

- (void)willCullAssets:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = type metadata accessor for CRLAsset();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_retain(self);
  sub_1005D1D9C(v6);
  swift_bridgeObjectRelease(v6);
  swift_release(self);
}

- (double)willCloseContainerForAssets:(uint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  double result;

  v5 = type metadata accessor for CRLAsset();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_retain(a1);
  sub_1005D1D9C(v6);
  swift_bridgeObjectRelease(v6);
  *(_QWORD *)&result = swift_release(a1).n128_u64[0];
  return result;
}

@end
