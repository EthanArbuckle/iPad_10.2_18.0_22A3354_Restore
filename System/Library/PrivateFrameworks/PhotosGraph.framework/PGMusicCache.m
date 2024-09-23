@implementation PGMusicCache

+ (id)cacheWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v4;
  char *v5;

  v4 = a3;
  v5 = sub_1CA2CEAA8(v4);

  return v5;
}

+ (id)cacheAtURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v10;

  v4 = sub_1CA85A424();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CA85A3F4();
  v8 = sub_1CA2CE368((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (BOOL)removeAllWithProgressReporter:(id)a3 error:(id *)a4
{
  id v5;
  PGMusicCache *v6;

  v5 = a3;
  v6 = self;
  MusicCache.removeAll(progressReporter:)();

  return 1;
}

- (PGMusicCache)init
{
  PGMusicCache *result;

  result = (PGMusicCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PGMusicCache_cacheURL;
  v4 = sub_1CA85A424();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (BOOL)removeSongSourcesWithSongSourceCategory:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  PGMusicCache *v12;

  v7 = sub_1CA85B534();
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872760);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1CA8D4E40;
  *(_QWORD *)(v10 + 32) = v7;
  *(_QWORD *)(v10 + 40) = v9;
  v11 = a4;
  v12 = self;
  swift_bridgeObjectRetain();
  MusicCache.removeSongSources(songSourceCategories:progressReporter:)(v10);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)removeSongSourcesWithSongSourceCategories:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  PGMusicCache *v9;

  v7 = sub_1CA85B7B0();
  v8 = a4;
  v9 = self;
  MusicCache.removeSongSources(songSourceCategories:progressReporter:)(v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (id)statusAndReturnError:(id *)a3
{
  PGMusicCache *v3;
  void *v4;

  v3 = self;
  sub_1CA85BC30();

  v4 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return v4;
}

@end
