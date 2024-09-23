@implementation WBSSpotlightDonationEntityCorrelator

- (id)initIfAvailable
{
  if (MEMORY[0x1E0CA6B40])
    return -[WBSSpotlightDonationEntityCorrelator init](self, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)correlateHistoryEntityForItem:(id)a3
{
  id v4;
  WBSSpotlightDonationEntityCorrelator *v5;

  v4 = a3;
  v5 = self;
  sub_1B26CC5BC(v4);

}

- (void)correlateBookmarkEntityForItem:(id)a3 withUUIDString:(id)a4
{
  id v6;
  WBSSpotlightDonationEntityCorrelator *v7;

  sub_1B26D414C();
  v6 = a3;
  v7 = self;
  sub_1B26CC71C(v6);

  swift_bridgeObjectRelease();
}

- (void)correlateTabEntityForItem:(id)a3
{
  id v4;
  WBSSpotlightDonationEntityCorrelator *v5;

  v4 = a3;
  v5 = self;
  sub_1B26CC850(v4);

}

- (WBSSpotlightDonationEntityCorrelator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSSpotlightDonationEntityCorrelator;
  return -[WBSSpotlightDonationEntityCorrelator init](&v3, sel_init);
}

@end
