@implementation DelayedOffer

- (id)newOfferResponse
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  char *v8;
  char *v9;
  _TtC33iCloudSubscriptionOptimizerClient12DelayedOffer *v10;
  _TtC33iCloudSubscriptionOptimizerClient12DelayedOffer *v11;
  objc_super v13;

  v3 = sub_21C512588();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C5019E4((uint64_t)self + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient12DelayedOffer_context, (uint64_t)v6);
  v7 = (objc_class *)type metadata accessor for NewOfferResponse();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context];
  sub_21C5019E4((uint64_t)v6, (uint64_t)&v8[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context]);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
  *(_QWORD *)&v8[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError] = 0;
  v13.receiver = v8;
  v13.super_class = v7;
  v10 = self;
  v11 = -[DelayedOffer init](&v13, sel_init);
  sub_21C501A28((uint64_t)v6);

  return v11;
}

- (NSString)description
{
  _TtC33iCloudSubscriptionOptimizerClient12DelayedOffer *v2;
  void *v3;

  v2 = self;
  sub_21C512810();
  sub_21C512768();
  sub_21C512588();
  sub_21C512828();
  sub_21C512768();

  v3 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  _TtC33iCloudSubscriptionOptimizerClient12DelayedOffer *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[DelayedOffer description](v2, sel_description);
  sub_21C512720();

  v4 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC33iCloudSubscriptionOptimizerClient12DelayedOffer)init
{
  _TtC33iCloudSubscriptionOptimizerClient12DelayedOffer *result;

  result = (_TtC33iCloudSubscriptionOptimizerClient12DelayedOffer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21C501A28((uint64_t)self + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient12DelayedOffer_context);
}

@end
