@implementation EncryptedSearchLTRInput

- (NSSet)featureNames
{
  void *v2;

  sub_1D48CC87C((uint64_t)&unk_1E97FD0D8);
  swift_arrayDestroy();
  v2 = (void *)sub_1D49228C8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = sub_1D492261C();
  v5 = v4;
  swift_retain();
  v6 = sub_1D48CA748(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end
