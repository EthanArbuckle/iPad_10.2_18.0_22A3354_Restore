@implementation DomainPredictionModelInput

- (NSSet)featureNames
{
  uint64_t v2;
  void *v3;

  v2 = swift_bridgeObjectRetain();
  sub_1D46C0084(v2);
  v3 = (void *)sub_1D49228C8();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
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
  v6 = sub_1D46C0218(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end
