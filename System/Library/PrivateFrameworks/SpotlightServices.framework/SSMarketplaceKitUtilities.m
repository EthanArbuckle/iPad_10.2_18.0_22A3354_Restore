@implementation SSMarketplaceKitUtilities

+ (id)distributorPriorityList
{
  void *v2;

  sub_1B87D2300();
  v2 = (void *)sub_1B87D2318();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)distributorPriorityListChangedNotifationName
{
  return (id)sub_1B87D230C();
}

- (_TtC17SpotlightServices25SSMarketplaceKitUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SSMarketplaceKitUtilities();
  return -[SSMarketplaceKitUtilities init](&v3, sel_init);
}

@end
