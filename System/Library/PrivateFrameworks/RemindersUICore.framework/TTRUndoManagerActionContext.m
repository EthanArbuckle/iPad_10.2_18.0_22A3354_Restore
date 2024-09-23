@implementation TTRUndoManagerActionContext

- (TTRUndoManager)undoManagerOfLastRegisteredUndo
{
  return self->_undoManagerOfLastRegisteredUndo;
}

- (void)setUndoManagerOfLastRegisteredUndo:(id)a3
{
  objc_storeStrong((id *)&self->_undoManagerOfLastRegisteredUndo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManagerOfLastRegisteredUndo, 0);
}

@end
