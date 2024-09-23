@implementation FailsafeNewOfferResponse

- (id)toContext
{
  uint64_t v2;
  _TtC33iCloudSubscriptionOptimizerClient24FailsafeNewOfferResponse *v3;
  void *v4;

  v2 = qword_255284320;
  v3 = self;
  if (v2 != -1)
    swift_once();
  swift_bridgeObjectRetain();

  v4 = (void *)sub_21C5126E4();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)error
{
  return 0;
}

- (NSString)description
{
  _TtC33iCloudSubscriptionOptimizerClient24FailsafeNewOfferResponse *v2;
  void *v3;

  v2 = self;
  sub_21C502058();

  v3 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  _TtC33iCloudSubscriptionOptimizerClient24FailsafeNewOfferResponse *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[FailsafeNewOfferResponse description](v2, sel_description);
  sub_21C512720();

  v4 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)shouldDisplayOfferNow
{
  return 1;
}

- (_TtC33iCloudSubscriptionOptimizerClient24FailsafeNewOfferResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FailsafeNewOfferResponse();
  return -[FailsafeNewOfferResponse init](&v3, sel_init);
}

@end
