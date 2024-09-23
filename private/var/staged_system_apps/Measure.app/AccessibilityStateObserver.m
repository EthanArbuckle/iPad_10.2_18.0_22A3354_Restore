@implementation AccessibilityStateObserver

+ (_TtC7Measure26AccessibilityStateObserver)shared
{
  if (qword_10047ADB0 != -1)
    swift_once(&qword_10047ADB0, sub_100194BE4);
  return (_TtC7Measure26AccessibilityStateObserver *)(id)qword_1004AF898;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_10047ADB0;
  v4 = a3;
  if (v3 != -1)
    swift_once(&qword_10047ADB0, sub_100194BE4);
  v5 = (void *)qword_1004AF898;
  qword_1004AF898 = (uint64_t)v4;

}

- (_TtC7Measure26AccessibilityStateObserver)init
{
  uint64_t v3;
  uint64_t v4;
  _TtC7Measure26AccessibilityStateObserver *v5;
  _TtC7Measure26AccessibilityStateObserver *v6;
  uint64_t v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC7Measure26AccessibilityStateObserver_implementation;
  v4 = type metadata accessor for AccessibilityStateObserverBridge(0);
  swift_allocObject(v4, 120, 7);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100194664();

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for AccessibilityStateObserver();
  v6 = -[AccessibilityStateObserver init](&v9, "init");
  v7 = *(uint64_t *)((char *)&v6->super.isa + OBJC_IVAR____TtC7Measure26AccessibilityStateObserver_implementation);
  *(_QWORD *)(v7 + 72) = &off_10044AB50;
  swift_unknownObjectWeakAssign(v7 + 64, v6);
  return v6;
}

- (int64_t)snapWorldPointType
{
  _TtC7Measure26AccessibilityStateObserver *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_100194D80();

  return v3;
}

- (NSString)snapDivisionsDescription
{
  return (NSString *)sub_100195094(self, (uint64_t)a2, (void (*)(void))sub_100194E30);
}

- (NSString)snapDivisionsLineID
{
  return (NSString *)sub_100195094(self, (uint64_t)a2, (void (*)(void))sub_1001950FC);
}

- (BOOL)isModeForMeasuring
{
  return 1;
}

- (NSDictionary)worldLines
{
  uint64_t v2;
  NSDictionary *result;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;
  _BYTE v8[24];

  v2 = qword_10047A930;
  result = self;
  v4 = result;
  if (v2 != -1)
    result = (NSDictionary *)swift_once(&qword_10047A930, sub_100083368);
  v5 = qword_1004AF248;
  if (qword_1004AF248)
  {
    swift_beginAccess(qword_1004AF248 + 88, v8, 0, 0);
    v6 = *(_QWORD *)(v5 + 96);
    swift_bridgeObjectRetain(v6);

    type metadata accessor for WorldLine(0);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
    return (NSDictionary *)isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSDictionary)worldPoints
{
  uint64_t v2;
  NSDictionary *result;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;
  _BYTE v8[24];

  v2 = qword_10047A930;
  result = self;
  v4 = result;
  if (v2 != -1)
    result = (NSDictionary *)swift_once(&qword_10047A930, sub_100083368);
  v5 = qword_1004AF248;
  if (qword_1004AF248)
  {
    swift_beginAccess(qword_1004AF248 + 80, v8, 0, 0);
    v6 = *(_QWORD *)(v5 + 80);
    swift_bridgeObjectRetain(v6);

    type metadata accessor for WorldPoint(0);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
    return (NSDictionary *)isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSDictionary)worldRectangles
{
  _TtC7Measure26AccessibilityStateObserver *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_1001953DC();

  type metadata accessor for WorldRectangle(0);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (NSArray)orderedWorldLineIDs
{
  uint64_t v2;
  NSArray *result;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;
  _BYTE v8[24];

  v2 = qword_10047A930;
  result = self;
  v4 = result;
  if (v2 != -1)
    result = (NSArray *)swift_once(&qword_10047A930, sub_100083368);
  v5 = qword_1004AF248;
  if (qword_1004AF248)
  {
    swift_beginAccess(qword_1004AF248 + 88, v8, 0, 0);
    v6 = *(_QWORD *)(v5 + 88);
    swift_bridgeObjectRetain(v6);

    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
    return (NSArray *)isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure26AccessibilityStateObserver_implementation));
}

@end
