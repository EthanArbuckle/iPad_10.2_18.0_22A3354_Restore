@implementation BEDocumentPaginationDataInfo

- (CGSize)pageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_10AE54((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_pageSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  sub_10AEEC((uint64_t)self, a3.width, a3.height, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_pageSize);
}

- (int64_t)pageCount
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageCount);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageCount, v4, 0, 0);
  return *v2;
}

- (void)setPageCount:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageCount);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageCount, v5, 1, 0);
  *v4 = a3;
}

- (CGSize)contentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_10AE54((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  sub_10AEEC((uint64_t)self, a3.width, a3.height, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_contentSize);
}

- (int64_t)pageOffset
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageOffset);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageOffset, v4, 0, 0);
  return *v2;
}

- (void)setPageOffset:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageOffset);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_pageOffset, v5, 1, 0);
  *v4 = a3;
}

- (int64_t)paginationDirection
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_paginationDirection);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_paginationDirection, v4, 0, 0);
  return *v2;
}

- (void)setPaginationDirection:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_paginationDirection);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_paginationDirection, v5, 1, 0);
  *v4 = a3;
}

- (int64_t)navigationDirection
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_navigationDirection);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_navigationDirection, v4, 0, 0);
  return *v2;
}

- (void)setNavigationDirection:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_navigationDirection);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocumentPaginationDataInfo_navigationDirection, v5, 1, 0);
  *v4 = a3;
}

- (NSArray)userAnnotations
{
  return (NSArray *)sub_10B83C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_userAnnotations);
}

- (void)setUserAnnotations:(id)a3
{
  sub_10B90C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEDocumentPaginationDataInfo_userAnnotations);
}

- (NSDictionary)navigationAnchors
{
  return (NSDictionary *)sub_10B4E8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_navigationAnchors);
}

- (void)setNavigationAnchors:(id)a3
{
  sub_10B588((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEDocumentPaginationDataInfo_navigationAnchors);
}

- (NSDictionary)mediaElements
{
  return (NSDictionary *)sub_10B4E8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_mediaElements);
}

- (void)setMediaElements:(id)a3
{
  sub_10B588((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEDocumentPaginationDataInfo_mediaElements);
}

- (NSArray)navigationAnchorItems
{
  return (NSArray *)sub_10B83C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_navigationAnchorItems);
}

- (void)setNavigationAnchorItems:(id)a3
{
  sub_10B90C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEDocumentPaginationDataInfo_navigationAnchorItems);
}

- (NSArray)landmarkAnchorItems
{
  return (NSArray *)sub_10B83C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_landmarkAnchorItems);
}

- (void)setLandmarkAnchorItems:(id)a3
{
  sub_10B90C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEDocumentPaginationDataInfo_landmarkAnchorItems);
}

- (NSArray)physicalPageAnchors
{
  return (NSArray *)sub_10B83C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_physicalPageAnchors);
}

- (void)setPhysicalPageAnchors:(id)a3
{
  sub_10B90C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEDocumentPaginationDataInfo_physicalPageAnchors);
}

- (NSArray)bookmarks
{
  return (NSArray *)sub_10B83C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_bookmarks);
}

- (void)setBookmarks:(id)a3
{
  sub_10B90C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEDocumentPaginationDataInfo_bookmarks);
}

- (NSArray)historyEntries
{
  return (NSArray *)sub_10B83C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocumentPaginationDataInfo_historyEntries);
}

- (void)setHistoryEntries:(id)a3
{
  sub_10B90C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BEDocumentPaginationDataInfo_historyEntries);
}

- (BEDocumentPaginationDataInfo)initWithPageSize:(CGSize)a3 pageCount:(int64_t)a4 contentSize:(CGSize)a5 pageOffset:(int64_t)a6 paginationDirection:(int64_t)a7 documentNavigationDirection:(int64_t)a8
{
  return (BEDocumentPaginationDataInfo *)DocumentPaginationDataInfo.init(pageSize:pageCount:contentSize:pageOffset:paginationDirection:documentNavigationDirection:)(a4, a6, a7, a8, a3.width, a3.height, a5.width, a5.height);
}

- (BEDocumentPaginationDataInfo)init
{
  BEDocumentPaginationDataInfo *result;

  result = (BEDocumentPaginationDataInfo *)_swift_stdlib_reportUnimplementedInitializer("AEBookPlugins.DocumentPaginationDataInfo", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BEDocumentPaginationDataInfo_userAnnotations));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BEDocumentPaginationDataInfo_navigationAnchors));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDocumentPaginationDataInfo_mediaElements));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BEDocumentPaginationDataInfo_navigationAnchorItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BEDocumentPaginationDataInfo_landmarkAnchorItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BEDocumentPaginationDataInfo_physicalPageAnchors));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDocumentPaginationDataInfo_bookmarks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDocumentPaginationDataInfo_historyEntries));
}

@end
