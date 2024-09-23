@implementation BKLibraryPriceTracker

- (BKLibraryPriceTracker)init
{
  BKLibraryPriceTracker *result;

  swift_defaultActor_initialize(self);
  result = (BKLibraryPriceTracker *)_swift_stdlib_reportUnimplementedInitializer("BKLibrary.PriceTracker", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (BKLibraryPriceTracker)initWithLibraryManager:(id)a3 bdsPriceTracker:(id)a4
{
  id v5;
  uint64_t v6;

  v5 = a3;
  swift_unknownObjectRetain(a4, v6);
  return (BKLibraryPriceTracker *)PriceTracker.init(libraryManager:bdsPriceTracker:)(v5, (uint64_t)a4);
}

- (void)setNeedsConfigurationUpdate
{
  swift_retain(self);
  PriceTracker.objc_setNeedsConfigurationUpdate()();
  swift_release(self);
}

@end
