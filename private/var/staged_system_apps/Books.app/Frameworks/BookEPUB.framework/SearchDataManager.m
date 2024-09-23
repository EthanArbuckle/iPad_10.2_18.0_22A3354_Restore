@implementation SearchDataManager

- (_TtC8BookEPUB17SearchDataManager)init
{
  _TtC8BookEPUB17SearchDataManager *result;

  result = (_TtC8BookEPUB17SearchDataManager *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.SearchDataManager", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_bookProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_searchController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_paginationService));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_pageNumberProvider));
  swift_release();
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_searchRecentsPersistence));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_analyticsProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_subscribers));
}

- (void)searchControllerWillBeginSearching:(id)a3 reportAnalytics:(BOOL)a4
{
  uint64_t Strong;
  uint64_t v8;
  void *v9;
  _TtC8BookEPUB17SearchDataManager *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_delegate);
  if (Strong)
  {
    v8 = Strong;
    v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_searchController);
    swift_unknownObjectRetain(a3);
    v10 = self;
    v11 = objc_msgSend(v9, "results");
    v12 = sub_319AC(&qword_3B6878);
    v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

    sub_46098(v13, a4);
    swift_unknownObjectRelease(a3);

    swift_bridgeObjectRelease(v13);
    swift_unknownObjectRelease(v8);
  }
}

- (void)searchControllerDidFinishSearching:(id)a3
{
  _TtC8BookEPUB17SearchDataManager *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_6CAF8();
  swift_unknownObjectRelease(a3);

}

- (double)searchControllerResultsChanged:(uint64_t)a3
{
  uint64_t Strong;
  double result;
  uint64_t v7;
  void *v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  Strong = swift_unknownObjectWeakLoadStrong(&a1[OBJC_IVAR____TtC8BookEPUB17SearchDataManager_delegate]);
  if (Strong)
  {
    v7 = Strong;
    v8 = *(void **)&a1[OBJC_IVAR____TtC8BookEPUB17SearchDataManager_searchController];
    swift_unknownObjectRetain(a3);
    v9 = a1;
    v10 = objc_msgSend(v8, "results");
    v11 = sub_319AC(&qword_3B6878);
    v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

    sub_45F84(v12);
    swift_unknownObjectRelease(a3);

    swift_bridgeObjectRelease(v12);
    *(_QWORD *)&result = swift_unknownObjectRelease(v7).n128_u64[0];
  }
  return result;
}

@end
