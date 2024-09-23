@implementation SiriAnalyticsDataCollectionPolicyClockObserver

- (SiriAnalyticsDataCollectionPolicyClockObserver)initWithSiriConfiguration:(id)a3 metastore:(id)a4 metastoreQueue:(id)a5
{
  swift_unknownObjectRetain();
  return (SiriAnalyticsDataCollectionPolicyClockObserver *)DataCollectionPolicyClockObserver.init(siriConfiguration:metastore:metastoreQueue:)((uint64_t)a3, a4, a5);
}

- (void)rootClockCreatedWithClockIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  SiriAnalyticsDataCollectionPolicyClockObserver *v12;
  uint64_t v13;

  v6 = sub_1A0307334();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1A030731C();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  sub_1A02BBF2C((uint64_t)v9, (uint64_t)sub_1A02BC574, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (SiriAnalyticsDataCollectionPolicyClockObserver)init
{
  DataCollectionPolicyClockObserver.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SiriAnalyticsDataCollectionPolicyClockObserver_dataCollectionPolicy);
}

@end
