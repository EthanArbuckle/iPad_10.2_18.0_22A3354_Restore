@implementation CacheDeleteNotifications

- (void)cacheDeleteObserver:(id)a3 didIdentifyCacheDeletedPath:(id)a4 deletedAtDate:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC18PodcastsFoundation24CacheDeleteNotifications *v17;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1A93F8040();
  v13 = v12;
  if (a5)
  {
    sub_1A93F7368();
    v14 = sub_1A93F738C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v10, 0, 1, v14);
  }
  else
  {
    v15 = sub_1A93F738C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v10, 1, 1, v15);
  }
  v16 = a3;
  v17 = self;
  sub_1A92D3DE8(v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  sub_1A905FD54((uint64_t)v10, (uint64_t *)&unk_1ED2AD360);
}

- (void)cacheDeleteObserverBecameSynchronizedWithFileSystem:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  _TtC18PodcastsFoundation24CacheDeleteNotifications *v14;
  uint64_t v15;

  v5 = type metadata accessor for CacheDeleteNotifications.CacheDeleteEvent(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AA430);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABBB8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  v13 = a3;
  v14 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC20);
  sub_1A93F84E4();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

}

- (_TtC18PodcastsFoundation24CacheDeleteNotifications)init
{
  _TtC18PodcastsFoundation24CacheDeleteNotifications *result;

  result = (_TtC18PodcastsFoundation24CacheDeleteNotifications *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation24CacheDeleteNotifications_stream;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC58);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation24CacheDeleteNotifications_continuation;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_release();
}

@end
