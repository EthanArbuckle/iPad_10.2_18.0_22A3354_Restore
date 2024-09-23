@implementation __ContiguousArrayStorageBase

- (id)mutableCopyWithZone:(void *)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  v4 = type metadata accessor for _SwiftNSMutableArray();
  v5 = swift_allocObject(v4, 0x18uLL, 7uLL);
  v5[2] = self;
  swift_retain((unint64_t *)self, v6, v7, v8);
  return v5;
}

- (int64_t)indexOfObjectIdenticalTo:(id)a3
{
  return @objc _SwiftNSMutableArray.index(ofObjectIdenticalTo:)((unint64_t *)self, (uint64_t)a2, a3, (char *)__ContiguousArrayStorageBase.index(ofObjectIdenticalTo:));
}

@end
