@implementation PUIFeedManagerArtworkBridge

+ (PUIFeedManagerArtworkBridge)shared
{
  if (qword_1F02687F8 != -1)
    swift_once();
  swift_beginAccess();
  return (PUIFeedManagerArtworkBridge *)(id)qword_1F026E4A0;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1F02687F8;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1F026E4A0;
  qword_1F026E4A0 = (uint64_t)v4;

}

- (void)invalidateArtworkForPodcast:(id)a3
{
  id v4;
  PUIFeedManagerArtworkBridge *v5;

  v4 = a3;
  v5 = self;
  sub_1DA642620((unint64_t)v4);

}

- (void)updateArtworkForShow:(id)a3 useBackgroundFetch:(BOOL)a4 fetchUberImage:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  PUIFeedManagerArtworkBridge *v8;

  v5 = a5;
  v7 = a3;
  v8 = self;
  sub_1DA643D2C(v7, v5);

}

- (PUIFeedManagerArtworkBridge)init
{
  PUIFeedManagerArtworkBridge *result;

  result = (PUIFeedManagerArtworkBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_imageProvider);
  sub_1DA47F880((uint64_t)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_caches, (uint64_t (*)(_QWORD))type metadata accessor for AssetCaches);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_imageStore);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_fileManager);

  v3 = (char *)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_signposter;
  v4 = sub_1DA66DDD4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
