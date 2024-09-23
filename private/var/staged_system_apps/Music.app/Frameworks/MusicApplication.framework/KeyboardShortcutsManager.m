@implementation KeyboardShortcutsManager

- (NSArray)keyCommands
{
  _TtC16MusicApplication24KeyboardShortcutsManager *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_39CF0C();

  sub_39F574();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC16MusicApplication24KeyboardShortcutsManager *v7;
  uint64_t v8;
  _TtC16MusicApplication24KeyboardShortcutsManager *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_39D620((uint64_t)a3, (uint64_t)v12);

  sub_18DF2C((uint64_t)v12);
  return v10 & 1;
}

- (void)find:(id)a3
{
  _TtC16MusicApplication24KeyboardShortcutsManager *v5;
  uint64_t v6;
  _TtC16MusicApplication24KeyboardShortcutsManager *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_39D8CC();

  sub_18DF2C((uint64_t)v8);
}

- (void)newPlaylistAction:(id)a3
{
  id v4;
  _TtC16MusicApplication24KeyboardShortcutsManager *v5;

  v4 = a3;
  v5 = self;
  sub_39EDAC();

}

- (void)volumeUpAction:(id)a3
{
  sub_39DB74(self, (uint64_t)a2, a3, (SEL *)&selRef_handleVolumeUpButton);
}

- (void)volumeDownAction:(id)a3
{
  sub_39DB74(self, (uint64_t)a2, a3, (SEL *)&selRef_handleVolumeDownButton);
}

- (void)volumeKeyUpAction:(id)a3
{
  sub_39DB74(self, (uint64_t)a2, a3, (SEL *)&selRef_cancelVolumeEvent);
}

- (void)nextTrackAction:(id)a3
{
  sub_39DE4C(self, (uint64_t)a2, a3, (uint64_t)&unk_135E418, (uint64_t)&unk_14C5980);
}

- (void)previousTrackAction:(id)a3
{
  sub_39DE4C(self, (uint64_t)a2, a3, (uint64_t)&unk_135E3F0, (uint64_t)&unk_14C5970);
}

- (_TtC16MusicApplication24KeyboardShortcutsManager)init
{
  _TtC16MusicApplication24KeyboardShortcutsManager *result;

  result = (_TtC16MusicApplication24KeyboardShortcutsManager *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.KeyboardShortcutsManager", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication24KeyboardShortcutsManager_interfaceContext));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication24KeyboardShortcutsManager____lazy_storage____keyCommands));
}

- (double)playPauseAction:
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void *v3;
  void *v4;
  char *v5;
  double result;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5A0);
  __chkstk_darwin(v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_14AB560 != -1)
    swift_once(&qword_14AB560, sub_5BBE68);
  v3 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)static UIApplication.player + 432))();
  if (!v3 || (v4 = v3, v5 = (char *)objc_msgSend(v3, "state"), v4, v5 != (_BYTE *)&dword_4 + 1))
  {
    v7 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 1, 1, v7);
    type metadata accessor for MainActor(0);
    v9 = static MainActor.shared.getter(v8);
    v10 = swift_allocObject(&unk_135E3C8, 32, 7);
    *(_QWORD *)(v10 + 16) = v9;
    *(_QWORD *)(v10 + 24) = &protocol witness table for MainActor;
    v11 = sub_222584((uint64_t)v2, (uint64_t)&unk_14C5960, v10);
    *(_QWORD *)&result = swift_release(v11).n128_u64[0];
  }
  return result;
}

@end
