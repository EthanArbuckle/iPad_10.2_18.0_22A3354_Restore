@implementation MPModelSocialPerson

- (BOOL)isEqual:(id)a3
{
  MPModelSocialPerson *v5;
  uint64_t v6;
  uint64_t v7;
  MPModelSocialPerson *v8;
  char v9;
  char v10;
  _OWORD v12[2];

  if (a3)
  {
    v5 = self;
    v7 = swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v12, v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v8 = self;
  }
  MPModelSocialPerson.isEqual(_:)((uint64_t)v12);
  v10 = v9;

  sub_1002293F8((uint64_t)v12);
  return v10 & 1;
}

- (int64_t)hash
{
  MPModelSocialPerson *v2;
  int64_t v3;

  v2 = self;
  v3 = MPModelSocialPerson.hash.getter();

  return v3;
}

@end
