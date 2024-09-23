@implementation GKMetricsPipeline

- (_TtC14GameDaemonCore17GKMetricsPipeline)initWithBag:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC14GameDaemonCore17GKMetricsPipeline *)GKMetricsPipeline.init(bag:)();
}

- (void)processEventWithTopic:(NSString *)a3 shouldFlush:(BOOL)a4 metricsFields:(NSDictionary *)a5 hostAppBundleId:(NSString *)a6 completionHandler:(id)a7
{
  void *v12;
  uint64_t v13;
  NSString *v14;
  NSDictionary *v15;
  NSString *v16;
  _TtC14GameDaemonCore17GKMetricsPipeline *v17;

  v12 = _Block_copy(a7);
  v13 = swift_allocObject(&unk_1002C7C18, 64, 7);
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = a5;
  *(_QWORD *)(v13 + 40) = a6;
  *(_QWORD *)(v13 + 48) = v12;
  *(_QWORD *)(v13 + 56) = self;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = self;
  sub_1001C15C4((uint64_t)&unk_100316878, v13);
}

- (void)processMultiplayerActivityEventWithMetricsFields:(NSDictionary *)a3 hostAppBundleId:(NSString *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSDictionary *v10;
  NSString *v11;
  _TtC14GameDaemonCore17GKMetricsPipeline *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject(&unk_1002C7BF0, 48, 7);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1001C15C4((uint64_t)&unk_100316868, (uint64_t)v9);
}

- (_TtC14GameDaemonCore17GKMetricsPipeline)init
{
  GKMetricsPipeline.init()();
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = type metadata accessor for Bag(0);
  sub_1001B3460(*(_QWORD *)(v3 - 8));
  sub_1001B329C((uint64_t)self + OBJC_IVAR____TtC14GameDaemonCore17GKMetricsPipeline____lazy_storage___metricsPipeline);
}

@end
