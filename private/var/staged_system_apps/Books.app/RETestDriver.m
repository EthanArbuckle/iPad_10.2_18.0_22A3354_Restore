@implementation RETestDriver

+ (BOOL)isValidWithViewController:(id)a3
{
  uint64_t v4;

  v4 = type metadata accessor for BookReaderContainerViewController(0);
  return swift_dynamicCastClass(a3, v4) != 0;
}

+ (BOOL)closeBookWithViewController:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for BookReaderContainerViewController(0);
  v5 = swift_unknownObjectRetain(a3);
  v6 = swift_dynamicCastClass(v5, v4);
  if (v6)
    sub_1004DAFDC(1);
  swift_unknownObjectRelease(a3);
  return v6 != 0;
}

+ (id)getBookControllerLayoutWithViewController:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  swift_unknownObjectRetain(a3);
  _s5Books12RETestDriverC23getBookControllerLayout04viewF0SSSgyXl_tFZ_0((uint64_t)a3);
  v5 = v4;
  swift_unknownObjectRelease(a3);
  if (v5)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (void)setBookControllerLayout:(id)a3 viewController:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  swift_unknownObjectRetain(a4);
  _s5Books12RETestDriverC23setBookControllerLayout_04viewF0ySS_yXltFZ_0(v5, v7, (uint64_t)a4);
  swift_unknownObjectRelease(a4);
  swift_bridgeObjectRelease(v7);
}

+ (BOOL)turnPageWithViewController:(id)a3 forward:(BOOL)a4
{
  BOOL v6;

  swift_unknownObjectRetain(a3);
  v6 = _s5Books12RETestDriverC8turnPage14viewController7forwardSbyXl_SbtFZ_0((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
  return v6;
}

+ (BOOL)turnToInitialPageWithViewController:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t ObjectType;

  v4 = type metadata accessor for BookReaderContainerViewController(0);
  v5 = swift_unknownObjectRetain(a3);
  v6 = swift_dynamicCastClass(v5, v4);
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)(v6 + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_currentLocationController);
    v9 = *(_QWORD *)(v6 + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_currentLocationController + 8);
    ObjectType = swift_getObjectType();
    swift_unknownObjectRetain(v8);
    dispatch thunk of LocationControlling.moveTo(pageNumber:)(1, ObjectType, v9);
    swift_unknownObjectRelease(a3);
    a3 = v8;
  }
  swift_unknownObjectRelease(a3);
  return v7 != 0;
}

+ (BOOL)performScrollTestWithViewController:(id)a3 name:(id)a4 iterations:(int)a5 delta:(int)a6
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v7 = *(_QWORD *)&a5;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = type metadata accessor for BookReaderContainerViewController(0);
  v13 = swift_unknownObjectRetain(a3);
  if (swift_dynamicCastClass(v13, v12))
    v14 = sub_1004D7718(v9, v11, v7, a6);
  else
    v14 = 0;
  swift_unknownObjectRelease(a3);
  swift_bridgeObjectRelease(v11);
  return v14 & 1;
}

+ (BOOL)simulateManualPageTurnWithViewController:(id)a3 rtl:(BOOL)a4 time:(double)a5
{
  uint64_t v8;
  uint64_t v9;
  char v10;

  v8 = type metadata accessor for BookReaderContainerViewController(0);
  v9 = swift_unknownObjectRetain(a3);
  if (swift_dynamicCastClass(v9, v8))
    v10 = sub_1004D7904(a4, a5);
  else
    v10 = 0;
  swift_unknownObjectRelease(a3);
  return v10 & 1;
}

- (_TtC5Books12RETestDriver)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RETestDriver();
  return -[RETestDriver init](&v3, "init");
}

@end
