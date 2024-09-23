@implementation PFSharedDispatchQueues

+ (id)localAssetSupportWorkQueue
{
  if (qword_1ED2A93F0 != -1)
    swift_once();
  return (id)qword_1ED2A93E0;
}

- (PFSharedDispatchQueues)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SharedDispatchQueues();
  return -[PFSharedDispatchQueues init](&v3, sel_init);
}

@end
