@implementation APPCLifecycleMetricsHelper

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (void)missedOpportunity
{
  APPCLifecycleMetricsHelper *v2;

  v2 = self;
  sub_1B12631E0();

}

- (void)discarded
{
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___APPCLifecycleMetricsHelper_wasOnScreen) == 1)
    objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___APPCLifecycleMetricsHelper_metricsHelper), sel_notConsumedWithCode_placeholder_, 8001, *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___APPCLifecycleMetricsHelper_placeholder));
}

- (void)manuallyDiscardWithReason:(int64_t)a3
{
  APPCLifecycleMetricsHelper *v4;

  v4 = self;
  sub_1B12633D4((id)a3);

}

- (void)contentLoadFailure
{
  APPCLifecycleMetricsHelper *v2;

  v2 = self;
  sub_1B12634EC();

}

- (void)trackImpressionWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  APPCLifecycleMetricsHelper *v12;
  void *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;

  v5 = sub_1B1289620();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v15 - v10;
  sub_1B12895FC();
  sub_1B12895FC();
  v12 = self;
  sub_1B1289A40();
  sub_1B11F8A30();
  v13 = (void *)sub_1B1289AF4();
  sub_1B1289740();

  v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  v14(v11, v5);
}

- (APPCLifecycleMetricsHelper)init
{
  APPCLifecycleMetricsHelper *result;

  result = (APPCLifecycleMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
