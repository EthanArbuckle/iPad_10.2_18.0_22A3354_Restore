@implementation PKCoherenceUndoCommand

- (void)applyToDrawing:(id)a3
{
  @objc PKCoherenceUndoCommand.apply(to:)(self, (uint64_t)a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CD1100], (void (*)(void *))MEMORY[0x1E0CD10D0], (void (*)(char *))PKCoherenceUndoCommand.apply(to:));
}

- (id)applyToDrawingReturnInverted:(id)a3
{
  return @objc PKCoherenceUndoCommand.apply(toDrawingReturnInverted:)(self, (uint64_t)a2, a3, (uint64_t (*)(char *))PKCoherenceUndoCommand.apply(toDrawingReturnInverted:));
}

- (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4
{
  _TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand *result;

  swift_unknownObjectRetain();
  result = (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 changesVisibleStrokes:(BOOL)a5
{
  _TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand *result;

  swift_unknownObjectRetain();
  result = (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand)init
{
  _TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand *result;

  result = (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  @objc PKDrawingCoherenceVersion.__ivar_destroyer((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand_undo, (uint64_t (*)(_QWORD))MEMORY[0x1E0D12468]);
}

@end
