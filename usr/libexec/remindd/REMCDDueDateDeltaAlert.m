@implementation REMCDDueDateDeltaAlert

- (REMCDDueDateDeltaAlert)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  return -[REMCDDueDateDeltaAlert initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

+ (NSString)cdEntityName
{
  uint64_t v2;
  NSString v3;
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v2 = sub_10001A630((uint64_t *)&unk_100850A90);
  String.init<A>(describing:)(&ObjCClassMetadata, v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)conformsToREMChangeTrackingIdentifiable
{
  return 1;
}

- (id)remChangedObjectID
{
  REMCDDueDateDeltaAlert *v2;
  id v3;

  v2 = self;
  v3 = REMCDDueDateDeltaAlert.remChangedObjectID()();

  return v3;
}

- (REMObjectID)remObjectID
{
  REMCDDueDateDeltaAlert *v2;
  id v3;

  v2 = self;
  v3 = REMCDDueDateDeltaAlert.remChangedObjectID()();

  return (REMObjectID *)v3;
}

- (id)remObjectIDWithError:(id *)a3
{
  REMCDDueDateDeltaAlert *v3;
  void *v4;
  void *v5;

  v3 = self;
  REMCDDueDateDeltaAlert.checkedREMObjectID()();
  v5 = v4;

  return v5;
}

+ (id)objectIDWithUUID:(id)a3
{
  uint64_t ObjCClassMetadata;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  Class isa;
  NSString v12;
  id v13;
  uint64_t v15;
  uint64_t v16;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v16 = ObjCClassMetadata;
  v9 = sub_10001A630((uint64_t *)&unk_100850A90);
  String.init<A>(describing:)(&v16, v9);
  v10 = objc_allocWithZone((Class)REMObjectID);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend(v10, "initWithUUID:entityName:", isa, v12, swift_bridgeObjectRelease().n128_f64[0]);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

@end
