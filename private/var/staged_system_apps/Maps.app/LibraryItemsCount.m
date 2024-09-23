@implementation LibraryItemsCount

- (int64_t)guidesCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_guidesCount);
}

- (void)setGuidesCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_guidesCount) = (Class)a3;
}

- (int64_t)pinnedPlacesCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_pinnedPlacesCount);
}

- (void)setPinnedPlacesCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_pinnedPlacesCount) = (Class)a3;
}

- (int64_t)placesCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_placesCount);
}

- (void)setPlacesCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_placesCount) = (Class)a3;
}

- (int64_t)routesCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_routesCount);
}

- (void)setRoutesCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_routesCount) = (Class)a3;
}

- (_TtC4Maps17LibraryItemsCount)initWithGuidesCount:(int64_t)a3 pinnedPlacesCount:(int64_t)a4 placesCount:(int64_t)a5 routesCount:(int64_t)a6
{
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_guidesCount) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_pinnedPlacesCount) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_placesCount) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps17LibraryItemsCount_routesCount) = (Class)a6;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LibraryItemsCount();
  return -[LibraryItemsCount init](&v7, "init");
}

- (int64_t)total
{
  _TtC4Maps17LibraryItemsCount *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1001CB398();

  return v3;
}

- (id)descriptionForLibrarySectionInHome
{
  _TtC4Maps17LibraryItemsCount *v2;
  void *object;
  NSString v4;

  v2 = self;
  object = LibraryItemsCount.descriptionForLibrarySectionInHome()()._object;

  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return v4;
}

- (id)createCopy
{
  _TtC4Maps17LibraryItemsCount *v2;
  id v3;

  v2 = self;
  v3 = sub_1001CB8B8();

  return v3;
}

- (_TtC4Maps17LibraryItemsCount)init
{
  _TtC4Maps17LibraryItemsCount *result;

  result = (_TtC4Maps17LibraryItemsCount *)_swift_stdlib_reportUnimplementedInitializer("Maps.LibraryItemsCount", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
