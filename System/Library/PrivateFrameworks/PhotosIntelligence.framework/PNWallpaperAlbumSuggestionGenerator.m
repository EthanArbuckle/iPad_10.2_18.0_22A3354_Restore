@implementation PNWallpaperAlbumSuggestionGenerator

- (PNWallpaperAlbumSuggestionGenerator)initWithAssetCollection:(id)a3 photoLibrary:(id)a4
{
  return (PNWallpaperAlbumSuggestionGenerator *)WallpaperAlbumSuggestionGenerator.init(assetCollection:photoLibrary:)(a3, a4);
}

- (id)updateSuggestionsForDate:(id)a3 numberOfSuggestions:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  PNWallpaperAlbumSuggestionGenerator *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_243F83D7C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243F83D4C();
  v11 = self;
  v12 = (void *)sub_243DE794C((uint64_t)v10, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v12;
}

- (id)assetsForDate:(id)a3 numberOfAssets:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  PNWallpaperAlbumSuggestionGenerator *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_243F83D7C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243F83D4C();
  v11 = self;
  sub_243DE8004(v10, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_243C5B8A4(0, (unint64_t *)&qword_2543D29B0);
  v12 = (void *)sub_243F85108();
  swift_bridgeObjectRelease();
  return v12;
}

- (PNWallpaperAlbumSuggestionGenerator)init
{
  WallpaperAlbumSuggestionGenerator.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)cloudIdentifierForShuffleUserAlbumWithAssetCollection:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  static WallpaperAlbumSuggestionGenerator.cloudIdentifierForShuffleUserAlbum(assetCollection:photoLibrary:)();
  v8 = v7;

  if (v8)
  {
    v9 = (void *)sub_243F84E08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)shuffleUserAlbumForCloudIdentifier:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  sub_243F84E2C();
  v5 = a4;
  static WallpaperAlbumSuggestionGenerator.shuffleUserAlbumForCloudIdentifier(_:photoLibrary:)();
  v7 = v6;

  swift_bridgeObjectRelease();
  return v7;
}

@end
