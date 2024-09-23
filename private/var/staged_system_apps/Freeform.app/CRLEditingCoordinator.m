@implementation CRLEditingCoordinator

- (void)willProcessAuxiliaryRealTimeChanges
{
  _TtC8Freeform21CRLEditingCoordinator *v2;

  v2 = self;
  sub_1006FCB18();

}

- (void)didProcessAuxiliaryRealTimeChanges
{
  _TtC8Freeform21CRLEditingCoordinator *v2;

  v2 = self;
  sub_1006FCE9C();

}

- (_TtC8Freeform8CRLBoard)mainBoard
{
  return (_TtC8Freeform8CRLBoard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard));
}

- (_TtC8Freeform13CRLBoardActor)boardActor
{
  return (_TtC8Freeform13CRLBoardActor *)objc_autoreleaseReturnValue((id)swift_retain(*(Class *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardActor)));
}

- (_TtC8Freeform20CRLCommandController)commandController
{
  return (_TtC8Freeform20CRLCommandController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_commandController));
}

- (CRLUndoManager)undoManager
{
  return (CRLUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_undoManager));
}

- (CRLChangeNotifier)changeNotifier
{
  return (CRLChangeNotifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_changeNotifier));
}

- (_TtC8Freeform21CRLUIPropertyNotifier)uiPropertyNotifier
{
  return (_TtC8Freeform21CRLUIPropertyNotifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_uiPropertyNotifier));
}

- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory
{
  return (_TtC8Freeform19CRLBoardItemFactory *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardItemFactory));
}

- (void)setBoardItemFactory:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardItemFactory);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardItemFactory) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform22CRLSelectionDispatcher)selectionDispatcher
{
  return (_TtC8Freeform22CRLSelectionDispatcher *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_selectionDispatcher));
}

- (_TtC8Freeform32CRLCollaboratorCursorCoordinator)collaboratorCursorCoordinator
{
  return (_TtC8Freeform32CRLCollaboratorCursorCoordinator *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_collaboratorCursorCoordinator);
}

- (_TtC8Freeform20CRLFollowCoordinator)followCoordinator
{
  return (_TtC8Freeform20CRLFollowCoordinator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_followCoordinator));
}

- (BOOL)enableCollaboratorCursors
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC8Freeform21CRLEditingCoordinator *v5;
  _BOOL8 v7;

  KeyPath = swift_getKeyPath(&unk_100F078F0);
  v4 = swift_getKeyPath(&unk_100F07918);
  v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);
  swift_release(v4);
  swift_release(KeyPath);

  return v7;
}

- (void)setEnableCollaboratorCursors:(BOOL)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  _TtC8Freeform21CRLEditingCoordinator *v7;
  BOOL v8;

  KeyPath = swift_getKeyPath(&unk_100F078F0);
  v6 = swift_getKeyPath(&unk_100F07918);
  v8 = a3;
  v7 = self;
  static Published.subscript.setter(&v8, v7, KeyPath, v6);
  sub_100719404();

}

- (void)addShareObserver:(id)a3
{
  sub_10071A3A4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, id, uint64_t))sub_10071B6FC);
}

- (void)removeShareObserver:(id)a3
{
  sub_10071A3A4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, id, uint64_t))sub_10071B758);
}

- (void)canPerformUserActionUsingBlock:(id)a3
{
  void *v4;
  _TtC8Freeform21CRLEditingCoordinator *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10071BD98((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (BOOL)canPerformUserAction
{
  _TtC8Freeform21CRLEditingCoordinator *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_10071A498();

  return v3;
}

- (BOOL)isInRealTimeSyncSession
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = sub_1004B804C((uint64_t *)&unk_101405E90);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard)
     + OBJC_IVAR____TtC8Freeform8CRLBoard_realTimeSessionInfo;
  swift_beginAccess(v6, v10, 0, 0);
  sub_1004CB7BC((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_101405E90);
  v7 = type metadata accessor for CRLBoard.RealTimeSessionInfo(0);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_1004CB800((uint64_t)v5, (uint64_t *)&unk_101405E90);
  return (char)v6;
}

- (BOOL)realTimeSessionUsesEncryption
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_realTimeSessionUsesEncryption);
}

- (void)setRealTimeSessionUsesEncryption:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_realTimeSessionUsesEncryption) = a3;
}

- (BOOL)realTimeSessionNeedsAccountUpgrade
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_realTimeSessionNeedsAccountUpgrade);
}

- (void)setRealTimeSessionNeedsAccountUpgrade:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_realTimeSessionNeedsAccountUpgrade) = a3;
}

- (void)suspendCollaborationWithReason:(id)a3
{
  sub_10071A694((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_10066AAE4);
}

- (void)resumeCollaborationWithReason:(id)a3
{
  sub_10071A694((char *)self, (uint64_t)a2, (uint64_t)a3, sub_10066B1AC);
}

- (BOOL)areIncomingCollaborativeChangesSuspended
{
  return sub_10071A728() & 1;
}

- (void)willRedo
{
  _TtC8Freeform21CRLEditingCoordinator *v2;

  v2 = self;
  sub_10071A7A0();

}

- (void)shareStateUpdatedWithShare:(id)a3
{
  id v5;
  _TtC8Freeform21CRLEditingCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_10071A91C(a3);

}

- (void)currentUserLostEditPermissions
{
  _TtC8Freeform21CRLEditingCoordinator *v2;

  v2 = self;
  sub_10071ABDC();

}

- (void)currentUserGainedEditPermissions
{
  _TtC8Freeform21CRLEditingCoordinator *v2;

  v2 = self;
  sub_10071AC1C();

}

- (_TtC8Freeform21CRLEditingCoordinator)init
{
  _TtC8Freeform21CRLEditingCoordinator *result;

  result = (_TtC8Freeform21CRLEditingCoordinator *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLEditingCoordinator", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardActor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_collaboratorCursorCoordinator));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_suspendResumeCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator____lazy_storage___commandProvider));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator__enableCollaboratorCursors;
  v4 = sub_1004B804C(&qword_10140B9D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_crlaxAnyRemoteEditDidHappenCancellable, &qword_1013EE2F8);
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform21CRLEditingCoordinator *v9;
  _QWORD v10[4];

  v7 = type metadata accessor for CRLChangeRecord();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  swift_unknownObjectRetain(a4);
  v9 = self;
  _bridgeAnyObjectToAny(_:)(v10, a4);
  swift_unknownObjectRelease(a4);
  sub_10071B038(v8);

  swift_bridgeObjectRelease(v8);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v10);
}

- (id)boardForPasteboardController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard));
}

- (id)boardItemFactoryForPasteboardController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_boardItemFactory));
}

- (id)sourceContextForPasteboardController:(id)a3
{
  char *v3;
  objc_class *v4;
  char *v5;
  void *v6;
  char *v7;
  id v8;
  objc_super v10;

  v3 = *(char **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard)
                + OBJC_IVAR____TtC8Freeform8CRLBoard_store);
  v4 = (objc_class *)type metadata accessor for CRLPasteboardSourceContext();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Freeform26CRLPasteboardSourceContext__store] = v3;
  v6 = *(void **)&v3[OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_crdtContext];
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Freeform26CRLPasteboardSourceContext__sourceContext] = v6;
  v10.receiver = v5;
  v10.super_class = v4;
  v7 = v3;
  v8 = v6;
  return -[CRLEditingCoordinator init](&v10, "init");
}

@end
