@implementation SiriAnalyticsRawUnifiedStream

- (SiriAnalyticsRawUnifiedStream)init
{
  return (SiriAnalyticsRawUnifiedStream *)RawUnifiedStreamAdapter.init()();
}

- (void)sendWithAnyEvent:(id)a3
{
  id v4;
  SiriAnalyticsRawUnifiedStream *v5;

  v4 = a3;
  v5 = self;
  sub_1A0273D88(v4);

}

- (void)sendWithAnyEvents:(id)a3
{
  sub_1A02740A8(self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&qword_1EE58EF60, 0x1E0D9A3C8, (void (*)(uint64_t))sub_1A0273E08);
}

- (void)sendWithRuntimeEvents:(id)a3
{
  sub_1A02740A8(self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&qword_1ED07AE38, (uint64_t)off_1E43502D8, (void (*)(uint64_t))sub_1A0273EF0);
}

- (void)prune
{
  SiriAnalyticsRawUnifiedStream *v2;

  v2 = self;
  sub_1A027410C();

}

- (void).cxx_destruct
{

}

@end
