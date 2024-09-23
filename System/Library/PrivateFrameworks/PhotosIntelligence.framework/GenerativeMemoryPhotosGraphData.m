@implementation GenerativeMemoryPhotosGraphData

+ (id)getCuratedAssetPlaybackTimeRangesFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  swift_getObjCClassMetadata();
  v4 = a3;
  static GenerativeMemoryPhotosGraphData.getCuratedAssetPlaybackTimeRanges(for:)(v4);
  v6 = v5;

  return v6;
}

+ (id)parsePromptInformationAsDictionaryWithMemory:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  swift_getObjCClassMetadata();
  v5 = a3;
  static GenerativeMemoryPhotosGraphData.parsePromptInformationAsDictionary(memory:)(v5);

  v6 = (void *)sub_243F84CC4();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC18PhotosIntelligence31GenerativeMemoryPhotosGraphData)init
{
  GenerativeMemoryPhotosGraphData.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  _BYTE v5[512];

  v3 = (char *)self + OBJC_IVAR____TtC18PhotosIntelligence31GenerativeMemoryPhotosGraphData_logger;
  v4 = sub_243F84A00();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  memcpy(v5, (char *)self + OBJC_IVAR____TtC18PhotosIntelligence31GenerativeMemoryPhotosGraphData_storyMusicCuration, sizeof(v5));
  sub_243D177C8((uint64_t)v5);
}

@end
