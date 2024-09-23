@implementation NewOfferResponse

- (id)toContext
{
  _TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse *v2;
  void *v3;

  v2 = self;
  sub_21C5056D0();

  v3 = (void *)sub_21C5126E4();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)error
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)sub_21C5121BC();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)description
{
  _TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse *v2;
  void *v3;

  v2 = self;
  sub_21C505908();

  v3 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  _TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[NewOfferResponse description](v2, sel_description);
  sub_21C512720();

  v4 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)shouldDisplayOfferNow
{
  _TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse *v2;
  char v3;

  v2 = self;
  v3 = sub_21C505AF4();

  return v3 & 1;
}

- (_TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse)init
{
  _TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse *result;

  result = (_TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21C505348((uint64_t)self + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError));
}

@end
