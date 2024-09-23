@implementation PlaybackController.ExplicitResponseDataSource

- (_TtCC10PodcastsUI18PlaybackController26ExplicitResponseDataSource)init
{
  sub_1DA5626A8();
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  sub_1DA5639AC(self, (int)a2, a3, a4, (uint64_t)&OBJC_IVAR____TtCC10PodcastsUI18PlaybackController26ExplicitResponseDataSource_responsePublisher);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return sub_1DA563A38(self, (uint64_t)a2, a3, a4);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController26ExplicitResponseDataSource_playerPath));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController26ExplicitResponseDataSource_playerRequestController));
  swift_bridgeObjectRelease();
}

@end
