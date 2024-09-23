@implementation MapsFindMyHandle

- (_TtC4Maps16MapsFindMyHandle)initWithIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC4Maps16MapsFindMyHandle *v12;
  unint64_t v13;
  objc_class *MyHandle;
  objc_super v16;

  v5 = type metadata accessor for Handle(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = self;
  v13 = sub_1001DA8C4((uint64_t)_swiftEmptyArrayStorage);
  Handle.init(withID:serverID:pushIdentifiers:expiresByGroupId:siblingIdentifiers:)(v9, v11, 0, 0, _swiftEmptyArrayStorage, v13, _swiftEmptyArrayStorage);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v12 + OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle, v8, v5);

  MyHandle = (objc_class *)type metadata accessor for MapsFindMyHandle(0);
  v16.receiver = v12;
  v16.super_class = MyHandle;
  return -[MapsFindMyHandle init](&v16, "init");
}

- (_TtC4Maps16MapsFindMyHandle)initWithSearchFindMyHandle:(id)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v4 = (char *)a3 + OBJC_IVAR____TtC4Maps18SearchFindMyHandle_handle;
  v5 = (char *)self + OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle;
  v6 = type metadata accessor for Handle(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v5, v4, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MapsFindMyHandle(0);
  return -[MapsFindMyHandle init](&v8, "init");
}

- (BOOL)isEqual:(id)a3
{
  _TtC4Maps16MapsFindMyHandle *v5;
  _TtC4Maps16MapsFindMyHandle *v6;
  char v7;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = sub_10011324C((uint64_t)v9);

  sub_10000C180((uint64_t)v9);
  return v7 & 1;
}

- (NSString)identifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC4Maps16MapsFindMyHandle *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  uint64_t v12;

  v3 = type metadata accessor for Handle(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, (char *)self + OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle, v3);
  v7 = self;
  Handle.identifier.getter();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return (NSString *)v10;
}

- (NSSet)phoneNumbers
{
  _TtC4Maps16MapsFindMyHandle *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_100113530();

  sub_100114664();
  sub_1001146A0();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSSet *)isa;
}

- (NSSet)emailAddresses
{
  _TtC4Maps16MapsFindMyHandle *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_1001139E0();

  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSSet *)isa;
}

- (NSString)prettyName
{
  return (NSString *)sub_10009F900(self, (uint64_t)a2, (void (*)(void))sub_100113D30);
}

- (NSString)displayName
{
  _TtC4Maps16MapsFindMyHandle *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100113D90();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)spokenName
{
  return (NSString *)sub_10009F900(self, (uint64_t)a2, (void (*)(void))sub_100113F60);
}

- (CNContact)contact
{
  _TtC4Maps16MapsFindMyHandle *v2;
  id v3;

  v2 = self;
  v3 = sub_100114194();

  return (CNContact *)v3;
}

- (id)thumbnailIconWithScale:(double)a3 size:(CGSize)a4
{
  double height;
  double width;
  _TtC4Maps16MapsFindMyHandle *v7;
  id v8;

  height = a4.height;
  width = a4.width;
  v7 = self;
  v8 = sub_100114378(a3, width, height);

  return v8;
}

- (_TtC4Maps16MapsFindMyHandle)init
{
  _TtC4Maps16MapsFindMyHandle *result;

  result = (_TtC4Maps16MapsFindMyHandle *)_swift_stdlib_reportUnimplementedInitializer("Maps.MapsFindMyHandle", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle;
  v3 = type metadata accessor for Handle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
