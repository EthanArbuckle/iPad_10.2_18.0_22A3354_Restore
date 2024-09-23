@implementation PodcastFeedDownloader

- (_TtC18PodcastsFoundation21PodcastFeedDownloader)init
{
  return (_TtC18PodcastsFoundation21PodcastFeedDownloader *)PodcastFeedDownloader.init()();
}

- (void)downloadPodcast:(id)a3 triggerBy:(id)a4 allowEpisodesTo404:(BOOL)a5 isImplicitActionRequest:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _TtC18PodcastsFoundation21PodcastFeedDownloader *v17;

  v7 = a6;
  v8 = a5;
  v12 = _Block_copy(a7);
  if (a4)
  {
    v13 = sub_1A93F8040();
    a4 = v14;
  }
  else
  {
    v13 = 0;
  }
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v12;
  v16 = a3;
  v17 = self;
  sub_1A92B0120(v16, v13, (uint64_t)a4, v8, v7, (uint64_t)sub_1A92B217C, v15);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC18PodcastsFoundation21PodcastFeedDownloader_mediaRequestController);
}

@end
