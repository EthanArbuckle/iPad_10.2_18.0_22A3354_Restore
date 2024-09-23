@implementation RDStoreControllerMigrator_IsPinnedByCurrentUser

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  _TtC7remindd47RDStoreControllerMigrator_IsPinnedByCurrentUser *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  RDStoreControllerMigrator_IsPinnedByCurrentUser.migrateStoreIfNeeded(_:metadata:)((NSPersistentStore)v6, (NSMutableDictionary)v7);

}

- (_TtC7remindd47RDStoreControllerMigrator_IsPinnedByCurrentUser)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDStoreControllerMigrator_IsPinnedByCurrentUser();
  return -[RDStoreControllerMigrator_IsPinnedByCurrentUser init](&v3, "init");
}

@end
