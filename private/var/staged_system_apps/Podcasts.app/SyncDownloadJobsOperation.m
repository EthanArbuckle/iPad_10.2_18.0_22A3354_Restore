@implementation SyncDownloadJobsOperation

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts25SyncDownloadJobsOperation_jobStorage));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.lock[OBJC_IVAR____TtC8Podcasts25SyncDownloadJobsOperation_sessionIdentifier]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Podcasts25SyncDownloadJobsOperation_tasks));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts25SyncDownloadJobsOperation_operationQueue));
}

- (_TtC8Podcasts25SyncDownloadJobsOperation)init
{
  _TtC8Podcasts25SyncDownloadJobsOperation *result;

  result = (_TtC8Podcasts25SyncDownloadJobsOperation *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.SyncDownloadJobsOperation", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
