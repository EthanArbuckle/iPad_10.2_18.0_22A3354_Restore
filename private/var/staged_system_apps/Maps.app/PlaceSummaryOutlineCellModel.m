@implementation PlaceSummaryOutlineCellModel

- (_TtC4Maps29PlaceSummaryViewModelTemplate)placeSummaryViewModelTemplate
{
  return (_TtC4Maps29PlaceSummaryViewModelTemplate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_placeSummaryViewModelTemplate));
}

- (void)setPlaceSummaryViewModelTemplate:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_placeSummaryViewModelTemplate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_placeSummaryViewModelTemplate) = (Class)a3;
  v3 = a3;

}

- (SearchResult)searchResult
{
  return (SearchResult *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult));
}

- (void)setSearchResult:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult) = (Class)a3;
  v3 = a3;

}

- (ReportASearchAutocompleteResult)rapObject
{
  return (ReportASearchAutocompleteResult *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_rapObject));
}

- (void)setRapObject:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_rapObject);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_rapObject) = (Class)a3;
  v3 = a3;

}

- (_TtP4Maps36PlaceSummaryOutlineCellModelDelegate_)delegate
{
  return (_TtP4Maps36PlaceSummaryOutlineCellModelDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_delegate, a3);
}

- (_TtC4Maps28PlaceSummaryAsyncDataManager)asyncDataManager
{
  return (_TtC4Maps28PlaceSummaryAsyncDataManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_asyncDataManager));
}

- (_TtC4Maps35CuratedGuideViewModelDataDownloader)curatedCollectionImageDownloader
{
  return (_TtC4Maps35CuratedGuideViewModelDataDownloader *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_curatedCollectionImageDownloader);
}

- (_TtC4Maps28PlaceSummaryOutlineCellModel)initWithRapObject:(id)a3 placeSummaryViewModelTemplate:(id)a4 delegate:(id)a5 asyncDataManager:(id)a6 curatedCollectionImageDownloader:(id)a7
{
  return (_TtC4Maps28PlaceSummaryOutlineCellModel *)sub_1000D1D70((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)a5, a6, a7, (uint64_t (*)(id, id, uint64_t, id, id))sub_1000D4184);
}

- (_TtC4Maps28PlaceSummaryOutlineCellModel)initWithSearchResult:(id)a3 placeSummaryViewModelTemplate:(id)a4 delegate:(id)a5 asyncDataManager:(id)a6 curatedCollectionImageDownloader:(id)a7
{
  return (_TtC4Maps28PlaceSummaryOutlineCellModel *)sub_1000D1D70((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)a5, a6, a7, (uint64_t (*)(id, id, uint64_t, id, id))sub_1000D4278);
}

- (UICollectionViewCellRegistration)cellRegistration
{
  uint64_t v2;
  _TtC4Maps28PlaceSummaryOutlineCellModel *v3;
  UICollectionViewCellRegistration *v4;

  v2 = qword_101490DC0;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_101490DC0, sub_1000D237C);
  v4 = (UICollectionViewCellRegistration *)(id)qword_1014D4930;

  return v4;
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[PlaceSummaryOutlineCellModel isEqual:](self, "isEqual:", a3);
}

- (BOOL)isEqual:(id)a3
{
  _TtC4Maps28PlaceSummaryOutlineCellModel *v5;
  _TtC4Maps28PlaceSummaryOutlineCellModel *v6;
  char v7;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = sub_1000D1E9C((uint64_t)v9);

  sub_10000C180((uint64_t)v9);
  return v7 & 1;
}

- (int64_t)hash
{
  int64_t result;

  result = *(int64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult);
  if (result)
    return (int64_t)objc_msgSend((id)result, "hash");
  return result;
}

- (id)homeActionObject
{
  _TtC4Maps28PlaceSummaryOutlineCellModel *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[3];
  uint64_t v12;

  v2 = self;
  sub_1000D2180((uint64_t)v11);

  v3 = v12;
  if (!v12)
    return 0;
  v4 = sub_10000BE88(v11, v12);
  v5 = *(_QWORD *)(v3 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
  v9 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v8, v3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  sub_10000BEAC(v11);
  return v9;
}

- (id)homeDragAndDropObject
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult);
  if (!v2)
    return 0;
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult);
  v3 = sub_10000E4BC(0, &qword_101494570, off_101197F50);
  v4 = v2;
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(&v7, v3);

  return v5;
}

- (_TtC4Maps28PlaceSummaryOutlineCellModel)init
{
  _TtC4Maps28PlaceSummaryOutlineCellModel *result;

  result = (_TtC4Maps28PlaceSummaryOutlineCellModel *)_swift_stdlib_reportUnimplementedInitializer("Maps.PlaceSummaryOutlineCellModel", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_placeSummaryViewModelTemplate));

  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_curatedCollectionImageDownloader));
}

@end
