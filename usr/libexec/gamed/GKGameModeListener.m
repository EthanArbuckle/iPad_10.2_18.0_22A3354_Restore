@implementation GKGameModeListener

- (_TtC14GameDaemonCore18GKGameModeListener)initWithHandler:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject(&unk_1002C86E8, 24, 7);
  *(_QWORD *)(v4 + 16) = v3;
  return (_TtC14GameDaemonCore18GKGameModeListener *)GKGameModeListener.init(handler:)((uint64_t)sub_1001C3D0C, v4);
}

- (void)dealloc
{
  _TtC14GameDaemonCore18GKGameModeListener *v2;

  v2 = self;
  GKGameModeListener.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->gameModeChangedHandler[OBJC_IVAR____TtC14GameDaemonCore18GKGameModeListener_gameModeChangedHandler]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14GameDaemonCore18GKGameModeListener_gameModeNotificationQueue));
}

- (_TtC14GameDaemonCore18GKGameModeListener)init
{
  GKGameModeListener.init()();
}

@end
