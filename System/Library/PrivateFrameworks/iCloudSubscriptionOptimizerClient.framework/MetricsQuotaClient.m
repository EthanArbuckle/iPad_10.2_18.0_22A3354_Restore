@implementation MetricsQuotaClient

- (void)newOffer:(id)a3 andCallback:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_21C503080(v8, (uint64_t)sub_21C5052B4, v7);

  swift_release();
}

- (void)isNotificationPending:(id)a3
{
  sub_21C503F40(self, (int)a2, a3, (uint64_t)&unk_24E04FA50, (uint64_t)sub_21C50529C, (void (*)(uint64_t, uint64_t))sub_21C503784);
}

- (void)clearNotificationState:(id)a3
{
  sub_21C503F40(self, (int)a2, a3, (uint64_t)&unk_24E04F9D8, (uint64_t)sub_21C50526C, (void (*)(uint64_t, uint64_t))sub_21C503B70);
}

- (id)parseDelayedOffer:(id)a3
{
  _TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient *v4;
  id v5;

  sub_21C5126F0();
  v4 = self;
  v5 = sub_21C5044A4(3, (uint64_t)v4, (uint64_t)v4);

  swift_bridgeObjectRelease();
  return v5;
}

- (id)parseDelayedOfferFromJson:(id)a3
{
  _TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient *v4;
  id v5;

  sub_21C512720();
  v4 = self;
  v5 = sub_21C50476C(4, (uint64_t)v4, (uint64_t)v4);

  swift_bridgeObjectRelease();
  return v5;
}

- (id)parseNotification:(id)a3
{
  _TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient *v4;
  void *v5;

  swift_getObjectType();
  sub_21C5126F0();
  v4 = self;
  swift_bridgeObjectRetain();
  v5 = (void *)sub_21C5043B0(5, (uint64_t)v4, v4);

  swift_bridgeObjectRelease();
  return v5;
}

- (id)failsafeDelayedOfferJsonContext
{
  _TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_21C504CFC(6, (uint64_t)v2, (uint64_t)v2);
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_21C512714();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)logFailsafeEvent:(id)a3
{
  _TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient *v4;

  sub_21C512720();
  v4 = self;
  sub_21C504FB0(7, (uint64_t)v4, (uint64_t)v4);

  swift_bridgeObjectRelease();
}

- (_TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient)init
{
  _TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient *result;

  result = (_TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient));
  swift_release();
}

@end
