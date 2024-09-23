@implementation PodcastRequestManager

+ (_TtC18PodcastsFoundation21PodcastRequestManager)sharedInstance
{
  if (qword_1EEAB6F10 != -1)
    swift_once();
  return (_TtC18PodcastsFoundation21PodcastRequestManager *)(id)qword_1EEABD808;
}

- (void)updatePodcastWithStoreId:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC18PodcastsFoundation21PodcastRequestManager *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_1A92C98F0(a3, (uint64_t)sub_1A92CB0AC, v7);

  swift_release();
}

- (void)updatePodcastWithEpisodeAdamId:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC18PodcastsFoundation21PodcastRequestManager *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1A92CA2B4(v8, (uint64_t)sub_1A92CB0A4, v7);

  swift_release();
}

- (_TtC18PodcastsFoundation21PodcastRequestManager)init
{
  uint64_t v3;
  id v4;
  _TtC18PodcastsFoundation21PodcastRequestManager *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC18PodcastsFoundation21PodcastRequestManager_mediaRequestController;
  v4 = objc_allocWithZone((Class)type metadata accessor for MediaRequestController());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for PodcastRequestManager();
  return -[PodcastRequestManager init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation21PodcastRequestManager_mediaRequestController));
}

@end
