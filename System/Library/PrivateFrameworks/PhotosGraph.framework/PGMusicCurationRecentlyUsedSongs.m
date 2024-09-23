@implementation PGMusicCurationRecentlyUsedSongs

- (void)addWithSongIDDateMap:(id)a3
{
  uint64_t v4;
  PGMusicCurationRecentlyUsedSongs *v5;

  sub_1CA85A5B0();
  v4 = sub_1CA85B414();
  v5 = self;
  RecentlyUsedSongs.add(songIDDateMap:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)addSongIDs:(id)a3 date:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  PGMusicCurationRecentlyUsedSongs *v10;
  uint64_t v11;

  v5 = sub_1CA85A5B0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CA85B7B0();
  sub_1CA85A574();
  v10 = self;
  RecentlyUsedSongs.add(songIDs:date:)(v9, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (id)allEntries
{
  void *v2;

  swift_beginAccess();
  sub_1CA85A5B0();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B3FC();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)appendWithOtherRecentlyUsed:(id)a3
{
  id v5;
  PGMusicCurationRecentlyUsedSongs *v6;
  uint64_t v7;

  swift_beginAccess();
  v5 = a3;
  v6 = self;
  v7 = swift_bridgeObjectRetain();
  sub_1CA27B458(v7, (void (*)(uint64_t, uint64_t, char *))sub_1CA27C678);

  swift_bridgeObjectRelease();
}

- (PGMusicCurationRecentlyUsedSongs)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCurationRecentlyUsedSongs_mostRecentlyUsedSongIDDateMap) = (Class)MEMORY[0x1E0DEE9E0];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[PGMusicCurationRecentlyUsedSongs init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)addMusicCuration:(id)a3 date:(id)a4
{
  sub_1CA2774CC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))RecentlyUsedSongs.add(curation:date:));
}

- (void)addFlexMusicCuration:(id)a3 date:(id)a4
{
  sub_1CA2774CC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))RecentlyUsedSongs.add(flexCuration:date:));
}

- (NSString)description
{
  PGMusicCurationRecentlyUsedSongs *v2;
  void *v3;

  v2 = self;
  RecentlyUsedSongs.description.getter();

  v3 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (id)recentlyUsedAppleMusicSongsFromPhotoLibrary:(id)a3
{
  return sub_1CA277A40((uint64_t)a1, (uint64_t)a2, a3, 0);
}

+ (id)recentlyUsedFlexMusicSongsFromPhotoLibrary:(id)a3
{
  return sub_1CA277A40((uint64_t)a1, (uint64_t)a2, a3, 1);
}

+ (id)recentlyUsedFlexMusicSongsForCollectionsFromPhotoLibrary:(id)a3 error:(id *)a4
{
  return sub_1CA277AE4((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1CA27C0C8);
}

+ (id)recentlyUsedAppleMusicSongsForCollectionsFromPhotoLibrary:(id)a3 error:(id *)a4
{
  return sub_1CA277AE4((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1CA27C36C);
}

@end
