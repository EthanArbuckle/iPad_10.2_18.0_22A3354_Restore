@implementation PlaybackController

- (id)requestedPropertySetForEngine:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC9MusicCore18PlaybackController *v6;
  id v7;

  v4 = qword_1004B8E00;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_1004B8E00, sub_1001F51FC);
  v7 = (id)static SharedListening.Event.properties;

  return v7;
}

- (void)engine:(id)a3 didReceiveSharedListeningEvent:(id)a4
{
  id v6;
  id v7;
  _TtC9MusicCore18PlaybackController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10018AB24(v7);

}

- (void)engine:(id)a3 didEndSharedListeningSessionWithError:(id)a4
{
  id v6;
  _TtC9MusicCore18PlaybackController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_10018ADB4((uint64_t)a4);

}

- (void)engine:(id)a3 didPauseForLeaseEndWithError:(id)a4
{
  id v6;
  _TtC9MusicCore18PlaybackController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_10018B05C(a4);

}

- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4 withError:(id)a5
{
  _QWORD *v9;
  id v10;
  id v11;
  _TtC9MusicCore18PlaybackController *v12;
  id v13;
  _TtC9MusicCore18PlaybackController *v14;
  id v15;
  id v16;

  sub_10000598C(0, (unint64_t *)&qword_1004BD060, OS_dispatch_queue_ptr);
  v9 = (_QWORD *)swift_allocObject(&unk_100479140, 40, 7);
  v9[2] = a5;
  v9[3] = self;
  v9[4] = a4;
  v10 = a4;
  v11 = a5;
  v12 = self;
  v13 = v11;
  v14 = v12;
  v15 = v10;
  v16 = a3;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_10018D1BC, (uint64_t)v9);

  swift_release(v9);
}

- (void)engine:(id)a3 requiresAuthorizationToPlayItem:(id)a4 reason:(int64_t)a5 authorizationHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  _TtC9MusicCore18PlaybackController *v14;
  id v15;
  id v16;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject(&unk_1004790F0, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  sub_10000598C(0, (unint64_t *)&qword_1004BD060, OS_dispatch_queue_ptr);
  v12 = (_QWORD *)swift_allocObject(&unk_100479118, 56, 7);
  v12[2] = a5;
  v12[3] = self;
  v12[4] = a4;
  v12[5] = sub_10018BFD0;
  v12[6] = v11;
  v13 = a4;
  v14 = self;
  v15 = v13;
  v16 = a3;
  swift_retain(v11);
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_10018B50C, (uint64_t)v12);

  swift_release(v11);
  swift_release(v12);
}

- (_TtC9MusicCore18PlaybackController)init
{
  _TtC9MusicCore18PlaybackController *result;

  result = (_TtC9MusicCore18PlaybackController *)_swift_stdlib_reportUnimplementedInitializer("MusicCore.PlaybackController", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000970C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9MusicCore18PlaybackController_coordinator));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9MusicCore18PlaybackController_player));
  sub_10018A57C(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC9MusicCore18PlaybackController_nowPlayingPresentationDescriptor), *(_QWORD *)&self->coordinator[OBJC_IVAR____TtC9MusicCore18PlaybackController_nowPlayingPresentationDescriptor], *(_QWORD *)&self->coordinator[OBJC_IVAR____TtC9MusicCore18PlaybackController_nowPlayingPresentationDescriptor + 8], *(_QWORD *)&self->coordinator[OBJC_IVAR____TtC9MusicCore18PlaybackController_nowPlayingPresentationDescriptor + 16], *(_QWORD *)&self->coordinator[OBJC_IVAR____TtC9MusicCore18PlaybackController_nowPlayingPresentationDescriptor + 24]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9MusicCore18PlaybackController_nowPlayingSubscription));

}

@end
