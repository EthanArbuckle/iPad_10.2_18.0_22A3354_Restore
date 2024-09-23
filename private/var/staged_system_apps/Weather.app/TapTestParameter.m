@implementation TapTestParameter

- (NSString)testName
{
  uint64_t v2;
  NSString v3;

  sub_1008A9968();
  if (v2)
  {
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTestName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC7Weather16TapTestParameter *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1008A9A0C(v4, v6);

}

- (id)completionHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = sub_1008A9AA4();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100121D84;
  v6[3] = &unk_100B98568;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (BOOL)managesTestStartAndEnd
{
  return 0;
}

- (id)composerBlock
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  sub_1008A9AEC();
  v5[4] = sub_1008A9C8C;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_1008A98DC;
  v5[3] = &unk_100B98518;
  v3 = _Block_copy(v5);
  swift_release();
  return v3;
}

- (_TtC7Weather16TapTestParameter)init
{
  sub_1008A9BD0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000BF8D0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Weather16TapTestParameter_completionHandler), *(_QWORD *)&self->testName[OBJC_IVAR____TtC7Weather16TapTestParameter_completionHandler]);
}

@end
