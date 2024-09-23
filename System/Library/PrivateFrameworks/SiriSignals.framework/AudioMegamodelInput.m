@implementation AudioMegamodelInput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_1C057C2C4();
  swift_release();
  v2 = (void *)sub_1C057D558();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  return sub_1C057C528((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C057C2D0);
}

@end
