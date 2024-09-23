@implementation WKWallpaperPosterLook

- (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook)initWithIdentifier:(id)a3 displayName:(id)a4
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_1B8CE14B8();
  v8 = v7;
  v9 = sub_1B8CE14B8();
  v10 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook_identifier);
  *v10 = v6;
  v10[1] = v8;
  v11 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook_displayName);
  *v11 = v9;
  v11[1] = v12;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return -[WKWallpaperPosterLook init](&v14, sel_init);
}

- (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook)initWithDisplayName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  _TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook *v10;
  uint64_t v12;

  v4 = sub_1B8CE0E58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8CE14B8();
  sub_1B8CE0E4C();
  sub_1B8CE0E28();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v8 = (void *)sub_1B8CE1494();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_1B8CE1494();
  swift_bridgeObjectRelease();
  v10 = -[WKWallpaperPosterLook initWithIdentifier:displayName:](self, sel_initWithIdentifier_displayName_, v8, v9);

  return v10;
}

- (NSString)displayName
{
  return (NSString *)sub_1B8CCBEE4();
}

- (void)setDisplayName:(id)a3
{
  sub_1B8CCBF38((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook_displayName);
}

- (NSString)identifier
{
  return (NSString *)sub_1B8CCBEE4();
}

- (void)setIdentifier:(id)a3
{
  sub_1B8CCBF38((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook_identifier);
}

- (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook)init
{
  _TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook *result;

  result = (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
