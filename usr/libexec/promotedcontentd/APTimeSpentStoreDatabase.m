@implementation APTimeSpentStoreDatabase

- (APTimeSpentStoreDatabase)initWithDatabase:(id)a3
{
  id v5;
  APTimeSpentStoreDatabase *v6;
  uint64_t v7;
  uint64_t v8;
  APTimeSpentStoreDatabase *v9;
  objc_super v11;

  sub_10003E180(0, (unint64_t *)&qword_100264750, OS_os_log_ptr);
  v5 = a3;
  v6 = self;
  v7 = OS_os_log.init(subsystem:category:)(0xD000000000000015, 0x80000001001ED670, 0x6E657053656D6954, 0xEE0065726F745374);
  v8 = type metadata accessor for DatabaseManager(0);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___APTimeSpentStoreDatabase_database) = (Class)DatabaseManager.init(database:log:)(v5, v7);

  v11.receiver = v6;
  v11.super_class = (Class)APTimeSpentStoreDatabase;
  v9 = -[APTimeSpentStoreDatabase init](&v11, "init");

  return v9;
}

- (id)retrieveTimeSpentEntriesOlderThan:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  APTimeSpentStoreDatabase *v9;
  uint64_t v10;
  Class isa;
  uint64_t v13;

  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = APTimeSpentStoreDatabase.retrieveTimeSpentEntriesOlderThan(_:)((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (!v10)
    return 0;
  type metadata accessor for APTimeSpentEntry();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

- (void)removeEntriesForContentIds:(id)a3
{
  Swift::OpaquePointer v4;
  APTimeSpentStoreDatabase *v5;

  v4._rawValue = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v5 = self;
  APTimeSpentStoreDatabase.removeEntries(forContentIds:)(v4);

  swift_bridgeObjectRelease(v4._rawValue);
}

- (void)storeEntryForContentId:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  APTimeSpentStoreDatabase *v12;
  NSString v13;
  Class isa;
  uint64_t v15;

  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v11 = v10;
  v12 = self;
  v13 = String._bridgeToObjectiveC()();
  Date.init()();
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  -[APTimeSpentStoreDatabase storeEntryForContentId:timeStamp:](v12, "storeEntryForContentId:timeStamp:", v13, isa);

  swift_bridgeObjectRelease(v11);
}

- (void)storeEntryForContentId:(id)a3 timeStamp:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  APTimeSpentStoreDatabase *v15;
  uint64_t v16;

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  v14 = v13;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = self;
  APTimeSpentStoreDatabase.storeEntry(forContentId:timeStamp:)(v12, v14, (uint64_t)v10);

  swift_bridgeObjectRelease(v14);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (APTimeSpentStoreDatabase)init
{
  APTimeSpentStoreDatabase *result;

  result = (APTimeSpentStoreDatabase *)_swift_stdlib_reportUnimplementedInitializer("__ObjC.APTimeSpentStoreDatabase", 31, ", 0, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___APTimeSpentStoreDatabase_database));
}

@end
