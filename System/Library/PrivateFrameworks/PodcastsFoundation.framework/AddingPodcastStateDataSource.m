@implementation AddingPodcastStateDataSource

- (_TtC18PodcastsFoundation28AddingPodcastStateDataSource)init
{
  return (_TtC18PodcastsFoundation28AddingPodcastStateDataSource *)AddingPodcastStateDataSource.init()();
}

- (void)updateAddingShowsWithStoreCollectionIds:(id)a3
{
  uint64_t v4;
  _TtC18PodcastsFoundation28AddingPodcastStateDataSource *v5;

  v4 = sub_1A93F85F8();
  v5 = self;
  sub_1A93C0D68(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation28AddingPodcastStateDataSource_refreshQueue));
  swift_release();
  swift_bridgeObjectRelease();
}

@end
