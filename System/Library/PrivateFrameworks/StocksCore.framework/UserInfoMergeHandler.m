@implementation UserInfoMergeHandler

- (id)commandsToMergeRecordWithServer:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  sub_1ABF2FF68();
  sub_1ABDDF0F4(v3);

  swift_release();
  sub_1ABCF7C04(0, &qword_1EEC43048);
  v4 = (void *)sub_1ABF319FC();
  swift_bridgeObjectRelease();
  return v4;
}

@end
