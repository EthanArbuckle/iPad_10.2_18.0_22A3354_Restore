@implementation JSDateFormatter.CacheCoordinator.Key

- (int64_t)hash
{
  Swift::Int v2;
  _QWORD v4[9];

  Hasher.init(_seed:)(v4);
  swift_retain();
  sub_F78834((uint64_t)v4);
  v2 = Hasher._finalize()();
  swift_release();
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (a3)
  {
    v5 = *(_QWORD *)self->_TtCs12_SwiftObject_opaque;
    swift_retain();
    v6 = swift_unknownObjectRetain(a3);
    v7 = swift_dynamicCastClass(v6, v5);
    if (v7)
      v8 = sub_F79BDC((uint64_t)self, v7);
    else
      v8 = 0;
    swift_unknownObjectRelease(a3);
    swift_release();
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

@end
