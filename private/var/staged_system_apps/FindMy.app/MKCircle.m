@implementation MKCircle

- (BOOL)isEqual:(id)a3
{
  MKCircle *v5;
  uint64_t v6;
  MKCircle *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = MKCircle.isEqual(_:)((uint64_t)v10);

  sub_10005D03C((uint64_t)v10);
  return v8;
}

- (int64_t)hash
{
  MKCircle *v2;
  int64_t v3;

  v2 = self;
  v3 = MKCircle.hash.getter();

  return v3;
}

@end
