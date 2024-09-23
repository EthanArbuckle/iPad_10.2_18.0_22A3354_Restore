@implementation CRLBoardLibraryCommandController

- (NSString)undoActionName
{
  return (NSString *)sub_100BE7914(self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_undoStack);
}

- (NSString)redoActionName
{
  return (NSString *)sub_100BE7914(self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_redoStack);
}

- (BOOL)canUndo
{
  return sub_100BE7AB4((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_undoStack);
}

- (BOOL)canRedo
{
  return sub_100BE7AB4((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_redoStack);
}

- (void)undo
{
  _TtC8Freeform32CRLBoardLibraryCommandController *v2;

  v2 = self;
  sub_100BE80D4((SEL *)&selRef_canUndo, (uint64_t)&OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_undoStack, (uint64_t)&unk_101299508, (uint64_t)&unk_101408D98);

}

- (void)redo
{
  _TtC8Freeform32CRLBoardLibraryCommandController *v2;

  v2 = self;
  sub_100BE80D4((SEL *)&selRef_canRedo, (uint64_t)&OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_redoStack, (uint64_t)&unk_1012994E0, (uint64_t)&unk_101408D88);

}

- (_TtC8Freeform32CRLBoardLibraryCommandController)init
{
  _TtC8Freeform32CRLBoardLibraryCommandController *result;

  result = (_TtC8Freeform32CRLBoardLibraryCommandController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardLibraryCommandController", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100BE88D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_boardLibrary, (void (*)(_QWORD))&_swift_unknownObjectRelease, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_undoStack, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_redoStack);
}

@end
