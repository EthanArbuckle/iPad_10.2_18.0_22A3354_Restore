@implementation SiriAnalyticsClientRuntimeConnection

- (SiriAnalyticsClientRuntimeConnection)initWithMachServiceName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1A03077B4();
  return (SiriAnalyticsClientRuntimeConnection *)ClientRuntimeConnection.init(machServiceName:)(v3, v4);
}

- (void)resetLogicalClockWithCompletion:(id)a3
{
  sub_1A02826C0(self, (int)a2, a3, (uint64_t)&unk_1E43555F0, (uint64_t)sub_1A02828D0, sub_1A0282348);
}

- (void)runPipelineWithCompletion:(id)a3
{
  sub_1A02826C0(self, (int)a2, a3, (uint64_t)&unk_1E43555C8, (uint64_t)sub_1A02828C8, sub_1A0282580);
}

- (SiriAnalyticsClientRuntimeConnection)init
{
  ClientRuntimeConnection.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___SiriAnalyticsClientRuntimeConnection____lazy_storage___underlying));
}

@end
