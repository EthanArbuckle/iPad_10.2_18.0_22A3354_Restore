@implementation MTAppCoreSpotlightEntityAnnotator

- (id)annotateItem:(id)a3 withManagedObject:(id)a4
{
  id v6;
  id v7;
  MTAppCoreSpotlightEntityAnnotator *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (id)sub_10000CE50((uint64_t)v6, v7);

  return v9;
}

- (MTAppCoreSpotlightEntityAnnotator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppCoreSpotlightEntityAnnotator();
  return -[MTAppCoreSpotlightEntityAnnotator init](&v3, "init");
}

@end
