@implementation MapsFindMyLocationHandle

- (_TtC4Maps18SearchFindMyHandle)handle
{
  return (_TtC4Maps18SearchFindMyHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_handle));
}

- (_TtC4Maps20SearchFindMyLocation)location
{
  return (_TtC4Maps20SearchFindMyLocation *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location));
}

- (void)setLocation:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps24MapsFindMyLocationHandle)initWithHandle:(id)a3 location:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _TtC4Maps24MapsFindMyLocationHandle *v12;
  objc_super v14;

  v6 = OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_location) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24MapsFindMyLocationHandle_handle) = (Class)a3;
  v7 = *(Class *)((char *)&self->super.isa + v6);
  *(Class *)((char *)&self->super.isa + v6) = (Class)a4;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v9;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for MapsFindMyLocationHandle();
  v12 = -[MapsFindMyLocationHandle init](&v14, "init");

  return v12;
}

- (NSString)description
{
  return (NSString *)sub_1001EE654(self, (uint64_t)a2, (void (*)(void))sub_1001EEA50);
}

- (id)title
{
  _TtC4Maps24MapsFindMyLocationHandle *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  v3 = Handle.prettyName.getter();
  if (!v4)
    Handle.identifier.getter(v3);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();

  swift_bridgeObjectRelease(v5);
  return v6;
}

- (_TtC4Maps24MapsFindMyLocationHandle)init
{
  _TtC4Maps24MapsFindMyLocationHandle *result;

  result = (_TtC4Maps24MapsFindMyLocationHandle *)_swift_stdlib_reportUnimplementedInitializer("Maps.MapsFindMyLocationHandle", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
