@implementation JSBridge

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  uint64_t v5;
  _TtC11MusicJSCore8JSBridge *v6;
  id v7;

  sub_10004A07C(0, (unint64_t *)&qword_1011A2110, OS_dispatch_queue_ptr);
  v5 = swift_allocObject(&unk_101115648, 24, 7);
  *(_QWORD *)(v5 + 16) = self;
  v6 = self;
  v7 = a3;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_100D0357C, v5);
  swift_release();

}

- (_TtC11MusicJSCore8JSBridge)init
{
  return (_TtC11MusicJSCore8JSBridge *)JSBridge.init()();
}

- (void).cxx_destruct
{
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSBridge_initializationDate, (uint64_t *)&unk_1011A30A0);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSBridge____lazy_storage___bootSignpost, &qword_1011CF640);
  swift_release();
  swift_release();
  sub_100D02694(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons), *(void **)&self->thread[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons], *(void **)&self->provider[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 8], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 16], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 24], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 32], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 40], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 48], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 56], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 64], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 72], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 80], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 88]);
  swift_release();
  sub_100D00C48(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSBridge_state), *(_QWORD *)&self->thread[OBJC_IVAR____TtC11MusicJSCore8JSBridge_state], *(_QWORD *)&self->provider[OBJC_IVAR____TtC11MusicJSCore8JSBridge_state], *(_QWORD *)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_state], *(_QWORD *)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_state + 8]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
