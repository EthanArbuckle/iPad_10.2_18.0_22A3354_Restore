@implementation NewsEngagementPluginProvider

+ (void)performRequestWithObject:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjCClassMetadata;
  _QWORD v10[4];

  v6 = _Block_copy(a4);
  v8 = swift_unknownObjectRetain(a3, v7);
  _bridgeAnyObjectToAny(_:)(v10, v8);
  swift_unknownObjectRelease(a3);
  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  sub_1000088D0(v10, ObjCClassMetadata, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  sub_100006010(v10);
}

- (_TtC23NewsEngagementExtension28NewsEngagementPluginProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[NewsEngagementPluginProvider init](&v3, "init");
}

@end
