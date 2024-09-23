@implementation CategoryClassificationModelInput

- (NSSet)featureNames
{
  void *v2;

  sub_1D48CC87C((uint64_t)&unk_1E97FD610);
  swift_arrayDestroy();
  v2 = (void *)sub_1D49228C8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (sub_1D492261C() == 120 && v4 == 0xE100000000000000 || (sub_1D4922E38() & 1) != 0)
  {
    v5 = *(_QWORD *)self->x;
    v6 = (void *)objc_opt_self();
    swift_retain();
    v7 = objc_msgSend(v6, sel_featureValueWithMultiArray_, v5);
    swift_release();
  }
  else
  {
    v7 = 0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

@end
