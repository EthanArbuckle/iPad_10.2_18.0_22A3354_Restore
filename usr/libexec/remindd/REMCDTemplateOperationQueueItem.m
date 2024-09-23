@implementation REMCDTemplateOperationQueueItem

- (NSString)description
{
  REMCDTemplateOperationQueueItem *v2;
  NSString v3;

  v2 = self;
  sub_1001AA38C();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (REMCDTemplateOperationQueueItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  return -[REMCDTemplateOperationQueueItem initWithEntity:insertIntoManagedObjectContext:](&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

@end
