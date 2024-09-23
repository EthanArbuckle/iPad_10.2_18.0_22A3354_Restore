@implementation PlaybackController.AutomaticResponseDataSource

- (_TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource)init
{
  sub_1DA56313C();
}

- (void)dealloc
{
  void *v2;
  _TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource_playerRequestController);
  v3 = self;
  objc_msgSend(v2, sel_endAutomaticResponseLoading);
  v4.receiver = v3;
  v4.super_class = (Class)_s27AutomaticResponseDataSourceCMa();
  -[PlaybackController.AutomaticResponseDataSource dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource_playerRequestController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource_pathCoordinator));
  swift_release();
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  sub_1DA5639AC(self, (int)a2, a3, a4, (uint64_t)&OBJC_IVAR____TtCC10PodcastsUI18PlaybackController27AutomaticResponseDataSource_responsePublisher);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return sub_1DA563A38(self, (uint64_t)a2, a3, a4);
}

@end
