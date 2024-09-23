@implementation BookmarkNavigationListItem

- (NSString)glyphImageName
{
  void *v2;

  if (*(NSString **)((char *)&self->super._identifier
                    + OBJC_IVAR____TtC12PhotosUICore26BookmarkNavigationListItem__glyphImageName))
  {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
    v2 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (PXProgrammaticNavigationDestination)destination
{
  _TtC12PhotosUICore26BookmarkNavigationListItem *v2;
  id v3;

  v2 = self;
  v3 = sub_1A6E07ED8();

  return (PXProgrammaticNavigationDestination *)v3;
}

- (_TtC12PhotosUICore26BookmarkNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4 itemCount:(int64_t)a5
{
  _TtC12PhotosUICore26BookmarkNavigationListItem *result;

  result = (_TtC12PhotosUICore26BookmarkNavigationListItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore26BookmarkNavigationListItem_model);
  swift_bridgeObjectRelease();
}

@end
