@implementation ICRealtimeCollaborationSelectionController

- (ICNoteEditorViewController)editorController
{
  return (ICNoteEditorViewController *)(id)swift_unknownObjectUnownedLoadStrong((char *)self+ OBJC_IVAR___ICRealtimeCollaborationSelectionController_editorController);
}

- (ICRealtimeCollaborationController)realtimeCollaborationController
{
  return (ICRealtimeCollaborationController *)(id)swift_unknownObjectUnownedLoadStrong((char *)self+ OBJC_IVAR___ICRealtimeCollaborationSelectionController_realtimeCollaborationController);
}

- (ICRealtimeCollaborationSelectionController)initWithEditorController:(id)a3 realtimeCollaborationController:(id)a4
{
  return (ICRealtimeCollaborationSelectionController *)RealtimeCollaborationSelectionController.init(editorController:realtimeCollaborationController:)(a3, (char *)a4);
}

- (void)showSelectionForParticipant:(id)a3
{
  id v4;
  ICRealtimeCollaborationSelectionController *v5;

  v4 = a3;
  v5 = self;
  RealtimeCollaborationSelectionController.showSelection(for:)((CKShareParticipant)v4);

}

- (void)realtimeCollaborationControllerGroupActivityDidChange:(id)a3
{
  sub_10020B608(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_10020AEBC);
}

- (void)editorDidChangeSelection:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *Strong;
  ICRealtimeCollaborationSelectionController *v13;
  uint64_t v14;

  v5 = sub_100012E18(&qword_1005D4A98);
  __chkstk_darwin(v5);
  v7 = (uint64_t *)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for Notification(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong((char *)self+ OBJC_IVAR___ICRealtimeCollaborationSelectionController_realtimeCollaborationController);
  v13 = self;
  sub_100208D40(v7);
  RealtimeCollaborationController.postLocalSelection(_:asDelta:)((unint64_t)v7, 1);

  sub_100012DDC((uint64_t)v7, &qword_1005D4A98);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)textViewLayoutDidChange:(id)a3
{
  sub_10020B6B4(self, (uint64_t)a2, (uint64_t)a3, sub_10020A2B8);
}

- (void)tableScrollViewBoundsDidChange:(id)a3
{
  sub_10020B6B4(self, (uint64_t)a2, (uint64_t)a3, _s11MobileNotes40RealtimeCollaborationSelectionControllerC08realtimedf9DidChangeE5StateyyAA0cdF0CF_0);
}

- (void)noteDidPerformMerge:(id)a3
{
  sub_10020B608(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_10020B3EC);
}

- (void)tableAttachmentProviderDidMergeTable:(id)a3
{
  sub_10020B6B4(self, (uint64_t)a2, (uint64_t)a3, _s11MobileNotes40RealtimeCollaborationSelectionControllerC08realtimedf9DidChangeE5StateyyAA0cdF0CF_0);
}

- (ICRealtimeCollaborationSelectionController)init
{
  ICRealtimeCollaborationSelectionController *result;

  result = (ICRealtimeCollaborationSelectionController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.RealtimeCollaborationSelectionController", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  char *v4;
  uint64_t v5;

  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR___ICRealtimeCollaborationSelectionController_editorController, a2);
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR___ICRealtimeCollaborationSelectionController_realtimeCollaborationController, v3);
  v4 = (char *)self + OBJC_IVAR___ICRealtimeCollaborationSelectionController__groupSession;
  v5 = sub_100012E18(&qword_1005D4A18);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___ICRealtimeCollaborationSelectionController_activeParticipantsObservation));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___ICRealtimeCollaborationSelectionController_activeParticipants));
}

- (void)realtimeCollaborationControllerDidChangeSelectionState:(id)a3
{
  id v4;
  ICRealtimeCollaborationSelectionController *v5;

  v4 = a3;
  v5 = self;
  _s11MobileNotes40RealtimeCollaborationSelectionControllerC08realtimedf9DidChangeE5StateyyAA0cdF0CF_0();

}

@end
