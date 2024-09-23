@implementation PlayMediaAppSelectionInput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_22967ED40((uint64_t)&unk_24F25F628);
  swift_arrayDestroy();
  swift_release();
  v2 = (void *)sub_2297DD0C4();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = sub_2297DCE60();
  v5 = v4;
  swift_retain();
  v6 = sub_2296D308C(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end
