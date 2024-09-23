@implementation REMCKSharedEntitySyncActivity

+ (NSString)cdEntityName
{
  uint64_t v2;
  NSString v3;
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v2 = sub_10001A630(&qword_10083EF48);
  String.init<A>(describing:)(&ObjCClassMetadata, v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)willSave
{
  REMCKSharedEntitySyncActivity *v2;

  v2 = self;
  sub_10020F230();

}

- (REMCKSharedEntitySyncActivity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  return -[REMCKSharedEntitySyncActivity initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

+ (BOOL)conformsToREMChangeTrackingIdentifiable
{
  return 1;
}

- (id)remChangedObjectID
{
  REMCKSharedEntitySyncActivity *v2;
  id v3;

  v2 = self;
  v3 = sub_10020F494();

  return v3;
}

@end
