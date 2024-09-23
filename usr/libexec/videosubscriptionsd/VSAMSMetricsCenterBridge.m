@implementation VSAMSMetricsCenterBridge

+ (void)recordAccountUpdate:(id)a3 source:(id)a4 updateType:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v9 = _Block_copy(a6);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  if (v9)
  {
    v13 = swift_allocObject(&unk_100018E90, 24, 7);
    *(_QWORD *)(v13 + 16) = v9;
    v9 = sub_10000E7BC;
  }
  else
  {
    v13 = 0;
  }
  type metadata accessor for VSAMSMetricsCenter(0);
  v14 = a3;
  v15 = a5;
  v16 = (void *)static VSAMSMetricsCenter.shared.getter();
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v19 = v18;
  dispatch thunk of VSAMSMetricsCenter.recordAccountUpdate(_:source:updateType:completion:)(v14, v10, v12, v17, v18, 0, 0);

  swift_bridgeObjectRelease(v19);
  sub_10000E788((uint64_t)v9, v13);

  swift_bridgeObjectRelease(v12);
}

- (_TtC19videosubscriptionsd24VSAMSMetricsCenterBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VSAMSMetricsCenterBridge();
  return -[VSAMSMetricsCenterBridge init](&v3, "init");
}

@end
