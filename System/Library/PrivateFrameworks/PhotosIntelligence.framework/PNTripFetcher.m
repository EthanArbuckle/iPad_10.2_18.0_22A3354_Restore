@implementation PNTripFetcher

+ (BOOL)supportsCollection:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  _BYTE v8[32];

  swift_unknownObjectRetain();
  sub_243F857E0();
  swift_unknownObjectRelease();
  static PNTripFetcher.supports(collection:)((uint64_t)v8, v3, v4);
  v6 = v5;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6 & 1;
}

- (PNTripFetcher)init
{
  return (PNTripFetcher *)PNTripFetcher.init()();
}

@end
