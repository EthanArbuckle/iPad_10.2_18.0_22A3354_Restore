@implementation SiriDonator

- (void)startDonation
{
  _TtC18PodcastsFoundation11SiriDonator *v2;

  v2 = self;
  sub_1A9077A14();

}

- (_TtC18PodcastsFoundation11SiriDonator)initWithBackgroundTaskManager:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC18PodcastsFoundation11SiriDonator *)SiriDonator.init(backgroundTaskManager:)((uint64_t)a3);
}

- (_TtC18PodcastsFoundation11SiriDonator)init
{
  _TtC18PodcastsFoundation11SiriDonator *result;

  result = (_TtC18PodcastsFoundation11SiriDonator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation11SiriDonator_mediaRequestController));
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
}

@end
