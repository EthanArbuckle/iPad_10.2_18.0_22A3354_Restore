@implementation PodcastsStateCoordinator

+ (_TtC8Podcasts24PodcastsStateCoordinator)shared
{
  _BYTE v3[24];

  if (qword_1005520B8 != -1)
    swift_once(&qword_1005520B8, sub_10004AB18);
  swift_beginAccess(&static PodcastsStateCoordinator.shared, v3, 0, 0);
  return (_TtC8Podcasts24PodcastsStateCoordinator *)(id)static PodcastsStateCoordinator.shared;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _BYTE v6[24];

  v3 = qword_1005520B8;
  v4 = a3;
  if (v3 != -1)
    swift_once(&qword_1005520B8, sub_10004AB18);
  swift_beginAccess(&static PodcastsStateCoordinator.shared, v6, 1, 0);
  v5 = (void *)static PodcastsStateCoordinator.shared;
  static PodcastsStateCoordinator.shared = (uint64_t)v4;

}

- (_TtC8Podcasts24PodcastsStateCoordinator)init
{
  _TtC8Podcasts24PodcastsStateCoordinator *result;

  result = (_TtC8Podcasts24PodcastsStateCoordinator *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.PodcastsStateCoordinator", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_subscriptions));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_downloadsGateway));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_episodeStateRepository));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider));
  sub_10003D380((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateCoordinatorPersistentStore));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateTransitions));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_syncController));

}

- (void)enableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8Podcasts24PodcastsStateCoordinator *v9;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = self;
  PodcastsStateCoordinator.enableSubscription(onPodcastUUID:from:)(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
}

- (void)unsafeEnableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  _TtC8Podcasts24PodcastsStateCoordinator *v10;
  NSString v11;
  id v12;
  id v13;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v13 = a5;
  v10 = self;
  v11 = String._bridgeToObjectiveC()();
  v12 = objc_msgSend(v13, "podcastForUuid:", v11);

  if (v12)
  {
    sub_1002B41D8(v12, a4);
    objc_msgSend(v13, "saveInCurrentBlock");

    swift_bridgeObjectRelease(v9);
  }
  else
  {

    swift_bridgeObjectRelease(v9);
  }

}

- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  _TtC8Podcasts24PodcastsStateCoordinator *v8;
  NSString v9;
  id v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend(*(id *)((char *)&v8->super.isa + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider), "mainOrPrivateContext");
  -[PodcastsStateCoordinator disableSubscriptionOnPodcastUUID:from:context:](v8, "disableSubscriptionOnPodcastUUID:from:context:", v9, a4, v10);

  swift_bridgeObjectRelease(v7);
}

- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  id v14;
  _TtC8Podcasts24PodcastsStateCoordinator *v15;
  id v16;
  _TtC8Podcasts24PodcastsStateCoordinator *v17;
  _QWORD v18[5];
  _QWORD *v19;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = (_QWORD *)swift_allocObject(&unk_1004BD2A8, 56, 7);
  v11[2] = a5;
  v11[3] = v8;
  v11[4] = v10;
  v11[5] = self;
  v11[6] = a4;
  v18[4] = sub_1002BA640;
  v19 = v11;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_100027AF8;
  v18[3] = &unk_1004BD2C0;
  v12 = _Block_copy(v18);
  v13 = v19;
  v14 = a5;
  v15 = self;
  v16 = v14;
  v17 = v15;
  swift_bridgeObjectRetain(v10);
  objc_msgSend(v16, "performBlockAndWaitWithSave:", v12, swift_release(v13).n128_f64[0]);
  _Block_release(v12);

  swift_bridgeObjectRelease(v10);
}

- (void)disableSubscriptionsOnPodcastUUIDs:(id)a3 from:(int64_t)a4 context:(id)a5
{
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  _TtC8Podcasts24PodcastsStateCoordinator *v13;
  id v14;
  _TtC8Podcasts24PodcastsStateCoordinator *v15;
  _QWORD v16[5];
  _QWORD *v17;

  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v9 = (_QWORD *)swift_allocObject(&unk_1004BD258, 48, 7);
  v9[2] = a5;
  v9[3] = v8;
  v9[4] = self;
  v9[5] = a4;
  v16[4] = sub_1002BBC44;
  v17 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_100027AF8;
  v16[3] = &unk_1004BD270;
  v10 = _Block_copy(v16);
  v11 = v17;
  v12 = a5;
  v13 = self;
  v14 = v12;
  v15 = v13;
  swift_bridgeObjectRetain(v8);
  objc_msgSend(v14, "performBlockAndWaitWithSave:", v10, swift_release(v11).n128_f64[0]);
  _Block_release(v10);

  swift_bridgeObjectRelease(v8);
}

- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4 shouldDownloadEpisode:(BOOL)a5 from:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  _TtC8Podcasts24PodcastsStateCoordinator *v11;

  v7 = a5;
  v10 = a3;
  v11 = self;
  sub_1002B5478(v10, *(id *)&a4, 0, v7, a6);

}

- (void)unsafeRemoveEpisodeFromBookmarks:(id)a3 from:(int64_t)a4
{
  id v6;
  _TtC8Podcasts24PodcastsStateCoordinator *v7;

  v6 = a3;
  v7 = self;
  PodcastsStateCoordinator.unsafeRemoveEpisodeFromBookmarks(episode:from:)(v6, a4);

}

- (void)insertNewImplicitFollowIfNeededForPlayerItem:(id)a3 from:(int64_t)a4 completion:(id)a5
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  _TtC8Podcasts24PodcastsStateCoordinator *v19;
  id v20;
  uint64_t v21;

  type metadata accessor for EpisodePlayerItem(0);
  __chkstk_darwin();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PodcastPlayerItem(0);
  __chkstk_darwin();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for PlayerItem(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin();
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a5);
  v18 = a3;
  _Block_copy(v17);
  v19 = self;
  sub_1001E8B20(v18);
  v20 = v18;
  sub_1001E8C68(v20, (uint64_t)v10);
  PlayerItem.init(podcast:episode:)(v12, v10);

  sub_1002BA690((uint64_t)v16, a4, (uint64_t)v19, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  _Block_release(v17);

}

- (void)unsafeEpisodePlayedBeyondThresholdForFirstTime:(id)a3 from:(int64_t)a4
{
  id v7;
  _TtC8Podcasts24PodcastsStateCoordinator *v8;

  v7 = a3;
  v8 = self;
  PodcastsStateCoordinator.unsafeEpisodePlayedBeyondThresholdForFirstTime(_:from:)(a3, a4);

}

- (void)unsafeMark:(id)a3 as:(int64_t)a4 in:(id)a5 from:(int64_t)a6
{
  id v10;
  id v11;
  _TtC8Podcasts24PodcastsStateCoordinator *v12;

  v10 = a3;
  v11 = a5;
  v12 = self;
  sub_1002BABD4(v10, (void *)a4, a6);

}

- (void)unsafeDidBumpLastDatePlayedFor:(id)a3
{
  id v4;
  _TtC8Podcasts24PodcastsStateCoordinator *v5;

  v4 = a3;
  v5 = self;
  PodcastsStateCoordinator.unsafeDidBumpLastDatePlayed(for:)(v4);

}

- (id)currentPodcastStateDescriptionFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8Podcasts24PodcastsStateCoordinator *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  _s8Podcasts0A16StateCoordinatorC014currentPodcastB11Description4fromS2S_tF_0(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease(v6);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

@end
