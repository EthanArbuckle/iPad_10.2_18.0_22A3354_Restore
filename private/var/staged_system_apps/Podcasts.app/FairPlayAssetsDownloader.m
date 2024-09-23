@implementation FairPlayAssetsDownloader

- (_TtC8Podcasts24FairPlayAssetsDownloader)init
{
  _TtC8Podcasts24FairPlayAssetsDownloader *result;

  result = (_TtC8Podcasts24FairPlayAssetsDownloader *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.FairPlayAssetsDownloader", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003D380((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_config));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_statusUpdateHandler), *(_QWORD *)&self->config[OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_statusUpdateHandler]);
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_backgroundCompletionHandler), *(_QWORD *)&self->config[OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_backgroundCompletionHandler]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_fairPlayKeyLoader));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_fairPlayDownloadsObserver));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_sessionLock));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_taskToKeyAdamIDMap));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_taskToKeyLoaderMap));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader____lazy_storage___sessionDelegateQueue));
  swift_bridgeObjectRelease(*(_QWORD *)&self->config[OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader____lazy_storage___logPrefix]);

}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8Podcasts24FairPlayAssetsDownloader *v15;
  id v16;
  uint64_t v17;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = objc_msgSend(v14, "URLAsset");
  sub_100252A18(v16, (uint64_t)v12, v13, v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7
{
  int64_t var3;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC8Podcasts24FairPlayAssetsDownloader *v16;
  CMTimeValue v17[2];
  __int128 v18;
  uint64_t v19;
  int64_t v20;

  var3 = a7->var1.var3;
  v17[0] = a7->var0.var0;
  v17[1] = *(_QWORD *)&a7->var0.var1;
  v18 = *(_OWORD *)&a7->var0.var3;
  v19 = *(_QWORD *)&a7->var1.var1;
  v20 = var3;
  v12 = sub_100005EC8(0, &qword_10055B218, NSValue_ptr);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v12);
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_10022B37C((uint64_t)v15, v13, v17);

  swift_bridgeObjectRelease(v13);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC8Podcasts24FairPlayAssetsDownloader *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_10022A574(v8, v9, (uint64_t)a5);

}

@end
