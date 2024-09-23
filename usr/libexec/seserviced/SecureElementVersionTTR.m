@implementation SecureElementVersionTTR

+ (void)kickoff
{
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  sub_1002084D4(ObjCClassMetadata);
}

- (_TtC10seserviced23SecureElementVersionTTR)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[SecureElementVersionTTR init](&v3, "init");
}

@end
