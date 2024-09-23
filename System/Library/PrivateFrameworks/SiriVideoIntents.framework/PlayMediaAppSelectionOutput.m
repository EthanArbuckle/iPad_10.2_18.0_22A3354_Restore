@implementation PlayMediaAppSelectionOutput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_21E89DB20();
  swift_release();
  v2 = (void *)sub_21E9D87A0();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_21E89DBCC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_21E89DB74);
}

@end
