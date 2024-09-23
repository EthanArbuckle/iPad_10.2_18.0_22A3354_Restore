@implementation APTimeSpentEntry

- (NSString)contentId
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->contentId[OBJC_IVAR___APTimeSpentEntry_contentId];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (NSDate)timeStamp
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  Class isa;
  uint64_t v10;

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init(timeIntervalSince1970:)(v5, *(double *)((char *)&self->super.isa + OBJC_IVAR___APTimeSpentEntry_timeInterval));
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSDate *)isa;
}

- (APTimeSpentEntry)initWithContentId:(id)a3 timeStamp:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  APTimeSpentEntry *v16;
  APTimeSpentEntry *v17;
  objc_super v19;

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  v14 = v13;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___APTimeSpentEntry_contentId);
  *v15 = v12;
  v15[1] = v14;
  v16 = self;
  *(double *)((char *)&v16->super.isa + OBJC_IVAR___APTimeSpentEntry_timeInterval) = Date.timeIntervalSince1970.getter();

  v19.receiver = v16;
  v19.super_class = (Class)APTimeSpentEntry;
  v17 = -[APTimeSpentEntry init](&v19, "init");
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v17;
}

- (APTimeSpentEntry)init
{
  APTimeSpentEntry *result;

  result = (APTimeSpentEntry *)_swift_stdlib_reportUnimplementedInitializer("__ObjC.APTimeSpentEntry", 23, ", 0, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->contentId[OBJC_IVAR___APTimeSpentEntry_contentId]);
}

@end
