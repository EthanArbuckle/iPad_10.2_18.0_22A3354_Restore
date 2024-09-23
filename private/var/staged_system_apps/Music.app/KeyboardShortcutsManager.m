@implementation KeyboardShortcutsManager

- (NSArray)keyCommands
{
  _TtC5Music24KeyboardShortcutsManager *v2;
  Class isa;

  v2 = self;
  sub_1005B7E38();

  sub_10040A7D8();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC5Music24KeyboardShortcutsManager *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC5Music24KeyboardShortcutsManager *v10;
  char v11;
  _OWORD v13[2];

  if (a4)
  {
    v7 = self;
    v9 = swift_unknownObjectRetain(a4, v8);
    _bridgeAnyObjectToAny(_:)(v13, v9);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v10 = self;
  }
  v11 = sub_1005B854C((uint64_t)a3, (uint64_t)v13);

  sub_1002293F8((uint64_t)v13);
  return v11 & 1;
}

- (void)find:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _TtC5Music24KeyboardShortcutsManager *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC5Music24KeyboardShortcutsManager *v11;
  char *v12;
  uint64_t v13;
  _OWORD v14[2];

  v5 = type metadata accessor for AppInterfaceContext.Activity(0);
  __chkstk_darwin(v5);
  v7 = (_OWORD *)((char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a3)
  {
    v8 = self;
    v10 = swift_unknownObjectRetain(a3, v9);
    _bridgeAnyObjectToAny(_:)(v14, v10);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v11 = self;
  }
  v12 = (char *)v7 + *(int *)(sub_100007E8C(&qword_1011BC3D0) + 48);
  *v7 = xmmword_100EA9390;
  v13 = type metadata accessor for SearchScope(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  swift_storeEnumTagMultiPayload(v7, v5, 1);
  swift_retain();
  sub_100770824((uint64_t)v7, 0, 0);
  swift_release();
  sub_100242458((uint64_t)v7);

  sub_1002293F8((uint64_t)v14);
}

- (void)newPlaylistAction:(id)a3
{
  id v4;
  _TtC5Music24KeyboardShortcutsManager *v5;

  v4 = a3;
  v5 = self;
  sub_1005B9A00();

}

- (void)volumeUpAction:(id)a3
{
  sub_1005B89BC(self, (uint64_t)a2, a3, (SEL *)&selRef_handleVolumeUpButton);
}

- (void)volumeDownAction:(id)a3
{
  sub_1005B89BC(self, (uint64_t)a2, a3, (SEL *)&selRef_handleVolumeDownButton);
}

- (void)volumeKeyUpAction:(id)a3
{
  sub_1005B89BC(self, (uint64_t)a2, a3, (SEL *)&selRef_cancelVolumeEvent);
}

- (void)nextTrackAction:(id)a3
{
  sub_1005B8CC4(self, (uint64_t)a2, a3, (uint64_t)&unk_1010D0680, (uint64_t)&unk_1011BC3C8);
}

- (void)previousTrackAction:(id)a3
{
  sub_1005B8CC4(self, (uint64_t)a2, a3, (uint64_t)&unk_1010D0658, (uint64_t)&unk_1011BC3B8);
}

- (_TtC5Music24KeyboardShortcutsManager)init
{
  _TtC5Music24KeyboardShortcutsManager *result;

  result = (_TtC5Music24KeyboardShortcutsManager *)_swift_stdlib_reportUnimplementedInitializer("Music.KeyboardShortcutsManager", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC5Music24KeyboardShortcutsManager_interfaceContext));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC5Music24KeyboardShortcutsManager____lazy_storage____keyCommands));
}

- (double)playPauseAction:
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void *v3;
  void *v4;
  id v5;
  double result;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v0 = sub_100007E8C((uint64_t *)&unk_1011A13B0);
  __chkstk_darwin(v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10119B8B0 != -1)
    swift_once(&qword_10119B8B0, sub_1000E948C);
  v3 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)qword_10124C788 + 432))();
  if (!v3 || (v4 = v3, v5 = objc_msgSend(v3, "state"), v4, v5 != (id)5))
  {
    v7 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 1, 1, v7);
    type metadata accessor for MainActor(0);
    v9 = static MainActor.shared.getter(v8);
    v10 = swift_allocObject(&unk_1010D0630, 32, 7);
    *(_QWORD *)(v10 + 16) = v9;
    *(_QWORD *)(v10 + 24) = &protocol witness table for MainActor;
    sub_100166D50((uint64_t)v2, (uint64_t)&unk_1011BC3A8, v10);
    *(_QWORD *)&result = swift_release().n128_u64[0];
  }
  return result;
}

@end
