@implementation RSSFeedUpdater

- (void)didDownloadFeedWithError:(id)a3 data:(id)a4 task:(id)a5 requestedUrl:(id)a6 useBackgroundFetch:(BOOL)a7
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  _TtC18PodcastsFoundation14RSSFeedUpdater *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  _TtC18PodcastsFoundation14RSSFeedUpdater *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AD3D0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    v23 = a5;
    v24 = a6;
    v25 = self;
    v26 = a3;
    v21 = 0xF000000000000000;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v27 = sub_1A93F726C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v14, 1, 1, v27);
    goto LABEL_6;
  }
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = self;
  v19 = a3;
  a4 = (id)sub_1A93F72B4();
  v21 = v20;

  if (!a6)
    goto LABEL_5;
LABEL_3:
  sub_1A93F7200();

  v22 = sub_1A93F726C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v14, 0, 1, v22);
LABEL_6:
  _s18PodcastsFoundation14RSSFeedUpdaterC24didDownloadFeedWithError_4data4task12requestedUrl18useBackgroundFetchys0I0_pSg_0B04DataVSgSo16NSURLSessionTaskCSgAK3URLVSgSbtF_0(a3, (uint64_t)a4, v21, a5, (uint64_t)v14);
  sub_1A9069F9C((uint64_t)a4, v21);

  sub_1A914149C((uint64_t)v14);
}

- (_TtC18PodcastsFoundation14RSSFeedUpdater)init
{
  _TtC18PodcastsFoundation14RSSFeedUpdater *result;

  result = (_TtC18PodcastsFoundation14RSSFeedUpdater *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC18PodcastsFoundation14RSSFeedUpdater_ingesterProvider);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation14RSSFeedUpdater_pendingRestorationQueue));
  swift_release();
}

- (void)didRestoreFeedUrlTask:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18PodcastsFoundation14RSSFeedUpdater *v8;
  uint64_t v9;

  v4 = sub_1A93F726C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7200();
  v8 = self;
  RSSFeedUpdater.didRestoreFeedUrlTask(_:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)performOnFeedProcessingQueue:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC18PodcastsFoundation14RSSFeedUpdater *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  RSSFeedUpdater.perform(onFeedProcessingQueue:)((uint64_t)sub_1A9352244, v5);

  swift_release();
}

- (id)sessionCompletionHandler
{
  void *v2;
  _TtC18PodcastsFoundation14RSSFeedUpdater *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation14RSSFeedUpdater_externalFeedDownloader);
  v3 = self;
  v4 = objc_msgSend(v2, sel_sessionCompletionHandler);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;

    v9[4] = sub_1A9352244;
    v9[5] = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1A908A91C;
    v9[3] = &block_descriptor_42;
    v7 = _Block_copy(v9);
    swift_release();
    return v7;
  }
  else
  {

    return 0;
  }
}

- (void)setSessionCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC18PodcastsFoundation14RSSFeedUpdater *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1A9352244;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  RSSFeedUpdater.sessionCompletionHandler.setter((uint64_t)v4, v5);

}

@end
