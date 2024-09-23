@implementation APPCDiagnosticMetricsHelper

- (void)setNetworkType:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___APPCDiagnosticMetricsHelper_networkType);
  swift_beginAccess();
  *v4 = a3;
}

- (unint64_t)networkType
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___APPCDiagnosticMetricsHelper_networkType);
  swift_beginAccess();
  return *v2;
}

- (APPCDiagnosticMetricsHelper)initWithContextIdentifier:(id)a3 promotedContentIdentifier:(id)a4 primitiveCreator:(id)a5 notificationOwner:(id)a6 metricEventsTracking:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  objc_super v19;

  v11 = sub_1B1289884();
  v13 = v12;
  v14 = sub_1B1289884();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDiagnosticMetricsHelper_networkType) = 0;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___APPCDiagnosticMetricsHelper_contextIdentifier);
  *v15 = v11;
  v15[1] = v13;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___APPCDiagnosticMetricsHelper_promotedContentIdentifier);
  *v16 = v14;
  v16[1] = v17;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDiagnosticMetricsHelper_primitiveCreator) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDiagnosticMetricsHelper_notificationOwner) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDiagnosticMetricsHelper_metricEventsTracking) = (Class)a7;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for DiagnosticMetricsHelper();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return -[APPCDiagnosticMetricsHelper init](&v19, sel_init);
}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  void *v4;
  uint64_t v5;
  APPCDiagnosticMetricsHelper *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1B123743C((uint64_t)sub_1B1235728, v5);

  swift_release();
}

- (void)removeHandler
{
  APPCDiagnosticMetricsHelper *v2;

  v2 = self;
  sub_1B12375D0();

}

- (void)loadFailedWithReason:(id)a3 code:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  APPCDiagnosticMetricsHelper *v9;

  v6 = sub_1B1289884();
  v8 = v7;
  v9 = self;
  sub_1B12376D8(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)templateMetricWithName:(id)a3 argument:(id)a4
{
  APPCDiagnosticMetricsHelper *v5;

  sub_1B1289884();
  sub_1B1289884();
  v5 = self;
  sub_1B12378F0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)mediaPlaybackFailedWithReason:(id)a3
{
  APPCDiagnosticMetricsHelper *v4;

  sub_1B1289884();
  v4 = self;
  sub_1B1237A88();

  swift_bridgeObjectRelease();
}

- (APPCDiagnosticMetricsHelper)init
{
  APPCDiagnosticMetricsHelper *result;

  result = (APPCDiagnosticMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
