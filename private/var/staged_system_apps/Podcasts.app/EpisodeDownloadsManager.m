@implementation EpisodeDownloadsManager

- (_TtC8Podcasts23EpisodeDownloadsManager)init
{
  _TtC8Podcasts23EpisodeDownloadsManager *result;

  result = (_TtC8Podcasts23EpisodeDownloadsManager *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.EpisodeDownloadsManager", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager____lazy_storage___serialQueue));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager__downloaders));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_inMemoryStorage));
  sub_100016C4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_downloaderConfiguration));

  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_userAlertsPresenter, &qword_1005540B8);
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_assetsFolder;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_limitsHolder));
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_mediaLibraryClient, &qword_1005536B0);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_episodeRemover));
  sub_10003D380((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_dsidProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_expectedDownloaderTypes));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager____lazy_storage___restoreQueue));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_userEpisodeStorage));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_systemEpisodeStorage));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_jobStorage));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_reachability));
  sub_10003D380((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_artworkStorage));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_finalCheckBeforStart), *(_QWORD *)&self->$__lazy_storage_$_serialQueue[OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_finalCheckBeforStart]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager____lazy_storage___preflightURLSession));
}

- (BOOL)handleEventsForBackgroundURLSession:(id)a3 handler:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _TtC8Podcasts23EpisodeDownloadsManager *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1004C39F0, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  LOBYTE(v7) = EpisodeDownloadsManager.handleEventsForBackgroundURLSession(identifier:handler:)(v7, v9, (uint64_t)sub_100048D5C, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
  return v7 & 1;
}

- (void)restoreDownloadedEpisodes:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  _TtC8Podcasts23EpisodeDownloadsManager *v9;

  v6 = (uint64_t (*)())_Block_copy(a4);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &protocol witness table for String);
  if (v6)
  {
    v8 = swift_allocObject(&unk_1004C39C8, 24, 7);
    *(_QWORD *)(v8 + 16) = v6;
    v6 = sub_100340924;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  EpisodeDownloadsManager.restoreDownloadedEpisodes(_:completion:)(v7, (uint64_t)v6, v8);
  sub_10002CA30((uint64_t)v6, v8);

  swift_bridgeObjectRelease(v7);
}

- (void)downloadEpisode:(id)a3 isFromSaving:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC8Podcasts23EpisodeDownloadsManager *v9;
  Swift::String v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  EpisodeDownloadsManager.downloadEpisode(_:isFromSaving:)(v10, a4);

  swift_bridgeObjectRelease(v8);
}

- (void)addEpisodeAutoDownloads:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  _TtC8Podcasts23EpisodeDownloadsManager *v9;

  v6 = (uint64_t (*)())_Block_copy(a4);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &protocol witness table for String);
  if (v6)
  {
    v8 = swift_allocObject(&unk_1004C39A0, 24, 7);
    *(_QWORD *)(v8 + 16) = v6;
    v6 = sub_100340924;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  EpisodeDownloadsManager.addEpisodeAutoDownloads(_:completion:)(v7, (uint64_t)v6, v8);
  sub_10002CA30((uint64_t)v6, v8);

  swift_bridgeObjectRelease(v7);
}

- (BOOL)resumeOrPauseEpisodeDownloadWithUuid:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC8Podcasts23EpisodeDownloadsManager *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = EpisodeDownloadsManager.resumeOrPauseEpisodeDownload(withUuid:)(v8);

  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

- (void)cancelDownloadsForEpisodeUuid:(id)a3 userInitiated:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8Podcasts23EpisodeDownloadsManager *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = self;
  v10 = sub_10002BE98();
  v11 = swift_allocObject(&unk_1004C3648, 24, 7);
  swift_unknownObjectWeakInit(v11 + 16);
  v12 = swift_allocObject(&unk_1004C3950, 41, 7);
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v6;
  *(_QWORD *)(v12 + 32) = v8;
  *(_BYTE *)(v12 + 40) = a4;
  v15[4] = sub_1003410CC;
  v16 = v12;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100027AF8;
  v15[3] = &unk_1004C3968;
  v13 = _Block_copy(v15);
  v14 = v16;
  swift_bridgeObjectRetain(v8);
  objc_msgSend(v10, "addOperationWithBlock:", v13, swift_release(v14).n128_f64[0]);
  _Block_release(v13);

  swift_bridgeObjectRelease(v8);
}

- (id)cancelAllDownloadsUserInitiated:(BOOL)a3
{
  _TtC8Podcasts23EpisodeDownloadsManager *v4;
  void *v5;
  Class isa;

  v4 = self;
  v5 = EpisodeDownloadsManager.cancelAllDownloads(userInitiated:)(a3);

  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (id)episodeUuidForDownloadWithAdamID:(id)a3
{
  id v4;
  _TtC8Podcasts23EpisodeDownloadsManager *v5;
  void *object;
  NSString v7;

  v4 = a3;
  v5 = self;
  object = EpisodeDownloadsManager.episodeUuidForDownload(withAdamID:)((NSNumber)v4).value._object;

  if (object)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)removeDownload:(id)a3 shouldAllowAutomaticRedownloads:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC8Podcasts23EpisodeDownloadsManager *v13;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = swift_allocObject(&unk_1004C3928, 24, 7);
  *(_QWORD *)(v12 + 16) = v8;
  v13 = self;
  EpisodeDownloadsManager.removeDownload(_:shouldAllowAutomaticRedownloads:completion:)(v9, v11, a4, (uint64_t)sub_1003408EC, v12);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
}

- (void)removeDownloadedEpisodes:(id)a3
{
  uint64_t v4;
  _TtC8Podcasts23EpisodeDownloadsManager *v5;

  v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &protocol witness table for String);
  v5 = self;
  EpisodeDownloadsManager.removeDownloadedEpisodes(_:)(v4);

  swift_bridgeObjectRelease(v4);
}

- (int64_t)numberOfDownloadsFrom:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC8Podcasts23EpisodeDownloadsManager *v7;
  Swift::String v8;
  Swift::Int v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  v9 = EpisodeDownloadsManager.numberOfDownloads(from:)(v8);

  swift_bridgeObjectRelease(v6);
  return v9;
}

- (int64_t)numberOfDownloads
{
  _TtC8Podcasts23EpisodeDownloadsManager *v2;
  Swift::Int v3;

  v2 = self;
  v3 = EpisodeDownloadsManager.numberOfDownloads()();

  return v3;
}

- (id)downloadAtIndex:(int64_t)a3
{
  _TtC8Podcasts23EpisodeDownloadsManager *v4;
  id v5;

  v4 = self;
  v5 = EpisodeDownloadsManager.download(at:)(a3);

  return v5;
}

- (int64_t)indexForDownload:(id)a3
{
  _TtC8Podcasts23EpisodeDownloadsManager *v5;
  id v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = EpisodeDownloadsManager.index(for:)((uint64_t)a3);
  swift_unknownObjectRelease(a3);

  return (int64_t)v6;
}

- (id)downloadForEpisodeWithUuid:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC8Podcasts23EpisodeDownloadsManager *v7;
  id v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = EpisodeDownloadsManager.downloadForEpisode(withUuid:)(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)invalidateURLSessions
{
  _TtC8Podcasts23EpisodeDownloadsManager *v2;

  v2 = self;
  EpisodeDownloadsManager.invalidateURLSessions()();

}

@end
