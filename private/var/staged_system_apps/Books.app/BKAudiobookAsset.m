@implementation BKAudiobookAsset

- (id)assetType
{
  return String._bridgeToObjectiveC()();
}

- (id)assetID
{
  return sub_1002481A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAudiobookAsset_audiobookAssetID);
}

- (id)url
{
  id v2;

  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR___BKAudiobookAsset_audiobookURL);
  return v2;
}

- (id)displayTitle
{
  return sub_1002481A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAudiobookAsset_audiobookDisplayTitle);
}

- (BKAudiobookAsset)init
{
  BKAudiobookAsset *result;

  result = (BKAudiobookAsset *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookAsset", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->audiobookAssetID[OBJC_IVAR___BKAudiobookAsset_audiobookAssetID]);
  v3 = (char *)self + OBJC_IVAR___BKAudiobookAsset_audiobookURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->audiobookAssetID[OBJC_IVAR___BKAudiobookAsset_audiobookDisplayTitle]);
}

@end
