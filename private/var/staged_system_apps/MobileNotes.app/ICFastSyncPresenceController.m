@implementation ICFastSyncPresenceController

- (ICFastSyncPresenceController)init
{
  ICFastSyncPresenceController *result;

  result = (ICFastSyncPresenceController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.FastSyncPresenceController", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___ICFastSyncPresenceController_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(_QWORD *)&self->noteContext[OBJC_IVAR___ICFastSyncPresenceController_verboseLoggingCategory]);
  sub_100012DDC((uint64_t)self + OBJC_IVAR___ICFastSyncPresenceController_controllerPool, &qword_1005D7C40);
  sub_100012DDC((uint64_t)self + OBJC_IVAR___ICFastSyncPresenceController_editorActivityChanges, &qword_1005D7D88);
  sub_100012DDC((uint64_t)self + OBJC_IVAR___ICFastSyncPresenceController_noteActivityShareChanges, &qword_1005D7D90);
}

- (void)realtimeCollaborationControllerSessionWillBegin:(id)a3
{
  id v4;
  ICFastSyncPresenceController *v5;

  v4 = a3;
  v5 = self;
  FastSyncPresenceController.realtimeCollaborationControllerSessionWillBegin(_:)(v4);

}

- (void)realtimeCollaborationControllerSessionDidBegin:(id)a3
{
  id v4;
  ICFastSyncPresenceController *v5;

  v4 = a3;
  v5 = self;
  FastSyncPresenceController.realtimeCollaborationControllerSessionDidBegin(_:)(v4);

}

- (void)realtimeCollaborationControllerSessionDidTerminate:(id)a3
{
  id v4;
  ICFastSyncPresenceController *v5;

  v4 = a3;
  v5 = self;
  FastSyncPresenceController.realtimeCollaborationControllerSessionDidTerminate(_:)(v4);

}

- (void)realtimeCollaborationControllerDidChangeSelectionState:(id)a3
{
  id v4;
  ICFastSyncPresenceController *v5;

  v4 = a3;
  v5 = self;
  FastSyncPresenceController.realtimeCollaborationControllerDidChangeSelectionState(_:)(v4);

}

@end
