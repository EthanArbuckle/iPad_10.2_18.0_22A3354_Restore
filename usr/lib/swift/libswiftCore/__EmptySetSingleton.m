@implementation __EmptySetSingleton

- (_TtCs19__EmptySetSingleton)initWithObjects:(const void *)a3 count:(int64_t)a4
{
  _TtCs19__EmptySetSingleton *result;

  result = (_TtCs19__EmptySetSingleton *)swift_release((uint64_t)self);
  __break(1u);
  return result;
}

- (int64_t)count
{
  return 0;
}

- (id)member:(id)a3
{
  return 0;
}

- (id)objectEnumerator
{
  uint64_t v2;

  v2 = type metadata accessor for __SwiftEmptyNSEnumerator();
  return swift_allocObject(v2, 0x10uLL, 7uLL);
}

@end
