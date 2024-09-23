@implementation FailsafeDelayedOffer

- (_TtC33iCloudSubscriptionOptimizerClient20FailsafeDelayedOffer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FailsafeDelayedOffer();
  return -[FailsafeDelayedOffer init](&v3, sel_init);
}

- (id)newOfferResponse
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FailsafeNewOfferResponse()), sel_init);
}

- (NSString)description
{
  _TtC33iCloudSubscriptionOptimizerClient20FailsafeDelayedOffer *v2;
  void *v3;

  v2 = self;
  sub_21C501D28();

  v3 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  _TtC33iCloudSubscriptionOptimizerClient20FailsafeDelayedOffer *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[FailsafeDelayedOffer description](v2, sel_description);
  sub_21C512720();

  v4 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

@end
