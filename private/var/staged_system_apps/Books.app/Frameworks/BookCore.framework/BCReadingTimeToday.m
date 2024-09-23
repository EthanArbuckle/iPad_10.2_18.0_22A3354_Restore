@implementation BCReadingTimeToday

+ (NSString)kind
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSString)kind
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = (char *)self + OBJC_IVAR___BCReadingTimeToday_kind;
  swift_beginAccess((char *)self + OBJC_IVAR___BCReadingTimeToday_kind, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setKind:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BCReadingTimeToday_kind);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = v7[1];
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (NSObject)instance
{
  return sub_1ABEF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BCReadingTimeToday_instance);
}

- (void)setInstance:(id)a3
{
  sub_1ABF8C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___BCReadingTimeToday_instance);
}

- (NSObject)parameters
{
  return sub_1ABEF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BCReadingTimeToday_parameters);
}

- (void)setParameters:(id)a3
{
  sub_1ABF8C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___BCReadingTimeToday_parameters);
}

- (NSNumber)progress
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCReadingTimeToday_progress);
  swift_beginAccess((char *)self + OBJC_IVAR___BCReadingTimeToday_progress, v4, 0, 0);
  return (NSNumber *)*v2;
}

- (void)setProgress:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCReadingTimeToday_progress);
  swift_beginAccess((char *)self + OBJC_IVAR___BCReadingTimeToday_progress, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)formattedProgress
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = (char *)self + OBJC_IVAR___BCReadingTimeToday_formattedProgress;
  swift_beginAccess((char *)self + OBJC_IVAR___BCReadingTimeToday_formattedProgress, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  if (!v3)
    return (NSString *)0;
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setFormattedProgress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BCReadingTimeToday_formattedProgress);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = v7[1];
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (void)registerProgressObserver:(id)a3
{
  sub_1AC890(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1AC5A0);
}

- (void)unregisterProgressObserver:(id)a3
{
  sub_1AC890(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1AC718);
}

- (BCReadingTimeToday)init
{
  BCReadingTimeToday *result;

  result = (BCReadingTimeToday *)_swift_stdlib_reportUnimplementedInitializer("BookCore.ReadingTimeToday", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->kind[OBJC_IVAR___BCReadingTimeToday_kind]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->kind[OBJC_IVAR___BCReadingTimeToday_formattedProgress]);
  sub_178760(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BCReadingTimeToday_onObserverCountChanged), *(_QWORD *)&self->kind[OBJC_IVAR___BCReadingTimeToday_onObserverCountChanged]);
}

@end
