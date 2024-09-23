@implementation RDImageDeduplicationActivityObjC

+ (NSString)SentinelFileName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (id)init
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType(a1);
  return objc_msgSendSuper2(&v2, "init");
}

@end
