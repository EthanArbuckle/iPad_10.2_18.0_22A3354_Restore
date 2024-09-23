@implementation MTSharedPlaybackController

+ (NSString)kIsPlayingKeyPath
{
  uint64_t v2;
  NSString v3;

  if (qword_100552040 != -1)
    swift_once(&qword_100552040, sub_10021092C);
  v2 = unk_100572E90;
  swift_bridgeObjectRetain(unk_100572E90);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)isPlaying
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___MTSharedPlaybackController_isPlaying);
}

- (void)setIsPlaying:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___MTSharedPlaybackController_isPlaying) = a3;
}

- (void)playManifest:(id)a3 waitingForEngine:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  id v10;
  MTSharedPlaybackController *v11;

  v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1004B63C8, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1001C0F18;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_100210A38(v10, v5, (uint64_t)v8, v9);
  sub_10002CA30((uint64_t)v8, v9);

}

- (MTSharedPlaybackController)init
{
  MTSharedPlaybackController *result;

  result = (MTSharedPlaybackController *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.SharedPlaybackController", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTSharedPlaybackController_playbackController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTSharedPlaybackController_subscriptions));
}

@end
