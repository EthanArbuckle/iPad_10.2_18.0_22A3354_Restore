@implementation PodcastsPlayerAdapter

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8Podcasts21PodcastsPlayerAdapter *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1004BE880, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  PodcastsPlayerAdapter.controller(_:defersResponseReplacement:)(v8, (uint64_t)sub_100048D5C, v7);

  swift_release(v7);
}

- (_TtC8Podcasts21PodcastsPlayerAdapter)init
{
  return (_TtC8Podcasts21PodcastsPlayerAdapter *)sub_10002D78C();
}

- (void)loadedDurationDidChange
{
  sub_10001FAE8(self, (uint64_t)a2, (uint64_t (*)(void))&PlayerNotification_LoadedDurationDidChange.unsafeMutableAddressor);
}

- (void)playerVolumeDidChange
{
  sub_10001FAE8(self, (uint64_t)a2, (uint64_t (*)(void))&PlayerNotification_PlayerVolumeDidChange.unsafeMutableAddressor);
}

- (void)periodicUpdate
{
  sub_10001FAE8(self, (uint64_t)a2, (uint64_t (*)(void))&PlayerNotification_PeriodicUpdate.unsafeMutableAddressor);
}

+ (_TtC8Podcasts21PodcastsPlayerAdapter)sharedInstance
{
  if (qword_1005520C0 != -1)
    swift_once(&qword_1005520C0, sub_100004A04);
  return (_TtC8Podcasts21PodcastsPlayerAdapter *)(id)qword_100573030;
}

- (MPCPlayerPath)playbackPlayerPath
{
  return (MPCPlayerPath *)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerPathCoordinator), "metadataPlayerPath");
}

- (MPAVRoute)route
{
  void *v2;
  _TtC8Podcasts21PodcastsPlayerAdapter *v3;
  id v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerPathCoordinator);
  v3 = self;
  v4 = objc_msgSend(v2, "metadataPlayerPath");
  v5 = objc_msgSend(v4, "route");

  return (MPAVRoute *)v5;
}

- (void)setRoute:(id)a3
{
  void (*v5)(id);
  _TtC8Podcasts21PodcastsPlayerAdapter *v6;
  id v7;

  v5 = *(void (**)(id))((**(_QWORD **)((char *)&self->super.isa
                                                + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerPathCoordinator) & swift_isaMask)
                                 + 0xF0);
  v7 = a3;
  v6 = self;
  v5(a3);

}

- (void)dealloc
{
  void *v2;
  _TtC8Podcasts21PodcastsPlayerAdapter *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerRequestController);
  v3 = self;
  objc_msgSend(v2, "endAutomaticResponseLoading");
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for PodcastsPlayerAdapter(0);
  -[PodcastsPlayerAdapter dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter__playbackSpeedMenu;
  v4 = sub_10003F544(&qword_100560D80);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerRequestController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->playerPathCoordinator[OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerID]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_explicitContentPresenter));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_bindings));
}

- (BOOL)isTargetPlaying
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_isTargetPlaying;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_isTargetPlaying, v4, 0, 0);
  return *v2;
}

- (void)setIsTargetPlaying:(BOOL)a3
{
  _TtC8Podcasts21PodcastsPlayerAdapter *v4;

  v4 = self;
  sub_1002CA044(a3);

}

- (NSString)PlayerNotification_JumpDurationDidChange_String
{
  _TtC8Podcasts21PodcastsPlayerAdapter *v2;
  uint64_t v3;
  NSString v4;

  v2 = self;
  v3 = *(_QWORD *)(PlayerNotification_JumpDurationDidChange.unsafeMutableAddressor() + 8);
  swift_bridgeObjectRetain(v3);

  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)playWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC8Podcasts21PodcastsPlayerAdapter *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1004BE920, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1002CE834;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  PodcastsPlayerAdapter.play(completion:)((uint64_t)v7, v6);
  sub_10002CA30((uint64_t)v7, v6);

}

- (void)pauseWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC8Podcasts21PodcastsPlayerAdapter *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1004BE8F8, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1002CE834;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  PodcastsPlayerAdapter.pause(completion:)((uint64_t)v7, v6);
  sub_10002CA30((uint64_t)v7, v6);

}

- (void)jumpForwardsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC8Podcasts21PodcastsPlayerAdapter *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1004BE8D0, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1002CE834;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  PodcastsPlayerAdapter.jumpForwards(completion:)((uint64_t)v7, v6);
  sub_10002CA30((uint64_t)v7, v6);

}

- (NSString)localizedStringForSkipForward
{
  return (NSString *)sub_1002CBD14(self, (uint64_t)a2, (void (*)(void))PodcastsPlayerAdapter.localizedStringForSkipForward.getter);
}

- (NSString)localizedStringForSkipBackwards
{
  return (NSString *)sub_1002CBD14(self, (uint64_t)a2, (void (*)(void))PodcastsPlayerAdapter.localizedStringForSkipBackwards.getter);
}

- (void)jumpBackwardsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  _TtC8Podcasts21PodcastsPlayerAdapter *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1004BE8A8, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1002CE74C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  PodcastsPlayerAdapter.jumpBackwards(completion:)((uint64_t)v7, v6);
  sub_10002CA30((uint64_t)v7, v6);

}

- (void)autoStopModeDidChange
{
  _TtC8Podcasts21PodcastsPlayerAdapter *v2;

  v2 = self;
  sub_1002CCA50();

}

- (void)currentChapterDidChange
{
  sub_10001FAE8(self, (uint64_t)a2, (uint64_t (*)(void))&PlayerNotification_CurrentChapterDidChange.unsafeMutableAddressor);
}

- (void)playerRateDidChange
{
  _TtC8Podcasts21PodcastsPlayerAdapter *v2;

  v2 = self;
  sub_1002CCD00();

}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6;
  id v7;
  _TtC8Podcasts21PodcastsPlayerAdapter *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  id v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v6, "request");
  v10 = objc_opt_self(MPCPlayerRequest);
  v11 = (void *)swift_dynamicCastObjCClass(v9, v10);
  if (v11)
  {
    v12 = *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerPathCoordinator);
    v13 = objc_msgSend(v11, "playerPath");
    if (!v13)
    {
      __break(1u);
      return (char)v13;
    }
    v14 = v13;
    (*(void (**)(id, id))((swift_isaMask & *v12) + 0x118))(v13, v7);

    swift_unknownObjectRelease(v9);
  }
  else
  {

    swift_unknownObjectRelease(v9);
  }

  LOBYTE(v13) = 1;
  return (char)v13;
}

@end
