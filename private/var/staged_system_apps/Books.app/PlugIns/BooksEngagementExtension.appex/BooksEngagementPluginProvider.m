@implementation BooksEngagementPluginProvider

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
  sub_10000A45C(v10, ObjCClassMetadata, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  sub_10000B430(v10);
}

- (_TtC24BooksEngagementExtension29BooksEngagementPluginProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BooksEngagementPluginProvider();
  return -[BooksEngagementPluginProvider init](&v3, "init");
}

@end
