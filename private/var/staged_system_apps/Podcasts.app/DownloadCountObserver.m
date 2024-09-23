@implementation DownloadCountObserver

- (void)dealloc
{
  void *v2;
  _TtC8Podcasts21DownloadCountObserver *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21DownloadCountObserver_downloadsNotifier);
  v3 = self;
  objc_msgSend(v2, "unregisterForUpdates:", v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DownloadCountObserver();
  -[DownloadCountObserver dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts21DownloadCountObserver_downloadManager));

  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21DownloadCountObserver_didChange), *(_QWORD *)&self->downloadManager[OBJC_IVAR____TtC8Podcasts21DownloadCountObserver_didChange]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->downloadManager[OBJC_IVAR____TtC8Podcasts21DownloadCountObserver_podcastUuid]);
}

- (void)downloadManagerDidAddDownload:(uint64_t)a3
{
  id v5;

  swift_unknownObjectRetain(a3);
  v5 = a1;
  sub_10031C210();
  swift_unknownObjectRelease(a3);

}

- (void)downloadManagerDidRemoveDownloads:(id)a3
{
  _TtC8Podcasts21DownloadCountObserver *v3;

  v3 = self;
  sub_10031C210();

}

- (_TtC8Podcasts21DownloadCountObserver)init
{
  _TtC8Podcasts21DownloadCountObserver *result;

  result = (_TtC8Podcasts21DownloadCountObserver *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.DownloadCountObserver", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
