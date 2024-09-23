@implementation ScanConversationsSubscriber

- (void)receiveSubscription:(id)a3
{
  id v4;
  _TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber *v5;

  v4 = a3;
  v5 = self;
  sub_1CB7EF814(v4);

}

- (int64_t)receiveInput:(id)a3
{
  _TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber *v4;
  int64_t v5;
  _BYTE v7[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1CB846EB8();
  swift_unknownObjectRelease();
  v5 = sub_1CB7EF918((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber *v5;

  v4 = a3;
  v5 = self;
  sub_1CB7EFF18(v4);

}

- (void)cancel
{
  _TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber *v2;

  v2 = self;
  sub_1CB7F0138();

}

- (_TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber)init
{
  _TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber *result;

  result = (_TtC28SiriPrivateLearningAnalyticsP33_1C28A16D52A6DDC29A328441443490A627ScanConversationsSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end
