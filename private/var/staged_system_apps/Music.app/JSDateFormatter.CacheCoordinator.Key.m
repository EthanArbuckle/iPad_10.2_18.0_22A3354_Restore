@implementation JSDateFormatter.CacheCoordinator.Key

- (int64_t)hash
{
  Swift::Int v2;
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, 0);
  swift_retain();
  sub_100D675E8((uint64_t)v4);
  v2 = Hasher._finalize()();
  swift_release();
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (a3)
  {
    v5 = *(_QWORD *)self->_TtCs12_SwiftObject_opaque;
    swift_retain();
    v7 = swift_unknownObjectRetain(a3, v6);
    v8 = swift_dynamicCastClass(v7, v5);
    if (v8)
      v9 = sub_100D68990((uint64_t)self, v8);
    else
      v9 = 0;
    swift_unknownObjectRelease(a3);
    swift_release();
  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

@end
