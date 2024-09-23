@implementation REMCDAccountListData

+ (id)cdEntityName
{
  return String._bridgeToObjectiveC()();
}

- (REMCDAccountListData)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for REMCDAccountListData();
  return -[REMCDAccountListData initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

@end
