@implementation VUIMetricsLocalRecorder

- (VUIMetricsLocalRecorder)initWithStorageManager:(id)a3
{
  swift_unknownObjectRetain();
  return (VUIMetricsLocalRecorder *)MetricsLocalRecorder.init(storageManager:)((uint64_t)a3);
}

- (void)recordPagePerfRenderEventWithVuiDictionary:(id)a3
{
  uint64_t v4;
  VUIMetricsLocalRecorder *v5;

  v4 = sub_1DA143C7C();
  v5 = self;
  MetricsLocalRecorder.recordPagePerfRenderEvent(vuiDictionary:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (VUIMetricsLocalRecorder)init
{
  MetricsLocalRecorder.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

@end
