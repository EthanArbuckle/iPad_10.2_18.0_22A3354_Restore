@implementation REMCDPublicTemplate

+ (NSString)cdEntityName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (REMObjectID)remObjectID
{
  REMCDPublicTemplate *v2;
  id v3;

  v2 = self;
  v3 = sub_10057B2FC();

  return (REMObjectID *)v3;
}

+ (id)newObjectID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  Class isa;
  NSString v9;
  id v10;
  uint64_t v12;

  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()(v4);
  v7 = objc_allocWithZone((Class)REMObjectID);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend(v7, "initWithUUID:entityName:", isa, v9);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v10;
}

+ (id)objectIDWithUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  Class isa;
  NSString v10;
  id v11;
  uint64_t v13;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = objc_allocWithZone((Class)REMObjectID);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend(v8, "initWithUUID:entityName:", isa, v10);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (REMCDPublicTemplate)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  return -[REMCDPublicTemplate initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

@end
