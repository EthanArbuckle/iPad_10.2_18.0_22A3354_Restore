@implementation IntDictionaryFeatureProvider

- (NSSet)featureNames
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_21E9D87A0();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;

  v3 = sub_21E9D8524();
  v5 = v4;
  swift_retain();
  v6 = sub_21E892BAC(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end
