@implementation MPModelResponse

- (BOOL)hasVideoArtwork
{
  return variable initialization expression of Library.Context.useDownloadedContentOnly() & 1;
}

- (BOOL)hasVideoArtworkAt:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = type metadata accessor for IndexPath(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  LOBYTE(a3) = variable initialization expression of Library.Context.useDownloadedContentOnly();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a3 & 1;
}

@end
