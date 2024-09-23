@implementation REMBertTextClassifierInput

- (NSSet)featureNames
{
  void *v2;

  sub_1A462EDF8((uint64_t)&unk_1E4C13288);
  swift_arrayDestroy();
  v2 = (void *)sub_1A4690D5C();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v5 = v4;
  swift_retain();
  v6 = sub_1A462D7A0(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end
