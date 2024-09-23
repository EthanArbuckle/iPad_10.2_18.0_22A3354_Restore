@implementation SyncControllerFactory

+ (MTSyncControllerProtocol)resolvedSyncController
{
  return (MTSyncControllerProtocol *)objc_msgSend((id)objc_opt_self(MTSyncController), "sharedInstance");
}

+ (Class)resolvedSyncClass
{
  unint64_t v2;

  v2 = sub_1002ED6E0();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC8Podcasts21SyncControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncControllerFactory();
  return -[SyncControllerFactory init](&v3, "init");
}

@end
