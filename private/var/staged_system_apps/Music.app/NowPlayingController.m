@implementation NowPlayingController

- (_TtC5Music20NowPlayingController)init
{
  return (_TtC5Music20NowPlayingController *)sub_1005002B4();
}

- (void)dealloc
{
  uint64_t v2;
  _TtC5Music20NowPlayingController *v3;
  uint64_t v4;
  Swift::Int *v5;
  Swift::Int v6;
  Swift::Int v7;
  void (*v8)(_BYTE *, _QWORD);
  __C::MPCPlayerRequestTracklistRange v9;
  objc_super v10;
  _BYTE v11[32];

  v2 = qword_10119B8B0;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10119B8B0, sub_1000E948C);
  v4 = qword_10124C788;
  v5 = (Swift::Int *)MPCPlayerRequestTracklistRange.nextPlayingItem.unsafeMutableAddressor();
  v6 = *v5;
  v7 = v5[1];
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v4 + 752))(v11);
  v9.reverseCount = v6;
  v9.forwardCount = v7;
  Player.NowPlayingConfiguration.remove(_:)(v9);
  v8(v11, 0);
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for NowPlayingController(0);
  -[NowPlayingController dealloc](&v10, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC5Music20NowPlayingController__item;
  v4 = sub_100007E8C(&qword_1011B85C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5Music20NowPlayingController__queue;
  v6 = sub_100007E8C(&qword_1011B85B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();

  swift_release();
  swift_release();
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC5Music20NowPlayingController *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1010CAA78, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  sub_10004A07C(0, (unint64_t *)&qword_1011A2110, OS_dispatch_queue_ptr);
  v8 = (_QWORD *)swift_allocObject(&unk_1010CAAA0, 48, 7);
  v8[2] = sub_100253D40;
  v8[3] = v7;
  v8[4] = self;
  v8[5] = a3;
  v9 = a3;
  v10 = self;
  v11 = v9;
  swift_retain();
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_10050CAE4, (uint64_t)v8);

  swift_release();
  swift_release();
}

@end
