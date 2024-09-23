@implementation PPTRunner

+ (_TtC5Books9PPTRunner)shared
{
  if (qword_1009CE250 != -1)
    swift_once(&qword_1009CE250, sub_100397E0C);
  return (_TtC5Books9PPTRunner *)(id)qword_100A1E760;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1009CE250;
  v4 = a3;
  if (v3 != -1)
    swift_once(&qword_1009CE250, sub_100397E0C);
  v5 = (void *)qword_100A1E760;
  qword_100A1E760 = (uint64_t)v4;

}

- (BOOL)runTestWithName:(id)a3 options:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _TtC5Books9PPTRunner *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v10 = self;
  sub_100397ECC(v6, v8, v9);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v9);
  return 1;
}

- (_TtC5Books9PPTRunner)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books9PPTRunner_currentTestRunner) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books9PPTRunner_testCaseQueue) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PPTRunner();
  return -[PPTRunner init](&v3, "init");
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books9PPTRunner_testCaseQueue));
}

- (BOOL)testIsRunning
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books9PPTRunner_currentTestRunner) != 0;
}

@end
