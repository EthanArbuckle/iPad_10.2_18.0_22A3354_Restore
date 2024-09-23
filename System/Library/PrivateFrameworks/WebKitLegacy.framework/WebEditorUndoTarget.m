@implementation WebEditorUndoTarget

- (void)undoEditing:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "step");
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
}

- (void)redoEditing:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "step");
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
}

@end
