@implementation RandomForestInput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_247319BA8();
  swift_release();
  v2 = (void *)sub_24731B754();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_24731A71C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_247319BB4);
}

@end
