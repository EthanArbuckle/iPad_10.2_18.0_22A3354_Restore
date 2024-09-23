@implementation BKContainerHost

- (BKContainerHost)initWithLaunchCoordinator:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContainerHost____lazy_storage___containerManager) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContainerHost____lazy_storage___container) = 0;
  v6 = (char *)self + OBJC_IVAR___BKContainerHost____lazy_storage___resolver;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContainerHost_launchCoordinator) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  swift_unknownObjectRetain(a3);
  return -[BKContainerHost init](&v8, "init");
}

- (TFResolver)bridgedResolver
{
  BKContainerHost *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v2 = self;
  v3 = sub_10001D778();
  Container.resolver.getter(v8);
  swift_release(v3);
  v4 = v9;
  v5 = v10;
  sub_10003F198(v8, v9);
  v6 = (void *)dispatch thunk of ResolverType.bridgedResolver.getter(v4, v5);
  _s5Books15CurrentPageViewVwxx_0(v8);

  return (TFResolver *)v6;
}

- (BKContainerHost)init
{
  BKContainerHost *result;

  result = (BKContainerHost *)_swift_stdlib_reportUnimplementedInitializer("Books.ContainerHost", 19, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContainerHost_launchCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContainerHost____lazy_storage___containerManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContainerHost____lazy_storage___container));
  sub_100010960((uint64_t)self + OBJC_IVAR___BKContainerHost____lazy_storage___resolver, (uint64_t *)&unk_1009E8B70);
}

@end
