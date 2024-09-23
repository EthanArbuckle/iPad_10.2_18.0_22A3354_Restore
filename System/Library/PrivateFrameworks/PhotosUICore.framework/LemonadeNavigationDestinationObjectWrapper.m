@implementation LemonadeNavigationDestinationObjectWrapper

- (BOOL)isEqual:(id)a3
{
  _TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper *v4;
  _TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A7AE46D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A6B89C68((uint64_t)v8);

  sub_1A68AE2FC((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper *v3;
  int64_t v4;
  _BYTE v6[72];

  sub_1A7AE4F04();
  v3 = self;
  sub_1A6B88724((uint64_t)v6);
  v4 = sub_1A7AE4F40();

  return v4;
}

- (NSString)itemIdentifier
{
  void *v2;

  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v2 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper)init
{
  _TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper *result;

  result = (_TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A67EC0B0((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore42LemonadeNavigationDestinationObjectWrapper_wrappedValue, type metadata accessor for LemonadeNavigationDestination);
  swift_bridgeObjectRelease();
}

@end
