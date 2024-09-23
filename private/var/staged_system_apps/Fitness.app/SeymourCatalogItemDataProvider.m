@implementation SeymourCatalogItemDataProvider

- (BOOL)isSeymourWorkout:(id)a3
{
  id v4;
  _TtC10FitnessApp30SeymourCatalogItemDataProvider *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1005EEA88(v4);

  return v6 & 1;
}

- (void)fetchCatalogItemViewModelForWorkout:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC10FitnessApp30SeymourCatalogItemDataProvider *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10039E178(v7, (char *)v8, (void (**)(_QWORD, _QWORD, __n128))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)deleteArchivedSessionForWorkout:(id)a3
{
  id v4;
  _TtC10FitnessApp30SeymourCatalogItemDataProvider *v5;

  v4 = a3;
  v5 = self;
  sub_100505528(v4, (uint64_t)v5);

}

- (void)fetchCatalogArtworkForCatalogItemViewModel:(id)a3 imageSize:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  void *v9;
  uint64_t v10;
  char *v11;
  _TtC10FitnessApp30SeymourCatalogItemDataProvider *v12;

  height = a4.height;
  width = a4.width;
  v9 = _Block_copy(a5);
  v10 = swift_allocObject(&unk_10079B9D0, 24, 7);
  *(_QWORD *)(v10 + 16) = v9;
  v11 = (char *)a3;
  v12 = self;
  sub_10039636C(v11, (uint64_t)sub_1003A3B2C, v10, width, height);

  swift_release(v10);
}

- (void)fetchScoreSummaryForWorkout:(id)a3 healthStore:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC10FitnessApp30SeymourCatalogItemDataProvider *v13;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10079B750, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = swift_allocObject(&unk_100799F18, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, self);
  swift_retain(v9);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_1003A1A38(v11, v12, (void (*)(_QWORD))sub_10019B2A8, v9, v11, v10);

  swift_release_n(v9, 2);
  swift_release(v10);
}

- (_TtC10FitnessApp30SeymourCatalogItemDataProvider)init
{
  _TtC10FitnessApp30SeymourCatalogItemDataProvider *result;

  result = (_TtC10FitnessApp30SeymourCatalogItemDataProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.SeymourCatalogItemDataProvider", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_archivedSessionClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_artworkImageLoader));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_bookmarkClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_catalogClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_configurationClient));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_eventHub));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_mediaTagStringBuilder));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_recommendationClient));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_subscriptionToken));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_unitPreferencesProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_catalogItemViewModelCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_stackViewModelCache));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_trainerCache), v3, v4, v5, v6, v7, v8, v9);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_playlists), v10, v11, v12, v13, v14, v15, v16);
}

@end
