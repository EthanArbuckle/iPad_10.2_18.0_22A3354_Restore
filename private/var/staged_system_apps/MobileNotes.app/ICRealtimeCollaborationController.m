@implementation ICRealtimeCollaborationController

+ (BOOL)isRealtimeCollaborationEnabled
{
  if (qword_1005CEBD8 != -1)
    swift_once(&qword_1005CEBD8, sub_10029384C);
  return byte_100601AB8;
}

+ (BOOL)isRealtimeCollaborationEnabledForNote:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = _s11MobileNotes31RealtimeCollaborationControllerC02iscD7Enabled3forSbSo6ICNoteC_tFZ_0(v3);

  return v4 & 1;
}

- (ICRealtimeCollaborationDelegate)delegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR___ICRealtimeCollaborationController_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___ICRealtimeCollaborationController_delegate, v4, 0, 0);
  return (ICRealtimeCollaborationDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR___ICRealtimeCollaborationController_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___ICRealtimeCollaborationController_delegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (BOOL)hasActiveSession
{
  _QWORD *v2;
  _BYTE v4[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICRealtimeCollaborationController_activeSession);
  swift_beginAccess((char *)self + OBJC_IVAR___ICRealtimeCollaborationController_activeSession, v4, 0, 0);
  return *v2 != 0;
}

- (NSString)currentNoteIdentifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  NSString v9;
  ICRealtimeCollaborationController *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v15[24];

  v3 = type metadata accessor for EditNoteActivity(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (char *)self + OBJC_IVAR___ICRealtimeCollaborationController_stateMachine;
  swift_beginAccess((char *)self + OBJC_IVAR___ICRealtimeCollaborationController_stateMachine, v15, 0, 0);
  v8 = type metadata accessor for FastSyncStateMachine(0);
  v9 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8))
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
    v10 = self;
    EditNoteActivity.noteID.getter(v10);
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
  }
  return (NSString *)v9;
}

- (ICRealtimeCollaborationController)initWithId:(int64_t)a3 cloudConfiguration:(id)a4 noteContext:(id)a5
{
  return (ICRealtimeCollaborationController *)RealtimeCollaborationController.init(id:cloudConfiguration:noteContext:)(a3, a4, a5);
}

- (void)dealloc
{
  uint64_t v2;
  objc_class *ObjectType;
  ICRealtimeCollaborationController *v5;
  objc_super v6;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICRealtimeCollaborationController_watchForContextChangesTask);
  if (v2)
  {
    ObjectType = (objc_class *)swift_getObjectType(self);
    v5 = self;
    swift_retain(v2);
    Task.cancel()();
    swift_release(v2);
    v6.receiver = v5;
    v6.super_class = ObjectType;
    -[ICRealtimeCollaborationController dealloc](&v6, "dealloc");
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{

  sub_1001FDCAC((uint64_t)self + OBJC_IVAR___ICRealtimeCollaborationController_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRealtimeCollaborationController_activeSession));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRealtimeCollaborationController_paperKitController));
  sub_100012DDC((uint64_t)self + OBJC_IVAR___ICRealtimeCollaborationController_stateMachine, &qword_1005D6C50);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___ICRealtimeCollaborationController_mergeableFieldStateCache));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRealtimeCollaborationController_messageController));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRealtimeCollaborationController_contextNotifications));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___ICRealtimeCollaborationController_watchForContextChangesTask));

}

- (void)updatePaperKitMessengerForAttachment:(id)a3 layoutManager:(id)a4
{
  sub_10029C2D4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))sub_10029A7C4, (void (*)(void))RealtimeCollaborationController.configurePaperKitAttachmentViewIfNecessary(_:));
}

- (void)removePaperKitMessengerForAttachmentIfNecessary:(id)a3 layoutManager:(id)a4
{
  sub_10029C2D4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))sub_10029A7C4, (void (*)(void))RealtimeCollaborationController.removePaperKitMessengerIfNecessary(for:));
}

- (void)setShowsCursors:(BOOL)a3 forPaperKitAttachment:(id)a4 layoutManager:(id)a5
{
  sub_10029C368(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id))sub_10029A7C4);
}

- (void)updatePaperKitMessengerForAttachment:(id)a3 textLayoutManager:(id)a4
{
  sub_10029C2D4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))sub_10029BB94, (void (*)(void))RealtimeCollaborationController.configurePaperKitAttachmentViewIfNecessary(_:));
}

- (void)removePaperKitMessengerForAttachmentIfNecessary:(id)a3 textLayoutManager:(id)a4
{
  sub_10029C2D4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))sub_10029BB94, (void (*)(void))RealtimeCollaborationController.removePaperKitMessengerIfNecessary(for:));
}

- (void)setShowsCursors:(BOOL)a3 forPaperKitAttachment:(id)a4 textLayoutManager:(id)a5
{
  sub_10029C368(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id))sub_10029BB94);
}

- (void)removePaperKitMessengerForViewIfNecessary:(id)a3
{
  id v4;
  ICRealtimeCollaborationController *v5;

  v4 = a3;
  v5 = self;
  RealtimeCollaborationController.removePaperKitMessengerIfNecessary(for:)((UIView)v4);

}

- (void)configurePaperKitAttachmentViewIfNecessary:(id)a3
{
  id v4;
  ICRealtimeCollaborationController *v5;

  v4 = a3;
  v5 = self;
  RealtimeCollaborationController.configurePaperKitAttachmentViewIfNecessary(_:)((UIView)v4);

}

- (NSString)description
{
  ICRealtimeCollaborationController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  RealtimeCollaborationController.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (ICRealtimeCollaborationController)init
{
  ICRealtimeCollaborationController *result;

  result = (ICRealtimeCollaborationController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.RealtimeCollaborationController", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
