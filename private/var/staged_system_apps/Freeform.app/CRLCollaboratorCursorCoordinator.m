@implementation CRLCollaboratorCursorCoordinator

- (_TtC8Freeform25CRLSelectionPathValidator)selectionPathValidator
{
  return (_TtC8Freeform25CRLSelectionPathValidator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator_selectionPathValidator));
}

- (_TtC8Freeform32CRLCollaboratorCursorCoordinator)initWithSelectionPathValidator:(id)a3
{
  id v3;
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *v4;

  v3 = a3;
  v4 = (_TtC8Freeform32CRLCollaboratorCursorCoordinator *)sub_100A0C054(v3);

  return v4;
}

- (BOOL)shouldShowCollaboratorCursors
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator_shouldShowCollaboratorCursors);
}

- (void)setShouldShowCollaboratorCursors:(BOOL)a3
{
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator_shouldShowCollaboratorCursors) = a3;
  v3 = self;
  sub_100A0972C();

}

- (void)registerCursorRenderer:(id)a3
{
  sub_100A0BEA0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100A09E88);
}

- (void)unregisterCursorRenderer:(id)a3
{
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  objc_msgSend(a3, "setCollaboratorCursorDelegate:", 0);
  objc_msgSend(*(id *)((char *)&v5->super.isa+ OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator__collaboratorCursorRenderers), "removeObject:", a3);
  swift_unknownObjectRelease(a3);

}

- (void)updateCursorInformationWithSelectionPath:(id)a3 collaboratorPresence:(id)a4
{
  id v7;
  id v8;
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_100A0A278(a3, v8);

}

- (void)updateCollaboratorOwnershipWithPresenceUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100A0A4C4((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)invalidateCursorWithCollaboratorPresence:(id)a3
{
  id v4;
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100A0AA4C(v4);

}

- (_TtC8Freeform32CRLCollaboratorCursorCoordinator)init
{
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *result;

  result = (_TtC8Freeform32CRLCollaboratorCursorCoordinator *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCollaboratorCursorCoordinator", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator_selectionPathValidator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator__collaboratorsToCursorsMap));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator__selectionCursorMap));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLCollaboratorCursorCoordinator__collaboratorCursorRenderers));
}

- (id)collaboratorCursorSelectionPathForRenderer:(id)a3 collaboratorPresence:(id)a4
{
  id v7;
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *v8;
  void *v9;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_100A0C138((uint64_t)v7);
  swift_unknownObjectRelease(a3);

  return v9;
}

- (void)willTeardownRenderer:(id)a3
{
  sub_100A0BEA0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100A0BD70);
}

- (void)dispatchSelectionPath:(id)a3 withFlags:(unint64_t)a4
{
  id v5;
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *v6;
  CKRecordID v7;
  Swift::String v8;

  v5 = a3;
  v6 = self;
  sub_100757E04(&_mh_execute_header, (uint64_t)"dispatchSelectionPath(_:withFlags:)", 35, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorCoordinator.swift", 102, 2, 186, "This should never be sent a real selection path", 47, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_100518FC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"This should never be sent a real selection path");
  sub_100519194((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"dispatchSelectionPath(_:withFlags:)", 35, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorCoordinator.swift", 102, 2u, 186, (uint64_t)"This should never be sent a real selection path", 47, 2u);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v7, v8);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Freeform/CRLAssert.swift", 24, 2, 348, 0);
  __break(1u);
}

- (BOOL)isPrimarySelectionPathReceiver
{
  return 0;
}

- (id)selectionStateSnapshot
{
  return 0;
}

- (void)validateSelectionStateUsing:(id)a3
{
  id v4;
  _TtC8Freeform32CRLCollaboratorCursorCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100A0C1D4();

}

@end
