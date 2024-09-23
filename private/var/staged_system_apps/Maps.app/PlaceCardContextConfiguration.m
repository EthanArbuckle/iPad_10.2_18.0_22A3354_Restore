@implementation PlaceCardContextConfiguration

- (_TtC4Maps29PlaceCardContextConfiguration)initWithPlaceCardItem:(id)a3 shouldInsertInHistory:(BOOL)a4 excludedContent:(int64_t)a5
{
  objc_class *ObjectType;
  id v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceCardContextConfiguration_placeCardItem) = (Class)a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceCardContextConfiguration_shouldInsertInHistory) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceCardContextConfiguration_excludedContent) = (Class)a5;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = a3;
  return -[PlaceCardContextConfiguration init](&v12, "init");
}

- (_TtC4Maps29PlaceCardContextConfiguration)init
{
  _TtC4Maps29PlaceCardContextConfiguration *result;

  result = (_TtC4Maps29PlaceCardContextConfiguration *)_swift_stdlib_reportUnimplementedInitializer("Maps.PlaceCardContextConfiguration", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
