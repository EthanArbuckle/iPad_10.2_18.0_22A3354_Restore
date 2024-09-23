@implementation MPModelSocialPerson

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_34A1A8((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_135AF80, (uint64_t)sub_34BD80, (uint64_t)&block_descriptor_125);
}

- (BOOL)isEqual:(id)a3
{
  MPModelSocialPerson *v5;
  uint64_t v6;
  MPModelSocialPerson *v7;
  char v8;
  char v9;
  _OWORD v11[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v11, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v7 = self;
  }
  MPModelSocialPerson.isEqual(_:)((uint64_t)v11);
  v9 = v8;

  sub_18DF2C((uint64_t)v11);
  return v9 & 1;
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
