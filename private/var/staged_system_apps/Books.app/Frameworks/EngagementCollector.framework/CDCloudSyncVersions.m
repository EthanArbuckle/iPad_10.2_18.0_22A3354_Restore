@implementation CDCloudSyncVersions

- (id)mutableCopy
{
  char *v3;
  CDCloudSyncVersions *v4;
  id v5;

  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for CDMutableCloudSyncVersions());
  v4 = self;
  v5 = sub_1E298(v4, v3);

  return v5;
}

- (NSPersistentHistoryToken)historyToken
{
  CDCloudSyncVersions *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1C8D0();

  return (NSPersistentHistoryToken *)v3;
}

- (void)setHistoryToken:(id)a3
{
  id v5;
  CDCloudSyncVersions *v6;

  v5 = a3;
  v6 = self;
  sub_1CBB8(a3);

}

- (CDCloudSyncVersions)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CDCloudSyncVersions();
  return -[CDCloudSyncVersions initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

@end
