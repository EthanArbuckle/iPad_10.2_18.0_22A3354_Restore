@implementation DebugViewControllerRemoteConfig

- (DebugViewControllerRemoteConfig)initWithOwner:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___DebugViewControllerRemoteConfig_owner, 0);
  swift_unknownObjectWeakAssign(v6, a3);
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[DebugViewControllerRemoteConfig init](&v8, "init");
}

- (DebugViewControllerRemoteConfig)init
{
  DebugViewControllerRemoteConfig *result;

  result = (DebugViewControllerRemoteConfig *)_swift_stdlib_reportUnimplementedInitializer("Books.RemoteConfig", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___DebugViewControllerRemoteConfig_owner);
}

- (BKDebugViewSection)section
{
  DebugViewControllerRemoteConfig *v2;
  id v3;

  v2 = self;
  v3 = sub_100321D58();

  return (BKDebugViewSection *)v3;
}

@end
