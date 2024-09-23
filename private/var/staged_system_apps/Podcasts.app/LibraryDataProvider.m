@implementation LibraryDataProvider

- (void)startObservingLibraryIfNeeded
{
  uint64_t v2;
  _TtC8Podcasts19LibraryDataProvider *v4;

  v2 = OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_isObservingLibrary;
  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_isObservingLibrary) & 1) == 0)
  {
    v4 = self;
    dispatch thunk of PodcastStateController.startObserving()();
    *((_BYTE *)&self->super.isa + v2) = 1;

  }
}

- (void)restorePreviouslyDownloadedEpisodes
{
  uint64_t v2;
  _TtC8Podcasts19LibraryDataProvider *v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_downloadsRestoreController);
  if (v2)
  {
    v3 = self;
    sub_1002C7BC0(v2);

  }
}

- (_TtC8Podcasts19LibraryDataProvider)init
{
  _TtC8Podcasts19LibraryDataProvider *result;

  result = (_TtC8Podcasts19LibraryDataProvider *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.LibraryDataProvider", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider____lazy_storage___actionController));
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider____lazy_storage___libraryActionController, &qword_1005535C8);
  sub_10003D380((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_purchaseController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_podcastStateController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_episodePlayStateController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_reviewController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_episodeDownloadStateController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_episodeBookmarkStateController));
  sub_10003D380((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_pendingPlaybackController));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_hudPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_episodeDownloadStateControllerProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_interestsObserverProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_episodeStateRepository));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_managedContextProvider));
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_assetsFolder;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_downloadsRestoreController));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_objectGraph));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_jobStorageFactory));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_playbackController));
  v5 = (char *)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_metricsCalendar;
  v6 = type metadata accessor for Calendar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider____lazy_storage___signpostID, &qword_100553CF8);
}

- (BOOL)handleEventsForBackgroundURLSessionWithIdentifier:(id)a3 handler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8Podcasts19LibraryDataProvider *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1004AFE28, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  LOBYTE(v7) = _s8Podcasts19LibraryDataProviderC35handleEventsForBackgroundURLSession10identifier7handlerSbSS_yyctF_0(v7, v9, (uint64_t)sub_100048D5C, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
  return v7 & 1;
}

@end
