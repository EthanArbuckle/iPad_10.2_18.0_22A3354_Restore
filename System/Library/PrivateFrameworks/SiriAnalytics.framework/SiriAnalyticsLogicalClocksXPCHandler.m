@implementation SiriAnalyticsLogicalClocksXPCHandler

- (SiriAnalyticsLogicalClocksXPCHandler)initWithMetastore:(id)a3 queue:(id)a4
{
  return (SiriAnalyticsLogicalClocksXPCHandler *)LogicalClocksXPCHandler.init(metastore:queue:)((uint64_t)a3, (uint64_t)a4);
}

- (void)allWithCompletion:(id)a3
{
  void *v4;
  SiriAnalyticsLogicalClocksXPCHandler *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_1A02A1E54();

  swift_release();
}

- (SiriAnalyticsLogicalClocksXPCHandler)init
{
  LogicalClocksXPCHandler.init()();
}

- (void).cxx_destruct
{

}

@end
