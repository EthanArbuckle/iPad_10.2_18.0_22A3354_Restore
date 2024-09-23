@implementation PKAppIntentUtilities

+ (void)associateSearchableItem:(id)a3 withEntityForPass:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  _s11PassKitCore18AppIntentUtilitiesC9associate14searchableItem013withEntityForA0ySo012CSSearchableI0C_So6PKPassCtFZ_0(v5, v6);

}

+ (void)associateSearchableItem:(id)a3 withEntityForTransaction:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  _s11PassKitCore18AppIntentUtilitiesC9associate14searchableItem24withEntityForTransactionySo012CSSearchableI0C_So09PKPaymentM0CtFZ_0(v5, v6);

}

- (PKAppIntentUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppIntentUtilities();
  return -[PKAppIntentUtilities init](&v3, sel_init);
}

@end
