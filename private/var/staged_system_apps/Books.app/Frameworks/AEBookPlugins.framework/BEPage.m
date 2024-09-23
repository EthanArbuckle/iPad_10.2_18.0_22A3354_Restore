@implementation BEPage

- (BOOL)snapToContentBoundary
{
  return 1;
}

- (BOOL)occludesSecondayContent
{
  return 0;
}

- (NSArray)annotations
{
  return (NSArray *)sub_1145F8(self, (uint64_t)a2, (uint64_t)&unk_173BF8, (uint64_t)&unk_173C20);
}

- (void)setAnnotations:(id)a3
{
  sub_1146BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_173BF8, (uint64_t)&unk_173C20);
}

- (NSArray)bookmarks
{
  return (NSArray *)sub_1145F8(self, (uint64_t)a2, (uint64_t)&unk_173C50, (uint64_t)&unk_173C78);
}

- (void)setBookmarks:(id)a3
{
  sub_1146BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_173C50, (uint64_t)&unk_173C78);
}

- (NSArray)highlights
{
  return (NSArray *)sub_1145F8(self, (uint64_t)a2, (uint64_t)&unk_173CA8, (uint64_t)&unk_173CD0);
}

- (void)setHighlights:(id)a3
{
  sub_1146BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_173CA8, (uint64_t)&unk_173CD0);
}

- (NSArray)anchors
{
  return (NSArray *)sub_114AF8(self, (uint64_t)a2, (uint64_t)&unk_173D00, (uint64_t)&unk_173D28);
}

- (void)setAnchors:(id)a3
{
  sub_114C28(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_173D00, (uint64_t)&unk_173D28);
}

- (NSArray)mediaElements
{
  return (NSArray *)sub_114AF8(self, (uint64_t)a2, (uint64_t)&unk_173D58, (uint64_t)&unk_173D80);
}

- (void)setMediaElements:(id)a3
{
  sub_114C28(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_173D58, (uint64_t)&unk_173D80);
}

- (NSArray)physicalPageMarkers
{
  return (NSArray *)sub_1151B4(self, (uint64_t)a2, (uint64_t)&unk_173DB8, (uint64_t)&unk_173DE0);
}

- (void)setPhysicalPageMarkers:(id)a3
{
  sub_115288(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_173DB8, (uint64_t)&unk_173DE0);
}

- (NSArray)physicalChapterMarkers
{
  return (NSArray *)sub_1151B4(self, (uint64_t)a2, (uint64_t)&unk_173E18, (uint64_t)&unk_173E40);
}

- (void)setPhysicalChapterMarkers:(id)a3
{
  sub_115288(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_173E18, (uint64_t)&unk_173E40);
}

- (BEPage)init
{
  BEPage *result;

  result = (BEPage *)_swift_stdlib_reportUnimplementedInitializer("AEBookPlugins.Page", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___BEPage__annotations;
  v4 = sub_108F90(&qword_20F310);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___BEPage__bookmarks, v4);
  v5((char *)self + OBJC_IVAR___BEPage__highlights, v4);
  v6 = (char *)self + OBJC_IVAR___BEPage__anchors;
  v7 = sub_108F90(&qword_20F338);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR___BEPage__mediaElements, v7);
  v9 = (char *)self + OBJC_IVAR___BEPage__physicalPageMarkers;
  v10 = sub_108F90(&qword_20F358);
  v11 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___BEPage__physicalChapterMarkers, v10);
}

- (NSString)description
{
  BEPage *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  Page.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

+ (id)generatePagesFrom:(id)a3
{
  _QWORD *v4;
  Class isa;

  swift_unknownObjectRetain(a3);
  v4 = _s13AEBookPlugins4PageC13generatePages4fromSayACGAA30DocumentPaginationDataProvider_p_tFZ_0(a3);
  swift_unknownObjectRelease(a3);
  type metadata accessor for Page(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

@end
