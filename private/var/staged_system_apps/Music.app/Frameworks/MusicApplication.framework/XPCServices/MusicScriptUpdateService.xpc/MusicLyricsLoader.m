@implementation MusicLyricsLoader

+ (BOOL)supportsLyricsFor:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = _s11MusicCoreUI12LyricsLoaderC08supportsD03forSbSo11MPModelSongC_tFZ_0(v3);

  return v4 & 1;
}

- (MusicLyricsLoader)init
{
  return (MusicLyricsLoader *)LyricsLoader.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicLyricsLoader_lyricsOperations));

}

@end
