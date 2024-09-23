@implementation DownloadableURLOptions

- (id)init:(id)a3 nonAppInitiated:(BOOL)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_1A93F8040();
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18PodcastsFoundation22DownloadableURLOptions_urlRawString);
  *v8 = v7;
  v8[1] = v9;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation22DownloadableURLOptions_nonAppInitiated) = a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[DownloadableURLOptions init](&v11, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (NSURL)url
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC18PodcastsFoundation22DownloadableURLOptions *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AD3D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1A93F7248();

  v7 = sub_1A93F726C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A93F71A0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (BOOL)nonAppInitiated
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC18PodcastsFoundation22DownloadableURLOptions_nonAppInitiated;
  swift_beginAccess();
  return *v2;
}

- (NSString)urlRawString
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setNonAppInitiated:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC18PodcastsFoundation22DownloadableURLOptions_nonAppInitiated;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC18PodcastsFoundation22DownloadableURLOptions)initWithUrl:(id)a3 nonAppInitiated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _TtC18PodcastsFoundation22DownloadableURLOptions *v11;
  uint64_t v13;

  v4 = a4;
  v6 = sub_1A93F726C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7200();
  sub_1A93F7170();
  v10 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  v11 = -[DownloadableURLOptions init:nonAppInitiated:](self, sel_init_nonAppInitiated_, v10, v4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (_TtC18PodcastsFoundation22DownloadableURLOptions)init
{
  _TtC18PodcastsFoundation22DownloadableURLOptions *result;

  result = (_TtC18PodcastsFoundation22DownloadableURLOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
