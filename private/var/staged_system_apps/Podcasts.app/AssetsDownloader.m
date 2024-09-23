@implementation AssetsDownloader

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4;
  _TtC8Podcasts16AssetsDownloader *v5;

  v4 = a3;
  v5 = self;
  sub_10034600C();

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC8Podcasts16AssetsDownloader *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1003462D4(v9, (uint64_t)a5);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8Podcasts16AssetsDownloader *v15;
  uint64_t v16;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100346FCC(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v9;
  id v10;
  _TtC8Podcasts16AssetsDownloader *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100347DC4();

}

- (_TtC8Podcasts16AssetsDownloader)init
{
  _TtC8Podcasts16AssetsDownloader *result;

  result = (_TtC8Podcasts16AssetsDownloader *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.AssetsDownloader", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts16AssetsDownloader_fairPlayAssetsDownloader));
  sub_10003D380((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts16AssetsDownloader_config));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts16AssetsDownloader_backgroundCompletionHandler), *(_QWORD *)&self->urlSession[OBJC_IVAR____TtC8Podcasts16AssetsDownloader_backgroundCompletionHandler]);
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts16AssetsDownloader_statusUpdateHandler), *(_QWORD *)&self->urlSession[OBJC_IVAR____TtC8Podcasts16AssetsDownloader_statusUpdateHandler]);
}

@end
