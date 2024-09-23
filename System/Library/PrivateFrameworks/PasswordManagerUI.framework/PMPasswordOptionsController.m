@implementation PMPasswordOptionsController

+ (id)makePasswordOptionsViewController
{
  type metadata accessor for PMPasswordOptionsViewController();
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

- (PMPasswordOptionsController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMPasswordOptionsController;
  return -[PMPasswordOptionsController init](&v3, sel_init);
}

@end
