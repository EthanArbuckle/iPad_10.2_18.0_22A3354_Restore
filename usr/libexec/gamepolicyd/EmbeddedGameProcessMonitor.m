@implementation EmbeddedGameProcessMonitor

- (void)dealloc
{
  _TtC11gamepolicyd26EmbeddedGameProcessMonitor *v2;

  v2 = self;
  sub_100018EDC();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_processMonitor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_ignoredProcesses));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeState));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction));
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotification]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotification]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotification]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotification]);
  sub_1000118AC((uint64_t)self + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig, (uint64_t (*)(_QWORD))&type metadata accessor for GameModeStatus.Config);
  sub_1000118AC((uint64_t)self + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig, (uint64_t (*)(_QWORD))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
  sub_1000118AC((uint64_t)self + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig, (uint64_t (*)(_QWORD))&type metadata accessor for SustainedExecutionStatus.Config);
  sub_1000118AC((uint64_t)self + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicSplitterStatus.Config);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_operationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_assertionDescriptor));

}

- (void)setGameModeWithBundleIdentifier:(id)a3 enabled:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC11gamepolicyd26EmbeddedGameProcessMonitor *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = a4;
  v10 = self;
  sub_100020598(v6, v8, v9);

  swift_bridgeObjectRelease(v8);
}

- (_TtC11gamepolicyd26EmbeddedGameProcessMonitor)init
{
  _TtC11gamepolicyd26EmbeddedGameProcessMonitor *result;

  result = (_TtC11gamepolicyd26EmbeddedGameProcessMonitor *)_swift_stdlib_reportUnimplementedInitializer("gamepolicyd.EmbeddedGameProcessMonitor", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
